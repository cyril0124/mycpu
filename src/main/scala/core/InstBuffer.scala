package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._
import mycpu.common.Parameters._

class InstBufferEntry()(implicit val p: Parameters) extends MyBundle {
    val inst = UInt(ilen.W)
    val valid = Bool()
    val predictBrTaken = Bool()
    val predictIdx = UInt(PRED_IDX_WIDTH.W)
}

class InstBufferIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new IFUOutput))
    val out = Decoupled(new Bundle{
        val inst = Vec(icacheRdWays, new InstBufferEntry)
        val pc = UInt(xlen.W)
    })
    val status = Output(new Bundle{
        val backPressure = Bool()
        val full = Bool()
    })
    val flush = Input(Bool())
}

class InstBuffer()(implicit val p: Parameters) extends MyModule {
    val io = IO(new InstBufferIO)
    
    val totalEntries = icacheRdWays * 2
    val entries = Seq.fill(icacheRdWays)(Module(new Queue(new InstBufferEntry, totalEntries, flow = false, hasFlush = true)))
    val pcQueue = Module(new Queue(UInt(xlen.W), icacheRdWays * 2, flow = false, hasFlush = true))

    io.status.backPressure := entries(0).io.count >= (totalEntries - 3).U
    io.status.full := entries(0).io.count === (totalEntries - 2).U

    io.in.ready := entries(0).io.enq.ready
    io.out.valid := entries(0).io.deq.valid

    val mask = Wire(UInt(icacheRdWays.W)) 
    mask := Fill(icacheRdWays, 1.U) >> (icacheRdWays.U - io.in.bits.size)
    for( i <- 0 until icacheRdWays) {
        entries(i).io.enq.valid := io.in.valid
        entries(i).io.enq.bits.inst := io.in.bits.inst(i)
        entries(i).io.enq.bits.predictBrTaken := io.in.bits.predictBrTaken(i)
        entries(i).io.enq.bits.predictIdx := io.in.bits.predictIdx(i)
        entries(i).io.enq.bits.valid := mask(i)
        

        entries(i).io.deq.ready := io.out.ready
        io.out.bits.inst(i) := entries(i).io.deq.bits

        entries(i).io.flush.get := io.flush
    }

    pcQueue.io.flush.get := io.flush
    pcQueue.io.enq.bits := io.in.bits.pc
    pcQueue.io.enq.valid := io.in.valid

    io.out.bits.pc <> pcQueue.io.deq.bits
    pcQueue.io.deq.ready := io.out.ready
}