package mycpu

import chisel3._
import chisel3.util._
import mycpu.common.Parameters._

// Pattern History Table
class PHT extends Module {
    val io = IO(new Bundle{
        val update = Flipped(Valid(new Bundle{
            val idx = UInt(log2Ceil(PHT_SIZE).W)
            val brTaken = Bool()
        }))
        val index = Input(UInt(log2Ceil(PHT_SIZE).W))
        val brTaken = Output(Bool())
    })

    val initVal = "b10".U(2.W)
    val init = Seq.fill(PHT_SIZE)(initVal)
    val counters = RegInit(VecInit(init))
    
    val strongTaken = "b11".U(2.W)
    val strongNotTaken = "b00".U(2.W)

    when(io.update.fire) {
        val chosenCounter = counters(io.update.bits.idx)
        when(io.update.bits.brTaken) {
            when(chosenCounter =/= strongTaken) {
                chosenCounter := chosenCounter + 1.U
            }
        }.otherwise{
            when(chosenCounter =/= strongNotTaken) {
                chosenCounter := chosenCounter - 1.U
            }
        }
    }

    io.brTaken := counters(io.index)(1)
}