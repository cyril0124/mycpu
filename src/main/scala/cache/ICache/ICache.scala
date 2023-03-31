package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

import mycpu.BusReq._
import mycpu.BusMaster._
import dataclass.data
import chisel3.util.random.LFSR
import scala.tools.cmd.Meta

class ICacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new CacheReadBus
    val tlbus = new TLMasterBusUL
}

// class ICache()(implicit val p: Parameters) extends MyModule {
//     val io = IO(new ICacheIO)
//     io <> DontCare

//     val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
//     val setBits = log2Ceil(dcacheSets)
//     val metaBits = (new DCacheMeta).getWidth
//     println("----------ICache info----------")
//     println(s" cacheSize: ${cacheSize} Byte")
//     println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
//     println(s" byteOffsetBits: ${dcacheByteOffsetBits}")
//     println(s" blockBits: ${dcacheBlockBits}")
//     println(s" setBits: ${dcacheSetBits}")
//     println(s" tagBits: ${dcacheTagBits}")


//     val db = Module(new DataBankArray)
//     val dir = Module(new DCacheDirectory)
//     val refillPipe = Module(new RefillPipe)

//     refillPipe.io.resp.ready := true.B
//     refillPipe.io.dataWrite.req <> db.io.write.req
//     refillPipe.io.dirWrite.req <> dir.io.write.req
//     refillPipe.io.tlbus <> io.tlbus

//     // val loadQueue = Module(new Queue(new StageInfo, entries = 4, flow = true))
//     val loadQueue = Module(new LoadQueue(new StageInfo, flow = false))

//     class PendingMissReq extends Bundle{
//         val addr = UInt(xlen.W)
//         val chosenWay = UInt(dcacheWays.W)
//         val valid = Bool()
//     }

//     // --------------------------------------------------------------------------------
//     // stage 0
//     // --------------------------------------------------------------------------------
//     val s0_valid = Wire(Bool())
//     val s1_valid, s1_ready = Wire(Bool())
//     val s2_valid, s2_ready = Wire(Bool())

//     val s0_full = RegInit(false.B)
//     val s0_latch = io.read.req.fire
//     val s0_fire = s0_valid && loadQueue.io.enq.fire
//     val s0_req = Mux(io.read.req.fire, io.read.req.bits, RegEnable(io.read.req.bits, s0_latch))

//     io.read.req.ready := loadQueue.io.enq.ready
    
//     when(s0_latch) { s0_full := true.B }
//     .elsewhen(s0_full && s0_fire) { s0_full := false.B }

//     db.io.read.req.valid := s0_latch || s0_full
//     db.io.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_req.addr)
//     db.io.read.req.bits.set := addrToDCacheSet(s0_req.addr)

//     dir.io.read.req.valid := s0_latch || s0_full
//     dir.io.read.req.bits.addr := s0_req.addr

//     s0_valid := s0_full

//     // --------------------------------------------------------------------------------
//     // loadQueue
//     // --------------------------------------------------------------------------------

//     class StageInfo extends Bundle{
//         val req = chiselTypeOf(io.read.req.bits)
//         val dirInfo = chiselTypeOf(dir.io.read.resp.bits)
//         val rdCacheLine = chiselTypeOf(db.io.read.resp.bits.blockData)
//         val rdData = chiselTypeOf(db.io.read.resp.bits.data)
//     }

//     loadQueue.io.enq.valid := s0_valid
//     loadQueue.io.enq.bits.dirInfo := dir.io.read.resp.bits
//     loadQueue.io.enq.bits.req := s0_req
//     loadQueue.io.enq.bits.rdCacheLine := db.io.read.resp.bits.blockData
//     loadQueue.io.enq.bits.rdData := db.io.read.resp.bits.data
//     loadQueue.io.inAddr := s0_req.addr
    
//     loadQueue.io.refillInfo.reqAddr := refillPipe.io.req.bits.addr
//     loadQueue.io.refillInfo.reqFire := Mux(refillPipe.io.req.fire, true.B, RSLatch(refillPipe.io.req.fire, refillPipe.io.resp.fire))
//     loadQueue.io.refillInfo.respFire := refillPipe.io.resp.fire
//     dontTouch(loadQueue.io)

//     // --------------------------------------------------------------------------------
//     // stage 1
//     // --------------------------------------------------------------------------------
//     loadQueue.io.deq.ready := s1_ready
//     val s1_full = RegInit(false.B)
//     val s1_latch = loadQueue.io.deq.valid && s1_ready
//     val s1_fire = s1_valid && s2_ready
//     val s1_info = RegEnable(loadQueue.io.deq.bits, s1_latch)
//     s1_ready := !s1_full || s1_fire

    
//     when(s1_latch) { s1_full := true.B }
//     .elsewhen(s1_full && s1_fire) { s1_full := false.B }

//     refillPipe.io.req.valid := !s1_info.dirInfo.hit && s1_full
//     refillPipe.io.req.bits.addr := s1_info.req.addr
//     refillPipe.io.req.bits.chosenWay := s1_info.dirInfo.chosenWay

//     s1_valid := s1_full && ( s1_info.dirInfo.hit && io.read.resp.fire || 
//                             !s1_info.dirInfo.hit && refillPipe.io.req.fire
//                         )

//     // --------------------------------------------------------------------------------
//     // stage 2
//     // --------------------------------------------------------------------------------
//     val s2_full = RegInit(false.B)
//     val s2_latch = s1_valid && s2_ready
//     val s2_fire = s2_valid // stage2 is final stage
//     val s2_dirInfo = RegEnable(s1_info.dirInfo, s2_latch)
//     s2_ready := !s2_full || s2_fire

//     when(s2_latch) { s2_full := true.B }
//     .elsewhen(s2_full && s2_fire) { s2_full := false.B }

//     s2_valid := s2_full && (s2_dirInfo.hit || !s2_dirInfo.hit && io.read.resp.fire)


//     io.read.resp.valid := s1_info.dirInfo.hit && s1_full || 
//                             !s2_dirInfo.hit && s2_full && refillPipe.io.resp.fire
//     io.read.resp.bits.data := Mux(s1_info.dirInfo.hit, 
//                                     Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData), 
//                                     refillPipe.io.resp.bits.data
//                                 ) 
//     refillPipe.io.resp.ready := io.read.resp.ready


//     io.tlbus.resp.ready := true.B
//     io.tlbus.req.bits.source := MASTER_0

// }


class ICache()(implicit val p: Parameters) extends MyModule {
    val io = IO(new ICacheIO)
    io <> DontCare

    val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
    val setBits = log2Ceil(dcacheSets)
    val metaBits = (new DCacheMeta).getWidth
    println("----------ICache info----------")
    println(s" cacheSize: ${cacheSize} Byte")
    println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
    println(s" byteOffsetBits: ${dcacheByteOffsetBits}")
    println(s" blockBits: ${dcacheBlockBits}")
    println(s" setBits: ${dcacheSetBits}")
    println(s" tagBits: ${dcacheTagBits}")


    val db = Module(new DataBankArray)
    val dir = Module(new DCacheDirectory)
    val refillPipe = Module(new RefillPipe)

    refillPipe.io.resp.ready := true.B
    refillPipe.io.dataWrite.req <> db.io.write.req
    refillPipe.io.dirWrite.req <> dir.io.write.req
    refillPipe.io.tlbus <> io.tlbus

    val loadQueue = Module(new Queue(new StageInfo, entries = 4, flow = true))

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())
    // val s1_conflict = Wire(Bool())
    // val s1_conflictWay = Wire(UInt(dcacheWays.W))

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    val s0_full = RegInit(false.B)
    val s0_latch = io.read.req.fire
    val s0_fire = s0_valid && loadQueue.io.enq.fire
    val s0_req = Mux(io.read.req.fire, io.read.req.bits, RegEnable(io.read.req.bits, s0_latch))

    io.read.req.ready := loadQueue.io.enq.ready
    
    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    // val s0_dbRead = WireInit(0.U.asTypeOf(chiselTypeOf(db.io.read.req)))
    // s0_dbRead.valid := s0_latch || s0_full
    // s0_dbRead.bits.blockSelOH := addrToDCacheBlockOH(s0_req.addr)
    // s0_dbRead.bits.set := addrToDCacheSet(s0_req.addr)

    db.io.read.req.valid := s0_latch || s0_full
    db.io.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_req.addr)
    db.io.read.req.bits.set := addrToDCacheSet(s0_req.addr)

    dir.io.read.req.valid := s0_latch || s0_full
    dir.io.read.req.bits.addr := s0_req.addr

    s0_valid := s0_full
    // s0_valid := s0_full && RegNext(s0_dbRead.fire)

    // --------------------------------------------------------------------------------
    // loadQueue
    // --------------------------------------------------------------------------------

    class StageInfo extends Bundle{
        val req = chiselTypeOf(io.read.req.bits)
        val dirInfo = chiselTypeOf(dir.io.read.resp.bits)
        val rdCacheLine = chiselTypeOf(db.io.read.resp.bits.blockData)
        val rdData = chiselTypeOf(db.io.read.resp.bits.data)
    }

    loadQueue.io.enq.valid := s0_valid
    loadQueue.io.enq.bits.dirInfo := dir.io.read.resp.bits
    loadQueue.io.enq.bits.req := s0_req
    loadQueue.io.enq.bits.rdCacheLine := db.io.read.resp.bits.blockData
    loadQueue.io.enq.bits.rdData := db.io.read.resp.bits.data

    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    loadQueue.io.deq.ready := s1_ready
    val s1_full = RegInit(false.B)
    val s1_latch = loadQueue.io.deq.valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_info = RegEnable(loadQueue.io.deq.bits, s1_latch)
    s1_ready := !s1_full || s1_fire

    
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    refillPipe.io.req.valid := !s1_info.dirInfo.hit && s1_full
    refillPipe.io.req.bits.addr := s1_info.req.addr
    refillPipe.io.req.bits.chosenWay := s1_info.dirInfo.chosenWay

    s1_valid := s1_full && ( s1_info.dirInfo.hit && io.read.resp.fire || 
                        !s1_info.dirInfo.hit && refillPipe.io.req.fire
                    )

    // s1_valid := s1_full && ( s1_info.dirInfo.hit && io.read.resp.fire || 
    //                         !s1_info.dirInfo.hit && refillPipe.io.req.fire && !s1_conflict ||
    //                         !s1_info.dirInfo.hit && s1_conflict && io.read.resp.fire
    //                     )

    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage2 is final stage
    val s2_addr = RegEnable(s1_info.req.addr, s2_latch)
    val s2_dirInfo = RegEnable(s1_info.dirInfo, s2_latch)
    // val s2_conflict = RegEnable(s1_conflict, s2_latch)
    // val s2_conflictWay = RegEnable(s1_conflictWay, s2_latch)
    s2_ready := !s2_full || s2_fire

    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    def addrConflict(a: UInt, b: UInt): Bool = {
        a(xlen-1, dcacheByteOffsetBits + dcacheBlockBits) === b(xlen-1, dcacheByteOffsetBits + dcacheBlockBits)
    }
    // s1_conflict := addrConflict(s1_info.req.addr, s2_addr) && !s2_dirInfo.hit
    // s1_conflictWay := s2_dirInfo.chosenWay 

    // val s2_dbRead = WireInit(0.U.asTypeOf(chiselTypeOf(db.io.read.req)))
    // s2_dbRead.valid := s2_conflict
    // s2_dbRead.bits.set := addrToDCacheSet(s2_addr)
    // s2_dbRead.bits.blockSelOH := addrToDCacheBlockOH(s2_addr)

    s2_valid := s2_full && (s2_dirInfo.hit || !s2_dirInfo.hit && io.read.resp.fire)


    io.read.resp.valid := s1_info.dirInfo.hit && s1_full || 
                            !s2_dirInfo.hit && s2_full && refillPipe.io.resp.fire
    io.read.resp.bits.data := Mux(s1_info.dirInfo.hit, 
                                    Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData), 
                                    refillPipe.io.resp.bits.data
                                ) 
    refillPipe.io.resp.ready := io.read.resp.ready

    // io.read.resp.valid := s1_info.dirInfo.hit && s1_full || 
    //                         !s2_dirInfo.hit && s2_full && refillPipe.io.resp.fire && !s2_conflict ||
    //                         !s2_dirInfo.hit && s2_full && db.io.read.resp.fire && s2_conflict
    // io.read.resp.bits.data := Mux(s1_info.dirInfo.hit, 
    //                                 Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData), 
    //                                 Mux(s2_conflict, Mux1H(s2_conflictWay, db.io.read.resp.bits.data), refillPipe.io.resp.bits.data)
    //                             ) 
    // refillPipe.io.resp.ready := io.read.resp.ready


    // val dbReadArb = Module(new Arbiter(chiselTypeOf(db.io.read.req.bits), 2))
    // dbReadArb.io.in(0).bits := s2_dbRead.bits
    // dbReadArb.io.in(0).valid := s2_dbRead.valid
    // s2_dbRead.ready := dbReadArb.io.in(1).ready
    // dbReadArb.io.in(1).bits := s0_dbRead.bits
    // dbReadArb.io.in(1).valid := s0_dbRead.valid
    // s0_dbRead.ready := dbReadArb.io.in(1).ready
    // db.io.read.req <> dbReadArb.io.out

    io.tlbus.resp.ready := true.B
    io.tlbus.req.bits.source := MASTER_0

}