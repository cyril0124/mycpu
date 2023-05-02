module PHT(
  input        clock,
  input        reset,
  input        io_update_valid,
  input  [4:0] io_update_bits_idx,
  input        io_update_bits_brTaken,
  input  [4:0] io_index,
  output       io_brTaken
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
  reg [1:0] counters_0; // @[PHT.scala 20:27]
  reg [1:0] counters_1; // @[PHT.scala 20:27]
  reg [1:0] counters_2; // @[PHT.scala 20:27]
  reg [1:0] counters_3; // @[PHT.scala 20:27]
  reg [1:0] counters_4; // @[PHT.scala 20:27]
  reg [1:0] counters_5; // @[PHT.scala 20:27]
  reg [1:0] counters_6; // @[PHT.scala 20:27]
  reg [1:0] counters_7; // @[PHT.scala 20:27]
  reg [1:0] counters_8; // @[PHT.scala 20:27]
  reg [1:0] counters_9; // @[PHT.scala 20:27]
  reg [1:0] counters_10; // @[PHT.scala 20:27]
  reg [1:0] counters_11; // @[PHT.scala 20:27]
  reg [1:0] counters_12; // @[PHT.scala 20:27]
  reg [1:0] counters_13; // @[PHT.scala 20:27]
  reg [1:0] counters_14; // @[PHT.scala 20:27]
  reg [1:0] counters_15; // @[PHT.scala 20:27]
  reg [1:0] counters_16; // @[PHT.scala 20:27]
  reg [1:0] counters_17; // @[PHT.scala 20:27]
  reg [1:0] counters_18; // @[PHT.scala 20:27]
  reg [1:0] counters_19; // @[PHT.scala 20:27]
  reg [1:0] counters_20; // @[PHT.scala 20:27]
  reg [1:0] counters_21; // @[PHT.scala 20:27]
  reg [1:0] counters_22; // @[PHT.scala 20:27]
  reg [1:0] counters_23; // @[PHT.scala 20:27]
  reg [1:0] counters_24; // @[PHT.scala 20:27]
  reg [1:0] counters_25; // @[PHT.scala 20:27]
  reg [1:0] counters_26; // @[PHT.scala 20:27]
  reg [1:0] counters_27; // @[PHT.scala 20:27]
  reg [1:0] counters_28; // @[PHT.scala 20:27]
  reg [1:0] counters_29; // @[PHT.scala 20:27]
  reg [1:0] counters_30; // @[PHT.scala 20:27]
  reg [1:0] counters_31; // @[PHT.scala 20:27]
  wire [1:0] _GEN_1 = 5'h1 == io_update_bits_idx ? counters_1 : counters_0; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_2 = 5'h2 == io_update_bits_idx ? counters_2 : _GEN_1; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_3 = 5'h3 == io_update_bits_idx ? counters_3 : _GEN_2; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_4 = 5'h4 == io_update_bits_idx ? counters_4 : _GEN_3; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_5 = 5'h5 == io_update_bits_idx ? counters_5 : _GEN_4; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_6 = 5'h6 == io_update_bits_idx ? counters_6 : _GEN_5; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_7 = 5'h7 == io_update_bits_idx ? counters_7 : _GEN_6; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_8 = 5'h8 == io_update_bits_idx ? counters_8 : _GEN_7; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_9 = 5'h9 == io_update_bits_idx ? counters_9 : _GEN_8; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_10 = 5'ha == io_update_bits_idx ? counters_10 : _GEN_9; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_11 = 5'hb == io_update_bits_idx ? counters_11 : _GEN_10; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_12 = 5'hc == io_update_bits_idx ? counters_12 : _GEN_11; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_13 = 5'hd == io_update_bits_idx ? counters_13 : _GEN_12; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_14 = 5'he == io_update_bits_idx ? counters_14 : _GEN_13; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_15 = 5'hf == io_update_bits_idx ? counters_15 : _GEN_14; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_16 = 5'h10 == io_update_bits_idx ? counters_16 : _GEN_15; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_17 = 5'h11 == io_update_bits_idx ? counters_17 : _GEN_16; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_18 = 5'h12 == io_update_bits_idx ? counters_18 : _GEN_17; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_19 = 5'h13 == io_update_bits_idx ? counters_19 : _GEN_18; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_20 = 5'h14 == io_update_bits_idx ? counters_20 : _GEN_19; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_21 = 5'h15 == io_update_bits_idx ? counters_21 : _GEN_20; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_22 = 5'h16 == io_update_bits_idx ? counters_22 : _GEN_21; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_23 = 5'h17 == io_update_bits_idx ? counters_23 : _GEN_22; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_24 = 5'h18 == io_update_bits_idx ? counters_24 : _GEN_23; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_25 = 5'h19 == io_update_bits_idx ? counters_25 : _GEN_24; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_26 = 5'h1a == io_update_bits_idx ? counters_26 : _GEN_25; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_27 = 5'h1b == io_update_bits_idx ? counters_27 : _GEN_26; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_28 = 5'h1c == io_update_bits_idx ? counters_28 : _GEN_27; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_29 = 5'h1d == io_update_bits_idx ? counters_29 : _GEN_28; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_30 = 5'h1e == io_update_bits_idx ? counters_30 : _GEN_29; // @[PHT.scala 28:{32,32}]
  wire [1:0] _GEN_31 = 5'h1f == io_update_bits_idx ? counters_31 : _GEN_30; // @[PHT.scala 28:{32,32}]
  wire [1:0] _counters_T_1 = _GEN_31 + 2'h1; // @[PHT.scala 29:48]
  wire [1:0] _GEN_32 = 5'h0 == io_update_bits_idx ? _counters_T_1 : counters_0; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_33 = 5'h1 == io_update_bits_idx ? _counters_T_1 : counters_1; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_34 = 5'h2 == io_update_bits_idx ? _counters_T_1 : counters_2; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_35 = 5'h3 == io_update_bits_idx ? _counters_T_1 : counters_3; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_36 = 5'h4 == io_update_bits_idx ? _counters_T_1 : counters_4; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_37 = 5'h5 == io_update_bits_idx ? _counters_T_1 : counters_5; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_38 = 5'h6 == io_update_bits_idx ? _counters_T_1 : counters_6; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_39 = 5'h7 == io_update_bits_idx ? _counters_T_1 : counters_7; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_40 = 5'h8 == io_update_bits_idx ? _counters_T_1 : counters_8; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_41 = 5'h9 == io_update_bits_idx ? _counters_T_1 : counters_9; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_42 = 5'ha == io_update_bits_idx ? _counters_T_1 : counters_10; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_43 = 5'hb == io_update_bits_idx ? _counters_T_1 : counters_11; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_44 = 5'hc == io_update_bits_idx ? _counters_T_1 : counters_12; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_45 = 5'hd == io_update_bits_idx ? _counters_T_1 : counters_13; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_46 = 5'he == io_update_bits_idx ? _counters_T_1 : counters_14; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_47 = 5'hf == io_update_bits_idx ? _counters_T_1 : counters_15; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_48 = 5'h10 == io_update_bits_idx ? _counters_T_1 : counters_16; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_49 = 5'h11 == io_update_bits_idx ? _counters_T_1 : counters_17; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_50 = 5'h12 == io_update_bits_idx ? _counters_T_1 : counters_18; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_51 = 5'h13 == io_update_bits_idx ? _counters_T_1 : counters_19; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_52 = 5'h14 == io_update_bits_idx ? _counters_T_1 : counters_20; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_53 = 5'h15 == io_update_bits_idx ? _counters_T_1 : counters_21; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_54 = 5'h16 == io_update_bits_idx ? _counters_T_1 : counters_22; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_55 = 5'h17 == io_update_bits_idx ? _counters_T_1 : counters_23; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_56 = 5'h18 == io_update_bits_idx ? _counters_T_1 : counters_24; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_57 = 5'h19 == io_update_bits_idx ? _counters_T_1 : counters_25; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_58 = 5'h1a == io_update_bits_idx ? _counters_T_1 : counters_26; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_59 = 5'h1b == io_update_bits_idx ? _counters_T_1 : counters_27; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_60 = 5'h1c == io_update_bits_idx ? _counters_T_1 : counters_28; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_61 = 5'h1d == io_update_bits_idx ? _counters_T_1 : counters_29; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_62 = 5'h1e == io_update_bits_idx ? _counters_T_1 : counters_30; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _GEN_63 = 5'h1f == io_update_bits_idx ? _counters_T_1 : counters_31; // @[PHT.scala 20:27 29:{31,31}]
  wire [1:0] _counters_T_3 = _GEN_31 - 2'h1; // @[PHT.scala 33:48]
  wire [1:0] _GEN_96 = 5'h0 == io_update_bits_idx ? _counters_T_3 : counters_0; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_97 = 5'h1 == io_update_bits_idx ? _counters_T_3 : counters_1; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_98 = 5'h2 == io_update_bits_idx ? _counters_T_3 : counters_2; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_99 = 5'h3 == io_update_bits_idx ? _counters_T_3 : counters_3; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_100 = 5'h4 == io_update_bits_idx ? _counters_T_3 : counters_4; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_101 = 5'h5 == io_update_bits_idx ? _counters_T_3 : counters_5; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_102 = 5'h6 == io_update_bits_idx ? _counters_T_3 : counters_6; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_103 = 5'h7 == io_update_bits_idx ? _counters_T_3 : counters_7; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_104 = 5'h8 == io_update_bits_idx ? _counters_T_3 : counters_8; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_105 = 5'h9 == io_update_bits_idx ? _counters_T_3 : counters_9; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_106 = 5'ha == io_update_bits_idx ? _counters_T_3 : counters_10; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_107 = 5'hb == io_update_bits_idx ? _counters_T_3 : counters_11; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_108 = 5'hc == io_update_bits_idx ? _counters_T_3 : counters_12; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_109 = 5'hd == io_update_bits_idx ? _counters_T_3 : counters_13; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_110 = 5'he == io_update_bits_idx ? _counters_T_3 : counters_14; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_111 = 5'hf == io_update_bits_idx ? _counters_T_3 : counters_15; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_112 = 5'h10 == io_update_bits_idx ? _counters_T_3 : counters_16; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_113 = 5'h11 == io_update_bits_idx ? _counters_T_3 : counters_17; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_114 = 5'h12 == io_update_bits_idx ? _counters_T_3 : counters_18; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_115 = 5'h13 == io_update_bits_idx ? _counters_T_3 : counters_19; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_116 = 5'h14 == io_update_bits_idx ? _counters_T_3 : counters_20; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_117 = 5'h15 == io_update_bits_idx ? _counters_T_3 : counters_21; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_118 = 5'h16 == io_update_bits_idx ? _counters_T_3 : counters_22; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_119 = 5'h17 == io_update_bits_idx ? _counters_T_3 : counters_23; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_120 = 5'h18 == io_update_bits_idx ? _counters_T_3 : counters_24; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_121 = 5'h19 == io_update_bits_idx ? _counters_T_3 : counters_25; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_122 = 5'h1a == io_update_bits_idx ? _counters_T_3 : counters_26; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_123 = 5'h1b == io_update_bits_idx ? _counters_T_3 : counters_27; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_124 = 5'h1c == io_update_bits_idx ? _counters_T_3 : counters_28; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_125 = 5'h1d == io_update_bits_idx ? _counters_T_3 : counters_29; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_126 = 5'h1e == io_update_bits_idx ? _counters_T_3 : counters_30; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_127 = 5'h1f == io_update_bits_idx ? _counters_T_3 : counters_31; // @[PHT.scala 20:27 33:{31,31}]
  wire [1:0] _GEN_225 = 5'h1 == io_index ? counters_1 : counters_0; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_226 = 5'h2 == io_index ? counters_2 : _GEN_225; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_227 = 5'h3 == io_index ? counters_3 : _GEN_226; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_228 = 5'h4 == io_index ? counters_4 : _GEN_227; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_229 = 5'h5 == io_index ? counters_5 : _GEN_228; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_230 = 5'h6 == io_index ? counters_6 : _GEN_229; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_231 = 5'h7 == io_index ? counters_7 : _GEN_230; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_232 = 5'h8 == io_index ? counters_8 : _GEN_231; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_233 = 5'h9 == io_index ? counters_9 : _GEN_232; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_234 = 5'ha == io_index ? counters_10 : _GEN_233; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_235 = 5'hb == io_index ? counters_11 : _GEN_234; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_236 = 5'hc == io_index ? counters_12 : _GEN_235; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_237 = 5'hd == io_index ? counters_13 : _GEN_236; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_238 = 5'he == io_index ? counters_14 : _GEN_237; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_239 = 5'hf == io_index ? counters_15 : _GEN_238; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_240 = 5'h10 == io_index ? counters_16 : _GEN_239; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_241 = 5'h11 == io_index ? counters_17 : _GEN_240; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_242 = 5'h12 == io_index ? counters_18 : _GEN_241; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_243 = 5'h13 == io_index ? counters_19 : _GEN_242; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_244 = 5'h14 == io_index ? counters_20 : _GEN_243; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_245 = 5'h15 == io_index ? counters_21 : _GEN_244; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_246 = 5'h16 == io_index ? counters_22 : _GEN_245; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_247 = 5'h17 == io_index ? counters_23 : _GEN_246; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_248 = 5'h18 == io_index ? counters_24 : _GEN_247; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_249 = 5'h19 == io_index ? counters_25 : _GEN_248; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_250 = 5'h1a == io_index ? counters_26 : _GEN_249; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_251 = 5'h1b == io_index ? counters_27 : _GEN_250; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_252 = 5'h1c == io_index ? counters_28 : _GEN_251; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_253 = 5'h1d == io_index ? counters_29 : _GEN_252; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_254 = 5'h1e == io_index ? counters_30 : _GEN_253; // @[PHT.scala 38:{37,37}]
  wire [1:0] _GEN_255 = 5'h1f == io_index ? counters_31 : _GEN_254; // @[PHT.scala 38:{37,37}]
  assign io_brTaken = _GEN_255[1]; // @[PHT.scala 38:37]
  always @(posedge clock) begin
    if (reset) begin // @[PHT.scala 20:27]
      counters_0 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_0 <= _GEN_32;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_0 <= _GEN_96;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_1 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_1 <= _GEN_33;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_1 <= _GEN_97;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_2 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_2 <= _GEN_34;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_2 <= _GEN_98;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_3 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_3 <= _GEN_35;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_3 <= _GEN_99;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_4 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_4 <= _GEN_36;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_4 <= _GEN_100;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_5 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_5 <= _GEN_37;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_5 <= _GEN_101;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_6 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_6 <= _GEN_38;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_6 <= _GEN_102;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_7 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_7 <= _GEN_39;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_7 <= _GEN_103;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_8 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_8 <= _GEN_40;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_8 <= _GEN_104;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_9 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_9 <= _GEN_41;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_9 <= _GEN_105;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_10 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_10 <= _GEN_42;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_10 <= _GEN_106;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_11 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_11 <= _GEN_43;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_11 <= _GEN_107;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_12 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_12 <= _GEN_44;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_12 <= _GEN_108;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_13 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_13 <= _GEN_45;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_13 <= _GEN_109;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_14 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_14 <= _GEN_46;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_14 <= _GEN_110;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_15 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_15 <= _GEN_47;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_15 <= _GEN_111;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_16 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_16 <= _GEN_48;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_16 <= _GEN_112;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_17 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_17 <= _GEN_49;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_17 <= _GEN_113;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_18 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_18 <= _GEN_50;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_18 <= _GEN_114;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_19 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_19 <= _GEN_51;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_19 <= _GEN_115;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_20 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_20 <= _GEN_52;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_20 <= _GEN_116;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_21 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_21 <= _GEN_53;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_21 <= _GEN_117;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_22 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_22 <= _GEN_54;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_22 <= _GEN_118;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_23 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_23 <= _GEN_55;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_23 <= _GEN_119;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_24 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_24 <= _GEN_56;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_24 <= _GEN_120;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_25 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_25 <= _GEN_57;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_25 <= _GEN_121;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_26 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_26 <= _GEN_58;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_26 <= _GEN_122;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_27 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_27 <= _GEN_59;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_27 <= _GEN_123;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_28 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_28 <= _GEN_60;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_28 <= _GEN_124;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_29 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_29 <= _GEN_61;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_29 <= _GEN_125;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_30 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_30 <= _GEN_62;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_30 <= _GEN_126;
      end
    end
    if (reset) begin // @[PHT.scala 20:27]
      counters_31 <= 2'h2; // @[PHT.scala 20:27]
    end else if (io_update_valid) begin // @[PHT.scala 25:26]
      if (io_update_bits_brTaken) begin // @[PHT.scala 27:38]
        if (_GEN_31 != 2'h3) begin // @[PHT.scala 28:49]
          counters_31 <= _GEN_63;
        end
      end else if (_GEN_31 != 2'h0) begin // @[PHT.scala 32:52]
        counters_31 <= _GEN_127;
      end
    end
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
  counters_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  counters_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  counters_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  counters_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  counters_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  counters_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  counters_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  counters_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  counters_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  counters_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  counters_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  counters_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  counters_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  counters_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  counters_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  counters_15 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  counters_16 = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  counters_17 = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  counters_18 = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  counters_19 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  counters_20 = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  counters_21 = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  counters_22 = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  counters_23 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  counters_24 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  counters_25 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  counters_26 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  counters_27 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  counters_28 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  counters_29 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  counters_30 = _RAND_30[1:0];
  _RAND_31 = {1{`RANDOM}};
  counters_31 = _RAND_31[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
