module ImmGen(
  input  [31:0] io_inst,
  input  [2:0]  io_immSrc,
  input         io_immSign,
  output [31:0] io_imm
);
  wire [31:0] immI = {{20'd0}, io_inst[31:20]}; // @[util.scala 48:36]
  wire [11:0] _immS_T_2 = {io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 33:92]
  wire [31:0] immS = {{20'd0}, _immS_T_2}; // @[util.scala 48:36]
  wire [12:0] _immB_T_4 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] immB = {{19'd0}, _immB_T_4}; // @[util.scala 48:36]
  wire [31:0] immU = {io_inst[31:12], 12'h0}; // @[ImmGen.scala 26:36]
  wire [20:0] _immJ_T_4 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] immJ = {{11'd0}, _immJ_T_4}; // @[util.scala 48:36]
  wire [11:0] _immI_S_T_1 = io_inst[31:20]; // @[util.scala 37:20]
  wire  immI_S_signBit = _immI_S_T_1[11]; // @[util.scala 28:27]
  wire [9:0] immI_S_out_lo = {immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,
    immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immI_S_out_T_1 = io_inst[31:20]; // @[util.scala 32:75]
  wire [31:0] immI_S = {immI_S_out_lo,immI_S_out_lo,_immI_S_out_T_1}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_T_3 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 37:20]
  wire  immS_S_signBit = _immS_S_T_3[11]; // @[util.scala 28:27]
  wire [9:0] immS_S_out_lo = {immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,
    immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_out_T_1 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 32:75]
  wire [31:0] immS_S = {immS_S_out_lo,immS_S_out_lo,_immS_S_out_T_1}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_T_5 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 37:20]
  wire  immB_S_signBit = _immB_S_T_5[12]; // @[util.scala 28:27]
  wire [9:0] immB_S_out_hi = {immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [18:0] _immB_S_out_T = {immB_S_out_hi,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_out_T_1 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 32:75]
  wire [31:0] immB_S = {_immB_S_out_T,_immB_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] immU_S = {io_inst[31:12], 12'h0}; // @[util.scala 30:18]
  wire [20:0] _immJ_S_T_5 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21],1'h0}; // @[util.scala 37:20]
  wire  immJ_S_signBit = _immJ_S_T_5[20]; // @[util.scala 28:27]
  wire [4:0] immJ_S_out_lo = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit}; // @[Cat.scala 33:92]
  wire [20:0] _immJ_S_out_T_1 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21],1'h0}; // @[util.scala 32:75]
  wire [31:0] immJ_S = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,
    immJ_S_out_lo,_immJ_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] _out_T_3 = 3'h1 == io_immSrc ? immS_S : immI_S; // @[Mux.scala 81:58]
  wire [31:0] _out_T_5 = 3'h2 == io_immSrc ? immB_S : _out_T_3; // @[Mux.scala 81:58]
  wire [31:0] _out_T_7 = 3'h3 == io_immSrc ? immU_S : _out_T_5; // @[Mux.scala 81:58]
  wire [31:0] _out_T_9 = 3'h4 == io_immSrc ? immJ_S : _out_T_7; // @[Mux.scala 81:58]
  wire [31:0] _out_T_13 = 3'h1 == io_immSrc ? immS : immI; // @[Mux.scala 81:58]
  wire [31:0] _out_T_15 = 3'h2 == io_immSrc ? immB : _out_T_13; // @[Mux.scala 81:58]
  wire [31:0] _out_T_17 = 3'h3 == io_immSrc ? immU : _out_T_15; // @[Mux.scala 81:58]
  wire [31:0] _out_T_19 = 3'h4 == io_immSrc ? immJ : _out_T_17; // @[Mux.scala 81:58]
  wire [31:0] _GEN_0 = io_immSign ? _out_T_9 : _out_T_19; // @[ImmGen.scala 37:19 38:13 46:13]
  wire [31:0] out_out = {{27'd0}, io_inst[19:15]}; // @[util.scala 48:36]
  assign io_imm = io_immSrc == 3'h5 ? out_out : _GEN_0; // @[ImmGen.scala 55:30 56:13]
endmodule
