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

class DCache_1()(implicit val p: Parameters) extends MyModule {
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

    val loadPipe = Module(new LoadPipe_2)
    val storePipe = Module(new StorePipe_2)
    val mshr = Module(new MSHR)
    val refillPipe = Module(new RefillPipe)
    val writebackQueue = Module(new WritebackQueue)
    val dataBankArray = Module(new DataBankArray)
    val directory = Module(new DCacheDirectory)

    loadPipe.io.dir.resp.valid := directory.io.read.resp.valid
    loadPipe.io.dir.resp.bits <> directory.io.read.resp.bits
    storePipe.io.dir.read.resp.valid := directory.io.read.resp.valid
    storePipe.io.dir.read.resp.bits <> directory.io.read.resp.bits

    loadPipe.io.dataBank.resp.valid := dataBankArray.io.read.resp.valid
    loadPipe.io.dataBank.resp.bits <> dataBankArray.io.read.resp.bits
    storePipe.io.dataBank.read.resp.valid := dataBankArray.io.read.resp.valid
    storePipe.io.dataBank.read.resp.bits <> dataBankArray.io.read.resp.bits

    loadPipe.io.load.req <> io.read.req
    storePipe.io.store.req <> io.write.req

    mshr.io.tasks.refill.req <> refillPipe.io.req
    mshr.io.tasks.refill.resp <> refillPipe.io.resp
    mshr.io.tasks.writeback.req <> writebackQueue.io.req
    mshr.io.tasks.writeback.resp <> writebackQueue.io.resp

    val mshrReqArb = Module(new Arbiter(chiselTypeOf(mshr.io.req.bits), 2))
    mshrReqArb.io.in(0) <> loadPipe.io.mshr
    mshrReqArb.io.in(1) <> storePipe.io.mshr
    mshr.io.req <> mshrReqArb.io.out

    val tlbusReqArb = Module(new Arbiter(chiselTypeOf(io.tlbus.req.bits), 2))
    tlbusReqArb.io.in(0) <> writebackQueue.io.tlbus.req
    tlbusReqArb.io.in(1) <> refillPipe.io.tlbus.req
    io.tlbus.req <> tlbusReqArb.io.out

    writebackQueue.io.tlbus.resp.valid := io.tlbus.resp.valid
    writebackQueue.io.tlbus.resp.bits <> io.tlbus.resp.bits
    refillPipe.io.tlbus.resp.valid := io.tlbus.resp.valid
    refillPipe.io.tlbus.resp.bits <> io.tlbus.resp.bits
    io.tlbus.resp.ready := writebackQueue.io.tlbus.resp.ready || refillPipe.io.tlbus.resp.ready
    
    
    val loadRespArb = Module(new Arbiter(chiselTypeOf(io.read.resp.bits), 2))
    loadRespArb.io.in(0) <> loadPipe.io.load.resp
    loadRespArb.io.in(1) <> mshr.io.resp.load
    io.read.resp <> loadRespArb.io.out

    val storeRespArb = Module(new Arbiter(chiselTypeOf(io.write.resp.bits), 2))
    storeRespArb.io.in(0) <> storePipe.io.store.resp
    storeRespArb.io.in(1) <> mshr.io.resp.store
    io.write.resp <> storeRespArb.io.out


    val dataBankRdReqArb = Module(new Arbiter(chiselTypeOf(dataBankArray.io.read.req.bits), 2))
    dataBankRdReqArb.io.in(0) <> storePipe.io.dataBank.read.req
    dataBankRdReqArb.io.in(1) <> loadPipe.io.dataBank.req
    dataBankArray.io.read.req <> dataBankRdReqArb.io.out

    val dirRdReqArb = Module(new Arbiter(chiselTypeOf(directory.io.read.req.bits), 2))
    dirRdReqArb.io.in(0) <> storePipe.io.dir.read.req
    dirRdReqArb.io.in(1) <> loadPipe.io.dir.req
    directory.io.read.req <> dirRdReqArb.io.out


    val dataBankWrArb = Module(new Arbiter(chiselTypeOf(dataBankArray.io.write.req.bits), 3))
    dataBankWrArb.io.in(0) <> storePipe.io.dataBank.write.req
    dataBankWrArb.io.in(1) <> refillPipe.io.dataWrite.req
    dataBankWrArb.io.in(2) <> mshr.io.dataWrite.req
    dataBankArray.io.write.req <> dataBankWrArb.io.out

    val dirWrArb = Module(new Arbiter(chiselTypeOf(directory.io.write.req.bits), 3))
    dirWrArb.io.in(0) <> storePipe.io.dir.write.req
    dirWrArb.io.in(1) <> refillPipe.io.dirWrite.req
    dirWrArb.io.in(2) <> mshr.io.dirWrite.req
    directory.io.write.req <> dirWrArb.io.out

    io.tlbus.req.bits.source := MASTER_1

}

object DCache_1GenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the DCache_1 hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DCache_1()(defaultConfig), Array("--target-dir", "build"))
}