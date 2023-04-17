package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._

import mycpu.common.Instructions._
import mycpu.common.consts.Control._
import mycpu.common.consts.AluOp._
import mycpu.common.consts.CsrOp._
import mycpu.common.consts.ExceptType._
import mycpu.common.consts.LsuOp._

object XDecode {

    def decodeDefault: List[UInt] = 
//                                       lsuOP                                    immSrc immSign
//                 isBranch?  resultSrc    |      aluOpSel     aluSrc1  aluSrc2     |        |     regWrEn   csrOp   exceptionType
//                      |       |          |         |            |        |        |        |       |         |       |
                   List(N,  RET_SRC_A,  LSU_NOP,  ALU_XXX,   OPR_ZERO,  OPR_ZERO, IMM_X,  IMM_SE, REG_WR_N, CSR_NOP, EXC_ILLEG)
    val RV32I: Array[(BitPat, List[UInt])] = Array(
        LB      -> List(N,  RET_SRC_B,  LSU_LB,   ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        LH      -> List(N,  RET_SRC_B,  LSU_LH,   ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        LW      -> List(N,  RET_SRC_B,  LSU_LW,   ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        LBU     -> List(N,  RET_SRC_B,  LSU_LBU,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        LHU     -> List(N,  RET_SRC_B,  LSU_LHU,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),

        ADDI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLLI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_SLL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLTI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_SLT,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLTIU   -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_SLTU,  OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        XORI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_XOR,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SRLI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_SRL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SRAI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_SRA,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        ORI     -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_OR,    OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        ANDI    -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_AND,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        AUIPC   -> List(N,  RET_SRC_A,  LSU_NOP,  ALU_ADD,   OPR_PC,    OPR_IMM,  IMM_U,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

        SB      -> List(N,  RET_SRC_X,  LSU_SB,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        SH      -> List(N,  RET_SRC_X,  LSU_SH,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        SW      -> List(N,  RET_SRC_X,  LSU_SW,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),

        ADD     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_ADD,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SUB     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SUB,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLL     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SLL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLT     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SLT,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SLTU    -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SLTU,  OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        XOR     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_XOR,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SRL     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SRL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        SRA     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_SRA,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        OR      -> List(N,  RET_SRC_A,  LSU_NOP, ALU_OR,    OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
        AND     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_AND,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

        LUI     -> List(N,  RET_SRC_A,  LSU_NOP, ALU_BYPB,  OPR_ZERO,  OPR_IMM,  IMM_U,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

        BEQ     -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_EQU,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        BNE     -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_NE,    OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        BLT     -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_SLT,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        BGE     -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_GEQ,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        BLTU    -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_SLTU,  OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
        BGEU    -> List(Y,  RET_SRC_A,  LSU_NOP, ALU_GEQU,  OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),

        
        // TODO:
        JALR    -> List(N,  RET_SRC_C,  LSU_NOP,  ALU_ADD,  OPR_REG1,  OPR_IMM,   IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
        JAL     -> List(N,  RET_SRC_C,  LSU_NOP,  ALU_ADD,  OPR_PC,    OPR_IMM,   IMM_J,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),

        FENCE   -> List(N,  RET_SRC_A,  LSU_FENC, ALU_XXX,  OPR_ZERO,  OPR_ZERO,  IMM_X,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE), // TODO:

        // machine level privileged instructions
        ECALL   -> List(N,  RET_SRC_A,  LSU_NOP, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_ECALL),
        EBREAK  -> List(N,  RET_SRC_A,  LSU_NOP, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_EBRK ),
        MRET    -> List(N,  RET_SRC_A,  LSU_NOP, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_MRET ),
        SRET    -> List(N,  RET_SRC_A,  LSU_NOP, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_SRET ),
        // WFI

    )

    val Zicsr: Array[(BitPat, List[UInt])] = Array(
        CSRRW   -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RW, EXC_NONE),
        CSRRS   -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RS, EXC_NONE),
        CSRRC   -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RC, EXC_NONE),
        CSRRWI  -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RW, EXC_NONE),
        CSRRSI  -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RS, EXC_NONE),
        CSRRCI  -> List(N,  RET_SRC_D,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RC, EXC_NONE),
    )

    val table: Array[(BitPat, List[UInt])] = RV32I ++ Zicsr
}

class DecodeSigs()(implicit val p: Parameters) extends MyBundle {
    val isBranch    = Output(Bool())
    val resultSrc   = Output(UInt(RET_SRC_WIDTH.W))
    val aluOpSel    = Output(UInt(aluOpWidth.W))
    val lsuOp       = Output(UInt(LSU_OP_WIDTH.W))
    val aluSrc1     = Output(UInt(OPR_WIDTH.W))
    val aluSrc2     = Output(UInt(OPR_WIDTH.W))
    val immSrc      = Output(UInt(IMM_TYP_WIDTH.W))
    val immSign     = Output(Bool())
    val regWrEn     = Output(Bool())
    val csrOp       = Output(UInt(CSR_OP_WIDTH.W))
    val excType     = Output(UInt(EXC_TYPE_WIDTH.W))
}

class Decoder()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val out = Output(new DecodeSigs())
    })

    val decodeTable = XDecode.table
    val defaultDecodeTable = XDecode.decodeDefault

    val decodeSigs = ListLookup(io.inst, defaultDecodeTable, decodeTable)

    io.out.isBranch := decodeSigs(0)
    io.out.resultSrc := decodeSigs(1)
    io.out.lsuOp    := decodeSigs(2)
    io.out.aluOpSel := decodeSigs(3)
    io.out.aluSrc1 := decodeSigs(4)
    io.out.aluSrc2 := decodeSigs(5)
    io.out.immSrc := decodeSigs(6)
    io.out.immSign := decodeSigs(7)
    io.out.regWrEn := decodeSigs(8)
    io.out.csrOp := decodeSigs(9)
    io.out.excType  := decodeSigs(10)
}


class DecodeSigs_1()(implicit val p: Parameters) extends MyBundle {
    val brType = UInt(BR_WIDTH.W)
    val wbType = UInt(WB_WIDTH.W)
    val lsuOp = UInt(LSU_OP_WIDTH.W)
    val aluOp = UInt(aluOpWidth.W)
    val opr1 = UInt(OPR_WIDTH.W)
    val opr2 = UInt(OPR_WIDTH.W)
    val immSrc = UInt(IMM_TYP_WIDTH.W)
    val immSign = Bool()
    val csrOp = UInt(CSR_OP_WIDTH.W)
    val excpType = UInt(EXC_TYPE_WIDTH.W)
}

object XDecode_1 {

    def decodeDefault: List[UInt] = 
//                                        lsuOP                                     immSrc immSign
//                 branchType   writeback   |       aluOpSel     aluSrc1  aluSrc2     |        |      csrOp   exceptionType
//                      |          |        |          |            |        |        |        |        |       |
                   List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_NOP,   OPR_ZERO,  OPR_ZERO, IMM_X,  IMM_SE,  CSR_NOP, EXC_ILLEG)
    val RV32I: Array[(BitPat, List[UInt])] = Array(
        LB      -> List(BR_NOP,  WB_LSU,  LSU_LB,   ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_I,  IMM_SE,
        LH      -> List(BR_NOP,  WB_LSU,  LSU_LH,   ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_I,  IMM_SE,
        LW      -> List(BR_NOP,  WB_LSU,  LSU_LW,   ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_I,  IMM_SE,
        LBU     -> List(BR_NOP,  WB_LSU,  LSU_LBU,  ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_I,  IMM_SE,
        LHU     -> List(BR_NOP,  WB_LSU,  LSU_LHU,  ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_I,  IMM_SE,

        ADDI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        SLLI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_SLL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SLTI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_SLT,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        SLTIU   -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_SLTU,  OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        XORI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_XOR,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        SRLI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_SRL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SRAI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_SRA,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        ORI     -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_OR,    OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        ANDI    -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_AND,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE),
        AUIPC   -> List(BR_NOP,  WB_ALU,  LSU_NOP,  ALU_ADD,   OPR_PC,    OPR_IMM,  IMM_U,  IMM_ZE,  CSR_NOP, EXC_NONE),

        SB      -> List(BR_NOP,  WB_NOP,  LSU_SB,  ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_S,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM, IMM_S,  IMM_SE,
        SH      -> List(BR_NOP,  WB_NOP,  LSU_SH,  ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_S,  IMM_SE,  CSR_NOP, EXC_NONE),
        SW      -> List(BR_NOP,  WB_NOP,  LSU_SW,  ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_S,  IMM_SE,  CSR_NOP, EXC_NONE),

        ADD     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_ADD,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SUB     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SUB,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SLL     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SLL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SLT     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SLT,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SLTU    -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SLTU,  OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        XOR     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_XOR,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SRL     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SRL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        SRA     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_SRA,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        OR      -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_OR,    OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),
        AND     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_AND,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE,  CSR_NOP, EXC_NONE),

        LUI     -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_U,  IMM_ZE,  CSR_NOP, EXC_NONE), // OPR_ZERO,  OPR_IMM,  IMM_U,  IMM_ZE,

        BEQ     -> List(BR_EQ,   WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_REG2, 
        BNE     -> List(BR_NE,   WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE),
        BLT     -> List(BR_LT,   WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE),
        BGE     -> List(BR_GE,   WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE),
        BLTU    -> List(BR_LTU,  WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE),
        BGEU    -> List(BR_GEU,  WB_ALU,  LSU_NOP, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_B,  IMM_SE,  CSR_NOP, EXC_NONE),

        
        // TODO:
        JALR    -> List(BR_JALR,  WB_PCN4,  LSU_NOP, ALU_NOP,  OPR_REG1,  OPR_IMM,   IMM_I,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_REG1,  OPR_IMM,
        JAL     -> List(BR_JAL,   WB_PCN4,  LSU_NOP, ALU_NOP,  OPR_PC,    OPR_IMM,   IMM_J,  IMM_SE,  CSR_NOP, EXC_NONE), // OPR_PC,    OPR_IMM,

        FENCE   -> List(BR_NOP,   WB_ALU,  LSU_FENC, ALU_NOP,  OPR_ZERO,  OPR_ZERO,  IMM_X,  IMM_SE,  CSR_NOP, EXC_NONE), // TODO:

        // machine level privileged instructions
        ECALL   -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_ECALL),
        EBREAK  -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_EBRK ),
        MRET    -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_MRET ),
        SRET    -> List(BR_NOP,  WB_ALU,  LSU_NOP, ALU_NOP,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_NOP, EXC_SRET ),
        // WFI

    )

    val Zicsr: Array[(BitPat, List[UInt])] = Array(
        CSRRW   -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_RW, EXC_NONE),
        CSRRS   -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_RS, EXC_NONE),
        CSRRC   -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE,  CSR_RC, EXC_NONE),
        CSRRWI  -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE,  CSR_RW, EXC_NONE),
        CSRRSI  -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE,  CSR_RS, EXC_NONE),
        CSRRCI  -> List(BR_NOP,  WB_CSR,  LSU_NOP,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE,  CSR_RC, EXC_NONE),
    )

    val table: Array[(BitPat, List[UInt])] = RV32I ++ Zicsr
}

class Decoder_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val out = Output(new DecodeSigs_1())
    })

    val decodeTable = XDecode.table
    val defaultDecodeTable = XDecode.decodeDefault

    val decodeSigs = ListLookup(io.inst, defaultDecodeTable, decodeTable)

    io.out.brType := decodeSigs(0)
    io.out.wbType := decodeSigs(1)
    io.out.lsuOp := decodeSigs(2)
    io.out.aluOp := decodeSigs(3)
    io.out.opr1 := decodeSigs(4)
    io.out.opr2 := decodeSigs(5)
    io.out.immSrc := decodeSigs(6)
    io.out.immSign := decodeSigs(7)
    io.out.csrOp := decodeSigs(8)
    io.out.excpType := decodeSigs(9)

}
