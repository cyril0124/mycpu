package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import os.group
import dataclass.data
import firrtl.flattenType


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
        val hit = Bool() // hit or miss
    })
}

class CacheWriteBus()(implicit val p: Parameters) extends MyBundle{
    val req = Flipped(Decoupled(new Bundle{
        val addr = UInt(xlen.W)
        val data = UInt(xlen.W)
        val memType = UInt(3.W)
    }))
}

class CacheMissReq()(implicit val p: Parameters) extends MyBundle{
    val addr = UInt(xlen.W)
}

class CacheRefillResp()(implicit val p: Parameters) extends MyBundle{
    val data = UInt(xlen.W)
}

class DCacheIO()(implicit val p: Parameters) extends MyBundle{
    val read = new CacheReadBus
    val write = new CacheWriteBus
    val missReq = Decoupled(new CacheMissReq)
    val refillResp = Flipped(Decoupled(new CacheRefillResp))
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
    
    val bankRam = Seq.fill(nrWay)(Module(new SRAMTemplate(genWidth, nrSet, maskSegments)))
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
    // io.read <> DontCare
    // io.write <> DontCare

    // for Dacahe we have only one bank
    val cacheSize = nrSet * nrWay * blockBytes / 1024 // unit: KB 
    // TODO: currently we did not support virtual memory
    val tagBits = xlen - log2Ceil(cacheSize)
    val blockOffsetBits = log2Ceil(blockBytes)
    val setBits = log2Ceil(nrSet)
    println(s"Cache size is ${cacheSize}KB\n\t way = ${nrWay}\n\t set = ${nrSet}\n\t blockByte = ${blockBytes}\n")

    // TODO: support unaligned address read and write 
    io.write.req.ready := true.B
    io.read.req.ready := true.B
    val wReqValid = RegInit(false.B)
    val wReqReg = RegEnable(io.write.req.bits, io.write.req.fire)
    val wMemType = Mux(~io.write.req.fire, wReqReg.memType, io.write.req.bits.memType)
    val wAddr = Mux(~io.write.req.fire, wReqReg.addr, io.write.req.bits.addr)
    val wSet = Mux(~io.write.req.fire, wReqReg.addr(setBits, blockOffsetBits), io.write.req.bits.addr(setBits, blockOffsetBits))
    val wTag = Mux(~io.write.req.fire, wReqReg.addr(xlen-1, tagBits), io.write.req.bits.addr(xlen-1, tagBits))
    val wData = Mux(~io.write.req.fire, wReqReg.data, io.write.req.bits.data)

    val rReqValid = RegInit(false.B)
    val rReqReg = RegEnable(io.read.req.bits, io.read.req.fire)
    val rMemType = Mux(~io.read.req.fire, rReqReg.memType, io.read.req.bits.memType)
    val rAddr = Mux(~io.read.req.fire, rReqReg.addr, io.read.req.bits.addr)
    val rSet = Mux(~io.read.req.fire, rReqReg.addr(setBits, blockOffsetBits), io.read.req.bits.addr(setBits, blockOffsetBits))
    val rTag = Mux(~io.read.req.fire, rReqReg.addr(xlen-1, tagBits), io.read.req.bits.addr(xlen-1, tagBits))

    // TODO:
    val refill = WireInit(false.B)
    val refillDataReg = WireInit(0.U((blockBytes * 8).W))
    val refillData = WireInit(0.U((blockBytes * 8).W))
    val choseWay = WireInit(0.U(nrWay.W))

    when(io.write.req.fire) {
        wReqValid := true.B
    }
    when(io.read.req.fire) {
        rReqValid := true.B
    }

    val tagArray = Module(new SRAMTemplate(width = tagBits * nrWay, depth = nrSet, maskSegments = nrWay))
    // tagArray.io <> DontCare
    val tagRdData = tagArray.io.r.data.asTypeOf(Vec(nrWay, UInt(tagBits.W)))
    tagArray.io.r.addr := Mux(io.read.req.valid, rSet, wSet)
    tagArray.io.r.en := io.read.req.fire || io.write.req.fire

    val metaArray = Module(new SRAMTemplate(width = (new DCacheMeta).getWidth * nrWay, depth = nrSet, maskSegments = nrWay))
    // metaArray.io <> DontCare
    val metaRdData = metaArray.io.r.data.asTypeOf(Vec(nrWay, new DCacheMeta))
    metaArray.io.r.addr := Mux(io.read.req.valid, rSet, wSet)
    metaArray.io.r.en := io.read.req.fire || io.write.req.fire

    val rMatchVec = Cat(tagRdData.map(t => t === rTag).reverse) & Cat(metaRdData.map(m => m.valid).reverse)
    val rHit = rMatchVec.orR
    val rHitWay = OHToUInt(rMatchVec)

    val wMatchVec = Cat(tagRdData.map(t => t === wTag).reverse) & Cat(metaRdData.map(m => m.valid).reverse)
    val wHit = wMatchVec.orR
    val wHitWay = OHToUInt(wMatchVec)

    when(rHit && io.read.req.fire) {
        printf(cf"read hit! set: ${rSet}, way: ${rHitWay}\n")
    }
    when(~rHit && io.read.req.fire) {
        printf(cf"read miss! addr: ${rAddr}, set: ${rSet}\n")
    }

    val invalidWayVec = Cat(metaRdData.map(m => m.valid === false.B))
    val hasInvalidWay = invalidWayVec.orR
    val replaceWay = "b0001".U // TODO: implement replace policy
    choseWay := OHToUInt(Mux(hasInvalidWay, PriorityEncoderOH(invalidWayVec), replaceWay))

    // for DCache DataBank blockByte is 64bit ==> 8-bytes 
    val dataBank = Module(new DCacheDataBank(UInt((blockBytes * 8).W), nrSet, nrWay))
    val dataBankRdData = dataBank.io.r.data
    // dataBank.io <> DontCare
    dataBank.io.r.memType := io.read.req.bits.memType
    dataBank.io.r.en := rHit && io.read.req.valid
    dataBank.io.r.set := rSet
    dataBank.io.r.way := rHitWay

    io.read.resp.bits.hit := rHit
    io.read.resp.valid := RegNext(rHit || refill)
    io.read.resp.bits.data := dataBankRdData // TODO: refill

    tagArray.io.w.en := refill
    tagArray.io.w.addr := Mux(rReqValid, rSet, wSet)
    tagArray.io.w.mask.get := Mux(wHit || rHit, Mux(rReqValid, rHitWay, wHitWay), choseWay)
    tagArray.io.w.data := Mux(rReqValid, rTag, wTag)

    metaArray.io.w.en := refill || wHit
    metaArray.io.w.addr := Mux(rReqValid, rSet, wSet)
    metaArray.io.w.mask.get := Mux(wHit || rHit, Mux(rReqValid, rHitWay, wHitWay), choseWay)
    val metaWrData = Wire(new DCacheMeta)
    metaWrData.dirty := Mux(wReqValid, wHit, 0.U)
    metaWrData.valid := wHit || refill
    metaArray.io.w.data := metaWrData.asUInt 

    dataBank.io.w.en := refill || wHit
    dataBank.io.w.set := Mux(wReqValid, wSet, rSet)
    dataBank.io.w.way := Mux(wHit || rHit, Mux(rReqValid, rHitWay, wHitWay), choseWay)
    dataBank.io.w.memType := "b011".U // 64bit
    dataBank.io.w.data := Mux(wReqValid, wData, refillData)

    io.missReq.valid := ~rHit
    io.missReq.bits.addr := Mux(rReqValid, rAddr, wAddr)
    // TODO: Release Dirty Data

    val refillReg = RegNext(io.refillResp.fire)
    refill := io.refillResp.fire
    refillDataReg := RegEnable(io.refillResp.bits.data, io.refillResp.fire)
    refillData := Mux(io.refillResp.fire, io.refillResp.bits.data, refillDataReg)
    io.refillResp.ready := true.B

    when(refill) {
        when(wReqValid) {
            printf(cf"refill for write miss addr: ${wAddr} data: ${refillData} !\n")
        }
        when(rReqValid) {
            printf(cf"refill for read miss addr: ${rAddr} data: ${refillData} !\n")
        }
    }

    when(refillReg || rHit || wHit) {
        wReqValid := false.B
        rReqValid := false.B
    }

    // MultiDontTouch(tagRdData,metaRdData,dataBank.io)

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