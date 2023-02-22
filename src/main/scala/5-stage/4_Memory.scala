package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import dataclass.data

class MemoryHazardBundle()(implicit val p: Parameters) extends MyBundle{
    val rd = Output(UInt(5.W))
    val rdVal = Output(UInt(xlen.W))
    val regWrEn = Output(Bool())
}

class MemoryOut()(implicit val p: Parameters) extends MyBundle{
    val rd = UInt(5.W)
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
    val resultSrc = UInt(2.W)
    val regWrEn = Bool()
    val rdData = Bool()
    val aluOut = UInt(xlen.W)
    val pcNext4 = UInt(xlen.W)

    val instState = new InstState
}

class MemoryIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(DecoupledIO(new ExecuteOut))
    val out = DecoupledIO(new MemoryOut)
    val hazard = new MemoryHazardBundle
}

class Memory()(implicit val p: Parameters) extends MyModule{
    val io = IO(new MemoryIO)

    io.in.ready := io.out.ready
    val memoryLatch = io.in.valid && io.out.ready
    val stageReg = RegEnable(io.in.bits, memoryLatch)

    // data memory read
    val dataMem = Module(new DMem())
    dataMem.io.read.addr := stageReg.aluOut
    dataMem.io.read.en := stageReg.memRdEn
    dataMem.io.read.dataType := stageReg.memType
    dataMem.io.read.sign := stageReg.memSign
    dataMem.io.write.addr := stageReg.aluOut
    dataMem.io.write.en := stageReg.memWrEn
    dataMem.io.write.dataType := stageReg.memType
    dataMem.io.write.data := stageReg.data2

    io.out.bits.rd := stageReg.rd
    io.out.bits.rs1 := stageReg.rs1
    io.out.bits.rs2 := stageReg.rs2
    io.out.bits.resultSrc := stageReg.resultSrc
    io.out.bits.regWrEn := stageReg.regWrEn
    io.out.bits.rdData := dataMem.io.read.data.bits & dataMem.io.read.data.valid
    io.out.bits.aluOut := stageReg.aluOut
    io.out.bits.pcNext4 := stageReg.pcNext4

    io.out.bits.instState <> stageReg.instState

    // hazard control
    io.hazard.rd := stageReg.rd
    io.hazard.regWrEn := stageReg.regWrEn
    io.hazard.rdVal := stageReg.aluOut

    io.out.valid := io.out.ready
}