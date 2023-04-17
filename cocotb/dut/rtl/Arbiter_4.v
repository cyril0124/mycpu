module Arbiter_4(
  input        io_in_0_valid,
  input  [8:0] io_in_0_bits_set,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [8:0] io_in_1_bits_set,
  output       io_out_valid,
  output [8:0] io_out_bits_set
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
