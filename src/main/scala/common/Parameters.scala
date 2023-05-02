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

    val dcacheBlockSize = myCpuParams.dcacheBlockSize
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

    def addrToDCacheBlockAddr(addr: UInt): UInt = {
      Cat(addr(xlen-1, dcacheBlockBits + dcacheByteOffsetBits), Fill(dcacheBlockBits + dcacheByteOffsetBits, 0.U))
    }

    def dcacheMergeData(oldData: UInt, newData: UInt, mask: UInt): UInt = {
      val tempMask = FillInterleaved(8, mask) 
      (~tempMask & oldData) | (tempMask & newData)
    }

    val icacheRdWays = myCpuParams.icacheRdWays

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

    val startAddr = myCpuParams.startAddr

    val memRomBegin = myCpuParams.memRomBegin
    val memRomEnd = myCpuParams.memRomEnd
    val memRamBegin = myCpuParams.memRamBegin 
    val memRamEnd = myCpuParams.memRamEnd

    // Bus Configuration
    val nrBusMaster = myCpuParams.nrBusMaster
    val nrBusSlave = myCpuParams.nrBusSlave
    val busBeatSize = myCpuParams.busBeatSize
    val busBeatWidth = myCpuParams.busBeatSize * 8 
    val busMaskWidth = myCpuParams.xlen / 8
    val busMaxBeat = myCpuParams.busMaxBeat

    val simulation = myCpuParams.simulation
    val debugThreshold = myCpuParams.debugThreshold

    val instMemSize = myCpuParams.instMemSize
    val enableRegStatus = myCpuParams.enableRegStatus

    val rfSets = myCpuParams.rfSets
    val rfAddrWidth = log2Up(rfSets)
    val rfRdPort = myCpuParams.rfRdPort
    val rfWrPort = myCpuParams.rfWrPort
    val rfDebug = myCpuParams.rfDebug
    // val rfStateOut = myCpuParams.rfStateOut

    val romReadWidth = busBeatWidth // myCpuParams.romReadWidth
    require(romReadWidth >= busBeatWidth, "error params, romReadWidth < busBeatWidth")
    

    val logEnable = myCpuParams.logEnable
}

case class MyCpuParameters
(
    ilen: Int = 32,
    xlen: Int = 32,
    addrWidth: Int = 32,
    instMemSize: Int = 1024,
    resetPc: Int = 0,
    romSize: Int = 0x00020000,
    ramSize: Int = 1024,

    romReadWidth: Int = 4 * 8, 
    busBeatSize: Int = 4,
    busMaxBeat: Int = 32,

    // DCache Configuration
    dcacheWays: Int = 4,
    dcacheSets: Int = 512,
    dcacheBlockSize: Int = 4,
    dcacheBanks: Int = 2,

    // ICache Configuration
    icacheRdWays: Int = 4,

    startAddr: Int = 0,
    memRomBegin: Int = 0x00000000,
    memRomEnd: Int = 0x10000000, //0x00002000,
    memRamBegin: Int = 0x10000000, //0x00002000,
    memRamEnd: Int = 0x20000000, //0x00004000,

    nrBusMaster: Int = 2,
    nrBusSlave: Int = 2,

    simulation: Boolean = false,
    debugThreshold: Int = 0, //0: HIGH  1: MEDIAN  2: LOW
    enableRegStatus: Boolean = true,

    rfSets: Int = 32,
    rfRdPort: Int = 2,
    rfWrPort: Int = 1,
    rfDebug: Boolean = false,
    // rfStateOut: Boolean = true,

    logEnable: Boolean = false

)
{

}

object Parameters {
  val ADDR_WIDTH        = 32
  val ADDR_ALIGN_WIDTH  = log2Ceil(ADDR_WIDTH / 8)
  val DATA_WIDTH        = 32
  val INST_WIDTH        = 32
  val XLEN              = DATA_WIDTH
  val ILEN              = INST_WIDTH

  // branch predictor
  val GHR_WIDTH         = 5
  val PRED_IDX_WIDTH    = GHR_WIDTH - 1
  val PHT_SIZE          = 1 << GHR_WIDTH
  val BTB_INDEX_WIDTH   = 8
  val BTB_PC_WIDTH      = ADDR_WIDTH - BTB_INDEX_WIDTH - ADDR_ALIGN_WIDTH
  val BTB_TARGET_WIDTH  = ADDR_WIDTH - ADDR_ALIGN_WIDTH
  val BTB_SIZE          = 1 << BTB_INDEX_WIDTH
}