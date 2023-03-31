module Arbiter_4(
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [7:0] io_in_0_bits_set,
  input  [3:0] io_in_0_bits_blockSelOH,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [7:0] io_in_1_bits_set,
  input  [3:0] io_in_1_bits_blockSelOH,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits_set,
  output [3:0] io_out_bits_blockSelOH
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_blockSelOH = io_in_0_valid ? io_in_0_bits_blockSelOH : io_in_1_bits_blockSelOH; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
