package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

// TODO: redesigned ALU !!!
class Alu()(implicit val p: Parameters) extends MyModule 
    with AluOpConstants {
    
    val io = IO(new Bundle{
        val in1 = Input(UInt(xlen.W))
        val in2 = Input(UInt(xlen.W))
        val opSel = Input(UInt(aluOpWidth.W))

        val out = Output(UInt(xlen.W))
        // val sum = Output(UInt(xlen.W))

        // status output
        val zero = Output(Bool())
        // val cmp = Output(Bool())
    })

    // add & sub operation
    val sum = io.in1 + Mux(io.opSel(0), -io.in2, io.in2)
    
    // shift operation
    val shamt = io.in2(4,0).asUInt // shift amount
    val shiftr = Mux( io.opSel(1), 
                        (io.in1.asSInt >> shamt)(xlen-1,0), // arithmetic shift
                        io.in1 >> shamt // logical shift
                    )
    val shiftl = io.in1 << shamt
    val shout = Mux(io.opSel === SRL || io.opSel === SRA, shiftr, 0.U) |
                Mux(io.opSel === SLL,                     shiftl, 0.U)

    // logical operation
    // TODO: Optmize this, refer to Rocket-chip
    val logic = MuxLookup(io.opSel, 0.U, Seq(
                    AND -> (io.in1 & io.in2),
                    OR  -> (io.in1 | io.in2),
                    XOR -> (io.in1 ^ io.in2)
                ))

    // compare operation
    // TODO: Optmize this, refer to Rocket-chip
    val cmp = MuxLookup(io.opSel, 0.U, Seq(
                    SLT  -> (io.in1.asSInt < io.in2.asSInt),
                    SLTU -> (io.in1 < io.in2),
                    EQU  -> (io.in1 === io.in2),
                    NE   -> (io.in1 =/= io.in2),
                    GEQ  -> (io.in1 >= io.in2)
            ))


    // io.cmp := cmp

    val op = io.opSel
    when(op === BYPA) {
        io.out := io.in1
    }.elsewhen(op === BYPB) {
        io.out := io.in2
    }.otherwise {
        io.out := Mux(op === ADD || op === SUB, sum, cmp | logic | shout)
    }

    // io.sum := sum

    // TODO: replace this logic expression to a function
    io.zero := cmp === true.B
}

object AluGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the Alu hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Alu()(defaultConfig), Array("--target-dir", "build"))
}

import chiseltest._
import scala.util.Random.nextInt
import scala.math

object AluRawTest extends App with AluOpConstants{

    // chiseltest.RawTester.test(new Alu()) { c =>
    //     println("start raw test...")
    //     // c.clock.step(10)
    //     /*write some test code...*/
    //     c.io.in1.poke(11.U)
    //     c.io.in2.poke(1.U)
    //     c.io.opSel.poke(SLL)
    //     c.clock.step()
    //     println(s"out:${c.io.out.peek().litValue.toInt.toString} \n")
    //     println(s"cmp:${c.io.cmp.peek()} \n")
    // }
}
