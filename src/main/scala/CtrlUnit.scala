package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.decode._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import mycpu.Instructions._

class CtrlSigs(aluOpWidth:Int = 4) extends Bundle {
    // val pcSrc       = Output(Bool())
    val isBranch    = Output(Bool())
    val isJump      = Output(Bool()) // for jalr and jal instruction

    val resultSrc   = Output(UInt(2.W))
    val memWrEn     = Output(Bool())
    val memRdEn     = Output(Bool())
    val memType     = Output(UInt(3.W))
    val aluOpSel    = Output(UInt(aluOpWidth.W))
    val aluSrc      = Output(Bool())
    val immSrc      = Output(UInt(2.W))
    val immSign     = Output(Bool())
    val regWrEn     = Output(Bool())
    val memSign     = Output(Bool())
    
    val pcAddReg    = Output(Bool()) // for jalr instruction

    val ecall       = Output(Bool()) 
    val ebreak      = Output(Bool())
}

class CtrlPort(ilen:Int = 32) extends Bundle {
    val start = Input(Bool())
    val inst = Input(UInt(ilen.W))
    // val zero = Input(Bool())
}


class CtrlUnit()(implicit val p: Parameters) extends MyModule {
    val io = IO(new Bundle{
        val out = new CtrlSigs(aluOpWidth)
        val in  = new CtrlPort(ilen)
    })
    // io.out <> DontCare
    // io.in <> DontCare
    
    val inst = io.in.inst
    val out = io.out
    val funct3 = InstField(inst, "funct3")

    // val decodeTable = XDecode.table
    // val defaultDecodeTable = XDecode.decodeDefault
    // val ctrlSigs = ListLookup(inst, defaultDecodeTable, decodeTable)

    // val isBranch = ctrlSigs(0)
    // io.out.pcSrc := Mux(isBranch.asBool, Mux(io.in.zero, PC_NT, PC_N4), PC_N4)
    // io.out.resultSrc := ctrlSigs(1)
    // io.out.memWrEn := ctrlSigs(2)
    // io.out.memRdEn := ctrlSigs(3)
    // io.out.memType := ctrlSigs(4)
    // io.out.aluOpSel := ctrlSigs(5)
    // io.out.aluSrc := ctrlSigs(6)
    // io.out.immSrc := ctrlSigs(7)
    // io.out.immSign := ctrlSigs(8)
    // io.out.regWrEn := ctrlSigs(9)

    val decoder = Module(new Decoder())
    val dout = decoder.io.out
    decoder.io.inst := Mux(io.in.start, io.in.inst, 0.U)

    // out.pcSrc := Mux(dout.isBranch.asBool, Mux(io.in.zero, PC_NT, PC_N4), PC_N4)
    out.isBranch := dout.isBranch
    out.resultSrc := dout.resultSrc
    out.memWrEn := dout.memWrEn
    out.memRdEn := dout.memRdEn
    out.memType := dout.memType
    out.aluOpSel := dout.aluOpSel
    out.aluSrc := dout.aluSrc
    out.immSrc := dout.immSrc
    out.immSign := dout.immSign
    out.regWrEn := dout.regWrEn
    out.memSign := ~funct3(2).asBool

    val opcode = InstField(inst, "opcode")
    val funct12 = InstField(inst, "funct12")
    out.pcAddReg := opcode === JALR(6,0)
    out.isJump := opcode === JALR(6,0) || opcode === JAL(6,0)
    out.ecall := opcode === ECALL(6,0) && funct12 === ECALL(31,20)
    out.ebreak := opcode === EBREAK(6,0) && funct12 === EBREAK(31,20)
}

object CtrlUnitGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the CtrlUnit hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new CtrlUnit()(defaultConfig), Array("--target-dir", "build"))
}

import chiseltest._
import mycpu.Instructions._

object CtrlUnitRawTest extends App{
    // chiseltest.RawTester.test(new CtrlUnit()) { c =>
    //     c.io.in.inst.poke(BitPat.bitPatToUInt(BitPat("b00000000000000000000000000000011")))
    //     println(s"${c.io.out.memType.peek()}")
    // }
}