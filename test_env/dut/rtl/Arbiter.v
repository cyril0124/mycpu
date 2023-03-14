module Arbiter(
  input  [31:0] io_in_0_bits_address,
  output [31:0] io_out_bits_address
);
  assign io_out_bits_address = io_in_0_bits_address; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
