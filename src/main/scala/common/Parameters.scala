package mycpu.common

import chisel3._
import chisel3.util._

import  org.chipsalliance.cde.config._

case object MyCpuParamsKey extends Field[MyCpuParameters](MyCpuParameters())

trait HasMyCpuParameters {
    val p: Parameters 
    val myCpuParams = p(MyCpuParamsKey)

    val xlen = myCpuParams.xlen
    val ilen = myCpuParams.ilen
    val addrWidth = myCpuParams.addrWidth
    val resetPc = myCpuParams.resetPc

    val romSize = myCpuParams.romSize
    val ramSize = myCpuParams.ramSize

    val blockBytes = myCpuParams.xlen / 8
    val blockOffsetBits = log2Ceil(blockBytes)

      // DCache Configuration
    val dcacheWays = myCpuParams.dcacheWays
    val dcacheWayBits = log2Ceil(myCpuParams.dcacheWays)

    val dcacheSets = myCpuParams.dcacheSets
    val dcacheSetBits = log2Ceil(myCpuParams.dcacheSets)

    val dcacheBlockSize = 2
    val dcacheBlockBits = log2Ceil(dcacheBlockSize)

    val dcacheBlockBytes = myCpuParams.xlen / 8
    val dcacheByteOffsetBits = log2Ceil(dcacheBlockBytes)

    val dcacheBanks = myCpuParams.dcacheBanks
    val dcacheBankBits = 0//log2Ceil(dcacheBanks)

    val dcacheTagBits = xlen - dcacheSetBits - dcacheBankBits - dcacheBlockBits - dcacheByteOffsetBits
    
    
    // | Tag | Set | Bank | Block | Byte |
    def addrToDCacheTag(addr: UInt): UInt = {
      addr(xlen - 1, dcacheSetBits + dcacheBankBits + dcacheBlockBits + dcacheByteOffsetBits)
    }

    def addrToDCacheSet(addr: UInt): UInt = {
      addr(dcacheSetBits + dcacheByteOffsetBits + dcacheBlockBits + dcacheBankBits - 1, dcacheByteOffsetBits + dcacheBlockBits + dcacheBankBits)
    }

    // def addrToDCacheBankOH(addr: UInt): UInt = {
    //   UIntToOH(addr(dcacheBankBits + dcacheByteOffsetBits + dcacheBlockBits - 1, dcacheByteOffsetBits + dcacheBlockBits))
    // }

    def addrToDCacheBlockOH(addr: UInt): UInt = {
      UIntToOH(addr(dcacheBlockBits + dcacheByteOffsetBits - 1, dcacheByteOffsetBits))
    }


    // TODO:
    /**           Memory Map Configuration
      *  ____________   _____________________________
      * |   OS / IO  |                              |
      * |____________|                              |
      * |    Stack V | <---- stackStart  sp         |
      * |          V |                              |
      * | ^          |                              |
      * | ^  Heap    |                          memSizeByte
      * |____________| <---- heapStart              |
      * | GlobalData |                              |
      * |____________| <---- globalDataStart  gp    |
      * |   Text     |                              |
      * |____________| <---- txtStart  PC           |
      * |   EXCP     |                              |
      * |____________|  ____________________________|
      * 
      */
    val textStart = myCpuParams.textStart
    val globalDataStart = myCpuParams.globalDataStart
    val heapStart = myCpuParams.heapStart
    val stackStart = myCpuParams.stackStart
    val memSizeByte = myCpuParams.memSizeByte

    val startAddr = myCpuParams.startAddr

    val memRomBegin = myCpuParams.memRomBegin
    val memRomEnd = myCpuParams.memRomEnd
    val memRamBegin = myCpuParams.memRamBegin 
    val memRamEnd = myCpuParams.memRamEnd

    // Bus Configuration
    val nrBusMaster = myCpuParams.nrBusMaster
    val nrBusSlave = myCpuParams.nrBusSlave
    val busBeatSize = myCpuParams.xlen / 8
    val busMaskWidth = myCpuParams.xlen / 8

    val simulation = myCpuParams.simulation
    val debugThreshold = myCpuParams.debugThreshold

    val instMemSize = myCpuParams.instMemSize
    val enableRegStatus = myCpuParams.enableRegStatus

    val rfSets = myCpuParams.rfSets
    val rfAddrWidth = log2Up(rfSets)
    val rfRdPort = myCpuParams.rfRdPort
    val rfWrPort = myCpuParams.rfWrPort
    val rfDebug = myCpuParams.rfDebug
    val rfStateOut = myCpuParams.rfStateOut
    
}

case class MyCpuParameters
(
    ilen: Int = 32,
    xlen: Int = 32,
    addrWidth: Int = 32,
    instMemSize: Int = 1024,
    resetPc: Int = 0,
    romSize: Int = 1024,
    ramSize: Int = 1024,

    // DCache Configuration
    dcacheWays: Int = 4,
    dcacheSets: Int = 64,
    // dcacheBlockBytes: Int = 8,
    dcacheBanks: Int = 2,

    // Memory Map Configuration
    textStart: Int = 0x100,
    globalDataStart: Int = 0x200,
    heapStart: Int = 0x300,
    stackStart: Int = 0x400,
    memSizeByte: Int = 0x500,

    startAddr: Int = 0,
    memRomBegin: Int = 0x00000000,
    memRomEnd: Int = 0x00002000,
    memRamBegin: Int = 0x00002000,
    memRamEnd: Int = 0x00004000,

    nrBusMaster: Int = 2,
    nrBusSlave: Int = 2,

    simulation: Boolean = false,
    debugThreshold: Int = 0, //0: HIGH  1: MEDIAN  2: LOW
    enableRegStatus: Boolean = true,

    rfSets: Int = 32,
    rfRdPort: Int = 2,
    rfWrPort: Int = 1,
    rfDebug: Boolean = false,
    rfStateOut: Boolean = true,

)
{

}