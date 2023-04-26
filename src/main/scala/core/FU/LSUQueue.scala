package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import LsuDecode._


class LSUQueueEntry()(implicit val p: Parameters) extends MyBundle {
    val busy = Bool()
    val ready = Bool()
    val decInfo = new LSUDecodeInfo
    val addr = UInt(xlen.W)
    val rs2Val = UInt(xlen.W)
    val id = UInt(8.W)
    val rd = UInt(5.W)
}

class  LSUQueueInput()(implicit val p: Parameters) extends MyBundle {
    val decInfo = new LSUDecodeInfo
    val addr = UInt(xlen.W)
    val rs2Val = UInt(xlen.W)
    val id = UInt(8.W)
    val rd = UInt(5.W)
}

class LSUQueueROBInput()(implicit val p: Parameters) extends MyBundle {
    val id = UInt(8.W)
}

class LSUQueue(numEntries: Int)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val enq = Flipped(Decoupled(new LSUQueueInput))
        val deq = Decoupled(Output(new LSUQueueInput)) 
        val rob = Flipped(Valid(new LSUQueueROBInput))
        val flush = Input(Bool())
    })

    val entries = Reg(Vec(numEntries, new LSUQueueEntry))
    val head = RegInit(0.U(log2Ceil(numEntries).W))
    val tail = RegInit(0.U(log2Ceil(numEntries).W))

    val count = RegInit(0.U(log2Ceil(numEntries+1).W))
    val full = count === numEntries.U
    val empty = count === 0.U

    io.enq.ready := !full && !entries(tail).busy
    io.deq.valid := entries(head).busy && entries(head).ready
    io.deq.bits.addr := entries(head).addr
    io.deq.bits.decInfo := entries(head).decInfo
    io.deq.bits.id := entries(head).id
    io.deq.bits.rd := entries(head).rd
    io.deq.bits.rs2Val := entries(head).rs2Val

    when (io.enq.fire) {
        val enq = io.enq.bits
        entries(tail).busy := true.B
        entries(tail).addr := enq.addr
        entries(tail).decInfo := enq.decInfo
        entries(tail).id := enq.id
        entries(tail).rd := enq.rd
        entries(tail).rs2Val := enq.rs2Val
        entries(tail).ready := Mux(enq.decInfo.wen, false.B, true.B)

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
    }

    when (io.deq.fire) {
        entries(head).busy := false.B
        entries(head).ready := false.B

        head := Mux(head === (numEntries - 1).U, 0.U, head + 1.U)
    }

    when( !(io.deq.fire && io.enq.fire) ) {
        when(io.enq.fire) {
            count := count + 1.U
        }
        when(io.deq.fire) {
            count := count - 1.U
        }
    }

    entries.foreach{ e=>
        when(e.busy) {
            when(!e.ready) {
                // for store, we should wait store inst become head of ROB
                when(io.rob.fire && io.rob.bits.id === e.id) {
                    e.ready := true.B
                }
            }
        }
    }

    when (io.flush) {
        entries.foreach(e => e.busy := false.B)
        head := 0.U
        tail := 0.U
        count := 0.U
    }

}