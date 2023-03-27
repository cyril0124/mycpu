package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import firrtl.passes.wiring.Wiring

import mycpu.BusReq._
import mycpu.BusMaster._

class StorePipe()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val store = new CacheWriteBus
        val dir = Flipped(new DirectoryIO)
        val dataBank = Flipped(new DataBankArrayIO) 
        val tlbus = new TLMasterBusUL
    })
    // io <> DontCare


    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // -------------------------------------------------------------------------------- 
    // send Get(store miss clean)
    // send PutFullData(store miss dirty)
    // write databank & directory (store hit)
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
    dontTouch(io.dataBank.read.req.valid)
    io.dataBank.read.req.bits.set := addrToDCacheSet(s0_wAddr)
    io.dataBank.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_wAddr)

    val s0_dirInfo = io.dir.read.resp.bits
    val s0_isHit = s0_dirInfo.hit
    val s0_chosenWayOH = s0_dirInfo.chosenWay
    val s0_isDirtyWay = s0_dirInfo.isDirtyWay

    // store cases
    val storeMissClean = !s0_isHit && !s0_isDirtyWay
    val storeMissDirty = !s0_isHit && s0_isDirtyWay
    val storeHit = s0_isHit
    

    val s0_rdBlockData = io.dataBank.read.resp.bits.blockData
    val s0_rdDataAll = io.dataBank.read.resp.bits.data
    val s0_rdData = Mux1H(s0_chosenWayOH, s0_rdDataAll)

    // send sub request when miss
    val s0_tlbusReq = Wire(chiselTypeOf(io.tlbus.req))

    val s0_beatCounter = new Counter(dcacheBlockSize)
    val s0_beatOH = UIntToOH(s0_beatCounter.value)
    val s0_lastBeat = s0_beatCounter.value === (dcacheBlockSize-1).U
    val s0_putAllBeat = RegEnable(true.B, false.B, s0_lastBeat && s0_tlbusReq.fire)
    when(s0_tlbusReq.fire && s0_tlbusReq.bits.opcode === PutFullData) {
        s0_beatCounter.inc()
    }.elsewhen(io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck) {
        s0_beatCounter.reset()
    }

    when(s0_fire) {
        s0_putAllBeat := false.B
    }

    s0_tlbusReq.valid := s0_full && (storeMissClean && !s0_putAllBeat || storeMissDirty && !s0_putAllBeat)
    s0_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s0_tlbusReq.bits.opcode := Mux(storeMissClean, Get, PutFullData)
    val blockAddr = Cat(s0_wAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s0_tlbusReq.bits.address := Mux(storeMissDirty, 
                                    blockAddr + (s0_beatCounter.value << dcacheByteOffsetBits),
                                    blockAddr
                                )
    s0_tlbusReq.bits.data := Mux(storeMissDirty, Mux1H(s0_beatOH, s0_rdBlockData), 0.U)
    s0_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockSize).U
    s0_tlbusReq.bits.mask := Fill(dcacheWays, 1.U)
    s0_tlbusReq.bits.corrupt := false.B

    s0_valid :=  s0_full && io.dir.read.resp.fire &&
                        (storeHit ||
                        storeMissClean && s0_tlbusReq.fire ||
                        storeMissDirty && io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck) // watting for PutFullData resp


    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // send Get(store miss dirty)
    // write refill data (store miss clean) (store miss dirty)
    // writeback databank & directory(store hit)
    // send store hit resp (store hit)
    val s1_full = RegInit(false.B)
    val s1_latch = s0_valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_reqReg = RegEnable(s0_reqReg, s1_latch)
    val s1_wAddr = s1_reqReg.addr
    val s1_wSet = addrToDCacheSet(s1_wAddr)
    val s1_dataBlockSelOH = addrToDCacheBlockOH(s1_wAddr)
    val s1_chosenWayOH = RegEnable(s0_chosenWayOH, s1_latch)
    val s1_storeHit = RegEnable(storeHit, s1_latch) && s1_full
    val s1_storeMissClean = RegEnable(storeMissClean, s1_latch) && s1_full
    val s1_storeMissDirty = RegEnable(storeMissDirty, s1_latch) && s1_full

    s1_ready := !s1_full || s1_fire
    when(s1_latch) { s1_full := true.B } 
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    // send store resp (store hit)
    val s1_storeResp = Wire(chiselTypeOf(io.store.resp))
    dontTouch(s1_storeResp)
    s1_storeResp := 0.U.asTypeOf(io.store.resp)
    s1_storeResp.valid := s1_storeHit
    s1_storeResp.bits.stageID := 1.U


    // send Get (store miss dirty)
    val s1_tlbusReq = Wire(chiselTypeOf(io.tlbus.req))
    val s1_sendGet = RegEnable(true.B, false.B, s1_tlbusReq.fire && s1_tlbusReq.bits.opcode === Get)
    s1_tlbusReq.valid := s1_storeMissDirty && !s1_sendGet
    s1_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s1_tlbusReq.bits.opcode := Get
    val s1_blockAddr = Cat(s1_wAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s1_tlbusReq.bits.address := s1_blockAddr
    s1_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockSize).U
    s1_tlbusReq.bits.mask := Fill(dcacheWays, 1.U)
    s1_tlbusReq.bits.corrupt := false.B


    // handle refill data
    io.tlbus.resp.ready := true.B // io.dataBank.write.req.ready && io.dir.write.req.ready // true.B
    val s1_refillMessage = io.tlbus.resp.bits
    val s1_refillFire = s1_refillMessage.opcode === AccessAckData && io.tlbus.resp.fire
    val s1_beatCounter = new Counter(dcacheBlockSize)
    val s1_beatOH = UIntToOH(s1_beatCounter.value)
    val s1_lastBeat = s1_beatCounter.value === (dcacheBlockSize-1).U
    when(!s1_lastBeat && s1_refillFire) {
        s1_beatCounter.inc()
    }.elsewhen(s1_latch) {
        s1_beatCounter.reset()
    }
    // save refill data
    val s1_refillBlockDataArray = RegInit(VecInit((0 until dcacheBlockSize).map{i => 0.U((dcacheBlockBytes*8).W)}))
    when(s1_refillFire) { s1_refillBlockDataArray(s1_beatCounter.value) := s1_refillMessage.data }
    val s1_refillBlockData = WireInit(VecInit((0 until dcacheBlockSize).map{ i => if(i != dcacheBlockSize-1) s1_refillBlockDataArray(i) else s1_refillMessage.data }))
    val s1_readRespData = Mux1H(s1_dataBlockSelOH, s1_refillBlockData)


    // write directory (store hit)
    // write directory (refill) (store miss clean) (store miss dirty)
    val s1_writeRefill = s1_refillFire && (s1_storeMissClean || s1_storeMissDirty && s1_sendGet)
    val s1_dirWrReq = Wire(chiselTypeOf(io.dir.write.req))
    s1_dirWrReq.valid := s1_storeHit || s1_writeRefill
    s1_dirWrReq.bits.addr := s1_wAddr
    s1_dirWrReq.bits.way := s1_chosenWayOH
    val s1_metaArrayWrData = Wire(new DCacheMeta)
    s1_metaArrayWrData.valid := s1_storeHit || s1_writeRefill 
    s1_metaArrayWrData.dirty := s1_storeHit
    s1_dirWrReq.bits.meta := s1_metaArrayWrData.asUInt

    // write databank (refill) (store miss clean) (store miss dirty)
    val s1_dataBankWrReq = Wire(chiselTypeOf(io.dataBank.write.req))
    s1_dataBankWrReq.valid := s1_storeHit || s1_writeRefill
    s1_dataBankWrReq.bits.blockSelOH := Mux(s1_writeRefill, s1_beatOH, s1_dataBlockSelOH)
    s1_dataBankWrReq.bits.set := s1_wSet
    s1_dataBankWrReq.bits.way := s1_chosenWayOH
    s1_dataBankWrReq.bits.mask := Mux(s1_writeRefill, Fill(dcacheBlockBytes, 1.U), s1_reqReg.mask)  // ! miss and refill data should replace whole cache line
    s1_dataBankWrReq.bits.data := Mux(s1_writeRefill, s1_refillMessage.data, s1_reqReg.data)

    s1_valid := s1_storeHit && s1_storeResp.fire ||
                    (s1_storeMissClean || s1_storeMissDirty) && s1_refillFire && s1_lastBeat
    
    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    // writeback databank & directory (store miss clean) (store miss diry)
    // send store resp (store miss clean) (store miss diry)
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage2 is final stage
    val s2_reqReg = RegEnable(s1_reqReg, s2_latch)
    val s2_wAddr = s1_reqReg.addr
    val s2_wSet = addrToDCacheSet(s1_wAddr)
    val s2_dataBlockSelOH = addrToDCacheBlockOH(s2_wAddr)
    val s2_chosenWayOH = RegEnable(s1_chosenWayOH, s2_latch)
    val s2_storeHit = RegEnable(s1_storeHit, s2_latch) && s2_full
    val s2_storeMissClean = RegEnable(s1_storeMissClean, s2_latch) && s2_full
    val s2_storeMissDirty = RegEnable(s1_storeMissDirty, s2_latch) && s2_full

    s2_ready := !s2_full || s2_fire
    when(s2_latch) { s2_full := true.B }
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    // send store resp (store miss clean) (store miss diry)
    val s2_storeResp = Wire(chiselTypeOf(io.store.resp))
    dontTouch(s2_storeResp)
    s2_storeResp := 0.U.asTypeOf(io.store.resp)
    s2_storeResp.valid := s2_storeMissClean || s2_storeMissDirty
    s2_storeResp.bits.stageID := 1.U

    
    // write directory (store miss clean) (store miss dirty)
    val s2_dirWrReq = Wire(chiselTypeOf(io.dir.write.req))
    s2_dirWrReq.valid := s2_storeMissClean || s2_storeMissDirty
    s2_dirWrReq.bits.addr := s2_wAddr
    s2_dirWrReq.bits.way := s2_chosenWayOH
    val s2_metaArrayWrData = Wire(new DCacheMeta)
    s2_metaArrayWrData.valid := true.B
    s2_metaArrayWrData.dirty := true.B 
    s2_dirWrReq.bits.meta := s2_metaArrayWrData.asUInt

    // write databank (store miss clean) (store miss dirty)
    val s2_dataBankWrReq = Wire(chiselTypeOf(io.dataBank.write.req))
    s2_dataBankWrReq.valid := s2_storeMissClean || s2_storeMissDirty
    s2_dataBankWrReq.bits.blockSelOH := s2_dataBlockSelOH
    s2_dataBankWrReq.bits.set := s2_wSet
    s2_dataBankWrReq.bits.way := s2_chosenWayOH
    s2_dataBankWrReq.bits.mask := s2_reqReg.mask
    s2_dataBankWrReq.bits.data := s2_reqReg.data

    s2_valid := s2_storeHit || ((s2_storeMissClean || s2_storeMissDirty) && s2_dataBankWrReq.fire && s2_dirWrReq.fire && s2_storeResp.fire)



    val tlbusReqArb = Module(new Arbiter(chiselTypeOf(io.tlbus.req.bits), 2))
    tlbusReqArb.io.in(0) <> s1_tlbusReq
    tlbusReqArb.io.in(1) <> s0_tlbusReq
    io.tlbus.req <> tlbusReqArb.io.out

    val storeRespArb = Module(new Arbiter(chiselTypeOf(io.store.resp.bits), 2))
    storeRespArb.io.in(0) <> s2_storeResp
    storeRespArb.io.in(1) <> s1_storeResp
    io.store.resp <> storeRespArb.io.out

    val dataBankWrReqArb = Module(new Arbiter(chiselTypeOf(io.dataBank.write.req.bits), 2))
    dataBankWrReqArb.io.in(0) <> s2_dataBankWrReq
    dataBankWrReqArb.io.in(1) <> s1_dataBankWrReq
    io.dataBank.write.req <> dataBankWrReqArb.io.out

    val dirWrReqArb = Module(new Arbiter(chiselTypeOf(io.dir.write.req.bits), 2))
    dirWrReqArb.io.in(0) <> s2_dirWrReq
    dirWrReqArb.io.in(1) <> s1_dirWrReq
    io.dir.write.req <> dirWrReqArb.io.out

}