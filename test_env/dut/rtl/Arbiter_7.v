module Arbiter_7(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  output        io_out_valid,
  output [31:0] io_out_bits_addr
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
