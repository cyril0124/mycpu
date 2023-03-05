package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMasterId._

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
    // val rom = DecoupledIO(new BusMasterBundle)
    val rom = new TLMasterBusUL
}


class Fetch()(implicit val p: Parameters) extends MyModule{
    val io = IO(new FetchIO)
    
    // pipeline control
    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    // for pipeline stage, if one stage stall then all of the stage in front of the stall stage will stall too.
    io.in.execute.ready := io.in.start && ~stall

    val pcReg = RegInit(resetPc.U(xlen.W))
    val pc = Wire(UInt(xlen.W))
    val inst = WireInit(0.U(ilen.W))
    val instReady = RegNext(RegNext(io.in.start, false.B))

    val instMem = Module(new ROM())
    instMem.io <> DontCare
    instMem.io.raddr := pc // pcReg
    inst := instMem.io.rdata

    val commit = io.rom.resp.valid && io.in.start // commit when inst is read back from ROM
    val pcNext = Wire(UInt(xlen.W))
    val pcNext4 = pcReg + (ilen / 8).U

    io.rom <> DontCare
    // // send bus req
    // io.rom.req.bits <> DontCare
    // io.rom.req.valid := ~flush // && io.rom.req.ready
    // io.rom.req.bits.address := pcReg
    // io.rom.req.bits.opcode := Get
    // io.rom.req.bits.source := ID_ROM
    // // get bus resp
    // io.rom.resp.bits <> DontCare
    // io.rom.resp.ready := io.out.ready
    // inst := io.rom.resp.bits.data

    pcNext := Mux(io.in.execute.bits.brTaken, io.in.execute.bits.targetAddr, pcNext4)
    // pcReg := Mux(io.in.start && commit, pcNext, pcReg)
    pc := Mux(commit, pcNext, pcReg)

    when(commit) {
        pcReg := pcNext
    }

    io.out.bits.pcNext4 := pcNext4

    io.out.bits.instState.commit := commit // io.in.start // TODO: for now this is always true, when we implement pipeline control, it will be depended on pipeline control signals
    io.out.bits.instState.pc := pcReg
    io.out.bits.instState.inst := inst

    io.out.valid := ( io.out.ready || io.in.start ) && ~stall && commit
}

object FetchGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Fetch hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Fetch()(defaultConfig), Array("--target-dir", "build"))
}
