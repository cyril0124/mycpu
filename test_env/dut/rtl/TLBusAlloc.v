module TLBusAlloc(
  input         io_out_0_ready,
  output        io_out_0_valid,
  output [2:0]  io_out_0_bits_opcode,
  output [31:0] io_out_0_bits_address,
  output [31:0] io_out_0_bits_data,
  input         io_out_1_ready,
  output        io_out_1_valid,
  output [2:0]  io_out_1_bits_opcode,
  output [31:0] io_out_1_bits_address,
  output [3:0]  io_out_1_bits_mask,
  output [31:0] io_out_1_bits_data,
  output        io_in_ready,
  input         io_in_valid,
  input  [2:0]  io_in_bits_opcode,
  input  [31:0] io_in_bits_address,
  input  [3:0]  io_in_bits_mask,
  input  [31:0] io_in_bits_data,
  input         io_choseOH_0,
  input         io_choseOH_1
);
  assign io_out_0_valid = io_choseOH_0 & io_in_valid; // @[Bus.scala 97:17 102:21 99:21]
  assign io_out_0_bits_opcode = io_in_bits_opcode; // @[Bus.scala 97:17 98:20]
  assign io_out_0_bits_address = io_in_bits_address; // @[Bus.scala 97:17 98:20]
  assign io_out_0_bits_data = io_in_bits_data; // @[Bus.scala 97:17 98:20]
  assign io_out_1_valid = io_choseOH_1 & io_in_valid; // @[Bus.scala 97:17 102:21 99:21]
  assign io_out_1_bits_opcode = io_in_bits_opcode; // @[Bus.scala 97:17 98:20]
  assign io_out_1_bits_address = io_in_bits_address; // @[Bus.scala 97:17 98:20]
  assign io_out_1_bits_mask = io_in_bits_mask; // @[Bus.scala 97:17 98:20]
  assign io_out_1_bits_data = io_in_bits_data; // @[Bus.scala 97:17 98:20]
  assign io_in_ready = io_choseOH_1 ? io_out_1_ready : io_out_0_ready; // @[Bus.scala 97:17 100:25]
endmodule
