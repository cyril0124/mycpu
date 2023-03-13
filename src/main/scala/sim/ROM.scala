package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.experimental._
import chisel3.util.HasBlackBoxResource

import mycpu.common._
import mycpu.util._
import chisel3.internal.firrtl.DefSeqMemory

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

// trait BaseROM extends HasMyCpuParameters {
//     implicit val p: Parameters
//     val io = IO(new SramIO)

//     def init(clock: Clock, reset: Reset): Unit = {
//         io.clock := clock
//         io.reset := reset
//     }
// }

// class ROM_1()(override implicit val p: Parameters)  extends Module with BaseROM{

//     // val mem = Mem(romSize, UInt(xlen.W))
//     // val mem = SyncReadMem(romSize, UInt(xlen.W))
//     val mem = SyncReadMem(romSize, Vec(blockBytes, UInt(8.W)))

//     io <> DontCare

//     loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex")
    
//     withReset(reset) {
//         io.rdata := 0.U
//     }
    
//     // when(io.wen === true.B) {
//     //     for(i <- 0 until blockBytes) {
//     //         val wdata = io.wdata.asTypeOf(Vec(blockBytes, UInt(8.W)))
//     //         val wmask = io.wmask.asTypeOf(Vec(blockBytes, Bool()))
//     //         when(io.wmask(i) === true.B) {
//     //             mem(io.waddr(xlen-1, log2Ceil(xlen/8)))(i) := wdata(i)
//     //         }
//     //     }
//     // }.otherwise{
//     //     io.rdata := mem.read(io.raddr(xlen-1, log2Ceil(xlen/8))).asUInt
//     // }

//     when(io.wen === true.B) {
//         val wdata = io.wdata.asTypeOf(Vec(blockBytes, UInt(8.W)))
//         val wmask = io.wmask.asTypeOf(Vec(blockBytes, Bool()))
//         mem.write(io.waddr(xlen-1, log2Ceil(xlen/8)), wdata, wmask)
//         // for(i <- 0 until blockBytes) {
//         //     when(io.wmask(i) === true.B) {
//         //         mem(io.waddr(xlen-1, log2Ceil(xlen/8)))(8*i + 7, 8*i) := wdata(i)
//         //     }
//         // }
//     }.otherwise{
//         io.rdata := mem.read(io.raddr(xlen-1, log2Ceil(xlen/8))).asUInt
//     }
// }

object ROM_CONFIG{
    val XLEN = 32
    val BLOCK_BYTES = 4
    val MEM_SIZE = 1024
    val MEM_WIDTH = log2Ceil(MEM_SIZE)
}

import ROM_CONFIG._

// for verilator
class ROM()(implicit val p: Parameters) extends  BlackBox(Map("XLEN" -> XLEN, "BLOCK_BYTES" -> BLOCK_BYTES, "MEM_SIZE" -> MEM_SIZE, "MEM_WIDTH" -> MEM_WIDTH))
                                        with HasBlackBoxResource with HasMyCpuParameters {
    val io = IO(new SramIO)

    // Resource files are located in project_root/src/main/resources/.
    addResource("/ROM.v")
}

// object ROM{
//     def apply(clock: Clock, reset: Reset)(implicit p: Parameters) = {
//         val rom = if(p(MyCpuParamsKey).simulation == true) {
//             Module(new ROM_1())
//         } else {
//             Module(new ROM())
//         }
//         rom.init(clock,reset)
//         rom
//     }
// }


object ROMGenRTL extends App {
    // val defaultConfig = new Config((_,_,_) => {
    //     case MyCpuParamsKey => MyCpuParameters(
    //         enableDebug = false
    //     )
    // })

    // println("Generating the ROM hardware")
    // (new chisel3.stage.ChiselStage).emitVerilog(new ROM_1()(defaultConfig), Array("--target-dir", "build"))
}
