module BusCrossBar(
  input  [31:0] io_masterFace_in_0_bits_address,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [3:0]  io_masterFace_in_1_bits_mask,
  input  [31:0] io_masterFace_in_1_bits_data,
  output        io_masterFace_out_0_valid,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [31:0] io_masterFace_out_1_bits_data,
  output [31:0] io_slaveFace_in_0_bits_address,
  output        io_slaveFace_in_1_valid,
  output [2:0]  io_slaveFace_in_1_bits_opcode,
  output [31:0] io_slaveFace_in_1_bits_address,
  output [3:0]  io_slaveFace_in_1_bits_mask,
  output [31:0] io_slaveFace_in_1_bits_data,
  input         io_slaveFace_out_0_valid,
  input  [31:0] io_slaveFace_out_0_bits_data,
  input         io_slaveFace_out_1_valid,
  input  [31:0] io_slaveFace_out_1_bits_data
);
  assign io_masterFace_out_0_valid = io_slaveFace_out_0_valid; // @[TLBus.scala 158:23]
  assign io_masterFace_out_0_bits_data = io_slaveFace_out_0_bits_data; // @[TLBus.scala 158:23]
  assign io_masterFace_out_1_valid = io_slaveFace_out_1_valid; // @[TLBus.scala 158:23]
  assign io_masterFace_out_1_bits_data = io_slaveFace_out_1_bits_data; // @[TLBus.scala 158:23]
  assign io_slaveFace_in_0_bits_address = io_masterFace_in_0_bits_address; // @[TLBus.scala 157:21]
  assign io_slaveFace_in_1_valid = io_masterFace_in_1_valid; // @[TLBus.scala 157:21]
  assign io_slaveFace_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[TLBus.scala 157:21]
  assign io_slaveFace_in_1_bits_address = io_masterFace_in_1_bits_address; // @[TLBus.scala 157:21]
  assign io_slaveFace_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[TLBus.scala 157:21]
  assign io_slaveFace_in_1_bits_data = io_masterFace_in_1_bits_data; // @[TLBus.scala 157:21]
endmodule
