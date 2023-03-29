package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.common.Instructions._

import mycpu.common.consts.AluOp._
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.Control._
import mycpu.common.consts.ExceptType._
import mycpu.common.consts.LsuOp

class CtrlSigs(aluOpWidth:Int = 4) extends Bundle {
    val isBranch    = Output(Bool())
    val isJump      = Output(Bool()) // for jalr and jal instruction

    val resultSrc   = Output(UInt(RET_SRC_WIDTH.W))
    // val memWrEn     = Output(Bool())
    // val memType     = Output(UInt(3.W))
    val aluOpSel    = Output(UInt(aluOpWidth.W))
    val lsuOp       = Output(UInt(LsuOp.LSU_OP_WIDTH.W))
    // val aluSrc      = Output(UInt(2.W))
    val aluSrc1     = Output(UInt(OPR_WIDTH.W))
    val aluSrc2     = Output(UInt(OPR_WIDTH.W))
    val immSrc      = Output(UInt(IMM_TYP_WIDTH.W))
    val immSign     = Output(Bool())
    val regWrEn     = Output(Bool())
    // val memSign     = Output(Bool())
    
    val pcAddReg    = Output(Bool()) // for jalr instruction

    val csrOp       = Output(UInt(CSR_OP_WIDTH.W))
    val excType     = Output(UInt(EXC_TYPE_WIDTH.W))
}

class CtrlPort(ilen:Int = 32) extends Bundle {
    val start = Input(Bool())
    val inst = Input(UInt(ilen.W))
}


class CtrlUnit()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val out = new CtrlSigs(aluOpWidth)
        val in  = new CtrlPort(ilen)
    })
    
    val inst = io.in.inst
    val out = io.out
    val funct3 = InstField(inst, "funct3")


    val decoder = Module(new Decoder())
    val dout = decoder.io.out
    decoder.io.inst := Mux(io.in.start, io.in.inst, 0.U)

    out.isBranch    := dout.isBranch
    out.resultSrc   := dout.resultSrc
    // out.memWrEn     := dout.memWrEn
    // out.memType     := dout.memType
    out.aluOpSel    := dout.aluOpSel
    out.lsuOp       := dout.lsuOp
    // out.aluSrc      := dout.aluSrc
    out.aluSrc1     := dout.aluSrc1
    out.aluSrc2     := dout.aluSrc2
    out.immSrc      := dout.immSrc
    out.immSign     := dout.immSign
    out.regWrEn     := dout.regWrEn
    // out.memSign     := ~funct3(2).asBool
    out.csrOp       := dout.csrOp
    out.excType     := dout.excType

    val opcode = InstField(inst, "opcode")
    val funct12 = InstField(inst, "funct12")
    out.pcAddReg    := opcode === JALR(6,0)
    out.isJump      := opcode === JALR(6,0) || opcode === JAL(6,0)
    // out.ecall       := opcode === ECALL(6,0) && funct12 === ECALL(31,20)
    // out.ebreak      := opcode === EBREAK(6,0) && funct12 === EBREAK(31,20)
}

object CtrlUnitGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the CtrlUnit hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new CtrlUnit()(defaultConfig), Array("--target-dir", "build"))
}
