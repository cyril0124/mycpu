module Alu(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [3:0]  io_opSel,
  output [31:0] io_out,
  output        io_zero
);
  wire [31:0] _sum_T_2 = 32'h0 - io_in2; // @[Alu.scala 28:41]
  wire [31:0] _sum_T_3 = io_opSel[0] ? _sum_T_2 : io_in2; // @[Alu.scala 28:27]
  wire [31:0] sum = io_in1 + _sum_T_3; // @[Alu.scala 28:22]
  wire [4:0] shamt = io_in2[4:0]; // @[Alu.scala 31:23]
  wire [31:0] _shiftr_T_1 = io_in1 >> shamt; // @[Alu.scala 33:32]
  wire [31:0] _shiftr_T_4 = $signed(io_in1) >>> shamt; // @[Alu.scala 34:49]
  wire [31:0] shiftr = io_opSel[1] ? _shiftr_T_1 : _shiftr_T_4; // @[Alu.scala 32:21]
  wire [62:0] _GEN_5 = {{31'd0}, io_in1}; // @[Alu.scala 36:25]
  wire [62:0] shiftl = _GEN_5 << shamt; // @[Alu.scala 36:25]
  wire [31:0] _shout_T_3 = io_opSel == 4'hb | io_opSel == 4'hc ? shiftr : 32'h0; // @[Alu.scala 37:20]
  wire [62:0] _shout_T_5 = io_opSel == 4'ha ? shiftl : 63'h0; // @[Alu.scala 38:20]
  wire [62:0] _GEN_2 = {{31'd0}, _shout_T_3}; // @[Alu.scala 37:72]
  wire [62:0] shout = _GEN_2 | _shout_T_5; // @[Alu.scala 37:72]
  wire [31:0] _logic_T = io_in1 & io_in2; // @[Alu.scala 43:36]
  wire [31:0] _logic_T_1 = io_in1 | io_in2; // @[Alu.scala 44:36]
  wire [31:0] _logic_T_2 = io_in1 ^ io_in2; // @[Alu.scala 45:36]
  wire [31:0] _logic_T_4 = 4'h2 == io_opSel ? _logic_T : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _logic_T_6 = 4'h3 == io_opSel ? _logic_T_1 : _logic_T_4; // @[Mux.scala 81:58]
  wire [31:0] logic_ = 4'h4 == io_opSel ? _logic_T_2 : _logic_T_6; // @[Mux.scala 81:58]
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[Alu.scala 51:44]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[Alu.scala 52:37]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[Alu.scala 53:37]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[Alu.scala 54:37]
  wire  _cmp_T_6 = io_in1 >= io_in2; // @[Alu.scala 55:37]
  wire  _cmp_T_10 = 4'h9 == io_opSel ? _cmp_T_3 : 4'h8 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_12 = 4'h5 == io_opSel ? _cmp_T_4 : _cmp_T_10; // @[Mux.scala 81:58]
  wire  _cmp_T_14 = 4'h6 == io_opSel ? _cmp_T_5 : _cmp_T_12; // @[Mux.scala 81:58]
  wire  cmp = 4'h7 == io_opSel ? _cmp_T_6 : _cmp_T_14; // @[Mux.scala 81:58]
  wire [31:0] _GEN_3 = {{31'd0}, cmp}; // @[Alu.scala 67:58]
  wire [31:0] _io_out_T_3 = _GEN_3 | logic_; // @[Alu.scala 67:58]
  wire [62:0] _GEN_4 = {{31'd0}, _io_out_T_3}; // @[Alu.scala 67:66]
  wire [62:0] _io_out_T_4 = _GEN_4 | shout; // @[Alu.scala 67:66]
  wire [62:0] _io_out_T_5 = io_opSel == 4'h0 | io_opSel == 4'h1 ? {{31'd0}, sum} : _io_out_T_4; // @[Alu.scala 67:22]
  wire [62:0] _GEN_0 = io_opSel == 4'he ? {{31'd0}, io_in2} : _io_out_T_5; // @[Alu.scala 64:29 65:16 67:16]
  wire [62:0] _GEN_1 = io_opSel == 4'hd ? {{31'd0}, io_in1} : _GEN_0; // @[Alu.scala 62:23 63:16]
  assign io_out = _GEN_1[31:0];
  assign io_zero = 4'h7 == io_opSel ? _cmp_T_6 : _cmp_T_14; // @[Mux.scala 81:58]
endmodule
