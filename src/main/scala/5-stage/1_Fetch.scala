package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMaster._
import mycpu.csr.ExceptionIO

class FetchOut()(implicit val p: Parameters) extends MyBundle{
    val pcNext4 = UInt(xlen.W) // for Decode stage
    val instState = new InstState
}

// class FetchIO()(implicit val p: Parameters) extends MyBundle{
//     val in = new Bundle{
//         val start = Input(Bool())
//         val execute = Flipped(DecoupledIO(new Execute2Fetch))
//     }
//     val out = DecoupledIO(new FetchOut)
//     val ctrl = Input(new PipelineCtrlBundle)
    
//     val rom = new TLMasterBusUL

//     val trapVec = Input(UInt(xlen.W))
//     val mepc = Input(UInt(xlen.W))
//     val excp = Flipped(ValidIO(new ExceptionIO))
// }

// class Fetch()(implicit val p: Parameters) extends MyModule{
//     val io = IO(new FetchIO)

//     val pcReg           = RegInit(resetPc.U(xlen.W))
//     val pc              = Wire(UInt(xlen.W))
//     val pcNext          = Wire(UInt(xlen.W))
//     val pcNext4         = pcReg + (ilen / 8).U

//     val branchAddr_1 = Mux(io.excp.valid, 
//                     Mux(io.excp.bits.isMret, 
//                         io.mepc, 
//                         io.trapVec
//                     ), 
//                     Mux(io.in.execute.bits.brTaken, 
//                         io.in.execute.bits.targetAddr, 
//                         pcReg
//                     )
//                 )

//     val instValid = WireInit(false.B)
//     val branchStall = WireInit(false.B)

//     val hasBranch_1 = io.excp.valid || io.in.execute.bits.brTaken
//     val hasBranch = Mux(hasBranch_1, true.B, RSLatch(hasBranch_1, io.out.fire))
//     val branchAddr = Mux(hasBranch_1, branchAddr_1, RegEnable(branchAddr_1, hasBranch_1))
//     dontTouch(hasBranch)

//     pcNext := Mux(hasBranch, branchAddr, pcNext4)
    
//     val stall = io.ctrl.stall || !io.in.start || !io.rom.req.ready || !instValid || !RegNext(io.in.start)
//     val flush = io.ctrl.flush

//     // for pipeline stage, if one stage stall then all of the stage in front of the stall stage will stall too.
//     io.in.execute.ready := !stall && io.in.execute.valid


//     val inst            = WireInit(0.U(ilen.W))
//     // val commit          = !stall && io.out.ready && !hasBranch
//     val commit          = !stall && !hasBranch

//     instValid := Mux(io.rom.resp.fire, 
//                     true.B, 
//                     RSLatch(io.rom.resp.fire, io.rom.req.fire)
//                 )

//     val firstFire    = RegEnable(false.B, true.B, io.rom.req.fire)

//     val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && io.out.fire)
//     dontTouch(preFetchInst)

//     io.rom                  <> DontCare
//     io.rom.req.bits         <> DontCare
//     io.rom.req.valid        := ~flush && io.in.start && io.rom.req.ready && preFetchInst
//     io.rom.req.bits.address := pc
//     io.rom.req.bits.opcode  := Get
//     io.rom.req.bits.size    := (ilen / 8).U
//     io.rom.req.bits.source  := MASTER_0
//     io.rom.resp.bits        <> DontCare
//     io.rom.resp.ready       :=  true.B // always enable receive inst data
//     inst                    := Mux(io.rom.resp.fire, 
//                                     io.rom.resp.bits.data, 
//                                     RegEnable(io.rom.resp.bits.data, io.rom.resp.fire)
//                                 )


//     val updatePC = io.out.fire
//     pc     := Mux(updatePC, pcNext, pcReg)
//     when(updatePC) { pcReg := pcNext }
//     dontTouch(updatePC)

//     io.out.bits.pcNext4          := pcNext4
//     io.out.bits.instState.commit := commit
//     io.out.bits.instState.pc     := pcReg
//     io.out.bits.instState.inst   := Mux(commit, inst , "h00000013".U)

//     when(!commit) {
//         io.out.bits <> DontCare
//         io.out.bits.instState <> DontCare
//     }

//     io.out.valid := !stall
// }

class FetchIO_1()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
        val start = Input(Bool())
        val execute = Flipped(DecoupledIO(new Execute2Fetch))
    }
    val out = DecoupledIO(new FetchOut)
    val ctrl = Input(new PipelineCtrlBundle)
    
    // val rom = new TLMasterBusUL
    val tlbus = new TLMasterBusUL

    val trapVec = Input(UInt(xlen.W))
    val mepc = Input(UInt(xlen.W))
    val excp = Flipped(ValidIO(new ExceptionIO))
}

// class Fetch_1()(implicit val p: Parameters) extends MyModule{
//     val io = IO(new FetchIO_1)

//     val pcReg           = RegInit(resetPc.U(xlen.W))
//     val pcNext          = Wire(UInt(xlen.W))
//     val pcNext4         = pcReg + (ilen / 8).U

//     val branchAddr_1 = Mux(io.excp.valid, 
//                     Mux(io.excp.bits.isMret, 
//                         io.mepc, 
//                         io.trapVec
//                     ), 
//                     Mux(io.in.execute.bits.brTaken, 
//                         io.in.execute.bits.targetAddr, 
//                         pcReg
//                     )
//                 )
//     val icache = Module(new ICache()(p.alterPartial(
//         {
//             case MyCpuParamsKey => MyCpuParameters(
//                 dcacheSets = 32,
//                 dcacheWays = 4,
//                 dcacheBlockSize = 8
//             )
//         }
//     )))

//     val instValid = WireInit(false.B)

//     val hasBranch_1 = io.excp.valid || io.in.execute.bits.brTaken
//     // val hasBranch = Mux(hasBranch_1, true.B, RSLatch(hasBranch_1, io.out.fire))
//     val hasBranch = Hold(true.B, hasBranch_1, io.out.fire || !io.in.start)
//     val branchAddr = Hold(branchAddr_1, hasBranch_1, !io.in.start) // Mux(hasBranch_1, branchAddr_1, RegEnable(branchAddr_1, hasBranch_1))
//     dontTouch(hasBranch)

//     pcNext := Mux(hasBranch, branchAddr, pcNext4)
    
//     val stall = io.ctrl.stall
//     val flush = io.ctrl.flush

//     io.in.execute.ready := !stall && io.in.execute.valid


//     val inst            = WireInit(0.U(ilen.W))
//     val commit          = !stall && io.out.ready && !hasBranch

//     instValid := Mux(icache.io.read.resp.fire, 
//                     true.B, 
//                     RSLatch(icache.io.read.resp.fire, io.out.fire)
//                 )
//     // instValid := Hold(true.B, icache.io.read.resp.fire, io.out.fire)

//     val firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
//     val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && io.out.fire)
//     icache.io.read <> DontCare
//     icache.io.write <> DontCare
//     icache.io.tlbus <> io.tlbus
//     icache.io.read.req.valid := !flush && io.in.start && preFetchInst
//     icache.io.read.req.bits.addr := Mux(io.out.fire, pcNext, pcReg)
//     icache.io.read.resp.ready := true.B
//     inst := Mux(icache.io.read.resp.fire, icache.io.read.resp.bits.data, RegEnable(icache.io.read.resp.bits.data, icache.io.read.resp.fire))

//     when(io.out.fire) { pcReg := pcNext }

//     io.out.bits.pcNext4          := pcNext4
//     io.out.bits.instState.commit := commit
//     io.out.bits.instState.pc     := pcReg
//     io.out.bits.instState.inst   := Mux(commit, inst , "h00000013".U)

//     when(!commit) {
//         io.out.bits <> DontCare
//         io.out.bits.instState <> DontCare
//     }

//     io.out.valid := !stall && io.in.start && icache.io.read.req.ready && RegNext(instValid)
// }

class Fetch_1()(implicit val p: Parameters) extends MyModule{
    val io = IO(new FetchIO_1)

    val pcReg           = RegInit(resetPc.U(xlen.W))
    val pcNext          = Wire(UInt(xlen.W))
    val pcNext4         = pcReg + (ilen / 8).U

    val branchAddr_1 = Mux(io.excp.valid, 
                    Mux(io.excp.bits.isMret, 
                        io.mepc, 
                        io.trapVec
                    ), 
                    Mux(io.in.execute.bits.brTaken, 
                        io.in.execute.bits.targetAddr, 
                        pcReg
                    )
                )
    val icache = Module(new ICache()(p.alterPartial(
        {
            case MyCpuParamsKey => MyCpuParameters(
                dcacheSets = 128,
                dcacheWays = 4,
                dcacheBlockSize = 8
            )
        }
    )))

    val hasBranch_1 = io.excp.valid || io.in.execute.bits.brTaken
    val hasBranch = Hold(true.B, hasBranch_1, io.out.fire || !io.in.start)
    val branchAddr = Hold(branchAddr_1, hasBranch_1, !io.in.start)
    dontTouch(hasBranch)

    pcNext := Mux(hasBranch, branchAddr, pcNext4)
    
    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.execute.ready := !stall && io.in.execute.valid


    val commit          = !stall && io.out.ready && !hasBranch

    val lastInstValid = Hold(true.B, icache.io.read.resp.fire, io.out.fire)
    dontTouch(lastInstValid)

    val firstFire    = RegEnable(false.B, true.B, icache.io.read.req.fire)
    val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && io.out.fire)
    icache.io.read <> DontCare
    icache.io.write <> DontCare
    icache.io.tlbus <> io.tlbus
    icache.io.read.req.valid := !flush && io.in.start && preFetchInst
    icache.io.read.req.bits.addr := Mux(io.out.fire, pcNext, pcReg)
    icache.io.read.resp.ready := true.B
    val inst = Mux(icache.io.read.resp.fire, 
                    icache.io.read.resp.bits.data, 
                    RegEnable(icache.io.read.resp.bits.data, icache.io.read.resp.fire)
                )

    when(io.out.fire) { pcReg := pcNext }

    io.out.bits.pcNext4          := pcNext4
    io.out.bits.instState.commit := commit
    io.out.bits.instState.pc     := pcReg
    io.out.bits.instState.inst   := Mux(commit, inst , "h00000013".U)

    when(!commit) {
        io.out.bits <> DontCare
        io.out.bits.instState <> DontCare
    }

    io.out.valid := !stall && io.in.start && icache.io.read.req.ready && lastInstValid
}

object FetchGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Fetch hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Fetch_1()(defaultConfig), Array("--target-dir", "build"))
}
