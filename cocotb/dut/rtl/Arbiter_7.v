module Arbiter_7(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input  [3:0]  io_in_0_bits_way,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [3:0]  io_in_1_bits_way,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [31:0] io_in_2_bits_addr,
  input  [3:0]  io_in_2_bits_way,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [3:0]  io_out_bits_way,
  output [1:0]  io_out_bits_meta
);
  wire [31:0] _GEN_1 = io_in_1_valid ? io_in_1_bits_addr : io_in_2_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [3:0] _GEN_2 = io_in_1_valid ? io_in_1_bits_way : io_in_2_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [1:0] _GEN_3 = io_in_1_valid ? 2'h1 : 2'h3; // @[Arbiter.scala 136:15 138:26 140:19]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_2_ready = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : _GEN_1; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : _GEN_2; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_meta = io_in_0_valid ? 2'h3 : _GEN_3; // @[Arbiter.scala 138:26 140:19]
endmodule
