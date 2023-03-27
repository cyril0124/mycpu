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
        JAL     -> List(N,  RET_SRC_C,  LSU_NOP,  ALU_ADD,  OPR_PC,    OPR_IMM,   IMM_J,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

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


// object XDecode {

//     def decodeDefault: List[UInt] = 
// //                                       memWrEn    memType                                     immSrc immSign
// //                 isBranch?  resultSrc    |           |      aluOpSel     aluSrc1  aluSrc2       |        |     regWrEn   csrOp   exceptionType
// //                      |       |          |           |         |            |        |          |        |       |         |       |
//                    List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_32, ALU_XXX,   OPR_ZERO,  OPR_ZERO, IMM_X,  IMM_SE, REG_WR_N, CSR_NOP, EXC_ILLEG)
//     val RV32I: Array[(BitPat, List[UInt])] = Array(
//         LB      -> List(N,  RET_SRC_B,  MEM_WR_N,  MEM_TYP_8,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         LH      -> List(N,  RET_SRC_B,  MEM_WR_N,  MEM_TYP_16, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         LW      -> List(N,  RET_SRC_B,  MEM_WR_N,  MEM_TYP_32, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         LBU     -> List(N,  RET_SRC_B,  MEM_WR_N,  MEM_TYP_8,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         LHU     -> List(N,  RET_SRC_B,  MEM_WR_N,  MEM_TYP_16, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

//         ADDI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLLI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLTI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLT,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLTIU   -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLTU,  OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         XORI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XOR,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SRLI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SRL,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SRAI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SRA,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         ORI     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_OR,    OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         ANDI    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_AND,   OPR_REG1,  OPR_IMM,  IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         AUIPC   -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_ADD,   OPR_PC,    OPR_IMM,  IMM_U,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

//         SB      -> List(N,  RET_SRC_X,  MEM_WR_Y,  MEM_TYP_8,  ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         SH      -> List(N,  RET_SRC_X,  MEM_WR_Y,  MEM_TYP_16, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         SW      -> List(N,  RET_SRC_X,  MEM_WR_Y,  MEM_TYP_32, ALU_ADD,   OPR_REG1,  OPR_IMM,  IMM_S,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),

//         ADD     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_ADD,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SUB     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SUB,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLL     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLT     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLT,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SLTU    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLTU,  OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         XOR     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XOR,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SRL     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SRL,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         SRA     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SRA,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         OR      -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_OR,    OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         AND     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_AND,   OPR_REG1,  OPR_REG2,  IMM_X,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

//         LUI     -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_BYPB,  OPR_ZERO,  OPR_IMM,  IMM_U,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

//         BEQ     -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_EQU,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         BNE     -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_NE,    OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         BLT     -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLT,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         BGE     -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_GEQ,   OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         BLTU    -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_SLTU,  OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),
//         BGEU    -> List(Y,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_GEQU,  OPR_REG1,  OPR_REG2,  IMM_B,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE),

        
//         // TODO:
//         JALR    -> List(N,  RET_SRC_C,  MEM_WR_N,  MEM_TYP_XX, ALU_ADD,   OPR_REG1,    OPR_IMM,    IMM_I,  IMM_SE, REG_WR_Y, CSR_NOP, EXC_NONE),
//         JAL     -> List(N,  RET_SRC_C,  MEM_WR_N,  MEM_TYP_XX, ALU_ADD,   OPR_PC,      OPR_IMM,    IMM_J,  IMM_ZE, REG_WR_Y, CSR_NOP, EXC_NONE),

//         FENCE   -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_32, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_X,  IMM_SE, REG_WR_N, CSR_NOP, EXC_NONE), // TODO:

//         // machine level privileged instructions
//         ECALL   -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_ECALL),
//         EBREAK  -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_EBRK ),
//         MRET    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_MRET ),
//         SRET    -> List(N,  RET_SRC_A,  MEM_WR_N,  MEM_TYP_XX, ALU_XXX,   OPR_ZERO,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_N, CSR_NOP, EXC_SRET ),
//         // WFI

//     )

//     val Zicsr: Array[(BitPat, List[UInt])] = Array(
//         CSRRW   -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RW, EXC_NONE),
//         CSRRS   -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RS, EXC_NONE),
//         CSRRC   -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_REG1,  OPR_ZERO,  IMM_I,  IMM_ZE, REG_WR_Y, CSR_RC, EXC_NONE),
//         CSRRWI  -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RW, EXC_NONE),
//         CSRRSI  -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RS, EXC_NONE),
//         CSRRCI  -> List(N,  RET_SRC_D,  MEM_WR_N,  MEM_TYP_XX,  ALU_ADD,   OPR_IMMR,  OPR_ZERO,  IMM_CSR,IMM_ZE, REG_WR_Y, CSR_RC, EXC_NONE),
//     )

//     val table: Array[(BitPat, List[UInt])] = RV32I ++ Zicsr
// }

class DecodeSigs(aluOpWidth: Int = 4)(implicit val p: Parameters) extends MyBundle {
    val isBranch    = Output(Bool())
    val resultSrc   = Output(UInt(RET_SRC_WIDTH.W))
    // val memWrEn     = Output(Bool())
    // val memType     = Output(UInt(3.W))
    val aluOpSel    = Output(UInt(aluOpWidth.W))
    val lsuOp       = Output(UInt(LSU_OP_WIDTH.W))
    val aluSrc1     = Output(UInt(OPR_WIDTH.W))
    val aluSrc2     = Output(UInt(OPR_WIDTH.W))
    val immSrc      = Output(UInt(2.W))
    val immSign     = Output(Bool())
    val regWrEn     = Output(Bool())
    val csrOp       = Output(UInt(CSR_OP_WIDTH.W))
    val excType     = Output(UInt(EXC_TYPE_WIDTH.W))
}

class Decoder()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val out = Output(new DecodeSigs(aluOpWidth))
    })

    val decodeTable = XDecode.table
    val defaultDecodeTable = XDecode.decodeDefault

    val decodeSigs = ListLookup(io.inst, defaultDecodeTable, decodeTable)
    // decodeSigs :=   WireInit(0.U.asTypeOf(io.out))

    // TODO： expression ERROR
    // val (pcSrc: Bool) :: (resultSrc: Bool) :: (memWrEn: Bool) :: (memRdEn: Bool) :: memType :: aluOpSel :: (aluSrc: Bool) :: immSrc :: (immSign: Bool) :: (regWrEn: Bool) :: Nil = ctrlSigs
    // val (isBranch: Bool) :: (resultSrc: Bool) :: (memWrEn: Bool) :: aluOpSel :: aluSrc

    // io.out.pcSrc := pcSrc
    // io.out.resultSrc := resultSrc
    // io.out.memWrEn := memWrEn
    // io.out.memRdEn := memRdEn
    // io.out.memType := memType
    // io.out.aluOpSel := aluOpSel
    // io.out.aluSrc := aluSrc
    // io.out.immSrc := immSrc
    // io.out.immSign := immSign
    // io.out.regWrEn := regWrEn

    // val isBranch = ctrlSigs(0)
    // io.out.pcSrc := Mux(isBranch.asBool, Mux(io.in.zero, PC_NT, PC_N4), PC_N4)

    io.out.isBranch := decodeSigs(0)
    io.out.resultSrc := decodeSigs(1)
    // io.out.memWrEn := decodeSigs(2)
    // io.out.memType := decodeSigs(3)
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


