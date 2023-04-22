package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import BusMaster._
import scala.tools.nsc.doc.base.comment.Bold

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
    
    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // decode 
    // send Write data request (load)
    // send read data request (store)
    val s0_latch = io.req.fire
    val s0_full = RegInit(false.B)
    val s0_fire = s0_valid && s1_ready
    val s0_en = Wire(Bool())
    val s0_reqReg = RegEnable(io.req.bits, s0_latch)
    val s0_req = Mux(io.req.fire, io.req.bits, s0_reqReg)
    val s0_offset = s0_req.addr(blockOffsetBits-1, 0)

    io.req.ready := !s0_full //|| s0_fire // TODO:

    when(s0_latch && !(s0_req.lsuOp === LSU_NOP || s0_req.lsuOp === LSU_FENC) ) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B}

    val ((en: Bool) :: (wen: Bool) :: (load: Bool) :: width :: (signed: Bool) :: Nil) = 
        ListLookup(s0_req.lsuOp, default, table)

    s0_en := en
    dontTouch(s0_en)

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
    io.ram.req.valid := !io.excp.storeUnalign && en && s1_ready
    io.ram.req.bits.address := s0_req.addr 
    io.ram.req.bits.data := s0_req.wdata << (s0_offset << 3)
    io.ram.req.bits.opcode := Mux(wen, BusReq.PutFullData, BusReq.Get)
    io.ram.req.bits.source := MASTER_1
    io.ram.req.bits.size := (xlen / 8).U
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

    s0_valid := Hold(io.ram.req.fire, io.ram.req.fire, s0_fire)

    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // read back data (load)
    // waitting for resp (store)
    val s1_full = RegInit(false.B)
    val s1_latch  = s0_valid && s1_ready
    val s1_signed = RegEnable(signed, s1_latch)
    val s1_width  = RegEnable(width, s1_latch)
    val s1_offset = RegEnable(s0_offset, s1_latch)
    val s1_fire = s1_valid

    
    s1_ready := !s1_full || s1_fire

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

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

    s1_valid := io.ram.resp.fire
    io.resp.valid := s1_fire
}

class LsuIO_1()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(DecoupledIO(new LsuReqBundle))
    val resp = DecoupledIO(new LsuRespBundle)
    
    val excp = Output(new LsuStatusBundle)
    
    val cache = Flipped(new Bundle{
        val read = new CacheReadBus
        val write =  new CacheWriteBus
    })
}


class LSU_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LsuIO_1)

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // decode 
    // send Write data request (load)
    // send read data request (store)
    val s0_full = RegInit(false.B)
    val s0_latch = io.req.fire
    val s0_fire = s0_valid && s1_ready
    val s0_en = Wire(Bool())
    val s0_reqReg = RegEnable(io.req.bits, s0_latch)
    val s0_req = Mux(io.req.fire, io.req.bits, s0_reqReg)
    val s0_offset = s0_req.addr(blockOffsetBits-1, 0)
    
    io.req.ready := !s0_full // || s0_fire

    when(s0_latch && !(s0_req.lsuOp === LSU_NOP || s0_req.lsuOp === LSU_FENC)) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    val ((en: Bool) :: (wen: Bool) :: (load: Bool) :: width :: (signed: Bool) :: Nil) = 
        ListLookup(s0_req.lsuOp, default, table)

    s0_en := en
    dontTouch(s0_en)

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

    val s0_reqSend = RegEnable(true.B, false.B, io.cache.read.req.fire || io.cache.write.req.fire)
    when(s0_fire) { s0_reqSend := false.B }
    io.cache.read.req.valid := load && s0_full && !s0_reqSend //!s0_ready //&& !s0_reqSend && s1_ready
    io.cache.read.req.bits.addr := Cat(s0_req.addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))

    io.cache.write.req.valid := wen && s0_full && !s0_reqSend //!s0_ready //&& !s0_reqSend && s1_ready
    io.cache.write.req.bits.addr := Cat(s0_req.addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))
    io.cache.write.req.bits.data := s0_req.wdata << (s0_offset << 3)
    val s0_storeMask = MuxLookup(width, "b1111".U, Seq(
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
    io.cache.write.req.bits.mask := s0_storeMask

    // s0_valid := !s0_ready && ( (io.cache.read.req.fire && load) || (io.cache.write.req.fire && wen) )
    // s0_valid := (Hold(true.B, io.cache.read.req.fire, s0_fire) && load) || (Hold(true.B, io.cache.write.req.fire, s0_fire) && wen)
    s0_valid := io.cache.read.req.fire || io.cache.write.req.fire || s0_reqSend
    
    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // read back data (load)
    // waitting for resp (store)
    val s1_full = RegInit(false.B)
    val s1_latch  = s0_valid && s1_ready
    val s1_fire = s1_valid
    val s1_signed = RegEnable(signed, s1_latch)
    val s1_width  = RegEnable(width, s1_latch)
    val s1_offset = RegEnable(s0_offset, s1_latch)
    
    s1_ready := !s1_full //|| s1_fire
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    io.cache.read.resp.ready := true.B
    io.cache.write.resp.ready := true.B

    val s1_storeRespValid = Hold(io.cache.write.resp.valid, io.cache.write.resp.fire, s1_latch)
    val s1_loadResp = Hold(io.cache.read.resp.bits, io.cache.read.resp.fire, s1_latch)
    val s1_loadRespValid = Hold(io.cache.read.resp.valid, io.cache.read.resp.fire, s1_latch)

    val s1_loadData = MuxLookup(s1_offset, s1_loadResp.data, Seq(
                    0.U -> s1_loadResp.data,
                    1.U -> Cat(Fill(8, 0.U), s1_loadResp.data(xlen-1, 8)),
                    2.U -> Cat(Fill(16, 0.U), s1_loadResp.data(xlen-1, 16)),
                    3.U -> Cat(Fill(24, 0.U), s1_loadResp.data(xlen-1, 24)),
                    // TODO: consider xlen=64
                ))
    dontTouch(s1_loadData)

    io.resp.bits.rdata := MuxLookup(s1_width, s1_loadData, Seq(
                            LS_DATA_BYTE -> Mux(s1_signed, SignExt(s1_loadData(7,0).asSInt, xlen), ZeroExt(s1_loadData(7,0),xlen)),
                            LS_DATA_HALF -> Mux(s1_signed, SignExt(s1_loadData(15,0).asSInt, xlen), ZeroExt(s1_loadData(15,0),xlen)),
                            LS_DATA_WORD -> Mux(s1_signed, SignExt(s1_loadData(31,0).asSInt, xlen), ZeroExt(s1_loadData(31,0),xlen)),
                            // TODO: consider xlen=64 
                        ))

    s1_valid := s1_full && (s1_loadRespValid || s1_storeRespValid)

    io.resp.valid := s1_fire
}