module RegFile2(
  input         clock,
  input         reset,
  input  [4:0]  io_r_0_addr,
  output [31:0] io_r_0_data,
  input  [4:0]  io_r_1_addr,
  output [31:0] io_r_1_data,
  input  [4:0]  io_r_2_addr,
  output [31:0] io_r_2_data,
  input  [4:0]  io_r_3_addr,
  output [31:0] io_r_3_data,
  input  [4:0]  io_r_4_addr,
  output [31:0] io_r_4_data,
  input  [4:0]  io_r_5_addr,
  output [31:0] io_r_5_data,
  input  [4:0]  io_r_6_addr,
  output [31:0] io_r_6_data,
  input  [4:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [31:0] io_w_0_data,
  input  [4:0]  io_w_1_addr,
  input         io_w_1_en,
  input  [31:0] io_w_1_data,
  input  [4:0]  io_w_2_addr,
  input         io_w_2_en,
  input  [31:0] io_w_2_data,
  input  [4:0]  io_w_3_addr,
  input         io_w_3_en,
  input  [31:0] io_w_3_data,
  output [31:0] regState_0_regState_0,
  output [31:0] regState_0_regState_1,
  output [31:0] regState_0_regState_2,
  output [31:0] regState_0_regState_3,
  output [31:0] regState_0_regState_4,
  output [31:0] regState_0_regState_5,
  output [31:0] regState_0_regState_6,
  output [31:0] regState_0_regState_7,
  output [31:0] regState_0_regState_8,
  output [31:0] regState_0_regState_9,
  output [31:0] regState_0_regState_10,
  output [31:0] regState_0_regState_11,
  output [31:0] regState_0_regState_12,
  output [31:0] regState_0_regState_13,
  output [31:0] regState_0_regState_14,
  output [31:0] regState_0_regState_15,
  output [31:0] regState_0_regState_16,
  output [31:0] regState_0_regState_17,
  output [31:0] regState_0_regState_18,
  output [31:0] regState_0_regState_19,
  output [31:0] regState_0_regState_20,
  output [31:0] regState_0_regState_21,
  output [31:0] regState_0_regState_22,
  output [31:0] regState_0_regState_23,
  output [31:0] regState_0_regState_24,
  output [31:0] regState_0_regState_25,
  output [31:0] regState_0_regState_26,
  output [31:0] regState_0_regState_27,
  output [31:0] regState_0_regState_28,
  output [31:0] regState_0_regState_29,
  output [31:0] regState_0_regState_30,
  output [31:0] regState_0_regState_31
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs_0; // @[RegFile.scala 125:17]
  reg [31:0] regs_1; // @[RegFile.scala 125:17]
  reg [31:0] regs_2; // @[RegFile.scala 125:17]
  reg [31:0] regs_3; // @[RegFile.scala 125:17]
  reg [31:0] regs_4; // @[RegFile.scala 125:17]
  reg [31:0] regs_5; // @[RegFile.scala 125:17]
  reg [31:0] regs_6; // @[RegFile.scala 125:17]
  reg [31:0] regs_7; // @[RegFile.scala 125:17]
  reg [31:0] regs_8; // @[RegFile.scala 125:17]
  reg [31:0] regs_9; // @[RegFile.scala 125:17]
  reg [31:0] regs_10; // @[RegFile.scala 125:17]
  reg [31:0] regs_11; // @[RegFile.scala 125:17]
  reg [31:0] regs_12; // @[RegFile.scala 125:17]
  reg [31:0] regs_13; // @[RegFile.scala 125:17]
  reg [31:0] regs_14; // @[RegFile.scala 125:17]
  reg [31:0] regs_15; // @[RegFile.scala 125:17]
  reg [31:0] regs_16; // @[RegFile.scala 125:17]
  reg [31:0] regs_17; // @[RegFile.scala 125:17]
  reg [31:0] regs_18; // @[RegFile.scala 125:17]
  reg [31:0] regs_19; // @[RegFile.scala 125:17]
  reg [31:0] regs_20; // @[RegFile.scala 125:17]
  reg [31:0] regs_21; // @[RegFile.scala 125:17]
  reg [31:0] regs_22; // @[RegFile.scala 125:17]
  reg [31:0] regs_23; // @[RegFile.scala 125:17]
  reg [31:0] regs_24; // @[RegFile.scala 125:17]
  reg [31:0] regs_25; // @[RegFile.scala 125:17]
  reg [31:0] regs_26; // @[RegFile.scala 125:17]
  reg [31:0] regs_27; // @[RegFile.scala 125:17]
  reg [31:0] regs_28; // @[RegFile.scala 125:17]
  reg [31:0] regs_29; // @[RegFile.scala 125:17]
  reg [31:0] regs_30; // @[RegFile.scala 125:17]
  reg [31:0] regs_31; // @[RegFile.scala 125:17]
  wire [31:0] _GEN_1 = reset ? 32'h0 : regs_1; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_2 = reset ? 32'h0 : regs_2; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_3 = reset ? 32'h0 : regs_3; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_4 = reset ? 32'h0 : regs_4; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_5 = reset ? 32'h0 : regs_5; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_6 = reset ? 32'h0 : regs_6; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_7 = reset ? 32'h0 : regs_7; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_8 = reset ? 32'h0 : regs_8; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_9 = reset ? 32'h0 : regs_9; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_10 = reset ? 32'h0 : regs_10; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_11 = reset ? 32'h0 : regs_11; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_12 = reset ? 32'h0 : regs_12; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_13 = reset ? 32'h0 : regs_13; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_14 = reset ? 32'h0 : regs_14; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_15 = reset ? 32'h0 : regs_15; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_16 = reset ? 32'h0 : regs_16; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_17 = reset ? 32'h0 : regs_17; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_18 = reset ? 32'h0 : regs_18; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_19 = reset ? 32'h0 : regs_19; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_20 = reset ? 32'h0 : regs_20; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_21 = reset ? 32'h0 : regs_21; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_22 = reset ? 32'h0 : regs_22; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_23 = reset ? 32'h0 : regs_23; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_24 = reset ? 32'h0 : regs_24; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_25 = reset ? 32'h0 : regs_25; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_26 = reset ? 32'h0 : regs_26; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_27 = reset ? 32'h0 : regs_27; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_28 = reset ? 32'h0 : regs_28; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_29 = reset ? 32'h0 : regs_29; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_30 = reset ? 32'h0 : regs_30; // @[RegFile.scala 125:17 126:22 128:9]
  wire [31:0] _GEN_31 = reset ? 32'h0 : regs_31; // @[RegFile.scala 125:17 126:22 128:9]
  wire  _writeVec_T_2 = io_w_0_addr != 5'h0; // @[RegFile.scala 152:75]
  wire  _writeVec_T_3 = io_w_0_addr == io_r_0_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_6 = io_w_1_addr != 5'h0; // @[RegFile.scala 152:75]
  wire  _writeVec_T_7 = io_w_1_addr == io_r_0_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_10 = io_w_2_addr != 5'h0; // @[RegFile.scala 152:75]
  wire  _writeVec_T_11 = io_w_2_addr == io_r_0_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_14 = io_w_3_addr != 5'h0; // @[RegFile.scala 152:75]
  wire  _writeVec_T_15 = io_w_3_addr == io_r_0_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec = {_writeVec_T_15,_writeVec_T_11,_writeVec_T_7,_writeVec_T_3}; // @[Cat.scala 33:92]
  wire  hasWrite = |writeVec; // @[RegFile.scala 153:29]
  wire [1:0] io_r_0_data_hi = writeVec[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_0_data_lo = writeVec[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_0_data_T = |io_r_0_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_0_data_T_1 = io_r_0_data_hi | io_r_0_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_0_data_T_3 = {_io_r_0_data_T,_io_r_0_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_33 = 2'h1 == _io_r_0_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_34 = 2'h2 == _io_r_0_data_T_3 ? io_w_2_data : _GEN_33; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_35 = 2'h3 == _io_r_0_data_T_3 ? io_w_3_data : _GEN_34; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_36 = regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_37 = 5'h1 == io_r_0_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_38 = 5'h2 == io_r_0_addr ? regs_2 : _GEN_37; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_39 = 5'h3 == io_r_0_addr ? regs_3 : _GEN_38; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_40 = 5'h4 == io_r_0_addr ? regs_4 : _GEN_39; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_41 = 5'h5 == io_r_0_addr ? regs_5 : _GEN_40; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_42 = 5'h6 == io_r_0_addr ? regs_6 : _GEN_41; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_43 = 5'h7 == io_r_0_addr ? regs_7 : _GEN_42; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_44 = 5'h8 == io_r_0_addr ? regs_8 : _GEN_43; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_45 = 5'h9 == io_r_0_addr ? regs_9 : _GEN_44; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_46 = 5'ha == io_r_0_addr ? regs_10 : _GEN_45; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_47 = 5'hb == io_r_0_addr ? regs_11 : _GEN_46; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_48 = 5'hc == io_r_0_addr ? regs_12 : _GEN_47; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_49 = 5'hd == io_r_0_addr ? regs_13 : _GEN_48; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_50 = 5'he == io_r_0_addr ? regs_14 : _GEN_49; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_51 = 5'hf == io_r_0_addr ? regs_15 : _GEN_50; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_52 = 5'h10 == io_r_0_addr ? regs_16 : _GEN_51; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_53 = 5'h11 == io_r_0_addr ? regs_17 : _GEN_52; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_54 = 5'h12 == io_r_0_addr ? regs_18 : _GEN_53; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_55 = 5'h13 == io_r_0_addr ? regs_19 : _GEN_54; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_56 = 5'h14 == io_r_0_addr ? regs_20 : _GEN_55; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_57 = 5'h15 == io_r_0_addr ? regs_21 : _GEN_56; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_58 = 5'h16 == io_r_0_addr ? regs_22 : _GEN_57; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_59 = 5'h17 == io_r_0_addr ? regs_23 : _GEN_58; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_60 = 5'h18 == io_r_0_addr ? regs_24 : _GEN_59; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_61 = 5'h19 == io_r_0_addr ? regs_25 : _GEN_60; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_62 = 5'h1a == io_r_0_addr ? regs_26 : _GEN_61; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_63 = 5'h1b == io_r_0_addr ? regs_27 : _GEN_62; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_64 = 5'h1c == io_r_0_addr ? regs_28 : _GEN_63; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_65 = 5'h1d == io_r_0_addr ? regs_29 : _GEN_64; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_66 = 5'h1e == io_r_0_addr ? regs_30 : _GEN_65; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_67 = 5'h1f == io_r_0_addr ? regs_31 : _GEN_66; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_19 = io_w_0_addr == io_r_1_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_23 = io_w_1_addr == io_r_1_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_27 = io_w_2_addr == io_r_1_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_31 = io_w_3_addr == io_r_1_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_1 = {_writeVec_T_31,_writeVec_T_27,_writeVec_T_23,_writeVec_T_19}; // @[Cat.scala 33:92]
  wire  hasWrite_1 = |writeVec_1; // @[RegFile.scala 153:29]
  wire [1:0] io_r_1_data_hi = writeVec_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_1_data_lo = writeVec_1[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_1_data_T = |io_r_1_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_1_data_T_1 = io_r_1_data_hi | io_r_1_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_1_data_T_3 = {_io_r_1_data_T,_io_r_1_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_71 = 2'h1 == _io_r_1_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_72 = 2'h2 == _io_r_1_data_T_3 ? io_w_2_data : _GEN_71; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_73 = 2'h3 == _io_r_1_data_T_3 ? io_w_3_data : _GEN_72; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_75 = 5'h1 == io_r_1_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_76 = 5'h2 == io_r_1_addr ? regs_2 : _GEN_75; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_77 = 5'h3 == io_r_1_addr ? regs_3 : _GEN_76; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_78 = 5'h4 == io_r_1_addr ? regs_4 : _GEN_77; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_79 = 5'h5 == io_r_1_addr ? regs_5 : _GEN_78; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_80 = 5'h6 == io_r_1_addr ? regs_6 : _GEN_79; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_81 = 5'h7 == io_r_1_addr ? regs_7 : _GEN_80; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_82 = 5'h8 == io_r_1_addr ? regs_8 : _GEN_81; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_83 = 5'h9 == io_r_1_addr ? regs_9 : _GEN_82; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_84 = 5'ha == io_r_1_addr ? regs_10 : _GEN_83; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_85 = 5'hb == io_r_1_addr ? regs_11 : _GEN_84; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_86 = 5'hc == io_r_1_addr ? regs_12 : _GEN_85; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_87 = 5'hd == io_r_1_addr ? regs_13 : _GEN_86; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_88 = 5'he == io_r_1_addr ? regs_14 : _GEN_87; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_89 = 5'hf == io_r_1_addr ? regs_15 : _GEN_88; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_90 = 5'h10 == io_r_1_addr ? regs_16 : _GEN_89; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_91 = 5'h11 == io_r_1_addr ? regs_17 : _GEN_90; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_92 = 5'h12 == io_r_1_addr ? regs_18 : _GEN_91; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_93 = 5'h13 == io_r_1_addr ? regs_19 : _GEN_92; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_94 = 5'h14 == io_r_1_addr ? regs_20 : _GEN_93; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_95 = 5'h15 == io_r_1_addr ? regs_21 : _GEN_94; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_96 = 5'h16 == io_r_1_addr ? regs_22 : _GEN_95; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_97 = 5'h17 == io_r_1_addr ? regs_23 : _GEN_96; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_98 = 5'h18 == io_r_1_addr ? regs_24 : _GEN_97; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_99 = 5'h19 == io_r_1_addr ? regs_25 : _GEN_98; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_100 = 5'h1a == io_r_1_addr ? regs_26 : _GEN_99; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_101 = 5'h1b == io_r_1_addr ? regs_27 : _GEN_100; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_102 = 5'h1c == io_r_1_addr ? regs_28 : _GEN_101; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_103 = 5'h1d == io_r_1_addr ? regs_29 : _GEN_102; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_104 = 5'h1e == io_r_1_addr ? regs_30 : _GEN_103; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_105 = 5'h1f == io_r_1_addr ? regs_31 : _GEN_104; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_35 = io_w_0_addr == io_r_2_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_39 = io_w_1_addr == io_r_2_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_43 = io_w_2_addr == io_r_2_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_47 = io_w_3_addr == io_r_2_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_2 = {_writeVec_T_47,_writeVec_T_43,_writeVec_T_39,_writeVec_T_35}; // @[Cat.scala 33:92]
  wire  hasWrite_2 = |writeVec_2; // @[RegFile.scala 153:29]
  wire [1:0] io_r_2_data_hi = writeVec_2[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_2_data_lo = writeVec_2[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_2_data_T = |io_r_2_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_2_data_T_1 = io_r_2_data_hi | io_r_2_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_2_data_T_3 = {_io_r_2_data_T,_io_r_2_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_109 = 2'h1 == _io_r_2_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_110 = 2'h2 == _io_r_2_data_T_3 ? io_w_2_data : _GEN_109; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_111 = 2'h3 == _io_r_2_data_T_3 ? io_w_3_data : _GEN_110; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_113 = 5'h1 == io_r_2_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_114 = 5'h2 == io_r_2_addr ? regs_2 : _GEN_113; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_115 = 5'h3 == io_r_2_addr ? regs_3 : _GEN_114; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_116 = 5'h4 == io_r_2_addr ? regs_4 : _GEN_115; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_117 = 5'h5 == io_r_2_addr ? regs_5 : _GEN_116; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_118 = 5'h6 == io_r_2_addr ? regs_6 : _GEN_117; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_119 = 5'h7 == io_r_2_addr ? regs_7 : _GEN_118; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_120 = 5'h8 == io_r_2_addr ? regs_8 : _GEN_119; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_121 = 5'h9 == io_r_2_addr ? regs_9 : _GEN_120; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_122 = 5'ha == io_r_2_addr ? regs_10 : _GEN_121; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_123 = 5'hb == io_r_2_addr ? regs_11 : _GEN_122; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_124 = 5'hc == io_r_2_addr ? regs_12 : _GEN_123; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_125 = 5'hd == io_r_2_addr ? regs_13 : _GEN_124; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_126 = 5'he == io_r_2_addr ? regs_14 : _GEN_125; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_127 = 5'hf == io_r_2_addr ? regs_15 : _GEN_126; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_128 = 5'h10 == io_r_2_addr ? regs_16 : _GEN_127; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_129 = 5'h11 == io_r_2_addr ? regs_17 : _GEN_128; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_130 = 5'h12 == io_r_2_addr ? regs_18 : _GEN_129; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_131 = 5'h13 == io_r_2_addr ? regs_19 : _GEN_130; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_132 = 5'h14 == io_r_2_addr ? regs_20 : _GEN_131; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_133 = 5'h15 == io_r_2_addr ? regs_21 : _GEN_132; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_134 = 5'h16 == io_r_2_addr ? regs_22 : _GEN_133; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_135 = 5'h17 == io_r_2_addr ? regs_23 : _GEN_134; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_136 = 5'h18 == io_r_2_addr ? regs_24 : _GEN_135; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_137 = 5'h19 == io_r_2_addr ? regs_25 : _GEN_136; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_138 = 5'h1a == io_r_2_addr ? regs_26 : _GEN_137; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_139 = 5'h1b == io_r_2_addr ? regs_27 : _GEN_138; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_140 = 5'h1c == io_r_2_addr ? regs_28 : _GEN_139; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_141 = 5'h1d == io_r_2_addr ? regs_29 : _GEN_140; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_142 = 5'h1e == io_r_2_addr ? regs_30 : _GEN_141; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_143 = 5'h1f == io_r_2_addr ? regs_31 : _GEN_142; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_51 = io_w_0_addr == io_r_3_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_55 = io_w_1_addr == io_r_3_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_59 = io_w_2_addr == io_r_3_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_63 = io_w_3_addr == io_r_3_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_3 = {_writeVec_T_63,_writeVec_T_59,_writeVec_T_55,_writeVec_T_51}; // @[Cat.scala 33:92]
  wire  hasWrite_3 = |writeVec_3; // @[RegFile.scala 153:29]
  wire [1:0] io_r_3_data_hi = writeVec_3[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_3_data_lo = writeVec_3[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_3_data_T = |io_r_3_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_3_data_T_1 = io_r_3_data_hi | io_r_3_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_3_data_T_3 = {_io_r_3_data_T,_io_r_3_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_147 = 2'h1 == _io_r_3_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_148 = 2'h2 == _io_r_3_data_T_3 ? io_w_2_data : _GEN_147; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_149 = 2'h3 == _io_r_3_data_T_3 ? io_w_3_data : _GEN_148; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_151 = 5'h1 == io_r_3_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_152 = 5'h2 == io_r_3_addr ? regs_2 : _GEN_151; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_153 = 5'h3 == io_r_3_addr ? regs_3 : _GEN_152; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_154 = 5'h4 == io_r_3_addr ? regs_4 : _GEN_153; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_155 = 5'h5 == io_r_3_addr ? regs_5 : _GEN_154; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_156 = 5'h6 == io_r_3_addr ? regs_6 : _GEN_155; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_157 = 5'h7 == io_r_3_addr ? regs_7 : _GEN_156; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_158 = 5'h8 == io_r_3_addr ? regs_8 : _GEN_157; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_159 = 5'h9 == io_r_3_addr ? regs_9 : _GEN_158; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_160 = 5'ha == io_r_3_addr ? regs_10 : _GEN_159; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_161 = 5'hb == io_r_3_addr ? regs_11 : _GEN_160; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_162 = 5'hc == io_r_3_addr ? regs_12 : _GEN_161; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_163 = 5'hd == io_r_3_addr ? regs_13 : _GEN_162; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_164 = 5'he == io_r_3_addr ? regs_14 : _GEN_163; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_165 = 5'hf == io_r_3_addr ? regs_15 : _GEN_164; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_166 = 5'h10 == io_r_3_addr ? regs_16 : _GEN_165; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_167 = 5'h11 == io_r_3_addr ? regs_17 : _GEN_166; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_168 = 5'h12 == io_r_3_addr ? regs_18 : _GEN_167; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_169 = 5'h13 == io_r_3_addr ? regs_19 : _GEN_168; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_170 = 5'h14 == io_r_3_addr ? regs_20 : _GEN_169; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_171 = 5'h15 == io_r_3_addr ? regs_21 : _GEN_170; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_172 = 5'h16 == io_r_3_addr ? regs_22 : _GEN_171; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_173 = 5'h17 == io_r_3_addr ? regs_23 : _GEN_172; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_174 = 5'h18 == io_r_3_addr ? regs_24 : _GEN_173; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_175 = 5'h19 == io_r_3_addr ? regs_25 : _GEN_174; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_176 = 5'h1a == io_r_3_addr ? regs_26 : _GEN_175; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_177 = 5'h1b == io_r_3_addr ? regs_27 : _GEN_176; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_178 = 5'h1c == io_r_3_addr ? regs_28 : _GEN_177; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_179 = 5'h1d == io_r_3_addr ? regs_29 : _GEN_178; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_180 = 5'h1e == io_r_3_addr ? regs_30 : _GEN_179; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_181 = 5'h1f == io_r_3_addr ? regs_31 : _GEN_180; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_67 = io_w_0_addr == io_r_4_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_71 = io_w_1_addr == io_r_4_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_75 = io_w_2_addr == io_r_4_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_79 = io_w_3_addr == io_r_4_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_4 = {_writeVec_T_79,_writeVec_T_75,_writeVec_T_71,_writeVec_T_67}; // @[Cat.scala 33:92]
  wire  hasWrite_4 = |writeVec_4; // @[RegFile.scala 153:29]
  wire [1:0] io_r_4_data_hi = writeVec_4[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_4_data_lo = writeVec_4[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_4_data_T = |io_r_4_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_4_data_T_1 = io_r_4_data_hi | io_r_4_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_4_data_T_3 = {_io_r_4_data_T,_io_r_4_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_185 = 2'h1 == _io_r_4_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_186 = 2'h2 == _io_r_4_data_T_3 ? io_w_2_data : _GEN_185; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_187 = 2'h3 == _io_r_4_data_T_3 ? io_w_3_data : _GEN_186; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_189 = 5'h1 == io_r_4_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_190 = 5'h2 == io_r_4_addr ? regs_2 : _GEN_189; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_191 = 5'h3 == io_r_4_addr ? regs_3 : _GEN_190; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_192 = 5'h4 == io_r_4_addr ? regs_4 : _GEN_191; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_193 = 5'h5 == io_r_4_addr ? regs_5 : _GEN_192; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_194 = 5'h6 == io_r_4_addr ? regs_6 : _GEN_193; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_195 = 5'h7 == io_r_4_addr ? regs_7 : _GEN_194; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_196 = 5'h8 == io_r_4_addr ? regs_8 : _GEN_195; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_197 = 5'h9 == io_r_4_addr ? regs_9 : _GEN_196; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_198 = 5'ha == io_r_4_addr ? regs_10 : _GEN_197; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_199 = 5'hb == io_r_4_addr ? regs_11 : _GEN_198; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_200 = 5'hc == io_r_4_addr ? regs_12 : _GEN_199; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_201 = 5'hd == io_r_4_addr ? regs_13 : _GEN_200; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_202 = 5'he == io_r_4_addr ? regs_14 : _GEN_201; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_203 = 5'hf == io_r_4_addr ? regs_15 : _GEN_202; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_204 = 5'h10 == io_r_4_addr ? regs_16 : _GEN_203; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_205 = 5'h11 == io_r_4_addr ? regs_17 : _GEN_204; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_206 = 5'h12 == io_r_4_addr ? regs_18 : _GEN_205; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_207 = 5'h13 == io_r_4_addr ? regs_19 : _GEN_206; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_208 = 5'h14 == io_r_4_addr ? regs_20 : _GEN_207; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_209 = 5'h15 == io_r_4_addr ? regs_21 : _GEN_208; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_210 = 5'h16 == io_r_4_addr ? regs_22 : _GEN_209; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_211 = 5'h17 == io_r_4_addr ? regs_23 : _GEN_210; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_212 = 5'h18 == io_r_4_addr ? regs_24 : _GEN_211; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_213 = 5'h19 == io_r_4_addr ? regs_25 : _GEN_212; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_214 = 5'h1a == io_r_4_addr ? regs_26 : _GEN_213; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_215 = 5'h1b == io_r_4_addr ? regs_27 : _GEN_214; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_216 = 5'h1c == io_r_4_addr ? regs_28 : _GEN_215; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_217 = 5'h1d == io_r_4_addr ? regs_29 : _GEN_216; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_218 = 5'h1e == io_r_4_addr ? regs_30 : _GEN_217; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_219 = 5'h1f == io_r_4_addr ? regs_31 : _GEN_218; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_83 = io_w_0_addr == io_r_5_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_87 = io_w_1_addr == io_r_5_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_91 = io_w_2_addr == io_r_5_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_95 = io_w_3_addr == io_r_5_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_5 = {_writeVec_T_95,_writeVec_T_91,_writeVec_T_87,_writeVec_T_83}; // @[Cat.scala 33:92]
  wire  hasWrite_5 = |writeVec_5; // @[RegFile.scala 153:29]
  wire [1:0] io_r_5_data_hi = writeVec_5[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_5_data_lo = writeVec_5[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_5_data_T = |io_r_5_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_5_data_T_1 = io_r_5_data_hi | io_r_5_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_5_data_T_3 = {_io_r_5_data_T,_io_r_5_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_223 = 2'h1 == _io_r_5_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_224 = 2'h2 == _io_r_5_data_T_3 ? io_w_2_data : _GEN_223; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_225 = 2'h3 == _io_r_5_data_T_3 ? io_w_3_data : _GEN_224; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_227 = 5'h1 == io_r_5_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_228 = 5'h2 == io_r_5_addr ? regs_2 : _GEN_227; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_229 = 5'h3 == io_r_5_addr ? regs_3 : _GEN_228; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_230 = 5'h4 == io_r_5_addr ? regs_4 : _GEN_229; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_231 = 5'h5 == io_r_5_addr ? regs_5 : _GEN_230; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_232 = 5'h6 == io_r_5_addr ? regs_6 : _GEN_231; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_233 = 5'h7 == io_r_5_addr ? regs_7 : _GEN_232; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_234 = 5'h8 == io_r_5_addr ? regs_8 : _GEN_233; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_235 = 5'h9 == io_r_5_addr ? regs_9 : _GEN_234; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_236 = 5'ha == io_r_5_addr ? regs_10 : _GEN_235; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_237 = 5'hb == io_r_5_addr ? regs_11 : _GEN_236; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_238 = 5'hc == io_r_5_addr ? regs_12 : _GEN_237; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_239 = 5'hd == io_r_5_addr ? regs_13 : _GEN_238; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_240 = 5'he == io_r_5_addr ? regs_14 : _GEN_239; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_241 = 5'hf == io_r_5_addr ? regs_15 : _GEN_240; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_242 = 5'h10 == io_r_5_addr ? regs_16 : _GEN_241; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_243 = 5'h11 == io_r_5_addr ? regs_17 : _GEN_242; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_244 = 5'h12 == io_r_5_addr ? regs_18 : _GEN_243; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_245 = 5'h13 == io_r_5_addr ? regs_19 : _GEN_244; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_246 = 5'h14 == io_r_5_addr ? regs_20 : _GEN_245; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_247 = 5'h15 == io_r_5_addr ? regs_21 : _GEN_246; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_248 = 5'h16 == io_r_5_addr ? regs_22 : _GEN_247; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_249 = 5'h17 == io_r_5_addr ? regs_23 : _GEN_248; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_250 = 5'h18 == io_r_5_addr ? regs_24 : _GEN_249; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_251 = 5'h19 == io_r_5_addr ? regs_25 : _GEN_250; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_252 = 5'h1a == io_r_5_addr ? regs_26 : _GEN_251; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_253 = 5'h1b == io_r_5_addr ? regs_27 : _GEN_252; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_254 = 5'h1c == io_r_5_addr ? regs_28 : _GEN_253; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_255 = 5'h1d == io_r_5_addr ? regs_29 : _GEN_254; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_256 = 5'h1e == io_r_5_addr ? regs_30 : _GEN_255; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_257 = 5'h1f == io_r_5_addr ? regs_31 : _GEN_256; // @[RegFile.scala 158:{16,16}]
  wire  _writeVec_T_99 = io_w_0_addr == io_r_6_addr & io_w_0_en & io_w_0_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_103 = io_w_1_addr == io_r_6_addr & io_w_1_en & io_w_1_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_107 = io_w_2_addr == io_r_6_addr & io_w_2_en & io_w_2_addr != 5'h0; // @[RegFile.scala 152:65]
  wire  _writeVec_T_111 = io_w_3_addr == io_r_6_addr & io_w_3_en & io_w_3_addr != 5'h0; // @[RegFile.scala 152:65]
  wire [3:0] writeVec_6 = {_writeVec_T_111,_writeVec_T_107,_writeVec_T_103,_writeVec_T_99}; // @[Cat.scala 33:92]
  wire  hasWrite_6 = |writeVec_6; // @[RegFile.scala 153:29]
  wire [1:0] io_r_6_data_hi = writeVec_6[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] io_r_6_data_lo = writeVec_6[1:0]; // @[OneHot.scala 31:18]
  wire  _io_r_6_data_T = |io_r_6_data_hi; // @[OneHot.scala 32:14]
  wire [1:0] _io_r_6_data_T_1 = io_r_6_data_hi | io_r_6_data_lo; // @[OneHot.scala 32:28]
  wire [1:0] _io_r_6_data_T_3 = {_io_r_6_data_T,_io_r_6_data_T_1[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_261 = 2'h1 == _io_r_6_data_T_3 ? io_w_1_data : io_w_0_data; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_262 = 2'h2 == _io_r_6_data_T_3 ? io_w_2_data : _GEN_261; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_263 = 2'h3 == _io_r_6_data_T_3 ? io_w_3_data : _GEN_262; // @[RegFile.scala 156:{16,16}]
  wire [31:0] _GEN_265 = 5'h1 == io_r_6_addr ? regs_1 : regs_0; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_266 = 5'h2 == io_r_6_addr ? regs_2 : _GEN_265; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_267 = 5'h3 == io_r_6_addr ? regs_3 : _GEN_266; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_268 = 5'h4 == io_r_6_addr ? regs_4 : _GEN_267; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_269 = 5'h5 == io_r_6_addr ? regs_5 : _GEN_268; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_270 = 5'h6 == io_r_6_addr ? regs_6 : _GEN_269; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_271 = 5'h7 == io_r_6_addr ? regs_7 : _GEN_270; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_272 = 5'h8 == io_r_6_addr ? regs_8 : _GEN_271; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_273 = 5'h9 == io_r_6_addr ? regs_9 : _GEN_272; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_274 = 5'ha == io_r_6_addr ? regs_10 : _GEN_273; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_275 = 5'hb == io_r_6_addr ? regs_11 : _GEN_274; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_276 = 5'hc == io_r_6_addr ? regs_12 : _GEN_275; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_277 = 5'hd == io_r_6_addr ? regs_13 : _GEN_276; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_278 = 5'he == io_r_6_addr ? regs_14 : _GEN_277; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_279 = 5'hf == io_r_6_addr ? regs_15 : _GEN_278; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_280 = 5'h10 == io_r_6_addr ? regs_16 : _GEN_279; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_281 = 5'h11 == io_r_6_addr ? regs_17 : _GEN_280; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_282 = 5'h12 == io_r_6_addr ? regs_18 : _GEN_281; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_283 = 5'h13 == io_r_6_addr ? regs_19 : _GEN_282; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_284 = 5'h14 == io_r_6_addr ? regs_20 : _GEN_283; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_285 = 5'h15 == io_r_6_addr ? regs_21 : _GEN_284; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_286 = 5'h16 == io_r_6_addr ? regs_22 : _GEN_285; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_287 = 5'h17 == io_r_6_addr ? regs_23 : _GEN_286; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_288 = 5'h18 == io_r_6_addr ? regs_24 : _GEN_287; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_289 = 5'h19 == io_r_6_addr ? regs_25 : _GEN_288; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_290 = 5'h1a == io_r_6_addr ? regs_26 : _GEN_289; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_291 = 5'h1b == io_r_6_addr ? regs_27 : _GEN_290; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_292 = 5'h1c == io_r_6_addr ? regs_28 : _GEN_291; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_293 = 5'h1d == io_r_6_addr ? regs_29 : _GEN_292; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_294 = 5'h1e == io_r_6_addr ? regs_30 : _GEN_293; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_295 = 5'h1f == io_r_6_addr ? regs_31 : _GEN_294; // @[RegFile.scala 158:{16,16}]
  wire [31:0] _GEN_336 = 5'h0 == io_w_0_addr ? io_w_0_data : 32'h0; // @[RegFile.scala 133:11 174:{20,20}]
  wire [31:0] _GEN_337 = 5'h1 == io_w_0_addr ? io_w_0_data : _GEN_1; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_338 = 5'h2 == io_w_0_addr ? io_w_0_data : _GEN_2; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_339 = 5'h3 == io_w_0_addr ? io_w_0_data : _GEN_3; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_340 = 5'h4 == io_w_0_addr ? io_w_0_data : _GEN_4; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_341 = 5'h5 == io_w_0_addr ? io_w_0_data : _GEN_5; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_342 = 5'h6 == io_w_0_addr ? io_w_0_data : _GEN_6; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_343 = 5'h7 == io_w_0_addr ? io_w_0_data : _GEN_7; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_344 = 5'h8 == io_w_0_addr ? io_w_0_data : _GEN_8; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_345 = 5'h9 == io_w_0_addr ? io_w_0_data : _GEN_9; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_346 = 5'ha == io_w_0_addr ? io_w_0_data : _GEN_10; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_347 = 5'hb == io_w_0_addr ? io_w_0_data : _GEN_11; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_348 = 5'hc == io_w_0_addr ? io_w_0_data : _GEN_12; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_349 = 5'hd == io_w_0_addr ? io_w_0_data : _GEN_13; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_350 = 5'he == io_w_0_addr ? io_w_0_data : _GEN_14; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_351 = 5'hf == io_w_0_addr ? io_w_0_data : _GEN_15; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_352 = 5'h10 == io_w_0_addr ? io_w_0_data : _GEN_16; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_353 = 5'h11 == io_w_0_addr ? io_w_0_data : _GEN_17; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_354 = 5'h12 == io_w_0_addr ? io_w_0_data : _GEN_18; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_355 = 5'h13 == io_w_0_addr ? io_w_0_data : _GEN_19; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_356 = 5'h14 == io_w_0_addr ? io_w_0_data : _GEN_20; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_357 = 5'h15 == io_w_0_addr ? io_w_0_data : _GEN_21; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_358 = 5'h16 == io_w_0_addr ? io_w_0_data : _GEN_22; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_359 = 5'h17 == io_w_0_addr ? io_w_0_data : _GEN_23; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_360 = 5'h18 == io_w_0_addr ? io_w_0_data : _GEN_24; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_361 = 5'h19 == io_w_0_addr ? io_w_0_data : _GEN_25; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_362 = 5'h1a == io_w_0_addr ? io_w_0_data : _GEN_26; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_363 = 5'h1b == io_w_0_addr ? io_w_0_data : _GEN_27; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_364 = 5'h1c == io_w_0_addr ? io_w_0_data : _GEN_28; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_365 = 5'h1d == io_w_0_addr ? io_w_0_data : _GEN_29; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_366 = 5'h1e == io_w_0_addr ? io_w_0_data : _GEN_30; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_367 = 5'h1f == io_w_0_addr ? io_w_0_data : _GEN_31; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_368 = io_w_0_en & _writeVec_T_2 ? _GEN_336 : 32'h0; // @[RegFile.scala 133:11 173:33]
  wire [31:0] _GEN_369 = io_w_0_en & _writeVec_T_2 ? _GEN_337 : _GEN_1; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_370 = io_w_0_en & _writeVec_T_2 ? _GEN_338 : _GEN_2; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_371 = io_w_0_en & _writeVec_T_2 ? _GEN_339 : _GEN_3; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_372 = io_w_0_en & _writeVec_T_2 ? _GEN_340 : _GEN_4; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_373 = io_w_0_en & _writeVec_T_2 ? _GEN_341 : _GEN_5; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_374 = io_w_0_en & _writeVec_T_2 ? _GEN_342 : _GEN_6; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_375 = io_w_0_en & _writeVec_T_2 ? _GEN_343 : _GEN_7; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_376 = io_w_0_en & _writeVec_T_2 ? _GEN_344 : _GEN_8; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_377 = io_w_0_en & _writeVec_T_2 ? _GEN_345 : _GEN_9; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_378 = io_w_0_en & _writeVec_T_2 ? _GEN_346 : _GEN_10; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_379 = io_w_0_en & _writeVec_T_2 ? _GEN_347 : _GEN_11; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_380 = io_w_0_en & _writeVec_T_2 ? _GEN_348 : _GEN_12; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_381 = io_w_0_en & _writeVec_T_2 ? _GEN_349 : _GEN_13; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_382 = io_w_0_en & _writeVec_T_2 ? _GEN_350 : _GEN_14; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_383 = io_w_0_en & _writeVec_T_2 ? _GEN_351 : _GEN_15; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_384 = io_w_0_en & _writeVec_T_2 ? _GEN_352 : _GEN_16; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_385 = io_w_0_en & _writeVec_T_2 ? _GEN_353 : _GEN_17; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_386 = io_w_0_en & _writeVec_T_2 ? _GEN_354 : _GEN_18; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_387 = io_w_0_en & _writeVec_T_2 ? _GEN_355 : _GEN_19; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_388 = io_w_0_en & _writeVec_T_2 ? _GEN_356 : _GEN_20; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_389 = io_w_0_en & _writeVec_T_2 ? _GEN_357 : _GEN_21; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_390 = io_w_0_en & _writeVec_T_2 ? _GEN_358 : _GEN_22; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_391 = io_w_0_en & _writeVec_T_2 ? _GEN_359 : _GEN_23; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_392 = io_w_0_en & _writeVec_T_2 ? _GEN_360 : _GEN_24; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_393 = io_w_0_en & _writeVec_T_2 ? _GEN_361 : _GEN_25; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_394 = io_w_0_en & _writeVec_T_2 ? _GEN_362 : _GEN_26; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_395 = io_w_0_en & _writeVec_T_2 ? _GEN_363 : _GEN_27; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_396 = io_w_0_en & _writeVec_T_2 ? _GEN_364 : _GEN_28; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_397 = io_w_0_en & _writeVec_T_2 ? _GEN_365 : _GEN_29; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_398 = io_w_0_en & _writeVec_T_2 ? _GEN_366 : _GEN_30; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_399 = io_w_0_en & _writeVec_T_2 ? _GEN_367 : _GEN_31; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_400 = 5'h0 == io_w_1_addr ? io_w_1_data : _GEN_368; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_401 = 5'h1 == io_w_1_addr ? io_w_1_data : _GEN_369; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_402 = 5'h2 == io_w_1_addr ? io_w_1_data : _GEN_370; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_403 = 5'h3 == io_w_1_addr ? io_w_1_data : _GEN_371; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_404 = 5'h4 == io_w_1_addr ? io_w_1_data : _GEN_372; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_405 = 5'h5 == io_w_1_addr ? io_w_1_data : _GEN_373; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_406 = 5'h6 == io_w_1_addr ? io_w_1_data : _GEN_374; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_407 = 5'h7 == io_w_1_addr ? io_w_1_data : _GEN_375; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_408 = 5'h8 == io_w_1_addr ? io_w_1_data : _GEN_376; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_409 = 5'h9 == io_w_1_addr ? io_w_1_data : _GEN_377; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_410 = 5'ha == io_w_1_addr ? io_w_1_data : _GEN_378; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_411 = 5'hb == io_w_1_addr ? io_w_1_data : _GEN_379; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_412 = 5'hc == io_w_1_addr ? io_w_1_data : _GEN_380; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_413 = 5'hd == io_w_1_addr ? io_w_1_data : _GEN_381; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_414 = 5'he == io_w_1_addr ? io_w_1_data : _GEN_382; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_415 = 5'hf == io_w_1_addr ? io_w_1_data : _GEN_383; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_416 = 5'h10 == io_w_1_addr ? io_w_1_data : _GEN_384; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_417 = 5'h11 == io_w_1_addr ? io_w_1_data : _GEN_385; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_418 = 5'h12 == io_w_1_addr ? io_w_1_data : _GEN_386; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_419 = 5'h13 == io_w_1_addr ? io_w_1_data : _GEN_387; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_420 = 5'h14 == io_w_1_addr ? io_w_1_data : _GEN_388; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_421 = 5'h15 == io_w_1_addr ? io_w_1_data : _GEN_389; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_422 = 5'h16 == io_w_1_addr ? io_w_1_data : _GEN_390; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_423 = 5'h17 == io_w_1_addr ? io_w_1_data : _GEN_391; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_424 = 5'h18 == io_w_1_addr ? io_w_1_data : _GEN_392; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_425 = 5'h19 == io_w_1_addr ? io_w_1_data : _GEN_393; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_426 = 5'h1a == io_w_1_addr ? io_w_1_data : _GEN_394; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_427 = 5'h1b == io_w_1_addr ? io_w_1_data : _GEN_395; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_428 = 5'h1c == io_w_1_addr ? io_w_1_data : _GEN_396; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_429 = 5'h1d == io_w_1_addr ? io_w_1_data : _GEN_397; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_430 = 5'h1e == io_w_1_addr ? io_w_1_data : _GEN_398; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_431 = 5'h1f == io_w_1_addr ? io_w_1_data : _GEN_399; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_432 = io_w_1_en & _writeVec_T_6 ? _GEN_400 : _GEN_368; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_433 = io_w_1_en & _writeVec_T_6 ? _GEN_401 : _GEN_369; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_434 = io_w_1_en & _writeVec_T_6 ? _GEN_402 : _GEN_370; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_435 = io_w_1_en & _writeVec_T_6 ? _GEN_403 : _GEN_371; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_436 = io_w_1_en & _writeVec_T_6 ? _GEN_404 : _GEN_372; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_437 = io_w_1_en & _writeVec_T_6 ? _GEN_405 : _GEN_373; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_438 = io_w_1_en & _writeVec_T_6 ? _GEN_406 : _GEN_374; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_439 = io_w_1_en & _writeVec_T_6 ? _GEN_407 : _GEN_375; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_440 = io_w_1_en & _writeVec_T_6 ? _GEN_408 : _GEN_376; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_441 = io_w_1_en & _writeVec_T_6 ? _GEN_409 : _GEN_377; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_442 = io_w_1_en & _writeVec_T_6 ? _GEN_410 : _GEN_378; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_443 = io_w_1_en & _writeVec_T_6 ? _GEN_411 : _GEN_379; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_444 = io_w_1_en & _writeVec_T_6 ? _GEN_412 : _GEN_380; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_445 = io_w_1_en & _writeVec_T_6 ? _GEN_413 : _GEN_381; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_446 = io_w_1_en & _writeVec_T_6 ? _GEN_414 : _GEN_382; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_447 = io_w_1_en & _writeVec_T_6 ? _GEN_415 : _GEN_383; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_448 = io_w_1_en & _writeVec_T_6 ? _GEN_416 : _GEN_384; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_449 = io_w_1_en & _writeVec_T_6 ? _GEN_417 : _GEN_385; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_450 = io_w_1_en & _writeVec_T_6 ? _GEN_418 : _GEN_386; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_451 = io_w_1_en & _writeVec_T_6 ? _GEN_419 : _GEN_387; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_452 = io_w_1_en & _writeVec_T_6 ? _GEN_420 : _GEN_388; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_453 = io_w_1_en & _writeVec_T_6 ? _GEN_421 : _GEN_389; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_454 = io_w_1_en & _writeVec_T_6 ? _GEN_422 : _GEN_390; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_455 = io_w_1_en & _writeVec_T_6 ? _GEN_423 : _GEN_391; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_456 = io_w_1_en & _writeVec_T_6 ? _GEN_424 : _GEN_392; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_457 = io_w_1_en & _writeVec_T_6 ? _GEN_425 : _GEN_393; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_458 = io_w_1_en & _writeVec_T_6 ? _GEN_426 : _GEN_394; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_459 = io_w_1_en & _writeVec_T_6 ? _GEN_427 : _GEN_395; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_460 = io_w_1_en & _writeVec_T_6 ? _GEN_428 : _GEN_396; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_461 = io_w_1_en & _writeVec_T_6 ? _GEN_429 : _GEN_397; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_462 = io_w_1_en & _writeVec_T_6 ? _GEN_430 : _GEN_398; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_463 = io_w_1_en & _writeVec_T_6 ? _GEN_431 : _GEN_399; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_464 = 5'h0 == io_w_2_addr ? io_w_2_data : _GEN_432; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_465 = 5'h1 == io_w_2_addr ? io_w_2_data : _GEN_433; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_466 = 5'h2 == io_w_2_addr ? io_w_2_data : _GEN_434; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_467 = 5'h3 == io_w_2_addr ? io_w_2_data : _GEN_435; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_468 = 5'h4 == io_w_2_addr ? io_w_2_data : _GEN_436; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_469 = 5'h5 == io_w_2_addr ? io_w_2_data : _GEN_437; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_470 = 5'h6 == io_w_2_addr ? io_w_2_data : _GEN_438; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_471 = 5'h7 == io_w_2_addr ? io_w_2_data : _GEN_439; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_472 = 5'h8 == io_w_2_addr ? io_w_2_data : _GEN_440; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_473 = 5'h9 == io_w_2_addr ? io_w_2_data : _GEN_441; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_474 = 5'ha == io_w_2_addr ? io_w_2_data : _GEN_442; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_475 = 5'hb == io_w_2_addr ? io_w_2_data : _GEN_443; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_476 = 5'hc == io_w_2_addr ? io_w_2_data : _GEN_444; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_477 = 5'hd == io_w_2_addr ? io_w_2_data : _GEN_445; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_478 = 5'he == io_w_2_addr ? io_w_2_data : _GEN_446; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_479 = 5'hf == io_w_2_addr ? io_w_2_data : _GEN_447; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_480 = 5'h10 == io_w_2_addr ? io_w_2_data : _GEN_448; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_481 = 5'h11 == io_w_2_addr ? io_w_2_data : _GEN_449; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_482 = 5'h12 == io_w_2_addr ? io_w_2_data : _GEN_450; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_483 = 5'h13 == io_w_2_addr ? io_w_2_data : _GEN_451; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_484 = 5'h14 == io_w_2_addr ? io_w_2_data : _GEN_452; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_485 = 5'h15 == io_w_2_addr ? io_w_2_data : _GEN_453; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_486 = 5'h16 == io_w_2_addr ? io_w_2_data : _GEN_454; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_487 = 5'h17 == io_w_2_addr ? io_w_2_data : _GEN_455; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_488 = 5'h18 == io_w_2_addr ? io_w_2_data : _GEN_456; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_489 = 5'h19 == io_w_2_addr ? io_w_2_data : _GEN_457; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_490 = 5'h1a == io_w_2_addr ? io_w_2_data : _GEN_458; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_491 = 5'h1b == io_w_2_addr ? io_w_2_data : _GEN_459; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_492 = 5'h1c == io_w_2_addr ? io_w_2_data : _GEN_460; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_493 = 5'h1d == io_w_2_addr ? io_w_2_data : _GEN_461; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_494 = 5'h1e == io_w_2_addr ? io_w_2_data : _GEN_462; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_495 = 5'h1f == io_w_2_addr ? io_w_2_data : _GEN_463; // @[RegFile.scala 174:{20,20}]
  wire [31:0] _GEN_496 = io_w_2_en & _writeVec_T_10 ? _GEN_464 : _GEN_432; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_497 = io_w_2_en & _writeVec_T_10 ? _GEN_465 : _GEN_433; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_498 = io_w_2_en & _writeVec_T_10 ? _GEN_466 : _GEN_434; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_499 = io_w_2_en & _writeVec_T_10 ? _GEN_467 : _GEN_435; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_500 = io_w_2_en & _writeVec_T_10 ? _GEN_468 : _GEN_436; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_501 = io_w_2_en & _writeVec_T_10 ? _GEN_469 : _GEN_437; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_502 = io_w_2_en & _writeVec_T_10 ? _GEN_470 : _GEN_438; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_503 = io_w_2_en & _writeVec_T_10 ? _GEN_471 : _GEN_439; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_504 = io_w_2_en & _writeVec_T_10 ? _GEN_472 : _GEN_440; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_505 = io_w_2_en & _writeVec_T_10 ? _GEN_473 : _GEN_441; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_506 = io_w_2_en & _writeVec_T_10 ? _GEN_474 : _GEN_442; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_507 = io_w_2_en & _writeVec_T_10 ? _GEN_475 : _GEN_443; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_508 = io_w_2_en & _writeVec_T_10 ? _GEN_476 : _GEN_444; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_509 = io_w_2_en & _writeVec_T_10 ? _GEN_477 : _GEN_445; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_510 = io_w_2_en & _writeVec_T_10 ? _GEN_478 : _GEN_446; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_511 = io_w_2_en & _writeVec_T_10 ? _GEN_479 : _GEN_447; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_512 = io_w_2_en & _writeVec_T_10 ? _GEN_480 : _GEN_448; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_513 = io_w_2_en & _writeVec_T_10 ? _GEN_481 : _GEN_449; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_514 = io_w_2_en & _writeVec_T_10 ? _GEN_482 : _GEN_450; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_515 = io_w_2_en & _writeVec_T_10 ? _GEN_483 : _GEN_451; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_516 = io_w_2_en & _writeVec_T_10 ? _GEN_484 : _GEN_452; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_517 = io_w_2_en & _writeVec_T_10 ? _GEN_485 : _GEN_453; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_518 = io_w_2_en & _writeVec_T_10 ? _GEN_486 : _GEN_454; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_519 = io_w_2_en & _writeVec_T_10 ? _GEN_487 : _GEN_455; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_520 = io_w_2_en & _writeVec_T_10 ? _GEN_488 : _GEN_456; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_521 = io_w_2_en & _writeVec_T_10 ? _GEN_489 : _GEN_457; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_522 = io_w_2_en & _writeVec_T_10 ? _GEN_490 : _GEN_458; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_523 = io_w_2_en & _writeVec_T_10 ? _GEN_491 : _GEN_459; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_524 = io_w_2_en & _writeVec_T_10 ? _GEN_492 : _GEN_460; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_525 = io_w_2_en & _writeVec_T_10 ? _GEN_493 : _GEN_461; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_526 = io_w_2_en & _writeVec_T_10 ? _GEN_494 : _GEN_462; // @[RegFile.scala 173:33]
  wire [31:0] _GEN_527 = io_w_2_en & _writeVec_T_10 ? _GEN_495 : _GEN_463; // @[RegFile.scala 173:33]
  wire [31:0] regState_regState_0 = regs_0; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_1 = regs_1; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_2 = regs_2; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_3 = regs_3; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_4 = regs_4; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_5 = regs_5; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_6 = regs_6; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_7 = regs_7; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_8 = regs_8; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_9 = regs_9; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_10 = regs_10; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_11 = regs_11; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_12 = regs_12; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_13 = regs_13; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_14 = regs_14; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_15 = regs_15; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_16 = regs_16; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_17 = regs_17; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_18 = regs_18; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_19 = regs_19; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_20 = regs_20; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_21 = regs_21; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_22 = regs_22; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_23 = regs_23; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_24 = regs_24; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_25 = regs_25; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_26 = regs_26; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_27 = regs_27; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_28 = regs_28; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_29 = regs_29; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_30 = regs_30; // @[RegFile.scala 182:22 184:7]
  wire [31:0] regState_regState_31 = regs_31; // @[RegFile.scala 182:22 184:7]
  assign io_r_0_data = hasWrite ? _GEN_35 : _GEN_67; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_1_data = hasWrite_1 ? _GEN_73 : _GEN_105; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_2_data = hasWrite_2 ? _GEN_111 : _GEN_143; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_3_data = hasWrite_3 ? _GEN_149 : _GEN_181; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_4_data = hasWrite_4 ? _GEN_187 : _GEN_219; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_5_data = hasWrite_5 ? _GEN_225 : _GEN_257; // @[RegFile.scala 155:22 156:16 158:16]
  assign io_r_6_data = hasWrite_6 ? _GEN_263 : _GEN_295; // @[RegFile.scala 155:22 156:16 158:16]
  assign regState_0_regState_0 = _GEN_36;
  assign regState_0_regState_1 = regState_regState_1;
  assign regState_0_regState_2 = regState_regState_2;
  assign regState_0_regState_3 = regState_regState_3;
  assign regState_0_regState_4 = regState_regState_4;
  assign regState_0_regState_5 = regState_regState_5;
  assign regState_0_regState_6 = regState_regState_6;
  assign regState_0_regState_7 = regState_regState_7;
  assign regState_0_regState_8 = regState_regState_8;
  assign regState_0_regState_9 = regState_regState_9;
  assign regState_0_regState_10 = regState_regState_10;
  assign regState_0_regState_11 = regState_regState_11;
  assign regState_0_regState_12 = regState_regState_12;
  assign regState_0_regState_13 = regState_regState_13;
  assign regState_0_regState_14 = regState_regState_14;
  assign regState_0_regState_15 = regState_regState_15;
  assign regState_0_regState_16 = regState_regState_16;
  assign regState_0_regState_17 = regState_regState_17;
  assign regState_0_regState_18 = regState_regState_18;
  assign regState_0_regState_19 = regState_regState_19;
  assign regState_0_regState_20 = regState_regState_20;
  assign regState_0_regState_21 = regState_regState_21;
  assign regState_0_regState_22 = regState_regState_22;
  assign regState_0_regState_23 = regState_regState_23;
  assign regState_0_regState_24 = regState_regState_24;
  assign regState_0_regState_25 = regState_regState_25;
  assign regState_0_regState_26 = regState_regState_26;
  assign regState_0_regState_27 = regState_regState_27;
  assign regState_0_regState_28 = regState_regState_28;
  assign regState_0_regState_29 = regState_regState_29;
  assign regState_0_regState_30 = regState_regState_30;
  assign regState_0_regState_31 = regState_regState_31;
  always @(posedge clock) begin
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h0 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_0 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_0 <= _GEN_496;
      end
    end else begin
      regs_0 <= _GEN_496;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_1 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_1 <= _GEN_497;
      end
    end else begin
      regs_1 <= _GEN_497;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h2 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_2 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_2 <= _GEN_498;
      end
    end else begin
      regs_2 <= _GEN_498;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h3 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_3 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_3 <= _GEN_499;
      end
    end else begin
      regs_3 <= _GEN_499;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h4 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_4 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_4 <= _GEN_500;
      end
    end else begin
      regs_4 <= _GEN_500;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h5 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_5 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_5 <= _GEN_501;
      end
    end else begin
      regs_5 <= _GEN_501;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h6 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_6 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_6 <= _GEN_502;
      end
    end else begin
      regs_6 <= _GEN_502;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h7 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_7 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_7 <= _GEN_503;
      end
    end else begin
      regs_7 <= _GEN_503;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h8 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_8 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_8 <= _GEN_504;
      end
    end else begin
      regs_8 <= _GEN_504;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h9 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_9 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_9 <= _GEN_505;
      end
    end else begin
      regs_9 <= _GEN_505;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'ha == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_10 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_10 <= _GEN_506;
      end
    end else begin
      regs_10 <= _GEN_506;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'hb == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_11 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_11 <= _GEN_507;
      end
    end else begin
      regs_11 <= _GEN_507;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'hc == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_12 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_12 <= _GEN_508;
      end
    end else begin
      regs_12 <= _GEN_508;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'hd == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_13 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_13 <= _GEN_509;
      end
    end else begin
      regs_13 <= _GEN_509;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'he == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_14 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_14 <= _GEN_510;
      end
    end else begin
      regs_14 <= _GEN_510;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'hf == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_15 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_15 <= _GEN_511;
      end
    end else begin
      regs_15 <= _GEN_511;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h10 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_16 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_16 <= _GEN_512;
      end
    end else begin
      regs_16 <= _GEN_512;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h11 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_17 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_17 <= _GEN_513;
      end
    end else begin
      regs_17 <= _GEN_513;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h12 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_18 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_18 <= _GEN_514;
      end
    end else begin
      regs_18 <= _GEN_514;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h13 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_19 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_19 <= _GEN_515;
      end
    end else begin
      regs_19 <= _GEN_515;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h14 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_20 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_20 <= _GEN_516;
      end
    end else begin
      regs_20 <= _GEN_516;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h15 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_21 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_21 <= _GEN_517;
      end
    end else begin
      regs_21 <= _GEN_517;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h16 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_22 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_22 <= _GEN_518;
      end
    end else begin
      regs_22 <= _GEN_518;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h17 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_23 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_23 <= _GEN_519;
      end
    end else begin
      regs_23 <= _GEN_519;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h18 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_24 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_24 <= _GEN_520;
      end
    end else begin
      regs_24 <= _GEN_520;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h19 == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_25 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_25 <= _GEN_521;
      end
    end else begin
      regs_25 <= _GEN_521;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1a == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_26 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_26 <= _GEN_522;
      end
    end else begin
      regs_26 <= _GEN_522;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1b == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_27 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_27 <= _GEN_523;
      end
    end else begin
      regs_27 <= _GEN_523;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1c == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_28 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_28 <= _GEN_524;
      end
    end else begin
      regs_28 <= _GEN_524;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1d == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_29 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_29 <= _GEN_525;
      end
    end else begin
      regs_29 <= _GEN_525;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1e == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_30 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_30 <= _GEN_526;
      end
    end else begin
      regs_30 <= _GEN_526;
    end
    if (io_w_3_en & _writeVec_T_14) begin // @[RegFile.scala 173:33]
      if (5'h1f == io_w_3_addr) begin // @[RegFile.scala 174:20]
        regs_31 <= io_w_3_data; // @[RegFile.scala 174:20]
      end else begin
        regs_31 <= _GEN_527;
      end
    end else begin
      regs_31 <= _GEN_527;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(regs_0 == 32'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: zero reg must be 0 !\n    at RegFile.scala:134 assert(regs(0).asUInt === 0.U, \"zero reg must be 0 !\")\n"
            ); // @[RegFile.scala 134:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(regs_0 == 32'h0) & ~reset) begin
          $fatal; // @[RegFile.scala 134:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
