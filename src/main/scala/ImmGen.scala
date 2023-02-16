package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class ImmGen(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val immSrc = Input(UInt(3.W))
        val immSign = Input(Bool())
        val imm = Output(UInt(xlen.W))
    })
    
    val inst = io.inst
    val immSrc = io.immSrc
    val immSign = io.immSign

    val immI = ZeroExt(inst(31,20), xlen)
    val immS = ZeroExt(Cat(inst(31,25),inst(11,7)),xlen)
    val immB = ZeroExt(Cat(Seq(inst(31),inst(7),inst(30,25),inst(11,8),0.U(1.W))), xlen)
    val immU = ZeroExt(inst(31,12) << 12, xlen)
    val immJ = ZeroExt(Cat(Seq(inst(31),inst(19,12),inst(20),inst(30,21))),xlen)

    val immI_S = SignExt(inst(31,20), xlen)
    val immS_S = SignExt(Cat(inst(31,25),inst(11,7)),xlen)
    val immB_S = SignExt(Cat(Seq(inst(31),inst(7),inst(30,25),inst(11,8),0.U(1.W))), xlen)
    val immU_S = SignExt(inst(31,12) << 12, xlen)
    val immJ_S = SignExt(Cat(Seq(inst(31),inst(19,12),inst(20),inst(30,21))),xlen)

    val out = WireInit(0.U.asTypeOf(io.imm))

    when(immSign) { // signed
        out := MuxLookup(immSrc, immI_S, Seq(
            0.U -> immI_S,
            1.U -> immS_S,
            2.U -> immB_S,
            3.U -> immU_S,
            4.U -> immJ_S
        ))
    }.otherwise { // unsigned
        out := MuxLookup(immSrc, immI, Seq(
            0.U -> immI,
            1.U -> immS,
            2.U -> immB,
            3.U -> immU,
            4.U -> immJ
        ))
    }
    
    io.imm := out
}

object ImmGenGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the ImmGen hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ImmGen()(defaultConfig), Array("--target-dir", "build"))
}

object ImmGenRawTest extends App{
    // chiseltest.RawTester.test(new ImmGen()) { c =>

    // }
}