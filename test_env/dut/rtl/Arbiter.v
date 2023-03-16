module Arbiter(
  input         io_in_0_valid,
  input         io_in_0_bits_source,
  input  [31:0] io_in_0_bits_data,
  input         io_in_1_bits_source,
  input  [31:0] io_in_1_bits_data,
  output        io_out_bits_source,
  output [31:0] io_out_bits_data
);
  assign io_out_bits_source = io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
