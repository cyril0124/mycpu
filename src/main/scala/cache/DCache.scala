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
    // val memType = UInt(3.W)
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

class DCache()(implicit val p: Parameters) extends MyModule {
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

    val loadPipe = Module(new LoadPipe_1)
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

    io.tlbus.req.bits.source := MASTER_1
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

