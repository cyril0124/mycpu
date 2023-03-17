module TLBusMux_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  input         io_choseOH_0,
  input         io_choseOH_1
);
  wire [31:0] _io_out_bits_T = io_choseOH_0 ? io_in_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_1 = io_choseOH_1 ? io_in_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  assign io_in_0_ready = io_out_ready; // @[Bus.scala 84:35]
  assign io_in_1_ready = io_out_ready; // @[Bus.scala 84:35]
  assign io_out_valid = io_choseOH_0 & io_in_0_valid | io_choseOH_1 & io_in_1_valid; // @[Mux.scala 27:73]
  assign io_out_bits_data = _io_out_bits_T | _io_out_bits_T_1; // @[Mux.scala 27:73]
endmodule
