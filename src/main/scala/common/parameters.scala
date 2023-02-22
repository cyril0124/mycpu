package mycpu.common

import chisel3._
import chisel3.util._

import  org.chipsalliance.cde.config._
// import  org.chipsalliance.cde.Parameters

case object MyCpuParamsKey extends Field[MyCpuParameters](MyCpuParameters())

trait HasMyCpuParameters {
    val p: Parameters 
    val myCpuParams = p(MyCpuParamsKey)

    val xlen = myCpuParams.xlen
    val ilen = myCpuParams.ilen
    val addrWidth = myCpuParams.addrWidth


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

    val enableDebug = myCpuParams.enableDebug
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

    // Memory Map Configuration
    textStart: Int = 0x100,
    globalDataStart: Int = 0x200,
    heapStart: Int = 0x300,
    stackStart: Int = 0x400,
    memSizeByte: Int = 0x500,

    startAddr: Int = 0,

    enableDebug: Boolean = true,
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