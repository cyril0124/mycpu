package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

// simple pingpong buffer with only one stage
class PingPongBuf[T <: Data](gen: T)(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val in = Flipped(Decoupled(gen))
        val out = Decoupled(gen)
    })

    // val ptr = Counter(true.B, 2)._1

    val wrPtr = RegInit(0.U(1.W))
    val rdPtr = RegInit(1.U(1.W))

    val buf = RegInit(VecInit(Seq(0.U.asTypeOf(gen), 0.U.asTypeOf(gen))))
    val bufValid = RegInit(VecInit(Seq(false.B, false.B)))


    // when(ptr === 0.U) {
    //     io.in.ready := !bufValid(0)
    //     when(io.in.fire) {
    //         bufValid(0) := true.B
    //         buf(0) := io.in.bits
    //     }
    // }.otherwise{
    //     io.in.ready := !bufValid(1)
    //     when(io.in.fire) {
    //         bufValid(1) := true.B
    //         buf(1) := io.in.bits
    //     }
    // }

    // withReset(reset){
    //     io.out.bits := buf(1)
    // }
    // when(ptr === 0.U) {
    //     io.out.valid := bufValid(1)
    //     when(io.out.fire) {
    //         io.out.bits := buf(1)
    //         bufValid(1) := false.B
    //     }
    // }.otherwise{
    //     io.out.valid := bufValid(0)
    //     when(io.out.fire) {
    //         io.out.bits := buf(0)
    //         bufValid(0) := false.B
    //     }
    // }


    when(wrPtr === 0.U) {
        io.in.ready := !bufValid(0)
        when(io.in.fire) {
            bufValid(0) := true.B
            buf(0) := io.in.bits
            wrPtr := ~wrPtr
        }
    }.otherwise{
        io.in.ready := !bufValid(1)
        when(io.in.fire) {
            bufValid(1) := true.B
            buf(1) := io.in.bits
            wrPtr := ~wrPtr
        }
    }

    withReset(reset){
        io.out.bits := buf(1)
    }
    when(rdPtr === 0.U) {
        io.out.valid := bufValid(1)
        when(io.out.fire) {
            io.out.bits := buf(1)
            bufValid(1) := false.B
            rdPtr := ~rdPtr
        }
    }.otherwise{
        io.out.valid := bufValid(0)
        when(io.out.fire) {
            io.out.bits := buf(0)
            bufValid(0) := false.B
            rdPtr := ~rdPtr
        }
    }
}

object PingPongGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the PingPong hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new PingPongBuf(UInt(64.W))(defaultConfig), Array("--target-dir", "build"))
}

