package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import chisel3.util.experimental.BoringUtils

import mycpu.BusReq._
import mycpu.csr.CsrFile
import chisel3.util.random.LFSR

class RegFileState()(implicit val p: Parameters) extends MyBundle{
    val regState = Vec(rfSets, UInt(xlen.W))
}

class InstState()(implicit val p: Parameters) extends MyBundle{
    val commit = Bool()
    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class CsrFileState()(implicit val p: Parameters) extends MyBundle{
    val mcycle = UInt(32.W)
    val mcycleh = UInt(32.W)
}

class CoreState()(implicit val p: Parameters) extends MyBundle{
    val intRegState = new RegFileState
    val instState = new InstState
    val csrState = new CsrFileState
}

class CoreIO()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
                val start = Input(Bool())
            }
    val out = new Bundle{
                val state = Output(new CoreState)
            }
}

class Core()(implicit val p: Parameters) extends MyModule{
    val io = IO(new CoreIO)

    val stallDec = Wire(Bool())

    val trapVec = Wire(UInt(xlen.W))
    val mepc = Wire(UInt(xlen.W))

    // 1_fetch stage
    // val ife = Module(new Fetch)
    val ife = Module(new Fetch_1)
    ife.io.in.start := RegNext(io.in.start)
    ife.io.ctrl <> DontCare
    ife.io.trapVec := trapVec
    ife.io.mepc := mepc
    // ife.io.excpValid <> excpValid

    // 2_decode stage
    val dec = Module(new Decode)
    dec.io.in <> ife.io.out
    dec.io.hazard.in.stall := stallDec

    // 3_execute stage
    val exe = Module(new Execute)
    exe.io.in <> dec.io.out
    ife.io.in.execute <> exe.io.out.fetch

    // 4_memory stage
    val mem = Module(new Mem)
    mem.io.in <> exe.io.out.memory

    ife.io.excp <> mem.io.excp

    // 5_writeback stage
    val wb = Module(new WriteBack)
    wb.io.in <> mem.io.out
    wb.io.lsuData := mem.io.lsuData
    wb.io.lsuOK := mem.io.lsuOK


    // pipeline control
    val pipelineCtrl = Module(new PipelineCtrl)
    pipelineCtrl.io.in.excpValid := mem.io.excp.valid
    pipelineCtrl.io.in.brTaken   := exe.io.out.fetch.bits.brTaken
    ife.io.ctrl <> pipelineCtrl.io.out.fetch
    dec.io.ctrl <> pipelineCtrl.io.out.decode
    exe.io.ctrl <> pipelineCtrl.io.out.execute
    mem.io.ctrl <> pipelineCtrl.io.out.memory
    wb.io.ctrl  <> pipelineCtrl.io.out.writeback

    // hazard detction
    val hazardU = Module(new HazardUnit)
    hazardU.io.in.decode    <> dec.io.hazard.out
    hazardU.io.in.execute   <> exe.io.hazard.out
    hazardU.io.in.memory    <> mem.io.hazard
    hazardU.io.in.writeback <> wb.io.hazard
    hazardU.io.out.execute  <> exe.io.hazard.in
    stallDec := hazardU.io.out.decode.stall


    val regFile = Module(new RegFile(UInt(xlen.W)))
    regFile.io.r(0).en := true.B
    regFile.io.r(1).en := true.B
    regFile.io.r(0).addr := dec.io.regfile.rs1
    regFile.io.r(1).addr := dec.io.regfile.rs2
    dec.io.regfile.rdata1 := regFile.io.r(0).data
    dec.io.regfile.rdata2 := regFile.io.r(1).data
    regFile.io.w(0).en := wb.io.regfile.regWrEn
    regFile.io.w(0).addr := wb.io.regfile.rd
    regFile.io.w(0).data := wb.io.regfile.regWrData


    val csrFile = Module(new CsrFile())
    dontTouch(csrFile.io)
    csrFile.io.except <> mem.io.excp
    csrFile.io.read <> exe.io.csrRead
    csrFile.io.write <> wb.io.csrWrite
    mem.io.csrBusy := csrFile.io.busy
    mem.io.csrMode := csrFile.io.mode
    trapVec := csrFile.io.trapVec
    mepc := csrFile.io.mepc
    

    // core runtime instruction info and reg info
    val regState = WireInit(0.U.asTypeOf(new RegFileState))
    BoringUtils.addSink(regState, "regState")

    val csrState = WireInit(0.U.asTypeOf(new CsrFileState))
    BoringUtils.addSink(csrState, "csrState")

    io.out.state.instState <> RegNext(wb.io.instState)
    io.out.state.intRegState <> regState  //regFile.io.state.getOrElse(DontCare)
    io.out.state.csrState <> csrState



    // ----------------soc part(temp)-------------------------
    val testCase =  3

if( testCase == 0 ) {
    
    // val busCrossBar = Module(new BusCrossBar())
    // busCrossBar.io <> DontCare

    // busCrossBar.io.masterFace.in(0) <> ife.io.rom.req
    // ife.io.rom.resp <> busCrossBar.io.masterFace.out(0)

    // busCrossBar.io.masterFace.in(1) <> mem.io.ram.req
    // mem.io.ram.resp <> busCrossBar.io.masterFace.out(1)


    // val rom = Module(new ROM())
    // rom.io.clock := clock
    // rom.io.reset := reset

    // val romReq = busCrossBar.io.slaveFace.in(0)
    // val romResp = busCrossBar.io.slaveFace.out(0)
    
    // rom.io.wen := romReq.fire && isPut(romReq.bits.opcode)
    // rom.io.wmask := "b1111".U
    // rom.io.wdata := romReq.bits.data
    // rom.io.waddr := romReq.bits.address
    // rom.io.raddr := romReq.bits.address // read
    // romReq.ready := true.B
    // romResp.bits.data := rom.io.rdata
    // romResp.valid :=  true.B
    // romResp.bits.source := romReq.bits.source


    // val ram = Module(new ROM())
    // ram.io.clock := clock
    // ram.io.reset := reset

    // val ramReq = busCrossBar.io.slaveFace.in(1)
    // val ramResp = busCrossBar.io.slaveFace.out(1)
    // val ramReqReg = RegEnable(ramReq.bits, ramReq.fire)
    // val ramReqVal = Mux(ramReq.fire, ramReq.bits, ramReqReg)
    // ram.io.wen := ramReq.fire && isPut(ramReqVal.opcode)
    // ram.io.wmask := ramReqVal.mask
    // ram.io.wdata := ramReqVal.data
    // ram.io.waddr := ramReqVal.address - memRamBegin.U
    // ram.io.raddr := ramReqVal.address - memRamBegin.U 
    // ramReq.ready := true.B
    // ramResp.bits.data := ram.io.rdata
    // ramResp.valid := true.B
    // ramResp.bits.source := ramReqVal.source

} else if(testCase == 1) {
    // val xbar = Module(new TLXbar())
    // xbar.io <> DontCare

    // // ife.io.tlbus <> DontCare
    // xbar.io.masterFace.in(0) <> ife.io.rom.req
    // ife.io.rom.resp <> xbar.io.masterFace.out(0)


    // // mem.io.tlbus <> DontCare
    // xbar.io.masterFace.in(1) <> mem.io.ram.req
    // mem.io.ram.resp <> xbar.io.masterFace.out(1)

    // val rom = Module(new ROM())
    // rom.io.clock := clock
    // rom.io.reset := reset

    // val romReq = xbar.io.slaveFace.in(0)
    // val romResp = xbar.io.slaveFace.out(0)

    // val romReqReg = RegEnable(romReq.bits, romReq.fire)
    // val romReqVal = Mux(romReq.fire, romReq.bits, romReqReg)
    // val romBusy = RegEnable(true.B, false.B, romReq.fire)

    // when(romResp.fire) {
    //     romBusy := false.B
    // }

    // rom.io.wen   := romReq.fire && isPut(romReqVal.opcode)
    // rom.io.wmask := "b1111".U
    // rom.io.wdata := romReqVal.data
    // rom.io.waddr := romReqVal.address
    // rom.io.raddr := romReqVal.address 
    // romReq.ready := !romBusy
    // romResp.bits.data := rom.io.rdata
    // romResp.valid := romBusy 
    // romResp.bits.source := romReqVal.source

    
    // // romReq.ready := LFSR(8)(5) // ramdom delay test
    
    // // val mCounter = Counter(true.B, 30)
    // // romReq.ready := mCounter._1 > 10.U

    // val ram = Module(new ROM())
    // ram.io.clock := clock
    // ram.io.reset := reset

    // val ramReq = xbar.io.slaveFace.in(1)
    // val ramResp = xbar.io.slaveFace.out(1)
    
    // val ramReqReg = RegEnable(ramReq.bits, ramReq.fire)
    // val ramReqVal = Mux(ramReq.fire, ramReq.bits, ramReqReg)
    // val ramBusy = RegEnable(true.B, false.B, ramReq.fire)
    // when(ramResp.fire) {
    //     ramBusy := false.B
    // }

    // ram.io.wen := ramReq.fire && isPut(ramReqVal.opcode)
    // ram.io.wmask := ramReqVal.mask
    // ram.io.wdata := ramReqVal.data
    // ram.io.waddr := ramReqVal.address - memRamBegin.U
    // ram.io.raddr := ramReqVal.address - memRamBegin.U 
    // ramReq.ready := !ramBusy 
    // ramResp.bits.data := ram.io.rdata
    // ramResp.valid := ramBusy 
    // ramResp.bits.source := ramReqVal.source 

    // // ramReq.ready := LFSR(8)(0) // ramdom delay test

    // // val mCounter1 = Counter(true.B, 30)
    // // ramReq.ready := mCounter1._1 > 25.U
} else if (testCase == 2) {
    // val busCrossBar = Module(new TLXbar_1()) // with PingPongBuf
    // busCrossBar.io <> DontCare

    // busCrossBar.io.masterFace.in(0) <> ife.io.rom.req
    // ife.io.rom.resp <> busCrossBar.io.masterFace.out(0)

    // busCrossBar.io.masterFace.in(1) <> mem.io.ram.req
    // mem.io.ram.resp <> busCrossBar.io.masterFace.out(1)

    // val rom = Module(new ROM())
    // rom.io.clock := clock
    // rom.io.reset := reset

    // val romReq = busCrossBar.io.slaveFace.in(0)
    // val romResp = busCrossBar.io.slaveFace.out(0)

    // val romReqReg = RegEnable(romReq.bits, romReq.fire)
    // val romReqVal = Mux(romReq.fire, romReq.bits, romReqReg)
    // val romBusy = RegEnable(true.B, false.B, romReq.fire)

    // when(romResp.fire) {
    //     romBusy := false.B
    // }

    // rom.io.wen   := romReq.fire && isPut(romReqVal.opcode)
    // rom.io.wmask := "b1111".U
    // rom.io.wdata := romReqVal.data
    // rom.io.waddr := romReqVal.address
    // rom.io.raddr := romReqVal.address 
    // romReq.ready := !romBusy
    // romResp.bits.data := rom.io.rdata
    // romResp.valid := romBusy 
    // romResp.bits.source := romReqVal.source



    // val ram = Module(new ROM())
    // ram.io.clock := clock
    // ram.io.reset := reset

    // val ramReq = busCrossBar.io.slaveFace.in(1)
    // val ramResp = busCrossBar.io.slaveFace.out(1)
    
    // val ramReqReg = RegEnable(ramReq.bits, ramReq.fire)
    // val ramReqVal = Mux(ramReq.fire, ramReq.bits, ramReqReg)
    // val ramBusy = RegEnable(true.B, false.B, ramReq.fire)
    // when(ramResp.fire) {
    //     ramBusy := false.B
    // }

    // ram.io.wen := ramReq.fire && isPut(ramReqVal.opcode)
    // ram.io.wmask := ramReqVal.mask
    // ram.io.wdata := ramReqVal.data
    // ram.io.waddr := ramReqVal.address - memRamBegin.U
    // ram.io.raddr := ramReqVal.address - memRamBegin.U 
    // ramReq.ready := !ramBusy 
    // ramResp.bits.data := ram.io.rdata
    // ramResp.valid := ramBusy 
    // ramResp.bits.source := ramReqVal.source 
} else if( testCase == 3) {
    val xbar = Module(new TLXbar)
    val rom = Module(new SingleROM)
    val ram = Module(new SingleRAM)
    ram.io <> DontCare

    // Master
    ife.io.tlbus.req <> xbar.io.masterFace.in(0)
    ife.io.tlbus.resp <> xbar.io.masterFace.out(0)

    mem.io.tlbus.req <> xbar.io.masterFace.in(1)
    mem.io.tlbus.resp <> xbar.io.masterFace.out(1)


    // Slave
    rom.io.req <> xbar.io.slaveFace.in(0)
    rom.io.resp <> xbar.io.slaveFace.out(0)

    xbar.io.slaveFace.in(1) <> DontCare
    xbar.io.slaveFace.out(1) <> DontCare
    // ram.io.req <> xbar.io.slaveFace.in(1)
    // ram.io.resp <> xbar.io.slaveFace.out(1)
}


}

object CoreGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true,
            busBeatSize = 16,
            logEnable = false,
        )
    })

    println("Generating the Core hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Core()(defaultConfig), Array("--target-dir", "build"))
}
