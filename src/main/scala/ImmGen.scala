package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._
import mycpu.common.consts.Control._

class ImmGen(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val inst = Input(UInt(ilen.W))
        val immSrc = Input(UInt(IMM_TYP_WIDTH.W))
        val immSign = Input(Bool())
        val imm = Output(UInt(xlen.W))
    })
    
    val inst = io.inst
    val immSrc = io.immSrc
    val immSign = io.immSign

    val immI = ZeroExt(inst(31,20), xlen)
    val immS = ZeroExt(Cat(inst(31,25),inst(11,7)),xlen)
    val immB = ZeroExt(Cat(inst(31),inst(7),inst(30,25),inst(11,8),0.U(1.W)), xlen)
    val immU = ZeroExt(inst(31,12) << 12, xlen)
    val immJ = ZeroExt(Cat(inst(31),inst(19,12),inst(20),inst(30,21), 0.U(1.W)),xlen)

    val immI_S = SignExt(inst(31,20), xlen)
    val immS_S = SignExt(Cat(inst(31,25),inst(11,7)),xlen)
    val immB_S = SignExt(Cat(inst(31),inst(7),inst(30,25),inst(11,8),0.U(1.W)), xlen)
    val immU_S = SignExt(inst(31,12) << 12, xlen)
    val immJ_S = SignExt(Cat(inst(31),inst(19,12),inst(20),inst(30,21), 0.U(1.W)),xlen)

    val out = WireInit(0.U.asTypeOf(io.imm))

    when(immSign) { // signed
        out := MuxLookup(immSrc, immI_S, Seq(
            IMM_I -> immI_S,
            IMM_S -> immS_S,
            IMM_B -> immB_S,
            IMM_U -> immU_S,
            IMM_J -> immJ_S
        ))
    }.otherwise { // unsigned
        out := MuxLookup(immSrc, immI, Seq(
            IMM_I -> immI,
            IMM_S -> immS,
            IMM_B -> immB,
            IMM_U -> immU,
            IMM_J -> immJ
        ))
    }

    when(immSrc === IMM_CSR) {
        out := ZeroExt(InstField(inst, "rs1"), xlen)
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