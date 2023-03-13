package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.AluOp._
import mycpu.common.consts.ExceptType._
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.CSR
import mycpu.common.consts.LsuOp._


class DecodeHazardOutBundle()(implicit val p: Parameters) extends MyBundle{
    val rs1 = UInt(5.W)
    val rs2 = UInt(5.W)
}

class DecodeHazardInBundle()(implicit val p: Parameters) extends MyBundle{
    val stall = Bool()
}

class DecodeOut()(implicit val p: Parameters) extends MyBundle{
    val isBranch = Bool()
    val isJump = Bool()
    val resultSrc = UInt(2.W)
    val lsuOp = UInt(LSU_OP_WIDTH.W)
    val aluOpSel = UInt(aluOpWidth.W)
    val immSign = Bool()
    val regWrEn = Bool()
    val pcAddReg = Bool()

    val pcNext4 = UInt(xlen.W)
    val aluIn1 = UInt(xlen.W)
    val aluIn2 = UInt(xlen.W)
    val aluIn1IsReg = Bool()
    val aluIn2IsReg = Bool()
    val imm = UInt(xlen.W)

    val data2 = UInt(xlen.W)

    val excType = UInt(EXC_TYPE_WIDTH.W) 
    val csrOp = UInt(CSR_OP_WIDTH.W)

    val instState = new InstState
}

sealed class RegFileIO()(implicit val p: Parameters) extends MyBundle{
    val rs1 = Output(UInt(5.W))
    val rs2 = Output(UInt(5.W))
    val rdata1 = Input(UInt(xlen.W))
    val rdata2 = Input(UInt(xlen.W))
}

sealed class HazardIO()(implicit val p: Parameters) extends MyBundle{
    val out = Output(new DecodeHazardOutBundle)
    val in = Input(new DecodeHazardInBundle)
}

class DecodeIO()(implicit val p: Parameters) extends MyBundle{
    val in = Flipped(Decoupled(new FetchOut))
    val out = Decoupled(new DecodeOut)
    val hazard = new HazardIO
    val regfile = new RegFileIO
    val ctrl = Input(new PipelineCtrlBundle)
}

class Decode()(implicit val p: Parameters) extends MyModule{
    val io = IO(new DecodeIO)
    
    val stall = io.ctrl.stall | io.hazard.in.stall
    val flush = io.ctrl.flush

    io.in.ready := io.out.ready && ~stall

    val decodeLatch = io.in.fire
    val stageReg = RegInit(0.U.asTypeOf(io.in.bits))
    when(decodeLatch) {
        stageReg := io.in.bits
    }.elsewhen(~stall){
        stageReg := 0.U.asTypeOf(io.in.bits)
    }


    when(flush) { stageReg := 0.U.asTypeOf(io.in.bits) }

    val inst = stageReg.instState.inst
    val rs1 = InstField(inst, "rs1")
    val rs2 = InstField(inst, "rs2")
    val rd = InstField(inst,"rd")
    val imm = Wire(UInt(xlen.W))
    val rfRdData1 = WireInit(0.U(xlen.W))
    val rfRdData2 = WireInit(0.U(xlen.W))
    
    // immediate
    val immI  = inst(31, 20)
    val immS  = Cat(inst(31, 25), inst(11, 7))
    val immB  = Cat(inst(31), inst(7), inst(30, 25), inst(11, 8), 0.U(1.W))
    val immU  = Cat(inst(31, 12), 0.U(12.W))
    val immJ  = Cat(inst(31), inst(19, 12), inst(20), inst(30, 21), 0.U(1.W))

    // operand generator
    def generateOpr(oprSel: UInt) =
        MuxLookup(oprSel, 0.U, Seq(
        OPR_REG1  -> rfRdData1.asUInt,
        OPR_REG2  -> rfRdData2.asUInt,
        OPR_IMM   -> imm.asUInt,
        OPR_IMMR  -> ZeroExt(rs1, xlen),
        OPR_PC    -> stageReg.instState.pc.asUInt,
        OPR_4     -> 4.U,
    ))


    val ctrlUnit    = Module(new CtrlUnit())
    val isBranch    = ctrlUnit.io.out.isBranch
    val immSrc      = ctrlUnit.io.out.immSrc
    val immSign     = ctrlUnit.io.out.immSign
    val aluOpSel    = ctrlUnit.io.out.aluOpSel
    val aluSrc1     = ctrlUnit.io.out.aluSrc1
    val aluSrc2     = ctrlUnit.io.out.aluSrc2
    val lsuOp       = ctrlUnit.io.out.lsuOp
    val regWrEn     = ctrlUnit.io.out.regWrEn
    val resultSrc   = ctrlUnit.io.out.resultSrc
    val pcAddReg    = ctrlUnit.io.out.pcAddReg
    val isJump      = ctrlUnit.io.out.isJump
    val csrOp       = ctrlUnit.io.out.csrOp
    val excType     = ctrlUnit.io.out.excType
    ctrlUnit.io.in.start := true.B
    ctrlUnit.io.in.inst := inst

    
    // regfile read data
    io.regfile.rs1 := rs1
    io.regfile.rs2 := rs2
    rfRdData1 := io.regfile.rdata1
    rfRdData2 := io.regfile.rdata2

    val immGen = Module(new ImmGen())
    immGen.io.inst      := inst
    immGen.io.immSrc    := immSrc
    immGen.io.immSign   := immSign
    imm                 := immGen.io.imm


    // control signals
    io.out.bits.isBranch    := isBranch
    io.out.bits.isJump      := isJump
    io.out.bits.resultSrc   := resultSrc
    io.out.bits.lsuOp       := lsuOp
    io.out.bits.aluOpSel    := aluOpSel
    io.out.bits.pcAddReg    := pcAddReg
    io.out.bits.regWrEn     := regWrEn
    io.out.bits.immSign     := immSign


    // csr signals
    io.out.bits.csrOp       := csrOp
    io.out.bits.excType     := excType
    

    // alu signals
    io.out.bits.aluIn1       := generateOpr(aluSrc1)
    io.out.bits.aluIn2       := generateOpr(aluSrc2)
    io.out.bits.aluIn1IsReg  := aluSrc1 === OPR_REG1 || aluSrc1 === OPR_REG2
    io.out.bits.aluIn2IsReg  := aluSrc2 === OPR_REG1 || aluSrc2 === OPR_REG2

    io.out.bits.data2       := rfRdData2
    io.out.bits.imm         := imm
    io.out.bits.pcNext4     := stageReg.pcNext4
    io.out.bits.instState <> stageReg.instState

    // hazard detection
    io.hazard.out.rs1 := rs1
    io.hazard.out.rs2 := rs2
    

    io.out.valid := io.out.ready && ~stall
}