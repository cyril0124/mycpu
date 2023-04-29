package mycpu

import chisel3._
import chisel3.util._
import mycpu.common.Parameters._

// Global History Register
class GHR extends Module {
    val io = IO(new Bundle{
        val update = Valid(new Bundle{
            val brTaken = Bool()
        })
        val out = UInt(GHR_WIDTH.W)
    })

    val ghr = RegInit(0.U(GHR_WIDTH.W))

    when(io.update.fire) {
        ghr := Cat(ghr(GHR_WIDTH - 2, 0), io.update.bits.brTaken)
    }

    io.out := ghr
}