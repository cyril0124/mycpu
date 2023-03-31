module Arbiter_6(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input  [7:0]  io_in_0_bits_set,
  input  [3:0]  io_in_0_bits_blockSelOH,
  input  [7:0]  io_in_0_bits_way,
  input  [3:0]  io_in_0_bits_mask,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input  [7:0]  io_in_1_bits_set,
  input  [3:0]  io_in_1_bits_blockSelOH,
  input  [7:0]  io_in_1_bits_way,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [31:0] io_in_2_bits_data,
  input  [7:0]  io_in_2_bits_set,
  input  [3:0]  io_in_2_bits_blockSelOH,
  input  [7:0]  io_in_2_bits_way,
  input  [3:0]  io_in_2_bits_mask,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [7:0]  io_out_bits_set,
  output [3:0]  io_out_bits_blockSelOH,
  output [7:0]  io_out_bits_way,
  output [3:0]  io_out_bits_mask
);
  wire [31:0] _GEN_1 = io_in_1_valid ? io_in_1_bits_data : io_in_2_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [7:0] _GEN_2 = io_in_1_valid ? io_in_1_bits_set : io_in_2_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [3:0] _GEN_3 = io_in_1_valid ? io_in_1_bits_blockSelOH : io_in_2_bits_blockSelOH; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [7:0] _GEN_4 = io_in_1_valid ? io_in_1_bits_way : io_in_2_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  wire [3:0] _GEN_5 = io_in_1_valid ? 4'hf : io_in_2_bits_mask; // @[Arbiter.scala 136:15 138:26 140:19]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_2_ready = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : _GEN_1; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : _GEN_2; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_blockSelOH = io_in_0_valid ? io_in_0_bits_blockSelOH : _GEN_3; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : _GEN_4; // @[Arbiter.scala 138:26 140:19]
  assign io_out_bits_mask = io_in_0_valid ? io_in_0_bits_mask : _GEN_5; // @[Arbiter.scala 138:26 140:19]
endmodule
