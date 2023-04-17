package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

class InstBufferEntry()(implicit val p: Parameters) extends MyBundle {
    val inst = UInt(xlen.W)
    val valid = Bool()
}

class InstBufferIO()(implicit val p: Parameters) extends MyBundle {
    val icache = Flipped(Decoupled(new ICacheReadResp))
    val out = Decoupled(Vec(icacheRdWays, new InstBufferEntry))
    val flush = Input(Bool())
}

class InstBuffer()(implicit val p: Parameters) extends MyModule {
    val io = IO(new InstBufferIO)
    
    val entries = Seq.fill(icacheRdWays)(Module(new Queue(new InstBufferEntry, icacheRdWays, flow = false, hasFlush = true)))

    io.icache.ready := entries.map(e => e.io.enq.ready).reduce(_&&_)
    io.out.valid := entries.map(e => e.io.deq.valid).reduce(_&&_)
    val mask = Wire(UInt(icacheRdWays.W)) 
    mask := Fill(icacheRdWays, 1.U) >> (icacheRdWays.U - io.icache.bits.size)
    for( i <- 0 until icacheRdWays) {
        entries(i).io.flush.get := io.flush
        entries(i).io.enq.valid := io.icache.valid
        entries(i).io.enq.bits.inst := io.icache.bits.inst(i)
        entries(i).io.enq.bits.valid := mask(i)
        entries(i).io.deq.ready := io.out.ready
        io.out.bits(i) := entries(i).io.deq.bits
    }

}