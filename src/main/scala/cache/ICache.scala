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

class ICache()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DCacheIO)
    io.write <> DontCare

    val cacheSize = dcacheSets * dcacheWays * dcacheBanks *dcacheBlockBytes
    val setBits = log2Ceil(dcacheSets)
    val metaBits = (new DCacheMeta).getWidth
    println("----------ICache info----------")
    println(s" cacheSize: ${cacheSize} Byte")
    println(s" sets:${dcacheSets}  ways:${dcacheWays}  blockBytes:${dcacheBlockBytes}")
    println(s" byteOffsetBits: ${dcacheByteOffsetBits}")
    println(s" blockBits: ${dcacheBlockBits}")
    println(s" setBits: ${dcacheSetBits}")
    println(s" tagBits: ${dcacheTagBits}")

    val loadPipe = Module(new LoadPipe)

    val dataBankArray = Module(new DataBankArray)
    val directory = Module(new DCacheDirectory)

    loadPipe.io.load <> io.read
    loadPipe.io.dataBank <> dataBankArray.io
    loadPipe.io.dir <> directory.io
    io.tlbus <> loadPipe.io.tlbus

    io.tlbus.req.bits.source := MASTER_0

}