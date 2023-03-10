package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._

object LsuDecode {
    // data width of load & store instructions
    val LS_DATA_WIDTH = log2Ceil(3)
    val LS_DATA_BYTE = 0.U(LS_DATA_WIDTH.W)
    val LS_DATA_HALF = 1.U(LS_DATA_WIDTH.W)
    val LS_DATA_WORD = 2.U(LS_DATA_WIDTH.W)
        
    val default = 
    //                            en  wen  load     width   signed
    //                             |   |    |         |        |
                              List(N,  N,   N,   LS_DATA_BYTE, N)
    val table = Array(
        BitPat(LSU_LB)   ->   List(Y,  N,   Y,   LS_DATA_BYTE, Y),
        BitPat(LSU_LH)   ->   List(Y,  N,   Y,   LS_DATA_HALF, Y),
        BitPat(LSU_LW)   ->   List(Y,  N,   Y,   LS_DATA_WORD, Y),
        BitPat(LSU_LBU)  ->   List(Y,  N,   Y,   LS_DATA_BYTE, N),
        BitPat(LSU_LHU)  ->   List(Y,  N,   Y,   LS_DATA_HALF, N),
        BitPat(LSU_SB)   ->   List(Y,  Y,   N,   LS_DATA_BYTE, Y),
        BitPat(LSU_SH)   ->   List(Y,  Y,   N,   LS_DATA_HALF, Y),
        BitPat(LSU_SW)   ->   List(Y,  Y,   N,   LS_DATA_WORD, Y),
        BitPat(LSU_FENC) ->   List(N,  N,   N,   LS_DATA_BYTE, N)
    )
}


class LoadIO()(implicit val p: Parameters) extends MyBundle {
    val en = Input(Bool())
    val addr = Input(UInt(xlen.W))
    val memType = Input(UInt(MEM_TYP_WIDTH.W))
    val data = Output(UInt(xlen.W))
    val sign = Input(Bool()) // signed bit 
}

class StoreIO()(implicit val p: Parameters) extends MyBundle {
    val en = Input(Bool())
    val addr = Input(UInt(xlen.W))
    val memType = Input(UInt(MEM_TYP_WIDTH.W))
    val data = Input(UInt(xlen.W)) 
}

sealed class LsuStatusBundle()(implicit val p: Parameters) extends MyBundle {
    val storeUnalign = Bool()
    val loadUnalign = Bool()
}

class LsuIO()(implicit val p: Parameters) extends MyBundle {
    // val load = new LoadIO
    // val store = new StoreIO

    val hasTrap = Input(Bool())
    val addr = Input(UInt(xlen.W))
    val wdata = Input(UInt(xlen.W))
    val data = Output(UInt(xlen.W))
    val lsuOp = Input(UInt(LSU_OP_WIDTH.W))
    val excp = Output(new LsuStatusBundle)
}

import LsuDecode._

// load store unit
class LSU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LsuIO)

    val ram = Module(new ROM())
    ram.io.clock := clock
    ram.io.reset := reset

    val ramRdData = Wire(UInt(xlen.W))
    val signedReg = Reg(Bool())

    val ((en: Bool) :: (wen: Bool) :: (load: Bool) :: width :: (signed: Bool) :: Nil) = 
        ListLookup(io.lsuOp, default, table)


    val blockIdx = Reg(UInt(blockOffsetBits.W))
    when(en) {
        blockIdx := io.addr(blockOffsetBits-1, 0)
        signedReg := signed
    }

    io.excp.storeUnalign := false.B
    io.excp.loadUnalign := false.B

    when(wen) {
        io.excp.storeUnalign := MuxLookup(width, false.B, Seq(
                                    LS_DATA_HALF -> (blockIdx === 3.U),
                                    LS_DATA_WORD -> (blockIdx =/= 0.U),
                                    // TODO: consider xlen=64
                                ))
    }

    when(load) {
        io.excp.loadUnalign := MuxLookup(width, false.B, Seq(
                                    LS_DATA_HALF -> (blockIdx === 3.U),
                                    LS_DATA_WORD -> (blockIdx =/= 0.U),
                                    // TODO: consider xlen=64
                                ))
    }
    
    val ramOffset = "h2000".U
    ram.io.wen := wen && !io.excp.storeUnalign
    ram.io.waddr := io.addr - ramOffset
    ram.io.wdata := io.wdata
    ram.io.wmask := MuxLookup(width, "b1111".U, Seq(
        LS_DATA_BYTE -> UIntToOH(blockIdx),
        LS_DATA_HALF -> MuxLookup(blockIdx, "b0011".U, Seq(
                            0.U -> "b0011".U,
                            1.U -> "b0110".U,
                            2.U -> "b1100".U,
                            // 3.U -> unalign addr
                        )),
        LS_DATA_WORD -> "b1111".U,
        // TODO: consider xlen=64
    ))

    
    ram.io.raddr := io.addr - ramOffset
    ramRdData := MuxLookup(blockIdx, ram.io.rdata, Seq(
                        0.U -> ram.io.rdata,
                        1.U -> Cat(Fill(8, 0.U), ram.io.rdata(xlen-1, 8)),
                        2.U -> Cat(Fill(16, 0.U), ram.io.rdata(xlen-1, 16)),
                        3.U -> Cat(Fill(24, 0.U), ram.io.rdata(xlen-1, 24)),
                        // TODO: consider xlen=64
                    ))

    io.data := MuxLookup(width, ramRdData, Seq(
                            LS_DATA_BYTE -> Mux(signedReg, SignExt(ramRdData(7,0).asSInt, xlen), ramRdData),
                            LS_DATA_HALF -> Mux(signedReg, SignExt(ramRdData(15,0).asSInt, xlen), ramRdData),
                            LS_DATA_WORD -> Mux(signedReg, SignExt(ramRdData(31,0).asSInt, xlen), ramRdData),
                            // TODO: consider xlen=64 
                        ))

}