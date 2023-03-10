package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


import mycpu.BusReq._
import mycpu.BusMasterId._
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
        val memType = UInt(3.W)
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


class DCacheDataBank[T <: Data](gen: T,nrSet: Int = 64, nrWay: Int = 4) extends Module {
    val io = IO(new Bundle{
        val w = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(nrSet).W))
            val way = Input(UInt(log2Ceil(nrWay).W))
            val data = Input(gen)
            val memType = Input(UInt(3.W)) // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
        }
        val r = new Bundle{
            val en = Input(Bool())
            val set = Input(UInt(log2Ceil(nrSet).W))
            val way = Input(UInt(log2Ceil(nrWay).W))
            val data = Output(gen)
            val memType = Input(UInt(3.W)) // 000: 8-bit  001: 16-bit  010: 32-bit  011: 64-bit
        }
    })

    val genWidth = gen.getWidth // typically this is 64-bit for my design
    val maskSegments = genWidth / 8
    println(s"DataBank maskSegments: ${maskSegments}")
    assert(genWidth % 8 == 0, s"gen width should be mod of 8! genWidth ==> ${genWidth}")
    
    val bankRam = Seq.fill(nrWay)(Module(new SRAMTemplate(genWidth, nrSet, maskSegments))) // sync read
    // val bankRam = Module(new SRAMTemplate_1(gen, nrSet, nrWay))

    val mask8 = Cat((0 until maskSegments).map{ i => if(i<1) 1.U else 0.U}.reverse)
    val mask16 = Cat((0 until maskSegments).map{ i => if(i<2) 1.U else 0.U}.reverse)
    val mask32 = Cat((0 until maskSegments).map{ i => if(i<4) 1.U else 0.U}.reverse)
    val mask64 = Cat((0 until maskSegments).map{ i => if(i<8) 1.U else 0.U}.reverse)

    val wmask = MuxLookup(io.w.memType, Fill(maskSegments, 1.U), Seq(
                "b000".U -> mask8,  // e.g. 0001
                "b001".U -> mask16, // e.g. 0011
                "b010".U -> mask32, // e.g. 1111
                "b011".U -> { // e.g. 1111 1111
                    require(maskSegments >= 8, s"invalid maskSegments! ==> ${maskSegments}")
                    mask64
                },
            ))
    
    // write chosen way one hot code
    val wWayOH = UIntToOH(io.w.way, nrWay)
    for( i <- 0 until nrWay){
        bankRam(i).io.w.en := wWayOH(i) & io.w.en
        bankRam(i).io.w.addr := io.w.set
        bankRam(i).io.w.data := io.w.data
        if(bankRam(i).io.w.mask.isDefined) bankRam(i).io.w.mask.get := wmask        
    }

    // read chosen way one hot code
    val rWayOH = UIntToOH(io.r.way, nrWay)
    val rdataWithMask = WireInit(0.U.asTypeOf(io.r.data))
    val rdata = WireInit(0.U.asTypeOf(io.r.data))
    for( i <- 0 until nrWay){
        bankRam(i).io.r.en := rWayOH(i) & io.r.en
        bankRam(i).io.r.addr := io.r.set
        when(rWayOH(i) & io.r.en){
            rdata := bankRam(i).io.r.data
        }
    }

    // read data should be 'and' with mask according to memType
    rdataWithMask := MuxLookup(io.r.memType, Fill(maskSegments, 1.U), Seq(
        // e.g. 0001 => 00000000 00000000 00000000 11111111 & rdata.asUInt
        "b000".U -> (FillInterleaved(8, mask8) & rdata.asUInt),
        "b001".U -> (FillInterleaved(8, mask16) & rdata.asUInt),
        "b010".U -> (FillInterleaved(8, mask32) & rdata.asUInt),
        "b011".U -> {
            require(maskSegments >= 8, "invalid maskSegments!")
            (FillInterleaved(8, mask64) & rdata.asUInt)
        },
    ))

    io.r.data := rdataWithMask
}

class DCache(nrSet: Int = 64, nrWay: Int = 4, blockBytes: Int = 8)(implicit val p: Parameters) extends MyModule {
    val io = IO(new DCacheIO)
    
    // local param
    val cacheSize = nrSet * nrWay * blockBytes
    val mblockOffsetBits = log2Ceil(blockBytes)
    val setBits = log2Ceil(nrSet)
    val tagBits = xlen - mblockOffsetBits - setBits
    val metaBits = (new DCacheMeta).getWidth
    println(s"cacheSize: ${cacheSize} Byte")
    println(s"blockOffsetBits: ${mblockOffsetBits}")
    println(s"setBits: ${setBits}")
    println(s"tagBits: ${tagBits}")
    
    val r = io.read
    val w = io.write

    val wbCache = Wire(Bool())
    val wbWrHit = Wire(Bool())
    val rdHit = Wire(Bool())
    val reqFire = RegInit(false.B)

    val ackRead = RegInit(false.B)

    val tagRdVec = Wire(Vec(nrWay, UInt(tagBits.W)))
    val metaRdVec = Wire(Vec(nrWay, new DCacheMeta))
    val dataBankRdData = Wire(UInt((blockBytes * 8).W))
    
    // sub module instantiate
    val tagArray = Module(new SRAMTemplate(tagBits * nrWay, nrSet, nrWay))
    val metaArray = Module(new SRAMTemplate(width = metaBits * nrWay, depth = nrSet, maskSegments = nrWay))
    val dataBank = Module(new DCacheDataBank(UInt((blockBytes * 8).W), nrSet, nrWay))

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

    val wMemTypeReg = RegEnable(w.req.bits.memType, 0.U, w.req.fire)
    val wMemType = Mux(w.req.fire, w.req.bits.memType, wMemTypeReg)

    val wDataReg = RegEnable(w.req.bits.data, 0.U, w.req.fire)
    val wData = Mux(w.req.fire, w.req.bits.data, wDataReg)

    val rdReady = RegEnable(true.B, false.B, rReqValidReg || wReqValidReg) // read data will take one cycle delay
    
    when(rReqValid || wReqValid) {
        busy := true.B
    }

    // we only support single request processing either read or write, do not support concurrent request for now
    val rwTag = Mux(rReqValid, rTag, wTag)
    val rwAddr = Mux(rReqValid, rAddr, wAddr)
    val rwSet = Mux(rReqValid, rSet, wSet)
    val rwMemType = Mux(rReqValid, "b011".U, wMemType) // ! miss and refill data should replace whole cache line

    // tag read
    tagRdVec := tagArray.io.r.data.asTypeOf(Vec(nrWay, UInt(tagBits.W)))
    tagArray.io.r.en := (rReqValid || wReqValid) && ~wbCache
    tagArray.io.r.addr := rwSet // Mux(r.req.valid, rSet, wSet)
    
    // meta read
    metaRdVec := metaArray.io.r.data.asTypeOf(Vec(nrWay, new DCacheMeta))
    metaArray.io.r.en := (rReqValid || wReqValid) && ~wbCache
    metaArray.io.r.addr := rwSet // Mux(r.req.valid, rSet, wSet)
    
    // hit or miss
    val tagMatchVec = tagRdVec.map( t => t === rwTag )
    val metaValidVec = metaRdVec.map( m => m.valid )
    val metaDirtyVec = metaRdVec.map( m => m.dirty ) // TODO: dirty
    val matchWayOH = Cat(tagMatchVec.zip(metaValidVec).map{ case(t, m) => t && m }.reverse) // reverse is necessary
    val invalidWayVec = metaRdVec.map( m => m.valid === false.B )
    val invalidWayOH = PriorityMux(invalidWayVec.zipWithIndex.map(x => x._1 -> UIntToOH(x._2.U, nrWay)) )
    val hasInvalidWay = Cat(invalidWayVec).orR
    val replaceWay = "b0100".U // TODO： replace policy... PLRU
    val isHit = Cat(matchWayOH).orR && (rReqValid || wReqValid)
    val choseWayOH = Mux(isHit, matchWayOH, Mux(hasInvalidWay, invalidWayOH, replaceWay))
    val isDirtyWay = ( choseWayOH & Cat(metaDirtyVec) & Cat(metaValidVec) ).orR // the chosen way is a dirty and valid way

    rdHit := rReqValid && isHit
    wbWrHit := wReqValid && isHit // writeback cache when hit and req is write
    wbCache := io.tlbus.resp.fire // writeback cache when miss

    dataBank.io.r.en :=  rReqValid// (rReqValid || wReqValid) && ~wbCache // TODO:
    dataBank.io.r.set := rwSet // TODO: 
    dataBank.io.r.way := OHToUInt(choseWayOH) // TODO:
    dataBank.io.r.memType := rMemType// "b011".U // read 64-bit // TODO:
    dataBankRdData := dataBank.io.r.data // TODO:
    // dataBankRdData := ReadMask(dataBank.io.r.data, 0.U, rwMemType, xlen)

// ----------------------------------miss process-------------------------------------------------------------
// --------------------------stage 1: send sub request to the next level memory-------------------------------
    when(isDirtyWay && ~isHit) { // miss but chosen way is a dirty way
        // TODO: release dirty way, using PutFullData
        io.tlbus.req <> DontCare
        // io.tlbus.req.valid := ~isHit && (rReqValid || wReqValid)
        // io.tlbus.req.bits.opcode := PutFullData
        // io.tlbus.req.bits.source := ID_RAM
        // io.tlbus.req.bits.size := (xlen / 8).U
        // io.tlbus.req.bits.mask := "b1111".U
        // io.tlbus.req.bits.corrupt := false.B
    }.otherwise {
        io.tlbus.req.valid := ~isHit && (rReqValid || wReqValid)
        io.tlbus.req.bits <> DontCare
        io.tlbus.req.bits.address := rwAddr
        io.tlbus.req.bits.opcode := Get
        io.tlbus.req.bits.size := (xlen / 8).U
        io.tlbus.req.bits.source := ID_RAM
        io.tlbus.req.bits.mask := "b1111".U
        io.tlbus.req.bits.corrupt := false.B
        when(io.tlbus.req.fire) {
            reqFire := true.B
        }
    }
    io.tlbus.resp.ready := true.B

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
    val tagWrData = WireInit(VecInit.tabulate(nrWay)(_ => 0.U(tagBits.W)))
    tagWrData.zipWithIndex.foreach{
        case(t,i) => 
            when(choseWayOH(i)){
                t := rwTag
            }
    }
    tagArray.io.w.data := tagWrData.asUInt

    // meta write
    metaArray.io.w.en := wbCache || wbWrHit
    metaArray.io.w.addr := Mux(isHit && ~wbCache, wSet, rwSet)
    metaArray.io.w.mask.get := choseWayOH
    val metaArrayWrData = Wire(new DCacheMeta)
    metaArrayWrData.valid := wbCache || wbWrHit
    metaArrayWrData.dirty := wbWrHit
    val metaWrData = WireInit(VecInit.tabulate(nrWay)(_ => 0.U(metaBits.W)))
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
    dataBank.io.w.memType := rwMemType


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
        rdReady := false.B
        ackRead := false.B
    }
}


object DCacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })

    println("Generating the DCache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCache()(defaultConfig), Array("--target-dir", "build"))
    // (new chisel3.stage.ChiselStage).emitVerilog(new DCacheDataBank(UInt(64.W)), Array("--target-dir", "build"))
}

import chiseltest._

object DCacheRawTest extends App{
    chiseltest.RawTester.test(new DCacheDataBank(UInt(64.W))) { c =>
        c.io.w.data.poke(54.U)
        c.io.w.en.poke(1.U)
        c.io.w.memType.poke("b010".U)
        c.io.w.set.poke(1.U)
        c.io.w.way.poke(3.U)

        c.clock.step()

        c.io.w.en.poke(0.U)
        c.io.r.en.poke(1.U)
        c.io.r.set.poke(1.U)
        c.io.r.way.poke(3.U)
        c.io.r.memType.poke("b010".U)

        c.clock.step()

        // println(s"read:${c.io.r.data.peek().litValue.toString}\n")
    }
}