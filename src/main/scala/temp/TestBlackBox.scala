package mycpu

import chisel3._
import chisel3.util._
import org.chipsalliance.cde.config._

import mycpu.common._
import mycpu.util._

import chisel3.util.HasBlackBoxInline

class TestBlackBoxIO_1 extends Bundle {
    val en = Input(Bool())
    val addr = Input(UInt(32.W))
    val rw = Input(Bool())
    val wdata = Input(UInt(32.W))
    val wmask = Input(UInt(4.W))
    val rdata = Output(UInt(32.W))
}

trait  TestBlackBoxIO_2 extends Bundle {
    val clk = Input(Clock())
    val reset = Input(Reset())
}

class TestBlackBoxIO extends TestBlackBoxIO_1 with TestBlackBoxIO_2


class TestBlackBoxWrapper() extends Module {
    val io = IO(new TestBlackBoxIO_1)

    val blackBox = Module(new TestBlackBox)
    val b = blackBox.io
    b.addr := io.addr
    b.en := io.en
    io.rdata := b.rdata
    b.rw := io.rw
    b.wdata := io.wdata
    b.wmask := io.wmask
    b.clk := clock
    b.reset := reset
}

class TestBlackBox() extends BlackBox with HasBlackBoxInline {
    val io = IO(new TestBlackBoxIO)

    setInline("TestBlackBox.v",
    s"""
      |module TestBlackBox (
      |    input wire clk,
      |    input wire reset,
      |    input wire en,
      |    input wire [31:0] addr,
      |    input wire rw,
      |    input wire [31:0] wdata,
      |    input wire [3:0] wmask,
      |    output wire [31:0] rdata,
      |);
      |  
      |  reg [7:0] mem[0:1023];
      |  assign rdata = (en == 1'b1 & rw == 1'b0) ? mem[addr] : 32'd0; 
      |  always@(posedge clk or posedge reset) begin
      |      if(reset == 1'b1) begin
      |         // initialize memory
      |         integer i;
      |         for( i = 0; i < 1024; i++) begin
      |            mem[i] <= 'd0;
      |         end
      |      end
      |      if( en == 1'b1 & rw == 1'b1) begin
      |        mem[addr] <= wdata;
      |      end
      |  end
      |endmodule
      |""".stripMargin)

}

object TestBlackBoxGenRTL extends App {
    println("Generating the TestBlackBox hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new TestBlackBoxWrapper(), Array("--target-dir", "build"))
}