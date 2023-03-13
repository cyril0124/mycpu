module Arbiter_2(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  output        io_out_valid,
  output [31:0] io_out_bits_data
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1; // @[Arbiter.scala 147:19]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : 32'h0; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
