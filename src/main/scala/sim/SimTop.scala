package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

class SimMemInit extends BlackBox with HasBlackBoxInline {
    val io = IO(new Bundle{
        val reset = Input(Reset())
        val clock = Input(Clock())
    })
    setInline("SimMemInit.v",
    """module SimMemInit(
        |    input wire clock,
        |    input wire reset
        |);
        |    task initMem;
        |        $display("load memory!");
        |        $readmemh("/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex", core.ife.instMem.mem);
        |        $readmemh("/home/cyril/workspace/riscv/mycpu/src/main/resources/Dmem.hex", core.mem.lsu.ram.mem);
        |    endtask
        |     
        |    initial begin
        |        initMem();
        |    end
        |    
        |    always@(posedge clock) begin
        |        if(reset == 1'b1) begin
        |           initMem();
        |        end
        |    end
        |
        |endmodule
        |""".stripMargin)
}

// for chiseltest simulation only
class SimTop()(override implicit val p: Parameters)  extends MyModule{
    val io = IO(new CoreIO)

    val core = Module(new Core())
    core.io <> io

    val simMemInit = Module(new SimMemInit())
    simMemInit.io.clock := clock
    simMemInit.io.reset := reset

}

object SimTopGenRTL extends App {
    val defaultConfig = new Config((_,_,_) => {
        case MyCpuParamsKey => MyCpuParameters(
            simulation = false
        )
    })

    println("Generating the SimTop hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new SimTop()(defaultConfig), Array("--target-dir", "build"))
}
