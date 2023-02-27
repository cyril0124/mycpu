package mycpu

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class IMemPort(implicit val p: Parameters) extends MyBundle {
    val addr = Input(UInt(addrWidth.W))
    val inst = Output(UInt(ilen.W))
}

class IMem()(implicit val p: Parameters) extends MyModule{
    val io = IO(new IMemPort())
    
    io.inst := 0.U

    val mem = Module(new ReadIMem()(p))

    mem.io <> io

}

class ReadIMem()(implicit val p: Parameters)  extends MyModule{
    val io = IO(new IMemPort())
    
    io.inst := DontCare

    // Creates a combinational/asynchronous-read, sequential/synchronous-write [[Mem]].
    val instByte = ilen / 8
    // val mem = Mem(instMemSize, UInt(xlen.W))
    val mem = Mem(instMemSize, UInt(8.W))

    io.inst := Cat( ((0 until instByte).map{ i => mem(io.addr + i.U - resetPc.U(xlen.W)) }).reverse )

    loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt")
}

object IMemGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters()
    })

    println("Generating the IMem hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new IMem()(defaultConfig), Array("--target-dir", "build"))
}

import chiseltest._

object IMemRawTest extends App{
    // val memSize = 20
    // chiseltest.RawTester.test(new IMem()) { c =>
    //     for( addr <- 0 until memSize ){
    //         c.io.addr.poke(addr.U)
    //         println(f"IMem[${addr}%4d] = 0x${c.io.inst.peek().litValue}%8h")
    //     }
    // }
}

