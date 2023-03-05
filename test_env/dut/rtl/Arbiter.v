module Arbiter(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_address,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [31:0] io_out_bits_address
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1; // @[Arbiter.scala 147:19]
  assign io_out_bits_opcode = io_in_0_valid ? 3'h4 : 3'h0; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_address = io_in_0_valid ? io_in_0_bits_address : 32'h0; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
