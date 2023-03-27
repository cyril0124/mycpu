module Arbiter_7(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input  [3:0]  io_in_0_bits_way,
  input  [1:0]  io_in_0_bits_meta,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [3:0]  io_in_1_bits_way,
  input  [1:0]  io_in_1_bits_meta,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [3:0]  io_out_bits_way,
  output [1:0]  io_out_bits_meta
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : io_in_1_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_meta = io_in_0_valid ? io_in_0_bits_meta : io_in_1_bits_meta; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
