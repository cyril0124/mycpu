package mycpu.common.consts

import chisel3._
import chisel3.util.log2Ceil

object AluOp {
    val aluOpWidth = 5

    val ALU_ADD = 0.U(aluOpWidth.W)
    val ALU_SUB = 1.U(aluOpWidth.W)

    val ALU_AND = 2.U(aluOpWidth.W)
    val ALU_OR  = 3.U(aluOpWidth.W)
    val ALU_XOR = 4.U(aluOpWidth.W)

    val ALU_EQU  = 5.U(aluOpWidth.W) // equal ==
    val ALU_NE   = 6.U(aluOpWidth.W) // not equal !=
    val ALU_GEQ  = 7.U(aluOpWidth.W) // >=

    val ALU_SLT  = 8.U(aluOpWidth.W) // set less than 
    val ALU_SLTU = 9.U(aluOpWidth.W) // set less than unsigned

    val ALU_SLL = 10.U(aluOpWidth.W)  // shift left logic
    val ALU_SRL = 11.U(aluOpWidth.W)  // shift right logic
    val ALU_SRA = 12.U(aluOpWidth.W)  // shift right arithmetic

    val ALU_BYPA = 13.U(aluOpWidth.W) // bypass input port A
    val ALU_BYPB = 14.U(aluOpWidth.W) // bypass input port B

    val ALU_GEQU = 15.U(aluOpWidth.W)
    val ALU_LUI = 16.U(aluOpWidth.W)

    val ALU_XXX = 17.U(aluOpWidth.W) // dont care what aluOP is.
    val ALU_NOP = 17.U(aluOpWidth.W)
}

// all operations that supported by LSU
object LsuOp {
    import AluOp._
    val LSU_OP_WIDTH = log2Ceil(23)

    val LSU_NOP   = 0.U(LSU_OP_WIDTH.W)
    val LSU_LB    = 1.U(LSU_OP_WIDTH.W)
    val LSU_LH    = 2.U(LSU_OP_WIDTH.W)
    val LSU_LW    = 3.U(LSU_OP_WIDTH.W)
    val LSU_LBU   = 4.U(LSU_OP_WIDTH.W)
    val LSU_LHU   = 5.U(LSU_OP_WIDTH.W)
    val LSU_SB    = 6.U(LSU_OP_WIDTH.W)
    val LSU_SH    = 7.U(LSU_OP_WIDTH.W)
    val LSU_SW    = 8.U(LSU_OP_WIDTH.W)
    val LSU_LR    = 9.U(LSU_OP_WIDTH.W)
    val LSU_SC    = 10.U(LSU_OP_WIDTH.W)
    val LSU_SWAP  = 11.U(LSU_OP_WIDTH.W)
    val LSU_ADD   = 12.U(LSU_OP_WIDTH.W)
    val LSU_XOR   = 13.U(LSU_OP_WIDTH.W)
    val LSU_AND   = 14.U(LSU_OP_WIDTH.W)
    val LSU_OR    = 15.U(LSU_OP_WIDTH.W)
    val LSU_MIN   = 16.U(LSU_OP_WIDTH.W)
    val LSU_MAX   = 17.U(LSU_OP_WIDTH.W)
    val LSU_MINU  = 18.U(LSU_OP_WIDTH.W)
    val LSU_MAXU  = 19.U(LSU_OP_WIDTH.W)
    val LSU_FENC  = 20.U(LSU_OP_WIDTH.W)
    val LSU_FENI  = 21.U(LSU_OP_WIDTH.W)
    val LSU_FENV  = 22.U(LSU_OP_WIDTH.W)
}

// all operations that supported by CSR
object CsrOp {
    val CSR_OP_WIDTH = log2Ceil(6)

    val CSR_NOP = 0.U(CSR_OP_WIDTH.W)
    val CSR_R   = 1.U(CSR_OP_WIDTH.W)
    val CSR_W   = 2.U(CSR_OP_WIDTH.W)
    val CSR_RW  = 3.U(CSR_OP_WIDTH.W)
    val CSR_RS  = 4.U(CSR_OP_WIDTH.W)
    val CSR_RC  = 5.U(CSR_OP_WIDTH.W)
}
