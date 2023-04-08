module TLSerializer(
  input         io_in_valid,
  input  [31:0] io_in_bits_0_0,
  input  [31:0] io_in_bits_0_1,
  input  [31:0] io_in_bits_0_2,
  input  [31:0] io_in_bits_0_3,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_0,
  output [31:0] io_out_bits_1,
  output [31:0] io_out_bits_2,
  output [31:0] io_out_bits_3,
  output        io_fireAll
);
  assign io_out_valid = io_in_valid; // @[TLSerializer.scala 41:18]
  assign io_out_bits_0 = io_in_bits_0_0; // @[TLSerializer.scala 42:17]
  assign io_out_bits_1 = io_in_bits_0_1; // @[TLSerializer.scala 42:17]
  assign io_out_bits_2 = io_in_bits_0_2; // @[TLSerializer.scala 42:17]
  assign io_out_bits_3 = io_in_bits_0_3; // @[TLSerializer.scala 42:17]
  assign io_fireAll = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
endmodule
