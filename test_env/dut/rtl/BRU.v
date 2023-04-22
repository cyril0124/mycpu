module BRU(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [31:0] io_offset,
  input  [31:0] io_pc,
  input  [3:0]  io_opSel,
  output [31:0] io_brAddr,
  output        io_brTaken
);
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[BRU.scala 30:47]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[BRU.scala 31:40]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[BRU.scala 32:40]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[BRU.scala 33:40]
  wire  _cmp_T_8 = $signed(io_in1) >= $signed(io_in2); // @[BRU.scala 34:47]
  wire  _cmp_T_9 = io_in1 >= io_in2; // @[BRU.scala 35:40]
  wire  _cmp_T_13 = 4'h7 == io_opSel ? _cmp_T_3 : 4'h6 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_15 = 4'h3 == io_opSel ? _cmp_T_4 : _cmp_T_13; // @[Mux.scala 81:58]
  wire  _cmp_T_17 = 4'h4 == io_opSel ? _cmp_T_5 : _cmp_T_15; // @[Mux.scala 81:58]
  wire  _cmp_T_19 = 4'h5 == io_opSel ? _cmp_T_8 : _cmp_T_17; // @[Mux.scala 81:58]
  wire  cmp = 4'h8 == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
  wire  _T = io_opSel == 4'h1; // @[BRU.scala 39:19]
  wire [31:0] _brAddr_T_1 = io_pc + io_offset; // @[BRU.scala 40:25]
  wire  _T_1 = io_opSel == 4'h2; // @[BRU.scala 41:25]
  wire [31:0] _brAddr_T_3 = io_in1 + io_offset; // @[BRU.scala 42:26]
  wire [31:0] _GEN_0 = cmp ? _brAddr_T_1 : _brAddr_T_1; // @[BRU.scala 43:32 44:16 46:16]
  wire [31:0] _GEN_1 = io_opSel == 4'h2 ? _brAddr_T_3 : _GEN_0; // @[BRU.scala 41:38 42:16]
  assign io_brAddr = io_opSel == 4'h1 ? _brAddr_T_1 : _GEN_1; // @[BRU.scala 39:31 40:16]
  assign io_brTaken = cmp | _T | _T_1; // @[BRU.scala 50:45]
endmodule
