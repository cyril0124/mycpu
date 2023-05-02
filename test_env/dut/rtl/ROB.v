module ROB(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [4:0]  io_enq_bits_rd,
  input  [3:0]  io_enq_bits_fuValid,
  input  [7:0]  io_enq_bits_fuOp,
  input  [31:0] io_enq_bits_pc,
  input  [31:0] io_enq_bits_inst,
  input         io_enq_bits_predictBrTaken,
  input  [7:0]  io_enq_bits_predictID,
  input  [3:0]  io_enq_bits_predictIdx,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_rdWrEn,
  output [4:0]  io_deq_bits_rd,
  output [31:0] io_deq_bits_data,
  output [7:0]  io_deq_bits_id,
  output [31:0] io_deq_bits_brAddr,
  output        io_deq_bits_brTaken,
  output [31:0] io_deq_bits_excpAddr,
  output        io_deq_bits_excpValid,
  output [31:0] io_deq_bits_pc,
  output [31:0] io_deq_bits_inst,
  output        io_deq_bits_predictBrTaken,
  output [7:0]  io_deq_bits_predictID,
  output [3:0]  io_deq_bits_predictIdx,
  input         io_rs_0_valid,
  input  [3:0]  io_rs_0_bits_id,
  input         io_rs_1_valid,
  input  [3:0]  io_rs_1_bits_id,
  input         io_rs_2_valid,
  input  [3:0]  io_rs_2_bits_id,
  input         io_rs_3_valid,
  input  [3:0]  io_rs_3_bits_id,
  output        io_read_0_busy,
  output [1:0]  io_read_0_state,
  output [4:0]  io_read_0_rd,
  output [31:0] io_read_0_data,
  output        io_read_1_busy,
  output [1:0]  io_read_1_state,
  output [4:0]  io_read_1_rd,
  output [31:0] io_read_1_data,
  output        io_read_2_busy,
  output [1:0]  io_read_2_state,
  output [4:0]  io_read_2_rd,
  output [31:0] io_read_2_data,
  output        io_read_3_busy,
  output [1:0]  io_read_3_state,
  output [4:0]  io_read_3_rd,
  output [31:0] io_read_3_data,
  output        io_read_4_busy,
  output [1:0]  io_read_4_state,
  output [4:0]  io_read_4_rd,
  output [31:0] io_read_4_data,
  output        io_read_5_busy,
  output [1:0]  io_read_5_state,
  output [4:0]  io_read_5_rd,
  output [31:0] io_read_5_data,
  output        io_read_6_busy,
  output [1:0]  io_read_6_state,
  output [4:0]  io_read_6_rd,
  output [31:0] io_read_6_data,
  output        io_read_7_busy,
  output [1:0]  io_read_7_state,
  output [4:0]  io_read_7_rd,
  output [31:0] io_read_7_data,
  output        io_read_8_busy,
  output [1:0]  io_read_8_state,
  output [4:0]  io_read_8_rd,
  output [31:0] io_read_8_data,
  output        io_read_9_busy,
  output [1:0]  io_read_9_state,
  output [4:0]  io_read_9_rd,
  output [31:0] io_read_9_data,
  output        io_read_10_busy,
  output [1:0]  io_read_10_state,
  output [4:0]  io_read_10_rd,
  output [31:0] io_read_10_data,
  output        io_read_11_busy,
  output [1:0]  io_read_11_state,
  output [4:0]  io_read_11_rd,
  output [31:0] io_read_11_data,
  input         io_fu_0_valid,
  input  [3:0]  io_fu_0_bits_id,
  input  [31:0] io_fu_0_bits_data,
  input         io_fu_1_valid,
  input  [3:0]  io_fu_1_bits_id,
  input  [31:0] io_fu_1_bits_data,
  input  [31:0] io_fu_1_bits_brAddr,
  input         io_fu_1_bits_brTaken,
  input         io_fu_2_valid,
  input  [3:0]  io_fu_2_bits_id,
  input  [31:0] io_fu_2_bits_data,
  input         io_fu_3_valid,
  input  [3:0]  io_fu_3_bits_id,
  input  [31:0] io_fu_3_bits_data,
  input  [31:0] io_fu_3_bits_excpAddr,
  input         io_fu_3_bits_excpValid,
  output [3:0]  io_id,
  output [7:0]  io_regStatus_0_owner,
  output [7:0]  io_regStatus_1_owner,
  output [7:0]  io_regStatus_2_owner,
  output [7:0]  io_regStatus_3_owner,
  output [7:0]  io_regStatus_4_owner,
  output [7:0]  io_regStatus_5_owner,
  output [7:0]  io_regStatus_6_owner,
  output [7:0]  io_regStatus_7_owner,
  output [7:0]  io_regStatus_8_owner,
  output [7:0]  io_regStatus_9_owner,
  output [7:0]  io_regStatus_10_owner,
  output [7:0]  io_regStatus_11_owner,
  output [7:0]  io_regStatus_12_owner,
  output [7:0]  io_regStatus_13_owner,
  output [7:0]  io_regStatus_14_owner,
  output [7:0]  io_regStatus_15_owner,
  output [7:0]  io_regStatus_16_owner,
  output [7:0]  io_regStatus_17_owner,
  output [7:0]  io_regStatus_18_owner,
  output [7:0]  io_regStatus_19_owner,
  output [7:0]  io_regStatus_20_owner,
  output [7:0]  io_regStatus_21_owner,
  output [7:0]  io_regStatus_22_owner,
  output [7:0]  io_regStatus_23_owner,
  output [7:0]  io_regStatus_24_owner,
  output [7:0]  io_regStatus_25_owner,
  output [7:0]  io_regStatus_26_owner,
  output [7:0]  io_regStatus_27_owner,
  output [7:0]  io_regStatus_28_owner,
  output [7:0]  io_regStatus_29_owner,
  output [7:0]  io_regStatus_30_owner,
  output [7:0]  io_regStatus_31_owner,
  input         io_flush
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
`endif // RANDOMIZE_REG_INIT
  reg  entries_0_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_0_state; // @[ROB.scala 128:22]
  reg [4:0] entries_0_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_0_data; // @[ROB.scala 128:22]
  reg [31:0] entries_0_brAddr; // @[ROB.scala 128:22]
  reg  entries_0_brTaken; // @[ROB.scala 128:22]
  reg  entries_0_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_0_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_0_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_0_excpAddr; // @[ROB.scala 128:22]
  reg  entries_0_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_0_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_0_inst; // @[ROB.scala 128:22]
  reg  entries_1_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_1_state; // @[ROB.scala 128:22]
  reg [4:0] entries_1_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_1_data; // @[ROB.scala 128:22]
  reg [31:0] entries_1_brAddr; // @[ROB.scala 128:22]
  reg  entries_1_brTaken; // @[ROB.scala 128:22]
  reg  entries_1_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_1_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_1_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_1_excpAddr; // @[ROB.scala 128:22]
  reg  entries_1_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_1_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_1_inst; // @[ROB.scala 128:22]
  reg  entries_2_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_2_state; // @[ROB.scala 128:22]
  reg [4:0] entries_2_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_2_data; // @[ROB.scala 128:22]
  reg [31:0] entries_2_brAddr; // @[ROB.scala 128:22]
  reg  entries_2_brTaken; // @[ROB.scala 128:22]
  reg  entries_2_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_2_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_2_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_2_excpAddr; // @[ROB.scala 128:22]
  reg  entries_2_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_2_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_2_inst; // @[ROB.scala 128:22]
  reg  entries_3_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_3_state; // @[ROB.scala 128:22]
  reg [4:0] entries_3_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_3_data; // @[ROB.scala 128:22]
  reg [31:0] entries_3_brAddr; // @[ROB.scala 128:22]
  reg  entries_3_brTaken; // @[ROB.scala 128:22]
  reg  entries_3_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_3_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_3_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_3_excpAddr; // @[ROB.scala 128:22]
  reg  entries_3_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_3_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_3_inst; // @[ROB.scala 128:22]
  reg  entries_4_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_4_state; // @[ROB.scala 128:22]
  reg [4:0] entries_4_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_4_data; // @[ROB.scala 128:22]
  reg [31:0] entries_4_brAddr; // @[ROB.scala 128:22]
  reg  entries_4_brTaken; // @[ROB.scala 128:22]
  reg  entries_4_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_4_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_4_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_4_excpAddr; // @[ROB.scala 128:22]
  reg  entries_4_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_4_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_4_inst; // @[ROB.scala 128:22]
  reg  entries_5_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_5_state; // @[ROB.scala 128:22]
  reg [4:0] entries_5_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_5_data; // @[ROB.scala 128:22]
  reg [31:0] entries_5_brAddr; // @[ROB.scala 128:22]
  reg  entries_5_brTaken; // @[ROB.scala 128:22]
  reg  entries_5_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_5_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_5_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_5_excpAddr; // @[ROB.scala 128:22]
  reg  entries_5_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_5_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_5_inst; // @[ROB.scala 128:22]
  reg  entries_6_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_6_state; // @[ROB.scala 128:22]
  reg [4:0] entries_6_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_6_data; // @[ROB.scala 128:22]
  reg [31:0] entries_6_brAddr; // @[ROB.scala 128:22]
  reg  entries_6_brTaken; // @[ROB.scala 128:22]
  reg  entries_6_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_6_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_6_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_6_excpAddr; // @[ROB.scala 128:22]
  reg  entries_6_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_6_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_6_inst; // @[ROB.scala 128:22]
  reg  entries_7_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_7_state; // @[ROB.scala 128:22]
  reg [4:0] entries_7_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_7_data; // @[ROB.scala 128:22]
  reg [31:0] entries_7_brAddr; // @[ROB.scala 128:22]
  reg  entries_7_brTaken; // @[ROB.scala 128:22]
  reg  entries_7_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_7_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_7_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_7_excpAddr; // @[ROB.scala 128:22]
  reg  entries_7_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_7_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_7_inst; // @[ROB.scala 128:22]
  reg  entries_8_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_8_state; // @[ROB.scala 128:22]
  reg [4:0] entries_8_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_8_data; // @[ROB.scala 128:22]
  reg [31:0] entries_8_brAddr; // @[ROB.scala 128:22]
  reg  entries_8_brTaken; // @[ROB.scala 128:22]
  reg  entries_8_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_8_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_8_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_8_excpAddr; // @[ROB.scala 128:22]
  reg  entries_8_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_8_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_8_inst; // @[ROB.scala 128:22]
  reg  entries_9_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_9_state; // @[ROB.scala 128:22]
  reg [4:0] entries_9_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_9_data; // @[ROB.scala 128:22]
  reg [31:0] entries_9_brAddr; // @[ROB.scala 128:22]
  reg  entries_9_brTaken; // @[ROB.scala 128:22]
  reg  entries_9_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_9_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_9_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_9_excpAddr; // @[ROB.scala 128:22]
  reg  entries_9_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_9_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_9_inst; // @[ROB.scala 128:22]
  reg  entries_10_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_10_state; // @[ROB.scala 128:22]
  reg [4:0] entries_10_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_10_data; // @[ROB.scala 128:22]
  reg [31:0] entries_10_brAddr; // @[ROB.scala 128:22]
  reg  entries_10_brTaken; // @[ROB.scala 128:22]
  reg  entries_10_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_10_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_10_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_10_excpAddr; // @[ROB.scala 128:22]
  reg  entries_10_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_10_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_10_inst; // @[ROB.scala 128:22]
  reg  entries_11_busy; // @[ROB.scala 128:22]
  reg [1:0] entries_11_state; // @[ROB.scala 128:22]
  reg [4:0] entries_11_rd; // @[ROB.scala 128:22]
  reg [31:0] entries_11_data; // @[ROB.scala 128:22]
  reg [31:0] entries_11_brAddr; // @[ROB.scala 128:22]
  reg  entries_11_brTaken; // @[ROB.scala 128:22]
  reg  entries_11_predictBrTaken; // @[ROB.scala 128:22]
  reg [7:0] entries_11_predictID; // @[ROB.scala 128:22]
  reg [3:0] entries_11_predictIdx; // @[ROB.scala 128:22]
  reg [31:0] entries_11_excpAddr; // @[ROB.scala 128:22]
  reg  entries_11_excpValid; // @[ROB.scala 128:22]
  reg [31:0] entries_11_pc; // @[ROB.scala 128:22]
  reg [31:0] entries_11_inst; // @[ROB.scala 128:22]
  reg [7:0] regResStat_0_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_1_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_2_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_3_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_4_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_5_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_6_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_7_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_8_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_9_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_10_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_11_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_12_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_13_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_14_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_15_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_16_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_17_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_18_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_19_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_20_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_21_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_22_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_23_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_24_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_25_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_26_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_27_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_28_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_29_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_30_owner; // @[ROB.scala 129:25]
  reg [7:0] regResStat_31_owner; // @[ROB.scala 129:25]
  reg [3:0] head; // @[ROB.scala 131:23]
  reg [3:0] tail; // @[ROB.scala 132:23]
  reg [3:0] count; // @[ROB.scala 134:24]
  wire  full = count == 4'hc; // @[ROB.scala 135:22]
  wire [3:0] _io_id_T_1 = tail + 4'h1; // @[ROB.scala 143:19]
  wire  _GEN_1 = 4'h1 == tail ? entries_1_busy : entries_0_busy; // @[ROB.scala 144:{30,30}]
  wire  _GEN_2 = 4'h2 == tail ? entries_2_busy : _GEN_1; // @[ROB.scala 144:{30,30}]
  wire  _GEN_3 = 4'h3 == tail ? entries_3_busy : _GEN_2; // @[ROB.scala 144:{30,30}]
  wire  _GEN_4 = 4'h4 == tail ? entries_4_busy : _GEN_3; // @[ROB.scala 144:{30,30}]
  wire  _GEN_5 = 4'h5 == tail ? entries_5_busy : _GEN_4; // @[ROB.scala 144:{30,30}]
  wire  _GEN_6 = 4'h6 == tail ? entries_6_busy : _GEN_5; // @[ROB.scala 144:{30,30}]
  wire  _GEN_7 = 4'h7 == tail ? entries_7_busy : _GEN_6; // @[ROB.scala 144:{30,30}]
  wire  _GEN_8 = 4'h8 == tail ? entries_8_busy : _GEN_7; // @[ROB.scala 144:{30,30}]
  wire  _GEN_9 = 4'h9 == tail ? entries_9_busy : _GEN_8; // @[ROB.scala 144:{30,30}]
  wire  _GEN_10 = 4'ha == tail ? entries_10_busy : _GEN_9; // @[ROB.scala 144:{30,30}]
  wire  _GEN_11 = 4'hb == tail ? entries_11_busy : _GEN_10; // @[ROB.scala 144:{30,30}]
  wire [1:0] _GEN_13 = 4'h1 == head ? entries_1_state : entries_0_state; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_14 = 4'h2 == head ? entries_2_state : _GEN_13; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_15 = 4'h3 == head ? entries_3_state : _GEN_14; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_16 = 4'h4 == head ? entries_4_state : _GEN_15; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_17 = 4'h5 == head ? entries_5_state : _GEN_16; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_18 = 4'h6 == head ? entries_6_state : _GEN_17; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_19 = 4'h7 == head ? entries_7_state : _GEN_18; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_20 = 4'h8 == head ? entries_8_state : _GEN_19; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_21 = 4'h9 == head ? entries_9_state : _GEN_20; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_22 = 4'ha == head ? entries_10_state : _GEN_21; // @[ROB.scala 145:{41,41}]
  wire [1:0] _GEN_23 = 4'hb == head ? entries_11_state : _GEN_22; // @[ROB.scala 145:{41,41}]
  wire  _GEN_25 = 4'h1 == head ? entries_1_busy : entries_0_busy; // @[ROB.scala 145:{52,52}]
  wire  _GEN_26 = 4'h2 == head ? entries_2_busy : _GEN_25; // @[ROB.scala 145:{52,52}]
  wire  _GEN_27 = 4'h3 == head ? entries_3_busy : _GEN_26; // @[ROB.scala 145:{52,52}]
  wire  _GEN_28 = 4'h4 == head ? entries_4_busy : _GEN_27; // @[ROB.scala 145:{52,52}]
  wire  _GEN_29 = 4'h5 == head ? entries_5_busy : _GEN_28; // @[ROB.scala 145:{52,52}]
  wire  _GEN_30 = 4'h6 == head ? entries_6_busy : _GEN_29; // @[ROB.scala 145:{52,52}]
  wire  _GEN_31 = 4'h7 == head ? entries_7_busy : _GEN_30; // @[ROB.scala 145:{52,52}]
  wire  _GEN_32 = 4'h8 == head ? entries_8_busy : _GEN_31; // @[ROB.scala 145:{52,52}]
  wire  _GEN_33 = 4'h9 == head ? entries_9_busy : _GEN_32; // @[ROB.scala 145:{52,52}]
  wire  _GEN_34 = 4'ha == head ? entries_10_busy : _GEN_33; // @[ROB.scala 145:{52,52}]
  wire  _GEN_35 = 4'hb == head ? entries_11_busy : _GEN_34; // @[ROB.scala 145:{52,52}]
  wire [31:0] _GEN_37 = 4'h1 == head ? entries_1_data : entries_0_data; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_38 = 4'h2 == head ? entries_2_data : _GEN_37; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_39 = 4'h3 == head ? entries_3_data : _GEN_38; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_40 = 4'h4 == head ? entries_4_data : _GEN_39; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_41 = 4'h5 == head ? entries_5_data : _GEN_40; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_42 = 4'h6 == head ? entries_6_data : _GEN_41; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_43 = 4'h7 == head ? entries_7_data : _GEN_42; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_44 = 4'h8 == head ? entries_8_data : _GEN_43; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_45 = 4'h9 == head ? entries_9_data : _GEN_44; // @[ROB.scala 146:{22,22}]
  wire [31:0] _GEN_46 = 4'ha == head ? entries_10_data : _GEN_45; // @[ROB.scala 146:{22,22}]
  wire [4:0] _GEN_49 = 4'h1 == head ? entries_1_rd : entries_0_rd; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_50 = 4'h2 == head ? entries_2_rd : _GEN_49; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_51 = 4'h3 == head ? entries_3_rd : _GEN_50; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_52 = 4'h4 == head ? entries_4_rd : _GEN_51; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_53 = 4'h5 == head ? entries_5_rd : _GEN_52; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_54 = 4'h6 == head ? entries_6_rd : _GEN_53; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_55 = 4'h7 == head ? entries_7_rd : _GEN_54; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_56 = 4'h8 == head ? entries_8_rd : _GEN_55; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_57 = 4'h9 == head ? entries_9_rd : _GEN_56; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_58 = 4'ha == head ? entries_10_rd : _GEN_57; // @[ROB.scala 147:{20,20}]
  wire [4:0] _GEN_59 = 4'hb == head ? entries_11_rd : _GEN_58; // @[ROB.scala 147:{20,20}]
  wire [31:0] _GEN_61 = 4'h1 == head ? entries_1_pc : entries_0_pc; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_62 = 4'h2 == head ? entries_2_pc : _GEN_61; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_63 = 4'h3 == head ? entries_3_pc : _GEN_62; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_64 = 4'h4 == head ? entries_4_pc : _GEN_63; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_65 = 4'h5 == head ? entries_5_pc : _GEN_64; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_66 = 4'h6 == head ? entries_6_pc : _GEN_65; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_67 = 4'h7 == head ? entries_7_pc : _GEN_66; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_68 = 4'h8 == head ? entries_8_pc : _GEN_67; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_69 = 4'h9 == head ? entries_9_pc : _GEN_68; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_70 = 4'ha == head ? entries_10_pc : _GEN_69; // @[ROB.scala 149:{20,20}]
  wire [31:0] _GEN_73 = 4'h1 == head ? entries_1_inst : entries_0_inst; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_74 = 4'h2 == head ? entries_2_inst : _GEN_73; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_75 = 4'h3 == head ? entries_3_inst : _GEN_74; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_76 = 4'h4 == head ? entries_4_inst : _GEN_75; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_77 = 4'h5 == head ? entries_5_inst : _GEN_76; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_78 = 4'h6 == head ? entries_6_inst : _GEN_77; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_79 = 4'h7 == head ? entries_7_inst : _GEN_78; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_80 = 4'h8 == head ? entries_8_inst : _GEN_79; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_81 = 4'h9 == head ? entries_9_inst : _GEN_80; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_82 = 4'ha == head ? entries_10_inst : _GEN_81; // @[ROB.scala 150:{22,22}]
  wire [31:0] _GEN_85 = 4'h1 == head ? entries_1_brAddr : entries_0_brAddr; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_86 = 4'h2 == head ? entries_2_brAddr : _GEN_85; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_87 = 4'h3 == head ? entries_3_brAddr : _GEN_86; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_88 = 4'h4 == head ? entries_4_brAddr : _GEN_87; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_89 = 4'h5 == head ? entries_5_brAddr : _GEN_88; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_90 = 4'h6 == head ? entries_6_brAddr : _GEN_89; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_91 = 4'h7 == head ? entries_7_brAddr : _GEN_90; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_92 = 4'h8 == head ? entries_8_brAddr : _GEN_91; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_93 = 4'h9 == head ? entries_9_brAddr : _GEN_92; // @[ROB.scala 151:{24,24}]
  wire [31:0] _GEN_94 = 4'ha == head ? entries_10_brAddr : _GEN_93; // @[ROB.scala 151:{24,24}]
  wire  _GEN_97 = 4'h1 == head ? entries_1_brTaken : entries_0_brTaken; // @[ROB.scala 152:{25,25}]
  wire  _GEN_98 = 4'h2 == head ? entries_2_brTaken : _GEN_97; // @[ROB.scala 152:{25,25}]
  wire  _GEN_99 = 4'h3 == head ? entries_3_brTaken : _GEN_98; // @[ROB.scala 152:{25,25}]
  wire  _GEN_100 = 4'h4 == head ? entries_4_brTaken : _GEN_99; // @[ROB.scala 152:{25,25}]
  wire  _GEN_101 = 4'h5 == head ? entries_5_brTaken : _GEN_100; // @[ROB.scala 152:{25,25}]
  wire  _GEN_102 = 4'h6 == head ? entries_6_brTaken : _GEN_101; // @[ROB.scala 152:{25,25}]
  wire  _GEN_103 = 4'h7 == head ? entries_7_brTaken : _GEN_102; // @[ROB.scala 152:{25,25}]
  wire  _GEN_104 = 4'h8 == head ? entries_8_brTaken : _GEN_103; // @[ROB.scala 152:{25,25}]
  wire  _GEN_105 = 4'h9 == head ? entries_9_brTaken : _GEN_104; // @[ROB.scala 152:{25,25}]
  wire  _GEN_106 = 4'ha == head ? entries_10_brTaken : _GEN_105; // @[ROB.scala 152:{25,25}]
  wire  _GEN_109 = 4'h1 == head ? entries_1_predictBrTaken : entries_0_predictBrTaken; // @[ROB.scala 153:{32,32}]
  wire  _GEN_110 = 4'h2 == head ? entries_2_predictBrTaken : _GEN_109; // @[ROB.scala 153:{32,32}]
  wire  _GEN_111 = 4'h3 == head ? entries_3_predictBrTaken : _GEN_110; // @[ROB.scala 153:{32,32}]
  wire  _GEN_112 = 4'h4 == head ? entries_4_predictBrTaken : _GEN_111; // @[ROB.scala 153:{32,32}]
  wire  _GEN_113 = 4'h5 == head ? entries_5_predictBrTaken : _GEN_112; // @[ROB.scala 153:{32,32}]
  wire  _GEN_114 = 4'h6 == head ? entries_6_predictBrTaken : _GEN_113; // @[ROB.scala 153:{32,32}]
  wire  _GEN_115 = 4'h7 == head ? entries_7_predictBrTaken : _GEN_114; // @[ROB.scala 153:{32,32}]
  wire  _GEN_116 = 4'h8 == head ? entries_8_predictBrTaken : _GEN_115; // @[ROB.scala 153:{32,32}]
  wire  _GEN_117 = 4'h9 == head ? entries_9_predictBrTaken : _GEN_116; // @[ROB.scala 153:{32,32}]
  wire  _GEN_118 = 4'ha == head ? entries_10_predictBrTaken : _GEN_117; // @[ROB.scala 153:{32,32}]
  wire [3:0] _GEN_121 = 4'h1 == head ? entries_1_predictIdx : entries_0_predictIdx; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_122 = 4'h2 == head ? entries_2_predictIdx : _GEN_121; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_123 = 4'h3 == head ? entries_3_predictIdx : _GEN_122; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_124 = 4'h4 == head ? entries_4_predictIdx : _GEN_123; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_125 = 4'h5 == head ? entries_5_predictIdx : _GEN_124; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_126 = 4'h6 == head ? entries_6_predictIdx : _GEN_125; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_127 = 4'h7 == head ? entries_7_predictIdx : _GEN_126; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_128 = 4'h8 == head ? entries_8_predictIdx : _GEN_127; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_129 = 4'h9 == head ? entries_9_predictIdx : _GEN_128; // @[ROB.scala 154:{28,28}]
  wire [3:0] _GEN_130 = 4'ha == head ? entries_10_predictIdx : _GEN_129; // @[ROB.scala 154:{28,28}]
  wire [7:0] _GEN_133 = 4'h1 == head ? entries_1_predictID : entries_0_predictID; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_134 = 4'h2 == head ? entries_2_predictID : _GEN_133; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_135 = 4'h3 == head ? entries_3_predictID : _GEN_134; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_136 = 4'h4 == head ? entries_4_predictID : _GEN_135; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_137 = 4'h5 == head ? entries_5_predictID : _GEN_136; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_138 = 4'h6 == head ? entries_6_predictID : _GEN_137; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_139 = 4'h7 == head ? entries_7_predictID : _GEN_138; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_140 = 4'h8 == head ? entries_8_predictID : _GEN_139; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_141 = 4'h9 == head ? entries_9_predictID : _GEN_140; // @[ROB.scala 155:{27,27}]
  wire [7:0] _GEN_142 = 4'ha == head ? entries_10_predictID : _GEN_141; // @[ROB.scala 155:{27,27}]
  wire [31:0] _GEN_145 = 4'h1 == head ? entries_1_excpAddr : entries_0_excpAddr; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_146 = 4'h2 == head ? entries_2_excpAddr : _GEN_145; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_147 = 4'h3 == head ? entries_3_excpAddr : _GEN_146; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_148 = 4'h4 == head ? entries_4_excpAddr : _GEN_147; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_149 = 4'h5 == head ? entries_5_excpAddr : _GEN_148; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_150 = 4'h6 == head ? entries_6_excpAddr : _GEN_149; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_151 = 4'h7 == head ? entries_7_excpAddr : _GEN_150; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_152 = 4'h8 == head ? entries_8_excpAddr : _GEN_151; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_153 = 4'h9 == head ? entries_9_excpAddr : _GEN_152; // @[ROB.scala 156:{26,26}]
  wire [31:0] _GEN_154 = 4'ha == head ? entries_10_excpAddr : _GEN_153; // @[ROB.scala 156:{26,26}]
  wire  _GEN_157 = 4'h1 == head ? entries_1_excpValid : entries_0_excpValid; // @[ROB.scala 157:{27,27}]
  wire  _GEN_158 = 4'h2 == head ? entries_2_excpValid : _GEN_157; // @[ROB.scala 157:{27,27}]
  wire  _GEN_159 = 4'h3 == head ? entries_3_excpValid : _GEN_158; // @[ROB.scala 157:{27,27}]
  wire  _GEN_160 = 4'h4 == head ? entries_4_excpValid : _GEN_159; // @[ROB.scala 157:{27,27}]
  wire  _GEN_161 = 4'h5 == head ? entries_5_excpValid : _GEN_160; // @[ROB.scala 157:{27,27}]
  wire  _GEN_162 = 4'h6 == head ? entries_6_excpValid : _GEN_161; // @[ROB.scala 157:{27,27}]
  wire  _GEN_163 = 4'h7 == head ? entries_7_excpValid : _GEN_162; // @[ROB.scala 157:{27,27}]
  wire  _GEN_164 = 4'h8 == head ? entries_8_excpValid : _GEN_163; // @[ROB.scala 157:{27,27}]
  wire  _GEN_165 = 4'h9 == head ? entries_9_excpValid : _GEN_164; // @[ROB.scala 157:{27,27}]
  wire  _GEN_166 = 4'ha == head ? entries_10_excpValid : _GEN_165; // @[ROB.scala 157:{27,27}]
  wire [3:0] _io_deq_bits_id_T_1 = head + 4'h1; // @[ROB.scala 158:28]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_168 = 4'h0 == tail | entries_0_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_169 = 4'h1 == tail | entries_1_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_170 = 4'h2 == tail | entries_2_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_171 = 4'h3 == tail | entries_3_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_172 = 4'h4 == tail | entries_4_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_173 = 4'h5 == tail | entries_5_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_174 = 4'h6 == tail | entries_6_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_175 = 4'h7 == tail | entries_7_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_176 = 4'h8 == tail | entries_8_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_177 = 4'h9 == tail | entries_9_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_178 = 4'ha == tail | entries_10_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire  _GEN_179 = 4'hb == tail | entries_11_busy; // @[ROB.scala 128:22 162:{28,28}]
  wire [1:0] _GEN_180 = 4'h0 == tail ? 2'h0 : entries_0_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_181 = 4'h1 == tail ? 2'h0 : entries_1_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_182 = 4'h2 == tail ? 2'h0 : entries_2_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_183 = 4'h3 == tail ? 2'h0 : entries_3_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_184 = 4'h4 == tail ? 2'h0 : entries_4_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_185 = 4'h5 == tail ? 2'h0 : entries_5_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_186 = 4'h6 == tail ? 2'h0 : entries_6_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_187 = 4'h7 == tail ? 2'h0 : entries_7_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_188 = 4'h8 == tail ? 2'h0 : entries_8_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_189 = 4'h9 == tail ? 2'h0 : entries_9_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_190 = 4'ha == tail ? 2'h0 : entries_10_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [1:0] _GEN_191 = 4'hb == tail ? 2'h0 : entries_11_state; // @[ROB.scala 128:22 163:{29,29}]
  wire [3:0] _regResStat_owner_T_3 = io_enq_bits_rd == 5'h0 ? 4'h0 : _io_id_T_1; // @[ROB.scala 173:36]
  wire [7:0] _regResStat_io_enq_bits_rd_owner = {{4'd0}, _regResStat_owner_T_3}; // @[ROB.scala 173:{30,30}]
  wire [7:0] _GEN_276 = 5'h0 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_0_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_277 = 5'h1 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_1_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_278 = 5'h2 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_2_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_279 = 5'h3 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_3_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_280 = 5'h4 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_4_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_281 = 5'h5 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_5_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_282 = 5'h6 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_6_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_283 = 5'h7 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_7_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_284 = 5'h8 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_8_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_285 = 5'h9 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_9_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_286 = 5'ha == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_10_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_287 = 5'hb == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_11_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_288 = 5'hc == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_12_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_289 = 5'hd == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_13_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_290 = 5'he == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_14_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_291 = 5'hf == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_15_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_292 = 5'h10 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_16_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_293 = 5'h11 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_17_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_294 = 5'h12 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_18_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_295 = 5'h13 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_19_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_296 = 5'h14 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_20_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_297 = 5'h15 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_21_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_298 = 5'h16 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_22_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_299 = 5'h17 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_23_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_300 = 5'h18 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_24_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_301 = 5'h19 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_25_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_302 = 5'h1a == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_26_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_303 = 5'h1b == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_27_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_304 = 5'h1c == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_28_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_305 = 5'h1d == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_29_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_306 = 5'h1e == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_30_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire [7:0] _GEN_307 = 5'h1f == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_31_owner; // @[ROB.scala 129:25 173:{30,30}]
  wire  _GEN_308 = _T ? _GEN_168 : entries_0_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_309 = _T ? _GEN_169 : entries_1_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_310 = _T ? _GEN_170 : entries_2_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_311 = _T ? _GEN_171 : entries_3_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_312 = _T ? _GEN_172 : entries_4_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_313 = _T ? _GEN_173 : entries_5_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_314 = _T ? _GEN_174 : entries_6_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_315 = _T ? _GEN_175 : entries_7_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_316 = _T ? _GEN_176 : entries_8_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_317 = _T ? _GEN_177 : entries_9_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_318 = _T ? _GEN_178 : entries_10_busy; // @[ROB.scala 128:22 161:24]
  wire  _GEN_319 = _T ? _GEN_179 : entries_11_busy; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_320 = _T ? _GEN_180 : entries_0_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_321 = _T ? _GEN_181 : entries_1_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_322 = _T ? _GEN_182 : entries_2_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_323 = _T ? _GEN_183 : entries_3_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_324 = _T ? _GEN_184 : entries_4_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_325 = _T ? _GEN_185 : entries_5_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_326 = _T ? _GEN_186 : entries_6_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_327 = _T ? _GEN_187 : entries_7_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_328 = _T ? _GEN_188 : entries_8_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_329 = _T ? _GEN_189 : entries_9_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_330 = _T ? _GEN_190 : entries_10_state; // @[ROB.scala 128:22 161:24]
  wire [1:0] _GEN_331 = _T ? _GEN_191 : entries_11_state; // @[ROB.scala 128:22 161:24]
  wire [7:0] _GEN_404 = _T ? _GEN_276 : regResStat_0_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_405 = _T ? _GEN_277 : regResStat_1_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_406 = _T ? _GEN_278 : regResStat_2_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_407 = _T ? _GEN_279 : regResStat_3_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_408 = _T ? _GEN_280 : regResStat_4_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_409 = _T ? _GEN_281 : regResStat_5_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_410 = _T ? _GEN_282 : regResStat_6_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_411 = _T ? _GEN_283 : regResStat_7_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_412 = _T ? _GEN_284 : regResStat_8_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_413 = _T ? _GEN_285 : regResStat_9_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_414 = _T ? _GEN_286 : regResStat_10_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_415 = _T ? _GEN_287 : regResStat_11_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_416 = _T ? _GEN_288 : regResStat_12_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_417 = _T ? _GEN_289 : regResStat_13_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_418 = _T ? _GEN_290 : regResStat_14_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_419 = _T ? _GEN_291 : regResStat_15_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_420 = _T ? _GEN_292 : regResStat_16_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_421 = _T ? _GEN_293 : regResStat_17_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_422 = _T ? _GEN_294 : regResStat_18_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_423 = _T ? _GEN_295 : regResStat_19_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_424 = _T ? _GEN_296 : regResStat_20_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_425 = _T ? _GEN_297 : regResStat_21_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_426 = _T ? _GEN_298 : regResStat_22_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_427 = _T ? _GEN_299 : regResStat_23_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_428 = _T ? _GEN_300 : regResStat_24_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_429 = _T ? _GEN_301 : regResStat_25_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_430 = _T ? _GEN_302 : regResStat_26_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_431 = _T ? _GEN_303 : regResStat_27_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_432 = _T ? _GEN_304 : regResStat_28_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_433 = _T ? _GEN_305 : regResStat_29_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_434 = _T ? _GEN_306 : regResStat_30_owner; // @[ROB.scala 161:24 129:25]
  wire [7:0] _GEN_435 = _T ? _GEN_307 : regResStat_31_owner; // @[ROB.scala 161:24 129:25]
  wire [1:0] _GEN_449 = 4'h0 == head ? 2'h3 : _GEN_320; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_450 = 4'h1 == head ? 2'h3 : _GEN_321; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_451 = 4'h2 == head ? 2'h3 : _GEN_322; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_452 = 4'h3 == head ? 2'h3 : _GEN_323; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_453 = 4'h4 == head ? 2'h3 : _GEN_324; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_454 = 4'h5 == head ? 2'h3 : _GEN_325; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_455 = 4'h6 == head ? 2'h3 : _GEN_326; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_456 = 4'h7 == head ? 2'h3 : _GEN_327; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_457 = 4'h8 == head ? 2'h3 : _GEN_328; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_458 = 4'h9 == head ? 2'h3 : _GEN_329; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_459 = 4'ha == head ? 2'h3 : _GEN_330; // @[ROB.scala 180:{29,29}]
  wire [1:0] _GEN_460 = 4'hb == head ? 2'h3 : _GEN_331; // @[ROB.scala 180:{29,29}]
  wire  _GEN_461 = 4'h0 == head ? 1'h0 : entries_0_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_462 = 4'h1 == head ? 1'h0 : entries_1_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_463 = 4'h2 == head ? 1'h0 : entries_2_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_464 = 4'h3 == head ? 1'h0 : entries_3_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_465 = 4'h4 == head ? 1'h0 : entries_4_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_466 = 4'h5 == head ? 1'h0 : entries_5_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_467 = 4'h6 == head ? 1'h0 : entries_6_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_468 = 4'h7 == head ? 1'h0 : entries_7_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_469 = 4'h8 == head ? 1'h0 : entries_8_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_470 = 4'h9 == head ? 1'h0 : entries_9_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_471 = 4'ha == head ? 1'h0 : entries_10_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_472 = 4'hb == head ? 1'h0 : entries_11_brTaken; // @[ROB.scala 128:22 181:{31,31}]
  wire  _GEN_473 = 4'h0 == head ? 1'h0 : entries_0_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_474 = 4'h1 == head ? 1'h0 : entries_1_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_475 = 4'h2 == head ? 1'h0 : entries_2_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_476 = 4'h3 == head ? 1'h0 : entries_3_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_477 = 4'h4 == head ? 1'h0 : entries_4_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_478 = 4'h5 == head ? 1'h0 : entries_5_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_479 = 4'h6 == head ? 1'h0 : entries_6_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_480 = 4'h7 == head ? 1'h0 : entries_7_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_481 = 4'h8 == head ? 1'h0 : entries_8_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_482 = 4'h9 == head ? 1'h0 : entries_9_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_483 = 4'ha == head ? 1'h0 : entries_10_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire  _GEN_484 = 4'hb == head ? 1'h0 : entries_11_excpValid; // @[ROB.scala 128:22 182:{33,33}]
  wire [7:0] _GEN_486 = 5'h1 == _GEN_59 ? regResStat_1_owner : regResStat_0_owner; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_487 = 5'h2 == _GEN_59 ? regResStat_2_owner : _GEN_486; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_488 = 5'h3 == _GEN_59 ? regResStat_3_owner : _GEN_487; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_489 = 5'h4 == _GEN_59 ? regResStat_4_owner : _GEN_488; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_490 = 5'h5 == _GEN_59 ? regResStat_5_owner : _GEN_489; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_491 = 5'h6 == _GEN_59 ? regResStat_6_owner : _GEN_490; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_492 = 5'h7 == _GEN_59 ? regResStat_7_owner : _GEN_491; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_493 = 5'h8 == _GEN_59 ? regResStat_8_owner : _GEN_492; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_494 = 5'h9 == _GEN_59 ? regResStat_9_owner : _GEN_493; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_495 = 5'ha == _GEN_59 ? regResStat_10_owner : _GEN_494; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_496 = 5'hb == _GEN_59 ? regResStat_11_owner : _GEN_495; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_497 = 5'hc == _GEN_59 ? regResStat_12_owner : _GEN_496; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_498 = 5'hd == _GEN_59 ? regResStat_13_owner : _GEN_497; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_499 = 5'he == _GEN_59 ? regResStat_14_owner : _GEN_498; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_500 = 5'hf == _GEN_59 ? regResStat_15_owner : _GEN_499; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_501 = 5'h10 == _GEN_59 ? regResStat_16_owner : _GEN_500; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_502 = 5'h11 == _GEN_59 ? regResStat_17_owner : _GEN_501; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_503 = 5'h12 == _GEN_59 ? regResStat_18_owner : _GEN_502; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_504 = 5'h13 == _GEN_59 ? regResStat_19_owner : _GEN_503; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_505 = 5'h14 == _GEN_59 ? regResStat_20_owner : _GEN_504; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_506 = 5'h15 == _GEN_59 ? regResStat_21_owner : _GEN_505; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_507 = 5'h16 == _GEN_59 ? regResStat_22_owner : _GEN_506; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_508 = 5'h17 == _GEN_59 ? regResStat_23_owner : _GEN_507; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_509 = 5'h18 == _GEN_59 ? regResStat_24_owner : _GEN_508; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_510 = 5'h19 == _GEN_59 ? regResStat_25_owner : _GEN_509; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_511 = 5'h1a == _GEN_59 ? regResStat_26_owner : _GEN_510; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_512 = 5'h1b == _GEN_59 ? regResStat_27_owner : _GEN_511; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_513 = 5'h1c == _GEN_59 ? regResStat_28_owner : _GEN_512; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_514 = 5'h1d == _GEN_59 ? regResStat_29_owner : _GEN_513; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_515 = 5'h1e == _GEN_59 ? regResStat_30_owner : _GEN_514; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_516 = 5'h1f == _GEN_59 ? regResStat_31_owner : _GEN_515; // @[ROB.scala 185:{43,43}]
  wire [7:0] _GEN_1396 = {{4'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 185:43]
  wire [1:0] _GEN_593 = io_deq_valid ? _GEN_449 : _GEN_320; // @[ROB.scala 178:24]
  wire [1:0] _GEN_594 = io_deq_valid ? _GEN_450 : _GEN_321; // @[ROB.scala 178:24]
  wire [1:0] _GEN_595 = io_deq_valid ? _GEN_451 : _GEN_322; // @[ROB.scala 178:24]
  wire [1:0] _GEN_596 = io_deq_valid ? _GEN_452 : _GEN_323; // @[ROB.scala 178:24]
  wire [1:0] _GEN_597 = io_deq_valid ? _GEN_453 : _GEN_324; // @[ROB.scala 178:24]
  wire [1:0] _GEN_598 = io_deq_valid ? _GEN_454 : _GEN_325; // @[ROB.scala 178:24]
  wire [1:0] _GEN_599 = io_deq_valid ? _GEN_455 : _GEN_326; // @[ROB.scala 178:24]
  wire [1:0] _GEN_600 = io_deq_valid ? _GEN_456 : _GEN_327; // @[ROB.scala 178:24]
  wire [1:0] _GEN_601 = io_deq_valid ? _GEN_457 : _GEN_328; // @[ROB.scala 178:24]
  wire [1:0] _GEN_602 = io_deq_valid ? _GEN_458 : _GEN_329; // @[ROB.scala 178:24]
  wire [1:0] _GEN_603 = io_deq_valid ? _GEN_459 : _GEN_330; // @[ROB.scala 178:24]
  wire [1:0] _GEN_604 = io_deq_valid ? _GEN_460 : _GEN_331; // @[ROB.scala 178:24]
  wire  _GEN_605 = io_deq_valid ? _GEN_461 : entries_0_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_606 = io_deq_valid ? _GEN_462 : entries_1_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_607 = io_deq_valid ? _GEN_463 : entries_2_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_608 = io_deq_valid ? _GEN_464 : entries_3_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_609 = io_deq_valid ? _GEN_465 : entries_4_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_610 = io_deq_valid ? _GEN_466 : entries_5_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_611 = io_deq_valid ? _GEN_467 : entries_6_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_612 = io_deq_valid ? _GEN_468 : entries_7_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_613 = io_deq_valid ? _GEN_469 : entries_8_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_614 = io_deq_valid ? _GEN_470 : entries_9_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_615 = io_deq_valid ? _GEN_471 : entries_10_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_616 = io_deq_valid ? _GEN_472 : entries_11_brTaken; // @[ROB.scala 128:22 178:24]
  wire  _GEN_617 = io_deq_valid ? _GEN_473 : entries_0_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_618 = io_deq_valid ? _GEN_474 : entries_1_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_619 = io_deq_valid ? _GEN_475 : entries_2_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_620 = io_deq_valid ? _GEN_476 : entries_3_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_621 = io_deq_valid ? _GEN_477 : entries_4_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_622 = io_deq_valid ? _GEN_478 : entries_5_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_623 = io_deq_valid ? _GEN_479 : entries_6_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_624 = io_deq_valid ? _GEN_480 : entries_7_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_625 = io_deq_valid ? _GEN_481 : entries_8_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_626 = io_deq_valid ? _GEN_482 : entries_9_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_627 = io_deq_valid ? _GEN_483 : entries_10_excpValid; // @[ROB.scala 128:22 178:24]
  wire  _GEN_628 = io_deq_valid ? _GEN_484 : entries_11_excpValid; // @[ROB.scala 128:22 178:24]
  wire [3:0] _count_T_1 = count + 4'h1; // @[ROB.scala 194:28]
  wire [3:0] _GEN_662 = _T ? _count_T_1 : count; // @[ROB.scala 193:27 194:19 134:24]
  wire [3:0] _count_T_3 = count - 4'h1; // @[ROB.scala 197:28]
  wire [3:0] _T_17 = io_fu_0_bits_id - 4'h1; // @[ROB.scala 203:31]
  wire [31:0] _GEN_665 = 4'h0 == _T_17 ? io_fu_0_bits_data : entries_0_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_666 = 4'h1 == _T_17 ? io_fu_0_bits_data : entries_1_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_667 = 4'h2 == _T_17 ? io_fu_0_bits_data : entries_2_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_668 = 4'h3 == _T_17 ? io_fu_0_bits_data : entries_3_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_669 = 4'h4 == _T_17 ? io_fu_0_bits_data : entries_4_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_670 = 4'h5 == _T_17 ? io_fu_0_bits_data : entries_5_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_671 = 4'h6 == _T_17 ? io_fu_0_bits_data : entries_6_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_672 = 4'h7 == _T_17 ? io_fu_0_bits_data : entries_7_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_673 = 4'h8 == _T_17 ? io_fu_0_bits_data : entries_8_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_674 = 4'h9 == _T_17 ? io_fu_0_bits_data : entries_9_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_675 = 4'ha == _T_17 ? io_fu_0_bits_data : entries_10_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [31:0] _GEN_676 = 4'hb == _T_17 ? io_fu_0_bits_data : entries_11_data; // @[ROB.scala 128:22 203:{43,43}]
  wire [1:0] _GEN_677 = 4'h0 == _T_17 ? 2'h2 : _GEN_593; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_678 = 4'h1 == _T_17 ? 2'h2 : _GEN_594; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_679 = 4'h2 == _T_17 ? 2'h2 : _GEN_595; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_680 = 4'h3 == _T_17 ? 2'h2 : _GEN_596; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_681 = 4'h4 == _T_17 ? 2'h2 : _GEN_597; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_682 = 4'h5 == _T_17 ? 2'h2 : _GEN_598; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_683 = 4'h6 == _T_17 ? 2'h2 : _GEN_599; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_684 = 4'h7 == _T_17 ? 2'h2 : _GEN_600; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_685 = 4'h8 == _T_17 ? 2'h2 : _GEN_601; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_686 = 4'h9 == _T_17 ? 2'h2 : _GEN_602; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_687 = 4'ha == _T_17 ? 2'h2 : _GEN_603; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_688 = 4'hb == _T_17 ? 2'h2 : _GEN_604; // @[ROB.scala 204:{44,44}]
  wire [31:0] _GEN_689 = 4'h0 == _T_17 ? 32'h0 : entries_0_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_690 = 4'h1 == _T_17 ? 32'h0 : entries_1_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_691 = 4'h2 == _T_17 ? 32'h0 : entries_2_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_692 = 4'h3 == _T_17 ? 32'h0 : entries_3_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_693 = 4'h4 == _T_17 ? 32'h0 : entries_4_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_694 = 4'h5 == _T_17 ? 32'h0 : entries_5_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_695 = 4'h6 == _T_17 ? 32'h0 : entries_6_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_696 = 4'h7 == _T_17 ? 32'h0 : entries_7_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_697 = 4'h8 == _T_17 ? 32'h0 : entries_8_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_698 = 4'h9 == _T_17 ? 32'h0 : entries_9_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_699 = 4'ha == _T_17 ? 32'h0 : entries_10_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire [31:0] _GEN_700 = 4'hb == _T_17 ? 32'h0 : entries_11_brAddr; // @[ROB.scala 128:22 205:{45,45}]
  wire  _GEN_701 = 4'h0 == _T_17 ? 1'h0 : _GEN_605; // @[ROB.scala 206:{46,46}]
  wire  _GEN_702 = 4'h1 == _T_17 ? 1'h0 : _GEN_606; // @[ROB.scala 206:{46,46}]
  wire  _GEN_703 = 4'h2 == _T_17 ? 1'h0 : _GEN_607; // @[ROB.scala 206:{46,46}]
  wire  _GEN_704 = 4'h3 == _T_17 ? 1'h0 : _GEN_608; // @[ROB.scala 206:{46,46}]
  wire  _GEN_705 = 4'h4 == _T_17 ? 1'h0 : _GEN_609; // @[ROB.scala 206:{46,46}]
  wire  _GEN_706 = 4'h5 == _T_17 ? 1'h0 : _GEN_610; // @[ROB.scala 206:{46,46}]
  wire  _GEN_707 = 4'h6 == _T_17 ? 1'h0 : _GEN_611; // @[ROB.scala 206:{46,46}]
  wire  _GEN_708 = 4'h7 == _T_17 ? 1'h0 : _GEN_612; // @[ROB.scala 206:{46,46}]
  wire  _GEN_709 = 4'h8 == _T_17 ? 1'h0 : _GEN_613; // @[ROB.scala 206:{46,46}]
  wire  _GEN_710 = 4'h9 == _T_17 ? 1'h0 : _GEN_614; // @[ROB.scala 206:{46,46}]
  wire  _GEN_711 = 4'ha == _T_17 ? 1'h0 : _GEN_615; // @[ROB.scala 206:{46,46}]
  wire  _GEN_712 = 4'hb == _T_17 ? 1'h0 : _GEN_616; // @[ROB.scala 206:{46,46}]
  wire [31:0] _GEN_713 = 4'h0 == _T_17 ? 32'h0 : entries_0_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_714 = 4'h1 == _T_17 ? 32'h0 : entries_1_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_715 = 4'h2 == _T_17 ? 32'h0 : entries_2_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_716 = 4'h3 == _T_17 ? 32'h0 : entries_3_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_717 = 4'h4 == _T_17 ? 32'h0 : entries_4_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_718 = 4'h5 == _T_17 ? 32'h0 : entries_5_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_719 = 4'h6 == _T_17 ? 32'h0 : entries_6_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_720 = 4'h7 == _T_17 ? 32'h0 : entries_7_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_721 = 4'h8 == _T_17 ? 32'h0 : entries_8_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_722 = 4'h9 == _T_17 ? 32'h0 : entries_9_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_723 = 4'ha == _T_17 ? 32'h0 : entries_10_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire [31:0] _GEN_724 = 4'hb == _T_17 ? 32'h0 : entries_11_excpAddr; // @[ROB.scala 128:22 207:{47,47}]
  wire  _GEN_725 = 4'h0 == _T_17 ? 1'h0 : _GEN_617; // @[ROB.scala 208:{48,48}]
  wire  _GEN_726 = 4'h1 == _T_17 ? 1'h0 : _GEN_618; // @[ROB.scala 208:{48,48}]
  wire  _GEN_727 = 4'h2 == _T_17 ? 1'h0 : _GEN_619; // @[ROB.scala 208:{48,48}]
  wire  _GEN_728 = 4'h3 == _T_17 ? 1'h0 : _GEN_620; // @[ROB.scala 208:{48,48}]
  wire  _GEN_729 = 4'h4 == _T_17 ? 1'h0 : _GEN_621; // @[ROB.scala 208:{48,48}]
  wire  _GEN_730 = 4'h5 == _T_17 ? 1'h0 : _GEN_622; // @[ROB.scala 208:{48,48}]
  wire  _GEN_731 = 4'h6 == _T_17 ? 1'h0 : _GEN_623; // @[ROB.scala 208:{48,48}]
  wire  _GEN_732 = 4'h7 == _T_17 ? 1'h0 : _GEN_624; // @[ROB.scala 208:{48,48}]
  wire  _GEN_733 = 4'h8 == _T_17 ? 1'h0 : _GEN_625; // @[ROB.scala 208:{48,48}]
  wire  _GEN_734 = 4'h9 == _T_17 ? 1'h0 : _GEN_626; // @[ROB.scala 208:{48,48}]
  wire  _GEN_735 = 4'ha == _T_17 ? 1'h0 : _GEN_627; // @[ROB.scala 208:{48,48}]
  wire  _GEN_736 = 4'hb == _T_17 ? 1'h0 : _GEN_628; // @[ROB.scala 208:{48,48}]
  wire [31:0] _GEN_737 = io_fu_0_valid ? _GEN_665 : entries_0_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_738 = io_fu_0_valid ? _GEN_666 : entries_1_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_739 = io_fu_0_valid ? _GEN_667 : entries_2_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_740 = io_fu_0_valid ? _GEN_668 : entries_3_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_741 = io_fu_0_valid ? _GEN_669 : entries_4_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_742 = io_fu_0_valid ? _GEN_670 : entries_5_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_743 = io_fu_0_valid ? _GEN_671 : entries_6_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_744 = io_fu_0_valid ? _GEN_672 : entries_7_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_745 = io_fu_0_valid ? _GEN_673 : entries_8_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_746 = io_fu_0_valid ? _GEN_674 : entries_9_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_747 = io_fu_0_valid ? _GEN_675 : entries_10_data; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_748 = io_fu_0_valid ? _GEN_676 : entries_11_data; // @[ROB.scala 128:22 202:23]
  wire [1:0] _GEN_749 = io_fu_0_valid ? _GEN_677 : _GEN_593; // @[ROB.scala 202:23]
  wire [1:0] _GEN_750 = io_fu_0_valid ? _GEN_678 : _GEN_594; // @[ROB.scala 202:23]
  wire [1:0] _GEN_751 = io_fu_0_valid ? _GEN_679 : _GEN_595; // @[ROB.scala 202:23]
  wire [1:0] _GEN_752 = io_fu_0_valid ? _GEN_680 : _GEN_596; // @[ROB.scala 202:23]
  wire [1:0] _GEN_753 = io_fu_0_valid ? _GEN_681 : _GEN_597; // @[ROB.scala 202:23]
  wire [1:0] _GEN_754 = io_fu_0_valid ? _GEN_682 : _GEN_598; // @[ROB.scala 202:23]
  wire [1:0] _GEN_755 = io_fu_0_valid ? _GEN_683 : _GEN_599; // @[ROB.scala 202:23]
  wire [1:0] _GEN_756 = io_fu_0_valid ? _GEN_684 : _GEN_600; // @[ROB.scala 202:23]
  wire [1:0] _GEN_757 = io_fu_0_valid ? _GEN_685 : _GEN_601; // @[ROB.scala 202:23]
  wire [1:0] _GEN_758 = io_fu_0_valid ? _GEN_686 : _GEN_602; // @[ROB.scala 202:23]
  wire [1:0] _GEN_759 = io_fu_0_valid ? _GEN_687 : _GEN_603; // @[ROB.scala 202:23]
  wire [1:0] _GEN_760 = io_fu_0_valid ? _GEN_688 : _GEN_604; // @[ROB.scala 202:23]
  wire [31:0] _GEN_761 = io_fu_0_valid ? _GEN_689 : entries_0_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_762 = io_fu_0_valid ? _GEN_690 : entries_1_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_763 = io_fu_0_valid ? _GEN_691 : entries_2_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_764 = io_fu_0_valid ? _GEN_692 : entries_3_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_765 = io_fu_0_valid ? _GEN_693 : entries_4_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_766 = io_fu_0_valid ? _GEN_694 : entries_5_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_767 = io_fu_0_valid ? _GEN_695 : entries_6_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_768 = io_fu_0_valid ? _GEN_696 : entries_7_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_769 = io_fu_0_valid ? _GEN_697 : entries_8_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_770 = io_fu_0_valid ? _GEN_698 : entries_9_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_771 = io_fu_0_valid ? _GEN_699 : entries_10_brAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_772 = io_fu_0_valid ? _GEN_700 : entries_11_brAddr; // @[ROB.scala 128:22 202:23]
  wire  _GEN_773 = io_fu_0_valid ? _GEN_701 : _GEN_605; // @[ROB.scala 202:23]
  wire  _GEN_774 = io_fu_0_valid ? _GEN_702 : _GEN_606; // @[ROB.scala 202:23]
  wire  _GEN_775 = io_fu_0_valid ? _GEN_703 : _GEN_607; // @[ROB.scala 202:23]
  wire  _GEN_776 = io_fu_0_valid ? _GEN_704 : _GEN_608; // @[ROB.scala 202:23]
  wire  _GEN_777 = io_fu_0_valid ? _GEN_705 : _GEN_609; // @[ROB.scala 202:23]
  wire  _GEN_778 = io_fu_0_valid ? _GEN_706 : _GEN_610; // @[ROB.scala 202:23]
  wire  _GEN_779 = io_fu_0_valid ? _GEN_707 : _GEN_611; // @[ROB.scala 202:23]
  wire  _GEN_780 = io_fu_0_valid ? _GEN_708 : _GEN_612; // @[ROB.scala 202:23]
  wire  _GEN_781 = io_fu_0_valid ? _GEN_709 : _GEN_613; // @[ROB.scala 202:23]
  wire  _GEN_782 = io_fu_0_valid ? _GEN_710 : _GEN_614; // @[ROB.scala 202:23]
  wire  _GEN_783 = io_fu_0_valid ? _GEN_711 : _GEN_615; // @[ROB.scala 202:23]
  wire  _GEN_784 = io_fu_0_valid ? _GEN_712 : _GEN_616; // @[ROB.scala 202:23]
  wire [31:0] _GEN_785 = io_fu_0_valid ? _GEN_713 : entries_0_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_786 = io_fu_0_valid ? _GEN_714 : entries_1_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_787 = io_fu_0_valid ? _GEN_715 : entries_2_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_788 = io_fu_0_valid ? _GEN_716 : entries_3_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_789 = io_fu_0_valid ? _GEN_717 : entries_4_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_790 = io_fu_0_valid ? _GEN_718 : entries_5_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_791 = io_fu_0_valid ? _GEN_719 : entries_6_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_792 = io_fu_0_valid ? _GEN_720 : entries_7_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_793 = io_fu_0_valid ? _GEN_721 : entries_8_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_794 = io_fu_0_valid ? _GEN_722 : entries_9_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_795 = io_fu_0_valid ? _GEN_723 : entries_10_excpAddr; // @[ROB.scala 128:22 202:23]
  wire [31:0] _GEN_796 = io_fu_0_valid ? _GEN_724 : entries_11_excpAddr; // @[ROB.scala 128:22 202:23]
  wire  _GEN_797 = io_fu_0_valid ? _GEN_725 : _GEN_617; // @[ROB.scala 202:23]
  wire  _GEN_798 = io_fu_0_valid ? _GEN_726 : _GEN_618; // @[ROB.scala 202:23]
  wire  _GEN_799 = io_fu_0_valid ? _GEN_727 : _GEN_619; // @[ROB.scala 202:23]
  wire  _GEN_800 = io_fu_0_valid ? _GEN_728 : _GEN_620; // @[ROB.scala 202:23]
  wire  _GEN_801 = io_fu_0_valid ? _GEN_729 : _GEN_621; // @[ROB.scala 202:23]
  wire  _GEN_802 = io_fu_0_valid ? _GEN_730 : _GEN_622; // @[ROB.scala 202:23]
  wire  _GEN_803 = io_fu_0_valid ? _GEN_731 : _GEN_623; // @[ROB.scala 202:23]
  wire  _GEN_804 = io_fu_0_valid ? _GEN_732 : _GEN_624; // @[ROB.scala 202:23]
  wire  _GEN_805 = io_fu_0_valid ? _GEN_733 : _GEN_625; // @[ROB.scala 202:23]
  wire  _GEN_806 = io_fu_0_valid ? _GEN_734 : _GEN_626; // @[ROB.scala 202:23]
  wire  _GEN_807 = io_fu_0_valid ? _GEN_735 : _GEN_627; // @[ROB.scala 202:23]
  wire  _GEN_808 = io_fu_0_valid ? _GEN_736 : _GEN_628; // @[ROB.scala 202:23]
  wire [3:0] _T_29 = io_fu_1_bits_id - 4'h1; // @[ROB.scala 203:31]
  wire [31:0] _GEN_809 = 4'h0 == _T_29 ? io_fu_1_bits_data : _GEN_737; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_810 = 4'h1 == _T_29 ? io_fu_1_bits_data : _GEN_738; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_811 = 4'h2 == _T_29 ? io_fu_1_bits_data : _GEN_739; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_812 = 4'h3 == _T_29 ? io_fu_1_bits_data : _GEN_740; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_813 = 4'h4 == _T_29 ? io_fu_1_bits_data : _GEN_741; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_814 = 4'h5 == _T_29 ? io_fu_1_bits_data : _GEN_742; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_815 = 4'h6 == _T_29 ? io_fu_1_bits_data : _GEN_743; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_816 = 4'h7 == _T_29 ? io_fu_1_bits_data : _GEN_744; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_817 = 4'h8 == _T_29 ? io_fu_1_bits_data : _GEN_745; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_818 = 4'h9 == _T_29 ? io_fu_1_bits_data : _GEN_746; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_819 = 4'ha == _T_29 ? io_fu_1_bits_data : _GEN_747; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_820 = 4'hb == _T_29 ? io_fu_1_bits_data : _GEN_748; // @[ROB.scala 203:{43,43}]
  wire [1:0] _GEN_821 = 4'h0 == _T_29 ? 2'h2 : _GEN_749; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_822 = 4'h1 == _T_29 ? 2'h2 : _GEN_750; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_823 = 4'h2 == _T_29 ? 2'h2 : _GEN_751; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_824 = 4'h3 == _T_29 ? 2'h2 : _GEN_752; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_825 = 4'h4 == _T_29 ? 2'h2 : _GEN_753; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_826 = 4'h5 == _T_29 ? 2'h2 : _GEN_754; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_827 = 4'h6 == _T_29 ? 2'h2 : _GEN_755; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_828 = 4'h7 == _T_29 ? 2'h2 : _GEN_756; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_829 = 4'h8 == _T_29 ? 2'h2 : _GEN_757; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_830 = 4'h9 == _T_29 ? 2'h2 : _GEN_758; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_831 = 4'ha == _T_29 ? 2'h2 : _GEN_759; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_832 = 4'hb == _T_29 ? 2'h2 : _GEN_760; // @[ROB.scala 204:{44,44}]
  wire [31:0] _GEN_833 = 4'h0 == _T_29 ? io_fu_1_bits_brAddr : _GEN_761; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_834 = 4'h1 == _T_29 ? io_fu_1_bits_brAddr : _GEN_762; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_835 = 4'h2 == _T_29 ? io_fu_1_bits_brAddr : _GEN_763; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_836 = 4'h3 == _T_29 ? io_fu_1_bits_brAddr : _GEN_764; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_837 = 4'h4 == _T_29 ? io_fu_1_bits_brAddr : _GEN_765; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_838 = 4'h5 == _T_29 ? io_fu_1_bits_brAddr : _GEN_766; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_839 = 4'h6 == _T_29 ? io_fu_1_bits_brAddr : _GEN_767; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_840 = 4'h7 == _T_29 ? io_fu_1_bits_brAddr : _GEN_768; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_841 = 4'h8 == _T_29 ? io_fu_1_bits_brAddr : _GEN_769; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_842 = 4'h9 == _T_29 ? io_fu_1_bits_brAddr : _GEN_770; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_843 = 4'ha == _T_29 ? io_fu_1_bits_brAddr : _GEN_771; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_844 = 4'hb == _T_29 ? io_fu_1_bits_brAddr : _GEN_772; // @[ROB.scala 205:{45,45}]
  wire  _GEN_845 = 4'h0 == _T_29 ? io_fu_1_bits_brTaken : _GEN_773; // @[ROB.scala 206:{46,46}]
  wire  _GEN_846 = 4'h1 == _T_29 ? io_fu_1_bits_brTaken : _GEN_774; // @[ROB.scala 206:{46,46}]
  wire  _GEN_847 = 4'h2 == _T_29 ? io_fu_1_bits_brTaken : _GEN_775; // @[ROB.scala 206:{46,46}]
  wire  _GEN_848 = 4'h3 == _T_29 ? io_fu_1_bits_brTaken : _GEN_776; // @[ROB.scala 206:{46,46}]
  wire  _GEN_849 = 4'h4 == _T_29 ? io_fu_1_bits_brTaken : _GEN_777; // @[ROB.scala 206:{46,46}]
  wire  _GEN_850 = 4'h5 == _T_29 ? io_fu_1_bits_brTaken : _GEN_778; // @[ROB.scala 206:{46,46}]
  wire  _GEN_851 = 4'h6 == _T_29 ? io_fu_1_bits_brTaken : _GEN_779; // @[ROB.scala 206:{46,46}]
  wire  _GEN_852 = 4'h7 == _T_29 ? io_fu_1_bits_brTaken : _GEN_780; // @[ROB.scala 206:{46,46}]
  wire  _GEN_853 = 4'h8 == _T_29 ? io_fu_1_bits_brTaken : _GEN_781; // @[ROB.scala 206:{46,46}]
  wire  _GEN_854 = 4'h9 == _T_29 ? io_fu_1_bits_brTaken : _GEN_782; // @[ROB.scala 206:{46,46}]
  wire  _GEN_855 = 4'ha == _T_29 ? io_fu_1_bits_brTaken : _GEN_783; // @[ROB.scala 206:{46,46}]
  wire  _GEN_856 = 4'hb == _T_29 ? io_fu_1_bits_brTaken : _GEN_784; // @[ROB.scala 206:{46,46}]
  wire [31:0] _GEN_857 = 4'h0 == _T_29 ? 32'h0 : _GEN_785; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_858 = 4'h1 == _T_29 ? 32'h0 : _GEN_786; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_859 = 4'h2 == _T_29 ? 32'h0 : _GEN_787; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_860 = 4'h3 == _T_29 ? 32'h0 : _GEN_788; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_861 = 4'h4 == _T_29 ? 32'h0 : _GEN_789; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_862 = 4'h5 == _T_29 ? 32'h0 : _GEN_790; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_863 = 4'h6 == _T_29 ? 32'h0 : _GEN_791; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_864 = 4'h7 == _T_29 ? 32'h0 : _GEN_792; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_865 = 4'h8 == _T_29 ? 32'h0 : _GEN_793; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_866 = 4'h9 == _T_29 ? 32'h0 : _GEN_794; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_867 = 4'ha == _T_29 ? 32'h0 : _GEN_795; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_868 = 4'hb == _T_29 ? 32'h0 : _GEN_796; // @[ROB.scala 207:{47,47}]
  wire  _GEN_869 = 4'h0 == _T_29 ? 1'h0 : _GEN_797; // @[ROB.scala 208:{48,48}]
  wire  _GEN_870 = 4'h1 == _T_29 ? 1'h0 : _GEN_798; // @[ROB.scala 208:{48,48}]
  wire  _GEN_871 = 4'h2 == _T_29 ? 1'h0 : _GEN_799; // @[ROB.scala 208:{48,48}]
  wire  _GEN_872 = 4'h3 == _T_29 ? 1'h0 : _GEN_800; // @[ROB.scala 208:{48,48}]
  wire  _GEN_873 = 4'h4 == _T_29 ? 1'h0 : _GEN_801; // @[ROB.scala 208:{48,48}]
  wire  _GEN_874 = 4'h5 == _T_29 ? 1'h0 : _GEN_802; // @[ROB.scala 208:{48,48}]
  wire  _GEN_875 = 4'h6 == _T_29 ? 1'h0 : _GEN_803; // @[ROB.scala 208:{48,48}]
  wire  _GEN_876 = 4'h7 == _T_29 ? 1'h0 : _GEN_804; // @[ROB.scala 208:{48,48}]
  wire  _GEN_877 = 4'h8 == _T_29 ? 1'h0 : _GEN_805; // @[ROB.scala 208:{48,48}]
  wire  _GEN_878 = 4'h9 == _T_29 ? 1'h0 : _GEN_806; // @[ROB.scala 208:{48,48}]
  wire  _GEN_879 = 4'ha == _T_29 ? 1'h0 : _GEN_807; // @[ROB.scala 208:{48,48}]
  wire  _GEN_880 = 4'hb == _T_29 ? 1'h0 : _GEN_808; // @[ROB.scala 208:{48,48}]
  wire [31:0] _GEN_881 = io_fu_1_valid ? _GEN_809 : _GEN_737; // @[ROB.scala 202:23]
  wire [31:0] _GEN_882 = io_fu_1_valid ? _GEN_810 : _GEN_738; // @[ROB.scala 202:23]
  wire [31:0] _GEN_883 = io_fu_1_valid ? _GEN_811 : _GEN_739; // @[ROB.scala 202:23]
  wire [31:0] _GEN_884 = io_fu_1_valid ? _GEN_812 : _GEN_740; // @[ROB.scala 202:23]
  wire [31:0] _GEN_885 = io_fu_1_valid ? _GEN_813 : _GEN_741; // @[ROB.scala 202:23]
  wire [31:0] _GEN_886 = io_fu_1_valid ? _GEN_814 : _GEN_742; // @[ROB.scala 202:23]
  wire [31:0] _GEN_887 = io_fu_1_valid ? _GEN_815 : _GEN_743; // @[ROB.scala 202:23]
  wire [31:0] _GEN_888 = io_fu_1_valid ? _GEN_816 : _GEN_744; // @[ROB.scala 202:23]
  wire [31:0] _GEN_889 = io_fu_1_valid ? _GEN_817 : _GEN_745; // @[ROB.scala 202:23]
  wire [31:0] _GEN_890 = io_fu_1_valid ? _GEN_818 : _GEN_746; // @[ROB.scala 202:23]
  wire [31:0] _GEN_891 = io_fu_1_valid ? _GEN_819 : _GEN_747; // @[ROB.scala 202:23]
  wire [31:0] _GEN_892 = io_fu_1_valid ? _GEN_820 : _GEN_748; // @[ROB.scala 202:23]
  wire [1:0] _GEN_893 = io_fu_1_valid ? _GEN_821 : _GEN_749; // @[ROB.scala 202:23]
  wire [1:0] _GEN_894 = io_fu_1_valid ? _GEN_822 : _GEN_750; // @[ROB.scala 202:23]
  wire [1:0] _GEN_895 = io_fu_1_valid ? _GEN_823 : _GEN_751; // @[ROB.scala 202:23]
  wire [1:0] _GEN_896 = io_fu_1_valid ? _GEN_824 : _GEN_752; // @[ROB.scala 202:23]
  wire [1:0] _GEN_897 = io_fu_1_valid ? _GEN_825 : _GEN_753; // @[ROB.scala 202:23]
  wire [1:0] _GEN_898 = io_fu_1_valid ? _GEN_826 : _GEN_754; // @[ROB.scala 202:23]
  wire [1:0] _GEN_899 = io_fu_1_valid ? _GEN_827 : _GEN_755; // @[ROB.scala 202:23]
  wire [1:0] _GEN_900 = io_fu_1_valid ? _GEN_828 : _GEN_756; // @[ROB.scala 202:23]
  wire [1:0] _GEN_901 = io_fu_1_valid ? _GEN_829 : _GEN_757; // @[ROB.scala 202:23]
  wire [1:0] _GEN_902 = io_fu_1_valid ? _GEN_830 : _GEN_758; // @[ROB.scala 202:23]
  wire [1:0] _GEN_903 = io_fu_1_valid ? _GEN_831 : _GEN_759; // @[ROB.scala 202:23]
  wire [1:0] _GEN_904 = io_fu_1_valid ? _GEN_832 : _GEN_760; // @[ROB.scala 202:23]
  wire [31:0] _GEN_905 = io_fu_1_valid ? _GEN_833 : _GEN_761; // @[ROB.scala 202:23]
  wire [31:0] _GEN_906 = io_fu_1_valid ? _GEN_834 : _GEN_762; // @[ROB.scala 202:23]
  wire [31:0] _GEN_907 = io_fu_1_valid ? _GEN_835 : _GEN_763; // @[ROB.scala 202:23]
  wire [31:0] _GEN_908 = io_fu_1_valid ? _GEN_836 : _GEN_764; // @[ROB.scala 202:23]
  wire [31:0] _GEN_909 = io_fu_1_valid ? _GEN_837 : _GEN_765; // @[ROB.scala 202:23]
  wire [31:0] _GEN_910 = io_fu_1_valid ? _GEN_838 : _GEN_766; // @[ROB.scala 202:23]
  wire [31:0] _GEN_911 = io_fu_1_valid ? _GEN_839 : _GEN_767; // @[ROB.scala 202:23]
  wire [31:0] _GEN_912 = io_fu_1_valid ? _GEN_840 : _GEN_768; // @[ROB.scala 202:23]
  wire [31:0] _GEN_913 = io_fu_1_valid ? _GEN_841 : _GEN_769; // @[ROB.scala 202:23]
  wire [31:0] _GEN_914 = io_fu_1_valid ? _GEN_842 : _GEN_770; // @[ROB.scala 202:23]
  wire [31:0] _GEN_915 = io_fu_1_valid ? _GEN_843 : _GEN_771; // @[ROB.scala 202:23]
  wire [31:0] _GEN_916 = io_fu_1_valid ? _GEN_844 : _GEN_772; // @[ROB.scala 202:23]
  wire  _GEN_917 = io_fu_1_valid ? _GEN_845 : _GEN_773; // @[ROB.scala 202:23]
  wire  _GEN_918 = io_fu_1_valid ? _GEN_846 : _GEN_774; // @[ROB.scala 202:23]
  wire  _GEN_919 = io_fu_1_valid ? _GEN_847 : _GEN_775; // @[ROB.scala 202:23]
  wire  _GEN_920 = io_fu_1_valid ? _GEN_848 : _GEN_776; // @[ROB.scala 202:23]
  wire  _GEN_921 = io_fu_1_valid ? _GEN_849 : _GEN_777; // @[ROB.scala 202:23]
  wire  _GEN_922 = io_fu_1_valid ? _GEN_850 : _GEN_778; // @[ROB.scala 202:23]
  wire  _GEN_923 = io_fu_1_valid ? _GEN_851 : _GEN_779; // @[ROB.scala 202:23]
  wire  _GEN_924 = io_fu_1_valid ? _GEN_852 : _GEN_780; // @[ROB.scala 202:23]
  wire  _GEN_925 = io_fu_1_valid ? _GEN_853 : _GEN_781; // @[ROB.scala 202:23]
  wire  _GEN_926 = io_fu_1_valid ? _GEN_854 : _GEN_782; // @[ROB.scala 202:23]
  wire  _GEN_927 = io_fu_1_valid ? _GEN_855 : _GEN_783; // @[ROB.scala 202:23]
  wire  _GEN_928 = io_fu_1_valid ? _GEN_856 : _GEN_784; // @[ROB.scala 202:23]
  wire [31:0] _GEN_929 = io_fu_1_valid ? _GEN_857 : _GEN_785; // @[ROB.scala 202:23]
  wire [31:0] _GEN_930 = io_fu_1_valid ? _GEN_858 : _GEN_786; // @[ROB.scala 202:23]
  wire [31:0] _GEN_931 = io_fu_1_valid ? _GEN_859 : _GEN_787; // @[ROB.scala 202:23]
  wire [31:0] _GEN_932 = io_fu_1_valid ? _GEN_860 : _GEN_788; // @[ROB.scala 202:23]
  wire [31:0] _GEN_933 = io_fu_1_valid ? _GEN_861 : _GEN_789; // @[ROB.scala 202:23]
  wire [31:0] _GEN_934 = io_fu_1_valid ? _GEN_862 : _GEN_790; // @[ROB.scala 202:23]
  wire [31:0] _GEN_935 = io_fu_1_valid ? _GEN_863 : _GEN_791; // @[ROB.scala 202:23]
  wire [31:0] _GEN_936 = io_fu_1_valid ? _GEN_864 : _GEN_792; // @[ROB.scala 202:23]
  wire [31:0] _GEN_937 = io_fu_1_valid ? _GEN_865 : _GEN_793; // @[ROB.scala 202:23]
  wire [31:0] _GEN_938 = io_fu_1_valid ? _GEN_866 : _GEN_794; // @[ROB.scala 202:23]
  wire [31:0] _GEN_939 = io_fu_1_valid ? _GEN_867 : _GEN_795; // @[ROB.scala 202:23]
  wire [31:0] _GEN_940 = io_fu_1_valid ? _GEN_868 : _GEN_796; // @[ROB.scala 202:23]
  wire  _GEN_941 = io_fu_1_valid ? _GEN_869 : _GEN_797; // @[ROB.scala 202:23]
  wire  _GEN_942 = io_fu_1_valid ? _GEN_870 : _GEN_798; // @[ROB.scala 202:23]
  wire  _GEN_943 = io_fu_1_valid ? _GEN_871 : _GEN_799; // @[ROB.scala 202:23]
  wire  _GEN_944 = io_fu_1_valid ? _GEN_872 : _GEN_800; // @[ROB.scala 202:23]
  wire  _GEN_945 = io_fu_1_valid ? _GEN_873 : _GEN_801; // @[ROB.scala 202:23]
  wire  _GEN_946 = io_fu_1_valid ? _GEN_874 : _GEN_802; // @[ROB.scala 202:23]
  wire  _GEN_947 = io_fu_1_valid ? _GEN_875 : _GEN_803; // @[ROB.scala 202:23]
  wire  _GEN_948 = io_fu_1_valid ? _GEN_876 : _GEN_804; // @[ROB.scala 202:23]
  wire  _GEN_949 = io_fu_1_valid ? _GEN_877 : _GEN_805; // @[ROB.scala 202:23]
  wire  _GEN_950 = io_fu_1_valid ? _GEN_878 : _GEN_806; // @[ROB.scala 202:23]
  wire  _GEN_951 = io_fu_1_valid ? _GEN_879 : _GEN_807; // @[ROB.scala 202:23]
  wire  _GEN_952 = io_fu_1_valid ? _GEN_880 : _GEN_808; // @[ROB.scala 202:23]
  wire [3:0] _T_41 = io_fu_2_bits_id - 4'h1; // @[ROB.scala 203:31]
  wire [31:0] _GEN_953 = 4'h0 == _T_41 ? io_fu_2_bits_data : _GEN_881; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_954 = 4'h1 == _T_41 ? io_fu_2_bits_data : _GEN_882; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_955 = 4'h2 == _T_41 ? io_fu_2_bits_data : _GEN_883; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_956 = 4'h3 == _T_41 ? io_fu_2_bits_data : _GEN_884; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_957 = 4'h4 == _T_41 ? io_fu_2_bits_data : _GEN_885; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_958 = 4'h5 == _T_41 ? io_fu_2_bits_data : _GEN_886; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_959 = 4'h6 == _T_41 ? io_fu_2_bits_data : _GEN_887; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_960 = 4'h7 == _T_41 ? io_fu_2_bits_data : _GEN_888; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_961 = 4'h8 == _T_41 ? io_fu_2_bits_data : _GEN_889; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_962 = 4'h9 == _T_41 ? io_fu_2_bits_data : _GEN_890; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_963 = 4'ha == _T_41 ? io_fu_2_bits_data : _GEN_891; // @[ROB.scala 203:{43,43}]
  wire [31:0] _GEN_964 = 4'hb == _T_41 ? io_fu_2_bits_data : _GEN_892; // @[ROB.scala 203:{43,43}]
  wire [1:0] _GEN_965 = 4'h0 == _T_41 ? 2'h2 : _GEN_893; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_966 = 4'h1 == _T_41 ? 2'h2 : _GEN_894; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_967 = 4'h2 == _T_41 ? 2'h2 : _GEN_895; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_968 = 4'h3 == _T_41 ? 2'h2 : _GEN_896; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_969 = 4'h4 == _T_41 ? 2'h2 : _GEN_897; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_970 = 4'h5 == _T_41 ? 2'h2 : _GEN_898; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_971 = 4'h6 == _T_41 ? 2'h2 : _GEN_899; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_972 = 4'h7 == _T_41 ? 2'h2 : _GEN_900; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_973 = 4'h8 == _T_41 ? 2'h2 : _GEN_901; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_974 = 4'h9 == _T_41 ? 2'h2 : _GEN_902; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_975 = 4'ha == _T_41 ? 2'h2 : _GEN_903; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_976 = 4'hb == _T_41 ? 2'h2 : _GEN_904; // @[ROB.scala 204:{44,44}]
  wire [31:0] _GEN_977 = 4'h0 == _T_41 ? 32'h0 : _GEN_905; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_978 = 4'h1 == _T_41 ? 32'h0 : _GEN_906; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_979 = 4'h2 == _T_41 ? 32'h0 : _GEN_907; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_980 = 4'h3 == _T_41 ? 32'h0 : _GEN_908; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_981 = 4'h4 == _T_41 ? 32'h0 : _GEN_909; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_982 = 4'h5 == _T_41 ? 32'h0 : _GEN_910; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_983 = 4'h6 == _T_41 ? 32'h0 : _GEN_911; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_984 = 4'h7 == _T_41 ? 32'h0 : _GEN_912; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_985 = 4'h8 == _T_41 ? 32'h0 : _GEN_913; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_986 = 4'h9 == _T_41 ? 32'h0 : _GEN_914; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_987 = 4'ha == _T_41 ? 32'h0 : _GEN_915; // @[ROB.scala 205:{45,45}]
  wire [31:0] _GEN_988 = 4'hb == _T_41 ? 32'h0 : _GEN_916; // @[ROB.scala 205:{45,45}]
  wire  _GEN_989 = 4'h0 == _T_41 ? 1'h0 : _GEN_917; // @[ROB.scala 206:{46,46}]
  wire  _GEN_990 = 4'h1 == _T_41 ? 1'h0 : _GEN_918; // @[ROB.scala 206:{46,46}]
  wire  _GEN_991 = 4'h2 == _T_41 ? 1'h0 : _GEN_919; // @[ROB.scala 206:{46,46}]
  wire  _GEN_992 = 4'h3 == _T_41 ? 1'h0 : _GEN_920; // @[ROB.scala 206:{46,46}]
  wire  _GEN_993 = 4'h4 == _T_41 ? 1'h0 : _GEN_921; // @[ROB.scala 206:{46,46}]
  wire  _GEN_994 = 4'h5 == _T_41 ? 1'h0 : _GEN_922; // @[ROB.scala 206:{46,46}]
  wire  _GEN_995 = 4'h6 == _T_41 ? 1'h0 : _GEN_923; // @[ROB.scala 206:{46,46}]
  wire  _GEN_996 = 4'h7 == _T_41 ? 1'h0 : _GEN_924; // @[ROB.scala 206:{46,46}]
  wire  _GEN_997 = 4'h8 == _T_41 ? 1'h0 : _GEN_925; // @[ROB.scala 206:{46,46}]
  wire  _GEN_998 = 4'h9 == _T_41 ? 1'h0 : _GEN_926; // @[ROB.scala 206:{46,46}]
  wire  _GEN_999 = 4'ha == _T_41 ? 1'h0 : _GEN_927; // @[ROB.scala 206:{46,46}]
  wire  _GEN_1000 = 4'hb == _T_41 ? 1'h0 : _GEN_928; // @[ROB.scala 206:{46,46}]
  wire [31:0] _GEN_1001 = 4'h0 == _T_41 ? 32'h0 : _GEN_929; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1002 = 4'h1 == _T_41 ? 32'h0 : _GEN_930; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1003 = 4'h2 == _T_41 ? 32'h0 : _GEN_931; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1004 = 4'h3 == _T_41 ? 32'h0 : _GEN_932; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1005 = 4'h4 == _T_41 ? 32'h0 : _GEN_933; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1006 = 4'h5 == _T_41 ? 32'h0 : _GEN_934; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1007 = 4'h6 == _T_41 ? 32'h0 : _GEN_935; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1008 = 4'h7 == _T_41 ? 32'h0 : _GEN_936; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1009 = 4'h8 == _T_41 ? 32'h0 : _GEN_937; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1010 = 4'h9 == _T_41 ? 32'h0 : _GEN_938; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1011 = 4'ha == _T_41 ? 32'h0 : _GEN_939; // @[ROB.scala 207:{47,47}]
  wire [31:0] _GEN_1012 = 4'hb == _T_41 ? 32'h0 : _GEN_940; // @[ROB.scala 207:{47,47}]
  wire  _GEN_1013 = 4'h0 == _T_41 ? 1'h0 : _GEN_941; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1014 = 4'h1 == _T_41 ? 1'h0 : _GEN_942; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1015 = 4'h2 == _T_41 ? 1'h0 : _GEN_943; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1016 = 4'h3 == _T_41 ? 1'h0 : _GEN_944; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1017 = 4'h4 == _T_41 ? 1'h0 : _GEN_945; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1018 = 4'h5 == _T_41 ? 1'h0 : _GEN_946; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1019 = 4'h6 == _T_41 ? 1'h0 : _GEN_947; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1020 = 4'h7 == _T_41 ? 1'h0 : _GEN_948; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1021 = 4'h8 == _T_41 ? 1'h0 : _GEN_949; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1022 = 4'h9 == _T_41 ? 1'h0 : _GEN_950; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1023 = 4'ha == _T_41 ? 1'h0 : _GEN_951; // @[ROB.scala 208:{48,48}]
  wire  _GEN_1024 = 4'hb == _T_41 ? 1'h0 : _GEN_952; // @[ROB.scala 208:{48,48}]
  wire [31:0] _GEN_1025 = io_fu_2_valid ? _GEN_953 : _GEN_881; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1026 = io_fu_2_valid ? _GEN_954 : _GEN_882; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1027 = io_fu_2_valid ? _GEN_955 : _GEN_883; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1028 = io_fu_2_valid ? _GEN_956 : _GEN_884; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1029 = io_fu_2_valid ? _GEN_957 : _GEN_885; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1030 = io_fu_2_valid ? _GEN_958 : _GEN_886; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1031 = io_fu_2_valid ? _GEN_959 : _GEN_887; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1032 = io_fu_2_valid ? _GEN_960 : _GEN_888; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1033 = io_fu_2_valid ? _GEN_961 : _GEN_889; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1034 = io_fu_2_valid ? _GEN_962 : _GEN_890; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1035 = io_fu_2_valid ? _GEN_963 : _GEN_891; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1036 = io_fu_2_valid ? _GEN_964 : _GEN_892; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1037 = io_fu_2_valid ? _GEN_965 : _GEN_893; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1038 = io_fu_2_valid ? _GEN_966 : _GEN_894; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1039 = io_fu_2_valid ? _GEN_967 : _GEN_895; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1040 = io_fu_2_valid ? _GEN_968 : _GEN_896; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1041 = io_fu_2_valid ? _GEN_969 : _GEN_897; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1042 = io_fu_2_valid ? _GEN_970 : _GEN_898; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1043 = io_fu_2_valid ? _GEN_971 : _GEN_899; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1044 = io_fu_2_valid ? _GEN_972 : _GEN_900; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1045 = io_fu_2_valid ? _GEN_973 : _GEN_901; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1046 = io_fu_2_valid ? _GEN_974 : _GEN_902; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1047 = io_fu_2_valid ? _GEN_975 : _GEN_903; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1048 = io_fu_2_valid ? _GEN_976 : _GEN_904; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1049 = io_fu_2_valid ? _GEN_977 : _GEN_905; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1050 = io_fu_2_valid ? _GEN_978 : _GEN_906; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1051 = io_fu_2_valid ? _GEN_979 : _GEN_907; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1052 = io_fu_2_valid ? _GEN_980 : _GEN_908; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1053 = io_fu_2_valid ? _GEN_981 : _GEN_909; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1054 = io_fu_2_valid ? _GEN_982 : _GEN_910; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1055 = io_fu_2_valid ? _GEN_983 : _GEN_911; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1056 = io_fu_2_valid ? _GEN_984 : _GEN_912; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1057 = io_fu_2_valid ? _GEN_985 : _GEN_913; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1058 = io_fu_2_valid ? _GEN_986 : _GEN_914; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1059 = io_fu_2_valid ? _GEN_987 : _GEN_915; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1060 = io_fu_2_valid ? _GEN_988 : _GEN_916; // @[ROB.scala 202:23]
  wire  _GEN_1061 = io_fu_2_valid ? _GEN_989 : _GEN_917; // @[ROB.scala 202:23]
  wire  _GEN_1062 = io_fu_2_valid ? _GEN_990 : _GEN_918; // @[ROB.scala 202:23]
  wire  _GEN_1063 = io_fu_2_valid ? _GEN_991 : _GEN_919; // @[ROB.scala 202:23]
  wire  _GEN_1064 = io_fu_2_valid ? _GEN_992 : _GEN_920; // @[ROB.scala 202:23]
  wire  _GEN_1065 = io_fu_2_valid ? _GEN_993 : _GEN_921; // @[ROB.scala 202:23]
  wire  _GEN_1066 = io_fu_2_valid ? _GEN_994 : _GEN_922; // @[ROB.scala 202:23]
  wire  _GEN_1067 = io_fu_2_valid ? _GEN_995 : _GEN_923; // @[ROB.scala 202:23]
  wire  _GEN_1068 = io_fu_2_valid ? _GEN_996 : _GEN_924; // @[ROB.scala 202:23]
  wire  _GEN_1069 = io_fu_2_valid ? _GEN_997 : _GEN_925; // @[ROB.scala 202:23]
  wire  _GEN_1070 = io_fu_2_valid ? _GEN_998 : _GEN_926; // @[ROB.scala 202:23]
  wire  _GEN_1071 = io_fu_2_valid ? _GEN_999 : _GEN_927; // @[ROB.scala 202:23]
  wire  _GEN_1072 = io_fu_2_valid ? _GEN_1000 : _GEN_928; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1073 = io_fu_2_valid ? _GEN_1001 : _GEN_929; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1074 = io_fu_2_valid ? _GEN_1002 : _GEN_930; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1075 = io_fu_2_valid ? _GEN_1003 : _GEN_931; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1076 = io_fu_2_valid ? _GEN_1004 : _GEN_932; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1077 = io_fu_2_valid ? _GEN_1005 : _GEN_933; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1078 = io_fu_2_valid ? _GEN_1006 : _GEN_934; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1079 = io_fu_2_valid ? _GEN_1007 : _GEN_935; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1080 = io_fu_2_valid ? _GEN_1008 : _GEN_936; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1081 = io_fu_2_valid ? _GEN_1009 : _GEN_937; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1082 = io_fu_2_valid ? _GEN_1010 : _GEN_938; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1083 = io_fu_2_valid ? _GEN_1011 : _GEN_939; // @[ROB.scala 202:23]
  wire [31:0] _GEN_1084 = io_fu_2_valid ? _GEN_1012 : _GEN_940; // @[ROB.scala 202:23]
  wire  _GEN_1085 = io_fu_2_valid ? _GEN_1013 : _GEN_941; // @[ROB.scala 202:23]
  wire  _GEN_1086 = io_fu_2_valid ? _GEN_1014 : _GEN_942; // @[ROB.scala 202:23]
  wire  _GEN_1087 = io_fu_2_valid ? _GEN_1015 : _GEN_943; // @[ROB.scala 202:23]
  wire  _GEN_1088 = io_fu_2_valid ? _GEN_1016 : _GEN_944; // @[ROB.scala 202:23]
  wire  _GEN_1089 = io_fu_2_valid ? _GEN_1017 : _GEN_945; // @[ROB.scala 202:23]
  wire  _GEN_1090 = io_fu_2_valid ? _GEN_1018 : _GEN_946; // @[ROB.scala 202:23]
  wire  _GEN_1091 = io_fu_2_valid ? _GEN_1019 : _GEN_947; // @[ROB.scala 202:23]
  wire  _GEN_1092 = io_fu_2_valid ? _GEN_1020 : _GEN_948; // @[ROB.scala 202:23]
  wire  _GEN_1093 = io_fu_2_valid ? _GEN_1021 : _GEN_949; // @[ROB.scala 202:23]
  wire  _GEN_1094 = io_fu_2_valid ? _GEN_1022 : _GEN_950; // @[ROB.scala 202:23]
  wire  _GEN_1095 = io_fu_2_valid ? _GEN_1023 : _GEN_951; // @[ROB.scala 202:23]
  wire  _GEN_1096 = io_fu_2_valid ? _GEN_1024 : _GEN_952; // @[ROB.scala 202:23]
  wire [3:0] _T_53 = io_fu_3_bits_id - 4'h1; // @[ROB.scala 203:31]
  wire [1:0] _GEN_1109 = 4'h0 == _T_53 ? 2'h2 : _GEN_1037; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1110 = 4'h1 == _T_53 ? 2'h2 : _GEN_1038; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1111 = 4'h2 == _T_53 ? 2'h2 : _GEN_1039; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1112 = 4'h3 == _T_53 ? 2'h2 : _GEN_1040; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1113 = 4'h4 == _T_53 ? 2'h2 : _GEN_1041; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1114 = 4'h5 == _T_53 ? 2'h2 : _GEN_1042; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1115 = 4'h6 == _T_53 ? 2'h2 : _GEN_1043; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1116 = 4'h7 == _T_53 ? 2'h2 : _GEN_1044; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1117 = 4'h8 == _T_53 ? 2'h2 : _GEN_1045; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1118 = 4'h9 == _T_53 ? 2'h2 : _GEN_1046; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1119 = 4'ha == _T_53 ? 2'h2 : _GEN_1047; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1120 = 4'hb == _T_53 ? 2'h2 : _GEN_1048; // @[ROB.scala 204:{44,44}]
  wire [1:0] _GEN_1181 = io_fu_3_valid ? _GEN_1109 : _GEN_1037; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1182 = io_fu_3_valid ? _GEN_1110 : _GEN_1038; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1183 = io_fu_3_valid ? _GEN_1111 : _GEN_1039; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1184 = io_fu_3_valid ? _GEN_1112 : _GEN_1040; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1185 = io_fu_3_valid ? _GEN_1113 : _GEN_1041; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1186 = io_fu_3_valid ? _GEN_1114 : _GEN_1042; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1187 = io_fu_3_valid ? _GEN_1115 : _GEN_1043; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1188 = io_fu_3_valid ? _GEN_1116 : _GEN_1044; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1189 = io_fu_3_valid ? _GEN_1117 : _GEN_1045; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1190 = io_fu_3_valid ? _GEN_1118 : _GEN_1046; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1191 = io_fu_3_valid ? _GEN_1119 : _GEN_1047; // @[ROB.scala 202:23]
  wire [1:0] _GEN_1192 = io_fu_3_valid ? _GEN_1120 : _GEN_1048; // @[ROB.scala 202:23]
  wire [3:0] _T_65 = io_rs_0_bits_id - 4'h1; // @[ROB.scala 222:31]
  wire [1:0] _GEN_1241 = 4'h0 == _T_65 ? 2'h1 : _GEN_1181; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1242 = 4'h1 == _T_65 ? 2'h1 : _GEN_1182; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1243 = 4'h2 == _T_65 ? 2'h1 : _GEN_1183; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1244 = 4'h3 == _T_65 ? 2'h1 : _GEN_1184; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1245 = 4'h4 == _T_65 ? 2'h1 : _GEN_1185; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1246 = 4'h5 == _T_65 ? 2'h1 : _GEN_1186; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1247 = 4'h6 == _T_65 ? 2'h1 : _GEN_1187; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1248 = 4'h7 == _T_65 ? 2'h1 : _GEN_1188; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1249 = 4'h8 == _T_65 ? 2'h1 : _GEN_1189; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1250 = 4'h9 == _T_65 ? 2'h1 : _GEN_1190; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1251 = 4'ha == _T_65 ? 2'h1 : _GEN_1191; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1252 = 4'hb == _T_65 ? 2'h1 : _GEN_1192; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1253 = io_rs_0_valid ? _GEN_1241 : _GEN_1181; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1254 = io_rs_0_valid ? _GEN_1242 : _GEN_1182; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1255 = io_rs_0_valid ? _GEN_1243 : _GEN_1183; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1256 = io_rs_0_valid ? _GEN_1244 : _GEN_1184; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1257 = io_rs_0_valid ? _GEN_1245 : _GEN_1185; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1258 = io_rs_0_valid ? _GEN_1246 : _GEN_1186; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1259 = io_rs_0_valid ? _GEN_1247 : _GEN_1187; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1260 = io_rs_0_valid ? _GEN_1248 : _GEN_1188; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1261 = io_rs_0_valid ? _GEN_1249 : _GEN_1189; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1262 = io_rs_0_valid ? _GEN_1250 : _GEN_1190; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1263 = io_rs_0_valid ? _GEN_1251 : _GEN_1191; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1264 = io_rs_0_valid ? _GEN_1252 : _GEN_1192; // @[ROB.scala 221:22]
  wire [3:0] _T_67 = io_rs_1_bits_id - 4'h1; // @[ROB.scala 222:31]
  wire [1:0] _GEN_1265 = 4'h0 == _T_67 ? 2'h1 : _GEN_1253; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1266 = 4'h1 == _T_67 ? 2'h1 : _GEN_1254; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1267 = 4'h2 == _T_67 ? 2'h1 : _GEN_1255; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1268 = 4'h3 == _T_67 ? 2'h1 : _GEN_1256; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1269 = 4'h4 == _T_67 ? 2'h1 : _GEN_1257; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1270 = 4'h5 == _T_67 ? 2'h1 : _GEN_1258; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1271 = 4'h6 == _T_67 ? 2'h1 : _GEN_1259; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1272 = 4'h7 == _T_67 ? 2'h1 : _GEN_1260; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1273 = 4'h8 == _T_67 ? 2'h1 : _GEN_1261; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1274 = 4'h9 == _T_67 ? 2'h1 : _GEN_1262; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1275 = 4'ha == _T_67 ? 2'h1 : _GEN_1263; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1276 = 4'hb == _T_67 ? 2'h1 : _GEN_1264; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1277 = io_rs_1_valid ? _GEN_1265 : _GEN_1253; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1278 = io_rs_1_valid ? _GEN_1266 : _GEN_1254; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1279 = io_rs_1_valid ? _GEN_1267 : _GEN_1255; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1280 = io_rs_1_valid ? _GEN_1268 : _GEN_1256; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1281 = io_rs_1_valid ? _GEN_1269 : _GEN_1257; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1282 = io_rs_1_valid ? _GEN_1270 : _GEN_1258; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1283 = io_rs_1_valid ? _GEN_1271 : _GEN_1259; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1284 = io_rs_1_valid ? _GEN_1272 : _GEN_1260; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1285 = io_rs_1_valid ? _GEN_1273 : _GEN_1261; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1286 = io_rs_1_valid ? _GEN_1274 : _GEN_1262; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1287 = io_rs_1_valid ? _GEN_1275 : _GEN_1263; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1288 = io_rs_1_valid ? _GEN_1276 : _GEN_1264; // @[ROB.scala 221:22]
  wire [3:0] _T_69 = io_rs_2_bits_id - 4'h1; // @[ROB.scala 222:31]
  wire [1:0] _GEN_1289 = 4'h0 == _T_69 ? 2'h1 : _GEN_1277; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1290 = 4'h1 == _T_69 ? 2'h1 : _GEN_1278; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1291 = 4'h2 == _T_69 ? 2'h1 : _GEN_1279; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1292 = 4'h3 == _T_69 ? 2'h1 : _GEN_1280; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1293 = 4'h4 == _T_69 ? 2'h1 : _GEN_1281; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1294 = 4'h5 == _T_69 ? 2'h1 : _GEN_1282; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1295 = 4'h6 == _T_69 ? 2'h1 : _GEN_1283; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1296 = 4'h7 == _T_69 ? 2'h1 : _GEN_1284; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1297 = 4'h8 == _T_69 ? 2'h1 : _GEN_1285; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1298 = 4'h9 == _T_69 ? 2'h1 : _GEN_1286; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1299 = 4'ha == _T_69 ? 2'h1 : _GEN_1287; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1300 = 4'hb == _T_69 ? 2'h1 : _GEN_1288; // @[ROB.scala 222:{44,44}]
  wire [1:0] _GEN_1301 = io_rs_2_valid ? _GEN_1289 : _GEN_1277; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1302 = io_rs_2_valid ? _GEN_1290 : _GEN_1278; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1303 = io_rs_2_valid ? _GEN_1291 : _GEN_1279; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1304 = io_rs_2_valid ? _GEN_1292 : _GEN_1280; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1305 = io_rs_2_valid ? _GEN_1293 : _GEN_1281; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1306 = io_rs_2_valid ? _GEN_1294 : _GEN_1282; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1307 = io_rs_2_valid ? _GEN_1295 : _GEN_1283; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1308 = io_rs_2_valid ? _GEN_1296 : _GEN_1284; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1309 = io_rs_2_valid ? _GEN_1297 : _GEN_1285; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1310 = io_rs_2_valid ? _GEN_1298 : _GEN_1286; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1311 = io_rs_2_valid ? _GEN_1299 : _GEN_1287; // @[ROB.scala 221:22]
  wire [1:0] _GEN_1312 = io_rs_2_valid ? _GEN_1300 : _GEN_1288; // @[ROB.scala 221:22]
  wire [3:0] _T_71 = io_rs_3_bits_id - 4'h1; // @[ROB.scala 222:31]
  assign io_enq_ready = ~full & ~_GEN_11; // @[ROB.scala 144:27]
  assign io_deq_valid = _GEN_23 == 2'h2 & _GEN_35; // @[ROB.scala 145:52]
  assign io_deq_bits_rdWrEn = _GEN_59 != 5'h0; // @[ROB.scala 148:44]
  assign io_deq_bits_rd = 4'hb == head ? entries_11_rd : _GEN_58; // @[ROB.scala 147:{20,20}]
  assign io_deq_bits_data = 4'hb == head ? entries_11_data : _GEN_46; // @[ROB.scala 146:{22,22}]
  assign io_deq_bits_id = {{4'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 158:20]
  assign io_deq_bits_brAddr = 4'hb == head ? entries_11_brAddr : _GEN_94; // @[ROB.scala 151:{24,24}]
  assign io_deq_bits_brTaken = 4'hb == head ? entries_11_brTaken : _GEN_106; // @[ROB.scala 152:{25,25}]
  assign io_deq_bits_excpAddr = 4'hb == head ? entries_11_excpAddr : _GEN_154; // @[ROB.scala 156:{26,26}]
  assign io_deq_bits_excpValid = 4'hb == head ? entries_11_excpValid : _GEN_166; // @[ROB.scala 157:{27,27}]
  assign io_deq_bits_pc = 4'hb == head ? entries_11_pc : _GEN_70; // @[ROB.scala 149:{20,20}]
  assign io_deq_bits_inst = 4'hb == head ? entries_11_inst : _GEN_82; // @[ROB.scala 150:{22,22}]
  assign io_deq_bits_predictBrTaken = 4'hb == head ? entries_11_predictBrTaken : _GEN_118; // @[ROB.scala 153:{32,32}]
  assign io_deq_bits_predictID = 4'hb == head ? entries_11_predictID : _GEN_142; // @[ROB.scala 155:{27,27}]
  assign io_deq_bits_predictIdx = 4'hb == head ? entries_11_predictIdx : _GEN_130; // @[ROB.scala 154:{28,28}]
  assign io_read_0_busy = entries_0_busy; // @[ROB.scala 213:16]
  assign io_read_0_state = entries_0_state; // @[ROB.scala 215:17]
  assign io_read_0_rd = entries_0_rd; // @[ROB.scala 216:14]
  assign io_read_0_data = entries_0_data; // @[ROB.scala 214:16]
  assign io_read_1_busy = entries_1_busy; // @[ROB.scala 213:16]
  assign io_read_1_state = entries_1_state; // @[ROB.scala 215:17]
  assign io_read_1_rd = entries_1_rd; // @[ROB.scala 216:14]
  assign io_read_1_data = entries_1_data; // @[ROB.scala 214:16]
  assign io_read_2_busy = entries_2_busy; // @[ROB.scala 213:16]
  assign io_read_2_state = entries_2_state; // @[ROB.scala 215:17]
  assign io_read_2_rd = entries_2_rd; // @[ROB.scala 216:14]
  assign io_read_2_data = entries_2_data; // @[ROB.scala 214:16]
  assign io_read_3_busy = entries_3_busy; // @[ROB.scala 213:16]
  assign io_read_3_state = entries_3_state; // @[ROB.scala 215:17]
  assign io_read_3_rd = entries_3_rd; // @[ROB.scala 216:14]
  assign io_read_3_data = entries_3_data; // @[ROB.scala 214:16]
  assign io_read_4_busy = entries_4_busy; // @[ROB.scala 213:16]
  assign io_read_4_state = entries_4_state; // @[ROB.scala 215:17]
  assign io_read_4_rd = entries_4_rd; // @[ROB.scala 216:14]
  assign io_read_4_data = entries_4_data; // @[ROB.scala 214:16]
  assign io_read_5_busy = entries_5_busy; // @[ROB.scala 213:16]
  assign io_read_5_state = entries_5_state; // @[ROB.scala 215:17]
  assign io_read_5_rd = entries_5_rd; // @[ROB.scala 216:14]
  assign io_read_5_data = entries_5_data; // @[ROB.scala 214:16]
  assign io_read_6_busy = entries_6_busy; // @[ROB.scala 213:16]
  assign io_read_6_state = entries_6_state; // @[ROB.scala 215:17]
  assign io_read_6_rd = entries_6_rd; // @[ROB.scala 216:14]
  assign io_read_6_data = entries_6_data; // @[ROB.scala 214:16]
  assign io_read_7_busy = entries_7_busy; // @[ROB.scala 213:16]
  assign io_read_7_state = entries_7_state; // @[ROB.scala 215:17]
  assign io_read_7_rd = entries_7_rd; // @[ROB.scala 216:14]
  assign io_read_7_data = entries_7_data; // @[ROB.scala 214:16]
  assign io_read_8_busy = entries_8_busy; // @[ROB.scala 213:16]
  assign io_read_8_state = entries_8_state; // @[ROB.scala 215:17]
  assign io_read_8_rd = entries_8_rd; // @[ROB.scala 216:14]
  assign io_read_8_data = entries_8_data; // @[ROB.scala 214:16]
  assign io_read_9_busy = entries_9_busy; // @[ROB.scala 213:16]
  assign io_read_9_state = entries_9_state; // @[ROB.scala 215:17]
  assign io_read_9_rd = entries_9_rd; // @[ROB.scala 216:14]
  assign io_read_9_data = entries_9_data; // @[ROB.scala 214:16]
  assign io_read_10_busy = entries_10_busy; // @[ROB.scala 213:16]
  assign io_read_10_state = entries_10_state; // @[ROB.scala 215:17]
  assign io_read_10_rd = entries_10_rd; // @[ROB.scala 216:14]
  assign io_read_10_data = entries_10_data; // @[ROB.scala 214:16]
  assign io_read_11_busy = entries_11_busy; // @[ROB.scala 213:16]
  assign io_read_11_state = entries_11_state; // @[ROB.scala 215:17]
  assign io_read_11_rd = entries_11_rd; // @[ROB.scala 216:14]
  assign io_read_11_data = entries_11_data; // @[ROB.scala 214:16]
  assign io_id = tail + 4'h1; // @[ROB.scala 143:19]
  assign io_regStatus_0_owner = regResStat_0_owner; // @[ROB.scala 142:18]
  assign io_regStatus_1_owner = regResStat_1_owner; // @[ROB.scala 142:18]
  assign io_regStatus_2_owner = regResStat_2_owner; // @[ROB.scala 142:18]
  assign io_regStatus_3_owner = regResStat_3_owner; // @[ROB.scala 142:18]
  assign io_regStatus_4_owner = regResStat_4_owner; // @[ROB.scala 142:18]
  assign io_regStatus_5_owner = regResStat_5_owner; // @[ROB.scala 142:18]
  assign io_regStatus_6_owner = regResStat_6_owner; // @[ROB.scala 142:18]
  assign io_regStatus_7_owner = regResStat_7_owner; // @[ROB.scala 142:18]
  assign io_regStatus_8_owner = regResStat_8_owner; // @[ROB.scala 142:18]
  assign io_regStatus_9_owner = regResStat_9_owner; // @[ROB.scala 142:18]
  assign io_regStatus_10_owner = regResStat_10_owner; // @[ROB.scala 142:18]
  assign io_regStatus_11_owner = regResStat_11_owner; // @[ROB.scala 142:18]
  assign io_regStatus_12_owner = regResStat_12_owner; // @[ROB.scala 142:18]
  assign io_regStatus_13_owner = regResStat_13_owner; // @[ROB.scala 142:18]
  assign io_regStatus_14_owner = regResStat_14_owner; // @[ROB.scala 142:18]
  assign io_regStatus_15_owner = regResStat_15_owner; // @[ROB.scala 142:18]
  assign io_regStatus_16_owner = regResStat_16_owner; // @[ROB.scala 142:18]
  assign io_regStatus_17_owner = regResStat_17_owner; // @[ROB.scala 142:18]
  assign io_regStatus_18_owner = regResStat_18_owner; // @[ROB.scala 142:18]
  assign io_regStatus_19_owner = regResStat_19_owner; // @[ROB.scala 142:18]
  assign io_regStatus_20_owner = regResStat_20_owner; // @[ROB.scala 142:18]
  assign io_regStatus_21_owner = regResStat_21_owner; // @[ROB.scala 142:18]
  assign io_regStatus_22_owner = regResStat_22_owner; // @[ROB.scala 142:18]
  assign io_regStatus_23_owner = regResStat_23_owner; // @[ROB.scala 142:18]
  assign io_regStatus_24_owner = regResStat_24_owner; // @[ROB.scala 142:18]
  assign io_regStatus_25_owner = regResStat_25_owner; // @[ROB.scala 142:18]
  assign io_regStatus_26_owner = regResStat_26_owner; // @[ROB.scala 142:18]
  assign io_regStatus_27_owner = regResStat_27_owner; // @[ROB.scala 142:18]
  assign io_regStatus_28_owner = regResStat_28_owner; // @[ROB.scala 142:18]
  assign io_regStatus_29_owner = regResStat_29_owner; // @[ROB.scala 142:18]
  assign io_regStatus_30_owner = regResStat_30_owner; // @[ROB.scala 142:18]
  assign io_regStatus_31_owner = regResStat_31_owner; // @[ROB.scala 142:18]
  always @(posedge clock) begin
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_0_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h0 == head) begin // @[ROB.scala 179:28]
        entries_0_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_0_busy <= _GEN_308;
      end
    end else begin
      entries_0_busy <= _GEN_308;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h0 == _T_71) begin // @[ROB.scala 222:44]
        entries_0_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_0_state <= _GEN_1301;
      end
    end else begin
      entries_0_state <= _GEN_1301;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 165:26]
        entries_0_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 203:43]
        entries_0_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_0_data <= _GEN_1025;
      end
    end else begin
      entries_0_data <= _GEN_1025;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 205:45]
        entries_0_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_0_brAddr <= _GEN_1049;
      end
    end else begin
      entries_0_brAddr <= _GEN_1049;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 206:46]
        entries_0_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_0_brTaken <= _GEN_1061;
      end
    end else begin
      entries_0_brTaken <= _GEN_1061;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 168:38]
        entries_0_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 169:33]
        entries_0_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 170:34]
        entries_0_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 207:47]
        entries_0_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_0_excpAddr <= _GEN_1073;
      end
    end else begin
      entries_0_excpAddr <= _GEN_1073;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 208:48]
        entries_0_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_0_excpValid <= _GEN_1085;
      end
    end else begin
      entries_0_excpValid <= _GEN_1085;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 166:26]
        entries_0_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h0 == tail) begin // @[ROB.scala 167:28]
        entries_0_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_1_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h1 == head) begin // @[ROB.scala 179:28]
        entries_1_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_1_busy <= _GEN_309;
      end
    end else begin
      entries_1_busy <= _GEN_309;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h1 == _T_71) begin // @[ROB.scala 222:44]
        entries_1_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_1_state <= _GEN_1302;
      end
    end else begin
      entries_1_state <= _GEN_1302;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 165:26]
        entries_1_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 203:43]
        entries_1_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_1_data <= _GEN_1026;
      end
    end else begin
      entries_1_data <= _GEN_1026;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 205:45]
        entries_1_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_1_brAddr <= _GEN_1050;
      end
    end else begin
      entries_1_brAddr <= _GEN_1050;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 206:46]
        entries_1_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_1_brTaken <= _GEN_1062;
      end
    end else begin
      entries_1_brTaken <= _GEN_1062;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 168:38]
        entries_1_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 169:33]
        entries_1_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 170:34]
        entries_1_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 207:47]
        entries_1_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_1_excpAddr <= _GEN_1074;
      end
    end else begin
      entries_1_excpAddr <= _GEN_1074;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 208:48]
        entries_1_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_1_excpValid <= _GEN_1086;
      end
    end else begin
      entries_1_excpValid <= _GEN_1086;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 166:26]
        entries_1_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h1 == tail) begin // @[ROB.scala 167:28]
        entries_1_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_2_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h2 == head) begin // @[ROB.scala 179:28]
        entries_2_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_2_busy <= _GEN_310;
      end
    end else begin
      entries_2_busy <= _GEN_310;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h2 == _T_71) begin // @[ROB.scala 222:44]
        entries_2_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_2_state <= _GEN_1303;
      end
    end else begin
      entries_2_state <= _GEN_1303;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 165:26]
        entries_2_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 203:43]
        entries_2_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_2_data <= _GEN_1027;
      end
    end else begin
      entries_2_data <= _GEN_1027;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 205:45]
        entries_2_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_2_brAddr <= _GEN_1051;
      end
    end else begin
      entries_2_brAddr <= _GEN_1051;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 206:46]
        entries_2_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_2_brTaken <= _GEN_1063;
      end
    end else begin
      entries_2_brTaken <= _GEN_1063;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 168:38]
        entries_2_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 169:33]
        entries_2_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 170:34]
        entries_2_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 207:47]
        entries_2_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_2_excpAddr <= _GEN_1075;
      end
    end else begin
      entries_2_excpAddr <= _GEN_1075;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 208:48]
        entries_2_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_2_excpValid <= _GEN_1087;
      end
    end else begin
      entries_2_excpValid <= _GEN_1087;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 166:26]
        entries_2_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h2 == tail) begin // @[ROB.scala 167:28]
        entries_2_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_3_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h3 == head) begin // @[ROB.scala 179:28]
        entries_3_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_3_busy <= _GEN_311;
      end
    end else begin
      entries_3_busy <= _GEN_311;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h3 == _T_71) begin // @[ROB.scala 222:44]
        entries_3_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_3_state <= _GEN_1304;
      end
    end else begin
      entries_3_state <= _GEN_1304;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 165:26]
        entries_3_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 203:43]
        entries_3_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_3_data <= _GEN_1028;
      end
    end else begin
      entries_3_data <= _GEN_1028;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 205:45]
        entries_3_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_3_brAddr <= _GEN_1052;
      end
    end else begin
      entries_3_brAddr <= _GEN_1052;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 206:46]
        entries_3_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_3_brTaken <= _GEN_1064;
      end
    end else begin
      entries_3_brTaken <= _GEN_1064;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 168:38]
        entries_3_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 169:33]
        entries_3_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 170:34]
        entries_3_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 207:47]
        entries_3_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_3_excpAddr <= _GEN_1076;
      end
    end else begin
      entries_3_excpAddr <= _GEN_1076;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 208:48]
        entries_3_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_3_excpValid <= _GEN_1088;
      end
    end else begin
      entries_3_excpValid <= _GEN_1088;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 166:26]
        entries_3_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h3 == tail) begin // @[ROB.scala 167:28]
        entries_3_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_4_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h4 == head) begin // @[ROB.scala 179:28]
        entries_4_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_4_busy <= _GEN_312;
      end
    end else begin
      entries_4_busy <= _GEN_312;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h4 == _T_71) begin // @[ROB.scala 222:44]
        entries_4_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_4_state <= _GEN_1305;
      end
    end else begin
      entries_4_state <= _GEN_1305;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 165:26]
        entries_4_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 203:43]
        entries_4_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_4_data <= _GEN_1029;
      end
    end else begin
      entries_4_data <= _GEN_1029;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 205:45]
        entries_4_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_4_brAddr <= _GEN_1053;
      end
    end else begin
      entries_4_brAddr <= _GEN_1053;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 206:46]
        entries_4_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_4_brTaken <= _GEN_1065;
      end
    end else begin
      entries_4_brTaken <= _GEN_1065;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 168:38]
        entries_4_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 169:33]
        entries_4_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 170:34]
        entries_4_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 207:47]
        entries_4_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_4_excpAddr <= _GEN_1077;
      end
    end else begin
      entries_4_excpAddr <= _GEN_1077;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 208:48]
        entries_4_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_4_excpValid <= _GEN_1089;
      end
    end else begin
      entries_4_excpValid <= _GEN_1089;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 166:26]
        entries_4_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h4 == tail) begin // @[ROB.scala 167:28]
        entries_4_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_5_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h5 == head) begin // @[ROB.scala 179:28]
        entries_5_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_5_busy <= _GEN_313;
      end
    end else begin
      entries_5_busy <= _GEN_313;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h5 == _T_71) begin // @[ROB.scala 222:44]
        entries_5_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_5_state <= _GEN_1306;
      end
    end else begin
      entries_5_state <= _GEN_1306;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 165:26]
        entries_5_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 203:43]
        entries_5_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_5_data <= _GEN_1030;
      end
    end else begin
      entries_5_data <= _GEN_1030;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 205:45]
        entries_5_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_5_brAddr <= _GEN_1054;
      end
    end else begin
      entries_5_brAddr <= _GEN_1054;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 206:46]
        entries_5_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_5_brTaken <= _GEN_1066;
      end
    end else begin
      entries_5_brTaken <= _GEN_1066;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 168:38]
        entries_5_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 169:33]
        entries_5_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 170:34]
        entries_5_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 207:47]
        entries_5_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_5_excpAddr <= _GEN_1078;
      end
    end else begin
      entries_5_excpAddr <= _GEN_1078;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 208:48]
        entries_5_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_5_excpValid <= _GEN_1090;
      end
    end else begin
      entries_5_excpValid <= _GEN_1090;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 166:26]
        entries_5_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h5 == tail) begin // @[ROB.scala 167:28]
        entries_5_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_6_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h6 == head) begin // @[ROB.scala 179:28]
        entries_6_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_6_busy <= _GEN_314;
      end
    end else begin
      entries_6_busy <= _GEN_314;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h6 == _T_71) begin // @[ROB.scala 222:44]
        entries_6_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_6_state <= _GEN_1307;
      end
    end else begin
      entries_6_state <= _GEN_1307;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 165:26]
        entries_6_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 203:43]
        entries_6_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_6_data <= _GEN_1031;
      end
    end else begin
      entries_6_data <= _GEN_1031;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 205:45]
        entries_6_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_6_brAddr <= _GEN_1055;
      end
    end else begin
      entries_6_brAddr <= _GEN_1055;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 206:46]
        entries_6_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_6_brTaken <= _GEN_1067;
      end
    end else begin
      entries_6_brTaken <= _GEN_1067;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 168:38]
        entries_6_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 169:33]
        entries_6_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 170:34]
        entries_6_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 207:47]
        entries_6_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_6_excpAddr <= _GEN_1079;
      end
    end else begin
      entries_6_excpAddr <= _GEN_1079;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 208:48]
        entries_6_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_6_excpValid <= _GEN_1091;
      end
    end else begin
      entries_6_excpValid <= _GEN_1091;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 166:26]
        entries_6_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h6 == tail) begin // @[ROB.scala 167:28]
        entries_6_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_7_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h7 == head) begin // @[ROB.scala 179:28]
        entries_7_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_7_busy <= _GEN_315;
      end
    end else begin
      entries_7_busy <= _GEN_315;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h7 == _T_71) begin // @[ROB.scala 222:44]
        entries_7_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_7_state <= _GEN_1308;
      end
    end else begin
      entries_7_state <= _GEN_1308;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 165:26]
        entries_7_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 203:43]
        entries_7_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_7_data <= _GEN_1032;
      end
    end else begin
      entries_7_data <= _GEN_1032;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 205:45]
        entries_7_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_7_brAddr <= _GEN_1056;
      end
    end else begin
      entries_7_brAddr <= _GEN_1056;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 206:46]
        entries_7_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_7_brTaken <= _GEN_1068;
      end
    end else begin
      entries_7_brTaken <= _GEN_1068;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 168:38]
        entries_7_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 169:33]
        entries_7_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 170:34]
        entries_7_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 207:47]
        entries_7_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_7_excpAddr <= _GEN_1080;
      end
    end else begin
      entries_7_excpAddr <= _GEN_1080;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 208:48]
        entries_7_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_7_excpValid <= _GEN_1092;
      end
    end else begin
      entries_7_excpValid <= _GEN_1092;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 166:26]
        entries_7_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h7 == tail) begin // @[ROB.scala 167:28]
        entries_7_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_8_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h8 == head) begin // @[ROB.scala 179:28]
        entries_8_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_8_busy <= _GEN_316;
      end
    end else begin
      entries_8_busy <= _GEN_316;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h8 == _T_71) begin // @[ROB.scala 222:44]
        entries_8_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_8_state <= _GEN_1309;
      end
    end else begin
      entries_8_state <= _GEN_1309;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 165:26]
        entries_8_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 203:43]
        entries_8_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_8_data <= _GEN_1033;
      end
    end else begin
      entries_8_data <= _GEN_1033;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 205:45]
        entries_8_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_8_brAddr <= _GEN_1057;
      end
    end else begin
      entries_8_brAddr <= _GEN_1057;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 206:46]
        entries_8_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_8_brTaken <= _GEN_1069;
      end
    end else begin
      entries_8_brTaken <= _GEN_1069;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 168:38]
        entries_8_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 169:33]
        entries_8_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 170:34]
        entries_8_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 207:47]
        entries_8_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_8_excpAddr <= _GEN_1081;
      end
    end else begin
      entries_8_excpAddr <= _GEN_1081;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 208:48]
        entries_8_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_8_excpValid <= _GEN_1093;
      end
    end else begin
      entries_8_excpValid <= _GEN_1093;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 166:26]
        entries_8_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h8 == tail) begin // @[ROB.scala 167:28]
        entries_8_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_9_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'h9 == head) begin // @[ROB.scala 179:28]
        entries_9_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_9_busy <= _GEN_317;
      end
    end else begin
      entries_9_busy <= _GEN_317;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'h9 == _T_71) begin // @[ROB.scala 222:44]
        entries_9_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_9_state <= _GEN_1310;
      end
    end else begin
      entries_9_state <= _GEN_1310;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 165:26]
        entries_9_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 203:43]
        entries_9_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_9_data <= _GEN_1034;
      end
    end else begin
      entries_9_data <= _GEN_1034;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 205:45]
        entries_9_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_9_brAddr <= _GEN_1058;
      end
    end else begin
      entries_9_brAddr <= _GEN_1058;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 206:46]
        entries_9_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_9_brTaken <= _GEN_1070;
      end
    end else begin
      entries_9_brTaken <= _GEN_1070;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 168:38]
        entries_9_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 169:33]
        entries_9_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 170:34]
        entries_9_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 207:47]
        entries_9_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_9_excpAddr <= _GEN_1082;
      end
    end else begin
      entries_9_excpAddr <= _GEN_1082;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 208:48]
        entries_9_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_9_excpValid <= _GEN_1094;
      end
    end else begin
      entries_9_excpValid <= _GEN_1094;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 166:26]
        entries_9_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'h9 == tail) begin // @[ROB.scala 167:28]
        entries_9_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_10_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'ha == head) begin // @[ROB.scala 179:28]
        entries_10_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_10_busy <= _GEN_318;
      end
    end else begin
      entries_10_busy <= _GEN_318;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'ha == _T_71) begin // @[ROB.scala 222:44]
        entries_10_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_10_state <= _GEN_1311;
      end
    end else begin
      entries_10_state <= _GEN_1311;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 165:26]
        entries_10_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'ha == _T_53) begin // @[ROB.scala 203:43]
        entries_10_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_10_data <= _GEN_1035;
      end
    end else begin
      entries_10_data <= _GEN_1035;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'ha == _T_53) begin // @[ROB.scala 205:45]
        entries_10_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_10_brAddr <= _GEN_1059;
      end
    end else begin
      entries_10_brAddr <= _GEN_1059;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'ha == _T_53) begin // @[ROB.scala 206:46]
        entries_10_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_10_brTaken <= _GEN_1071;
      end
    end else begin
      entries_10_brTaken <= _GEN_1071;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 168:38]
        entries_10_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 169:33]
        entries_10_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 170:34]
        entries_10_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'ha == _T_53) begin // @[ROB.scala 207:47]
        entries_10_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_10_excpAddr <= _GEN_1083;
      end
    end else begin
      entries_10_excpAddr <= _GEN_1083;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'ha == _T_53) begin // @[ROB.scala 208:48]
        entries_10_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_10_excpValid <= _GEN_1095;
      end
    end else begin
      entries_10_excpValid <= _GEN_1095;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 166:26]
        entries_10_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'ha == tail) begin // @[ROB.scala 167:28]
        entries_10_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      entries_11_busy <= 1'h0; // @[ROB.scala 227:37]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (4'hb == head) begin // @[ROB.scala 179:28]
        entries_11_busy <= 1'h0; // @[ROB.scala 179:28]
      end else begin
        entries_11_busy <= _GEN_319;
      end
    end else begin
      entries_11_busy <= _GEN_319;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 221:22]
      if (4'hb == _T_71) begin // @[ROB.scala 222:44]
        entries_11_state <= 2'h1; // @[ROB.scala 222:44]
      end else begin
        entries_11_state <= _GEN_1312;
      end
    end else begin
      entries_11_state <= _GEN_1312;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 165:26]
        entries_11_rd <= io_enq_bits_rd; // @[ROB.scala 165:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'hb == _T_53) begin // @[ROB.scala 203:43]
        entries_11_data <= io_fu_3_bits_data; // @[ROB.scala 203:43]
      end else begin
        entries_11_data <= _GEN_1036;
      end
    end else begin
      entries_11_data <= _GEN_1036;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'hb == _T_53) begin // @[ROB.scala 205:45]
        entries_11_brAddr <= 32'h0; // @[ROB.scala 205:45]
      end else begin
        entries_11_brAddr <= _GEN_1060;
      end
    end else begin
      entries_11_brAddr <= _GEN_1060;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'hb == _T_53) begin // @[ROB.scala 206:46]
        entries_11_brTaken <= 1'h0; // @[ROB.scala 206:46]
      end else begin
        entries_11_brTaken <= _GEN_1072;
      end
    end else begin
      entries_11_brTaken <= _GEN_1072;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 168:38]
        entries_11_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 168:38]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 169:33]
        entries_11_predictID <= io_enq_bits_predictID; // @[ROB.scala 169:33]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 170:34]
        entries_11_predictIdx <= io_enq_bits_predictIdx; // @[ROB.scala 170:34]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'hb == _T_53) begin // @[ROB.scala 207:47]
        entries_11_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 207:47]
      end else begin
        entries_11_excpAddr <= _GEN_1084;
      end
    end else begin
      entries_11_excpAddr <= _GEN_1084;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 202:23]
      if (4'hb == _T_53) begin // @[ROB.scala 208:48]
        entries_11_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 208:48]
      end else begin
        entries_11_excpValid <= _GEN_1096;
      end
    end else begin
      entries_11_excpValid <= _GEN_1096;
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 166:26]
        entries_11_pc <= io_enq_bits_pc; // @[ROB.scala 166:26]
      end
    end
    if (_T) begin // @[ROB.scala 161:24]
      if (4'hb == tail) begin // @[ROB.scala 167:28]
        entries_11_inst <= io_enq_bits_inst; // @[ROB.scala 167:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_0_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h0 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_0_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_0_owner <= _GEN_404;
        end
      end else begin
        regResStat_0_owner <= _GEN_404;
      end
    end else begin
      regResStat_0_owner <= _GEN_404;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_1_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_1_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_1_owner <= _GEN_405;
        end
      end else begin
        regResStat_1_owner <= _GEN_405;
      end
    end else begin
      regResStat_1_owner <= _GEN_405;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_2_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h2 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_2_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_2_owner <= _GEN_406;
        end
      end else begin
        regResStat_2_owner <= _GEN_406;
      end
    end else begin
      regResStat_2_owner <= _GEN_406;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_3_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h3 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_3_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_3_owner <= _GEN_407;
        end
      end else begin
        regResStat_3_owner <= _GEN_407;
      end
    end else begin
      regResStat_3_owner <= _GEN_407;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_4_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h4 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_4_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_4_owner <= _GEN_408;
        end
      end else begin
        regResStat_4_owner <= _GEN_408;
      end
    end else begin
      regResStat_4_owner <= _GEN_408;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_5_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h5 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_5_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_5_owner <= _GEN_409;
        end
      end else begin
        regResStat_5_owner <= _GEN_409;
      end
    end else begin
      regResStat_5_owner <= _GEN_409;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_6_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h6 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_6_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_6_owner <= _GEN_410;
        end
      end else begin
        regResStat_6_owner <= _GEN_410;
      end
    end else begin
      regResStat_6_owner <= _GEN_410;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_7_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h7 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_7_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_7_owner <= _GEN_411;
        end
      end else begin
        regResStat_7_owner <= _GEN_411;
      end
    end else begin
      regResStat_7_owner <= _GEN_411;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_8_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h8 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_8_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_8_owner <= _GEN_412;
        end
      end else begin
        regResStat_8_owner <= _GEN_412;
      end
    end else begin
      regResStat_8_owner <= _GEN_412;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_9_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h9 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_9_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_9_owner <= _GEN_413;
        end
      end else begin
        regResStat_9_owner <= _GEN_413;
      end
    end else begin
      regResStat_9_owner <= _GEN_413;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_10_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'ha == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_10_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_10_owner <= _GEN_414;
        end
      end else begin
        regResStat_10_owner <= _GEN_414;
      end
    end else begin
      regResStat_10_owner <= _GEN_414;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_11_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'hb == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_11_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_11_owner <= _GEN_415;
        end
      end else begin
        regResStat_11_owner <= _GEN_415;
      end
    end else begin
      regResStat_11_owner <= _GEN_415;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_12_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'hc == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_12_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_12_owner <= _GEN_416;
        end
      end else begin
        regResStat_12_owner <= _GEN_416;
      end
    end else begin
      regResStat_12_owner <= _GEN_416;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_13_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'hd == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_13_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_13_owner <= _GEN_417;
        end
      end else begin
        regResStat_13_owner <= _GEN_417;
      end
    end else begin
      regResStat_13_owner <= _GEN_417;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_14_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'he == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_14_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_14_owner <= _GEN_418;
        end
      end else begin
        regResStat_14_owner <= _GEN_418;
      end
    end else begin
      regResStat_14_owner <= _GEN_418;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_15_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'hf == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_15_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_15_owner <= _GEN_419;
        end
      end else begin
        regResStat_15_owner <= _GEN_419;
      end
    end else begin
      regResStat_15_owner <= _GEN_419;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_16_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h10 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_16_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_16_owner <= _GEN_420;
        end
      end else begin
        regResStat_16_owner <= _GEN_420;
      end
    end else begin
      regResStat_16_owner <= _GEN_420;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_17_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h11 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_17_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_17_owner <= _GEN_421;
        end
      end else begin
        regResStat_17_owner <= _GEN_421;
      end
    end else begin
      regResStat_17_owner <= _GEN_421;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_18_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h12 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_18_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_18_owner <= _GEN_422;
        end
      end else begin
        regResStat_18_owner <= _GEN_422;
      end
    end else begin
      regResStat_18_owner <= _GEN_422;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_19_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h13 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_19_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_19_owner <= _GEN_423;
        end
      end else begin
        regResStat_19_owner <= _GEN_423;
      end
    end else begin
      regResStat_19_owner <= _GEN_423;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_20_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h14 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_20_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_20_owner <= _GEN_424;
        end
      end else begin
        regResStat_20_owner <= _GEN_424;
      end
    end else begin
      regResStat_20_owner <= _GEN_424;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_21_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h15 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_21_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_21_owner <= _GEN_425;
        end
      end else begin
        regResStat_21_owner <= _GEN_425;
      end
    end else begin
      regResStat_21_owner <= _GEN_425;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_22_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h16 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_22_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_22_owner <= _GEN_426;
        end
      end else begin
        regResStat_22_owner <= _GEN_426;
      end
    end else begin
      regResStat_22_owner <= _GEN_426;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_23_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h17 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_23_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_23_owner <= _GEN_427;
        end
      end else begin
        regResStat_23_owner <= _GEN_427;
      end
    end else begin
      regResStat_23_owner <= _GEN_427;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_24_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h18 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_24_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_24_owner <= _GEN_428;
        end
      end else begin
        regResStat_24_owner <= _GEN_428;
      end
    end else begin
      regResStat_24_owner <= _GEN_428;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_25_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h19 == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_25_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_25_owner <= _GEN_429;
        end
      end else begin
        regResStat_25_owner <= _GEN_429;
      end
    end else begin
      regResStat_25_owner <= _GEN_429;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_26_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1a == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_26_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_26_owner <= _GEN_430;
        end
      end else begin
        regResStat_26_owner <= _GEN_430;
      end
    end else begin
      regResStat_26_owner <= _GEN_430;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_27_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1b == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_27_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_27_owner <= _GEN_431;
        end
      end else begin
        regResStat_27_owner <= _GEN_431;
      end
    end else begin
      regResStat_27_owner <= _GEN_431;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_28_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1c == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_28_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_28_owner <= _GEN_432;
        end
      end else begin
        regResStat_28_owner <= _GEN_432;
      end
    end else begin
      regResStat_28_owner <= _GEN_432;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_29_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1d == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_29_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_29_owner <= _GEN_433;
        end
      end else begin
        regResStat_29_owner <= _GEN_433;
      end
    end else begin
      regResStat_29_owner <= _GEN_433;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_30_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1e == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_30_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_30_owner <= _GEN_434;
        end
      end else begin
        regResStat_30_owner <= _GEN_434;
      end
    end else begin
      regResStat_30_owner <= _GEN_434;
    end
    if (io_flush) begin // @[ROB.scala 226:21]
      regResStat_31_owner <= 8'h0; // @[ROB.scala 228:41]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (_GEN_516 == _GEN_1396 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 185:111]
        if (5'h1f == _GEN_59) begin // @[ROB.scala 186:42]
          regResStat_31_owner <= 8'h0; // @[ROB.scala 186:42]
        end else begin
          regResStat_31_owner <= _GEN_435;
        end
      end else begin
        regResStat_31_owner <= _GEN_435;
      end
    end else begin
      regResStat_31_owner <= _GEN_435;
    end
    if (reset) begin // @[ROB.scala 131:23]
      head <= 4'h0; // @[ROB.scala 131:23]
    end else if (io_flush) begin // @[ROB.scala 226:21]
      head <= 4'h0; // @[ROB.scala 229:14]
    end else if (io_deq_valid) begin // @[ROB.scala 178:24]
      if (head == 4'hb) begin // @[ROB.scala 189:20]
        head <= 4'h0;
      end else begin
        head <= _io_deq_bits_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 132:23]
      tail <= 4'h0; // @[ROB.scala 132:23]
    end else if (io_flush) begin // @[ROB.scala 226:21]
      tail <= 4'h0; // @[ROB.scala 230:14]
    end else if (_T) begin // @[ROB.scala 161:24]
      if (tail == 4'hb) begin // @[ROB.scala 175:20]
        tail <= 4'h0;
      end else begin
        tail <= _io_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 134:24]
      count <= 4'h0; // @[ROB.scala 134:24]
    end else if (io_flush) begin // @[ROB.scala 226:21]
      count <= 4'h0; // @[ROB.scala 231:15]
    end else if (~(io_deq_valid & _T)) begin // @[ROB.scala 192:43]
      if (io_deq_valid) begin // @[ROB.scala 196:27]
        count <= _count_T_3; // @[ROB.scala 197:19]
      end else begin
        count <= _GEN_662;
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
  entries_0_busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_state = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_rd = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_data = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_brAddr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_brTaken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_predictBrTaken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_predictID = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_predictIdx = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_excpAddr = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_excpValid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  entries_0_pc = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  entries_0_inst = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_busy = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_state = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_rd = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_data = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_brAddr = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_brTaken = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_predictBrTaken = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  entries_1_predictID = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_predictIdx = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  entries_1_excpAddr = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  entries_1_excpValid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entries_1_pc = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  entries_1_inst = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_busy = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entries_2_state = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  entries_2_rd = _RAND_28[4:0];
  _RAND_29 = {1{`RANDOM}};
  entries_2_data = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  entries_2_brAddr = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  entries_2_brTaken = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  entries_2_predictBrTaken = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entries_2_predictID = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  entries_2_predictIdx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  entries_2_excpAddr = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  entries_2_excpValid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  entries_2_pc = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  entries_2_inst = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entries_3_busy = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entries_3_state = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  entries_3_rd = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  entries_3_data = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  entries_3_brAddr = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  entries_3_brTaken = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entries_3_predictBrTaken = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entries_3_predictID = _RAND_46[7:0];
  _RAND_47 = {1{`RANDOM}};
  entries_3_predictIdx = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  entries_3_excpAddr = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  entries_3_excpValid = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_3_pc = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  entries_3_inst = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  entries_4_busy = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_4_state = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  entries_4_rd = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  entries_4_data = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_4_brAddr = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  entries_4_brTaken = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  entries_4_predictBrTaken = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  entries_4_predictID = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  entries_4_predictIdx = _RAND_60[3:0];
  _RAND_61 = {1{`RANDOM}};
  entries_4_excpAddr = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  entries_4_excpValid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  entries_4_pc = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  entries_4_inst = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  entries_5_busy = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  entries_5_state = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  entries_5_rd = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  entries_5_data = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  entries_5_brAddr = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  entries_5_brTaken = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  entries_5_predictBrTaken = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  entries_5_predictID = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  entries_5_predictIdx = _RAND_73[3:0];
  _RAND_74 = {1{`RANDOM}};
  entries_5_excpAddr = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  entries_5_excpValid = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  entries_5_pc = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entries_5_inst = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  entries_6_busy = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  entries_6_state = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  entries_6_rd = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  entries_6_data = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  entries_6_brAddr = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  entries_6_brTaken = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  entries_6_predictBrTaken = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  entries_6_predictID = _RAND_85[7:0];
  _RAND_86 = {1{`RANDOM}};
  entries_6_predictIdx = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  entries_6_excpAddr = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  entries_6_excpValid = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entries_6_pc = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  entries_6_inst = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  entries_7_busy = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  entries_7_state = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  entries_7_rd = _RAND_93[4:0];
  _RAND_94 = {1{`RANDOM}};
  entries_7_data = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  entries_7_brAddr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  entries_7_brTaken = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  entries_7_predictBrTaken = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  entries_7_predictID = _RAND_98[7:0];
  _RAND_99 = {1{`RANDOM}};
  entries_7_predictIdx = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  entries_7_excpAddr = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  entries_7_excpValid = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  entries_7_pc = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  entries_7_inst = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  entries_8_busy = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entries_8_state = _RAND_105[1:0];
  _RAND_106 = {1{`RANDOM}};
  entries_8_rd = _RAND_106[4:0];
  _RAND_107 = {1{`RANDOM}};
  entries_8_data = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  entries_8_brAddr = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entries_8_brTaken = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  entries_8_predictBrTaken = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entries_8_predictID = _RAND_111[7:0];
  _RAND_112 = {1{`RANDOM}};
  entries_8_predictIdx = _RAND_112[3:0];
  _RAND_113 = {1{`RANDOM}};
  entries_8_excpAddr = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  entries_8_excpValid = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  entries_8_pc = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  entries_8_inst = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  entries_9_busy = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  entries_9_state = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  entries_9_rd = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  entries_9_data = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  entries_9_brAddr = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  entries_9_brTaken = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  entries_9_predictBrTaken = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  entries_9_predictID = _RAND_124[7:0];
  _RAND_125 = {1{`RANDOM}};
  entries_9_predictIdx = _RAND_125[3:0];
  _RAND_126 = {1{`RANDOM}};
  entries_9_excpAddr = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  entries_9_excpValid = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  entries_9_pc = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  entries_9_inst = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  entries_10_busy = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  entries_10_state = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  entries_10_rd = _RAND_132[4:0];
  _RAND_133 = {1{`RANDOM}};
  entries_10_data = _RAND_133[31:0];
  _RAND_134 = {1{`RANDOM}};
  entries_10_brAddr = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  entries_10_brTaken = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  entries_10_predictBrTaken = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  entries_10_predictID = _RAND_137[7:0];
  _RAND_138 = {1{`RANDOM}};
  entries_10_predictIdx = _RAND_138[3:0];
  _RAND_139 = {1{`RANDOM}};
  entries_10_excpAddr = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  entries_10_excpValid = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  entries_10_pc = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  entries_10_inst = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  entries_11_busy = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  entries_11_state = _RAND_144[1:0];
  _RAND_145 = {1{`RANDOM}};
  entries_11_rd = _RAND_145[4:0];
  _RAND_146 = {1{`RANDOM}};
  entries_11_data = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  entries_11_brAddr = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  entries_11_brTaken = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  entries_11_predictBrTaken = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  entries_11_predictID = _RAND_150[7:0];
  _RAND_151 = {1{`RANDOM}};
  entries_11_predictIdx = _RAND_151[3:0];
  _RAND_152 = {1{`RANDOM}};
  entries_11_excpAddr = _RAND_152[31:0];
  _RAND_153 = {1{`RANDOM}};
  entries_11_excpValid = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  entries_11_pc = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  entries_11_inst = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  regResStat_0_owner = _RAND_156[7:0];
  _RAND_157 = {1{`RANDOM}};
  regResStat_1_owner = _RAND_157[7:0];
  _RAND_158 = {1{`RANDOM}};
  regResStat_2_owner = _RAND_158[7:0];
  _RAND_159 = {1{`RANDOM}};
  regResStat_3_owner = _RAND_159[7:0];
  _RAND_160 = {1{`RANDOM}};
  regResStat_4_owner = _RAND_160[7:0];
  _RAND_161 = {1{`RANDOM}};
  regResStat_5_owner = _RAND_161[7:0];
  _RAND_162 = {1{`RANDOM}};
  regResStat_6_owner = _RAND_162[7:0];
  _RAND_163 = {1{`RANDOM}};
  regResStat_7_owner = _RAND_163[7:0];
  _RAND_164 = {1{`RANDOM}};
  regResStat_8_owner = _RAND_164[7:0];
  _RAND_165 = {1{`RANDOM}};
  regResStat_9_owner = _RAND_165[7:0];
  _RAND_166 = {1{`RANDOM}};
  regResStat_10_owner = _RAND_166[7:0];
  _RAND_167 = {1{`RANDOM}};
  regResStat_11_owner = _RAND_167[7:0];
  _RAND_168 = {1{`RANDOM}};
  regResStat_12_owner = _RAND_168[7:0];
  _RAND_169 = {1{`RANDOM}};
  regResStat_13_owner = _RAND_169[7:0];
  _RAND_170 = {1{`RANDOM}};
  regResStat_14_owner = _RAND_170[7:0];
  _RAND_171 = {1{`RANDOM}};
  regResStat_15_owner = _RAND_171[7:0];
  _RAND_172 = {1{`RANDOM}};
  regResStat_16_owner = _RAND_172[7:0];
  _RAND_173 = {1{`RANDOM}};
  regResStat_17_owner = _RAND_173[7:0];
  _RAND_174 = {1{`RANDOM}};
  regResStat_18_owner = _RAND_174[7:0];
  _RAND_175 = {1{`RANDOM}};
  regResStat_19_owner = _RAND_175[7:0];
  _RAND_176 = {1{`RANDOM}};
  regResStat_20_owner = _RAND_176[7:0];
  _RAND_177 = {1{`RANDOM}};
  regResStat_21_owner = _RAND_177[7:0];
  _RAND_178 = {1{`RANDOM}};
  regResStat_22_owner = _RAND_178[7:0];
  _RAND_179 = {1{`RANDOM}};
  regResStat_23_owner = _RAND_179[7:0];
  _RAND_180 = {1{`RANDOM}};
  regResStat_24_owner = _RAND_180[7:0];
  _RAND_181 = {1{`RANDOM}};
  regResStat_25_owner = _RAND_181[7:0];
  _RAND_182 = {1{`RANDOM}};
  regResStat_26_owner = _RAND_182[7:0];
  _RAND_183 = {1{`RANDOM}};
  regResStat_27_owner = _RAND_183[7:0];
  _RAND_184 = {1{`RANDOM}};
  regResStat_28_owner = _RAND_184[7:0];
  _RAND_185 = {1{`RANDOM}};
  regResStat_29_owner = _RAND_185[7:0];
  _RAND_186 = {1{`RANDOM}};
  regResStat_30_owner = _RAND_186[7:0];
  _RAND_187 = {1{`RANDOM}};
  regResStat_31_owner = _RAND_187[7:0];
  _RAND_188 = {1{`RANDOM}};
  head = _RAND_188[3:0];
  _RAND_189 = {1{`RANDOM}};
  tail = _RAND_189[3:0];
  _RAND_190 = {1{`RANDOM}};
  count = _RAND_190[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
