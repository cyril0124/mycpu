package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.Instructions._

abstract trait DecodeConstants
    extends ScalarOpConstants with AluOpConstants {
    
    def bitPatList2UIntList(bpL: List[BitPat]): List[UInt] = {
        bpL.map( bp => BitPat.bitPatToUInt(bp))
    }

    def decodeDefault: List[UInt] = 
        //                                          memWrEn   memRdEn    memType                       immSrc immSign
        //                     isBranch?  resultSrc   |         |           |      aluOpSel  aluSrc       |     |     regWrEn
        //                          |       |         |         |           |         |         |         |     |       |
        bitPatList2UIntList(List(   N, RET_SRC_A, MEM_WR_N, MEM_RD_Y, MEM_TYP_32, ALU_XXX, ALU_SRC_A, IMM_X, IMM_SE, REG_WR_N))

    val table: Array[(BitPat, List[UInt])]
}


object XDecode extends DecodeConstants {
    
    val RV32I: Array[(BitPat, List[BitPat])] = Array(
        LB      -> List(N,  RET_SRC_B,  MEM_WR_N,   MEM_RD_Y,   MEM_TYP_8,  BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        LH      -> List(N,  RET_SRC_B,  MEM_WR_N,   MEM_RD_Y,   MEM_TYP_16, BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        LW      -> List(N,  RET_SRC_B,  MEM_WR_N,   MEM_RD_Y,   MEM_TYP_32, BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        LBU     -> List(N,  RET_SRC_B,  MEM_WR_N,   MEM_RD_Y,   MEM_TYP_8,  BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        LHU     -> List(N,  RET_SRC_B,  MEM_WR_N,   MEM_RD_Y,   MEM_TYP_16, BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),

        ADDI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        SLLI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLL),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        SLTI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLT),  ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        SLTIU   -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLTU), ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        XORI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(XOR),  ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        SRLI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SRL),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        SRAI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SRA),  ALU_SRC_B,  IMM_I,  IMM_ZE, REG_WR_Y),
        ORI     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(OR),   ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        ANDI    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(AND),  ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        AUIPC   -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(ADD),  ALU_SRC_B,  IMM_U,  IMM_ZE, REG_WR_Y),

        SB      -> List(N,  RET_SRC_X,  MEM_WR_Y,   MEM_RD_N,   MEM_TYP_8,  BitPat(ADD),  ALU_SRC_B,  IMM_S,  IMM_ZE, REG_WR_N),
        SH      -> List(N,  RET_SRC_X,  MEM_WR_Y,   MEM_RD_N,   MEM_TYP_16, BitPat(ADD),  ALU_SRC_B,  IMM_S,  IMM_ZE, REG_WR_N),
        SW      -> List(N,  RET_SRC_X,  MEM_WR_Y,   MEM_RD_N,   MEM_TYP_32, BitPat(ADD),  ALU_SRC_B,  IMM_S,  IMM_ZE, REG_WR_N),

        Instructions.ADD     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(ADD),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SUB     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SUB),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SLL     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLL),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SLT     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLT),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SLTU    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLTU), ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.XOR     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(XOR),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SRL     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SRL),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.SRA     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SRA),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.OR      -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(OR),   ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),
        Instructions.AND     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(AND),  ALU_SRC_A,  IMM_X,  IMM_ZE, REG_WR_Y),

        LUI     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(BYPB), ALU_SRC_B,  IMM_U,  IMM_ZE, REG_WR_Y),

        BEQ     -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(EQU),  ALU_SRC_A,  IMM_B,  IMM_ZE, REG_WR_N),
        BNE     -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(NE),   ALU_SRC_A,  IMM_B,  IMM_ZE, REG_WR_N),
        BLT     -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLT),  ALU_SRC_A,  IMM_B,  IMM_SE, REG_WR_N),
        BGE     -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(GEQ),  ALU_SRC_A,  IMM_B,  IMM_SE, REG_WR_N),
        BLTU    -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(SLT),  ALU_SRC_A,  IMM_B,  IMM_ZE, REG_WR_N),
        BGEU    -> List(Y,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(GEQ),  ALU_SRC_A,  IMM_B,  IMM_ZE, REG_WR_N),

        JALR    -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, BitPat(ADD),  ALU_SRC_B,  IMM_I,  IMM_SE, REG_WR_Y),
        JAL     -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, ALU_XXX,      ALU_SRC_B,  IMM_J,  IMM_ZE, REG_WR_Y),

        ECALL   -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, ALU_XXX,      ALU_SRC_A,  IMM_I,  IMM_ZE, REG_WR_N),
        EBREAK  -> List(N,  RET_SRC_A,  MEM_WR_N,   MEM_RD_N,   MEM_TYP_XX, ALU_XXX,      ALU_SRC_A,  IMM_I,  IMM_ZE, REG_WR_N),

    )

    val table: Array[(BitPat, List[UInt])] = RV32I.map{ case (bp,bpL) => (bp, bitPatList2UIntList(bpL))}
}

class DecodeSigs(aluOpWidth: Int = 4)(implicit val p: Parameters) extends MyBundle {
    val isBranch    = Output(Bool())
    val resultSrc   = Output(Bool())
    val memWrEn     = Output(Bool())
    val memRdEn     = Output(Bool())
    val memType     = Output(UInt(3.W))
    val aluOpSel    = Output(UInt(aluOpWidth.W))
    val aluSrc      = Output(Bool())
    val immSrc      = Output(UInt(2.W))
    val immSign     = Output(Bool())
    val regWrEn     = Output(Bool())
}

class Decoder()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val out = Output(new DecodeSigs(aluOpWidth))
    })

    val decodeTable = XDecode.table
    val defaultDecodeTable = XDecode.decodeDefault

    val decodeSigs = ListLookup(io.inst, defaultDecodeTable, decodeTable)

    // TODO： expression ERROR
    // val (pcSrc: Bool) :: (resultSrc: Bool) :: (memWrEn: Bool) :: (memRdEn: Bool) :: memType :: aluOpSel :: (aluSrc: Bool) :: immSrc :: (immSign: Bool) :: (regWrEn: Bool) :: Nil = ctrlSigs

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
    io.out.memWrEn := decodeSigs(2)
    io.out.memRdEn := decodeSigs(3)
    io.out.memType := decodeSigs(4)
    io.out.aluOpSel := decodeSigs(5)
    io.out.aluSrc := decodeSigs(6)
    io.out.immSrc := decodeSigs(7)
    io.out.immSign := decodeSigs(8)
    io.out.regWrEn := decodeSigs(9)
}


