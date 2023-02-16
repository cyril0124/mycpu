package mycpu.common

import chisel3._
import chisel3.util._

trait ScalarOpConstants {

    val PC_N4 = 0.U(1.W)
    val PC_NT = 1.U(1.W)

    // Control Unit
    val X = BitPat("b?")
    val Y = BitPat("b1")
    val N = BitPat("b0")

    val RET_SRC_A = BitPat("b0")
    val RET_SRC_B = BitPat("b1")
    val RET_SRC_X = BitPat("b0")

    val MEM_WR_N = BitPat("b0")
    val MEM_WR_Y = BitPat("b1")

    val MEM_RD_N = BitPat("b0")
    val MEM_RD_Y = BitPat("b1")

    // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
    val MEM_TYP_8 = BitPat("b000")
    val MEM_TYP_16 = BitPat("b001")
    val MEM_TYP_32 = BitPat("b010")
    val MEM_TYP_64 = BitPat("b011")
    val MEM_TYP_XX = MEM_TYP_32

    val ALU_SRC_A = BitPat("b0")
    val ALU_SRC_B = BitPat("b1")

    val IMM_I = BitPat("b000")
    val IMM_S = BitPat("b001")
    val IMM_B = BitPat("b010")
    val IMM_U = BitPat("b011")
    val IMM_J = BitPat("b100")
    val IMM_X = BitPat("b000") // ! cant not contain don't care bit if use bitPatToUInt

    val IMM_SE = BitPat("b1") // SignExt
    val IMM_ZE = BitPat("b0") // ZeroExt

    val REG_WR_N = BitPat("b0")
    val REG_WR_Y = BitPat("b1")

}

trait AluOpConstants {

    val aluOpWidth = 4

    val ADD = 0.U(aluOpWidth.W)
    val SUB = 1.U(aluOpWidth.W)

    val AND = 2.U(aluOpWidth.W)
    val OR  = 3.U(aluOpWidth.W)
    val XOR = 4.U(aluOpWidth.W)

    val EQU  = 5.U(aluOpWidth.W) // equal ==
    val NE   = 6.U(aluOpWidth.W) // not equal !=
    val GEQ  = 7.U(aluOpWidth.W) // >=

    val SLT  = 8.U(aluOpWidth.W) // set less than 
    val SLTU = 9.U(aluOpWidth.W) // set less than unsigned

    val SLL = 10.U(aluOpWidth.W)  // shift left logic
    val SRL = 11.U(aluOpWidth.W)  // shift right logic
    val SRA = 12.U(aluOpWidth.W) // shift right arithmetic

    val BYPA = 13.U(aluOpWidth.W) // bypass input port A
    val BYPB = 14.U(aluOpWidth.W) // bypass input port B

    val ALU_XXX = BitPat(0.U(aluOpWidth.W)) // dont care what aluOP is.

}
