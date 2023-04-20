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
    val in = new Bundle{
        val icache = Flipped(Decoupled(new ICacheReadResp))
        val pc = Flipped(Decoupled(UInt(xlen.W)))
        val flush = Input(Bool())
    }
    val out = new Bundle{
        val inst = Decoupled(Vec(icacheRdWays, new InstBufferEntry))
        val pc = Decoupled(UInt(xlen.W))
        val back_pressure = Output(Bool())
    }
}

class InstBuffer()(implicit val p: Parameters) extends MyModule {
    val io = IO(new InstBufferIO)
    
    val entries = Seq.fill(icacheRdWays)(Module(new Queue(new InstBufferEntry, icacheRdWays * 2, flow = false, hasFlush = true)))
    val pcQueue = Module(new Queue(UInt(xlen.W), icacheRdWays * 2, flow = false, hasFlush = true))

    io.out.back_pressure := entries(0).io.count >= (icacheRdWays / 2).U
    io.in.icache.ready := entries.map(e => e.io.enq.ready).reduce(_&&_)
    io.out.inst.valid := entries.map(e => e.io.deq.valid).reduce(_&&_)

    val mask = Wire(UInt(icacheRdWays.W)) 
    mask := Fill(icacheRdWays, 1.U) >> (icacheRdWays.U - io.in.icache.bits.size)
    for( i <- 0 until icacheRdWays) {
        entries(i).io.flush.get := io.in.flush
        entries(i).io.enq.valid := io.in.icache.valid
        entries(i).io.enq.bits.inst := io.in.icache.bits.inst(i)
        entries(i).io.enq.bits.valid := mask(i)
        entries(i).io.deq.ready := io.out.inst.ready
        io.out.inst.bits(i) := entries(i).io.deq.bits
    }

    pcQueue.io.flush.get := io.in.flush
    pcQueue.io.enq.bits := io.in.pc.bits
    pcQueue.io.enq.valid := io.in.pc.valid
    io.in.pc.ready := pcQueue.io.enq.ready

    io.out.pc <> pcQueue.io.deq
}