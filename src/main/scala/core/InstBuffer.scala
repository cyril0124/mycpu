package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._
import firrtl.Utils

class InstBufferEntry()(implicit val p: Parameters) extends MyBundle {
    val inst = UInt(xlen.W)
    val valid = Bool()
}

class InstBufferIO()(implicit val p: Parameters) extends MyBundle {
    val in = Flipped(Decoupled(new Bundle{
        val icache = (new ICacheReadResp)
        val pc = UInt(xlen.W)
        val flush = Bool()
    }))
    val out = Decoupled(new Bundle{
        val inst = Vec(icacheRdWays, new InstBufferEntry)
        val pc = UInt(xlen.W)
    })
    val status = Output(new Bundle{
        val back_pressure = Bool()
        val full = Bool()
    })
}

class InstBuffer()(implicit val p: Parameters) extends MyModule {
    val io = IO(new InstBufferIO)
    
    val totalEntries = icacheRdWays * 2
    val entries = Seq.fill(icacheRdWays)(Module(new Queue(new InstBufferEntry, totalEntries, flow = false, hasFlush = true)))
    val pcQueue = Module(new Queue(UInt(xlen.W), icacheRdWays * 2, flow = false, hasFlush = true))

    io.status.back_pressure := entries(0).io.count >= (totalEntries - 3).U
    io.status.full := entries(0).io.count === (totalEntries - 2).U 
    io.in.ready := entries.map(e => e.io.enq.ready).reduce(_&&_)
    io.out.valid := entries.map(e => e.io.deq.valid).reduce(_&&_)

    val mask = Wire(UInt(icacheRdWays.W)) 
    mask := Fill(icacheRdWays, 1.U) >> (icacheRdWays.U - io.in.bits.icache.size)
    for( i <- 0 until icacheRdWays) {
        entries(i).io.flush.get := io.in.bits.flush
        entries(i).io.enq.valid := io.in.valid
        entries(i).io.enq.bits.inst := io.in.bits.icache.inst(i)
        entries(i).io.enq.bits.valid := mask(i)
        entries(i).io.deq.ready := io.out.ready
        io.out.bits.inst(i) := entries(i).io.deq.bits
    }

    pcQueue.io.flush.get := io.in.bits.flush
    pcQueue.io.enq.bits := io.in.bits.pc
    pcQueue.io.enq.valid := io.in.valid

    io.out.bits.pc <> pcQueue.io.deq.bits
    pcQueue.io.deq.ready := io.out.ready
}