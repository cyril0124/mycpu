package mycpu

import chisel3._
import chisel3.util._

class CircularShiftRegister(width: Int, init: Int) extends Module {
    val io = IO(new Bundle {
        val shiftLeft  = Input(Bool())
        val shiftRight = Input(Bool())
        // val in         = Input(UInt(width.W))
        val out        = Output(UInt(width.W))
        val reset = Input(Bool())
    })

    val register = RegInit(init.U(width.W))

    when(io.shiftLeft) {
        register := Cat(register(width-2, 0), register(width-1))
    }.elsewhen(io.shiftRight) {
        register := Cat(register(0), register(width-1, 1))
    }
    // .otherwise {
    //     register := io.in
    // }

    when(io.reset) {
        register := init.U(width.W)
    }

    io.out := register
}