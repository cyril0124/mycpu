module Arbiter_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_address,
  input  [31:0] io_in_0_bits_data,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_address,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [31:0] io_out_bits_address,
  output [31:0] io_out_bits_data
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_opcode = io_in_0_valid ? 3'h2 : 3'h4; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_address = io_in_0_valid ? io_in_0_bits_address : io_in_1_bits_address; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : 32'h0; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
