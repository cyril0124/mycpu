package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMaster._

class StorePipe()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val store = new CacheWriteBus
        val dir = Flipped(new DirectoryIO)
        val dataBank = Flipped(new DataBankArrayIO) 
        val mshr =  Decoupled(new MissReq)
    })
    // io <> DontCare

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // -------------------------------------------------------------------------------- 
    // read directory & databank
    val s0_full = RegInit(false.B)
    val s0_latch = io.store.req.fire 
    val s0_fire = s0_valid && s1_ready
    val s0_reqReg = RegEnable(io.store.req.bits, s0_latch)
    val s0_wAddr = Mux(s0_latch, io.store.req.bits.addr, s0_reqReg.addr)
    val s0_wSet = addrToDCacheSet(s0_wAddr)
    val s0_dataBlockSelOH = addrToDCacheBlockOH(s0_wAddr)

    io.store.req.ready := !s0_full //|| s0_fire
    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    // read directory
    io.dir.read.req.valid := s0_latch || s0_full
    io.dir.read.req.bits.addr := s0_wAddr
    // read databank
    io.dataBank.read.req.valid := s0_latch || s0_full
    io.dataBank.read.req.bits.set := addrToDCacheSet(s0_wAddr)

    val s0_dirInfo = io.dir.read.resp.bits

    val s0_rdDataAll = io.dataBank.read.resp

    val s0_validReg = RegInit(false.B)
    when(s0_latch) { s0_validReg := true.B }
    .elsewhen(s0_fire) { s0_validReg := false.B }
    s0_valid := (RegNext(s0_latch) || s0_validReg)  && io.dir.read.req.fire && io.dataBank.read.req.fire

    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // write databank & directory (store hit)
    // alloc MSHR (store miss)
    val s1_full = RegInit(false.B)
    val s1_latch = s0_valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_reqReg = RegEnable(s0_reqReg, s1_latch)
    val s1_wAddr = s1_reqReg.addr
    val s1_wSet = addrToDCacheSet(s1_wAddr)
    val s1_dataBlockSelOH = addrToDCacheBlockOH(s1_wAddr)
    val s1_blockSel = addrToDCacheBlockOH(s1_wAddr)
    val s1_rdDataAll = RegEnable(s0_rdDataAll, s1_latch) // all ways of data
    val s1_dirInfo = RegEnable(s0_dirInfo, s1_latch)
    val s1_isHit = s1_dirInfo.hit
    val s1_chosenWayOH = s1_dirInfo.chosenWay
    val s1_rdBlockData = Mux1H(s1_dirInfo.chosenWay, s1_rdDataAll) // all blocks of data within a chosenWay
    val s1_rdData = Mux1H(s1_blockSel, s1_rdBlockData)
    val s1_tagRdVec = RegEnable(io.dir.read.resp.bits.tagRdVec, s1_latch)
    val s1_dirtyTag      = Mux1H(s1_chosenWayOH, s1_tagRdVec)

    s1_ready := !s1_full || s1_fire
    when(s1_latch) { s1_full := true.B } 
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    io.mshr.valid := !s1_isHit && s1_full
    io.mshr.bits <> DontCare
    io.mshr.bits.addr := s1_wAddr
    io.mshr.bits.dirInfo := s1_dirInfo
    io.mshr.bits.dirtyTag := s1_dirtyTag
    io.mshr.bits.data := s1_rdBlockData // writeback data
    io.mshr.bits.isStore := true.B
    io.mshr.bits.storeData := s1_reqReg.data
    io.mshr.bits.storeMask := s1_reqReg.mask

    io.dir.write.req.valid := s1_isHit && s1_full
    io.dir.write.req.bits <> DontCare
    io.dir.write.req.bits.addr := s1_wAddr
    val meta = Wire(new DCacheMeta)
    meta.dirty := true.B
    meta.valid := true.B
    io.dir.write.req.bits.meta := meta.asUInt
    io.dir.write.req.bits.way := s1_chosenWayOH

    io.dataBank.write.req.valid := s1_isHit && s1_full
    io.dataBank.write.req.bits <> DontCare
    io.dataBank.write.req.bits.blockSelOH := s1_dataBlockSelOH
    io.dataBank.write.req.bits.set := s1_wSet
    io.dataBank.write.req.bits.way := s1_chosenWayOH
    io.dataBank.write.req.bits.data := dcacheMergeData(s1_rdData, s1_reqReg.data, s1_reqReg.mask)



    s1_valid := s1_full && (
                    !s1_isHit && io.mshr.fire ||
                    s1_isHit && io.dataBank.write.req.fire && io.dir.write.req.fire
                )
    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    // send store resp (store hit)
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage2 is final stage
    val s2_isHit = RegEnable(s1_isHit, s2_latch)
    
    s2_ready := !s2_full || s2_fire
    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    io.store.resp.valid := s2_isHit && s2_full
    io.store.resp.bits <> DontCare

    s2_valid := io.store.resp.fire && s2_full && s2_isHit || !s2_isHit

}