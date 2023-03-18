package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import firrtl.passes.wiring.Wiring

import mycpu.BusReq._
import mycpu.BusMaster._

class LoadPipe()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val load = new CacheReadBus
        val dir = Flipped(new DirectoryIO)
        val dataBank = Flipped(new DataBankArrayIO) 
        val tlbus = new TLMasterBusUL
    })
    // --------------------------------------------------------------------------------
    // stage 0
    // --------------------------------------------------------------------------------
    // accept load request 
    // read directory 
    // read dataBank 
    // send Get(load miss not dirty)
    
    val s0_ready = RegInit(true.B)
    val s0_latch = io.load.req.fire 
    val s0_reqReg = RegEnable(io.load.req.bits, s0_latch)
    val s0_reqValidReg = RegEnable(true.B, false.B, s0_latch)
    val s0_reqValid = Mux(s0_latch, true.B, s0_reqValidReg)
    val s0_rAddr = Mux(s0_latch, io.load.req.bits.addr, s0_reqReg.addr)
    val s0_rSet = addrToDCacheSet(s0_rAddr)
    val s0_dataBlockSelOH = addrToDCacheBlockOH(s0_rAddr)
    val s1_ready = RegInit(true.B)
    when(s0_latch) { 
        s0_ready := false.B
    }

    io.load.req.ready := s0_ready && !s0_reqValidReg

    // read directory
    io.dir.read.req.valid := s0_reqValid
    io.dir.read.req.bits.addr := s0_rAddr
    // read databank
    io.dataBank.read.req.valid := s0_reqValid
    dontTouch(io.dataBank.read.req.valid)
    io.dataBank.read.req.bits.set := addrToDCacheSet(s0_rAddr)
    io.dataBank.read.req.bits.blockSelOH := addrToDCacheBlockOH(s0_rAddr)

    val s0_dirInfo = io.dir.read.resp.bits
    val s0_isHit = s0_dirInfo.hit
    val s0_chosenWayOH = s0_dirInfo.chosenWay
    val s0_isDirtyWay = s0_dirInfo.isDirtyWay


    // load cases
    val loadMissClean = !s0_isHit && !s0_isDirtyWay
    val loadMissDirty = !s0_isHit && s0_isDirtyWay
    val loadHit = s0_isHit
    
    val s0_rdBlockData = io.dataBank.read.resp.bits.blockData
    val s0_rdDataAll = io.dataBank.read.resp.bits.data
    val s0_rdData = Mux1H(s0_chosenWayOH, s0_rdDataAll)
    

    // output data when hit
    val s0_loadResp = Wire(chiselTypeOf(io.load.resp))
    dontTouch(s0_loadResp)
    s0_loadResp := 0.U.asTypeOf(io.load.resp)
    s0_loadResp.valid := loadHit && s1_ready && s0_reqValidReg
    s0_loadResp.bits.data := s0_rdData
    s0_loadResp.bits.stageID := 0.U


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

    s0_tlbusReq.valid := s0_reqValidReg && (loadMissClean && !s0_putAllBeat || loadMissDirty && !s0_putAllBeat)
    s0_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s0_tlbusReq.bits.opcode := Mux(loadMissClean, Get, PutFullData)
    val blockAddr = Cat(s0_rAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s0_tlbusReq.bits.address := Mux(loadMissDirty, 
                                    blockAddr + (s0_beatCounter.value << dcacheByteOffsetBits),
                                    blockAddr
                                )
    s0_tlbusReq.bits.data := Mux(loadMissDirty, Mux1H(s0_beatOH, s0_rdBlockData), 0.U)
    s0_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockBytes).U
    s0_tlbusReq.bits.mask := Fill(dcacheWays, 1.U)
    s0_tlbusReq.bits.corrupt := false.B

    
    val s0_valid =  loadHit && io.load.resp.fire && io.load.resp.bits.stageID === 0.U ||
                    loadMissClean && s0_tlbusReq.fire ||
                    loadMissDirty && io.tlbus.resp.fire && io.tlbus.resp.bits.opcode === AccessAck // watting for PutFullData resp

    // --------------------------------------------------------------------------------
    // stage 1
    // --------------------------------------------------------------------------------
    // write refill data
    
    val s1_latch = s0_valid && s1_ready
    val s1_rAddr = RegEnable(s0_rAddr, s1_latch)
    val s1_rSet = addrToDCacheSet(s1_rAddr)
    val s1_chosenWayOH = RegEnable(s0_chosenWayOH, s1_latch)
    val s1_loadHit = RegEnable(loadHit, s1_latch)
    val s1_loadMissClean = RegEnable(loadMissClean, s1_latch)
    val s1_loadMissDirty = RegEnable(loadMissDirty, s1_latch)
    // val s1_isHit = RegEnable(s0_isHit, s1_latch)
    val s1_dataBlockSelOH = RegEnable(s0_dataBlockSelOH, s1_latch)
    when(s1_latch) {
        s0_ready := true.B
        s1_ready := false.B
        s0_reqValidReg := false.B
        s0_putAllBeat := false.B
    }


    // send Get for loadMissDirty
    val s1_tlbusReq = Wire(chiselTypeOf(io.tlbus.req))
    val s1_sendGet = RegEnable(true.B, false.B, s1_tlbusReq.fire && s1_tlbusReq.bits.opcode === Get)
    s1_tlbusReq.valid := s1_loadMissDirty && !s1_sendGet
    s1_tlbusReq.bits := 0.U.asTypeOf(io.tlbus.req.bits)
    s1_tlbusReq.bits.opcode := Get
    val s1_blockAddr = Cat(s1_rAddr(xlen-1, dcacheByteOffsetBits + dcacheBlockBits), Fill(dcacheByteOffsetBits + dcacheBlockBits, 0.U))
    s1_tlbusReq.bits.address := s1_blockAddr
    s1_tlbusReq.bits.size := (dcacheBlockBytes * dcacheBlockBytes).U
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


    // refill data writeback for load miss
    io.dataBank.write.req.valid := s1_refillFire
    io.dataBank.write.req.bits.blockSelOH := s1_beatOH
    io.dataBank.write.req.bits.set := s1_rSet
    io.dataBank.write.req.bits.way := s1_chosenWayOH
    io.dataBank.write.req.bits.data := s1_refillMessage.data
    io.dataBank.write.req.bits.mask := Fill(dcacheBlockBytes, 1.U)  // ! miss and refill data should replace whole cache line


    // refill data write back directory for load miss
    io.dir.write.req.valid := s1_refillFire 
    io.dir.write.req.bits.addr := s1_rAddr
    io.dir.write.req.bits.way := s1_chosenWayOH
    val metaArrayWrData = Wire(new DCacheMeta)
    metaArrayWrData.valid := Mux(s1_refillFire, true.B, false.B)
    metaArrayWrData.dirty := false.B //true.B 
    val metaWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U((new DCacheMeta).getWidth.W)))
    for(i <- 0 until dcacheWays) { metaWrData(i) := Mux(s1_chosenWayOH(i), metaArrayWrData.asUInt, 0.U) }
    io.dir.write.req.bits.meta := metaWrData


    // output data when all beats of data has already refilled
    val s1_loadResp = Wire(chiselTypeOf(io.load.resp))
    dontTouch(s1_loadResp)
    s1_loadResp := 0.U.asTypeOf(io.load.resp)
    s1_loadResp.valid := s1_refillFire && s1_lastBeat && (s1_loadMissClean || s1_loadMissDirty)
    s1_loadResp.bits.data := s1_readRespData
    s1_loadResp.bits.stageID := 1.U


    val s1_valid = s1_loadMissClean && io.load.resp.fire && io.load.resp.bits.stageID === 1.U  ||
                    s1_loadMissDirty && io.load.resp.fire && io.load.resp.bits.stageID === 1.U ||
                    s1_loadHit
    
    
    when(s1_valid) {
        s1_ready := true.B
        s1_sendGet := false.B

        s1_loadHit := false.B
        s1_loadMissClean := false.B
        s1_loadMissDirty := false.B
    }


    val loadRespArb = Module(new Arbiter(new CacheReadResp, 2))
    loadRespArb.io.in(0) <> s1_loadResp
    loadRespArb.io.in(1) <> s0_loadResp
    io.load.resp <> loadRespArb.io.out

    val tlbusReqArb = Module(new Arbiter(new BusMasterBundle, 2))
    tlbusReqArb.io.in(0) <> s1_tlbusReq
    tlbusReqArb.io.in(1) <> s0_tlbusReq
    io.tlbus.req <> tlbusReqArb.io.out
}

object LoadPipeGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the LoadPipe hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new LoadPipe()(defaultConfig), Array("--target-dir", "build"))
}

