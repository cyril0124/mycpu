module ALU_1(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [4:0]  io_opSel,
  output [31:0] io_out
);
  wire [31:0] _sum_T_2 = 32'h0 - io_in2; // @[ALU.scala 28:41]
  wire [31:0] _sum_T_3 = io_opSel[0] ? _sum_T_2 : io_in2; // @[ALU.scala 28:27]
  wire [31:0] sum = io_in1 + _sum_T_3; // @[ALU.scala 28:22]
  wire [4:0] shamt = io_in2[4:0]; // @[ALU.scala 31:23]
  wire [31:0] _shiftr_T_1 = io_in1 >> shamt; // @[ALU.scala 33:32]
  wire [31:0] _shiftr_T_4 = $signed(io_in1) >>> shamt; // @[ALU.scala 34:49]
  wire [31:0] shiftr = io_opSel[1] ? _shiftr_T_1 : _shiftr_T_4; // @[ALU.scala 32:21]
  wire [62:0] _GEN_5 = {{31'd0}, io_in1}; // @[ALU.scala 36:25]
  wire [62:0] shiftl = _GEN_5 << shamt; // @[ALU.scala 36:25]
  wire [31:0] _shout_T_3 = io_opSel == 5'hb | io_opSel == 5'hc ? shiftr : 32'h0; // @[ALU.scala 37:20]
  wire [62:0] _shout_T_5 = io_opSel == 5'ha ? shiftl : 63'h0; // @[ALU.scala 38:20]
  wire [62:0] _GEN_2 = {{31'd0}, _shout_T_3}; // @[ALU.scala 37:80]
  wire [62:0] shout = _GEN_2 | _shout_T_5; // @[ALU.scala 37:80]
  wire [31:0] _logic_T = io_in1 & io_in2; // @[ALU.scala 42:40]
  wire [31:0] _logic_T_1 = io_in1 | io_in2; // @[ALU.scala 43:40]
  wire [31:0] _logic_T_2 = io_in1 ^ io_in2; // @[ALU.scala 44:40]
  wire [31:0] _logic_T_4 = 5'h2 == io_opSel ? _logic_T : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _logic_T_6 = 5'h3 == io_opSel ? _logic_T_1 : _logic_T_4; // @[Mux.scala 81:58]
  wire [31:0] logic_ = 5'h4 == io_opSel ? _logic_T_2 : _logic_T_6; // @[Mux.scala 81:58]
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[ALU.scala 49:48]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[ALU.scala 50:41]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[ALU.scala 51:41]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[ALU.scala 52:41]
  wire  _cmp_T_8 = $signed(io_in1) >= $signed(io_in2); // @[ALU.scala 53:48]
  wire  _cmp_T_9 = io_in1 >= io_in2; // @[ALU.scala 54:42]
  wire  _cmp_T_13 = 5'h9 == io_opSel ? _cmp_T_3 : 5'h8 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_15 = 5'h5 == io_opSel ? _cmp_T_4 : _cmp_T_13; // @[Mux.scala 81:58]
  wire  _cmp_T_17 = 5'h6 == io_opSel ? _cmp_T_5 : _cmp_T_15; // @[Mux.scala 81:58]
  wire  _cmp_T_19 = 5'h7 == io_opSel ? _cmp_T_8 : _cmp_T_17; // @[Mux.scala 81:58]
  wire  cmp = 5'hf == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
  wire [62:0] _GEN_3 = {{31'd0}, logic_}; // @[ALU.scala 63:68]
  wire [62:0] _io_out_T_3 = _GEN_3 | shout; // @[ALU.scala 63:68]
  wire [62:0] _GEN_4 = {{62'd0}, cmp}; // @[ALU.scala 63:76]
  wire [62:0] _io_out_T_4 = _io_out_T_3 | _GEN_4; // @[ALU.scala 63:76]
  wire [62:0] _io_out_T_5 = io_opSel == 5'h0 | io_opSel == 5'h1 ? {{31'd0}, sum} : _io_out_T_4; // @[ALU.scala 63:22]
  wire [62:0] _GEN_0 = io_opSel == 5'he ? {{31'd0}, io_in2} : _io_out_T_5; // @[ALU.scala 60:33 61:16 63:16]
  wire [62:0] _GEN_1 = io_opSel == 5'hd ? {{31'd0}, io_in1} : _GEN_0; // @[ALU.scala 58:27 59:16]
  assign io_out = _GEN_1[31:0];
endmodule
