package mycpu

import chisel3._
import chisel3.util._

// Global History Register
class GHR(width: Int) extends Module {
    val io = IO(new Bundle{
        val update = Valid(new Bundle{
            val brTaken = Bool()
        })
        val out = UInt(width.W)
    })

    val ghr = RegInit(0.U(width.W))

    when(io.update.fire) {
        ghr := Cat(ghr(width - 2, 0), io.update.bits.brTaken)
    }

    io.out := ghr
}