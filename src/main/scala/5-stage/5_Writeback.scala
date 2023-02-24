package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class WritebackHazardBundle()(override implicit val p: Parameters) extends  MemoryHazardBundle

class InstState()(implicit val p: Parameters) extends MyBundle{
    val commit = Bool()
    val pc = UInt(xlen.W)
    val inst = UInt(ilen.W)
}

class WritebackOut()(implicit val p: Parameters) extends MyBundle{
    val rd = UInt(5.W)
    val regWrEn = Bool()
    val regWrData = UInt(xlen.W)
}

class WritebackIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(DecoupledIO(new MemoryOut))
    val out = DecoupledIO(new WritebackOut) // for execute stage
    val instState = Output(new InstState)
    val hazard = new WritebackHazardBundle
    val ctrl = Flipped(new PipelineCtrlBundle)
}


class Writeback()(implicit val p: Parameters) extends MyModule{
    val io = IO(new WritebackIO)

    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.ready := io.out.ready && ~flush
    val writebackLatch = io.in.valid && io.out.ready
    val stageReg = RegEnable(io.in.bits, writebackLatch)

    when(flush) {
        stageReg := 0.U.asTypeOf(io.in.bits)
    }
    
    io.out.bits.regWrData := MuxLookup(stageReg.resultSrc, stageReg.aluOut, Seq(
                                "b00".U -> stageReg.aluOut,
                                "b01".U -> stageReg.rdData,
                                "b10".U -> stageReg.pcNext4
                            ))
    io.out.bits.rd := stageReg.rd
    io.out.bits.regWrEn := stageReg.regWrEn

    io.instState <> stageReg.instState

    // hazard control
    io.hazard.rd := stageReg.rd
    io.hazard.rdVal := stageReg.aluOut
    io.hazard.regWrEn := stageReg.regWrEn

    io.out.valid := io.out.ready && io.in.valid
}