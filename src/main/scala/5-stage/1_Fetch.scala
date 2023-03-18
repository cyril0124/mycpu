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

class FetchIO()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
        val start = Input(Bool())
        val execute = Flipped(DecoupledIO(new Execute2Fetch))
    }
    val out = DecoupledIO(new FetchOut)
    val ctrl = Input(new PipelineCtrlBundle)
    
    val rom = new TLMasterBusUL

    val trapVec = Input(UInt(xlen.W))
    val mepc = Input(UInt(xlen.W))
    val excp = Flipped(ValidIO(new ExceptionIO))
}

// IFU
class Fetch()(implicit val p: Parameters) extends MyModule{
    val io = IO(new FetchIO)

    val pcReg           = RegInit(resetPc.U(xlen.W))
    val pc              = Wire(UInt(xlen.W))
    val pcNext          = Wire(UInt(xlen.W))
    val pcNext4         = pcReg + (ilen / 8).U

    val instValid = WireInit(false.B)
    val instValidReg = RegInit(false.B)

    val branchStall = WireInit(false.B)
    
    dontTouch(instValid)
    // val stall = io.ctrl.stall || !io.in.start || !io.rom.req.ready || !instValid || branchStall
    val stall = io.ctrl.stall || !io.in.start || !io.rom.req.ready || !instValid 
    val flush = io.ctrl.flush

    // for pipeline stage, if one stage stall then all of the stage in front of the stall stage will stall too.
    io.in.execute.ready := !stall


    val inst            = WireInit(0.U(ilen.W))
    val commit          = !stall && io.out.ready
    
    // val instMem = Module(new ROM()) 
    // instMem.io <> DontCare
    // instMem.io.clock := clock
    // instMem.io.reset := reset
    // instMem.io.raddr := pc 
    // // instMem.io.raddr := pcReg 
    // inst := instMem.io.rdata

    // val instCounter = RegInit(0.U(2.W))
    // when(io.rom.resp.fire) { instCounter := instCounter + 1.U }
    // when(io.out.fire ) { instCounter := 0.U }
    // val hasBranch = io.excp.valid || io.in.execute.bits.brTaken
    // val hasBranchReg = RegEnable(true.B, false.B, hasBranch)
    // val branchInstValid = RegEnable(true.B, false.B, instCounter === 1.U && io.rom.resp.fire)
    // when(io.out.fire) { 
    //     branchInstValid := false.B
    //     hasBranchReg := false.B 
    // }
    // when(instCounter === 2.U) { hasBranchReg := false.B }
    // val pcNextReg = RegInit(pcNext4)
    // when(hasBranch) { pcNextReg := pcNext }.otherwise{ pcNextReg := pcNext4}
    // val pcNext2 = Mux(hasBranch, pcNext, pcNextReg)
    // branchStall := hasBranchReg && !branchInstValid
    // MultiDontTouch(pcNext2, hasBranch, branchInstValid, hasBranchReg, branchStall)
    
    when(io.rom.resp.fire) { instValidReg := true.B}
    when(io.rom.req.fire) { instValidReg := false.B}
    instValid := Mux(io.rom.resp.fire, 
                    true.B, 
                    instValidReg
                )

    val firstFire    = RegEnable(false.B, true.B, io.rom.req.fire)

    // val branchFire = (!firstFire && hasBranch)
    // dontTouch(branchFire)
    val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && io.out.fire)
    // val preFetchInst = (firstFire && pcReg === resetPc.U) || (!firstFire && io.out.fire) || branchFire
    dontTouch(preFetchInst)

    io.rom                  <> DontCare
    io.rom.req.bits         <> DontCare
    io.rom.req.valid        := ~flush && io.in.start && io.rom.req.ready && preFetchInst
    io.rom.req.bits.address := pc
    io.rom.req.bits.opcode  := Get
    io.rom.req.bits.source  := MASTER_0
    io.rom.resp.bits        <> DontCare
    io.rom.resp.ready       :=  true.B // always enable receive inst data
    inst                    := Mux(io.rom.resp.fire, 
                                    io.rom.resp.bits.data, 
                                    RegEnable(io.rom.resp.bits.data, io.rom.resp.fire)
                                )
    
    pcNext := Mux(io.excp.valid, 
                    Mux(io.excp.bits.isMret, 
                            io.mepc, 
                            io.trapVec
                        ),
                    Mux(io.in.execute.bits.brTaken, 
                            io.in.execute.bits.targetAddr, 
                            pcNext4
                        )
                )
    
    val updatePC = io.out.fire
    // val updatePC = io.out.fire || hasBranch
    pc     := Mux(updatePC, pcNext, pcReg)
    // pc     := Mux(updatePC, pcNext2, pcReg)
    when(updatePC) { pcReg := pcNext }
    // when(updatePC) { pcReg := pcNext2 }
    dontTouch(updatePC)


    io.out.bits.pcNext4          := pcNext4
    io.out.bits.instState.commit := commit
    io.out.bits.instState.pc     := pcReg
    io.out.bits.instState.inst   := inst

    io.out.valid := !stall
}

object FetchGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Fetch hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Fetch()(defaultConfig), Array("--target-dir", "build"))
}
