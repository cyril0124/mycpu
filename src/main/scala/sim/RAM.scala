package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._
import chisel3.util.experimental.loadMemoryFromFile

import mycpu.common._
import mycpu.util._

// class RAM_1()(override implicit val p: Parameters) extends Module with BaseROM {
    
//     val mem = SyncReadMem(romSize, Vec(blockBytes, UInt(8.W)))

//     loadMemoryFromFile(mem, "/home/cyril/workspace/riscv/mycpu/src/main/resources/Dmem.hex")

//     withReset(reset) {
//         io.rdata := 0.U
//     }

//     when(io.wen === true.B) {
//         for(i <- 0 until blockBytes) {
//             val wdata = io.wdata.asTypeOf(Vec(blockBytes, UInt(8.W)))
//             val wmask = io.wmask.asTypeOf(Vec(blockBytes, Bool()))
//             when(io.wmask(i) === true.B) {
//                 mem(io.waddr(xlen-1, log2Ceil(xlen/8)))(i) := wdata(i)
//             }
//         }
//     }.otherwise{
//         io.rdata := mem.read(io.raddr(xlen-1, log2Ceil(xlen/8))).asUInt
//     }
// }

// for verilator
class RAM()(override implicit val p: Parameters) extends ROM {
    when(io.wen) {
        printf(cf"RAM [write] addr: ${io.waddr} data: ${io.wdata}\n")
    }
}

// object RAM{
//     def apply(clock: Clock, reset: Reset)(implicit p: Parameters) = {
//         val rom = if(p(MyCpuParamsKey).simulation == true) {
//             Module(new RAM_1())
//         } else {
//             Module(new ROM())
//         }
//         rom.init(clock,reset)
//         rom
//     }
// }



object RAMGenRTL extends App {
    // val defaultConfig = new Config((_,_,_) => {
    //     case MyCpuParamsKey => MyCpuParameters(
    //         enableDebug = false
    //     )
    // })

    // println("Generating the RAM hardware")
    // (new chisel3.stage.ChiselStage).emitVerilog(new RAM()(defaultConfig), Array("--target-dir", "build"))
}