package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.AluOp._

class ALU()(implicit val p: Parameters) extends MyModule {
    
    val io = IO(new Bundle{
        val in1 = Input(UInt(xlen.W))
        val in2 = Input(UInt(xlen.W))
        val opSel = Input(UInt(aluOpWidth.W))

        val out = Output(UInt(xlen.W))

        // status output
        val zero = Output(Bool())
    })

    // add & sub operation
    val sum = io.in1 + Mux(io.opSel(0), -io.in2, io.in2)
    
    // shift operation
    val shamt = io.in2(4,0).asUInt // shift amount
    val shiftr = Mux( io.opSel(1), 
                        io.in1 >> shamt,  // logical shift
                        (io.in1.asSInt >> shamt)(xlen-1,0) // arithmetic shift
                    )
    val shiftl = io.in1 << shamt
    val shout = Mux(io.opSel === ALU_SRL || io.opSel === ALU_SRA, shiftr, 0.U) |
                Mux(io.opSel === ALU_SLL,                     shiftl, 0.U)

    // logical operation
    // TODO: Optmize this, refer to Rocket-chip
    val logic = MuxLookup(io.opSel, 0.U, Seq(
                    ALU_AND -> (io.in1 & io.in2),
                    ALU_OR  -> (io.in1 | io.in2),
                    ALU_XOR -> (io.in1 ^ io.in2)
                ))

    // compare operation
    // TODO: Optmize this, refer to Rocket-chip
    val cmp = MuxLookup(io.opSel, 0.U, Seq(
                    ALU_SLT  -> (io.in1.asSInt < io.in2.asSInt).asUInt,
                    ALU_SLTU -> (io.in1 < io.in2),
                    ALU_EQU  -> (io.in1 === io.in2),
                    ALU_NE   -> (io.in1 =/= io.in2),
                    ALU_GEQ  -> (io.in1.asSInt >= io.in2.asSInt),
                    ALU_GEQU  -> (io.in1 >= io.in2)
            ))

    val op = io.opSel
    when(op === ALU_BYPA) {
        io.out := io.in1
    }.elsewhen(op === ALU_BYPB) {
        io.out := io.in2
    }.otherwise {
        io.out := Mux(op === ALU_ADD || op === ALU_SUB, sum, cmp | logic | shout)
    }


    io.zero := cmp === true.B
}

object AluGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Alu hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ALU()(defaultConfig), Array("--target-dir", "build"))
}

