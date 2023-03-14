package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMasterId._
import mycpu.csr.CsrFile

class CoreState()(implicit val p: Parameters) extends MyBundle{
    val intRegState = new RegFileState
    val instState = new InstState
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
    val ife = Module(new Fetch)
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
    wb.io.ramData := mem.io.ramData
    wb.io.ramDataValid := mem.io.ramDataValid


    // pipeline control
    val pipelineCtrl = Module(new PipelineCtrl)
    pipelineCtrl.io.in.excpValid := mem.io.excp.valid
    pipelineCtrl.io.in.brTaken := exe.io.out.fetch.bits.brTaken
    ife.io.ctrl <> pipelineCtrl.io.out.fetch
    dec.io.ctrl <> pipelineCtrl.io.out.decode
    exe.io.ctrl <> pipelineCtrl.io.out.execute
    mem.io.ctrl <> pipelineCtrl.io.out.memory
    wb.io.ctrl <> pipelineCtrl.io.out.writeback

    // hazard detction
    val hazardU = Module(new HazardUnit)
    hazardU.io.in.decode <> dec.io.hazard.out
    hazardU.io.in.execute <> exe.io.hazard.out
    hazardU.io.in.memory <> mem.io.hazard
    hazardU.io.in.writeback <> wb.io.hazard
    hazardU.io.out.execute <> exe.io.hazard.in
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
    io.out.state.instState <> RegNext(wb.io.instState)
    io.out.state.intRegState <> regFile.io.state.getOrElse(DontCare)

    // ----------------soc part(temp)-------------------------
    val busCrossBar = Module(new BusCrossBar())
    busCrossBar.io <> DontCare

    busCrossBar.io.masterFace.in(0) <> ife.io.rom.req
    ife.io.rom.resp <> busCrossBar.io.masterFace.out(0)

    busCrossBar.io.masterFace.in(1) <> mem.io.ram.req
    mem.io.ram.resp <> busCrossBar.io.masterFace.out(1)


    val rom = Module(new ROM())
    rom.io.clock := clock
    rom.io.reset := reset

    val romReq = busCrossBar.io.slaveFace.in(0)
    val romResp = busCrossBar.io.slaveFace.out(0)

    rom.io.wen := romReq.valid && isPut(romReq.bits.opcode) 
    rom.io.wmask := "b1111".U
    rom.io.wdata := romReq.bits.data
    rom.io.waddr := romReq.bits.address
    rom.io.raddr := romReq.bits.address // read
    romReq.ready := true.B
    romResp.bits.data := rom.io.rdata
    val mCounter = Counter(true.B, 10)
    romResp.valid := mCounter._1 < 7.U // true.B
    romResp.bits.source := romReq.bits.source



    val ram = Module(new ROM())
    ram.io.clock := clock
    ram.io.reset := reset

    val ramReq = busCrossBar.io.slaveFace.in(1)
    val ramResp = busCrossBar.io.slaveFace.out(1)
    
    ram.io.wen := ramReq.valid && isPut(ramReq.bits.opcode) 
    ram.io.wmask := ramReq.bits.mask
    ram.io.wdata := ramReq.bits.data
    ram.io.waddr := ramReq.bits.address - memRamBegin.U
    ram.io.raddr := ramReq.bits.address - memRamBegin.U 
    ramReq.ready := true.B
    ramResp.bits.data := ram.io.rdata
    val mCounter2 = Counter(true.B,12) 
    ramResp.valid := mCounter2._1 > 4.U // true.B
    ramResp.bits.source := ramReq.bits.source
    
}

object CoreGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = true
        )
    })

    println("Generating the Core hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Core()(defaultConfig), Array("--target-dir", "build"))
}
