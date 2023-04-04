package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

// class DataBankArrayRead_1()(implicit val p: Parameters) extends MyBundle {
//     val set = UInt(log2Ceil(dcacheSets).W)
// }

class DataBankArrayRead_1()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new Bundle {
        val set = UInt(log2Ceil(dcacheSets).W)
    }))
    val resp = Vec(dcacheWays, Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W)))
}


class DataBankArrayWrite_1()(implicit val p: Parameters) extends MyBundle {
    val req = Flipped(Decoupled(new Bundle{
        val data = UInt((dcacheBlockBytes*8).W)
        val set = UInt(log2Ceil(dcacheSets).W)
        val blockSelOH = UInt(dcacheBlockSize.W)
        val way = UInt(dcacheWays.W)
    }))
}

class DataBankArrayIO_1()(implicit val p: Parameters) extends MyBundle {
    // val read = Flipped(Decoupled(new DataBankArrayRead_1))
    // val resp = Vec(dcacheWays, Vec(dcacheBlockSize, UInt((dcacheBlockBytes*8).W)))
    val read = new DataBankArrayRead_1
    val write = new DataBankArrayWrite_1
}

class DataBankArray_1()(implicit val p: Parameters) extends MyModule {
    val io = IO(new DataBankArrayIO_1)

    val dataBanks = Seq.fill(dcacheWays)(SRAM_1(dcacheBlockBytes*8, dcacheSets, dcacheBlockSize, bramPolicy = "write_first", singlePort = false, resetMem = simulation))

    val rSet = io.read.req.bits.set
    val ren = io.read.req.fire
    io.read.req.ready := true.B //&& !io.write.req.fire // TODO: using single port SRAM
    for(i <- 0 until dcacheWays) {
        io.read.resp(i) := dataBanks(i).read(rSet, ren)

        val wSet = io.write.req.bits.set
        val wData = io.write.req.bits.data
        val wen = io.write.req.bits.way(i) && io.write.req.fire
        val wBlock = io.write.req.bits.blockSelOH
        io.write.req.ready := true.B
        when(wen) {
            dataBanks(i).write(wSet, wData, wBlock)
        }
    }
}

object DataBankArrayGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false,
            // dcacheSets = 64,
            // dcacheWays = 4,
            // dcacheBlockSize = 4
        )
    })

    println("Generating the DataBankArray hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new DataBankArray_1()(defaultConfig), Array("--target-dir", "build"))
}