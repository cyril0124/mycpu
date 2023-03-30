module SRAMTemplate(
  input         clock,
  input         reset,
  input  [6:0]  io_r_addr,
  output [31:0] io_r_data,
  input         io_w_en,
  input  [6:0]  io_w_addr,
  input  [31:0] io_w_data
);
  wire  sram_clock; // @[SRAM.scala 199:31]
  wire  sram_reset; // @[SRAM.scala 199:31]
  wire [6:0] sram_io_r_addr; // @[SRAM.scala 199:31]
  wire [31:0] sram_io_r_data; // @[SRAM.scala 199:31]
  wire  sram_io_w_en; // @[SRAM.scala 199:31]
  wire [6:0] sram_io_w_addr; // @[SRAM.scala 199:31]
  wire [31:0] sram_io_w_data; // @[SRAM.scala 199:31]
  BankRam2P_1 sram ( // @[SRAM.scala 199:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_r_addr(sram_io_r_addr),
    .io_r_data(sram_io_r_data),
    .io_w_en(sram_io_w_en),
    .io_w_addr(sram_io_w_addr),
    .io_w_data(sram_io_w_data)
  );
  assign io_r_data = sram_io_r_data; // @[SRAM.scala 223:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_r_addr = io_r_addr; // @[SRAM.scala 188:19]
  assign sram_io_w_en = io_w_en; // @[SRAM.scala 165:17 175:17 228:19]
  assign sram_io_w_addr = io_w_addr; // @[SRAM.scala 177:19 228:19]
  assign sram_io_w_data = io_w_data; // @[SRAM.scala 176:19 228:19]
endmodule