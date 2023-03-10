package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

// class RAM()(override implicit val p: Parameters) extends ROM {
//     when(io.wen) {
//         printf(cf"RAM [write] addr: ${io.waddr} data: ${io.wdata}\n")
//     }
// }

class RAM()(override implicit val p: Parameters) extends ROM {
    when(io.wen) {
        printf(cf"RAM [write] addr: ${io.waddr} data: ${io.wdata}\n")
    }
}

object RAMGenRTL extends App {
    // val defaultConfig = new Config((_,_,_) => {
    //     case MyCpuParamsKey => MyCpuParameters(
    //         enableDebug = false
    //     )
    // })

    // println("Generating the RAM hardware")
    // (new chisel3.stage.ChiselStage).emitVerilog(new RAM()(defaultConfig), Array("--target-dir", "build"))
}