module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_r_0_addr,
  output [31:0] io_r_0_data,
  input  [4:0]  io_r_1_addr,
  output [31:0] io_r_1_data,
  input  [4:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [31:0] io_w_0_data,
  output [31:0] io_state_regState_0,
  output [31:0] io_state_regState_1,
  output [31:0] io_state_regState_2,
  output [31:0] io_state_regState_3,
  output [31:0] io_state_regState_4,
  output [31:0] io_state_regState_5,
  output [31:0] io_state_regState_6,
  output [31:0] io_state_regState_7,
  output [31:0] io_state_regState_8,
  output [31:0] io_state_regState_9,
  output [31:0] io_state_regState_10,
  output [31:0] io_state_regState_11,
  output [31:0] io_state_regState_12,
  output [31:0] io_state_regState_13,
  output [31:0] io_state_regState_14,
  output [31:0] io_state_regState_15,
  output [31:0] io_state_regState_16,
  output [31:0] io_state_regState_17,
  output [31:0] io_state_regState_18,
  output [31:0] io_state_regState_19,
  output [31:0] io_state_regState_20,
  output [31:0] io_state_regState_21,
  output [31:0] io_state_regState_22,
  output [31:0] io_state_regState_23,
  output [31:0] io_state_regState_24,
  output [31:0] io_state_regState_25,
  output [31:0] io_state_regState_26,
  output [31:0] io_state_regState_27,
  output [31:0] io_state_regState_28,
  output [31:0] io_state_regState_29,
  output [31:0] io_state_regState_30,
  output [31:0] io_state_regState_31
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
  reg [31:0] regs_0; // @[RegFile.scala 40:17]
  reg [31:0] regs_1; // @[RegFile.scala 40:17]
  reg [31:0] regs_2; // @[RegFile.scala 40:17]
  reg [31:0] regs_3; // @[RegFile.scala 40:17]
  reg [31:0] regs_4; // @[RegFile.scala 40:17]
  reg [31:0] regs_5; // @[RegFile.scala 40:17]
  reg [31:0] regs_6; // @[RegFile.scala 40:17]
  reg [31:0] regs_7; // @[RegFile.scala 40:17]
  reg [31:0] regs_8; // @[RegFile.scala 40:17]
  reg [31:0] regs_9; // @[RegFile.scala 40:17]
  reg [31:0] regs_10; // @[RegFile.scala 40:17]
  reg [31:0] regs_11; // @[RegFile.scala 40:17]
  reg [31:0] regs_12; // @[RegFile.scala 40:17]
  reg [31:0] regs_13; // @[RegFile.scala 40:17]
  reg [31:0] regs_14; // @[RegFile.scala 40:17]
  reg [31:0] regs_15; // @[RegFile.scala 40:17]
  reg [31:0] regs_16; // @[RegFile.scala 40:17]
  reg [31:0] regs_17; // @[RegFile.scala 40:17]
  reg [31:0] regs_18; // @[RegFile.scala 40:17]
  reg [31:0] regs_19; // @[RegFile.scala 40:17]
  reg [31:0] regs_20; // @[RegFile.scala 40:17]
  reg [31:0] regs_21; // @[RegFile.scala 40:17]
  reg [31:0] regs_22; // @[RegFile.scala 40:17]
  reg [31:0] regs_23; // @[RegFile.scala 40:17]
  reg [31:0] regs_24; // @[RegFile.scala 40:17]
  reg [31:0] regs_25; // @[RegFile.scala 40:17]
  reg [31:0] regs_26; // @[RegFile.scala 40:17]
  reg [31:0] regs_27; // @[RegFile.scala 40:17]
  reg [31:0] regs_28; // @[RegFile.scala 40:17]
  reg [31:0] regs_29; // @[RegFile.scala 40:17]
  reg [31:0] regs_30; // @[RegFile.scala 40:17]
  reg [31:0] regs_31; // @[RegFile.scala 40:17]
  wire [31:0] _GEN_1 = reset ? 32'h0 : regs_1; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_2 = reset ? 32'h0 : regs_2; // @[RegFile.scala 41:22 46:11 40:17]
  wire [31:0] _GEN_3 = reset ? 32'h0 : regs_3; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_4 = reset ? 32'h0 : regs_4; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_5 = reset ? 32'h0 : regs_5; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_6 = reset ? 32'h0 : regs_6; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_7 = reset ? 32'h0 : regs_7; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_8 = reset ? 32'h0 : regs_8; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_9 = reset ? 32'h0 : regs_9; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_10 = reset ? 32'h0 : regs_10; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_11 = reset ? 32'h0 : regs_11; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_12 = reset ? 32'h0 : regs_12; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_13 = reset ? 32'h0 : regs_13; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_14 = reset ? 32'h0 : regs_14; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_15 = reset ? 32'h0 : regs_15; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_16 = reset ? 32'h0 : regs_16; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_17 = reset ? 32'h0 : regs_17; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_18 = reset ? 32'h0 : regs_18; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_19 = reset ? 32'h0 : regs_19; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_20 = reset ? 32'h0 : regs_20; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_21 = reset ? 32'h0 : regs_21; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_22 = reset ? 32'h0 : regs_22; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_23 = reset ? 32'h0 : regs_23; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_24 = reset ? 32'h0 : regs_24; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_25 = reset ? 32'h0 : regs_25; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_26 = reset ? 32'h0 : regs_26; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_27 = reset ? 32'h0 : regs_27; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_28 = reset ? 32'h0 : regs_28; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_29 = reset ? 32'h0 : regs_29; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_30 = reset ? 32'h0 : regs_30; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_31 = reset ? 32'h0 : regs_31; // @[RegFile.scala 40:17 41:22 43:9]
  wire  _T_7 = io_w_0_addr != 5'h0; // @[RegFile.scala 56:72]
  wire [31:0] _GEN_33 = 5'h1 == io_r_0_addr ? regs_1 : regs_0; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_34 = 5'h2 == io_r_0_addr ? regs_2 : _GEN_33; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_35 = 5'h3 == io_r_0_addr ? regs_3 : _GEN_34; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_36 = 5'h4 == io_r_0_addr ? regs_4 : _GEN_35; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_37 = 5'h5 == io_r_0_addr ? regs_5 : _GEN_36; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_38 = 5'h6 == io_r_0_addr ? regs_6 : _GEN_37; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_39 = 5'h7 == io_r_0_addr ? regs_7 : _GEN_38; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_40 = 5'h8 == io_r_0_addr ? regs_8 : _GEN_39; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_41 = 5'h9 == io_r_0_addr ? regs_9 : _GEN_40; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_42 = 5'ha == io_r_0_addr ? regs_10 : _GEN_41; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_43 = 5'hb == io_r_0_addr ? regs_11 : _GEN_42; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_44 = 5'hc == io_r_0_addr ? regs_12 : _GEN_43; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_45 = 5'hd == io_r_0_addr ? regs_13 : _GEN_44; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_46 = 5'he == io_r_0_addr ? regs_14 : _GEN_45; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_47 = 5'hf == io_r_0_addr ? regs_15 : _GEN_46; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_48 = 5'h10 == io_r_0_addr ? regs_16 : _GEN_47; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_49 = 5'h11 == io_r_0_addr ? regs_17 : _GEN_48; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_50 = 5'h12 == io_r_0_addr ? regs_18 : _GEN_49; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_51 = 5'h13 == io_r_0_addr ? regs_19 : _GEN_50; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_52 = 5'h14 == io_r_0_addr ? regs_20 : _GEN_51; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_53 = 5'h15 == io_r_0_addr ? regs_21 : _GEN_52; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_54 = 5'h16 == io_r_0_addr ? regs_22 : _GEN_53; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_55 = 5'h17 == io_r_0_addr ? regs_23 : _GEN_54; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_56 = 5'h18 == io_r_0_addr ? regs_24 : _GEN_55; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_57 = 5'h19 == io_r_0_addr ? regs_25 : _GEN_56; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_58 = 5'h1a == io_r_0_addr ? regs_26 : _GEN_57; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_59 = 5'h1b == io_r_0_addr ? regs_27 : _GEN_58; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_60 = 5'h1c == io_r_0_addr ? regs_28 : _GEN_59; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_61 = 5'h1d == io_r_0_addr ? regs_29 : _GEN_60; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_62 = 5'h1e == io_r_0_addr ? regs_30 : _GEN_61; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_63 = 5'h1f == io_r_0_addr ? regs_31 : _GEN_62; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_67 = 5'h1 == io_r_1_addr ? regs_1 : regs_0; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_68 = 5'h2 == io_r_1_addr ? regs_2 : _GEN_67; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_69 = 5'h3 == io_r_1_addr ? regs_3 : _GEN_68; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_70 = 5'h4 == io_r_1_addr ? regs_4 : _GEN_69; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_71 = 5'h5 == io_r_1_addr ? regs_5 : _GEN_70; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_72 = 5'h6 == io_r_1_addr ? regs_6 : _GEN_71; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_73 = 5'h7 == io_r_1_addr ? regs_7 : _GEN_72; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_74 = 5'h8 == io_r_1_addr ? regs_8 : _GEN_73; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_75 = 5'h9 == io_r_1_addr ? regs_9 : _GEN_74; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_76 = 5'ha == io_r_1_addr ? regs_10 : _GEN_75; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_77 = 5'hb == io_r_1_addr ? regs_11 : _GEN_76; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_78 = 5'hc == io_r_1_addr ? regs_12 : _GEN_77; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_79 = 5'hd == io_r_1_addr ? regs_13 : _GEN_78; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_80 = 5'he == io_r_1_addr ? regs_14 : _GEN_79; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_81 = 5'hf == io_r_1_addr ? regs_15 : _GEN_80; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_82 = 5'h10 == io_r_1_addr ? regs_16 : _GEN_81; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_83 = 5'h11 == io_r_1_addr ? regs_17 : _GEN_82; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_84 = 5'h12 == io_r_1_addr ? regs_18 : _GEN_83; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_85 = 5'h13 == io_r_1_addr ? regs_19 : _GEN_84; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_86 = 5'h14 == io_r_1_addr ? regs_20 : _GEN_85; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_87 = 5'h15 == io_r_1_addr ? regs_21 : _GEN_86; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_88 = 5'h16 == io_r_1_addr ? regs_22 : _GEN_87; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_89 = 5'h17 == io_r_1_addr ? regs_23 : _GEN_88; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_90 = 5'h18 == io_r_1_addr ? regs_24 : _GEN_89; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_91 = 5'h19 == io_r_1_addr ? regs_25 : _GEN_90; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_92 = 5'h1a == io_r_1_addr ? regs_26 : _GEN_91; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_93 = 5'h1b == io_r_1_addr ? regs_27 : _GEN_92; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_94 = 5'h1c == io_r_1_addr ? regs_28 : _GEN_93; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_95 = 5'h1d == io_r_1_addr ? regs_29 : _GEN_94; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_96 = 5'h1e == io_r_1_addr ? regs_30 : _GEN_95; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_97 = 5'h1f == io_r_1_addr ? regs_31 : _GEN_96; // @[RegFile.scala 59:{22,22}]
  assign io_r_0_data = io_w_0_en & io_r_0_addr == io_w_0_addr & io_w_0_addr != 5'h0 ? io_w_0_data : _GEN_63; // @[RegFile.scala 56:81 57:22 59:22]
  assign io_r_1_data = io_w_0_en & io_r_1_addr == io_w_0_addr & io_w_0_addr != 5'h0 ? io_w_0_data : _GEN_97; // @[RegFile.scala 56:81 57:22 59:22]
  assign io_state_regState_0 = regs_0; // @[RegFile.scala 78:61]
  assign io_state_regState_1 = regs_1; // @[RegFile.scala 78:61]
  assign io_state_regState_2 = regs_2; // @[RegFile.scala 78:61]
  assign io_state_regState_3 = regs_3; // @[RegFile.scala 78:61]
  assign io_state_regState_4 = regs_4; // @[RegFile.scala 78:61]
  assign io_state_regState_5 = regs_5; // @[RegFile.scala 78:61]
  assign io_state_regState_6 = regs_6; // @[RegFile.scala 78:61]
  assign io_state_regState_7 = regs_7; // @[RegFile.scala 78:61]
  assign io_state_regState_8 = regs_8; // @[RegFile.scala 78:61]
  assign io_state_regState_9 = regs_9; // @[RegFile.scala 78:61]
  assign io_state_regState_10 = regs_10; // @[RegFile.scala 78:61]
  assign io_state_regState_11 = regs_11; // @[RegFile.scala 78:61]
  assign io_state_regState_12 = regs_12; // @[RegFile.scala 78:61]
  assign io_state_regState_13 = regs_13; // @[RegFile.scala 78:61]
  assign io_state_regState_14 = regs_14; // @[RegFile.scala 78:61]
  assign io_state_regState_15 = regs_15; // @[RegFile.scala 78:61]
  assign io_state_regState_16 = regs_16; // @[RegFile.scala 78:61]
  assign io_state_regState_17 = regs_17; // @[RegFile.scala 78:61]
  assign io_state_regState_18 = regs_18; // @[RegFile.scala 78:61]
  assign io_state_regState_19 = regs_19; // @[RegFile.scala 78:61]
  assign io_state_regState_20 = regs_20; // @[RegFile.scala 78:61]
  assign io_state_regState_21 = regs_21; // @[RegFile.scala 78:61]
  assign io_state_regState_22 = regs_22; // @[RegFile.scala 78:61]
  assign io_state_regState_23 = regs_23; // @[RegFile.scala 78:61]
  assign io_state_regState_24 = regs_24; // @[RegFile.scala 78:61]
  assign io_state_regState_25 = regs_25; // @[RegFile.scala 78:61]
  assign io_state_regState_26 = regs_26; // @[RegFile.scala 78:61]
  assign io_state_regState_27 = regs_27; // @[RegFile.scala 78:61]
  assign io_state_regState_28 = regs_28; // @[RegFile.scala 78:61]
  assign io_state_regState_29 = regs_29; // @[RegFile.scala 78:61]
  assign io_state_regState_30 = regs_30; // @[RegFile.scala 78:61]
  assign io_state_regState_31 = regs_31; // @[RegFile.scala 78:61]
  always @(posedge clock) begin
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h0 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_0 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_0 <= 32'h0; // @[RegFile.scala 49:11]
      end
    end else begin
      regs_0 <= 32'h0; // @[RegFile.scala 49:11]
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_1 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_1 <= _GEN_1;
      end
    end else begin
      regs_1 <= _GEN_1;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h2 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_2 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_2 <= _GEN_2;
      end
    end else begin
      regs_2 <= _GEN_2;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h3 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_3 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_3 <= _GEN_3;
      end
    end else begin
      regs_3 <= _GEN_3;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h4 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_4 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_4 <= _GEN_4;
      end
    end else begin
      regs_4 <= _GEN_4;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h5 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_5 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_5 <= _GEN_5;
      end
    end else begin
      regs_5 <= _GEN_5;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h6 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_6 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_6 <= _GEN_6;
      end
    end else begin
      regs_6 <= _GEN_6;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h7 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_7 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_7 <= _GEN_7;
      end
    end else begin
      regs_7 <= _GEN_7;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h8 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_8 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_8 <= _GEN_8;
      end
    end else begin
      regs_8 <= _GEN_8;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h9 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_9 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_9 <= _GEN_9;
      end
    end else begin
      regs_9 <= _GEN_9;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'ha == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_10 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_10 <= _GEN_10;
      end
    end else begin
      regs_10 <= _GEN_10;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hb == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_11 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_11 <= _GEN_11;
      end
    end else begin
      regs_11 <= _GEN_11;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hc == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_12 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_12 <= _GEN_12;
      end
    end else begin
      regs_12 <= _GEN_12;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hd == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_13 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_13 <= _GEN_13;
      end
    end else begin
      regs_13 <= _GEN_13;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'he == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_14 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_14 <= _GEN_14;
      end
    end else begin
      regs_14 <= _GEN_14;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hf == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_15 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_15 <= _GEN_15;
      end
    end else begin
      regs_15 <= _GEN_15;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h10 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_16 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_16 <= _GEN_16;
      end
    end else begin
      regs_16 <= _GEN_16;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h11 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_17 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_17 <= _GEN_17;
      end
    end else begin
      regs_17 <= _GEN_17;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h12 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_18 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_18 <= _GEN_18;
      end
    end else begin
      regs_18 <= _GEN_18;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h13 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_19 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_19 <= _GEN_19;
      end
    end else begin
      regs_19 <= _GEN_19;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h14 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_20 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_20 <= _GEN_20;
      end
    end else begin
      regs_20 <= _GEN_20;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h15 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_21 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_21 <= _GEN_21;
      end
    end else begin
      regs_21 <= _GEN_21;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h16 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_22 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_22 <= _GEN_22;
      end
    end else begin
      regs_22 <= _GEN_22;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h17 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_23 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_23 <= _GEN_23;
      end
    end else begin
      regs_23 <= _GEN_23;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h18 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_24 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_24 <= _GEN_24;
      end
    end else begin
      regs_24 <= _GEN_24;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h19 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_25 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_25 <= _GEN_25;
      end
    end else begin
      regs_25 <= _GEN_25;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1a == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_26 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_26 <= _GEN_26;
      end
    end else begin
      regs_26 <= _GEN_26;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1b == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_27 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_27 <= _GEN_27;
      end
    end else begin
      regs_27 <= _GEN_27;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1c == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_28 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_28 <= _GEN_28;
      end
    end else begin
      regs_28 <= _GEN_28;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1d == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_29 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_29 <= _GEN_29;
      end
    end else begin
      regs_29 <= _GEN_29;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1e == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_30 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_30 <= _GEN_30;
      end
    end else begin
      regs_30 <= _GEN_30;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1f == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_31 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_31 <= _GEN_31;
      end
    end else begin
      regs_31 <= _GEN_31;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(regs_0 == 32'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: zero reg must be 0 !\n    at RegFile.scala:50 assert(regs(0).asUInt === 0.U, \"zero reg must be 0 !\")\n"
            ); // @[RegFile.scala 50:9]
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
          $fatal; // @[RegFile.scala 50:9]
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
