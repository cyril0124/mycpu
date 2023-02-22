package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._


class PipelineCtrlBundle()(implicit val p: Parameters) extends MyBundle{
    val stall = Output(Bool())
    val flush = Output(Bool())
}

