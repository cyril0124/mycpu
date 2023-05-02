module Arbiter_5(
  input        io_in_0_valid,
  input  [8:0] io_in_0_bits_set,
  output       io_in_1_ready,
  input  [8:0] io_in_1_bits_set,
  output [8:0] io_out_bits_set
);
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
