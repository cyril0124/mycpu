package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


import mycpu.BusReq._
import mycpu.BusMaster._
import dataclass.data
import chisel3.util.random.LFSR
import scala.tools.cmd.Meta

class CacheReadReq()(implicit val p: Parameters) extends MyBundle{
    val addr = UInt(xlen.W)
    val memType = UInt(3.W)
}

class CacheReadResp()(implicit val p: Parameters) extends MyBundle{
    val data = UInt(xlen.W)
    val stageID = UInt(2.W)
}

class CacheReadBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new CacheReadReq))
    val resp = Decoupled(new CacheReadResp)
}

class CacheWriteReq()(implicit val p: Parameters) extends MyBundle{
    val addr = UInt(xlen.W)
    val data = UInt(xlen.W)
    // val memType = UInt(3.W)
    val mask = UInt(blockBytes.W) 
}

class CacheWriteResp()(implicit val p: Parameters) extends MyBundle{
    val status = Bool()
    val stageID = UInt(2.W)
}

class CacheWriteBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new CacheWriteReq))
    val resp = Decoupled(new CacheWriteResp)
}

class DCacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new CacheReadBus
    val write = new CacheWriteBus

    val tlbus = new TLMasterBusUL
}

object ReplacePolicy{
    def apply(policy: String = "random", nrWay: Int = 4): UInt = {
        val outputWay = WireInit(0.U(nrWay.W))
        if(policy == "random") {
            val lfsr = LFSR(nrWay*2)
            outputWay := UIntToOH(lfsr(log2Ceil(nrWay)-1, 0), nrWay)
        }
        outputWay
    }
}

// TODO:
/*      [read hit]  [read miss]  [write hit]  [write miss(not dirty)]  [write miss(dirty)(writeback)]
    s0:     *           *            *                 *                      * (->PutFullData)
    s1:                 *            *                 *                      * (<-AccessACk)
    s2:                                                *                      * (->Get)
    s3:                                                                       * (<-AccessAckData)
    s4:                                                                       * (write data)
*/

// class DCache()(implicit val p: Parameters) extends MyModule {
//     val io = IO(new DCacheIO)
    
//     // local param
//     val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
//     val setBits = log2Ceil(dcacheSets)
//     val metaBits = (new DCacheMeta).getWidth
//     println("----------DCache info----------")
//     println(s" cacheSize: ${cacheSize} Byte")
//     println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
//     println(s" blockOffsetBits: ${dcacheByteOffsetBits}")
//     println(s" setBits: ${dcacheSetBits}")
//     println(s" tagBits: ${dcacheTagBits}")
    
//     val r = io.read
//     val w = io.write
    
//     // sub module instantiate
//     // val tagArrays = Seq.fill(dcacheBanks)(Module(new SRAMTemplate(dcacheTagBits * dcacheWays, dcacheSets, dcacheWays)))
//     val tagArray = Module(new TagArray(UInt(dcacheTagBits.W), dcacheSets, dcacheWays, dcacheBanks))
//     tagArray.init()
//     tagArray.io.read.resp.ready := true.B
//     // val metaArrays = Seq.fill(dcacheBanks)(Module(new SRAMTemplate(width = metaBits * dcacheWays, depth = dcacheSets, maskSegments = dcacheWays)))
//     val metaArray = Module(new MetaArray(new DCacheMeta, dcacheSets, dcacheWays, dcacheBanks))
//     metaArray.init()
//     metaArray.io.read.resp.ready := true.B
//     // val dataBanks = Seq.fill(dcacheBanks)(Module(new DataBank(UInt((dcacheBlockBytes * 8).W), dcacheSets, dcacheWays)))
//     val dataBankArray = Module(new DataBankArray)
//     dataBankArray.init()

// // --------------------------stage 0: read cache info(handshake)-------------------------------
//     val busy = RegInit(false.B)
//     r.req.ready := ~busy
//     w.req.ready := ~busy

//     val s0_rReq = Mux(r.req.fire, r.req.bits, RegEnable(r.req.bits, r.req.fire))
//     val s0_rAddr = s0_rReq.addr
//     val s0_rSet = addrToDCacheSet(s0_rAddr)//s0_rAddr(setBits + dcacheByteOffsetBits + dcacheBankBits - 1, dcacheByteOffsetBits + dcacheBankBits)
//     val s0_rTag = addrToDCacheTag(s0_rAddr)//s0_rAddr(xlen - 1, dcacheSetBits + dcacheByteOffsetBits + dcacheBankBits)
//     val s0_rMemType = s0_rReq.memType
//     val s0_rValidReg = RegEnable(true.B, false.B, r.req.fire)
//     val s0_rValid = Mux(r.req.fire, true.B, s0_rValidReg)

//     val s0_wReq = Mux(w.req.fire, w.req.bits, RegEnable(w.req.bits, w.req.fire))
//     val s0_wAddr = s0_wReq.addr
//     val s0_wSet = s0_wAddr(setBits + dcacheByteOffsetBits + dcacheBankBits - 1, dcacheByteOffsetBits + dcacheBankBits)
//     val s0_wTag = s0_wAddr(xlen - 1, dcacheSetBits + dcacheByteOffsetBits + dcacheBankBits)
//     val s0_wMask = s0_wReq.mask
//     val s0_wData = s0_wReq.data
//     val s0_wValidReg = RegEnable(true.B, false.B, w.req.fire)
//     val s0_wValid = Mux(w.req.fire, true.B, s0_wValidReg)

//     val s0_rwValid = s0_rValid || s0_wValid

//     val s0_rwSet = Mux(s0_rValid, s0_rSet, s0_wSet)
//     val s0_rwTag = Mux(s0_rValid, s0_rTag, s0_wTag)
//     val s0_rwAddr = Mux(s0_rValid, s0_rAddr, s0_wAddr)

//     val s0_dataBankSelOH = UIntToOH(s0_rAddr(dcacheBankBits + dcacheByteOffsetBits - 1, dcacheByteOffsetBits))

//     val s0_tagRdVec = Wire(Vec(dcacheWays, UInt(dcacheTagBits.W)))
//     val s0_metaRdVec = Wire(Vec(dcacheWays, new DCacheMeta))
//     val s0_dataBankRdData = WireInit(0.U((dcacheBlockBytes * 8).W))

//     when(r.req.fire || w.req.fire) { 
//         busy := true.B 
//     }

//     // for(i <- 0 until dcacheBanks) {
//         // tagArrays(i).io.r.en := s0_rwValid && s0_dataBankSelOH(i)
//         // tagArrays(i).io.r.addr := s0_rwSet
//         // metaArrays(i).io.r.en := s0_rwValid && s0_dataBankSelOH(i)
//         // metaArrays(i).io.r.addr := s0_rwSet
//     // }
//     // val tagArrayRdDatas = WireInit(VecInit((0 until dcacheBanks).map{ i => 
//     //                                 tagArrays(i).io.r.data.asTypeOf(Vec(dcacheWays, UInt(dcacheTagBits.W)))
//     //                             })
//     // //                         )
//     // val metaArrayRdDatas = WireInit(VecInit((0 until dcacheBanks).map{ i => 
//     //                             metaArrays(i).io.r.data.asTypeOf(Vec(dcacheWays, new DCacheMeta))
//     //                         })
//     //                     )
//     // s0_tagRdVec := Mux1H(s0_dataBankSelOH.asBools, tagArrayRdDatas)
//     // s0_metaRdVec := Mux1H(s0_dataBankSelOH.asBools, metaArrayRdDatas)

//     s0_metaRdVec := metaArray.read(s0_rwSet, s0_dataBankSelOH, s0_rwValid)
//     s0_tagRdVec := tagArray.read(s0_rwSet, s0_dataBankSelOH, s0_rwValid)

//     // hit or miss
//     val tagMatchVec = s0_tagRdVec.map( t => t === s0_rwTag )
//     val metaValidVec = s0_metaRdVec.map( m => m.valid )
//     val metaDirtyVec = s0_metaRdVec.map( m => m.dirty ) // TODO: dirty
//     val matchWayOH = Cat(tagMatchVec.zip(metaValidVec).map{ case(t, m) => t && m }.reverse) // reverse is necessary when Cat an OneHot code
//     val invalidWayVec = s0_metaRdVec.map( m => m.valid === false.B )
//     val invalidWayOH = PriorityMux(invalidWayVec.zipWithIndex.map(x => x._1 -> UIntToOH(x._2.U, dcacheWays)) )
//     val hasInvalidWay = Cat(invalidWayVec).orR
//     val replaceWay = ReplacePolicy("random") // "b0100".U // TODO： replace policy... PLRU
//     val s0_isHit = Cat(matchWayOH).orR && (s0_rValidReg || s0_wValidReg) //s0_rwValid 
//     val s0_choseWayOH = Mux(s0_isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWay))
//     val s0_isDirtyWay = ( s0_choseWayOH & Cat(metaDirtyVec.reverse) & Cat(metaValidVec.reverse) ).orR && s0_rwValid // the chosen way is a dirty and valid way
//     val s0_wbWrHit = s0_isHit && s0_wValid

//     // for(i <- 0 until dcacheBanks) {
//     //     dataBanks(i).io.r.en :=  s0_rValid && s0_dataBankSelOH(i)
//     //     dataBanks(i).io.r.set := s0_rSet
//     // }

//     // val s0_dataBankRdDataAll = WireInit(VecInit((0 until dcacheBanks).map{ i => dataBanks(i).io.r.data}))
//     // s0_dataBankRdData := Mux1H(s0_choseWayOH, Mux1H(s0_dataBankSelOH.asBools, s0_dataBankRdDataAll))

//     val s0_dataBankRdDataAll = dataBankArray.io.read.resp.bits.data
//     dataBankArray.read(s0_rSet, s0_rValid)
//     s0_dataBankRdData := Mux1H(s0_choseWayOH, Mux1H(s0_dataBankSelOH, s0_dataBankRdDataAll))
    
//     val s0_wrHit = s0_wValidReg && s0_isHit
//     when(s0_wrHit) {
//         s0_wValidReg := false.B
//     }

//     val s0_rdHit = s0_rValidReg && s0_isHit
//     when(r.resp.fire && s0_rdHit) {
//         s0_rValidReg := false.B
//     }

//     val s1_ready = RegInit(true.B)
//     val s0_readyToSend = (s0_rValidReg || s0_wValidReg) && s1_ready && !s0_isHit

//     val s0_beatCounter = new Counter(dcacheBanks)
//     val s0_beatOH = UIntToOH(s0_beatCounter.value)
//     val s0_lastBeat = s0_beatCounter.value === (dcacheBanks-1).U

//     val s0_valid =  s0_rValidReg && !s0_isHit && io.tlbus.req.fire || // read miss
//                 s0_wValidReg && s0_isHit  || // write hit
//                 s0_wValidReg && !s0_isHit && io.tlbus.req.fire ||
//                 // s0_wValidReg && !s0_isDirtyWay && !s0_isHit && io.tlbus.req.fire || // write miss (not dirty)
//                 s0_wValidReg && s0_isDirtyWay && !s0_isHit && s0_lastBeat && io.tlbus.req.fire // write miss (dirty way)

//     when(!s0_lastBeat && io.tlbus.req.fire) {
//         s0_beatCounter.inc()
//     }
//     when(s0_valid) {
//         s0_beatCounter.reset()
//     }

// // ----------------------------------miss process-------------------------------------------------------------
// // --------------------------stage 1: get resp from next level memory && writeback to cache-------------------------------
//     val s1_latch = WireInit(false.B)
    
//     val s1_ReqValid = RegEnable(s0_valid, s1_latch)
//     val s1_rwAddr = RegEnable(s0_rwAddr, s1_latch)
//     val s1_rwSet = RegEnable(s0_rwSet, s1_latch)
//     val s1_wSet = RegEnable(s0_wSet, s1_latch)
//     val s1_rwTag = s1_rwAddr(xlen - 1, dcacheSetBits + dcacheByteOffsetBits + dcacheBankBits)
//     val s1_isDirtyWay = RegEnable(s0_isDirtyWay, s1_latch)
//     val s1_isHit = RegEnable(s0_isHit, s1_latch)
//     val s1_wbWrHit = RegEnable(s0_isHit && s0_wValidReg, s1_latch)
//     val s1_chosenWayOH = RegEnable(s0_choseWayOH, s1_latch)
//     val s1_dataBankSelOH = RegEnable(s0_dataBankSelOH, s1_latch)
//     val s1_wData = RegEnable(s0_wData, s1_latch)
//     val s1_wValid = RegEnable(s0_wValidReg, s1_latch) 
//     val s1_wMask = RegEnable(s0_wMask, s1_latch)

//     val s1_putResp = io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck
//     val s1_readyToSend = RegEnable(true.B, false.B, io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck)
//     when(io.tlbus.req.fire) { s1_readyToSend := false.B }

//     s1_latch := s0_valid && s1_ready 

//     when(s1_latch) { 
//         s1_ready := false.B 
//         s0_rValidReg := false.B
//         s0_wValidReg := false.B
//     }

//     io.tlbus.resp.ready := true.B // always ready for the resp since we enter stage1 only when tlbus req is fired.
    
//     val s1_refillFire = io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAckData
//     val s1_refillMessage = Mux(s1_refillFire, io.tlbus.resp.bits, RegEnable(io.tlbus.resp.bits, s1_refillFire))
//     val s1_refillData = s1_refillMessage.data

//     val s1_beatCounter = new Counter(dcacheBanks)
//     val s1_beatOH = UIntToOH(s1_beatCounter.value)
//     val s1_lastBeat = s1_beatCounter.value === (dcacheBanks-1).U

//     when(!s1_lastBeat && s1_refillFire) {
//         s1_beatCounter.inc()
//     }
//     when(s1_latch || s1_readyToSend) {
//         s1_beatCounter.reset()
//         s1_readyToSend := false.B
//     }


//     val s1_refillBankDataArray = RegInit(VecInit((0 until dcacheBanks).map{i => 0.U((dcacheBlockBytes*8).W)}))
//     when(s1_refillFire) { s1_refillBankDataArray(s1_beatCounter.value) := s1_refillData }
    
//     val s1_refillBankData = WireInit(VecInit((0 until dcacheBanks).map{ i => if(i != dcacheBanks-1) s1_refillBankDataArray(i) else s1_refillData }))
//     val s1_readRespData = Mux1H(s1_dataBankSelOH, s1_refillBankData)
//     val s1_refillDone = (s1_refillFire && !s1_isHit && s1_lastBeat) 
    
//     when(r.resp.fire) {
//         s1_ready := true.B
//         busy := false.B
//     }

//     when(w.resp.fire && s1_wbWrHit) {
//         s1_ready := true.B
//         s1_wbWrHit := false.B
//         busy := false.B
//     }

//     // val s1_valid = s1_refillDone && s1_wValid && !s1_isDirtyWay || 
//     //                 s1_wValid && s1_isDirtyWay && !s1_isHit && io.tlbus.resp.fire // write miss dirty get resp in stage1
//     val s1_valid =  s1_wValid && !s1_isDirtyWay && s1_refillDone|| 
//                     s1_wValid && s1_isDirtyWay && s1_refillDone


// // --------------------------stage 2: writeback cache when write cache operation is miss and already get resp data in stage1-------------------------------
//     val s2_latch = WireInit(false.B)
//     val s2_ready = RegInit(true.B)
//     val s2_wData = RegEnable(s1_wData, s2_latch)
//     val s2_wSet = RegEnable(s1_wSet, s2_latch)
//     val s2_dataBankSelOH = RegEnable(s1_dataBankSelOH, s2_latch)
//     val s2_chosenWayOH = RegEnable(s1_chosenWayOH, s2_latch)
//     val s2_writeback = !s2_ready
//     val s2_wMask = RegEnable(s1_wMask, s2_latch)
//     val s2_rwAddr = RegEnable(s1_rwAddr, s2_latch)

//     s2_latch := s1_valid && s2_ready
//     when(s2_latch) {
//         s1_ready := true.B
//         s1_readyToSend := false.B
//         s2_ready := false.B
//     }

//     when(s2_writeback) { // TODO: s2_ready will be reset when data is already write back to Cache.
//         s2_ready := true.B // TODO: Here we assume that we always write back data within one cycle and it should be optimized later.
//         busy := false.B
//     }

    

//     // TODO: write and read priority arbiter to enable pipeline access
//     for(i <- 0 until dcacheBanks) { 
//         // tag write
//         // tagArrays(i).io.w.en := s1_refillFire && s1_beatOH(i)
//         // tagArrays(i).io.w.addr := s1_rwSet
//         // tagArrays(i).io.w.mask.get := s1_chosenWayOH
//         // val tagWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U(dcacheTagBits.W)))
//         // for(i <- 0 until dcacheWays) { tagWrData(i) := Mux(s1_chosenWayOH(i), s1_rwTag, 0.U) }
//         // tagArrays(i).io.w.data := tagWrData.asUInt

//         // tagArray.write(s1_rwSet, s1_chosenWayOH, s1_beatOH, s1_refillFire, tagWrData.asUInt)

//         // meta write
//         // TODO: when writeback data we should update MetaArray !!! dirty and valid
//         // metaArrays(i).io.w.en := s1_refillFire && s1_beatOH(i)      || 
//         //                         s2_writeback && s2_dataBankSelOH(i) || 
//         //                         s1_wbWrHit && s1_dataBankSelOH(i)
//         // metaArrays(i).io.w.addr := Mux(s1_wbWrHit, s1_wSet, Mux(s2_writeback, s2_wSet, s1_rwSet))
//         val metaWrWayOH = Mux(s1_wbWrHit, s1_chosenWayOH, Mux(s2_writeback, s2_chosenWayOH, s1_chosenWayOH))
//         // metaArrays(i).io.w.mask.get := metaWrWayOH
//         val metaArrayWrData = Wire(new DCacheMeta)
//         metaArrayWrData.valid := Mux(s1_refillFire, true.B, Mux(s2_writeback, true.B, false.B))
//         metaArrayWrData.dirty := Mux(s1_wbWrHit || s2_writeback, true.B, false.B)
//         val metaWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U(metaBits.W)))
//         for(i <- 0 until dcacheWays) { metaWrData(i) := Mux(metaWrWayOH(i), metaArrayWrData.asUInt, 0.U) }
//         // metaArrays(i).io.w.data := metaWrData.asUInt

//         metaArray.io.write.req.valid := s1_refillFire || s2_writeback || s1_wbWrHit
//         metaArray.io.write.req.bits.set := Mux(s1_wbWrHit, s1_wSet, Mux(s2_writeback, s2_wSet, s1_rwSet))
//         metaArray.io.write.req.bits.bankSel := Mux(s1_refillFire, s1_beatOH, Mux(s2_writeback, s2_dataBankSelOH, s1_dataBankSelOH))
//         metaArray.io.write.req.bits.way := metaWrWayOH
//         metaArray.io.write.req.bits.data := metaWrData.asUInt
        

//         // dataBanks write
//         // dataBanks(i).io.w.en :=     (s1_wbWrHit && s1_dataBankSelOH(i))    || 
//         //                             (s1_refillFire && s1_beatOH(i))        ||
//         //                             (s2_writeback && s2_dataBankSelOH(i))
//         // dataBanks(i).io.w.set := Mux(s1_wbWrHit, 
//         //                                 s1_wSet, 
//         //                                 Mux(s2_writeback, 
//         //                                     s2_wSet, 
//         //                                     s1_rwSet
//         //                                 ) 
//         //                         )
//         // dataBanks(i).io.w.way := Mux(s1_wbWrHit,
//         //                                 OHToUInt(s1_chosenWayOH),
//         //                                 Mux(s2_writeback, 
//         //                                     OHToUInt(s2_chosenWayOH), 
//         //                                     OHToUInt(s1_chosenWayOH)
//         //                                 )
//         //                         )
//         // dataBanks(i).io.w.data := Mux(s1_wbWrHit, 
//         //                                 s1_wData,
//         //                                 Mux(s2_writeback, 
//         //                                     s2_wData, 
//         //                                     s1_refillData
//         //                                 )
//         //                             ) 
//         // dataBanks(i).io.w.mask := Mux(s1_wbWrHit, 
//         //                                 s1_wMask, 
//         //                                 Mux(s2_writeback, 
//         //                                     s2_wMask, 
//         //                                     Fill(dcacheBlockBytes, 1.U)
//         //                                 ) // ! miss and refill data should replace whole cache line
//         //                             )

        
//     }
//     val tagWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U(dcacheTagBits.W)))
//     for(i <- 0 until dcacheWays) { tagWrData(i) := Mux(s1_chosenWayOH(i), s1_rwTag, 0.U) }
//     tagArray.write(s1_rwSet, s1_chosenWayOH, s1_beatOH, s1_refillFire, tagWrData.asUInt)

//     dataBankArray.io.write.req.valid := s1_wbWrHit || s1_refillFire || s2_writeback
//     dataBankArray.io.write.req.bits.bankSelOH := Mux(s1_wbWrHit, s1_dataBankSelOH, Mux(s2_writeback, s2_dataBankSelOH, s1_beatOH))
//     dataBankArray.io.write.req.bits.set := Mux(s1_wbWrHit, 
//                                                 s1_wSet, 
//                                                 Mux(s2_writeback, 
//                                                     s2_wSet, 
//                                                     s1_rwSet
//                                                 ) 
//                                             )
//     dataBankArray.io.write.req.bits.way := Mux(s1_wbWrHit,
//                                             OHToUInt(s1_chosenWayOH),
//                                             Mux(s2_writeback, 
//                                                 OHToUInt(s2_chosenWayOH), 
//                                                 OHToUInt(s1_chosenWayOH)
//                                             )
//                                         )
//     dataBankArray.io.write.req.bits.data := Mux(s1_wbWrHit, 
//                                     s1_wData,
//                                     Mux(s2_writeback, 
//                                         s2_wData, 
//                                         s1_refillData
//                                     )
//                                 ) 
//     dataBankArray.io.write.req.bits.mask := Mux(s1_wbWrHit, 
//                                     s1_wMask, 
//                                     Mux(s2_writeback, 
//                                         s2_wMask, 
//                                         Fill(dcacheBlockBytes, 1.U)
//                                     ) // ! miss and refill data should replace whole cache line
//                                 )

    
//     io.tlbus.req <> DontCare
//     when(s0_isDirtyWay && !s0_isHit || s1_isDirtyWay && !s1_isHit) { 
//         io.tlbus.req <> DontCare
//         io.tlbus.req.valid := s0_readyToSend || s1_readyToSend
//         io.tlbus.req.bits.opcode := Mux(s1_readyToSend, Get, PutFullData)
//         io.tlbus.req.bits.source := MASTER_1
//         io.tlbus.req.bits.size := (dcacheBanks * dcacheBlockBytes).U
//         io.tlbus.req.bits.mask := Fill(dcacheWays, 1.U)
//         io.tlbus.req.bits.corrupt := false.B
//         io.tlbus.req.bits.data := Mux1H(s0_choseWayOH,  Mux1H(UIntToOH(s0_beatCounter.value), s0_dataBankRdDataAll))
//             // Mux1H(UIntToOH(s0_beatCounter.value), s0_dataBankRdDataAll) //s0_dataBankRdData
//         io.tlbus.req.bits.address := Cat(s0_rwAddr(xlen-1, dcacheByteOffsetBits + dcacheBankBits), s0_beatCounter.value, Fill(dcacheByteOffsetBits, 0.U))
//     }.elsewhen(!s0_isHit){
//         io.tlbus.req.valid := s0_readyToSend
//         io.tlbus.req.bits <> DontCare
//         io.tlbus.req.bits.address := Cat(s0_rwAddr(xlen-1, dcacheByteOffsetBits), Fill(dcacheByteOffsetBits, 0.U)) // dcacheTagBits + dcacheSetBits + dcacheBankBits
//         io.tlbus.req.bits.opcode := Get
//         io.tlbus.req.bits.size := (dcacheBanks * dcacheBlockBytes).U
//         io.tlbus.req.bits.source := MASTER_1
//         io.tlbus.req.bits.mask := Fill(dcacheWays, 1.U)
//         io.tlbus.req.bits.corrupt := false.B
//     }

//     // send cache read resp
//     r.resp.valid := s0_isHit && s0_rValid || s1_refillDone && !s1_wValid
//     r.resp.bits.data := Mux(s0_isHit, s0_dataBankRdData, s1_readRespData)

//     w.resp.valid := s1_wbWrHit || s2_writeback
//     w.resp.bits.status := true.B // indicates whether write operation is success
// }

class DCache_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DCacheIO)
    // io.read <> DontCare
    // io.write <> DontCare

    val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
    val setBits = log2Ceil(dcacheSets)
    val metaBits = (new DCacheMeta).getWidth
    println("----------DCache info----------")
    println(s" cacheSize: ${cacheSize} Byte")
    println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
    println(s" byteOffsetBits: ${dcacheByteOffsetBits}")
    println(s" blockBits: ${dcacheBlockBits}")
    println(s" setBits: ${dcacheSetBits}")
    println(s" tagBits: ${dcacheTagBits}")

    val loadPipe = Module(new LoadPipe)
    val storePipe = Module(new StorePipe)


    val dataBankArray = Module(new DataBankArray)
    val directory = Module(new DCacheDirectory)

    // loadPipe.io.load <> io.read
    // loadPipe.io.dataBank <> dataBankArray.io
    // loadPipe.io.dir <> directory.io
    // io.tlbus <> loadPipe.io.tlbus

    // loadPipe.io.load <> io.read
    // loadPipe.io.dataBank <> DontCare
    // loadPipe.io.dir <> DontCare
    // loadPipe.io.tlbus <> DontCare
    

    // storePipe.io.store <> io.write
    // storePipe.io.dataBank <> dataBankArray.io
    // storePipe.io.dir <> directory.io
    // io.tlbus <> storePipe.io.tlbus

    // storePipe.io.store <> io.write
    // storePipe.io.dataBank <> DontCare
    // storePipe.io.dir <> DontCare 
    // storePipe.io.tlbus <> DontCare 
    // io.tlbus <> storePipe.io.tlbus


    loadPipe.io.load <> io.read
    loadPipe.io.dataBank.read.resp <> dataBankArray.io.read.resp
    loadPipe.io.dir.read.resp <> directory.io.read.resp
    loadPipe.io.tlbus.resp <> io.tlbus.resp

    storePipe.io.store <> io.write
    storePipe.io.dataBank.read.resp <> dataBankArray.io.read.resp
    storePipe.io.dir.read.resp <> directory.io.read.resp
    storePipe.io.tlbus.resp <> io.tlbus.resp
    

    val tlbusPendingOpcode = RegInit(0.U(4.W))
    val tlbusPendingAck = RegInit(false.B)
    val tlbusReqBeatCounter = RegInit(0.U(log2Ceil(dcacheBlockSize).W))
    val tlbusRespBeatCounter = RegInit(0.U(log2Ceil(dcacheBlockSize).W))
    when(io.tlbus.req.fire) {
        tlbusReqBeatCounter := tlbusReqBeatCounter + 1.U
        tlbusRespBeatCounter := 0.U
    }.elsewhen(io.tlbus.resp.fire) {
        tlbusReqBeatCounter := 0.U
        tlbusRespBeatCounter := tlbusRespBeatCounter + 1.U
    }

    when(io.tlbus.req.fire) {
        tlbusPendingAck := true.B
    }.elsewhen(io.tlbus.resp.fire && tlbusPendingOpcode === PutFullData) {
        tlbusPendingAck := false.B
    }.elsewhen(io.tlbus.resp.fire && tlbusPendingOpcode === Get && tlbusRespBeatCounter =/= dcacheBlockSize.U) {
        tlbusPendingAck := false.B
    }

    val storeReq = storePipe.io.tlbus.req
    val loadReq = loadPipe.io.tlbus.req
    when(storeReq.valid && (
            (storeReq.bits.opcode === Get && !tlbusPendingAck) ||
            (storeReq.bits.opcode === PutFullData && tlbusReqBeatCounter =/= dcacheBlockSize.U)
        )
    ) {
        io.tlbus.req.valid := storeReq.valid
        io.tlbus.req.bits <> storeReq.bits
        storeReq.ready := io.tlbus.req.ready
        loadReq.ready := false.B

        tlbusPendingOpcode := storeReq.bits.opcode
    }.elsewhen(loadReq.valid && (
            (loadReq.bits.opcode === Get && !tlbusPendingAck) ||
            (loadReq.bits.opcode === PutFullData && tlbusReqBeatCounter =/= dcacheBlockSize.U)
        )
    ) {
        io.tlbus.req.valid := loadReq.valid
        io.tlbus.req.bits <> loadReq.bits
        loadReq.ready := io.tlbus.req.ready
        storeReq.ready := false.B

        tlbusPendingOpcode := loadReq.bits.opcode
    }.otherwise{
        io.tlbus.req <> DontCare
        storeReq.ready := false.B
        loadReq.ready := false.B
    }
    
    
    // store > load
    val dataBankReadReqArb = Module(new Arbiter(chiselTypeOf(dataBankArray.io.read.req.bits), 2))
    dataBankReadReqArb.io.in(0) <> storePipe.io.dataBank.read.req
    dataBankReadReqArb.io.in(1) <> loadPipe.io.dataBank.read.req
    dataBankArray.io.read.req <> dataBankReadReqArb.io.out

    val dataBankWriteReqArb = Module(new Arbiter(chiselTypeOf(dataBankArray.io.write.req.bits), 2))
    dataBankWriteReqArb.io.in(0) <> storePipe.io.dataBank.write.req
    dataBankWriteReqArb.io.in(1) <> loadPipe.io.dataBank.write.req
    dataBankArray.io.write.req <> dataBankWriteReqArb.io.out

    val dirReadReqArb = Module(new Arbiter(chiselTypeOf(directory.io.read.req.bits), 2))
    dirReadReqArb.io.in(0) <> storePipe.io.dir.read.req
    dirReadReqArb.io.in(1) <> loadPipe.io.dir.read.req
    directory.io.read.req <> dirReadReqArb.io.out

    val dirWriteReqArb = Module(new Arbiter(chiselTypeOf(directory.io.write.req.bits), 2))
    dirWriteReqArb.io.in(0) <> storePipe.io.dir.write.req
    dirWriteReqArb.io.in(1) <> loadPipe.io.dir.write.req
    directory.io.write.req <> dirWriteReqArb.io.out
}



object DCacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the DCache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCache_1()(defaultConfig), Array("--target-dir", "build"))
    // (new chisel3.stage.ChiselStage).emitVerilog(new DCacheDataBank(UInt(64.W)), Array("--target-dir", "build"))
}

