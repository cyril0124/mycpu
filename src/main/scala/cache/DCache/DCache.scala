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
    val mask = UInt(dcacheBlockBytes.W) 
}

class CacheWriteResp()(implicit val p: Parameters) extends MyBundle{
    val status = Bool()
    // val stageID = UInt(2.W)
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


class DCache()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DCacheIO)
    
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
    val mshr = Module(new MSHR)
    val refillPipe = Module(new RefillPipe)
    val wb = Module(new WritebackQueue)
    val db = Module(new DataBankArray)
    val dir = Module(new DCacheDirectory)

    loadPipe.io.dir.resp.valid := dir.io.read.resp.valid
    loadPipe.io.dir.resp.bits <> dir.io.read.resp.bits
    storePipe.io.dir.read.resp.valid := dir.io.read.resp.valid
    storePipe.io.dir.read.resp.bits <> dir.io.read.resp.bits

    loadPipe.io.dataBank.resp := db.io.read.resp
    storePipe.io.dataBank.read.resp := db.io.read.resp

    loadPipe.io.load.req <> io.read.req
    storePipe.io.store.req <> io.write.req

    mshr.io.tasks.refill.req <> refillPipe.io.req
    mshr.io.tasks.refill.resp <> refillPipe.io.resp
    mshr.io.tasks.writeback.req <> wb.io.req
    mshr.io.tasks.writeback.resp <> wb.io.resp

    val mshrReqArb = Module(new Arbiter(chiselTypeOf(mshr.io.req.bits), 2))
    mshrReqArb.io.in(0) <> loadPipe.io.mshr
    mshrReqArb.io.in(1) <> storePipe.io.mshr
    mshr.io.req <> mshrReqArb.io.out

    val tlbusReqArb = Module(new Arbiter(chiselTypeOf(io.tlbus.req.bits), 2))
    tlbusReqArb.io.in(0) <> wb.io.tlbus.req
    tlbusReqArb.io.in(1) <> refillPipe.io.tlbus.req
    io.tlbus.req <> tlbusReqArb.io.out

    wb.io.tlbus.resp.valid := io.tlbus.resp.valid
    wb.io.tlbus.resp.bits <> io.tlbus.resp.bits
    refillPipe.io.tlbus.resp.valid := io.tlbus.resp.valid
    refillPipe.io.tlbus.resp.bits <> io.tlbus.resp.bits
    io.tlbus.resp.ready := wb.io.tlbus.resp.ready || refillPipe.io.tlbus.resp.ready
    
    
    val loadRespArb = Module(new Arbiter(chiselTypeOf(io.read.resp.bits), 2))
    loadRespArb.io.in(0) <> loadPipe.io.load.resp
    loadRespArb.io.in(1) <> mshr.io.resp.load
    io.read.resp <> loadRespArb.io.out

    val storeRespArb = Module(new Arbiter(chiselTypeOf(io.write.resp.bits), 2))
    storeRespArb.io.in(0) <> storePipe.io.store.resp
    storeRespArb.io.in(1) <> mshr.io.resp.store
    io.write.resp <> storeRespArb.io.out


    val dbRdReqArb = Module(new Arbiter(chiselTypeOf(db.io.read.req.bits), 2))
    dbRdReqArb.io.in(0) <> storePipe.io.dataBank.read.req
    dbRdReqArb.io.in(1) <> loadPipe.io.dataBank.req
    db.io.read.req <> dbRdReqArb.io.out

    val dirRdReqArb = Module(new Arbiter(chiselTypeOf(dir.io.read.req.bits), 2))
    dirRdReqArb.io.in(0) <> storePipe.io.dir.read.req
    dirRdReqArb.io.in(1) <> loadPipe.io.dir.req
    dir.io.read.req <> dirRdReqArb.io.out


    val dataBankWrArb = Module(new Arbiter(chiselTypeOf(db.io.write.req.bits), 3))
    dataBankWrArb.io.in(0) <> storePipe.io.dataBank.write.req
    dataBankWrArb.io.in(1) <> refillPipe.io.dataWrite.req
    dataBankWrArb.io.in(2) <> mshr.io.dataWrite.req
    db.io.write.req <> dataBankWrArb.io.out

    val dirWrArb = Module(new Arbiter(chiselTypeOf(dir.io.write.req.bits), 3))
    dirWrArb.io.in(0) <> storePipe.io.dir.write.req
    dirWrArb.io.in(1) <> refillPipe.io.dirWrite.req
    dirWrArb.io.in(2) <> mshr.io.dirWrite.req
    dir.io.write.req <> dirWrArb.io.out

    io.tlbus.req.bits.source := MASTER_1

    SimLog(simulation & logEnable, io.read.req.fire, "[DCache] read req ==> addr: 0x%x\n", io.read.req.bits.addr)
    SimLog(simulation & logEnable, io.read.resp.fire, "[DCache] read resp <== data: 0x%x\n", io.read.resp.bits.data)
    SimLog(simulation & logEnable, io.write.req.fire, "[DCache] write req ==> addr: 0x%x  data: 0x%x\n", io.write.req.bits.addr, io.write.req.bits.data)
    SimLog(simulation & logEnable, io.write.resp.fire, "[DCache] write resp <== \n")
    SimLog(simulation & logEnable, io.tlbus.req.fire && io.tlbus.req.bits.opcode === PutFullData, "[DCache] dirty write back ==> data: 0x%x  addr: 0x%x\n", io.tlbus.req.bits.data, io.tlbus.req.bits.address)
    SimLog(simulation & logEnable, io.tlbus.resp.fire & io.tlbus.resp.bits.opcode === AccessAckData, "[DCache] refill resp <== data: 0x%x ", io.tlbus.resp.bits.data)
}

object DCacheGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the DCache hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCache()(defaultConfig), Array("--target-dir", "build"))
}