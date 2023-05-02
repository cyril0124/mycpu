module Arbiter(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input  [31:0] io_in_0_bits_inst_0,
  input  [31:0] io_in_0_bits_inst_1,
  input  [31:0] io_in_0_bits_inst_2,
  input  [31:0] io_in_0_bits_inst_3,
  input  [2:0]  io_in_0_bits_size,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [31:0] io_in_1_bits_inst_0,
  input  [31:0] io_in_1_bits_inst_1,
  input  [31:0] io_in_1_bits_inst_2,
  input  [31:0] io_in_1_bits_inst_3,
  input  [2:0]  io_in_1_bits_size,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [31:0] io_out_bits_inst_0,
  output [31:0] io_out_bits_inst_1,
  output [31:0] io_out_bits_inst_2,
  output [31:0] io_out_bits_inst_3,
  output [2:0]  io_out_bits_size
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_inst_0 = io_in_0_valid ? io_in_0_bits_inst_0 : io_in_1_bits_inst_0; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_inst_1 = io_in_0_valid ? io_in_0_bits_inst_1 : io_in_1_bits_inst_1; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_inst_2 = io_in_0_valid ? io_in_0_bits_inst_2 : io_in_1_bits_inst_2; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_inst_3 = io_in_0_valid ? io_in_0_bits_inst_3 : io_in_1_bits_inst_3; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_size = io_in_0_valid ? io_in_0_bits_size : io_in_1_bits_size; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
