package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.experimental.ChiselEnum

import mycpu.common._
import mycpu.util._

import mycpu.common.consts.AluOp._
import mycpu.common.consts.Control._

// Branch Unit
class BRU()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val in1 = Input(UInt(xlen.W))
        val in2 = Input(UInt(xlen.W))
        val opSel = Input(UInt(BR_WIDTH.W))

        val brAddr = Output(UInt(xlen.W))
        val brTaken = Output(Bool())
    })

    // compare operation
    val cmp = MuxLookup(io.opSel, 0.U, Seq(
                    BR_LT   -> (io.in1.asSInt < io.in2.asSInt).asUInt,
                    BR_LTU  -> (io.in1 < io.in2),
                    BR_EQ   -> (io.in1 === io.in2),
                    BR_NE   -> (io.in1 =/= io.in2),
                    BR_GE   -> (io.in1.asSInt >= io.in2.asSInt),
                    BR_GEU  -> (io.in1 >= io.in2)
            ))

    io.brTaken := cmp | io.opSel === BR_JAL | io.opSel === BR_JALR
}