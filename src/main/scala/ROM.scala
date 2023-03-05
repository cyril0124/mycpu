package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile

import mycpu.common._
import mycpu.util._

// simple dual port sram
class SramIO(implicit val p: Parameters) extends MyBundle {
    val wen = Input(Bool())
    val waddr = Input(UInt(xlen.W))
    val wdata = Input(UInt(xlen.W))
    
    // val ren = Input(Bool())
    val raddr = Input(UInt(xlen.W))
    val rdata = Output(UInt(xlen.W))
}

class ROM()(implicit val p: Parameters)  extends MyModule{
    val io = IO(new SramIO)

    // val mem = Mem(romSize, UInt(xlen.W))
    val mem = SyncReadMem(romSize, UInt(xlen.W))

    loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex")
    
    when(io.wen === true.B && io.waddr === io.raddr) {
        io.rdata := io.wdata
    }.otherwise {
        io.rdata := mem.read(io.raddr(xlen-1, log2Ceil(xlen/8))) // instruction memory address should be align of 4
    }

    when(io.wen === true.B) {
        mem.write(io.waddr(xlen-1, log2Ceil(xlen/8)), io.wdata)
    }

}

object ROMGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })

    println("Generating the ROM hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new ROM()(defaultConfig), Array("--target-dir", "build"))
}
