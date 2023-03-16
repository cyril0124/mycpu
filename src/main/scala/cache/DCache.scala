package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


import mycpu.BusReq._
import mycpu.BusMaster._
import dataclass.data


// mshr busy bit
//  ==> set way tag bank dirty mask blockBytes setNum hit/miss state? tagArray dataArray refill
//  writeback will read the cacheBlock back to the cache and merge together, then we will store the merge result into the low-level memory
// input: 
//      rd: addr valid
//      wr: addr valid data 
// output: 
//      rd_resp: data valid  
//      

class CacheReadBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new Bundle{
        val addr = UInt(xlen.W)
        val memType = UInt(3.W)
    }))
    val resp = ValidIO(new Bundle{
        val data = UInt(xlen.W)
        // val hit = Bool() // hit or miss
    })
}

class CacheWriteBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new Bundle{
        val addr = UInt(xlen.W)
        val data = UInt(xlen.W)
        // val memType = UInt(3.W)
        val mask = UInt(8.W) // TODO: parameterize it
    }))
}

class DCacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new CacheReadBus
    val write = new CacheWriteBus

    val tlbus = new TLMasterBusUL
}

class DCacheMeta()(implicit val p: Parameters) extends MyBundle{
    val dirty = Bool()
    val valid = Bool()
}


class DCacheDataBank[T <: Data](gen: T,dcacheSets: Int = 64, dcacheWays: Int = 4) extends Module {
    val io = IO(new Bundle{
        val w = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(dcacheSets).W))
            val way = Input(UInt(log2Ceil(dcacheWays).W))
            val data = Input(gen)
            val mask = Input(UInt((gen.getWidth / 8).W))
        }
        val r = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(dcacheSets).W))
            val way = Input(UInt(log2Ceil(dcacheWays).W))
            val data = Output(gen)
        }
    })

    val genWidth = gen.getWidth // typically this is 64-bit for my design
    val maskSegments = genWidth / 8
    assert(genWidth % 8 == 0, s"gen width should be mod of 8! genWidth ==> ${genWidth}")
    
    val bankRam = Seq.fill(dcacheWays)(Module(new SRAMTemplate(genWidth, dcacheSets, maskSegments))) // sync read
    // val bankRam = Module(new SRAMTemplate_1(gen, dcacheSets, dcacheWays))

    // write chosen way one hot code
    val wWayOH = UIntToOH(io.w.way, dcacheWays)
    for( i <- 0 until dcacheWays){
        bankRam(i).io.w.en := wWayOH(i) & io.w.en
        bankRam(i).io.w.addr := io.w.set
        bankRam(i).io.w.data := io.w.data
        if(bankRam(i).io.w.mask.isDefined) bankRam(i).io.w.mask.get := io.w.mask        
    }

    // read chosen way one hot code
    val rWayOH = UIntToOH(io.r.way, dcacheWays)
    // val rdataWithMask = WireInit(0.U.asTypeOf(io.r.data))
    val rdata = WireInit(0.U.asTypeOf(io.r.data))
    for( i <- 0 until dcacheWays){
        bankRam(i).io.r.en := rWayOH(i) & io.r.en
        bankRam(i).io.r.addr := io.r.set
        when(rWayOH(i) & io.r.en){
            rdata := bankRam(i).io.r.data
        }
    }

    io.r.data := rdata
}

class DCache()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DCacheIO)
    
    // local param
    val cacheSize = dcacheSets * dcacheWays * dcacheBlockBytes
    val maskSegments = dcacheBlockBytes
    val setBits = log2Ceil(dcacheSets)
    val metaBits = (new DCacheMeta).getWidth
    println("----------DCache info----------")
    println(s" cacheSize: ${cacheSize} Byte")
    println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
    println(s" blockOffsetBits: ${dcacheBlockOffsetBits}")
    println(s" setBits: ${dcacheSetBits}")
    println(s" tagBits: ${dcacheTagBits}")
    
    val r = io.read
    val w = io.write

    val wbCache = Wire(Bool())
    val wbWrHit = Wire(Bool())
    val rdHit = Wire(Bool())
    val reqFire = RegInit(false.B)

    val ackRead = RegInit(false.B)

    val tagRdVec = Wire(Vec(dcacheWays, UInt(dcacheTagBits.W)))
    val metaRdVec = Wire(Vec(dcacheWays, new DCacheMeta))
    val dataBankRdData = Wire(UInt((blockBytes * 8).W))
    
    // sub module instantiate
    val tagArray = Module(new SRAMTemplate(dcacheTagBits * dcacheWays, dcacheSets, dcacheWays))
    val metaArray = Module(new SRAMTemplate(width = metaBits * dcacheWays, depth = dcacheSets, maskSegments = dcacheWays))
    val dataBank = Module(new DCacheDataBank(UInt((dcacheBlockBytes * 8).W), dcacheSets, dcacheWays))

// --------------------------stage 0: read cache info(handshake)-------------------------------
    val busy = RegInit(false.B)
    r.req.ready := ~busy
    w.req.ready := ~busy
    
    // read info
    val rReqValidReg = RegEnable(r.req.fire, false.B, r.req.fire)
    val rReqValid = Mux(r.req.fire, r.req.fire, rReqValidReg)

    val rAddrReg = RegEnable(r.req.bits.addr, 0.U, r.req.fire)
    val rAddr = Mux(r.req.fire, r.req.bits.addr, rAddrReg)
    
    val rSet = rAddr(setBits + blockOffsetBits - 1, blockOffsetBits)
    val rTag = rAddr(xlen - 1, setBits + blockOffsetBits)

    val rMemTypeReg =RegEnable(r.req.bits.memType, 0.U, r.req.fire)
    val rMemType = Mux(r.req.fire, r.req.bits.memType, rMemTypeReg)


    // write info
    val wReqValidReg = RegEnable(w.req.fire, false.B, w.req.fire)
    val wReqValid = Mux(w.req.fire, w.req.fire, wReqValidReg)

    val wAddrReg = RegEnable(w.req.bits.addr, 0.U, w.req.fire)
    val wAddr = Mux(w.req.fire, w.req.bits.addr, wAddrReg)

    val wSet = wAddr(setBits + blockOffsetBits, blockOffsetBits)
    val wTag = wAddr(xlen - 1, setBits + blockOffsetBits)

    val wDataReg = RegEnable(w.req.bits.data, 0.U, w.req.fire)
    val wData = Mux(w.req.fire, w.req.bits.data, wDataReg)

    val wmaskReg = RegEnable(w.req.bits.mask, 0.U, w.req.fire)
    val wmask = Mux(w.req.fire, w.req.bits.mask, wmaskReg)

    // val rdReady = RegEnable(true.B, false.B, rReqValidReg || wReqValidReg) // read data will take one cycle delay
    
    when(rReqValid || wReqValid) {
        busy := true.B
    }

    // we only support single request processing either read or write, do not support concurrent request for now
    val rwTag = Mux(rReqValid, rTag, wTag)
    val rwAddr = Mux(rReqValid, rAddr, wAddr)
    val rwSet = Mux(rReqValid, rSet, wSet)

    // tag read
    tagRdVec := tagArray.io.r.data.asTypeOf(Vec(dcacheWays, UInt(dcacheTagBits.W)))
    tagArray.io.r.en := (rReqValid || wReqValid) && ~wbCache
    tagArray.io.r.addr := rwSet // Mux(r.req.valid, rSet, wSet)
    
    // meta read
    metaRdVec := metaArray.io.r.data.asTypeOf(Vec(dcacheWays, new DCacheMeta))
    metaArray.io.r.en := (rReqValid || wReqValid) && ~wbCache
    metaArray.io.r.addr := rwSet // Mux(r.req.valid, rSet, wSet)
    
    // hit or miss
    val tagMatchVec = tagRdVec.map( t => t === rwTag )
    val metaValidVec = metaRdVec.map( m => m.valid )
    val metaDirtyVec = metaRdVec.map( m => m.dirty ) // TODO: dirty
    val matchWayOH = Cat(tagMatchVec.zip(metaValidVec).map{ case(t, m) => t && m }.reverse) // reverse is necessary
    val invalidWayVec = metaRdVec.map( m => m.valid === false.B )
    val invalidWayOH = PriorityMux(invalidWayVec.zipWithIndex.map(x => x._1 -> UIntToOH(x._2.U, dcacheWays)) )
    val hasInvalidWay = Cat(invalidWayVec).orR
    val replaceWay = "b0100".U // TODO： replace policy... PLRU
    val isHit = Cat(matchWayOH).orR && (rReqValid || wReqValid)
    val choseWayOH = Mux(isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWay))
    val isDirtyWay = ( choseWayOH & Cat(metaDirtyVec) & Cat(metaValidVec) ).orR // the chosen way is a dirty and valid way

    rdHit := rReqValid && isHit

    dataBank.io.r.en :=  rReqValid// (rReqValid || wReqValid) && ~wbCache // TODO:
    dataBank.io.r.set := rwSet // TODO: 
    dataBank.io.r.way := OHToUInt(choseWayOH) // TODO:
    dataBankRdData := dataBank.io.r.data // TODO:
    // dataBankRdData := ReadMask(dataBank.io.r.data, 0.U, rwMemType, xlen)

// ----------------------------------miss process-------------------------------------------------------------
// --------------------------stage 1: send sub request to the next level memory-------------------------------
    io.tlbus.req <> DontCare
    when(isDirtyWay && !isHit) { // miss but chosen way is a dirty way
        // TODO: release dirty way, using PutFullData
        io.tlbus.req <> DontCare
        // io.tlbus.req.valid := ~isHit && (rReqValid || wReqValid)
        // io.tlbus.req.bits.opcode := PutFullData
        // io.tlbus.req.bits.source := ID_RAM
        // io.tlbus.req.bits.size := (xlen / 8).U
        // io.tlbus.req.bits.mask := "b1111".U
        // io.tlbus.req.bits.corrupt := false.B
    }.elsewhen(!isHit) {
        io.tlbus.req.valid := ~isHit && (rReqValid || wReqValid)
        io.tlbus.req.bits <> DontCare
        io.tlbus.req.bits.address := rwAddr
        io.tlbus.req.bits.opcode := Get
        io.tlbus.req.bits.size := (xlen / 8).U
        io.tlbus.req.bits.source := MASTER_1
        io.tlbus.req.bits.mask := "b1111".U
        io.tlbus.req.bits.corrupt := false.B
        when(io.tlbus.req.fire) {
            reqFire := true.B
        }
    }

    io.tlbus.resp.ready := true.B

    wbWrHit := wReqValid && isHit // writeback cache when hit and req is write. i.e. update metaArray and dataBank
    wbCache := io.tlbus.resp.fire // writeback cache when miss

// --------------------------stage 2: get resp from next level memory writeback to cache---------------------
    val refillDataReg = RegInit(0.U(xlen.W))
    val refillData = Wire(UInt(xlen.W))
    // get refill data
    when(wbCache) {
        refillDataReg := io.tlbus.resp.bits.data
    }
    refillData := Mux(wbCache, io.tlbus.resp.bits.data, refillDataReg)

    // tag write
    tagArray.io.w.en := wbCache
    tagArray.io.w.addr := Mux(isHit && ~wbCache, wSet, rwSet)
    tagArray.io.w.mask.get := choseWayOH
    val tagWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U(dcacheTagBits.W)))
    tagWrData.zipWithIndex.foreach{
        case(t,i) => 
            when(choseWayOH(i)){
                t := rwTag
            }
    }
    tagArray.io.w.data := tagWrData.asUInt

    // meta write
    metaArray.io.w.en := wbCache // || wbWrHit // TODO: pipelined
    metaArray.io.w.addr := Mux(isHit && ~wbCache, wSet, rwSet)
    metaArray.io.w.mask.get := choseWayOH
    val metaArrayWrData = Wire(new DCacheMeta)
    metaArrayWrData.valid := wbCache || wbWrHit
    metaArrayWrData.dirty := wbWrHit
    val metaWrData = WireInit(VecInit.tabulate(dcacheWays)(_ => 0.U(metaBits.W)))
    metaWrData.zipWithIndex.foreach{
        case(m,i) => 
            when(choseWayOH(i)){
                m := metaArrayWrData.asUInt
            }
    }
    metaArray.io.w.data := metaWrData.asUInt

    dataBank.io.w.en := wbCache || wbWrHit
    dataBank.io.w.set := rwSet
    dataBank.io.w.way := OHToUInt(choseWayOH)
    dataBank.io.w.data := Mux(isHit && ~wbCache, wData, refillData) 
    // dataBank.io.w.memType := rwMemType
    dataBank.io.w.mask := Mux(isHit && ~wbCache, wmask, Fill(maskSegments, 1.U)) // ! miss and refill data should replace whole cache line


    // send cache read resp
    r.resp.valid := isHit || (wbCache && busy) // writeback data will stay one cycle
    r.resp.bits.data := Mux(isHit, dataBankRdData, ReadMask(refillData, 0.U, rMemType, xlen)) // <dataBank read or refill bypass>
    
    ackRead := r.resp.valid
    
    // reset flags
    val wbCache_dly1 = RegNext(wbCache)
    // val rdHit_dly1 = RegNext(rdHit)
    when(wbCache_dly1 || wbWrHit || ackRead) {
        busy := false.B
        reqFire := false.B
        refillDataReg := 0.U
        rReqValidReg := false.B
        wReqValidReg := false.B
        // rdReady := false.B
        ackRead := false.B
    }
}


object DCacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the DCache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCache()(defaultConfig), Array("--target-dir", "build"))
    // (new chisel3.stage.ChiselStage).emitVerilog(new DCacheDataBank(UInt(64.W)), Array("--target-dir", "build"))
}

