package mycpu.common.consts

import chisel3._
import chisel3.util.log2Ceil


object Control{
    val PC_N4 = false.B
    val PC_NT = true.B

    // Control Unit
    val Y = true.B
    val N = false.B

    // retult source
    val RET_SRC_WIDTH = log2Ceil(4)
    val RET_SRC_A = 0.U(RET_SRC_WIDTH.W) // aluOUt
    val RET_SRC_B = 1.U(RET_SRC_WIDTH.W) // rdData
    val RET_SRC_C = 2.U(RET_SRC_WIDTH.W) // pcNext4
    val RET_SRC_D = 3.U(RET_SRC_WIDTH.W) // csrFile
    val RET_SRC_X = RET_SRC_A

    val MEM_WR_N = false.B
    val MEM_WR_Y = true.B

    val MEM_RD_N = false.B
    val MEM_RD_Y = true.B

    // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
    val MEM_TYP_WIDTH = log2Ceil(4)
    val MEM_TYP_8 = 0.U(MEM_TYP_WIDTH.W)
    val MEM_TYP_16 = 1.U(MEM_TYP_WIDTH.W)
    val MEM_TYP_32 = 2.U(MEM_TYP_WIDTH.W)
    val MEM_TYP_64 = 3.U(MEM_TYP_WIDTH.W)
    val MEM_TYP_XX = MEM_TYP_32

    // alu in2 source
    val ALU_SRC_WIDTH = log2Ceil(3)
    val ALU_SRC_A = 0.U(ALU_SRC_WIDTH.W) // regfile rdata 2
    val ALU_SRC_B = 1.U(ALU_SRC_WIDTH.W) // imm
    val ALU_SRC_C = 2.U(ALU_SRC_WIDTH.W) // csr

    // alu operator source
    val OPR_WIDTH = log2Ceil(9)
    val OPR_ZERO  = 0.U(OPR_WIDTH.W)
    val OPR_REG1  = 1.U(OPR_WIDTH.W)
    val OPR_REG2  = 2.U(OPR_WIDTH.W)
    val OPR_IMM   = 3.U(OPR_WIDTH.W)
    // val OPR_IMMI  = 3.U(OPR_WIDTH.W)
    // val OPR_IMMS  = 4.U(OPR_WIDTH.W)
    // val OPR_IMMU  = 5.U(OPR_WIDTH.W)  // with zeroed low 12-bit
    val OPR_IMMR  = 6.U(OPR_WIDTH.W)
    val OPR_PC    = 7.U(OPR_WIDTH.W)
    val OPR_4     = 8.U(OPR_WIDTH.W)

    val IMM_TYP_WIDTH = log2Ceil(6)
    val IMM_I = 0.U(IMM_TYP_WIDTH.W)
    val IMM_S = 1.U(IMM_TYP_WIDTH.W)
    val IMM_B = 2.U(IMM_TYP_WIDTH.W)
    val IMM_U = 3.U(IMM_TYP_WIDTH.W)
    val IMM_J = 4.U(IMM_TYP_WIDTH.W)
    val IMM_CSR = 5.U(IMM_TYP_WIDTH.W)
    val IMM_X = IMM_I

    val IMM_SE = true.B // SignExt
    val IMM_ZE = false.B // ZeroExt

    val REG_WR_N = false.B
    val REG_WR_Y = true.B

    val BR_WIDTH = log2Ceil(9) 
    val BR_NOP = 0.U(BR_WIDTH.W)
    val BR_JAL = 1.U(BR_WIDTH.W)
    val BR_JALR = 2.U(BR_WIDTH.W)
    val BR_EQ = 3.U(BR_WIDTH.W)
    val BR_NE = 4.U(BR_WIDTH.W)
    val BR_GE = 5.U(BR_WIDTH.W)
    val BR_LT = 6.U(BR_WIDTH.W)
    val BR_LTU = 7.U(BR_WIDTH.W)
    val BR_GEU = 8.U(BR_WIDTH.W)

    val WB_WIDTH = log2Ceil(5)
    val WB_NOP = 0.U(WB_WIDTH.W)
    val WB_ALU = 1.U(WB_WIDTH.W) // aluOUt
    val WB_LSU = 2.U(WB_WIDTH.W) // rdData
    val WB_PCN4 = 3.U(WB_WIDTH.W) // pcNext4
    val WB_CSR = 4.U(WB_WIDTH.W) // csrFile

}