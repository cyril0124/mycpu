package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import BusMaster._

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

sealed class LsuStatusBundle()(implicit val p: Parameters) extends MyBundle {
    val storeUnalign = Bool()
    val loadUnalign = Bool()
}


class LsuReqBundle()(implicit val p: Parameters) extends MyBundle {
    val addr = UInt(xlen.W)
    val wdata = UInt(xlen.W)
    val lsuOp = UInt(LSU_OP_WIDTH.W)
    val hasTrap = Bool()
}

class LsuRespBundle()(implicit val p: Parameters) extends MyBundle {
    val rdata = UInt(xlen.W)
}

class LsuIO()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(DecoupledIO(new LsuReqBundle))
    val resp = DecoupledIO(new LsuRespBundle)
    
    val excp = Output(new LsuStatusBundle)
    
    val ram = new TLMasterBusUL
}

import LsuDecode._

// load store unit
class LSU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LsuIO)

    // ---------------------stage0: Decode, Send Write data request & Send read data request---------------------
    val busy = RegInit(false.B)
    val s0_valid = Wire(Bool())
    val s0_reqReg = RegEnable(io.req.bits, io.req.fire)
    val s0_req = Mux(io.req.fire, io.req.bits, s0_reqReg)
    val offset = s0_req.addr(blockOffsetBits-1, 0)
    val s1_ready  = RegInit(true.B)
    
    io.req.ready := !busy
    busy := !s1_ready

    val ((en: Bool) :: (wen: Bool) :: (load: Bool) :: width :: (signed: Bool) :: Nil) = 
        ListLookup(s0_req.lsuOp, default, table)

    s0_valid := en

    io.excp.storeUnalign := false.B
    io.excp.loadUnalign := false.B

    when(wen) {
        io.excp.storeUnalign := MuxLookup(width, false.B, Seq(
                                    LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
                                    LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
                                    // TODO: consider xlen=64
                                ))
    }
    when(load) {
        io.excp.loadUnalign := MuxLookup(width, false.B, Seq(
                                    LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
                                    LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
                                    // TODO: consider xlen=64
                                ))
    }

    io.ram.req <> DontCare
    io.ram.req.bits.corrupt := true.B
    io.ram.req.valid := !io.excp.storeUnalign && s0_valid
    io.ram.req.bits.address := s0_req.addr 
    io.ram.req.bits.data := s0_req.wdata << (offset << 3)
    io.ram.req.bits.opcode := Mux(wen, BusReq.PutFullData, BusReq.Get)
    io.ram.req.bits.source := MASTER_1
    io.ram.req.bits.mask := MuxLookup(width, "b1111".U, Seq(
        LS_DATA_BYTE -> UIntToOH(s0_req.addr(blockOffsetBits-1, 0)),
        LS_DATA_HALF -> MuxLookup(s0_req.addr(blockOffsetBits-1, 0), "b0011".U, Seq(
                            0.U -> "b0011".U,
                            1.U -> "b0110".U,
                            2.U -> "b1100".U,
                            // 3.U -> unalign addr
                        )),
        LS_DATA_WORD -> "b1111".U,
        // TODO: consider xlen=64
    ))

    // ---------------------stage1: Read back data---------------------
    // val s1_ready  = RegInit(true.B)
    val s1_signed = Reg(Bool())
    val s1_width  = Reg(UInt(LS_DATA_WIDTH.W))
    val s1_offset = Reg(UInt(blockOffsetBits.W))
    val s1_lsuOp  = Reg(UInt(LSU_OP_WIDTH.W))
    when(s0_valid && s1_ready) {
        s1_signed := signed
        s1_offset := offset
        s1_width  := width
        s1_lsuOp  := s0_req.lsuOp
        s1_ready  := false.B
    }
    when(!s0_valid) { s1_lsuOp := LSU_NOP }

    val s1_respReg = RegEnable(io.ram.resp.bits, io.ram.resp.fire)
    val s1_resp = Mux(io.ram.resp.fire, io.ram.resp.bits, s1_respReg)
    io.ram.resp.bits <> DontCare
    io.ram.resp.ready := true.B

    val ramRdData = MuxLookup(s1_offset, s1_resp.data, Seq(
                    0.U -> s1_resp.data,
                    1.U -> Cat(Fill(8, 0.U), s1_resp.data(xlen-1, 8)),
                    2.U -> Cat(Fill(16, 0.U), s1_resp.data(xlen-1, 16)),
                    3.U -> Cat(Fill(24, 0.U), s1_resp.data(xlen-1, 24)),
                    // TODO: consider xlen=64
                ))
    dontTouch(ramRdData)

    io.resp.bits.rdata := MuxLookup(s1_width, ramRdData, Seq(
                            LS_DATA_BYTE -> Mux(s1_signed, SignExt(ramRdData(7,0).asSInt, xlen), ZeroExt(ramRdData(7,0),xlen)),
                            LS_DATA_HALF -> Mux(s1_signed, SignExt(ramRdData(15,0).asSInt, xlen), ZeroExt(ramRdData(15,0),xlen)),
                            LS_DATA_WORD -> Mux(s1_signed, SignExt(ramRdData(31,0).asSInt, xlen), ZeroExt(ramRdData(31,0),xlen)),
                            // TODO: consider xlen=64 
                        ))

    // io.resp.valid := io.ram.resp.valid
    io.resp.valid := (io.ram.resp.fire && s1_lsuOp =/= LSU_NOP && s1_lsuOp =/= LSU_FENC) || s1_lsuOp === LSU_NOP || s1_lsuOp === LSU_FENC
    when(io.resp.valid) { s1_ready := true.B }
}