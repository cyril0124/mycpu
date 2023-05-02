package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._
import mycpu.common.consts.LsuOp._
import LsuDecode._
import BusMaster._
import FUType._

class LSUStageIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val opr1 = UInt(OPR_WIDTH.W)
        val opr2 = UInt(OPR_WIDTH.W)
        val lsuOp = UInt(LSU_OP_WIDTH.W)
        val immSrc = UInt(IMM_TYP_WIDTH.W)

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W)

        val id = UInt(8.W)
    }))
    val out = Decoupled(new Bundle{
        val data = UInt(xlen.W)
        val rd = UInt(5.W)
        val wrEn = Bool()

        val inst = UInt(ilen.W)
        val pc = UInt(xlen.W) 

        val id = UInt(8.W)
    })
    val rfRd = Vec(2, Flipped(new ReadPort(UInt(xlen.W))))
    val rfRdReady = Input(Bool())
    val cache = Flipped(new Bundle{
        val read = new CacheReadBus
        val write =  new CacheWriteBus
    })
    val flush = Input(Bool())
}


class LSUStage()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LSUStageIO)
    io <> DontCare

    val s0_valid, s0_ready = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool()) 
    val s2_valid, s2_ready = Wire(Bool()) 

    io.in.ready := s0_ready

    // --------------------------------------------------------------------------------
    // Stage 0
    // --------------------------------------------------------------------------------
    // Read oprand & Generate imm
    val s0_latch = io.in.valid && s0_ready
    val s0_full = RegInit(false.B)
    val s0_fire = s0_valid & s1_ready
    val s0_info = RegEnable(io.in.bits, s0_latch)
    s0_ready := !s0_full || s0_fire

    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_fire && s0_full) { s0_full := false.B }

    val s0_rs1 = InstField(s0_info.inst, "rs1")
    val s0_rs2 = InstField(s0_info.inst, "rs2")
    val s0_rd = InstField(s0_info.inst, "rd")
    // val rf_rs1 = Mux(s0_info.opr1 === OPR_REG1, s0_rs1, 0.U) 
    // val rf_rs2 = Mux(s0_info.opr2 === OPR_REG2, s0_rs2, 0.U) 

    val nLSU = LSU.litValue.toInt
    val s0_rsVec = VecInit(s0_rs1, s0_rs2)
    val s0_rsValVec = VecInit(Seq.fill(2)(WireInit(0.U(xlen.W)))) 
    (0 to 1).foreach{ i => 
        io.rfRd(i).en := s0_full
        io.rfRd(i).addr := s0_rsVec(i)
        s0_rsValVec(i) := io.rfRd(i).data
    }

    val immGen = Module(new ImmGen)
    val s0_imm = immGen.io.imm
    immGen.io.immSrc := s0_info.immSrc
    immGen.io.immSign := IMM_SE
    immGen.io.inst := s0_info.inst

    val s0_addr = s0_imm + s0_rsValVec(0)

    s0_valid := s0_full && ( (s0_info.lsuOp =/= LSU_FENC && io.rfRdReady) || (s0_info.lsuOp === LSU_FENC && io.out.fire))

    // --------------------------------------------------------------------------------
    // Stage 1
    // --------------------------------------------------------------------------------
    // Send cache req
    val s1_latch = s0_valid && s1_ready
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid && s2_ready
    val s1_lsuOp = RegEnable(s0_info.lsuOp, s1_latch)
    val s1_rd = RegEnable(s0_rd, s1_latch)
    val s1_rsValVec = RegEnable(s0_rsValVec, s1_latch)
    val s1_imm = RegEnable(s0_imm, s1_latch)
    val s1_addr = RegEnable(s0_addr, s1_latch)
    val s1_pc = RegEnable(s0_info.pc, s1_latch)
    val s1_inst = RegEnable(s0_info.inst, s1_latch)
    val s1_wdata = s1_rsValVec(1) // rs2
    val s1_offset = s1_addr(blockOffsetBits-1, 0)
    val s1_id = RegEnable(s0_info.id, s1_latch)
    s1_ready := !s1_full || s1_fire

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_fire && s1_full) { s1_full := false.B }

    val ((s1_en: Bool) :: (s1_wen: Bool) :: (s1_load: Bool) :: s1_width :: (s1_signed: Bool) :: Nil) = 
        ListLookup(s1_lsuOp, default, table)

    // when(wen) {
    //     io.excp.storeUnalign := MuxLookup(width, false.B, Seq(
    //                                 LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
    //                                 LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
    //                                 // TODO: consider xlen=64
    //                             ))
    // }
    // when(load) {
    //     io.excp.loadUnalign := MuxLookup(width, false.B, Seq(
    //                                 LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
    //                                 LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
    //                                 // TODO: consider xlen=64
    //                             ))
    // }

    val s1_reqSend = RegInit(false.B)
    when(s1_fire) { s1_reqSend := false.B }
    .elsewhen(io.cache.read.req.fire || io.cache.write.req.fire) { s1_reqSend := true.B }
    

    io.cache.read.req.valid := s1_load && s1_full && !s1_reqSend && !io.flush
    io.cache.read.req.bits.addr := Cat(s1_addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))

    io.cache.write.req.valid := s1_wen && s1_full && !s1_reqSend && !io.flush
    io.cache.write.req.bits.addr := Cat(s1_addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))
    io.cache.write.req.bits.data := s1_wdata << (s1_offset << 3)
    val s1_storeMask = MuxLookup(s1_width, "b1111".U, Seq(
        LS_DATA_BYTE -> UIntToOH(s1_addr(blockOffsetBits-1, 0)),
        LS_DATA_HALF -> MuxLookup(s1_addr(blockOffsetBits-1, 0), "b0011".U, Seq(
                            0.U -> "b0011".U,
                            1.U -> "b0110".U,
                            2.U -> "b1100".U,
                            // 3.U -> unalign addr
                        )),
        LS_DATA_WORD -> "b1111".U,
        // TODO: consider xlen=64
    ))
    io.cache.write.req.bits.mask := s1_storeMask
    
    s1_valid := s1_full && (io.cache.read.req.fire || io.cache.write.req.fire || s1_reqSend) 
    
    // --------------------------------------------------------------------------------
    // Stage 2
    // --------------------------------------------------------------------------------
    // Receive cache resp
    val s2_latch = s1_valid && s2_ready
    val s2_full = RegInit(false.B)
    val s2_fire = s2_valid && io.out.ready
    val s2_load = RegEnable(s1_load, s2_latch)
    val s2_en = RegEnable(s1_en, s2_latch)
    val s2_signed = RegEnable(s1_signed, s2_latch)
    val s2_width  = RegEnable(s1_width, s2_latch)
    val s2_offset = RegEnable(s1_offset, s2_latch)
    val s2_pc = RegEnable(s1_pc, s2_latch)
    val s2_inst = RegEnable(s1_inst, s2_latch)
    val s2_rd = InstField(s2_inst, "rd")
    val s2_id = RegEnable(s1_id, s2_latch)
    s2_ready := !s2_full || s2_fire

    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_fire && s2_full) { s2_full := false.B }

    io.cache.read.resp.ready := true.B
    io.cache.write.resp.ready := true.B

    val s2_loadResp = Hold(io.cache.read.resp.bits, io.cache.read.resp.fire, s2_latch)
    val s2_storeRespValid = Hold(io.cache.write.resp.valid, io.cache.write.resp.fire, s2_latch)
    val s2_loadRespValid = Hold(io.cache.read.resp.valid, io.cache.read.resp.fire, s2_latch)

    val s2_loadDataRaw = MuxLookup(s2_offset, s2_loadResp.data, Seq(
                    0.U -> s2_loadResp.data,
                    1.U -> Cat(Fill(8, 0.U), s2_loadResp.data(xlen-1, 8)),
                    2.U -> Cat(Fill(16, 0.U), s2_loadResp.data(xlen-1, 16)),
                    3.U -> Cat(Fill(24, 0.U), s2_loadResp.data(xlen-1, 24)),
                    // TODO: consider xlen=64
                ))
    val s2_loadData = MuxLookup(s2_width, s2_loadDataRaw, Seq(
                            LS_DATA_BYTE -> Mux(s2_signed, SignExt(s2_loadDataRaw(7,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(7,0),xlen)),
                            LS_DATA_HALF -> Mux(s2_signed, SignExt(s2_loadDataRaw(15,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(15,0),xlen)),
                            LS_DATA_WORD -> Mux(s2_signed, SignExt(s2_loadDataRaw(31,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(31,0),xlen)),
                            // TODO: consider xlen=64 
                        ))

    s2_valid := s2_full && (s2_loadRespValid || s2_storeRespValid)

    val s0_fence = s0_full && s0_info.lsuOp === LSU_FENC
    io.out.valid := s2_valid && s2_en || s0_fence
    io.out.bits.data := s2_loadData
    io.out.bits.pc := Mux(s0_fence, s0_info.pc, s2_pc)
    io.out.bits.inst := Mux(s0_fence, s0_info.inst, s2_inst)
    io.out.bits.rd := s2_rd
    io.out.bits.wrEn := Mux(s0_fence, false.B, s2_load && s2_en)
    io.out.bits.id := Mux(s0_fence, s0_info.id, s2_id)


    when(io.flush) {
        s0_full := false.B
        s1_full := false.B
        s2_full := false.B
    }
}


class LSUStageIO_1()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val lsuOp = UInt(LSU_OP_WIDTH.W)
        val immSrc = UInt(IMM_TYP_WIDTH.W)
        val rs1Val = UInt(xlen.W)
        val rs2Val = UInt(xlen.W)

        val inst = UInt(ilen.W)
        val id = UInt(8.W)
    }))
    val out = Decoupled(new Bundle{
        val rd = UInt(5.W)
        val data = UInt(xlen.W)
        val id = UInt(8.W)
    })
    val cache = Flipped(new Bundle{
        val read = new CacheReadBus
        val write =  new CacheWriteBus
    })
    val rob = Flipped(Valid(new LSUQueueROBInput))
    val flush = Input(Bool())
}


class LSUStage_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new LSUStageIO_1)
    io <> DontCare

    val s0_valid, s0_ready = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool()) 
    val s2_valid, s2_ready = Wire(Bool()) 

    io.in.ready := s0_ready

    val lsuQueueEntry = 4
    val lsuQueue = Module(new LSUQueue(lsuQueueEntry))
    lsuQueue.io.rob <> io.rob
    lsuQueue.io.flush := io.flush

    // --------------------------------------------------------------------------------
    // Stage 0
    // --------------------------------------------------------------------------------
    // Read oprand & Generate imm
    val s0_latch = io.in.valid && s0_ready
    val s0_full = RegInit(false.B)
    val s0_fire = s0_valid & lsuQueue.io.enq.ready
    val s0_info = RegEnable(io.in.bits, s0_latch)
    val op = s0_info.lsuOp
    val rd = InstField(s0_info.inst, "rd")
    val s0_rd = Mux(op === LSU_SW || op === LSU_SH || op === LSU_SB || op === LSU_FENC, 0.U, rd)
    s0_ready := !s0_full || s0_fire

    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_fire && s0_full) { s0_full := false.B }

    val immGen = Module(new ImmGen)
    val s0_imm = immGen.io.imm
    val s0_addr = s0_imm + s0_info.rs1Val
    immGen.io.immSrc := s0_info.immSrc
    immGen.io.immSign := IMM_SE
    immGen.io.inst := s0_info.inst
    
    val s0_decInfo = WireInit(0.U.asTypeOf(new LSUDecodeInfo))
    val ((en: Bool) :: (wen: Bool) :: (load: Bool) :: width :: (signed: Bool) :: Nil) = 
        ListLookup(s0_info.lsuOp, default, table)
    s0_decInfo.en := en
    s0_decInfo.wen := wen
    s0_decInfo.load := load
    s0_decInfo.wd := width
    s0_decInfo.signed := signed

    s0_valid := s0_full && ( s0_info.lsuOp =/= LSU_FENC || (s0_info.lsuOp === LSU_FENC && io.out.fire) )

    
    lsuQueue.io.enq.valid := s0_valid
    lsuQueue.io.enq.bits.addr := s0_addr
    lsuQueue.io.enq.bits.decInfo := s0_decInfo
    lsuQueue.io.enq.bits.id := s0_info.id
    lsuQueue.io.enq.bits.rd := s0_rd
    lsuQueue.io.enq.bits.rs2Val := s0_info.rs2Val

    lsuQueue.io.deq.ready := s1_ready
    // --------------------------------------------------------------------------------
    // Stage 1
    // --------------------------------------------------------------------------------
    // Send cache req
    val s1_latch = lsuQueue.io.deq.valid && s1_ready
    val s1_full = RegInit(false.B)
    val s1_fire = s1_valid && s2_ready
    val s1_rd = RegEnable(lsuQueue.io.deq.bits.rd, s1_latch)
    val s1_rs2Val = RegEnable(lsuQueue.io.deq.bits.rs2Val, s1_latch)
    val s1_addr = RegEnable(lsuQueue.io.deq.bits.addr, s1_latch)
    val s1_wdata = s1_rs2Val 
    val s1_offset = s1_addr(blockOffsetBits-1, 0)
    val s1_id = RegEnable(lsuQueue.io.deq.bits.id, s1_latch)
    val s1_decInfo = RegEnable(lsuQueue.io.deq.bits.decInfo, s1_latch)
    s1_ready := ( !s1_full ) && s2_ready
    // s1_ready := ( !s1_full || s1_fire ) && s2_ready

    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_fire && s1_full) { s1_full := false.B }

    val s1_en = s1_decInfo.en
    val s1_wen = s1_decInfo.wen
    val s1_load = s1_decInfo.load
    val s1_width = s1_decInfo.wd
    val s1_signed = s1_decInfo.signed

    // when(wen) {
    //     io.excp.storeUnalign := MuxLookup(width, false.B, Seq(
    //                                 LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
    //                                 LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
    //                                 // TODO: consider xlen=64
    //                             ))
    // }
    // when(load) {
    //     io.excp.loadUnalign := MuxLookup(width, false.B, Seq(
    //                                 LS_DATA_HALF -> (s0_req.addr(blockOffsetBits-1, 0) === 3.U),
    //                                 LS_DATA_WORD -> (s0_req.addr(blockOffsetBits-1, 0) =/= 0.U),
    //                                 // TODO: consider xlen=64
    //                             ))
    // }

    val s1_reqSend = RegInit(false.B)
    when(s1_fire) { s1_reqSend := false.B }
    .elsewhen(io.cache.read.req.fire || io.cache.write.req.fire) { s1_reqSend := true.B }
    
    // TODO: enable load FIFO
    io.cache.read.req.valid := s1_load && s1_full && !s1_reqSend && !io.flush
    io.cache.read.req.bits.addr := Cat(s1_addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))

    io.cache.write.req.valid := s1_wen && s1_full && !s1_reqSend && !io.flush
    io.cache.write.req.bits.addr := Cat(s1_addr(xlen-1, blockOffsetBits), Fill(blockOffsetBits, 0.U))
    io.cache.write.req.bits.data := s1_wdata << (s1_offset << 3)
    val s1_storeMask = MuxLookup(s1_width, "b1111".U, Seq(
        LS_DATA_BYTE -> UIntToOH(s1_addr(blockOffsetBits-1, 0)),
        LS_DATA_HALF -> MuxLookup(s1_addr(blockOffsetBits-1, 0), "b0011".U, Seq(
                            0.U -> "b0011".U,
                            1.U -> "b0110".U,
                            2.U -> "b1100".U,
                            // 3.U -> unalign addr
                        )),
        LS_DATA_WORD -> "b1111".U,
        // TODO: consider xlen=64
    ))
    io.cache.write.req.bits.mask := s1_storeMask
    
    s1_valid := s1_full && (io.cache.read.req.fire || io.cache.write.req.fire || s1_reqSend) 
    
    // --------------------------------------------------------------------------------
    // Stage 2
    // --------------------------------------------------------------------------------
    // Receive cache resp
    val s2_latch = s1_valid && s2_ready
    val s2_full = RegInit(false.B)
    val s2_fire = s2_valid && io.out.fire
    val s2_rd = RegEnable(s1_rd, s2_latch)
    val s2_load = RegEnable(s1_load, s2_latch)
    val s2_en = RegEnable(s1_en, s2_latch)
    val s2_signed = RegEnable(s1_signed, s2_latch)
    val s2_width  = RegEnable(s1_width, s2_latch)
    val s2_offset = RegEnable(s1_offset, s2_latch)
    val s2_id = RegEnable(s1_id, s2_latch)
    s2_ready := !s2_full || s2_fire

    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_fire && s2_full) { s2_full := false.B }

    val s2_loadResp = Hold(io.cache.read.resp.bits, io.cache.read.resp.fire, s2_latch)
    val s2_storeRespValid = Hold(io.cache.write.resp.valid, io.cache.write.resp.fire, s2_latch)
    val s2_loadRespValid = Hold(io.cache.read.resp.valid, io.cache.read.resp.fire, s2_latch)

    val s2_loadDataRaw = MuxLookup(s2_offset, s2_loadResp.data, Seq(
                    0.U -> s2_loadResp.data,
                    1.U -> Cat(Fill(8, 0.U), s2_loadResp.data(xlen-1, 8)),
                    2.U -> Cat(Fill(16, 0.U), s2_loadResp.data(xlen-1, 16)),
                    3.U -> Cat(Fill(24, 0.U), s2_loadResp.data(xlen-1, 24)),
                    // TODO: consider xlen=64
                ))
    val s2_loadData = MuxLookup(s2_width, s2_loadDataRaw, Seq(
                            LS_DATA_BYTE -> Mux(s2_signed, SignExt(s2_loadDataRaw(7,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(7,0),xlen)),
                            LS_DATA_HALF -> Mux(s2_signed, SignExt(s2_loadDataRaw(15,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(15,0),xlen)),
                            LS_DATA_WORD -> Mux(s2_signed, SignExt(s2_loadDataRaw(31,0).asSInt, xlen), ZeroExt(s2_loadDataRaw(31,0),xlen)),
                            // TODO: consider xlen=64 
                        ))

    s2_valid := s2_full && (s2_loadRespValid || s2_storeRespValid)

    
    val s0_fence = s0_full && s0_info.lsuOp === LSU_FENC

    io.cache.read.resp.ready := s2_load && !s0_fence
    io.cache.write.resp.ready := !s2_load && !s0_fence

    io.out.valid := s2_valid && s2_en || s0_fence
    io.out.bits.rd := s2_rd
    io.out.bits.data := s2_loadData
    io.out.bits.id := Mux(s0_fence, s0_info.id, s2_id)


    when(io.flush) {
        s0_full := false.B
        s1_full := false.B
        s2_full := false.B
    }

}
