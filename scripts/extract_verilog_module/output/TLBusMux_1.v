module TLBusMux_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [2:0]  io_in_0_bits_opcode,
  input  [31:0] io_in_0_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [31:0] io_out_bits_data,
  input         io_choseOH_0
);
  assign io_in_0_ready = io_out_ready & io_choseOH_0; // @[Bus.scala 90:80]
  assign io_out_valid = io_choseOH_0 & io_in_0_valid; // @[Mux.scala 27:73]
  assign io_out_bits_opcode = io_choseOH_0 ? io_in_0_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  assign io_out_bits_data = io_choseOH_0 ? io_in_0_bits_data : 32'h0; // @[Mux.scala 27:73]
endmodule
