package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource

import mycpu.common._
import mycpu.util._

// simple dual port sram
class SramIO(implicit val p: Parameters) extends MyBundle {
    val clock = Input(Clock())
    val reset = Input(Reset())
    val wen = Input(Bool())
    val waddr = Input(UInt(xlen.W))
    val wdata = Input(UInt(xlen.W))
    val wmask = Input(UInt(blockBytes.W))
    
    // val ren = Input(Bool())
    val raddr = Input(UInt(xlen.W))
    val rdata = Output(UInt(xlen.W))
}

// class ROM()(implicit val p: Parameters)  extends MyModule{
//     val io = IO(new SramIO)

//     // val mem = Mem(romSize, UInt(xlen.W))
//     val mem = SyncReadMem(romSize, UInt(xlen.W))
//     // val mem = SyncReadMem(romSize, Vec(blockBytes, UInt(8.W)))

//     loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex")
    
//     when(io.wen === true.B && io.waddr === io.raddr) {
//         io.rdata := io.wdata
//     }.otherwise {
//         io.rdata := mem.read(io.raddr(xlen-1, log2Ceil(xlen/8))).asUInt // instruction memory address should be align of 4
//     }

//     when(io.wen === true.B) {
//         mem.write(io.waddr(xlen-1, log2Ceil(xlen/8)), io.wdata)
//         // for(i <- 0 until blockBytes) {
//         //     val wdata = io.wdata.asTypeOf(Vec(blockBytes, UInt(8.W)))
//         //     val wmask = io.wmask.asTypeOf(Vec(blockBytes, Bool()))
//         //     when(io.wmask(i) === true.B) {
//         //         mem(io.waddr)
//         //         mem(io.waddr(xlen-1, log2Ceil(xlen/8)))(i) := wdata(i)
//         //     }
//         // }
//     }
// }

object ROM_CONFIG{
    val XLEN = 32
    val BLOCK_BYTES = 4
    val MEM_SIZE = 1024
    val MEM_WIDTH = log2Ceil(MEM_SIZE)
}

import ROM_CONFIG._

class ROM()(implicit val p: Parameters) extends  BlackBox(Map("XLEN" -> XLEN, "BLOCK_BYTES" -> BLOCK_BYTES, "MEM_SIZE" -> MEM_SIZE, "MEM_WIDTH" -> MEM_WIDTH))
                                        with HasBlackBoxResource with HasMyCpuParameters{
    val io = IO(new SramIO)
    addResource("/ROM.v")
}

object ROMGenRTL extends App {
    // val defaultConfig = new Config((_,_,_) => {
    //     case MyCpuParamsKey => MyCpuParameters(
    //         enableDebug = false
    //     )
    // })

    // println("Generating the ROM hardware")
    // (new chisel3.stage.ChiselStage).emitVerilog(new ROM()(defaultConfig), Array("--target-dir", "build"))
}
