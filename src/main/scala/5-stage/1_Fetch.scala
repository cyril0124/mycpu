package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class FetchOut()(implicit val p: Parameters) extends MyBundle{
    val pcNext4 = UInt(xlen.W) // for Decode stage
    val instState = new InstState
}

class FetchIO()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
        val start = Input(Bool())
        val execute = Flipped(DecoupledIO(new Execute2Fetch))
        // TODO: pipeline control signals
        // val stall = Input(Bool())
    }
    val out = DecoupledIO(new FetchOut)
    val ctrl = Flipped(new PipelineCtrlBundle)
}


class Fetch()(implicit val p: Parameters) extends MyModule{
    val io = IO(new FetchIO)
    
    // pipeline control
    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.execute.ready := io.in.start && ~stall

    val fetchLatch = io.out.ready && io.in.execute.valid
    val stageReg = RegEnable(io.in.execute.bits, 0.U.asTypeOf(io.in.execute.bits), fetchLatch)

    when(flush) {
        stageReg := 0.U.asTypeOf(io.in.execute.bits)
    }

    val pcReg = RegInit(startAddr.U(xlen.W))
    val inst = WireInit(0.U(ilen.W))

    val instMem = Module(new IMem())
    instMem.io.addr := pcReg
    inst := instMem.io.inst

    val pcNext = Wire(UInt(xlen.W))
    val pcNext4 = pcReg + (ilen / 8).U

    pcNext := Mux(stageReg.brTaken, stageReg.targetAddr, pcNext4)
    pcReg := Mux(io.in.start, pcNext, pcReg)

    io.out.bits.pcNext4 := pcNext4

    io.out.bits.instState.commit := io.in.start // TODO: for now this is always true, when we implement pipeline control, it will be depended on pipeline control signals
    io.out.bits.instState.pc := pcReg
    io.out.bits.instState.inst := inst

    io.out.valid := ( io.out.ready || io.in.start ) && ~stall
}
