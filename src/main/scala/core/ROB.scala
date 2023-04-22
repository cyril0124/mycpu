import chisel3._
import chisel3.util._

class ROBEntry(val numRegs: Int, val xlen: Int) extends Bundle {
    val valid = Bool()
    val busy = Bool()
    val data = UInt(64.W)
    val destReg = UInt(log2Ceil(numRegs).W)
    val ready = Bool()
}

class ROB(val numEntries: Int, val numRegs: Int, val xlen: Int) extends Module {
    val io = IO(new Bundle {
        val enq = Flipped(Decoupled(new ROBEntry(numRegs, xlen)))
        val deq = Decoupled(Output(new ROBEntry(numRegs, xlen)))
        val commit = Input(UInt(log2Ceil(numEntries).W))
    })

    val entries = Reg(Vec(numEntries, new ROBEntry(numRegs, xlen)))
    val head = RegInit(0.U(log2Ceil(numEntries).W))
    val tail = RegInit(0.U(log2Ceil(numEntries).W))

    val count = RegInit(0.U(log2Ceil(numEntries+1).W))
    val full = count === numEntries.U
    val empty = count === 0.U

    io.enq.ready := !full
    io.deq.valid := !empty
    io.deq.bits := entries(head)

    when (io.enq.fire) {
        entries(tail).valid := true.B
        entries(tail).busy := true.B
        entries(tail).data := io.enq.bits.data
        entries(tail).destReg := io.enq.bits.destReg
        entries(tail).ready := false.B

        tail := Mux(tail === (numEntries - 1).U, 0.U, tail + 1.U)
        count := count + 1.U
    }

    when (io.commit =/= 0.U) {
        entries(io.commit).valid := false.B
        entries(io.commit).busy := false.B
        entries(io.commit).ready := true.B

        head := Mux(head === (numEntries - 1).U, 0.U, head + 1.U)
        count := count - 1.U
    }
}