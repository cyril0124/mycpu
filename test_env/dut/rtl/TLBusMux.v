module TLBusMux(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_address,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
  input  [31:0] io_in_1_bits_address,
  input  [3:0]  io_in_1_bits_mask,
  input  [31:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [3:0]  io_out_bits_size,
  output        io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [3:0]  io_out_bits_mask,
  output [31:0] io_out_bits_data,
  input         io_choseOH_0,
  input         io_choseOH_1
);
  wire [31:0] _io_out_bits_T_9 = io_choseOH_0 ? io_in_0_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_10 = io_choseOH_1 ? io_in_1_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_15 = io_choseOH_0 ? 4'h4 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_16 = io_choseOH_1 ? 4'h4 : 4'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_21 = io_choseOH_0 ? 3'h4 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_22 = io_choseOH_1 ? io_in_1_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  assign io_in_0_ready = io_out_ready & io_choseOH_0; // @[Bus.scala 90:80]
  assign io_in_1_ready = io_out_ready & io_choseOH_1; // @[Bus.scala 90:80]
  assign io_out_valid = io_choseOH_0 & io_in_0_valid | io_choseOH_1 & io_in_1_valid; // @[Mux.scala 27:73]
  assign io_out_bits_opcode = _io_out_bits_T_21 | _io_out_bits_T_22; // @[Mux.scala 27:73]
  assign io_out_bits_size = _io_out_bits_T_15 | _io_out_bits_T_16; // @[Mux.scala 27:73]
  assign io_out_bits_source = io_choseOH_1; // @[Mux.scala 27:73]
  assign io_out_bits_address = _io_out_bits_T_9 | _io_out_bits_T_10; // @[Mux.scala 27:73]
  assign io_out_bits_mask = io_choseOH_1 ? io_in_1_bits_mask : 4'h0; // @[Mux.scala 27:73]
  assign io_out_bits_data = io_choseOH_1 ? io_in_1_bits_data : 32'h0; // @[Mux.scala 27:73]
endmodule
