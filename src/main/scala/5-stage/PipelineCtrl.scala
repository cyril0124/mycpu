package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class PipelineCtrlIO()(implicit val p: Parameters) extends MyBundle{
    val in = Input(new Bundle{
                val brTaken = Bool()
                val excpValid = Bool()
            })
    val out  = Output(new Bundle{
                val fetch = new PipelineCtrlBundle
                val decode = new PipelineCtrlBundle
                val execute = new PipelineCtrlBundle
                val memory = new PipelineCtrlBundle
                val writeback = new PipelineCtrlBundle
            })
}

class PipelineCtrl()(implicit val p: Parameters) extends MyModule{
    val io = IO(new PipelineCtrlIO)

    val outVec = Seq(io.out.fetch, io.out.decode, io.out.execute, io.out.memory, io.out.writeback)
    outVec.foreach{ o => o <> DontCare}

    // branch flush pipeline. when branch is taken, instructions behind and in the decode stage should be flushed.(except fetch stage)
    val brIsTaken = io.in.brTaken === true.B
    val excpValid = io.in.excpValid


    io.out.decode.flush := brIsTaken || excpValid
    io.out.execute.flush := brIsTaken  || excpValid
    io.out.memory.flush := excpValid // ??

}