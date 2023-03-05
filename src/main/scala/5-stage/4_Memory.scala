package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import dataclass.data

class MemoryHazardBundle()(implicit val p: Parameters) extends MyBundle{
    val rd = UInt(5.W)
    val rdVal = UInt(xlen.W)
    val regWrEn = Bool()
}

class MemoryOut()(implicit val p: Parameters) extends MyBundle{
    val resultSrc = UInt(2.W)
    val regWrEn = Bool()
    val rdData = UInt(xlen.W)
    val aluOut = UInt(xlen.W)
    val pcNext4 = UInt(xlen.W)

    val instState = new InstState
}

class MemoryIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(DecoupledIO(new ExecuteOut))
    val out = DecoupledIO(new MemoryOut)
    val hazard = Output(new MemoryHazardBundle)
    val ctrl = Input(new PipelineCtrlBundle)
}

class Memory()(implicit val p: Parameters) extends MyModule{
    val io = IO(new MemoryIO)

    val stall = io.ctrl.stall
    val flush = io.ctrl.flush

    io.in.ready := io.out.ready && ~stall
    val memoryLatch = io.in.valid && io.out.ready
    val stageReg = RegEnable(io.in.bits, 0.U.asTypeOf(io.in.bits), memoryLatch)

    when(flush) {
        stageReg := 0.U.asTypeOf(io.in.bits)
    }

    // data memory read
    // val dataMem = Module(new DMem())
    // dataMem.io.read.addr := stageReg.aluOut
    // dataMem.io.read.en := stageReg.memRdEn
    // dataMem.io.read.dataType := stageReg.memType
    // dataMem.io.read.sign := stageReg.memSign
    // dataMem.io.write.addr := stageReg.aluOut
    // dataMem.io.write.en := stageReg.memWrEn
    // dataMem.io.write.dataType := stageReg.memType
    // dataMem.io.write.data := stageReg.data2
    val dataMem = Module(new RAM())
    val dataMemRdData = ReadMask(dataMem.io.rdata, stageReg.memSign, stageReg.memType, xlen)
    dataMem.io.raddr := stageReg.aluOut // Mux(memoryLatch, io.in.bits.aluOut, stageReg.aluOut)
    dataMem.io.waddr := stageReg.aluOut
    dataMem.io.wen := stageReg.memWrEn
    dataMem.io.wdata := WriteMask(stageReg.data2, stageReg.memType, xlen)
    dontTouch(dataMemRdData)

    io.out.bits.resultSrc := stageReg.resultSrc
    io.out.bits.regWrEn := stageReg.regWrEn
    // io.out.bits.rdData := dataMem.io.read.data.bits & dataMem.io.read.data.valid
    io.out.bits.rdData := dataMemRdData
    io.out.bits.aluOut := stageReg.aluOut
    io.out.bits.pcNext4 := stageReg.pcNext4

    io.out.bits.instState <> stageReg.instState

    // hazard control
    val inst = stageReg.instState.inst
    io.hazard.rd := InstField(inst, "rd")
    io.hazard.regWrEn := stageReg.regWrEn
    io.hazard.rdVal := stageReg.aluOut

    io.out.valid := io.out.ready
}

object MemoryGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Memory hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Memory()(defaultConfig), Array("--target-dir", "build"))
}
