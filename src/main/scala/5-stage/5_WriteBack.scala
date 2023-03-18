package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.csr._
import mycpu.common.consts.CsrOp._

class WritebackHazardBundle()(override implicit val p: Parameters) extends  MemHazardBundle

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
    val in = Flipped(DecoupledIO(new MemOut))
    val instState = Output(new InstState)
    val hazard = Output(new WritebackHazardBundle)
    val ctrl = Input(new PipelineCtrlBundle)
    val regfile = Output(new WritebackOut)
    val csrWrite = Flipped(new CsrWrite)

    val lsuData = Input(UInt(xlen.W))
    val lsuOK = Input(Bool())
}


class WriteBack()(implicit val p: Parameters) extends MyModule{
    val io = IO(new WritebackIO)
    
    val wbRam = WireInit(false.B)
    val stall = io.ctrl.stall || !io.lsuOK
    val flush = io.ctrl.flush

    io.in.ready := !stall
    val writebackLatch = io.in.fire
    val stageReg = RegInit(0.U.asTypeOf(io.in.bits))
    when(writebackLatch) {
        stageReg := io.in.bits
    }.elsewhen(!stall){
        stageReg := 0.U.asTypeOf(io.in.bits)
    }
    
    when(flush && !stall) { stageReg := 0.U.asTypeOf(io.in.bits) }
    
    wbRam := stageReg.resultSrc === "b01".U

    val rdVal = MuxLookup(stageReg.resultSrc, stageReg.aluOut, Seq(
                                "b00".U -> stageReg.aluOut,
                                "b01".U -> io.lsuData,
                                "b10".U -> stageReg.pcNext4
                            ))
    io.regfile.regWrData := rdVal;
    val inst              = stageReg.instState.inst
    io.regfile.rd        := InstField(inst, "rd")
    io.regfile.regWrEn   := stageReg.regWrEn 

    io.csrWrite.addr     := stageReg.csrAddr
    io.csrWrite.data     := stageReg.csrWrData
    io.csrWrite.op       := Mux(stageReg.csrWrEn, stageReg.csrOp, CSR_R)
    io.csrWrite.retired  := stageReg.instState.commit && !stall
    
    io.instState         <> stageReg.instState
    io.instState.commit  := stageReg.instState.commit && !stall

    // hazard control
    io.hazard.rd         := InstField(inst, "rd")
    io.hazard.rdVal      := rdVal; 
    io.hazard.regWrEn    := stageReg.regWrEn
}