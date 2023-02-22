package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class CoreState()(implicit val p: Parameters) extends MyBundle{
    val intRegState = new RegFileState
    val instState = new InstState
}

class CoreIO()(implicit val p: Parameters) extends MyBundle{
    val in = new Bundle{
                val start = Input(Bool())
            }
    val out = new Bundle{
                val state = Output(new CoreState)
            }
}

class Core()(implicit val p: Parameters) extends MyModule{
    val io = IO(new CoreIO)

    // 1_fetch stage
    val fetchStage = Module(new Fetch)
    fetchStage.io.in.start := io.in.start
    fetchStage.io.ctrl <> DontCare

    // 2_decode stage
    val decodeStage = Module(new Decode)
    decodeStage.io.in.fetch <> fetchStage.io.out
    decodeStage.io.ctrl.stall := false.B

    // 3_execute stage
    val executeStage = Module(new Execute)
    executeStage.io.in <> decodeStage.io.out
    fetchStage.io.in.execute <> executeStage.io.out.fetch

    // 4_memory stage
    val memoryStage = Module(new Memory)
    memoryStage.io.in <> executeStage.io.out.memory

    // 5_writeback stage
    val writebackStage = Module(new Writeback)
    writebackStage.io.in <> memoryStage.io.out

    // decode stage write back writeback info
    decodeStage.io.in.writeback <> writebackStage.io.out

    // hazard detction
    val hazardUnit = Module(new HazardUnit)
    hazardUnit.io.in.execute <> executeStage.io.hazard.out
    hazardUnit.io.in.memory <> memoryStage.io.hazard
    hazardUnit.io.in.writeback <> writebackStage.io.hazard
    hazardUnit.io.out <> executeStage.io.hazard.in

    // core runtime instruction info and reg info
    io.out.state.intRegState <> RegNext(decodeStage.io.regState)
    io.out.state.instState <> writebackStage.io.instState
}

object CoreGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            enableDebug = false
        )
    })

    println("Generating the Core hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Core()(defaultConfig), Array("--target-dir", "build"))
}
