module Arbiter_7(
  input         io_in_0_valid,
  input  [8:0]  io_in_0_bits_set,
  input  [31:0] io_in_0_bits_data_0,
  input  [31:0] io_in_0_bits_data_1,
  input  [31:0] io_in_0_bits_data_2,
  input  [31:0] io_in_0_bits_data_3,
  input  [3:0]  io_in_0_bits_blockMask,
  input  [3:0]  io_in_0_bits_way,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [8:0]  io_in_1_bits_set,
  input  [31:0] io_in_1_bits_data_0,
  input  [31:0] io_in_1_bits_data_1,
  input  [31:0] io_in_1_bits_data_2,
  input  [31:0] io_in_1_bits_data_3,
  input  [3:0]  io_in_1_bits_way,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [8:0]  io_in_2_bits_set,
  input  [31:0] io_in_2_bits_data_0,
  input  [31:0] io_in_2_bits_data_1,
  input  [31:0] io_in_2_bits_data_2,
  input  [31:0] io_in_2_bits_data_3,
  input  [3:0]  io_in_2_bits_blockMask,
  input  [3:0]  io_in_2_bits_way,
  output        io_out_valid,
  output [8:0]  io_out_bits_set,
  output [31:0] io_out_bits_data_0,
  output [31:0] io_out_bits_data_1,
  output [31:0] io_out_bits_data_2,
  output [31:0] io_out_bits_data_3,
  output [3:0]  io_out_bits_blockMask,
  output [3:0]  io_out_bits_way
);
  wire [8:0] _GEN_1 = io_in_1_valid ? io_in_1_bits_set : io_in_2_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [31:0] _GEN_3 = io_in_1_valid ? io_in_1_bits_data_0 : io_in_2_bits_data_0; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [31:0] _GEN_4 = io_in_1_valid ? io_in_1_bits_data_1 : io_in_2_bits_data_1; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [31:0] _GEN_5 = io_in_1_valid ? io_in_1_bits_data_2 : io_in_2_bits_data_2; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [31:0] _GEN_6 = io_in_1_valid ? io_in_1_bits_data_3 : io_in_2_bits_data_3; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [3:0] _GEN_7 = io_in_1_valid ? 4'hf : io_in_2_bits_blockMask; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [3:0] _GEN_8 = io_in_1_valid ? io_in_1_bits_way : io_in_2_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_2_ready = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : _GEN_1; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_data_0 = io_in_0_valid ? io_in_0_bits_data_0 : _GEN_3; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_data_1 = io_in_0_valid ? io_in_0_bits_data_1 : _GEN_4; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_data_2 = io_in_0_valid ? io_in_0_bits_data_2 : _GEN_5; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_data_3 = io_in_0_valid ? io_in_0_bits_data_3 : _GEN_6; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_blockMask = io_in_0_valid ? io_in_0_bits_blockMask : _GEN_7; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : _GEN_8; // @[Arbiter.scala 138:26 140:19]
endmodule
