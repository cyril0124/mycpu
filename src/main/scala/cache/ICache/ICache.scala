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
import chisel3.internal.firrtl.Ref


class ICacheReadReq()(implicit val p: Parameters) extends MyBundle{
    val addr = UInt(xlen.W)
}

class ICacheReadResp()(implicit val p: Parameters) extends MyBundle{
    val data = UInt(ilen.W)
    // val inst = Vec(icacheRdWays, UInt(ilen.W))
    // val size = UInt(log2Ceil(icacheRdWays).W)
}

class ICacheReadBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new ICacheReadReq))
    val resp = Decoupled(new ICacheReadResp)
}

class ICacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new ICacheReadBus
    val tlbus = new TLMasterBusUL
}


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
    
    val loadQueueEntries = 8
    val loadQueue = Module(new Queue(new StageInfo, entries = loadQueueEntries, flow = true))
    val refillBuffer = Module(new RefillBuffer(loadQueueEntries / 2))

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // read databank & directory
    val s0_full = RegInit(false.B)
    val s0_latch = io.read.req.fire
    val s0_fire = s0_valid && loadQueue.io.enq.fire
    val s0_req = Mux(io.read.req.fire, io.read.req.bits, RegEnable(io.read.req.bits, s0_latch))

    io.read.req.ready := loadQueue.io.enq.ready
    
    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    db.io.read.req.valid := s0_latch || s0_full
    db.io.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_req.addr)
    db.io.read.req.bits.set := addrToDCacheSet(s0_req.addr)

    dir.io.read.req.valid := s0_latch || s0_full
    dir.io.read.req.bits.addr := s0_req.addr

    s0_valid := s0_full

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
    // 


    loadQueue.io.deq.ready := s1_ready
    val s1_full = RegInit(false.B)
    val s1_latch = loadQueue.io.deq.valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_info = RegEnable(loadQueue.io.deq.bits, s1_latch)
    s1_ready := !s1_full || s1_fire
    
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    val bypassVec = refillBuffer.io.read.cacheLineAddr.zip(refillBuffer.io.read.valids).map{ case(a, v) => a === addrToDCacheBlockAddr(s1_info.req.addr) && v}
    val s1_bypass = Cat(bypassVec).orR && s1_full && !s1_info.dirInfo.hit
    val s1_bypassIdx = OHToUInt(Cat(bypassVec.reverse))
    val s1_bypassData = Mux1H(addrToDCacheBlockOH(s1_info.req.addr), refillBuffer.io.read.cacheLineData(s1_bypassIdx))
    dontTouch(s1_bypassData)

    refillPipe.io.req.valid := !s1_info.dirInfo.hit && s1_full && !s1_bypass
    refillPipe.io.req.bits.addr := s1_info.req.addr
    refillPipe.io.req.bits.chosenWay := s1_info.dirInfo.chosenWay

    s1_valid := s1_full && ( s1_info.dirInfo.hit && io.read.resp.fire || 
                        !s1_info.dirInfo.hit && refillPipe.io.req.fire && !s1_bypass ||
                        !s1_info.dirInfo.hit && s1_bypass && io.read.resp.fire
                    )
    
    // s1_valid := s1_full && ( s1_info.dirInfo.hit && io.read.resp.fire || 
    //                 !s1_info.dirInfo.hit && refillPipe.io.req.fire 
    //             )

    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage2 is final stage
    val s2_addr = RegEnable(s1_info.req.addr, s2_latch)
    val s2_dirInfo = RegEnable(s1_info.dirInfo, s2_latch)
    val s2_bypass = RegEnable(s1_bypass, s2_latch)
    s2_ready := !s2_full || s2_fire

    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    
    refillBuffer.io.write.valid := io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAckData
    refillBuffer.io.write.bits.data := io.tlbus.resp.bits.data
    refillBuffer.io.write.bits.cacheLineAddr := s2_addr
    dontTouch(refillBuffer.io)

    s2_valid := s2_full && (s2_dirInfo.hit || !s2_dirInfo.hit && io.read.resp.fire || s2_bypass)


    io.read.resp.valid := s1_info.dirInfo.hit && s1_full || 
                            !s2_dirInfo.hit && s2_full && refillPipe.io.resp.fire ||
                            s1_bypass && !s1_info.dirInfo.hit && s1_full
    io.read.resp.bits.data := Mux(s1_info.dirInfo.hit,
                                    Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData),
                                    Mux(s1_bypass, 
                                        s1_bypassData,  // bypass from refill buffer
                                        refillPipe.io.resp.bits.data
                                    )
                                ) 
    refillPipe.io.resp.ready := io.read.resp.ready

    // io.read.resp.valid := s1_info.dirInfo.hit && s1_full || 
    //                         !s2_dirInfo.hit && s2_full && refillPipe.io.resp.fire
    // io.read.resp.bits.data := Mux(s1_info.dirInfo.hit, 
    //                                 Mux1H(s1_info.dirInfo.chosenWay, s1_info.rdData), 
    //                                 refillPipe.io.resp.bits.data
    //                             ) 
    // refillPipe.io.resp.ready := io.read.resp.ready

    io.tlbus.resp.ready := true.B
    io.tlbus.req.bits.source := MASTER_0

}

object ICacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the ICache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ICache()(defaultConfig), Array("--target-dir", "build"))
}
