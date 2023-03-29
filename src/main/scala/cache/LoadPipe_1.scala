package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import firrtl.passes.wiring.Wiring

import mycpu.BusReq._
import mycpu.BusMaster._


class LoadPipe_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val load = new CacheReadBus
        val dir = Flipped(new DirectoryIO)
        val dataBank = Flipped(new DataBankArrayIO) 
        val tlbus = new TLMasterBusUL
    })

    val s0_valid = Wire(Bool())
    val s1_valid, s1_ready = Wire(Bool())
    val s2_valid, s2_ready = Wire(Bool())

    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // accept load request 
    // read directory 
    // read dataBank 
    
    val s0_full = RegInit(false.B)
    val s0_latch = io.load.req.fire 
    val s0_fire = s0_valid && s1_ready
    val s0_reqReg = RegEnable(io.load.req.bits, s0_latch)
    val s0_rAddr = Mux(s0_latch, io.load.req.bits.addr, s0_reqReg.addr)
    val s0_rSet = addrToDCacheSet(s0_rAddr)
    val s0_dataBlockSelOH = addrToDCacheBlockOH(s0_rAddr)

    io.load.req.ready := !s0_full //|| s0_fire
    when(s0_latch) { s0_full := true.B }
    .elsewhen(s0_full && s0_fire) { s0_full := false.B }

    // read directory
    io.dir.read.req.valid := s0_latch || s0_full
    io.dir.read.req.bits.addr := s0_rAddr
    // read databank
    io.dataBank.read.req.valid := s0_latch || s0_full
    dontTouch(io.dataBank.read.req.valid)
    io.dataBank.read.req.bits.set := addrToDCacheSet(s0_rAddr)
    io.dataBank.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_rAddr)

    val s0_dirInfo = io.dir.read.resp.bits
    val s0_isHit = s0_dirInfo.hit
    val s0_chosenWayOH = s0_dirInfo.chosenWay
    val s0_isDirtyWay = s0_dirInfo.isDirtyWay
    val s0_dirtyTag = s0_dirInfo.dirtyTag

    val s0_rdBlockData = io.dataBank.read.resp.bits.blockData
    val s0_rdDataAll = io.dataBank.read.resp.bits.data
    // val s0_rdData = Mux1H(s0_chosenWayOH, s0_rdDataAll)

    val s0_validReg = RegInit(false.B)
    when(s0_latch) { s0_validReg := true.B }
    .elsewhen(s0_fire) { s0_validReg := false.B }
    s0_valid := RegNext(s0_latch) || s0_validReg
    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // send Get(load miss not dirty)
    // send PutFullData(load miss dirty)

    val s1_full = RegInit(false.B)
    val s1_latch = s0_valid && s1_ready
    val s1_fire = s1_valid && s2_ready
    val s1_rAddr = RegEnable(s0_rAddr, s1_latch)
    val s1_dirInfo = RegEnable(s0_dirInfo, s1_latch)
    val s1_isHit = s1_dirInfo.hit && s1_full
    val s1_isDirtyWay = s1_dirInfo.isDirtyWay && s1_full
    val s1_dirtyTag = s1_dirInfo.dirtyTag
    val s1_chosenWayOH = s1_dirInfo.chosenWay
    val s1_rdBlockData = RegEnable(s0_rdBlockData, s1_latch)
    val s1_rdDataAll = RegEnable(s0_rdDataAll, s1_latch)
    val s1_rdData = Mux1H(s1_chosenWayOH, s1_rdDataAll)
    val s1_dataBlockSelOH = RegEnable(s0_dataBlockSelOH, s1_latch)

    s1_ready := !s1_full || s1_fire
    when(s1_latch) { s1_full := true.B }
    .elsewhen(s1_full && s1_fire) { s1_full := false.B }

    // load cases
    val s1_loadMissClean = !s1_isHit && !s1_isDirtyWay
    val s1_loadMissDirty = !s1_isHit && s1_isDirtyWay
    val s1_loadHit = s1_isHit
    

    

    // output data when hit
    val s1_loadResp = Wire(chiselTypeOf(io.load.resp))
    val s1_sendLoadResp = RegEnable(true.B, false.B, s1_loadResp.fire)
    when(s1_fire) { s1_sendLoadResp := false.B }
    dontTouch(s1_loadResp)
    s1_loadResp := 0.U.asTypeOf(io.load.resp)
    s1_loadResp.valid := s1_loadHit && s1_full && !s1_sendLoadResp
    s1_loadResp.bits.data := s1_rdData
    s1_loadResp.bits.stageID := 0.U


    // send sub request when miss
    val s1_tlbusReq = Wire(chiselTypeOf(io.tlbus.req))

    val s1_beatCounter = new Counter(dcacheBlockSize)
    val s1_beatOH = UIntToOH(s1_beatCounter.value)
    val s1_lastBeat = s1_beatCounter.value === (dcacheBlockSize-1).U
    val s1_putAllBeat = RegEnable(true.B, false.B, s1_lastBeat && s1_tlbusReq.fire)
    when(s1_tlbusReq.fire && s1_tlbusReq.bits.opcode === PutFullData) {
        s1_beatCounter.inc()
    }.elsewhen(io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck) {
        s1_beatCounter.reset()
    }
    when(s1_fire) {
        s1_putAllBeat := false.B
    }

    s1_tlbusReq.valid := s1_full && (s1_loadMissClean && !s1_putAllBeat || s1_loadMissDirty && !s1_putAllBeat)
    s1_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s1_tlbusReq.bits.opcode := Mux(s1_loadMissClean, Get, PutFullData)
    val blockAddr = Cat(s1_rAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    val writebackAddr = Cat(s1_dirtyTag, addrToDCacheSet(s1_rAddr), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s1_tlbusReq.bits.address := Mux(s1_loadMissDirty, 
                                    writebackAddr + (s1_beatCounter.value << dcacheByteOffsetBits), // blockAddr + (s1_beatCounter.value << dcacheByteOffsetBits),
                                    blockAddr
                                )
    val temp = s1_rdBlockData.map{ d => d.asTypeOf(Vec(dcacheWays, UInt((dcacheBlockBytes*8).W)))}
    val s1_chosenRdBlockData = temp.map{ t => Mux1H(s1_chosenWayOH, t) }
    s1_tlbusReq.bits.data := Mux(s1_loadMissDirty, Mux1H(s1_beatOH, s1_chosenRdBlockData), 0.U)
    // s1_tlbusReq.bits.data := Mux(s1_loadMissDirty, Mux1H(s1_beatOH, s1_rdBlockData), 0.U)
    s1_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockSize).U
    s1_tlbusReq.bits.mask := Fill(dcacheWays, 1.U)
    s1_tlbusReq.bits.corrupt := false.B

    s1_valid :=  s1_full && 
                (s1_loadHit && io.load.resp.fire && io.load.resp.bits.stageID === 0.U ||
                s1_loadMissClean && s1_tlbusReq.fire ||
                s1_loadMissDirty && io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck) // watting for PutFullData resp

    // --------------------------------------------------------------------------------
    // stage 2
    // --------------------------------------------------------------------------------
    // write refill data
    val s2_full = RegInit(false.B)
    val s2_latch = s1_valid && s2_ready
    val s2_fire = s2_valid // stage1 is final stage
    val s2_rAddr = RegEnable(s1_rAddr, s2_latch)
    val s2_rSet = addrToDCacheSet(s2_rAddr)
    val s2_chosenWayOH = RegEnable(s1_chosenWayOH, s2_latch)
    val s2_loadHit = RegEnable(s1_loadHit, s2_latch) && s2_full
    val s2_loadMissClean = RegEnable(s1_loadMissClean, s2_latch) && s2_full
    val s2_loadMissDirty = RegEnable(s1_loadMissDirty, s2_latch) && s2_full
    val s2_dataBlockSelOH = RegEnable(s1_dataBlockSelOH, s2_latch)

    s2_ready := !s2_full || s2_fire
    when(s2_latch) { s2_full := true.B } 
    .elsewhen(s2_full && s2_fire) { s2_full := false.B }

    // send Get for s1_loadMissDirty
    val s2_tlbusReq = Wire(chiselTypeOf(io.tlbus.req))
    val s2_sendGet = RegEnable(true.B, false.B, s2_tlbusReq.fire && s2_tlbusReq.bits.opcode === Get)
    when(s2_fire) { s2_sendGet := false.B }
    s2_tlbusReq.valid := s2_loadMissDirty && !s2_sendGet
    s2_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s2_tlbusReq.bits.opcode := Get
    val s2_blockAddr = Cat(s2_rAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s2_tlbusReq.bits.address := s2_blockAddr
    s2_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockSize).U
    s2_tlbusReq.bits.mask := Fill(dcacheWays, 1.U)
    s2_tlbusReq.bits.corrupt := false.B


    // handle refill data
    io.tlbus.resp.ready := true.B // io.dataBank.write.req.ready && io.dir.write.req.ready // true.B
    val s2_refillMessage = io.tlbus.resp.bits
    val s2_refillFire = s2_refillMessage.opcode === AccessAckData && io.tlbus.resp.fire
    val s2_beatCounter = new Counter(dcacheBlockSize)
    val s2_beatOH = UIntToOH(s2_beatCounter.value)
    val s2_lastBeat = s2_beatCounter.value === (dcacheBlockSize-1).U
    when(!s2_lastBeat && s2_refillFire) {
        s2_beatCounter.inc()
    }.elsewhen(s2_latch) {
        s2_beatCounter.reset()
    }
    // save refill data
    val s2_refillBlockDataArray = RegInit(VecInit((0 until dcacheBlockSize).map{i => 0.U((dcacheBlockBytes*8).W)}))
    when(s2_refillFire) { s2_refillBlockDataArray(s2_beatCounter.value) := s2_refillMessage.data }
    val s2_refillBlockData = WireInit(VecInit((0 until dcacheBlockSize).map{ i => if(i != dcacheBlockSize-1) s2_refillBlockDataArray(i) else s2_refillMessage.data }))
    val s2_readRespData = Mux1H(s2_dataBlockSelOH, s2_refillBlockData)


    // refill data writeback for load miss
    io.dataBank.write.req.valid := s2_refillFire
    io.dataBank.write.req.bits.blockSelOH := s2_beatOH
    io.dataBank.write.req.bits.set := s2_rSet
    io.dataBank.write.req.bits.way := s2_chosenWayOH
    io.dataBank.write.req.bits.data := s2_refillMessage.data
    io.dataBank.write.req.bits.mask := Fill(dcacheBlockBytes, 1.U)  // ! miss and refill data should replace whole cache line


    // refill data write back directory for load miss
    io.dir.write.req.valid := s2_refillFire 
    io.dir.write.req.bits.addr := s2_rAddr
    io.dir.write.req.bits.way := s2_chosenWayOH
    val metaArrayWrData = Wire(new DCacheMeta)
    metaArrayWrData.valid := Mux(s2_refillFire, true.B, false.B)
    metaArrayWrData.dirty := false.B
    io.dir.write.req.bits.meta := metaArrayWrData.asUInt

    // output data when all beats of data has already refilled
    val s2_loadResp = Wire(chiselTypeOf(io.load.resp))
    dontTouch(s2_loadResp)
    s2_loadResp := 0.U.asTypeOf(io.load.resp)
    s2_loadResp.valid := Hold(true.B, s2_refillFire && s2_lastBeat, s2_latch || s2_valid) && (s2_loadMissClean || s2_loadMissDirty)
    s2_loadResp.bits.data := s2_readRespData
    s2_loadResp.bits.stageID := 1.U
    
    s2_valid := s2_loadMissClean && io.load.resp.fire && io.load.resp.bits.stageID === 1.U  ||
                s2_loadMissDirty && io.load.resp.fire && io.load.resp.bits.stageID === 1.U ||
                s2_loadHit



    val loadRespArb = Module(new Arbiter(new CacheReadResp, 2))
    loadRespArb.io.in(0) <> s2_loadResp
    loadRespArb.io.in(1) <> s1_loadResp
    io.load.resp <> loadRespArb.io.out

    val tlbusReqArb = Module(new Arbiter(new BusMasterBundle, 2))
    tlbusReqArb.io.in(0) <> s2_tlbusReq
    tlbusReqArb.io.in(1) <> s1_tlbusReq
    io.tlbus.req <> tlbusReqArb.io.out
}