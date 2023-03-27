module Arbiter_6(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input  [5:0]  io_in_0_bits_set,
  input  [1:0]  io_in_0_bits_blockSelOH,
  input  [3:0]  io_in_0_bits_way,
  input  [3:0]  io_in_0_bits_mask,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input  [5:0]  io_in_1_bits_set,
  input  [1:0]  io_in_1_bits_blockSelOH,
  input  [3:0]  io_in_1_bits_way,
  input  [3:0]  io_in_1_bits_mask,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [5:0]  io_out_bits_set,
  output [1:0]  io_out_bits_blockSelOH,
  output [3:0]  io_out_bits_way,
  output [3:0]  io_out_bits_mask
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_blockSelOH = io_in_0_valid ? io_in_0_bits_blockSelOH : io_in_1_bits_blockSelOH; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : io_in_1_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_mask = io_in_0_valid ? io_in_0_bits_mask : io_in_1_bits_mask; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
