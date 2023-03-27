module SRAMTemplate_34(
  input        clock,
  input        reset,
  input  [6:0] io_r_addr,
  output [7:0] io_r_data,
  input        io_w_en,
  input  [6:0] io_w_addr,
  input  [7:0] io_w_data,
  input  [3:0] io_w_mask
);
  wire  sram_clock; // @[SRAM.scala 188:31]
  wire  sram_reset; // @[SRAM.scala 188:31]
  wire [6:0] sram_io_addr; // @[SRAM.scala 188:31]
  wire  sram_io_rw; // @[SRAM.scala 188:31]
  wire [7:0] sram_io_wdata; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_wmask; // @[SRAM.scala 188:31]
  wire [7:0] sram_io_rdata; // @[SRAM.scala 188:31]
  BankRam1P_1_34 sram ( // @[SRAM.scala 188:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_addr(sram_io_addr),
    .io_rw(sram_io_rw),
    .io_wdata(sram_io_wdata),
    .io_wmask(sram_io_wmask),
    .io_rdata(sram_io_rdata)
  );
  assign io_r_data = sram_io_rdata; // @[SRAM.scala 214:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_addr = io_w_en ? io_w_addr : io_r_addr; // @[SRAM.scala 102:17 219:19 90:17]
  assign sram_io_rw = io_w_en; // @[SRAM.scala 101:15 219:19 88:15]
  assign sram_io_wdata = io_w_data; // @[SRAM.scala 219:19 89:18]
  assign sram_io_wmask = io_w_mask; // @[SRAM.scala 219:19 91:45]
endmodule
