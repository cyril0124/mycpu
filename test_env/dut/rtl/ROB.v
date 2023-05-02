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
`endif // RANDOMIZE_REG_INIT
  reg  entries_0_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_0_state; // @[ROB.scala 122:22]
  reg [4:0] entries_0_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_0_data; // @[ROB.scala 122:22]
  reg [31:0] entries_0_brAddr; // @[ROB.scala 122:22]
  reg  entries_0_brTaken; // @[ROB.scala 122:22]
  reg  entries_0_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_0_excpAddr; // @[ROB.scala 122:22]
  reg  entries_0_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_0_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_0_inst; // @[ROB.scala 122:22]
  reg  entries_1_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_1_state; // @[ROB.scala 122:22]
  reg [4:0] entries_1_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_1_data; // @[ROB.scala 122:22]
  reg [31:0] entries_1_brAddr; // @[ROB.scala 122:22]
  reg  entries_1_brTaken; // @[ROB.scala 122:22]
  reg  entries_1_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_1_excpAddr; // @[ROB.scala 122:22]
  reg  entries_1_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_1_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_1_inst; // @[ROB.scala 122:22]
  reg  entries_2_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_2_state; // @[ROB.scala 122:22]
  reg [4:0] entries_2_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_2_data; // @[ROB.scala 122:22]
  reg [31:0] entries_2_brAddr; // @[ROB.scala 122:22]
  reg  entries_2_brTaken; // @[ROB.scala 122:22]
  reg  entries_2_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_2_excpAddr; // @[ROB.scala 122:22]
  reg  entries_2_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_2_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_2_inst; // @[ROB.scala 122:22]
  reg  entries_3_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_3_state; // @[ROB.scala 122:22]
  reg [4:0] entries_3_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_3_data; // @[ROB.scala 122:22]
  reg [31:0] entries_3_brAddr; // @[ROB.scala 122:22]
  reg  entries_3_brTaken; // @[ROB.scala 122:22]
  reg  entries_3_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_3_excpAddr; // @[ROB.scala 122:22]
  reg  entries_3_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_3_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_3_inst; // @[ROB.scala 122:22]
  reg  entries_4_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_4_state; // @[ROB.scala 122:22]
  reg [4:0] entries_4_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_4_data; // @[ROB.scala 122:22]
  reg [31:0] entries_4_brAddr; // @[ROB.scala 122:22]
  reg  entries_4_brTaken; // @[ROB.scala 122:22]
  reg  entries_4_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_4_excpAddr; // @[ROB.scala 122:22]
  reg  entries_4_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_4_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_4_inst; // @[ROB.scala 122:22]
  reg  entries_5_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_5_state; // @[ROB.scala 122:22]
  reg [4:0] entries_5_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_5_data; // @[ROB.scala 122:22]
  reg [31:0] entries_5_brAddr; // @[ROB.scala 122:22]
  reg  entries_5_brTaken; // @[ROB.scala 122:22]
  reg  entries_5_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_5_excpAddr; // @[ROB.scala 122:22]
  reg  entries_5_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_5_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_5_inst; // @[ROB.scala 122:22]
  reg  entries_6_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_6_state; // @[ROB.scala 122:22]
  reg [4:0] entries_6_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_6_data; // @[ROB.scala 122:22]
  reg [31:0] entries_6_brAddr; // @[ROB.scala 122:22]
  reg  entries_6_brTaken; // @[ROB.scala 122:22]
  reg  entries_6_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_6_excpAddr; // @[ROB.scala 122:22]
  reg  entries_6_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_6_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_6_inst; // @[ROB.scala 122:22]
  reg  entries_7_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_7_state; // @[ROB.scala 122:22]
  reg [4:0] entries_7_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_7_data; // @[ROB.scala 122:22]
  reg [31:0] entries_7_brAddr; // @[ROB.scala 122:22]
  reg  entries_7_brTaken; // @[ROB.scala 122:22]
  reg  entries_7_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_7_excpAddr; // @[ROB.scala 122:22]
  reg  entries_7_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_7_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_7_inst; // @[ROB.scala 122:22]
  reg  entries_8_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_8_state; // @[ROB.scala 122:22]
  reg [4:0] entries_8_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_8_data; // @[ROB.scala 122:22]
  reg [31:0] entries_8_brAddr; // @[ROB.scala 122:22]
  reg  entries_8_brTaken; // @[ROB.scala 122:22]
  reg  entries_8_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_8_excpAddr; // @[ROB.scala 122:22]
  reg  entries_8_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_8_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_8_inst; // @[ROB.scala 122:22]
  reg  entries_9_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_9_state; // @[ROB.scala 122:22]
  reg [4:0] entries_9_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_9_data; // @[ROB.scala 122:22]
  reg [31:0] entries_9_brAddr; // @[ROB.scala 122:22]
  reg  entries_9_brTaken; // @[ROB.scala 122:22]
  reg  entries_9_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_9_excpAddr; // @[ROB.scala 122:22]
  reg  entries_9_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_9_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_9_inst; // @[ROB.scala 122:22]
  reg  entries_10_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_10_state; // @[ROB.scala 122:22]
  reg [4:0] entries_10_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_10_data; // @[ROB.scala 122:22]
  reg [31:0] entries_10_brAddr; // @[ROB.scala 122:22]
  reg  entries_10_brTaken; // @[ROB.scala 122:22]
  reg  entries_10_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_10_excpAddr; // @[ROB.scala 122:22]
  reg  entries_10_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_10_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_10_inst; // @[ROB.scala 122:22]
  reg  entries_11_busy; // @[ROB.scala 122:22]
  reg [1:0] entries_11_state; // @[ROB.scala 122:22]
  reg [4:0] entries_11_rd; // @[ROB.scala 122:22]
  reg [31:0] entries_11_data; // @[ROB.scala 122:22]
  reg [31:0] entries_11_brAddr; // @[ROB.scala 122:22]
  reg  entries_11_brTaken; // @[ROB.scala 122:22]
  reg  entries_11_predictBrTaken; // @[ROB.scala 122:22]
  reg [31:0] entries_11_excpAddr; // @[ROB.scala 122:22]
  reg  entries_11_excpValid; // @[ROB.scala 122:22]
  reg [31:0] entries_11_pc; // @[ROB.scala 122:22]
  reg [31:0] entries_11_inst; // @[ROB.scala 122:22]
  reg [7:0] regResStat_0_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_1_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_2_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_3_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_4_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_5_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_6_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_7_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_8_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_9_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_10_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_11_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_12_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_13_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_14_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_15_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_16_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_17_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_18_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_19_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_20_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_21_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_22_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_23_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_24_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_25_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_26_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_27_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_28_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_29_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_30_owner; // @[ROB.scala 123:25]
  reg [7:0] regResStat_31_owner; // @[ROB.scala 123:25]
  reg [3:0] head; // @[ROB.scala 125:23]
  reg [3:0] tail; // @[ROB.scala 126:23]
  reg [3:0] count; // @[ROB.scala 128:24]
  wire  full = count == 4'hc; // @[ROB.scala 129:22]
  wire [3:0] _io_id_T_1 = tail + 4'h1; // @[ROB.scala 137:19]
  wire  _GEN_1 = 4'h1 == tail ? entries_1_busy : entries_0_busy; // @[ROB.scala 138:{30,30}]
  wire  _GEN_2 = 4'h2 == tail ? entries_2_busy : _GEN_1; // @[ROB.scala 138:{30,30}]
  wire  _GEN_3 = 4'h3 == tail ? entries_3_busy : _GEN_2; // @[ROB.scala 138:{30,30}]
  wire  _GEN_4 = 4'h4 == tail ? entries_4_busy : _GEN_3; // @[ROB.scala 138:{30,30}]
  wire  _GEN_5 = 4'h5 == tail ? entries_5_busy : _GEN_4; // @[ROB.scala 138:{30,30}]
  wire  _GEN_6 = 4'h6 == tail ? entries_6_busy : _GEN_5; // @[ROB.scala 138:{30,30}]
  wire  _GEN_7 = 4'h7 == tail ? entries_7_busy : _GEN_6; // @[ROB.scala 138:{30,30}]
  wire  _GEN_8 = 4'h8 == tail ? entries_8_busy : _GEN_7; // @[ROB.scala 138:{30,30}]
  wire  _GEN_9 = 4'h9 == tail ? entries_9_busy : _GEN_8; // @[ROB.scala 138:{30,30}]
  wire  _GEN_10 = 4'ha == tail ? entries_10_busy : _GEN_9; // @[ROB.scala 138:{30,30}]
  wire  _GEN_11 = 4'hb == tail ? entries_11_busy : _GEN_10; // @[ROB.scala 138:{30,30}]
  wire [1:0] _GEN_13 = 4'h1 == head ? entries_1_state : entries_0_state; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_14 = 4'h2 == head ? entries_2_state : _GEN_13; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_15 = 4'h3 == head ? entries_3_state : _GEN_14; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_16 = 4'h4 == head ? entries_4_state : _GEN_15; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_17 = 4'h5 == head ? entries_5_state : _GEN_16; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_18 = 4'h6 == head ? entries_6_state : _GEN_17; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_19 = 4'h7 == head ? entries_7_state : _GEN_18; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_20 = 4'h8 == head ? entries_8_state : _GEN_19; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_21 = 4'h9 == head ? entries_9_state : _GEN_20; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_22 = 4'ha == head ? entries_10_state : _GEN_21; // @[ROB.scala 139:{41,41}]
  wire [1:0] _GEN_23 = 4'hb == head ? entries_11_state : _GEN_22; // @[ROB.scala 139:{41,41}]
  wire  _GEN_25 = 4'h1 == head ? entries_1_busy : entries_0_busy; // @[ROB.scala 139:{52,52}]
  wire  _GEN_26 = 4'h2 == head ? entries_2_busy : _GEN_25; // @[ROB.scala 139:{52,52}]
  wire  _GEN_27 = 4'h3 == head ? entries_3_busy : _GEN_26; // @[ROB.scala 139:{52,52}]
  wire  _GEN_28 = 4'h4 == head ? entries_4_busy : _GEN_27; // @[ROB.scala 139:{52,52}]
  wire  _GEN_29 = 4'h5 == head ? entries_5_busy : _GEN_28; // @[ROB.scala 139:{52,52}]
  wire  _GEN_30 = 4'h6 == head ? entries_6_busy : _GEN_29; // @[ROB.scala 139:{52,52}]
  wire  _GEN_31 = 4'h7 == head ? entries_7_busy : _GEN_30; // @[ROB.scala 139:{52,52}]
  wire  _GEN_32 = 4'h8 == head ? entries_8_busy : _GEN_31; // @[ROB.scala 139:{52,52}]
  wire  _GEN_33 = 4'h9 == head ? entries_9_busy : _GEN_32; // @[ROB.scala 139:{52,52}]
  wire  _GEN_34 = 4'ha == head ? entries_10_busy : _GEN_33; // @[ROB.scala 139:{52,52}]
  wire  _GEN_35 = 4'hb == head ? entries_11_busy : _GEN_34; // @[ROB.scala 139:{52,52}]
  wire [31:0] _GEN_37 = 4'h1 == head ? entries_1_data : entries_0_data; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_38 = 4'h2 == head ? entries_2_data : _GEN_37; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_39 = 4'h3 == head ? entries_3_data : _GEN_38; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_40 = 4'h4 == head ? entries_4_data : _GEN_39; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_41 = 4'h5 == head ? entries_5_data : _GEN_40; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_42 = 4'h6 == head ? entries_6_data : _GEN_41; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_43 = 4'h7 == head ? entries_7_data : _GEN_42; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_44 = 4'h8 == head ? entries_8_data : _GEN_43; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_45 = 4'h9 == head ? entries_9_data : _GEN_44; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_46 = 4'ha == head ? entries_10_data : _GEN_45; // @[ROB.scala 140:{22,22}]
  wire [4:0] _GEN_49 = 4'h1 == head ? entries_1_rd : entries_0_rd; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_50 = 4'h2 == head ? entries_2_rd : _GEN_49; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_51 = 4'h3 == head ? entries_3_rd : _GEN_50; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_52 = 4'h4 == head ? entries_4_rd : _GEN_51; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_53 = 4'h5 == head ? entries_5_rd : _GEN_52; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_54 = 4'h6 == head ? entries_6_rd : _GEN_53; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_55 = 4'h7 == head ? entries_7_rd : _GEN_54; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_56 = 4'h8 == head ? entries_8_rd : _GEN_55; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_57 = 4'h9 == head ? entries_9_rd : _GEN_56; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_58 = 4'ha == head ? entries_10_rd : _GEN_57; // @[ROB.scala 141:{20,20}]
  wire [4:0] _GEN_59 = 4'hb == head ? entries_11_rd : _GEN_58; // @[ROB.scala 141:{20,20}]
  wire [31:0] _GEN_61 = 4'h1 == head ? entries_1_pc : entries_0_pc; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_62 = 4'h2 == head ? entries_2_pc : _GEN_61; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_63 = 4'h3 == head ? entries_3_pc : _GEN_62; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_64 = 4'h4 == head ? entries_4_pc : _GEN_63; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_65 = 4'h5 == head ? entries_5_pc : _GEN_64; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_66 = 4'h6 == head ? entries_6_pc : _GEN_65; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_67 = 4'h7 == head ? entries_7_pc : _GEN_66; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_68 = 4'h8 == head ? entries_8_pc : _GEN_67; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_69 = 4'h9 == head ? entries_9_pc : _GEN_68; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_70 = 4'ha == head ? entries_10_pc : _GEN_69; // @[ROB.scala 143:{20,20}]
  wire [31:0] _GEN_73 = 4'h1 == head ? entries_1_inst : entries_0_inst; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_74 = 4'h2 == head ? entries_2_inst : _GEN_73; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_75 = 4'h3 == head ? entries_3_inst : _GEN_74; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_76 = 4'h4 == head ? entries_4_inst : _GEN_75; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_77 = 4'h5 == head ? entries_5_inst : _GEN_76; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_78 = 4'h6 == head ? entries_6_inst : _GEN_77; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_79 = 4'h7 == head ? entries_7_inst : _GEN_78; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_80 = 4'h8 == head ? entries_8_inst : _GEN_79; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_81 = 4'h9 == head ? entries_9_inst : _GEN_80; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_82 = 4'ha == head ? entries_10_inst : _GEN_81; // @[ROB.scala 144:{22,22}]
  wire [31:0] _GEN_85 = 4'h1 == head ? entries_1_brAddr : entries_0_brAddr; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_86 = 4'h2 == head ? entries_2_brAddr : _GEN_85; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_87 = 4'h3 == head ? entries_3_brAddr : _GEN_86; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_88 = 4'h4 == head ? entries_4_brAddr : _GEN_87; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_89 = 4'h5 == head ? entries_5_brAddr : _GEN_88; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_90 = 4'h6 == head ? entries_6_brAddr : _GEN_89; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_91 = 4'h7 == head ? entries_7_brAddr : _GEN_90; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_92 = 4'h8 == head ? entries_8_brAddr : _GEN_91; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_93 = 4'h9 == head ? entries_9_brAddr : _GEN_92; // @[ROB.scala 145:{24,24}]
  wire [31:0] _GEN_94 = 4'ha == head ? entries_10_brAddr : _GEN_93; // @[ROB.scala 145:{24,24}]
  wire  _GEN_97 = 4'h1 == head ? entries_1_brTaken : entries_0_brTaken; // @[ROB.scala 146:{25,25}]
  wire  _GEN_98 = 4'h2 == head ? entries_2_brTaken : _GEN_97; // @[ROB.scala 146:{25,25}]
  wire  _GEN_99 = 4'h3 == head ? entries_3_brTaken : _GEN_98; // @[ROB.scala 146:{25,25}]
  wire  _GEN_100 = 4'h4 == head ? entries_4_brTaken : _GEN_99; // @[ROB.scala 146:{25,25}]
  wire  _GEN_101 = 4'h5 == head ? entries_5_brTaken : _GEN_100; // @[ROB.scala 146:{25,25}]
  wire  _GEN_102 = 4'h6 == head ? entries_6_brTaken : _GEN_101; // @[ROB.scala 146:{25,25}]
  wire  _GEN_103 = 4'h7 == head ? entries_7_brTaken : _GEN_102; // @[ROB.scala 146:{25,25}]
  wire  _GEN_104 = 4'h8 == head ? entries_8_brTaken : _GEN_103; // @[ROB.scala 146:{25,25}]
  wire  _GEN_105 = 4'h9 == head ? entries_9_brTaken : _GEN_104; // @[ROB.scala 146:{25,25}]
  wire  _GEN_106 = 4'ha == head ? entries_10_brTaken : _GEN_105; // @[ROB.scala 146:{25,25}]
  wire  _GEN_109 = 4'h1 == head ? entries_1_predictBrTaken : entries_0_predictBrTaken; // @[ROB.scala 147:{32,32}]
  wire  _GEN_110 = 4'h2 == head ? entries_2_predictBrTaken : _GEN_109; // @[ROB.scala 147:{32,32}]
  wire  _GEN_111 = 4'h3 == head ? entries_3_predictBrTaken : _GEN_110; // @[ROB.scala 147:{32,32}]
  wire  _GEN_112 = 4'h4 == head ? entries_4_predictBrTaken : _GEN_111; // @[ROB.scala 147:{32,32}]
  wire  _GEN_113 = 4'h5 == head ? entries_5_predictBrTaken : _GEN_112; // @[ROB.scala 147:{32,32}]
  wire  _GEN_114 = 4'h6 == head ? entries_6_predictBrTaken : _GEN_113; // @[ROB.scala 147:{32,32}]
  wire  _GEN_115 = 4'h7 == head ? entries_7_predictBrTaken : _GEN_114; // @[ROB.scala 147:{32,32}]
  wire  _GEN_116 = 4'h8 == head ? entries_8_predictBrTaken : _GEN_115; // @[ROB.scala 147:{32,32}]
  wire  _GEN_117 = 4'h9 == head ? entries_9_predictBrTaken : _GEN_116; // @[ROB.scala 147:{32,32}]
  wire  _GEN_118 = 4'ha == head ? entries_10_predictBrTaken : _GEN_117; // @[ROB.scala 147:{32,32}]
  wire [31:0] _GEN_121 = 4'h1 == head ? entries_1_excpAddr : entries_0_excpAddr; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_122 = 4'h2 == head ? entries_2_excpAddr : _GEN_121; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_123 = 4'h3 == head ? entries_3_excpAddr : _GEN_122; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_124 = 4'h4 == head ? entries_4_excpAddr : _GEN_123; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_125 = 4'h5 == head ? entries_5_excpAddr : _GEN_124; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_126 = 4'h6 == head ? entries_6_excpAddr : _GEN_125; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_127 = 4'h7 == head ? entries_7_excpAddr : _GEN_126; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_128 = 4'h8 == head ? entries_8_excpAddr : _GEN_127; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_129 = 4'h9 == head ? entries_9_excpAddr : _GEN_128; // @[ROB.scala 148:{26,26}]
  wire [31:0] _GEN_130 = 4'ha == head ? entries_10_excpAddr : _GEN_129; // @[ROB.scala 148:{26,26}]
  wire  _GEN_133 = 4'h1 == head ? entries_1_excpValid : entries_0_excpValid; // @[ROB.scala 149:{27,27}]
  wire  _GEN_134 = 4'h2 == head ? entries_2_excpValid : _GEN_133; // @[ROB.scala 149:{27,27}]
  wire  _GEN_135 = 4'h3 == head ? entries_3_excpValid : _GEN_134; // @[ROB.scala 149:{27,27}]
  wire  _GEN_136 = 4'h4 == head ? entries_4_excpValid : _GEN_135; // @[ROB.scala 149:{27,27}]
  wire  _GEN_137 = 4'h5 == head ? entries_5_excpValid : _GEN_136; // @[ROB.scala 149:{27,27}]
  wire  _GEN_138 = 4'h6 == head ? entries_6_excpValid : _GEN_137; // @[ROB.scala 149:{27,27}]
  wire  _GEN_139 = 4'h7 == head ? entries_7_excpValid : _GEN_138; // @[ROB.scala 149:{27,27}]
  wire  _GEN_140 = 4'h8 == head ? entries_8_excpValid : _GEN_139; // @[ROB.scala 149:{27,27}]
  wire  _GEN_141 = 4'h9 == head ? entries_9_excpValid : _GEN_140; // @[ROB.scala 149:{27,27}]
  wire  _GEN_142 = 4'ha == head ? entries_10_excpValid : _GEN_141; // @[ROB.scala 149:{27,27}]
  wire [3:0] _io_deq_bits_id_T_1 = head + 4'h1; // @[ROB.scala 150:28]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_144 = 4'h0 == tail | entries_0_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_145 = 4'h1 == tail | entries_1_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_146 = 4'h2 == tail | entries_2_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_147 = 4'h3 == tail | entries_3_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_148 = 4'h4 == tail | entries_4_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_149 = 4'h5 == tail | entries_5_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_150 = 4'h6 == tail | entries_6_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_151 = 4'h7 == tail | entries_7_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_152 = 4'h8 == tail | entries_8_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_153 = 4'h9 == tail | entries_9_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_154 = 4'ha == tail | entries_10_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire  _GEN_155 = 4'hb == tail | entries_11_busy; // @[ROB.scala 122:22 154:{28,28}]
  wire [1:0] _GEN_156 = 4'h0 == tail ? 2'h0 : entries_0_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_157 = 4'h1 == tail ? 2'h0 : entries_1_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_158 = 4'h2 == tail ? 2'h0 : entries_2_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_159 = 4'h3 == tail ? 2'h0 : entries_3_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_160 = 4'h4 == tail ? 2'h0 : entries_4_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_161 = 4'h5 == tail ? 2'h0 : entries_5_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_162 = 4'h6 == tail ? 2'h0 : entries_6_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_163 = 4'h7 == tail ? 2'h0 : entries_7_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_164 = 4'h8 == tail ? 2'h0 : entries_8_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_165 = 4'h9 == tail ? 2'h0 : entries_9_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_166 = 4'ha == tail ? 2'h0 : entries_10_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [1:0] _GEN_167 = 4'hb == tail ? 2'h0 : entries_11_state; // @[ROB.scala 122:22 155:{29,29}]
  wire [3:0] _regResStat_owner_T_3 = io_enq_bits_rd == 5'h0 ? 4'h0 : _io_id_T_1; // @[ROB.scala 163:36]
  wire [7:0] _regResStat_io_enq_bits_rd_owner = {{4'd0}, _regResStat_owner_T_3}; // @[ROB.scala 163:{30,30}]
  wire [7:0] _GEN_228 = 5'h0 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_0_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_229 = 5'h1 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_1_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_230 = 5'h2 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_2_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_231 = 5'h3 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_3_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_232 = 5'h4 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_4_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_233 = 5'h5 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_5_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_234 = 5'h6 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_6_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_235 = 5'h7 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_7_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_236 = 5'h8 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_8_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_237 = 5'h9 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_9_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_238 = 5'ha == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_10_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_239 = 5'hb == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_11_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_240 = 5'hc == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_12_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_241 = 5'hd == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_13_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_242 = 5'he == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_14_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_243 = 5'hf == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_15_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_244 = 5'h10 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_16_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_245 = 5'h11 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_17_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_246 = 5'h12 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_18_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_247 = 5'h13 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_19_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_248 = 5'h14 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_20_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_249 = 5'h15 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_21_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_250 = 5'h16 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_22_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_251 = 5'h17 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_23_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_252 = 5'h18 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_24_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_253 = 5'h19 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_25_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_254 = 5'h1a == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_26_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_255 = 5'h1b == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_27_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_256 = 5'h1c == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_28_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_257 = 5'h1d == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_29_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_258 = 5'h1e == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_30_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire [7:0] _GEN_259 = 5'h1f == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_31_owner; // @[ROB.scala 123:25 163:{30,30}]
  wire  _GEN_260 = _T ? _GEN_144 : entries_0_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_261 = _T ? _GEN_145 : entries_1_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_262 = _T ? _GEN_146 : entries_2_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_263 = _T ? _GEN_147 : entries_3_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_264 = _T ? _GEN_148 : entries_4_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_265 = _T ? _GEN_149 : entries_5_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_266 = _T ? _GEN_150 : entries_6_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_267 = _T ? _GEN_151 : entries_7_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_268 = _T ? _GEN_152 : entries_8_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_269 = _T ? _GEN_153 : entries_9_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_270 = _T ? _GEN_154 : entries_10_busy; // @[ROB.scala 122:22 153:24]
  wire  _GEN_271 = _T ? _GEN_155 : entries_11_busy; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_272 = _T ? _GEN_156 : entries_0_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_273 = _T ? _GEN_157 : entries_1_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_274 = _T ? _GEN_158 : entries_2_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_275 = _T ? _GEN_159 : entries_3_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_276 = _T ? _GEN_160 : entries_4_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_277 = _T ? _GEN_161 : entries_5_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_278 = _T ? _GEN_162 : entries_6_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_279 = _T ? _GEN_163 : entries_7_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_280 = _T ? _GEN_164 : entries_8_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_281 = _T ? _GEN_165 : entries_9_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_282 = _T ? _GEN_166 : entries_10_state; // @[ROB.scala 122:22 153:24]
  wire [1:0] _GEN_283 = _T ? _GEN_167 : entries_11_state; // @[ROB.scala 122:22 153:24]
  wire [7:0] _GEN_332 = _T ? _GEN_228 : regResStat_0_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_333 = _T ? _GEN_229 : regResStat_1_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_334 = _T ? _GEN_230 : regResStat_2_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_335 = _T ? _GEN_231 : regResStat_3_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_336 = _T ? _GEN_232 : regResStat_4_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_337 = _T ? _GEN_233 : regResStat_5_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_338 = _T ? _GEN_234 : regResStat_6_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_339 = _T ? _GEN_235 : regResStat_7_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_340 = _T ? _GEN_236 : regResStat_8_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_341 = _T ? _GEN_237 : regResStat_9_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_342 = _T ? _GEN_238 : regResStat_10_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_343 = _T ? _GEN_239 : regResStat_11_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_344 = _T ? _GEN_240 : regResStat_12_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_345 = _T ? _GEN_241 : regResStat_13_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_346 = _T ? _GEN_242 : regResStat_14_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_347 = _T ? _GEN_243 : regResStat_15_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_348 = _T ? _GEN_244 : regResStat_16_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_349 = _T ? _GEN_245 : regResStat_17_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_350 = _T ? _GEN_246 : regResStat_18_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_351 = _T ? _GEN_247 : regResStat_19_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_352 = _T ? _GEN_248 : regResStat_20_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_353 = _T ? _GEN_249 : regResStat_21_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_354 = _T ? _GEN_250 : regResStat_22_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_355 = _T ? _GEN_251 : regResStat_23_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_356 = _T ? _GEN_252 : regResStat_24_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_357 = _T ? _GEN_253 : regResStat_25_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_358 = _T ? _GEN_254 : regResStat_26_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_359 = _T ? _GEN_255 : regResStat_27_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_360 = _T ? _GEN_256 : regResStat_28_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_361 = _T ? _GEN_257 : regResStat_29_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_362 = _T ? _GEN_258 : regResStat_30_owner; // @[ROB.scala 153:24 123:25]
  wire [7:0] _GEN_363 = _T ? _GEN_259 : regResStat_31_owner; // @[ROB.scala 153:24 123:25]
  wire [1:0] _GEN_377 = 4'h0 == head ? 2'h3 : _GEN_272; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_378 = 4'h1 == head ? 2'h3 : _GEN_273; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_379 = 4'h2 == head ? 2'h3 : _GEN_274; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_380 = 4'h3 == head ? 2'h3 : _GEN_275; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_381 = 4'h4 == head ? 2'h3 : _GEN_276; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_382 = 4'h5 == head ? 2'h3 : _GEN_277; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_383 = 4'h6 == head ? 2'h3 : _GEN_278; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_384 = 4'h7 == head ? 2'h3 : _GEN_279; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_385 = 4'h8 == head ? 2'h3 : _GEN_280; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_386 = 4'h9 == head ? 2'h3 : _GEN_281; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_387 = 4'ha == head ? 2'h3 : _GEN_282; // @[ROB.scala 170:{29,29}]
  wire [1:0] _GEN_388 = 4'hb == head ? 2'h3 : _GEN_283; // @[ROB.scala 170:{29,29}]
  wire  _GEN_389 = 4'h0 == head ? 1'h0 : entries_0_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_390 = 4'h1 == head ? 1'h0 : entries_1_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_391 = 4'h2 == head ? 1'h0 : entries_2_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_392 = 4'h3 == head ? 1'h0 : entries_3_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_393 = 4'h4 == head ? 1'h0 : entries_4_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_394 = 4'h5 == head ? 1'h0 : entries_5_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_395 = 4'h6 == head ? 1'h0 : entries_6_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_396 = 4'h7 == head ? 1'h0 : entries_7_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_397 = 4'h8 == head ? 1'h0 : entries_8_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_398 = 4'h9 == head ? 1'h0 : entries_9_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_399 = 4'ha == head ? 1'h0 : entries_10_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_400 = 4'hb == head ? 1'h0 : entries_11_brTaken; // @[ROB.scala 122:22 171:{31,31}]
  wire  _GEN_401 = 4'h0 == head ? 1'h0 : entries_0_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_402 = 4'h1 == head ? 1'h0 : entries_1_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_403 = 4'h2 == head ? 1'h0 : entries_2_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_404 = 4'h3 == head ? 1'h0 : entries_3_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_405 = 4'h4 == head ? 1'h0 : entries_4_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_406 = 4'h5 == head ? 1'h0 : entries_5_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_407 = 4'h6 == head ? 1'h0 : entries_6_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_408 = 4'h7 == head ? 1'h0 : entries_7_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_409 = 4'h8 == head ? 1'h0 : entries_8_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_410 = 4'h9 == head ? 1'h0 : entries_9_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_411 = 4'ha == head ? 1'h0 : entries_10_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire  _GEN_412 = 4'hb == head ? 1'h0 : entries_11_excpValid; // @[ROB.scala 122:22 172:{33,33}]
  wire [7:0] _GEN_414 = 5'h1 == _GEN_59 ? regResStat_1_owner : regResStat_0_owner; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_415 = 5'h2 == _GEN_59 ? regResStat_2_owner : _GEN_414; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_416 = 5'h3 == _GEN_59 ? regResStat_3_owner : _GEN_415; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_417 = 5'h4 == _GEN_59 ? regResStat_4_owner : _GEN_416; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_418 = 5'h5 == _GEN_59 ? regResStat_5_owner : _GEN_417; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_419 = 5'h6 == _GEN_59 ? regResStat_6_owner : _GEN_418; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_420 = 5'h7 == _GEN_59 ? regResStat_7_owner : _GEN_419; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_421 = 5'h8 == _GEN_59 ? regResStat_8_owner : _GEN_420; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_422 = 5'h9 == _GEN_59 ? regResStat_9_owner : _GEN_421; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_423 = 5'ha == _GEN_59 ? regResStat_10_owner : _GEN_422; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_424 = 5'hb == _GEN_59 ? regResStat_11_owner : _GEN_423; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_425 = 5'hc == _GEN_59 ? regResStat_12_owner : _GEN_424; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_426 = 5'hd == _GEN_59 ? regResStat_13_owner : _GEN_425; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_427 = 5'he == _GEN_59 ? regResStat_14_owner : _GEN_426; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_428 = 5'hf == _GEN_59 ? regResStat_15_owner : _GEN_427; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_429 = 5'h10 == _GEN_59 ? regResStat_16_owner : _GEN_428; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_430 = 5'h11 == _GEN_59 ? regResStat_17_owner : _GEN_429; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_431 = 5'h12 == _GEN_59 ? regResStat_18_owner : _GEN_430; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_432 = 5'h13 == _GEN_59 ? regResStat_19_owner : _GEN_431; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_433 = 5'h14 == _GEN_59 ? regResStat_20_owner : _GEN_432; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_434 = 5'h15 == _GEN_59 ? regResStat_21_owner : _GEN_433; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_435 = 5'h16 == _GEN_59 ? regResStat_22_owner : _GEN_434; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_436 = 5'h17 == _GEN_59 ? regResStat_23_owner : _GEN_435; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_437 = 5'h18 == _GEN_59 ? regResStat_24_owner : _GEN_436; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_438 = 5'h19 == _GEN_59 ? regResStat_25_owner : _GEN_437; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_439 = 5'h1a == _GEN_59 ? regResStat_26_owner : _GEN_438; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_440 = 5'h1b == _GEN_59 ? regResStat_27_owner : _GEN_439; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_441 = 5'h1c == _GEN_59 ? regResStat_28_owner : _GEN_440; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_442 = 5'h1d == _GEN_59 ? regResStat_29_owner : _GEN_441; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_443 = 5'h1e == _GEN_59 ? regResStat_30_owner : _GEN_442; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_444 = 5'h1f == _GEN_59 ? regResStat_31_owner : _GEN_443; // @[ROB.scala 175:{43,43}]
  wire [7:0] _GEN_1324 = {{4'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 175:43]
  wire [1:0] _GEN_521 = io_deq_valid ? _GEN_377 : _GEN_272; // @[ROB.scala 168:24]
  wire [1:0] _GEN_522 = io_deq_valid ? _GEN_378 : _GEN_273; // @[ROB.scala 168:24]
  wire [1:0] _GEN_523 = io_deq_valid ? _GEN_379 : _GEN_274; // @[ROB.scala 168:24]
  wire [1:0] _GEN_524 = io_deq_valid ? _GEN_380 : _GEN_275; // @[ROB.scala 168:24]
  wire [1:0] _GEN_525 = io_deq_valid ? _GEN_381 : _GEN_276; // @[ROB.scala 168:24]
  wire [1:0] _GEN_526 = io_deq_valid ? _GEN_382 : _GEN_277; // @[ROB.scala 168:24]
  wire [1:0] _GEN_527 = io_deq_valid ? _GEN_383 : _GEN_278; // @[ROB.scala 168:24]
  wire [1:0] _GEN_528 = io_deq_valid ? _GEN_384 : _GEN_279; // @[ROB.scala 168:24]
  wire [1:0] _GEN_529 = io_deq_valid ? _GEN_385 : _GEN_280; // @[ROB.scala 168:24]
  wire [1:0] _GEN_530 = io_deq_valid ? _GEN_386 : _GEN_281; // @[ROB.scala 168:24]
  wire [1:0] _GEN_531 = io_deq_valid ? _GEN_387 : _GEN_282; // @[ROB.scala 168:24]
  wire [1:0] _GEN_532 = io_deq_valid ? _GEN_388 : _GEN_283; // @[ROB.scala 168:24]
  wire  _GEN_533 = io_deq_valid ? _GEN_389 : entries_0_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_534 = io_deq_valid ? _GEN_390 : entries_1_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_535 = io_deq_valid ? _GEN_391 : entries_2_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_536 = io_deq_valid ? _GEN_392 : entries_3_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_537 = io_deq_valid ? _GEN_393 : entries_4_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_538 = io_deq_valid ? _GEN_394 : entries_5_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_539 = io_deq_valid ? _GEN_395 : entries_6_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_540 = io_deq_valid ? _GEN_396 : entries_7_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_541 = io_deq_valid ? _GEN_397 : entries_8_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_542 = io_deq_valid ? _GEN_398 : entries_9_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_543 = io_deq_valid ? _GEN_399 : entries_10_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_544 = io_deq_valid ? _GEN_400 : entries_11_brTaken; // @[ROB.scala 122:22 168:24]
  wire  _GEN_545 = io_deq_valid ? _GEN_401 : entries_0_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_546 = io_deq_valid ? _GEN_402 : entries_1_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_547 = io_deq_valid ? _GEN_403 : entries_2_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_548 = io_deq_valid ? _GEN_404 : entries_3_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_549 = io_deq_valid ? _GEN_405 : entries_4_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_550 = io_deq_valid ? _GEN_406 : entries_5_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_551 = io_deq_valid ? _GEN_407 : entries_6_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_552 = io_deq_valid ? _GEN_408 : entries_7_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_553 = io_deq_valid ? _GEN_409 : entries_8_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_554 = io_deq_valid ? _GEN_410 : entries_9_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_555 = io_deq_valid ? _GEN_411 : entries_10_excpValid; // @[ROB.scala 122:22 168:24]
  wire  _GEN_556 = io_deq_valid ? _GEN_412 : entries_11_excpValid; // @[ROB.scala 122:22 168:24]
  wire [3:0] _count_T_1 = count + 4'h1; // @[ROB.scala 184:28]
  wire [3:0] _GEN_590 = _T ? _count_T_1 : count; // @[ROB.scala 183:27 184:19 128:24]
  wire [3:0] _count_T_3 = count - 4'h1; // @[ROB.scala 187:28]
  wire [3:0] _T_17 = io_fu_0_bits_id - 4'h1; // @[ROB.scala 193:31]
  wire [31:0] _GEN_593 = 4'h0 == _T_17 ? io_fu_0_bits_data : entries_0_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_594 = 4'h1 == _T_17 ? io_fu_0_bits_data : entries_1_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_595 = 4'h2 == _T_17 ? io_fu_0_bits_data : entries_2_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_596 = 4'h3 == _T_17 ? io_fu_0_bits_data : entries_3_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_597 = 4'h4 == _T_17 ? io_fu_0_bits_data : entries_4_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_598 = 4'h5 == _T_17 ? io_fu_0_bits_data : entries_5_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_599 = 4'h6 == _T_17 ? io_fu_0_bits_data : entries_6_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_600 = 4'h7 == _T_17 ? io_fu_0_bits_data : entries_7_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_601 = 4'h8 == _T_17 ? io_fu_0_bits_data : entries_8_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_602 = 4'h9 == _T_17 ? io_fu_0_bits_data : entries_9_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_603 = 4'ha == _T_17 ? io_fu_0_bits_data : entries_10_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [31:0] _GEN_604 = 4'hb == _T_17 ? io_fu_0_bits_data : entries_11_data; // @[ROB.scala 122:22 193:{43,43}]
  wire [1:0] _GEN_605 = 4'h0 == _T_17 ? 2'h2 : _GEN_521; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_606 = 4'h1 == _T_17 ? 2'h2 : _GEN_522; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_607 = 4'h2 == _T_17 ? 2'h2 : _GEN_523; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_608 = 4'h3 == _T_17 ? 2'h2 : _GEN_524; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_609 = 4'h4 == _T_17 ? 2'h2 : _GEN_525; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_610 = 4'h5 == _T_17 ? 2'h2 : _GEN_526; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_611 = 4'h6 == _T_17 ? 2'h2 : _GEN_527; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_612 = 4'h7 == _T_17 ? 2'h2 : _GEN_528; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_613 = 4'h8 == _T_17 ? 2'h2 : _GEN_529; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_614 = 4'h9 == _T_17 ? 2'h2 : _GEN_530; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_615 = 4'ha == _T_17 ? 2'h2 : _GEN_531; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_616 = 4'hb == _T_17 ? 2'h2 : _GEN_532; // @[ROB.scala 194:{44,44}]
  wire [31:0] _GEN_617 = 4'h0 == _T_17 ? 32'h0 : entries_0_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_618 = 4'h1 == _T_17 ? 32'h0 : entries_1_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_619 = 4'h2 == _T_17 ? 32'h0 : entries_2_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_620 = 4'h3 == _T_17 ? 32'h0 : entries_3_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_621 = 4'h4 == _T_17 ? 32'h0 : entries_4_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_622 = 4'h5 == _T_17 ? 32'h0 : entries_5_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_623 = 4'h6 == _T_17 ? 32'h0 : entries_6_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_624 = 4'h7 == _T_17 ? 32'h0 : entries_7_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_625 = 4'h8 == _T_17 ? 32'h0 : entries_8_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_626 = 4'h9 == _T_17 ? 32'h0 : entries_9_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_627 = 4'ha == _T_17 ? 32'h0 : entries_10_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire [31:0] _GEN_628 = 4'hb == _T_17 ? 32'h0 : entries_11_brAddr; // @[ROB.scala 122:22 195:{45,45}]
  wire  _GEN_629 = 4'h0 == _T_17 ? 1'h0 : _GEN_533; // @[ROB.scala 196:{46,46}]
  wire  _GEN_630 = 4'h1 == _T_17 ? 1'h0 : _GEN_534; // @[ROB.scala 196:{46,46}]
  wire  _GEN_631 = 4'h2 == _T_17 ? 1'h0 : _GEN_535; // @[ROB.scala 196:{46,46}]
  wire  _GEN_632 = 4'h3 == _T_17 ? 1'h0 : _GEN_536; // @[ROB.scala 196:{46,46}]
  wire  _GEN_633 = 4'h4 == _T_17 ? 1'h0 : _GEN_537; // @[ROB.scala 196:{46,46}]
  wire  _GEN_634 = 4'h5 == _T_17 ? 1'h0 : _GEN_538; // @[ROB.scala 196:{46,46}]
  wire  _GEN_635 = 4'h6 == _T_17 ? 1'h0 : _GEN_539; // @[ROB.scala 196:{46,46}]
  wire  _GEN_636 = 4'h7 == _T_17 ? 1'h0 : _GEN_540; // @[ROB.scala 196:{46,46}]
  wire  _GEN_637 = 4'h8 == _T_17 ? 1'h0 : _GEN_541; // @[ROB.scala 196:{46,46}]
  wire  _GEN_638 = 4'h9 == _T_17 ? 1'h0 : _GEN_542; // @[ROB.scala 196:{46,46}]
  wire  _GEN_639 = 4'ha == _T_17 ? 1'h0 : _GEN_543; // @[ROB.scala 196:{46,46}]
  wire  _GEN_640 = 4'hb == _T_17 ? 1'h0 : _GEN_544; // @[ROB.scala 196:{46,46}]
  wire [31:0] _GEN_641 = 4'h0 == _T_17 ? 32'h0 : entries_0_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_642 = 4'h1 == _T_17 ? 32'h0 : entries_1_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_643 = 4'h2 == _T_17 ? 32'h0 : entries_2_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_644 = 4'h3 == _T_17 ? 32'h0 : entries_3_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_645 = 4'h4 == _T_17 ? 32'h0 : entries_4_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_646 = 4'h5 == _T_17 ? 32'h0 : entries_5_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_647 = 4'h6 == _T_17 ? 32'h0 : entries_6_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_648 = 4'h7 == _T_17 ? 32'h0 : entries_7_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_649 = 4'h8 == _T_17 ? 32'h0 : entries_8_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_650 = 4'h9 == _T_17 ? 32'h0 : entries_9_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_651 = 4'ha == _T_17 ? 32'h0 : entries_10_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire [31:0] _GEN_652 = 4'hb == _T_17 ? 32'h0 : entries_11_excpAddr; // @[ROB.scala 122:22 197:{47,47}]
  wire  _GEN_653 = 4'h0 == _T_17 ? 1'h0 : _GEN_545; // @[ROB.scala 198:{48,48}]
  wire  _GEN_654 = 4'h1 == _T_17 ? 1'h0 : _GEN_546; // @[ROB.scala 198:{48,48}]
  wire  _GEN_655 = 4'h2 == _T_17 ? 1'h0 : _GEN_547; // @[ROB.scala 198:{48,48}]
  wire  _GEN_656 = 4'h3 == _T_17 ? 1'h0 : _GEN_548; // @[ROB.scala 198:{48,48}]
  wire  _GEN_657 = 4'h4 == _T_17 ? 1'h0 : _GEN_549; // @[ROB.scala 198:{48,48}]
  wire  _GEN_658 = 4'h5 == _T_17 ? 1'h0 : _GEN_550; // @[ROB.scala 198:{48,48}]
  wire  _GEN_659 = 4'h6 == _T_17 ? 1'h0 : _GEN_551; // @[ROB.scala 198:{48,48}]
  wire  _GEN_660 = 4'h7 == _T_17 ? 1'h0 : _GEN_552; // @[ROB.scala 198:{48,48}]
  wire  _GEN_661 = 4'h8 == _T_17 ? 1'h0 : _GEN_553; // @[ROB.scala 198:{48,48}]
  wire  _GEN_662 = 4'h9 == _T_17 ? 1'h0 : _GEN_554; // @[ROB.scala 198:{48,48}]
  wire  _GEN_663 = 4'ha == _T_17 ? 1'h0 : _GEN_555; // @[ROB.scala 198:{48,48}]
  wire  _GEN_664 = 4'hb == _T_17 ? 1'h0 : _GEN_556; // @[ROB.scala 198:{48,48}]
  wire [31:0] _GEN_665 = io_fu_0_valid ? _GEN_593 : entries_0_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_666 = io_fu_0_valid ? _GEN_594 : entries_1_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_667 = io_fu_0_valid ? _GEN_595 : entries_2_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_668 = io_fu_0_valid ? _GEN_596 : entries_3_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_669 = io_fu_0_valid ? _GEN_597 : entries_4_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_670 = io_fu_0_valid ? _GEN_598 : entries_5_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_671 = io_fu_0_valid ? _GEN_599 : entries_6_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_672 = io_fu_0_valid ? _GEN_600 : entries_7_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_673 = io_fu_0_valid ? _GEN_601 : entries_8_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_674 = io_fu_0_valid ? _GEN_602 : entries_9_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_675 = io_fu_0_valid ? _GEN_603 : entries_10_data; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_676 = io_fu_0_valid ? _GEN_604 : entries_11_data; // @[ROB.scala 122:22 192:23]
  wire [1:0] _GEN_677 = io_fu_0_valid ? _GEN_605 : _GEN_521; // @[ROB.scala 192:23]
  wire [1:0] _GEN_678 = io_fu_0_valid ? _GEN_606 : _GEN_522; // @[ROB.scala 192:23]
  wire [1:0] _GEN_679 = io_fu_0_valid ? _GEN_607 : _GEN_523; // @[ROB.scala 192:23]
  wire [1:0] _GEN_680 = io_fu_0_valid ? _GEN_608 : _GEN_524; // @[ROB.scala 192:23]
  wire [1:0] _GEN_681 = io_fu_0_valid ? _GEN_609 : _GEN_525; // @[ROB.scala 192:23]
  wire [1:0] _GEN_682 = io_fu_0_valid ? _GEN_610 : _GEN_526; // @[ROB.scala 192:23]
  wire [1:0] _GEN_683 = io_fu_0_valid ? _GEN_611 : _GEN_527; // @[ROB.scala 192:23]
  wire [1:0] _GEN_684 = io_fu_0_valid ? _GEN_612 : _GEN_528; // @[ROB.scala 192:23]
  wire [1:0] _GEN_685 = io_fu_0_valid ? _GEN_613 : _GEN_529; // @[ROB.scala 192:23]
  wire [1:0] _GEN_686 = io_fu_0_valid ? _GEN_614 : _GEN_530; // @[ROB.scala 192:23]
  wire [1:0] _GEN_687 = io_fu_0_valid ? _GEN_615 : _GEN_531; // @[ROB.scala 192:23]
  wire [1:0] _GEN_688 = io_fu_0_valid ? _GEN_616 : _GEN_532; // @[ROB.scala 192:23]
  wire [31:0] _GEN_689 = io_fu_0_valid ? _GEN_617 : entries_0_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_690 = io_fu_0_valid ? _GEN_618 : entries_1_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_691 = io_fu_0_valid ? _GEN_619 : entries_2_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_692 = io_fu_0_valid ? _GEN_620 : entries_3_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_693 = io_fu_0_valid ? _GEN_621 : entries_4_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_694 = io_fu_0_valid ? _GEN_622 : entries_5_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_695 = io_fu_0_valid ? _GEN_623 : entries_6_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_696 = io_fu_0_valid ? _GEN_624 : entries_7_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_697 = io_fu_0_valid ? _GEN_625 : entries_8_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_698 = io_fu_0_valid ? _GEN_626 : entries_9_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_699 = io_fu_0_valid ? _GEN_627 : entries_10_brAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_700 = io_fu_0_valid ? _GEN_628 : entries_11_brAddr; // @[ROB.scala 122:22 192:23]
  wire  _GEN_701 = io_fu_0_valid ? _GEN_629 : _GEN_533; // @[ROB.scala 192:23]
  wire  _GEN_702 = io_fu_0_valid ? _GEN_630 : _GEN_534; // @[ROB.scala 192:23]
  wire  _GEN_703 = io_fu_0_valid ? _GEN_631 : _GEN_535; // @[ROB.scala 192:23]
  wire  _GEN_704 = io_fu_0_valid ? _GEN_632 : _GEN_536; // @[ROB.scala 192:23]
  wire  _GEN_705 = io_fu_0_valid ? _GEN_633 : _GEN_537; // @[ROB.scala 192:23]
  wire  _GEN_706 = io_fu_0_valid ? _GEN_634 : _GEN_538; // @[ROB.scala 192:23]
  wire  _GEN_707 = io_fu_0_valid ? _GEN_635 : _GEN_539; // @[ROB.scala 192:23]
  wire  _GEN_708 = io_fu_0_valid ? _GEN_636 : _GEN_540; // @[ROB.scala 192:23]
  wire  _GEN_709 = io_fu_0_valid ? _GEN_637 : _GEN_541; // @[ROB.scala 192:23]
  wire  _GEN_710 = io_fu_0_valid ? _GEN_638 : _GEN_542; // @[ROB.scala 192:23]
  wire  _GEN_711 = io_fu_0_valid ? _GEN_639 : _GEN_543; // @[ROB.scala 192:23]
  wire  _GEN_712 = io_fu_0_valid ? _GEN_640 : _GEN_544; // @[ROB.scala 192:23]
  wire [31:0] _GEN_713 = io_fu_0_valid ? _GEN_641 : entries_0_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_714 = io_fu_0_valid ? _GEN_642 : entries_1_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_715 = io_fu_0_valid ? _GEN_643 : entries_2_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_716 = io_fu_0_valid ? _GEN_644 : entries_3_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_717 = io_fu_0_valid ? _GEN_645 : entries_4_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_718 = io_fu_0_valid ? _GEN_646 : entries_5_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_719 = io_fu_0_valid ? _GEN_647 : entries_6_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_720 = io_fu_0_valid ? _GEN_648 : entries_7_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_721 = io_fu_0_valid ? _GEN_649 : entries_8_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_722 = io_fu_0_valid ? _GEN_650 : entries_9_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_723 = io_fu_0_valid ? _GEN_651 : entries_10_excpAddr; // @[ROB.scala 122:22 192:23]
  wire [31:0] _GEN_724 = io_fu_0_valid ? _GEN_652 : entries_11_excpAddr; // @[ROB.scala 122:22 192:23]
  wire  _GEN_725 = io_fu_0_valid ? _GEN_653 : _GEN_545; // @[ROB.scala 192:23]
  wire  _GEN_726 = io_fu_0_valid ? _GEN_654 : _GEN_546; // @[ROB.scala 192:23]
  wire  _GEN_727 = io_fu_0_valid ? _GEN_655 : _GEN_547; // @[ROB.scala 192:23]
  wire  _GEN_728 = io_fu_0_valid ? _GEN_656 : _GEN_548; // @[ROB.scala 192:23]
  wire  _GEN_729 = io_fu_0_valid ? _GEN_657 : _GEN_549; // @[ROB.scala 192:23]
  wire  _GEN_730 = io_fu_0_valid ? _GEN_658 : _GEN_550; // @[ROB.scala 192:23]
  wire  _GEN_731 = io_fu_0_valid ? _GEN_659 : _GEN_551; // @[ROB.scala 192:23]
  wire  _GEN_732 = io_fu_0_valid ? _GEN_660 : _GEN_552; // @[ROB.scala 192:23]
  wire  _GEN_733 = io_fu_0_valid ? _GEN_661 : _GEN_553; // @[ROB.scala 192:23]
  wire  _GEN_734 = io_fu_0_valid ? _GEN_662 : _GEN_554; // @[ROB.scala 192:23]
  wire  _GEN_735 = io_fu_0_valid ? _GEN_663 : _GEN_555; // @[ROB.scala 192:23]
  wire  _GEN_736 = io_fu_0_valid ? _GEN_664 : _GEN_556; // @[ROB.scala 192:23]
  wire [3:0] _T_29 = io_fu_1_bits_id - 4'h1; // @[ROB.scala 193:31]
  wire [31:0] _GEN_737 = 4'h0 == _T_29 ? io_fu_1_bits_data : _GEN_665; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_738 = 4'h1 == _T_29 ? io_fu_1_bits_data : _GEN_666; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_739 = 4'h2 == _T_29 ? io_fu_1_bits_data : _GEN_667; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_740 = 4'h3 == _T_29 ? io_fu_1_bits_data : _GEN_668; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_741 = 4'h4 == _T_29 ? io_fu_1_bits_data : _GEN_669; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_742 = 4'h5 == _T_29 ? io_fu_1_bits_data : _GEN_670; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_743 = 4'h6 == _T_29 ? io_fu_1_bits_data : _GEN_671; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_744 = 4'h7 == _T_29 ? io_fu_1_bits_data : _GEN_672; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_745 = 4'h8 == _T_29 ? io_fu_1_bits_data : _GEN_673; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_746 = 4'h9 == _T_29 ? io_fu_1_bits_data : _GEN_674; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_747 = 4'ha == _T_29 ? io_fu_1_bits_data : _GEN_675; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_748 = 4'hb == _T_29 ? io_fu_1_bits_data : _GEN_676; // @[ROB.scala 193:{43,43}]
  wire [1:0] _GEN_749 = 4'h0 == _T_29 ? 2'h2 : _GEN_677; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_750 = 4'h1 == _T_29 ? 2'h2 : _GEN_678; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_751 = 4'h2 == _T_29 ? 2'h2 : _GEN_679; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_752 = 4'h3 == _T_29 ? 2'h2 : _GEN_680; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_753 = 4'h4 == _T_29 ? 2'h2 : _GEN_681; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_754 = 4'h5 == _T_29 ? 2'h2 : _GEN_682; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_755 = 4'h6 == _T_29 ? 2'h2 : _GEN_683; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_756 = 4'h7 == _T_29 ? 2'h2 : _GEN_684; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_757 = 4'h8 == _T_29 ? 2'h2 : _GEN_685; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_758 = 4'h9 == _T_29 ? 2'h2 : _GEN_686; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_759 = 4'ha == _T_29 ? 2'h2 : _GEN_687; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_760 = 4'hb == _T_29 ? 2'h2 : _GEN_688; // @[ROB.scala 194:{44,44}]
  wire [31:0] _GEN_761 = 4'h0 == _T_29 ? io_fu_1_bits_brAddr : _GEN_689; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_762 = 4'h1 == _T_29 ? io_fu_1_bits_brAddr : _GEN_690; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_763 = 4'h2 == _T_29 ? io_fu_1_bits_brAddr : _GEN_691; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_764 = 4'h3 == _T_29 ? io_fu_1_bits_brAddr : _GEN_692; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_765 = 4'h4 == _T_29 ? io_fu_1_bits_brAddr : _GEN_693; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_766 = 4'h5 == _T_29 ? io_fu_1_bits_brAddr : _GEN_694; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_767 = 4'h6 == _T_29 ? io_fu_1_bits_brAddr : _GEN_695; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_768 = 4'h7 == _T_29 ? io_fu_1_bits_brAddr : _GEN_696; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_769 = 4'h8 == _T_29 ? io_fu_1_bits_brAddr : _GEN_697; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_770 = 4'h9 == _T_29 ? io_fu_1_bits_brAddr : _GEN_698; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_771 = 4'ha == _T_29 ? io_fu_1_bits_brAddr : _GEN_699; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_772 = 4'hb == _T_29 ? io_fu_1_bits_brAddr : _GEN_700; // @[ROB.scala 195:{45,45}]
  wire  _GEN_773 = 4'h0 == _T_29 ? io_fu_1_bits_brTaken : _GEN_701; // @[ROB.scala 196:{46,46}]
  wire  _GEN_774 = 4'h1 == _T_29 ? io_fu_1_bits_brTaken : _GEN_702; // @[ROB.scala 196:{46,46}]
  wire  _GEN_775 = 4'h2 == _T_29 ? io_fu_1_bits_brTaken : _GEN_703; // @[ROB.scala 196:{46,46}]
  wire  _GEN_776 = 4'h3 == _T_29 ? io_fu_1_bits_brTaken : _GEN_704; // @[ROB.scala 196:{46,46}]
  wire  _GEN_777 = 4'h4 == _T_29 ? io_fu_1_bits_brTaken : _GEN_705; // @[ROB.scala 196:{46,46}]
  wire  _GEN_778 = 4'h5 == _T_29 ? io_fu_1_bits_brTaken : _GEN_706; // @[ROB.scala 196:{46,46}]
  wire  _GEN_779 = 4'h6 == _T_29 ? io_fu_1_bits_brTaken : _GEN_707; // @[ROB.scala 196:{46,46}]
  wire  _GEN_780 = 4'h7 == _T_29 ? io_fu_1_bits_brTaken : _GEN_708; // @[ROB.scala 196:{46,46}]
  wire  _GEN_781 = 4'h8 == _T_29 ? io_fu_1_bits_brTaken : _GEN_709; // @[ROB.scala 196:{46,46}]
  wire  _GEN_782 = 4'h9 == _T_29 ? io_fu_1_bits_brTaken : _GEN_710; // @[ROB.scala 196:{46,46}]
  wire  _GEN_783 = 4'ha == _T_29 ? io_fu_1_bits_brTaken : _GEN_711; // @[ROB.scala 196:{46,46}]
  wire  _GEN_784 = 4'hb == _T_29 ? io_fu_1_bits_brTaken : _GEN_712; // @[ROB.scala 196:{46,46}]
  wire [31:0] _GEN_785 = 4'h0 == _T_29 ? 32'h0 : _GEN_713; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_786 = 4'h1 == _T_29 ? 32'h0 : _GEN_714; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_787 = 4'h2 == _T_29 ? 32'h0 : _GEN_715; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_788 = 4'h3 == _T_29 ? 32'h0 : _GEN_716; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_789 = 4'h4 == _T_29 ? 32'h0 : _GEN_717; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_790 = 4'h5 == _T_29 ? 32'h0 : _GEN_718; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_791 = 4'h6 == _T_29 ? 32'h0 : _GEN_719; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_792 = 4'h7 == _T_29 ? 32'h0 : _GEN_720; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_793 = 4'h8 == _T_29 ? 32'h0 : _GEN_721; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_794 = 4'h9 == _T_29 ? 32'h0 : _GEN_722; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_795 = 4'ha == _T_29 ? 32'h0 : _GEN_723; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_796 = 4'hb == _T_29 ? 32'h0 : _GEN_724; // @[ROB.scala 197:{47,47}]
  wire  _GEN_797 = 4'h0 == _T_29 ? 1'h0 : _GEN_725; // @[ROB.scala 198:{48,48}]
  wire  _GEN_798 = 4'h1 == _T_29 ? 1'h0 : _GEN_726; // @[ROB.scala 198:{48,48}]
  wire  _GEN_799 = 4'h2 == _T_29 ? 1'h0 : _GEN_727; // @[ROB.scala 198:{48,48}]
  wire  _GEN_800 = 4'h3 == _T_29 ? 1'h0 : _GEN_728; // @[ROB.scala 198:{48,48}]
  wire  _GEN_801 = 4'h4 == _T_29 ? 1'h0 : _GEN_729; // @[ROB.scala 198:{48,48}]
  wire  _GEN_802 = 4'h5 == _T_29 ? 1'h0 : _GEN_730; // @[ROB.scala 198:{48,48}]
  wire  _GEN_803 = 4'h6 == _T_29 ? 1'h0 : _GEN_731; // @[ROB.scala 198:{48,48}]
  wire  _GEN_804 = 4'h7 == _T_29 ? 1'h0 : _GEN_732; // @[ROB.scala 198:{48,48}]
  wire  _GEN_805 = 4'h8 == _T_29 ? 1'h0 : _GEN_733; // @[ROB.scala 198:{48,48}]
  wire  _GEN_806 = 4'h9 == _T_29 ? 1'h0 : _GEN_734; // @[ROB.scala 198:{48,48}]
  wire  _GEN_807 = 4'ha == _T_29 ? 1'h0 : _GEN_735; // @[ROB.scala 198:{48,48}]
  wire  _GEN_808 = 4'hb == _T_29 ? 1'h0 : _GEN_736; // @[ROB.scala 198:{48,48}]
  wire [31:0] _GEN_809 = io_fu_1_valid ? _GEN_737 : _GEN_665; // @[ROB.scala 192:23]
  wire [31:0] _GEN_810 = io_fu_1_valid ? _GEN_738 : _GEN_666; // @[ROB.scala 192:23]
  wire [31:0] _GEN_811 = io_fu_1_valid ? _GEN_739 : _GEN_667; // @[ROB.scala 192:23]
  wire [31:0] _GEN_812 = io_fu_1_valid ? _GEN_740 : _GEN_668; // @[ROB.scala 192:23]
  wire [31:0] _GEN_813 = io_fu_1_valid ? _GEN_741 : _GEN_669; // @[ROB.scala 192:23]
  wire [31:0] _GEN_814 = io_fu_1_valid ? _GEN_742 : _GEN_670; // @[ROB.scala 192:23]
  wire [31:0] _GEN_815 = io_fu_1_valid ? _GEN_743 : _GEN_671; // @[ROB.scala 192:23]
  wire [31:0] _GEN_816 = io_fu_1_valid ? _GEN_744 : _GEN_672; // @[ROB.scala 192:23]
  wire [31:0] _GEN_817 = io_fu_1_valid ? _GEN_745 : _GEN_673; // @[ROB.scala 192:23]
  wire [31:0] _GEN_818 = io_fu_1_valid ? _GEN_746 : _GEN_674; // @[ROB.scala 192:23]
  wire [31:0] _GEN_819 = io_fu_1_valid ? _GEN_747 : _GEN_675; // @[ROB.scala 192:23]
  wire [31:0] _GEN_820 = io_fu_1_valid ? _GEN_748 : _GEN_676; // @[ROB.scala 192:23]
  wire [1:0] _GEN_821 = io_fu_1_valid ? _GEN_749 : _GEN_677; // @[ROB.scala 192:23]
  wire [1:0] _GEN_822 = io_fu_1_valid ? _GEN_750 : _GEN_678; // @[ROB.scala 192:23]
  wire [1:0] _GEN_823 = io_fu_1_valid ? _GEN_751 : _GEN_679; // @[ROB.scala 192:23]
  wire [1:0] _GEN_824 = io_fu_1_valid ? _GEN_752 : _GEN_680; // @[ROB.scala 192:23]
  wire [1:0] _GEN_825 = io_fu_1_valid ? _GEN_753 : _GEN_681; // @[ROB.scala 192:23]
  wire [1:0] _GEN_826 = io_fu_1_valid ? _GEN_754 : _GEN_682; // @[ROB.scala 192:23]
  wire [1:0] _GEN_827 = io_fu_1_valid ? _GEN_755 : _GEN_683; // @[ROB.scala 192:23]
  wire [1:0] _GEN_828 = io_fu_1_valid ? _GEN_756 : _GEN_684; // @[ROB.scala 192:23]
  wire [1:0] _GEN_829 = io_fu_1_valid ? _GEN_757 : _GEN_685; // @[ROB.scala 192:23]
  wire [1:0] _GEN_830 = io_fu_1_valid ? _GEN_758 : _GEN_686; // @[ROB.scala 192:23]
  wire [1:0] _GEN_831 = io_fu_1_valid ? _GEN_759 : _GEN_687; // @[ROB.scala 192:23]
  wire [1:0] _GEN_832 = io_fu_1_valid ? _GEN_760 : _GEN_688; // @[ROB.scala 192:23]
  wire [31:0] _GEN_833 = io_fu_1_valid ? _GEN_761 : _GEN_689; // @[ROB.scala 192:23]
  wire [31:0] _GEN_834 = io_fu_1_valid ? _GEN_762 : _GEN_690; // @[ROB.scala 192:23]
  wire [31:0] _GEN_835 = io_fu_1_valid ? _GEN_763 : _GEN_691; // @[ROB.scala 192:23]
  wire [31:0] _GEN_836 = io_fu_1_valid ? _GEN_764 : _GEN_692; // @[ROB.scala 192:23]
  wire [31:0] _GEN_837 = io_fu_1_valid ? _GEN_765 : _GEN_693; // @[ROB.scala 192:23]
  wire [31:0] _GEN_838 = io_fu_1_valid ? _GEN_766 : _GEN_694; // @[ROB.scala 192:23]
  wire [31:0] _GEN_839 = io_fu_1_valid ? _GEN_767 : _GEN_695; // @[ROB.scala 192:23]
  wire [31:0] _GEN_840 = io_fu_1_valid ? _GEN_768 : _GEN_696; // @[ROB.scala 192:23]
  wire [31:0] _GEN_841 = io_fu_1_valid ? _GEN_769 : _GEN_697; // @[ROB.scala 192:23]
  wire [31:0] _GEN_842 = io_fu_1_valid ? _GEN_770 : _GEN_698; // @[ROB.scala 192:23]
  wire [31:0] _GEN_843 = io_fu_1_valid ? _GEN_771 : _GEN_699; // @[ROB.scala 192:23]
  wire [31:0] _GEN_844 = io_fu_1_valid ? _GEN_772 : _GEN_700; // @[ROB.scala 192:23]
  wire  _GEN_845 = io_fu_1_valid ? _GEN_773 : _GEN_701; // @[ROB.scala 192:23]
  wire  _GEN_846 = io_fu_1_valid ? _GEN_774 : _GEN_702; // @[ROB.scala 192:23]
  wire  _GEN_847 = io_fu_1_valid ? _GEN_775 : _GEN_703; // @[ROB.scala 192:23]
  wire  _GEN_848 = io_fu_1_valid ? _GEN_776 : _GEN_704; // @[ROB.scala 192:23]
  wire  _GEN_849 = io_fu_1_valid ? _GEN_777 : _GEN_705; // @[ROB.scala 192:23]
  wire  _GEN_850 = io_fu_1_valid ? _GEN_778 : _GEN_706; // @[ROB.scala 192:23]
  wire  _GEN_851 = io_fu_1_valid ? _GEN_779 : _GEN_707; // @[ROB.scala 192:23]
  wire  _GEN_852 = io_fu_1_valid ? _GEN_780 : _GEN_708; // @[ROB.scala 192:23]
  wire  _GEN_853 = io_fu_1_valid ? _GEN_781 : _GEN_709; // @[ROB.scala 192:23]
  wire  _GEN_854 = io_fu_1_valid ? _GEN_782 : _GEN_710; // @[ROB.scala 192:23]
  wire  _GEN_855 = io_fu_1_valid ? _GEN_783 : _GEN_711; // @[ROB.scala 192:23]
  wire  _GEN_856 = io_fu_1_valid ? _GEN_784 : _GEN_712; // @[ROB.scala 192:23]
  wire [31:0] _GEN_857 = io_fu_1_valid ? _GEN_785 : _GEN_713; // @[ROB.scala 192:23]
  wire [31:0] _GEN_858 = io_fu_1_valid ? _GEN_786 : _GEN_714; // @[ROB.scala 192:23]
  wire [31:0] _GEN_859 = io_fu_1_valid ? _GEN_787 : _GEN_715; // @[ROB.scala 192:23]
  wire [31:0] _GEN_860 = io_fu_1_valid ? _GEN_788 : _GEN_716; // @[ROB.scala 192:23]
  wire [31:0] _GEN_861 = io_fu_1_valid ? _GEN_789 : _GEN_717; // @[ROB.scala 192:23]
  wire [31:0] _GEN_862 = io_fu_1_valid ? _GEN_790 : _GEN_718; // @[ROB.scala 192:23]
  wire [31:0] _GEN_863 = io_fu_1_valid ? _GEN_791 : _GEN_719; // @[ROB.scala 192:23]
  wire [31:0] _GEN_864 = io_fu_1_valid ? _GEN_792 : _GEN_720; // @[ROB.scala 192:23]
  wire [31:0] _GEN_865 = io_fu_1_valid ? _GEN_793 : _GEN_721; // @[ROB.scala 192:23]
  wire [31:0] _GEN_866 = io_fu_1_valid ? _GEN_794 : _GEN_722; // @[ROB.scala 192:23]
  wire [31:0] _GEN_867 = io_fu_1_valid ? _GEN_795 : _GEN_723; // @[ROB.scala 192:23]
  wire [31:0] _GEN_868 = io_fu_1_valid ? _GEN_796 : _GEN_724; // @[ROB.scala 192:23]
  wire  _GEN_869 = io_fu_1_valid ? _GEN_797 : _GEN_725; // @[ROB.scala 192:23]
  wire  _GEN_870 = io_fu_1_valid ? _GEN_798 : _GEN_726; // @[ROB.scala 192:23]
  wire  _GEN_871 = io_fu_1_valid ? _GEN_799 : _GEN_727; // @[ROB.scala 192:23]
  wire  _GEN_872 = io_fu_1_valid ? _GEN_800 : _GEN_728; // @[ROB.scala 192:23]
  wire  _GEN_873 = io_fu_1_valid ? _GEN_801 : _GEN_729; // @[ROB.scala 192:23]
  wire  _GEN_874 = io_fu_1_valid ? _GEN_802 : _GEN_730; // @[ROB.scala 192:23]
  wire  _GEN_875 = io_fu_1_valid ? _GEN_803 : _GEN_731; // @[ROB.scala 192:23]
  wire  _GEN_876 = io_fu_1_valid ? _GEN_804 : _GEN_732; // @[ROB.scala 192:23]
  wire  _GEN_877 = io_fu_1_valid ? _GEN_805 : _GEN_733; // @[ROB.scala 192:23]
  wire  _GEN_878 = io_fu_1_valid ? _GEN_806 : _GEN_734; // @[ROB.scala 192:23]
  wire  _GEN_879 = io_fu_1_valid ? _GEN_807 : _GEN_735; // @[ROB.scala 192:23]
  wire  _GEN_880 = io_fu_1_valid ? _GEN_808 : _GEN_736; // @[ROB.scala 192:23]
  wire [3:0] _T_41 = io_fu_2_bits_id - 4'h1; // @[ROB.scala 193:31]
  wire [31:0] _GEN_881 = 4'h0 == _T_41 ? io_fu_2_bits_data : _GEN_809; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_882 = 4'h1 == _T_41 ? io_fu_2_bits_data : _GEN_810; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_883 = 4'h2 == _T_41 ? io_fu_2_bits_data : _GEN_811; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_884 = 4'h3 == _T_41 ? io_fu_2_bits_data : _GEN_812; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_885 = 4'h4 == _T_41 ? io_fu_2_bits_data : _GEN_813; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_886 = 4'h5 == _T_41 ? io_fu_2_bits_data : _GEN_814; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_887 = 4'h6 == _T_41 ? io_fu_2_bits_data : _GEN_815; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_888 = 4'h7 == _T_41 ? io_fu_2_bits_data : _GEN_816; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_889 = 4'h8 == _T_41 ? io_fu_2_bits_data : _GEN_817; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_890 = 4'h9 == _T_41 ? io_fu_2_bits_data : _GEN_818; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_891 = 4'ha == _T_41 ? io_fu_2_bits_data : _GEN_819; // @[ROB.scala 193:{43,43}]
  wire [31:0] _GEN_892 = 4'hb == _T_41 ? io_fu_2_bits_data : _GEN_820; // @[ROB.scala 193:{43,43}]
  wire [1:0] _GEN_893 = 4'h0 == _T_41 ? 2'h2 : _GEN_821; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_894 = 4'h1 == _T_41 ? 2'h2 : _GEN_822; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_895 = 4'h2 == _T_41 ? 2'h2 : _GEN_823; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_896 = 4'h3 == _T_41 ? 2'h2 : _GEN_824; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_897 = 4'h4 == _T_41 ? 2'h2 : _GEN_825; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_898 = 4'h5 == _T_41 ? 2'h2 : _GEN_826; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_899 = 4'h6 == _T_41 ? 2'h2 : _GEN_827; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_900 = 4'h7 == _T_41 ? 2'h2 : _GEN_828; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_901 = 4'h8 == _T_41 ? 2'h2 : _GEN_829; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_902 = 4'h9 == _T_41 ? 2'h2 : _GEN_830; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_903 = 4'ha == _T_41 ? 2'h2 : _GEN_831; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_904 = 4'hb == _T_41 ? 2'h2 : _GEN_832; // @[ROB.scala 194:{44,44}]
  wire [31:0] _GEN_905 = 4'h0 == _T_41 ? 32'h0 : _GEN_833; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_906 = 4'h1 == _T_41 ? 32'h0 : _GEN_834; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_907 = 4'h2 == _T_41 ? 32'h0 : _GEN_835; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_908 = 4'h3 == _T_41 ? 32'h0 : _GEN_836; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_909 = 4'h4 == _T_41 ? 32'h0 : _GEN_837; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_910 = 4'h5 == _T_41 ? 32'h0 : _GEN_838; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_911 = 4'h6 == _T_41 ? 32'h0 : _GEN_839; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_912 = 4'h7 == _T_41 ? 32'h0 : _GEN_840; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_913 = 4'h8 == _T_41 ? 32'h0 : _GEN_841; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_914 = 4'h9 == _T_41 ? 32'h0 : _GEN_842; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_915 = 4'ha == _T_41 ? 32'h0 : _GEN_843; // @[ROB.scala 195:{45,45}]
  wire [31:0] _GEN_916 = 4'hb == _T_41 ? 32'h0 : _GEN_844; // @[ROB.scala 195:{45,45}]
  wire  _GEN_917 = 4'h0 == _T_41 ? 1'h0 : _GEN_845; // @[ROB.scala 196:{46,46}]
  wire  _GEN_918 = 4'h1 == _T_41 ? 1'h0 : _GEN_846; // @[ROB.scala 196:{46,46}]
  wire  _GEN_919 = 4'h2 == _T_41 ? 1'h0 : _GEN_847; // @[ROB.scala 196:{46,46}]
  wire  _GEN_920 = 4'h3 == _T_41 ? 1'h0 : _GEN_848; // @[ROB.scala 196:{46,46}]
  wire  _GEN_921 = 4'h4 == _T_41 ? 1'h0 : _GEN_849; // @[ROB.scala 196:{46,46}]
  wire  _GEN_922 = 4'h5 == _T_41 ? 1'h0 : _GEN_850; // @[ROB.scala 196:{46,46}]
  wire  _GEN_923 = 4'h6 == _T_41 ? 1'h0 : _GEN_851; // @[ROB.scala 196:{46,46}]
  wire  _GEN_924 = 4'h7 == _T_41 ? 1'h0 : _GEN_852; // @[ROB.scala 196:{46,46}]
  wire  _GEN_925 = 4'h8 == _T_41 ? 1'h0 : _GEN_853; // @[ROB.scala 196:{46,46}]
  wire  _GEN_926 = 4'h9 == _T_41 ? 1'h0 : _GEN_854; // @[ROB.scala 196:{46,46}]
  wire  _GEN_927 = 4'ha == _T_41 ? 1'h0 : _GEN_855; // @[ROB.scala 196:{46,46}]
  wire  _GEN_928 = 4'hb == _T_41 ? 1'h0 : _GEN_856; // @[ROB.scala 196:{46,46}]
  wire [31:0] _GEN_929 = 4'h0 == _T_41 ? 32'h0 : _GEN_857; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_930 = 4'h1 == _T_41 ? 32'h0 : _GEN_858; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_931 = 4'h2 == _T_41 ? 32'h0 : _GEN_859; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_932 = 4'h3 == _T_41 ? 32'h0 : _GEN_860; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_933 = 4'h4 == _T_41 ? 32'h0 : _GEN_861; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_934 = 4'h5 == _T_41 ? 32'h0 : _GEN_862; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_935 = 4'h6 == _T_41 ? 32'h0 : _GEN_863; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_936 = 4'h7 == _T_41 ? 32'h0 : _GEN_864; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_937 = 4'h8 == _T_41 ? 32'h0 : _GEN_865; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_938 = 4'h9 == _T_41 ? 32'h0 : _GEN_866; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_939 = 4'ha == _T_41 ? 32'h0 : _GEN_867; // @[ROB.scala 197:{47,47}]
  wire [31:0] _GEN_940 = 4'hb == _T_41 ? 32'h0 : _GEN_868; // @[ROB.scala 197:{47,47}]
  wire  _GEN_941 = 4'h0 == _T_41 ? 1'h0 : _GEN_869; // @[ROB.scala 198:{48,48}]
  wire  _GEN_942 = 4'h1 == _T_41 ? 1'h0 : _GEN_870; // @[ROB.scala 198:{48,48}]
  wire  _GEN_943 = 4'h2 == _T_41 ? 1'h0 : _GEN_871; // @[ROB.scala 198:{48,48}]
  wire  _GEN_944 = 4'h3 == _T_41 ? 1'h0 : _GEN_872; // @[ROB.scala 198:{48,48}]
  wire  _GEN_945 = 4'h4 == _T_41 ? 1'h0 : _GEN_873; // @[ROB.scala 198:{48,48}]
  wire  _GEN_946 = 4'h5 == _T_41 ? 1'h0 : _GEN_874; // @[ROB.scala 198:{48,48}]
  wire  _GEN_947 = 4'h6 == _T_41 ? 1'h0 : _GEN_875; // @[ROB.scala 198:{48,48}]
  wire  _GEN_948 = 4'h7 == _T_41 ? 1'h0 : _GEN_876; // @[ROB.scala 198:{48,48}]
  wire  _GEN_949 = 4'h8 == _T_41 ? 1'h0 : _GEN_877; // @[ROB.scala 198:{48,48}]
  wire  _GEN_950 = 4'h9 == _T_41 ? 1'h0 : _GEN_878; // @[ROB.scala 198:{48,48}]
  wire  _GEN_951 = 4'ha == _T_41 ? 1'h0 : _GEN_879; // @[ROB.scala 198:{48,48}]
  wire  _GEN_952 = 4'hb == _T_41 ? 1'h0 : _GEN_880; // @[ROB.scala 198:{48,48}]
  wire [31:0] _GEN_953 = io_fu_2_valid ? _GEN_881 : _GEN_809; // @[ROB.scala 192:23]
  wire [31:0] _GEN_954 = io_fu_2_valid ? _GEN_882 : _GEN_810; // @[ROB.scala 192:23]
  wire [31:0] _GEN_955 = io_fu_2_valid ? _GEN_883 : _GEN_811; // @[ROB.scala 192:23]
  wire [31:0] _GEN_956 = io_fu_2_valid ? _GEN_884 : _GEN_812; // @[ROB.scala 192:23]
  wire [31:0] _GEN_957 = io_fu_2_valid ? _GEN_885 : _GEN_813; // @[ROB.scala 192:23]
  wire [31:0] _GEN_958 = io_fu_2_valid ? _GEN_886 : _GEN_814; // @[ROB.scala 192:23]
  wire [31:0] _GEN_959 = io_fu_2_valid ? _GEN_887 : _GEN_815; // @[ROB.scala 192:23]
  wire [31:0] _GEN_960 = io_fu_2_valid ? _GEN_888 : _GEN_816; // @[ROB.scala 192:23]
  wire [31:0] _GEN_961 = io_fu_2_valid ? _GEN_889 : _GEN_817; // @[ROB.scala 192:23]
  wire [31:0] _GEN_962 = io_fu_2_valid ? _GEN_890 : _GEN_818; // @[ROB.scala 192:23]
  wire [31:0] _GEN_963 = io_fu_2_valid ? _GEN_891 : _GEN_819; // @[ROB.scala 192:23]
  wire [31:0] _GEN_964 = io_fu_2_valid ? _GEN_892 : _GEN_820; // @[ROB.scala 192:23]
  wire [1:0] _GEN_965 = io_fu_2_valid ? _GEN_893 : _GEN_821; // @[ROB.scala 192:23]
  wire [1:0] _GEN_966 = io_fu_2_valid ? _GEN_894 : _GEN_822; // @[ROB.scala 192:23]
  wire [1:0] _GEN_967 = io_fu_2_valid ? _GEN_895 : _GEN_823; // @[ROB.scala 192:23]
  wire [1:0] _GEN_968 = io_fu_2_valid ? _GEN_896 : _GEN_824; // @[ROB.scala 192:23]
  wire [1:0] _GEN_969 = io_fu_2_valid ? _GEN_897 : _GEN_825; // @[ROB.scala 192:23]
  wire [1:0] _GEN_970 = io_fu_2_valid ? _GEN_898 : _GEN_826; // @[ROB.scala 192:23]
  wire [1:0] _GEN_971 = io_fu_2_valid ? _GEN_899 : _GEN_827; // @[ROB.scala 192:23]
  wire [1:0] _GEN_972 = io_fu_2_valid ? _GEN_900 : _GEN_828; // @[ROB.scala 192:23]
  wire [1:0] _GEN_973 = io_fu_2_valid ? _GEN_901 : _GEN_829; // @[ROB.scala 192:23]
  wire [1:0] _GEN_974 = io_fu_2_valid ? _GEN_902 : _GEN_830; // @[ROB.scala 192:23]
  wire [1:0] _GEN_975 = io_fu_2_valid ? _GEN_903 : _GEN_831; // @[ROB.scala 192:23]
  wire [1:0] _GEN_976 = io_fu_2_valid ? _GEN_904 : _GEN_832; // @[ROB.scala 192:23]
  wire [31:0] _GEN_977 = io_fu_2_valid ? _GEN_905 : _GEN_833; // @[ROB.scala 192:23]
  wire [31:0] _GEN_978 = io_fu_2_valid ? _GEN_906 : _GEN_834; // @[ROB.scala 192:23]
  wire [31:0] _GEN_979 = io_fu_2_valid ? _GEN_907 : _GEN_835; // @[ROB.scala 192:23]
  wire [31:0] _GEN_980 = io_fu_2_valid ? _GEN_908 : _GEN_836; // @[ROB.scala 192:23]
  wire [31:0] _GEN_981 = io_fu_2_valid ? _GEN_909 : _GEN_837; // @[ROB.scala 192:23]
  wire [31:0] _GEN_982 = io_fu_2_valid ? _GEN_910 : _GEN_838; // @[ROB.scala 192:23]
  wire [31:0] _GEN_983 = io_fu_2_valid ? _GEN_911 : _GEN_839; // @[ROB.scala 192:23]
  wire [31:0] _GEN_984 = io_fu_2_valid ? _GEN_912 : _GEN_840; // @[ROB.scala 192:23]
  wire [31:0] _GEN_985 = io_fu_2_valid ? _GEN_913 : _GEN_841; // @[ROB.scala 192:23]
  wire [31:0] _GEN_986 = io_fu_2_valid ? _GEN_914 : _GEN_842; // @[ROB.scala 192:23]
  wire [31:0] _GEN_987 = io_fu_2_valid ? _GEN_915 : _GEN_843; // @[ROB.scala 192:23]
  wire [31:0] _GEN_988 = io_fu_2_valid ? _GEN_916 : _GEN_844; // @[ROB.scala 192:23]
  wire  _GEN_989 = io_fu_2_valid ? _GEN_917 : _GEN_845; // @[ROB.scala 192:23]
  wire  _GEN_990 = io_fu_2_valid ? _GEN_918 : _GEN_846; // @[ROB.scala 192:23]
  wire  _GEN_991 = io_fu_2_valid ? _GEN_919 : _GEN_847; // @[ROB.scala 192:23]
  wire  _GEN_992 = io_fu_2_valid ? _GEN_920 : _GEN_848; // @[ROB.scala 192:23]
  wire  _GEN_993 = io_fu_2_valid ? _GEN_921 : _GEN_849; // @[ROB.scala 192:23]
  wire  _GEN_994 = io_fu_2_valid ? _GEN_922 : _GEN_850; // @[ROB.scala 192:23]
  wire  _GEN_995 = io_fu_2_valid ? _GEN_923 : _GEN_851; // @[ROB.scala 192:23]
  wire  _GEN_996 = io_fu_2_valid ? _GEN_924 : _GEN_852; // @[ROB.scala 192:23]
  wire  _GEN_997 = io_fu_2_valid ? _GEN_925 : _GEN_853; // @[ROB.scala 192:23]
  wire  _GEN_998 = io_fu_2_valid ? _GEN_926 : _GEN_854; // @[ROB.scala 192:23]
  wire  _GEN_999 = io_fu_2_valid ? _GEN_927 : _GEN_855; // @[ROB.scala 192:23]
  wire  _GEN_1000 = io_fu_2_valid ? _GEN_928 : _GEN_856; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1001 = io_fu_2_valid ? _GEN_929 : _GEN_857; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1002 = io_fu_2_valid ? _GEN_930 : _GEN_858; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1003 = io_fu_2_valid ? _GEN_931 : _GEN_859; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1004 = io_fu_2_valid ? _GEN_932 : _GEN_860; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1005 = io_fu_2_valid ? _GEN_933 : _GEN_861; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1006 = io_fu_2_valid ? _GEN_934 : _GEN_862; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1007 = io_fu_2_valid ? _GEN_935 : _GEN_863; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1008 = io_fu_2_valid ? _GEN_936 : _GEN_864; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1009 = io_fu_2_valid ? _GEN_937 : _GEN_865; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1010 = io_fu_2_valid ? _GEN_938 : _GEN_866; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1011 = io_fu_2_valid ? _GEN_939 : _GEN_867; // @[ROB.scala 192:23]
  wire [31:0] _GEN_1012 = io_fu_2_valid ? _GEN_940 : _GEN_868; // @[ROB.scala 192:23]
  wire  _GEN_1013 = io_fu_2_valid ? _GEN_941 : _GEN_869; // @[ROB.scala 192:23]
  wire  _GEN_1014 = io_fu_2_valid ? _GEN_942 : _GEN_870; // @[ROB.scala 192:23]
  wire  _GEN_1015 = io_fu_2_valid ? _GEN_943 : _GEN_871; // @[ROB.scala 192:23]
  wire  _GEN_1016 = io_fu_2_valid ? _GEN_944 : _GEN_872; // @[ROB.scala 192:23]
  wire  _GEN_1017 = io_fu_2_valid ? _GEN_945 : _GEN_873; // @[ROB.scala 192:23]
  wire  _GEN_1018 = io_fu_2_valid ? _GEN_946 : _GEN_874; // @[ROB.scala 192:23]
  wire  _GEN_1019 = io_fu_2_valid ? _GEN_947 : _GEN_875; // @[ROB.scala 192:23]
  wire  _GEN_1020 = io_fu_2_valid ? _GEN_948 : _GEN_876; // @[ROB.scala 192:23]
  wire  _GEN_1021 = io_fu_2_valid ? _GEN_949 : _GEN_877; // @[ROB.scala 192:23]
  wire  _GEN_1022 = io_fu_2_valid ? _GEN_950 : _GEN_878; // @[ROB.scala 192:23]
  wire  _GEN_1023 = io_fu_2_valid ? _GEN_951 : _GEN_879; // @[ROB.scala 192:23]
  wire  _GEN_1024 = io_fu_2_valid ? _GEN_952 : _GEN_880; // @[ROB.scala 192:23]
  wire [3:0] _T_53 = io_fu_3_bits_id - 4'h1; // @[ROB.scala 193:31]
  wire [1:0] _GEN_1037 = 4'h0 == _T_53 ? 2'h2 : _GEN_965; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1038 = 4'h1 == _T_53 ? 2'h2 : _GEN_966; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1039 = 4'h2 == _T_53 ? 2'h2 : _GEN_967; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1040 = 4'h3 == _T_53 ? 2'h2 : _GEN_968; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1041 = 4'h4 == _T_53 ? 2'h2 : _GEN_969; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1042 = 4'h5 == _T_53 ? 2'h2 : _GEN_970; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1043 = 4'h6 == _T_53 ? 2'h2 : _GEN_971; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1044 = 4'h7 == _T_53 ? 2'h2 : _GEN_972; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1045 = 4'h8 == _T_53 ? 2'h2 : _GEN_973; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1046 = 4'h9 == _T_53 ? 2'h2 : _GEN_974; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1047 = 4'ha == _T_53 ? 2'h2 : _GEN_975; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1048 = 4'hb == _T_53 ? 2'h2 : _GEN_976; // @[ROB.scala 194:{44,44}]
  wire [1:0] _GEN_1109 = io_fu_3_valid ? _GEN_1037 : _GEN_965; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1110 = io_fu_3_valid ? _GEN_1038 : _GEN_966; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1111 = io_fu_3_valid ? _GEN_1039 : _GEN_967; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1112 = io_fu_3_valid ? _GEN_1040 : _GEN_968; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1113 = io_fu_3_valid ? _GEN_1041 : _GEN_969; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1114 = io_fu_3_valid ? _GEN_1042 : _GEN_970; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1115 = io_fu_3_valid ? _GEN_1043 : _GEN_971; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1116 = io_fu_3_valid ? _GEN_1044 : _GEN_972; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1117 = io_fu_3_valid ? _GEN_1045 : _GEN_973; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1118 = io_fu_3_valid ? _GEN_1046 : _GEN_974; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1119 = io_fu_3_valid ? _GEN_1047 : _GEN_975; // @[ROB.scala 192:23]
  wire [1:0] _GEN_1120 = io_fu_3_valid ? _GEN_1048 : _GEN_976; // @[ROB.scala 192:23]
  wire [3:0] _T_65 = io_rs_0_bits_id - 4'h1; // @[ROB.scala 212:31]
  wire [1:0] _GEN_1169 = 4'h0 == _T_65 ? 2'h1 : _GEN_1109; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1170 = 4'h1 == _T_65 ? 2'h1 : _GEN_1110; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1171 = 4'h2 == _T_65 ? 2'h1 : _GEN_1111; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1172 = 4'h3 == _T_65 ? 2'h1 : _GEN_1112; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1173 = 4'h4 == _T_65 ? 2'h1 : _GEN_1113; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1174 = 4'h5 == _T_65 ? 2'h1 : _GEN_1114; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1175 = 4'h6 == _T_65 ? 2'h1 : _GEN_1115; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1176 = 4'h7 == _T_65 ? 2'h1 : _GEN_1116; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1177 = 4'h8 == _T_65 ? 2'h1 : _GEN_1117; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1178 = 4'h9 == _T_65 ? 2'h1 : _GEN_1118; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1179 = 4'ha == _T_65 ? 2'h1 : _GEN_1119; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1180 = 4'hb == _T_65 ? 2'h1 : _GEN_1120; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1181 = io_rs_0_valid ? _GEN_1169 : _GEN_1109; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1182 = io_rs_0_valid ? _GEN_1170 : _GEN_1110; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1183 = io_rs_0_valid ? _GEN_1171 : _GEN_1111; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1184 = io_rs_0_valid ? _GEN_1172 : _GEN_1112; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1185 = io_rs_0_valid ? _GEN_1173 : _GEN_1113; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1186 = io_rs_0_valid ? _GEN_1174 : _GEN_1114; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1187 = io_rs_0_valid ? _GEN_1175 : _GEN_1115; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1188 = io_rs_0_valid ? _GEN_1176 : _GEN_1116; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1189 = io_rs_0_valid ? _GEN_1177 : _GEN_1117; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1190 = io_rs_0_valid ? _GEN_1178 : _GEN_1118; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1191 = io_rs_0_valid ? _GEN_1179 : _GEN_1119; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1192 = io_rs_0_valid ? _GEN_1180 : _GEN_1120; // @[ROB.scala 211:22]
  wire [3:0] _T_67 = io_rs_1_bits_id - 4'h1; // @[ROB.scala 212:31]
  wire [1:0] _GEN_1193 = 4'h0 == _T_67 ? 2'h1 : _GEN_1181; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1194 = 4'h1 == _T_67 ? 2'h1 : _GEN_1182; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1195 = 4'h2 == _T_67 ? 2'h1 : _GEN_1183; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1196 = 4'h3 == _T_67 ? 2'h1 : _GEN_1184; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1197 = 4'h4 == _T_67 ? 2'h1 : _GEN_1185; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1198 = 4'h5 == _T_67 ? 2'h1 : _GEN_1186; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1199 = 4'h6 == _T_67 ? 2'h1 : _GEN_1187; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1200 = 4'h7 == _T_67 ? 2'h1 : _GEN_1188; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1201 = 4'h8 == _T_67 ? 2'h1 : _GEN_1189; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1202 = 4'h9 == _T_67 ? 2'h1 : _GEN_1190; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1203 = 4'ha == _T_67 ? 2'h1 : _GEN_1191; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1204 = 4'hb == _T_67 ? 2'h1 : _GEN_1192; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1205 = io_rs_1_valid ? _GEN_1193 : _GEN_1181; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1206 = io_rs_1_valid ? _GEN_1194 : _GEN_1182; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1207 = io_rs_1_valid ? _GEN_1195 : _GEN_1183; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1208 = io_rs_1_valid ? _GEN_1196 : _GEN_1184; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1209 = io_rs_1_valid ? _GEN_1197 : _GEN_1185; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1210 = io_rs_1_valid ? _GEN_1198 : _GEN_1186; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1211 = io_rs_1_valid ? _GEN_1199 : _GEN_1187; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1212 = io_rs_1_valid ? _GEN_1200 : _GEN_1188; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1213 = io_rs_1_valid ? _GEN_1201 : _GEN_1189; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1214 = io_rs_1_valid ? _GEN_1202 : _GEN_1190; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1215 = io_rs_1_valid ? _GEN_1203 : _GEN_1191; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1216 = io_rs_1_valid ? _GEN_1204 : _GEN_1192; // @[ROB.scala 211:22]
  wire [3:0] _T_69 = io_rs_2_bits_id - 4'h1; // @[ROB.scala 212:31]
  wire [1:0] _GEN_1217 = 4'h0 == _T_69 ? 2'h1 : _GEN_1205; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1218 = 4'h1 == _T_69 ? 2'h1 : _GEN_1206; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1219 = 4'h2 == _T_69 ? 2'h1 : _GEN_1207; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1220 = 4'h3 == _T_69 ? 2'h1 : _GEN_1208; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1221 = 4'h4 == _T_69 ? 2'h1 : _GEN_1209; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1222 = 4'h5 == _T_69 ? 2'h1 : _GEN_1210; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1223 = 4'h6 == _T_69 ? 2'h1 : _GEN_1211; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1224 = 4'h7 == _T_69 ? 2'h1 : _GEN_1212; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1225 = 4'h8 == _T_69 ? 2'h1 : _GEN_1213; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1226 = 4'h9 == _T_69 ? 2'h1 : _GEN_1214; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1227 = 4'ha == _T_69 ? 2'h1 : _GEN_1215; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1228 = 4'hb == _T_69 ? 2'h1 : _GEN_1216; // @[ROB.scala 212:{44,44}]
  wire [1:0] _GEN_1229 = io_rs_2_valid ? _GEN_1217 : _GEN_1205; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1230 = io_rs_2_valid ? _GEN_1218 : _GEN_1206; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1231 = io_rs_2_valid ? _GEN_1219 : _GEN_1207; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1232 = io_rs_2_valid ? _GEN_1220 : _GEN_1208; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1233 = io_rs_2_valid ? _GEN_1221 : _GEN_1209; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1234 = io_rs_2_valid ? _GEN_1222 : _GEN_1210; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1235 = io_rs_2_valid ? _GEN_1223 : _GEN_1211; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1236 = io_rs_2_valid ? _GEN_1224 : _GEN_1212; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1237 = io_rs_2_valid ? _GEN_1225 : _GEN_1213; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1238 = io_rs_2_valid ? _GEN_1226 : _GEN_1214; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1239 = io_rs_2_valid ? _GEN_1227 : _GEN_1215; // @[ROB.scala 211:22]
  wire [1:0] _GEN_1240 = io_rs_2_valid ? _GEN_1228 : _GEN_1216; // @[ROB.scala 211:22]
  wire [3:0] _T_71 = io_rs_3_bits_id - 4'h1; // @[ROB.scala 212:31]
  assign io_enq_ready = ~full & ~_GEN_11; // @[ROB.scala 138:27]
  assign io_deq_valid = _GEN_23 == 2'h2 & _GEN_35; // @[ROB.scala 139:52]
  assign io_deq_bits_rdWrEn = _GEN_59 != 5'h0; // @[ROB.scala 142:44]
  assign io_deq_bits_rd = 4'hb == head ? entries_11_rd : _GEN_58; // @[ROB.scala 141:{20,20}]
  assign io_deq_bits_data = 4'hb == head ? entries_11_data : _GEN_46; // @[ROB.scala 140:{22,22}]
  assign io_deq_bits_id = {{4'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 150:20]
  assign io_deq_bits_brAddr = 4'hb == head ? entries_11_brAddr : _GEN_94; // @[ROB.scala 145:{24,24}]
  assign io_deq_bits_brTaken = 4'hb == head ? entries_11_brTaken : _GEN_106; // @[ROB.scala 146:{25,25}]
  assign io_deq_bits_excpAddr = 4'hb == head ? entries_11_excpAddr : _GEN_130; // @[ROB.scala 148:{26,26}]
  assign io_deq_bits_excpValid = 4'hb == head ? entries_11_excpValid : _GEN_142; // @[ROB.scala 149:{27,27}]
  assign io_deq_bits_pc = 4'hb == head ? entries_11_pc : _GEN_70; // @[ROB.scala 143:{20,20}]
  assign io_deq_bits_inst = 4'hb == head ? entries_11_inst : _GEN_82; // @[ROB.scala 144:{22,22}]
  assign io_deq_bits_predictBrTaken = 4'hb == head ? entries_11_predictBrTaken : _GEN_118; // @[ROB.scala 147:{32,32}]
  assign io_read_0_busy = entries_0_busy; // @[ROB.scala 203:16]
  assign io_read_0_state = entries_0_state; // @[ROB.scala 205:17]
  assign io_read_0_rd = entries_0_rd; // @[ROB.scala 206:14]
  assign io_read_0_data = entries_0_data; // @[ROB.scala 204:16]
  assign io_read_1_busy = entries_1_busy; // @[ROB.scala 203:16]
  assign io_read_1_state = entries_1_state; // @[ROB.scala 205:17]
  assign io_read_1_rd = entries_1_rd; // @[ROB.scala 206:14]
  assign io_read_1_data = entries_1_data; // @[ROB.scala 204:16]
  assign io_read_2_busy = entries_2_busy; // @[ROB.scala 203:16]
  assign io_read_2_state = entries_2_state; // @[ROB.scala 205:17]
  assign io_read_2_rd = entries_2_rd; // @[ROB.scala 206:14]
  assign io_read_2_data = entries_2_data; // @[ROB.scala 204:16]
  assign io_read_3_busy = entries_3_busy; // @[ROB.scala 203:16]
  assign io_read_3_state = entries_3_state; // @[ROB.scala 205:17]
  assign io_read_3_rd = entries_3_rd; // @[ROB.scala 206:14]
  assign io_read_3_data = entries_3_data; // @[ROB.scala 204:16]
  assign io_read_4_busy = entries_4_busy; // @[ROB.scala 203:16]
  assign io_read_4_state = entries_4_state; // @[ROB.scala 205:17]
  assign io_read_4_rd = entries_4_rd; // @[ROB.scala 206:14]
  assign io_read_4_data = entries_4_data; // @[ROB.scala 204:16]
  assign io_read_5_busy = entries_5_busy; // @[ROB.scala 203:16]
  assign io_read_5_state = entries_5_state; // @[ROB.scala 205:17]
  assign io_read_5_rd = entries_5_rd; // @[ROB.scala 206:14]
  assign io_read_5_data = entries_5_data; // @[ROB.scala 204:16]
  assign io_read_6_busy = entries_6_busy; // @[ROB.scala 203:16]
  assign io_read_6_state = entries_6_state; // @[ROB.scala 205:17]
  assign io_read_6_rd = entries_6_rd; // @[ROB.scala 206:14]
  assign io_read_6_data = entries_6_data; // @[ROB.scala 204:16]
  assign io_read_7_busy = entries_7_busy; // @[ROB.scala 203:16]
  assign io_read_7_state = entries_7_state; // @[ROB.scala 205:17]
  assign io_read_7_rd = entries_7_rd; // @[ROB.scala 206:14]
  assign io_read_7_data = entries_7_data; // @[ROB.scala 204:16]
  assign io_read_8_busy = entries_8_busy; // @[ROB.scala 203:16]
  assign io_read_8_state = entries_8_state; // @[ROB.scala 205:17]
  assign io_read_8_rd = entries_8_rd; // @[ROB.scala 206:14]
  assign io_read_8_data = entries_8_data; // @[ROB.scala 204:16]
  assign io_read_9_busy = entries_9_busy; // @[ROB.scala 203:16]
  assign io_read_9_state = entries_9_state; // @[ROB.scala 205:17]
  assign io_read_9_rd = entries_9_rd; // @[ROB.scala 206:14]
  assign io_read_9_data = entries_9_data; // @[ROB.scala 204:16]
  assign io_read_10_busy = entries_10_busy; // @[ROB.scala 203:16]
  assign io_read_10_state = entries_10_state; // @[ROB.scala 205:17]
  assign io_read_10_rd = entries_10_rd; // @[ROB.scala 206:14]
  assign io_read_10_data = entries_10_data; // @[ROB.scala 204:16]
  assign io_read_11_busy = entries_11_busy; // @[ROB.scala 203:16]
  assign io_read_11_state = entries_11_state; // @[ROB.scala 205:17]
  assign io_read_11_rd = entries_11_rd; // @[ROB.scala 206:14]
  assign io_read_11_data = entries_11_data; // @[ROB.scala 204:16]
  assign io_id = tail + 4'h1; // @[ROB.scala 137:19]
  assign io_regStatus_0_owner = regResStat_0_owner; // @[ROB.scala 136:18]
  assign io_regStatus_1_owner = regResStat_1_owner; // @[ROB.scala 136:18]
  assign io_regStatus_2_owner = regResStat_2_owner; // @[ROB.scala 136:18]
  assign io_regStatus_3_owner = regResStat_3_owner; // @[ROB.scala 136:18]
  assign io_regStatus_4_owner = regResStat_4_owner; // @[ROB.scala 136:18]
  assign io_regStatus_5_owner = regResStat_5_owner; // @[ROB.scala 136:18]
  assign io_regStatus_6_owner = regResStat_6_owner; // @[ROB.scala 136:18]
  assign io_regStatus_7_owner = regResStat_7_owner; // @[ROB.scala 136:18]
  assign io_regStatus_8_owner = regResStat_8_owner; // @[ROB.scala 136:18]
  assign io_regStatus_9_owner = regResStat_9_owner; // @[ROB.scala 136:18]
  assign io_regStatus_10_owner = regResStat_10_owner; // @[ROB.scala 136:18]
  assign io_regStatus_11_owner = regResStat_11_owner; // @[ROB.scala 136:18]
  assign io_regStatus_12_owner = regResStat_12_owner; // @[ROB.scala 136:18]
  assign io_regStatus_13_owner = regResStat_13_owner; // @[ROB.scala 136:18]
  assign io_regStatus_14_owner = regResStat_14_owner; // @[ROB.scala 136:18]
  assign io_regStatus_15_owner = regResStat_15_owner; // @[ROB.scala 136:18]
  assign io_regStatus_16_owner = regResStat_16_owner; // @[ROB.scala 136:18]
  assign io_regStatus_17_owner = regResStat_17_owner; // @[ROB.scala 136:18]
  assign io_regStatus_18_owner = regResStat_18_owner; // @[ROB.scala 136:18]
  assign io_regStatus_19_owner = regResStat_19_owner; // @[ROB.scala 136:18]
  assign io_regStatus_20_owner = regResStat_20_owner; // @[ROB.scala 136:18]
  assign io_regStatus_21_owner = regResStat_21_owner; // @[ROB.scala 136:18]
  assign io_regStatus_22_owner = regResStat_22_owner; // @[ROB.scala 136:18]
  assign io_regStatus_23_owner = regResStat_23_owner; // @[ROB.scala 136:18]
  assign io_regStatus_24_owner = regResStat_24_owner; // @[ROB.scala 136:18]
  assign io_regStatus_25_owner = regResStat_25_owner; // @[ROB.scala 136:18]
  assign io_regStatus_26_owner = regResStat_26_owner; // @[ROB.scala 136:18]
  assign io_regStatus_27_owner = regResStat_27_owner; // @[ROB.scala 136:18]
  assign io_regStatus_28_owner = regResStat_28_owner; // @[ROB.scala 136:18]
  assign io_regStatus_29_owner = regResStat_29_owner; // @[ROB.scala 136:18]
  assign io_regStatus_30_owner = regResStat_30_owner; // @[ROB.scala 136:18]
  assign io_regStatus_31_owner = regResStat_31_owner; // @[ROB.scala 136:18]
  always @(posedge clock) begin
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_0_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h0 == head) begin // @[ROB.scala 169:28]
        entries_0_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_0_busy <= _GEN_260;
      end
    end else begin
      entries_0_busy <= _GEN_260;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h0 == _T_71) begin // @[ROB.scala 212:44]
        entries_0_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_0_state <= _GEN_1229;
      end
    end else begin
      entries_0_state <= _GEN_1229;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h0 == tail) begin // @[ROB.scala 157:26]
        entries_0_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 193:43]
        entries_0_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_0_data <= _GEN_953;
      end
    end else begin
      entries_0_data <= _GEN_953;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 195:45]
        entries_0_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_0_brAddr <= _GEN_977;
      end
    end else begin
      entries_0_brAddr <= _GEN_977;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 196:46]
        entries_0_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_0_brTaken <= _GEN_989;
      end
    end else begin
      entries_0_brTaken <= _GEN_989;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h0 == tail) begin // @[ROB.scala 160:38]
        entries_0_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 197:47]
        entries_0_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_0_excpAddr <= _GEN_1001;
      end
    end else begin
      entries_0_excpAddr <= _GEN_1001;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h0 == _T_53) begin // @[ROB.scala 198:48]
        entries_0_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_0_excpValid <= _GEN_1013;
      end
    end else begin
      entries_0_excpValid <= _GEN_1013;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h0 == tail) begin // @[ROB.scala 158:26]
        entries_0_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h0 == tail) begin // @[ROB.scala 159:28]
        entries_0_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_1_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h1 == head) begin // @[ROB.scala 169:28]
        entries_1_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_1_busy <= _GEN_261;
      end
    end else begin
      entries_1_busy <= _GEN_261;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h1 == _T_71) begin // @[ROB.scala 212:44]
        entries_1_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_1_state <= _GEN_1230;
      end
    end else begin
      entries_1_state <= _GEN_1230;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h1 == tail) begin // @[ROB.scala 157:26]
        entries_1_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 193:43]
        entries_1_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_1_data <= _GEN_954;
      end
    end else begin
      entries_1_data <= _GEN_954;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 195:45]
        entries_1_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_1_brAddr <= _GEN_978;
      end
    end else begin
      entries_1_brAddr <= _GEN_978;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 196:46]
        entries_1_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_1_brTaken <= _GEN_990;
      end
    end else begin
      entries_1_brTaken <= _GEN_990;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h1 == tail) begin // @[ROB.scala 160:38]
        entries_1_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 197:47]
        entries_1_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_1_excpAddr <= _GEN_1002;
      end
    end else begin
      entries_1_excpAddr <= _GEN_1002;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h1 == _T_53) begin // @[ROB.scala 198:48]
        entries_1_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_1_excpValid <= _GEN_1014;
      end
    end else begin
      entries_1_excpValid <= _GEN_1014;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h1 == tail) begin // @[ROB.scala 158:26]
        entries_1_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h1 == tail) begin // @[ROB.scala 159:28]
        entries_1_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_2_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h2 == head) begin // @[ROB.scala 169:28]
        entries_2_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_2_busy <= _GEN_262;
      end
    end else begin
      entries_2_busy <= _GEN_262;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h2 == _T_71) begin // @[ROB.scala 212:44]
        entries_2_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_2_state <= _GEN_1231;
      end
    end else begin
      entries_2_state <= _GEN_1231;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h2 == tail) begin // @[ROB.scala 157:26]
        entries_2_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 193:43]
        entries_2_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_2_data <= _GEN_955;
      end
    end else begin
      entries_2_data <= _GEN_955;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 195:45]
        entries_2_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_2_brAddr <= _GEN_979;
      end
    end else begin
      entries_2_brAddr <= _GEN_979;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 196:46]
        entries_2_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_2_brTaken <= _GEN_991;
      end
    end else begin
      entries_2_brTaken <= _GEN_991;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h2 == tail) begin // @[ROB.scala 160:38]
        entries_2_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 197:47]
        entries_2_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_2_excpAddr <= _GEN_1003;
      end
    end else begin
      entries_2_excpAddr <= _GEN_1003;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h2 == _T_53) begin // @[ROB.scala 198:48]
        entries_2_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_2_excpValid <= _GEN_1015;
      end
    end else begin
      entries_2_excpValid <= _GEN_1015;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h2 == tail) begin // @[ROB.scala 158:26]
        entries_2_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h2 == tail) begin // @[ROB.scala 159:28]
        entries_2_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_3_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h3 == head) begin // @[ROB.scala 169:28]
        entries_3_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_3_busy <= _GEN_263;
      end
    end else begin
      entries_3_busy <= _GEN_263;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h3 == _T_71) begin // @[ROB.scala 212:44]
        entries_3_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_3_state <= _GEN_1232;
      end
    end else begin
      entries_3_state <= _GEN_1232;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h3 == tail) begin // @[ROB.scala 157:26]
        entries_3_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 193:43]
        entries_3_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_3_data <= _GEN_956;
      end
    end else begin
      entries_3_data <= _GEN_956;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 195:45]
        entries_3_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_3_brAddr <= _GEN_980;
      end
    end else begin
      entries_3_brAddr <= _GEN_980;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 196:46]
        entries_3_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_3_brTaken <= _GEN_992;
      end
    end else begin
      entries_3_brTaken <= _GEN_992;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h3 == tail) begin // @[ROB.scala 160:38]
        entries_3_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 197:47]
        entries_3_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_3_excpAddr <= _GEN_1004;
      end
    end else begin
      entries_3_excpAddr <= _GEN_1004;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h3 == _T_53) begin // @[ROB.scala 198:48]
        entries_3_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_3_excpValid <= _GEN_1016;
      end
    end else begin
      entries_3_excpValid <= _GEN_1016;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h3 == tail) begin // @[ROB.scala 158:26]
        entries_3_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h3 == tail) begin // @[ROB.scala 159:28]
        entries_3_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_4_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h4 == head) begin // @[ROB.scala 169:28]
        entries_4_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_4_busy <= _GEN_264;
      end
    end else begin
      entries_4_busy <= _GEN_264;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h4 == _T_71) begin // @[ROB.scala 212:44]
        entries_4_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_4_state <= _GEN_1233;
      end
    end else begin
      entries_4_state <= _GEN_1233;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h4 == tail) begin // @[ROB.scala 157:26]
        entries_4_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 193:43]
        entries_4_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_4_data <= _GEN_957;
      end
    end else begin
      entries_4_data <= _GEN_957;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 195:45]
        entries_4_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_4_brAddr <= _GEN_981;
      end
    end else begin
      entries_4_brAddr <= _GEN_981;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 196:46]
        entries_4_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_4_brTaken <= _GEN_993;
      end
    end else begin
      entries_4_brTaken <= _GEN_993;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h4 == tail) begin // @[ROB.scala 160:38]
        entries_4_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 197:47]
        entries_4_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_4_excpAddr <= _GEN_1005;
      end
    end else begin
      entries_4_excpAddr <= _GEN_1005;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h4 == _T_53) begin // @[ROB.scala 198:48]
        entries_4_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_4_excpValid <= _GEN_1017;
      end
    end else begin
      entries_4_excpValid <= _GEN_1017;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h4 == tail) begin // @[ROB.scala 158:26]
        entries_4_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h4 == tail) begin // @[ROB.scala 159:28]
        entries_4_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_5_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h5 == head) begin // @[ROB.scala 169:28]
        entries_5_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_5_busy <= _GEN_265;
      end
    end else begin
      entries_5_busy <= _GEN_265;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h5 == _T_71) begin // @[ROB.scala 212:44]
        entries_5_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_5_state <= _GEN_1234;
      end
    end else begin
      entries_5_state <= _GEN_1234;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h5 == tail) begin // @[ROB.scala 157:26]
        entries_5_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 193:43]
        entries_5_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_5_data <= _GEN_958;
      end
    end else begin
      entries_5_data <= _GEN_958;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 195:45]
        entries_5_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_5_brAddr <= _GEN_982;
      end
    end else begin
      entries_5_brAddr <= _GEN_982;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 196:46]
        entries_5_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_5_brTaken <= _GEN_994;
      end
    end else begin
      entries_5_brTaken <= _GEN_994;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h5 == tail) begin // @[ROB.scala 160:38]
        entries_5_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 197:47]
        entries_5_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_5_excpAddr <= _GEN_1006;
      end
    end else begin
      entries_5_excpAddr <= _GEN_1006;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h5 == _T_53) begin // @[ROB.scala 198:48]
        entries_5_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_5_excpValid <= _GEN_1018;
      end
    end else begin
      entries_5_excpValid <= _GEN_1018;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h5 == tail) begin // @[ROB.scala 158:26]
        entries_5_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h5 == tail) begin // @[ROB.scala 159:28]
        entries_5_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_6_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h6 == head) begin // @[ROB.scala 169:28]
        entries_6_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_6_busy <= _GEN_266;
      end
    end else begin
      entries_6_busy <= _GEN_266;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h6 == _T_71) begin // @[ROB.scala 212:44]
        entries_6_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_6_state <= _GEN_1235;
      end
    end else begin
      entries_6_state <= _GEN_1235;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h6 == tail) begin // @[ROB.scala 157:26]
        entries_6_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 193:43]
        entries_6_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_6_data <= _GEN_959;
      end
    end else begin
      entries_6_data <= _GEN_959;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 195:45]
        entries_6_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_6_brAddr <= _GEN_983;
      end
    end else begin
      entries_6_brAddr <= _GEN_983;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 196:46]
        entries_6_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_6_brTaken <= _GEN_995;
      end
    end else begin
      entries_6_brTaken <= _GEN_995;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h6 == tail) begin // @[ROB.scala 160:38]
        entries_6_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 197:47]
        entries_6_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_6_excpAddr <= _GEN_1007;
      end
    end else begin
      entries_6_excpAddr <= _GEN_1007;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h6 == _T_53) begin // @[ROB.scala 198:48]
        entries_6_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_6_excpValid <= _GEN_1019;
      end
    end else begin
      entries_6_excpValid <= _GEN_1019;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h6 == tail) begin // @[ROB.scala 158:26]
        entries_6_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h6 == tail) begin // @[ROB.scala 159:28]
        entries_6_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_7_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h7 == head) begin // @[ROB.scala 169:28]
        entries_7_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_7_busy <= _GEN_267;
      end
    end else begin
      entries_7_busy <= _GEN_267;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h7 == _T_71) begin // @[ROB.scala 212:44]
        entries_7_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_7_state <= _GEN_1236;
      end
    end else begin
      entries_7_state <= _GEN_1236;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h7 == tail) begin // @[ROB.scala 157:26]
        entries_7_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 193:43]
        entries_7_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_7_data <= _GEN_960;
      end
    end else begin
      entries_7_data <= _GEN_960;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 195:45]
        entries_7_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_7_brAddr <= _GEN_984;
      end
    end else begin
      entries_7_brAddr <= _GEN_984;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 196:46]
        entries_7_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_7_brTaken <= _GEN_996;
      end
    end else begin
      entries_7_brTaken <= _GEN_996;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h7 == tail) begin // @[ROB.scala 160:38]
        entries_7_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 197:47]
        entries_7_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_7_excpAddr <= _GEN_1008;
      end
    end else begin
      entries_7_excpAddr <= _GEN_1008;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h7 == _T_53) begin // @[ROB.scala 198:48]
        entries_7_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_7_excpValid <= _GEN_1020;
      end
    end else begin
      entries_7_excpValid <= _GEN_1020;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h7 == tail) begin // @[ROB.scala 158:26]
        entries_7_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h7 == tail) begin // @[ROB.scala 159:28]
        entries_7_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_8_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h8 == head) begin // @[ROB.scala 169:28]
        entries_8_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_8_busy <= _GEN_268;
      end
    end else begin
      entries_8_busy <= _GEN_268;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h8 == _T_71) begin // @[ROB.scala 212:44]
        entries_8_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_8_state <= _GEN_1237;
      end
    end else begin
      entries_8_state <= _GEN_1237;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h8 == tail) begin // @[ROB.scala 157:26]
        entries_8_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 193:43]
        entries_8_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_8_data <= _GEN_961;
      end
    end else begin
      entries_8_data <= _GEN_961;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 195:45]
        entries_8_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_8_brAddr <= _GEN_985;
      end
    end else begin
      entries_8_brAddr <= _GEN_985;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 196:46]
        entries_8_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_8_brTaken <= _GEN_997;
      end
    end else begin
      entries_8_brTaken <= _GEN_997;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h8 == tail) begin // @[ROB.scala 160:38]
        entries_8_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 197:47]
        entries_8_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_8_excpAddr <= _GEN_1009;
      end
    end else begin
      entries_8_excpAddr <= _GEN_1009;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h8 == _T_53) begin // @[ROB.scala 198:48]
        entries_8_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_8_excpValid <= _GEN_1021;
      end
    end else begin
      entries_8_excpValid <= _GEN_1021;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h8 == tail) begin // @[ROB.scala 158:26]
        entries_8_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h8 == tail) begin // @[ROB.scala 159:28]
        entries_8_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_9_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'h9 == head) begin // @[ROB.scala 169:28]
        entries_9_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_9_busy <= _GEN_269;
      end
    end else begin
      entries_9_busy <= _GEN_269;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'h9 == _T_71) begin // @[ROB.scala 212:44]
        entries_9_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_9_state <= _GEN_1238;
      end
    end else begin
      entries_9_state <= _GEN_1238;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h9 == tail) begin // @[ROB.scala 157:26]
        entries_9_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 193:43]
        entries_9_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_9_data <= _GEN_962;
      end
    end else begin
      entries_9_data <= _GEN_962;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 195:45]
        entries_9_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_9_brAddr <= _GEN_986;
      end
    end else begin
      entries_9_brAddr <= _GEN_986;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 196:46]
        entries_9_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_9_brTaken <= _GEN_998;
      end
    end else begin
      entries_9_brTaken <= _GEN_998;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h9 == tail) begin // @[ROB.scala 160:38]
        entries_9_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 197:47]
        entries_9_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_9_excpAddr <= _GEN_1010;
      end
    end else begin
      entries_9_excpAddr <= _GEN_1010;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'h9 == _T_53) begin // @[ROB.scala 198:48]
        entries_9_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_9_excpValid <= _GEN_1022;
      end
    end else begin
      entries_9_excpValid <= _GEN_1022;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h9 == tail) begin // @[ROB.scala 158:26]
        entries_9_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'h9 == tail) begin // @[ROB.scala 159:28]
        entries_9_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_10_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'ha == head) begin // @[ROB.scala 169:28]
        entries_10_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_10_busy <= _GEN_270;
      end
    end else begin
      entries_10_busy <= _GEN_270;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'ha == _T_71) begin // @[ROB.scala 212:44]
        entries_10_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_10_state <= _GEN_1239;
      end
    end else begin
      entries_10_state <= _GEN_1239;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'ha == tail) begin // @[ROB.scala 157:26]
        entries_10_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'ha == _T_53) begin // @[ROB.scala 193:43]
        entries_10_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_10_data <= _GEN_963;
      end
    end else begin
      entries_10_data <= _GEN_963;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'ha == _T_53) begin // @[ROB.scala 195:45]
        entries_10_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_10_brAddr <= _GEN_987;
      end
    end else begin
      entries_10_brAddr <= _GEN_987;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'ha == _T_53) begin // @[ROB.scala 196:46]
        entries_10_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_10_brTaken <= _GEN_999;
      end
    end else begin
      entries_10_brTaken <= _GEN_999;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'ha == tail) begin // @[ROB.scala 160:38]
        entries_10_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'ha == _T_53) begin // @[ROB.scala 197:47]
        entries_10_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_10_excpAddr <= _GEN_1011;
      end
    end else begin
      entries_10_excpAddr <= _GEN_1011;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'ha == _T_53) begin // @[ROB.scala 198:48]
        entries_10_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_10_excpValid <= _GEN_1023;
      end
    end else begin
      entries_10_excpValid <= _GEN_1023;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'ha == tail) begin // @[ROB.scala 158:26]
        entries_10_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'ha == tail) begin // @[ROB.scala 159:28]
        entries_10_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      entries_11_busy <= 1'h0; // @[ROB.scala 217:37]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (4'hb == head) begin // @[ROB.scala 169:28]
        entries_11_busy <= 1'h0; // @[ROB.scala 169:28]
      end else begin
        entries_11_busy <= _GEN_271;
      end
    end else begin
      entries_11_busy <= _GEN_271;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 211:22]
      if (4'hb == _T_71) begin // @[ROB.scala 212:44]
        entries_11_state <= 2'h1; // @[ROB.scala 212:44]
      end else begin
        entries_11_state <= _GEN_1240;
      end
    end else begin
      entries_11_state <= _GEN_1240;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'hb == tail) begin // @[ROB.scala 157:26]
        entries_11_rd <= io_enq_bits_rd; // @[ROB.scala 157:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'hb == _T_53) begin // @[ROB.scala 193:43]
        entries_11_data <= io_fu_3_bits_data; // @[ROB.scala 193:43]
      end else begin
        entries_11_data <= _GEN_964;
      end
    end else begin
      entries_11_data <= _GEN_964;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'hb == _T_53) begin // @[ROB.scala 195:45]
        entries_11_brAddr <= 32'h0; // @[ROB.scala 195:45]
      end else begin
        entries_11_brAddr <= _GEN_988;
      end
    end else begin
      entries_11_brAddr <= _GEN_988;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'hb == _T_53) begin // @[ROB.scala 196:46]
        entries_11_brTaken <= 1'h0; // @[ROB.scala 196:46]
      end else begin
        entries_11_brTaken <= _GEN_1000;
      end
    end else begin
      entries_11_brTaken <= _GEN_1000;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'hb == tail) begin // @[ROB.scala 160:38]
        entries_11_predictBrTaken <= io_enq_bits_predictBrTaken; // @[ROB.scala 160:38]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'hb == _T_53) begin // @[ROB.scala 197:47]
        entries_11_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 197:47]
      end else begin
        entries_11_excpAddr <= _GEN_1012;
      end
    end else begin
      entries_11_excpAddr <= _GEN_1012;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 192:23]
      if (4'hb == _T_53) begin // @[ROB.scala 198:48]
        entries_11_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 198:48]
      end else begin
        entries_11_excpValid <= _GEN_1024;
      end
    end else begin
      entries_11_excpValid <= _GEN_1024;
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'hb == tail) begin // @[ROB.scala 158:26]
        entries_11_pc <= io_enq_bits_pc; // @[ROB.scala 158:26]
      end
    end
    if (_T) begin // @[ROB.scala 153:24]
      if (4'hb == tail) begin // @[ROB.scala 159:28]
        entries_11_inst <= io_enq_bits_inst; // @[ROB.scala 159:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_0_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h0 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_0_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_0_owner <= _GEN_332;
        end
      end else begin
        regResStat_0_owner <= _GEN_332;
      end
    end else begin
      regResStat_0_owner <= _GEN_332;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_1_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_1_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_1_owner <= _GEN_333;
        end
      end else begin
        regResStat_1_owner <= _GEN_333;
      end
    end else begin
      regResStat_1_owner <= _GEN_333;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_2_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h2 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_2_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_2_owner <= _GEN_334;
        end
      end else begin
        regResStat_2_owner <= _GEN_334;
      end
    end else begin
      regResStat_2_owner <= _GEN_334;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_3_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h3 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_3_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_3_owner <= _GEN_335;
        end
      end else begin
        regResStat_3_owner <= _GEN_335;
      end
    end else begin
      regResStat_3_owner <= _GEN_335;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_4_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h4 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_4_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_4_owner <= _GEN_336;
        end
      end else begin
        regResStat_4_owner <= _GEN_336;
      end
    end else begin
      regResStat_4_owner <= _GEN_336;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_5_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h5 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_5_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_5_owner <= _GEN_337;
        end
      end else begin
        regResStat_5_owner <= _GEN_337;
      end
    end else begin
      regResStat_5_owner <= _GEN_337;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_6_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h6 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_6_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_6_owner <= _GEN_338;
        end
      end else begin
        regResStat_6_owner <= _GEN_338;
      end
    end else begin
      regResStat_6_owner <= _GEN_338;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_7_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h7 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_7_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_7_owner <= _GEN_339;
        end
      end else begin
        regResStat_7_owner <= _GEN_339;
      end
    end else begin
      regResStat_7_owner <= _GEN_339;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_8_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h8 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_8_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_8_owner <= _GEN_340;
        end
      end else begin
        regResStat_8_owner <= _GEN_340;
      end
    end else begin
      regResStat_8_owner <= _GEN_340;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_9_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h9 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_9_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_9_owner <= _GEN_341;
        end
      end else begin
        regResStat_9_owner <= _GEN_341;
      end
    end else begin
      regResStat_9_owner <= _GEN_341;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_10_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'ha == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_10_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_10_owner <= _GEN_342;
        end
      end else begin
        regResStat_10_owner <= _GEN_342;
      end
    end else begin
      regResStat_10_owner <= _GEN_342;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_11_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'hb == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_11_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_11_owner <= _GEN_343;
        end
      end else begin
        regResStat_11_owner <= _GEN_343;
      end
    end else begin
      regResStat_11_owner <= _GEN_343;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_12_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'hc == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_12_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_12_owner <= _GEN_344;
        end
      end else begin
        regResStat_12_owner <= _GEN_344;
      end
    end else begin
      regResStat_12_owner <= _GEN_344;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_13_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'hd == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_13_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_13_owner <= _GEN_345;
        end
      end else begin
        regResStat_13_owner <= _GEN_345;
      end
    end else begin
      regResStat_13_owner <= _GEN_345;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_14_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'he == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_14_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_14_owner <= _GEN_346;
        end
      end else begin
        regResStat_14_owner <= _GEN_346;
      end
    end else begin
      regResStat_14_owner <= _GEN_346;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_15_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'hf == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_15_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_15_owner <= _GEN_347;
        end
      end else begin
        regResStat_15_owner <= _GEN_347;
      end
    end else begin
      regResStat_15_owner <= _GEN_347;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_16_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h10 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_16_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_16_owner <= _GEN_348;
        end
      end else begin
        regResStat_16_owner <= _GEN_348;
      end
    end else begin
      regResStat_16_owner <= _GEN_348;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_17_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h11 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_17_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_17_owner <= _GEN_349;
        end
      end else begin
        regResStat_17_owner <= _GEN_349;
      end
    end else begin
      regResStat_17_owner <= _GEN_349;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_18_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h12 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_18_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_18_owner <= _GEN_350;
        end
      end else begin
        regResStat_18_owner <= _GEN_350;
      end
    end else begin
      regResStat_18_owner <= _GEN_350;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_19_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h13 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_19_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_19_owner <= _GEN_351;
        end
      end else begin
        regResStat_19_owner <= _GEN_351;
      end
    end else begin
      regResStat_19_owner <= _GEN_351;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_20_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h14 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_20_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_20_owner <= _GEN_352;
        end
      end else begin
        regResStat_20_owner <= _GEN_352;
      end
    end else begin
      regResStat_20_owner <= _GEN_352;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_21_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h15 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_21_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_21_owner <= _GEN_353;
        end
      end else begin
        regResStat_21_owner <= _GEN_353;
      end
    end else begin
      regResStat_21_owner <= _GEN_353;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_22_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h16 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_22_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_22_owner <= _GEN_354;
        end
      end else begin
        regResStat_22_owner <= _GEN_354;
      end
    end else begin
      regResStat_22_owner <= _GEN_354;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_23_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h17 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_23_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_23_owner <= _GEN_355;
        end
      end else begin
        regResStat_23_owner <= _GEN_355;
      end
    end else begin
      regResStat_23_owner <= _GEN_355;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_24_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h18 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_24_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_24_owner <= _GEN_356;
        end
      end else begin
        regResStat_24_owner <= _GEN_356;
      end
    end else begin
      regResStat_24_owner <= _GEN_356;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_25_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h19 == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_25_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_25_owner <= _GEN_357;
        end
      end else begin
        regResStat_25_owner <= _GEN_357;
      end
    end else begin
      regResStat_25_owner <= _GEN_357;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_26_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1a == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_26_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_26_owner <= _GEN_358;
        end
      end else begin
        regResStat_26_owner <= _GEN_358;
      end
    end else begin
      regResStat_26_owner <= _GEN_358;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_27_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1b == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_27_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_27_owner <= _GEN_359;
        end
      end else begin
        regResStat_27_owner <= _GEN_359;
      end
    end else begin
      regResStat_27_owner <= _GEN_359;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_28_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1c == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_28_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_28_owner <= _GEN_360;
        end
      end else begin
        regResStat_28_owner <= _GEN_360;
      end
    end else begin
      regResStat_28_owner <= _GEN_360;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_29_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1d == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_29_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_29_owner <= _GEN_361;
        end
      end else begin
        regResStat_29_owner <= _GEN_361;
      end
    end else begin
      regResStat_29_owner <= _GEN_361;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_30_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1e == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_30_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_30_owner <= _GEN_362;
        end
      end else begin
        regResStat_30_owner <= _GEN_362;
      end
    end else begin
      regResStat_30_owner <= _GEN_362;
    end
    if (io_flush) begin // @[ROB.scala 216:21]
      regResStat_31_owner <= 8'h0; // @[ROB.scala 218:41]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (_GEN_444 == _GEN_1324 & ~(_T & io_enq_bits_rd == _GEN_59)) begin // @[ROB.scala 175:111]
        if (5'h1f == _GEN_59) begin // @[ROB.scala 176:42]
          regResStat_31_owner <= 8'h0; // @[ROB.scala 176:42]
        end else begin
          regResStat_31_owner <= _GEN_363;
        end
      end else begin
        regResStat_31_owner <= _GEN_363;
      end
    end else begin
      regResStat_31_owner <= _GEN_363;
    end
    if (reset) begin // @[ROB.scala 125:23]
      head <= 4'h0; // @[ROB.scala 125:23]
    end else if (io_flush) begin // @[ROB.scala 216:21]
      head <= 4'h0; // @[ROB.scala 219:14]
    end else if (io_deq_valid) begin // @[ROB.scala 168:24]
      if (head == 4'hb) begin // @[ROB.scala 179:20]
        head <= 4'h0;
      end else begin
        head <= _io_deq_bits_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 126:23]
      tail <= 4'h0; // @[ROB.scala 126:23]
    end else if (io_flush) begin // @[ROB.scala 216:21]
      tail <= 4'h0; // @[ROB.scala 220:14]
    end else if (_T) begin // @[ROB.scala 153:24]
      if (tail == 4'hb) begin // @[ROB.scala 165:20]
        tail <= 4'h0;
      end else begin
        tail <= _io_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 128:24]
      count <= 4'h0; // @[ROB.scala 128:24]
    end else if (io_flush) begin // @[ROB.scala 216:21]
      count <= 4'h0; // @[ROB.scala 221:15]
    end else if (~(io_deq_valid & _T)) begin // @[ROB.scala 182:43]
      if (io_deq_valid) begin // @[ROB.scala 186:27]
        count <= _count_T_3; // @[ROB.scala 187:19]
      end else begin
        count <= _GEN_590;
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
  entries_0_excpAddr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_excpValid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_inst = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  entries_1_busy = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  entries_1_state = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_rd = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_data = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_brAddr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_brTaken = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_predictBrTaken = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_excpAddr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_excpValid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  entries_1_pc = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_inst = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  entries_2_busy = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_2_state = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  entries_2_rd = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  entries_2_data = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_brAddr = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  entries_2_brTaken = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  entries_2_predictBrTaken = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entries_2_excpAddr = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  entries_2_excpValid = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entries_2_pc = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  entries_2_inst = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  entries_3_busy = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entries_3_state = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  entries_3_rd = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  entries_3_data = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entries_3_brAddr = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  entries_3_brTaken = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  entries_3_predictBrTaken = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entries_3_excpAddr = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  entries_3_excpValid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  entries_3_pc = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  entries_3_inst = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  entries_4_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entries_4_state = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  entries_4_rd = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  entries_4_data = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  entries_4_brAddr = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  entries_4_brTaken = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  entries_4_predictBrTaken = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  entries_4_excpAddr = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  entries_4_excpValid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  entries_4_pc = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  entries_4_inst = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  entries_5_busy = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  entries_5_state = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  entries_5_rd = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  entries_5_data = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  entries_5_brAddr = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  entries_5_brTaken = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  entries_5_predictBrTaken = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  entries_5_excpAddr = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  entries_5_excpValid = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  entries_5_pc = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  entries_5_inst = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  entries_6_busy = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  entries_6_state = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  entries_6_rd = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  entries_6_data = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  entries_6_brAddr = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  entries_6_brTaken = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  entries_6_predictBrTaken = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  entries_6_excpAddr = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  entries_6_excpValid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  entries_6_pc = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  entries_6_inst = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  entries_7_busy = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  entries_7_state = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  entries_7_rd = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  entries_7_data = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  entries_7_brAddr = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  entries_7_brTaken = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  entries_7_predictBrTaken = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  entries_7_excpAddr = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  entries_7_excpValid = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  entries_7_pc = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  entries_7_inst = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  entries_8_busy = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  entries_8_state = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  entries_8_rd = _RAND_90[4:0];
  _RAND_91 = {1{`RANDOM}};
  entries_8_data = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  entries_8_brAddr = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  entries_8_brTaken = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  entries_8_predictBrTaken = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  entries_8_excpAddr = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  entries_8_excpValid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  entries_8_pc = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  entries_8_inst = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  entries_9_busy = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  entries_9_state = _RAND_100[1:0];
  _RAND_101 = {1{`RANDOM}};
  entries_9_rd = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  entries_9_data = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  entries_9_brAddr = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  entries_9_brTaken = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  entries_9_predictBrTaken = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  entries_9_excpAddr = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  entries_9_excpValid = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  entries_9_pc = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  entries_9_inst = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  entries_10_busy = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  entries_10_state = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  entries_10_rd = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  entries_10_data = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  entries_10_brAddr = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  entries_10_brTaken = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  entries_10_predictBrTaken = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  entries_10_excpAddr = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  entries_10_excpValid = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  entries_10_pc = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  entries_10_inst = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  entries_11_busy = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  entries_11_state = _RAND_122[1:0];
  _RAND_123 = {1{`RANDOM}};
  entries_11_rd = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  entries_11_data = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  entries_11_brAddr = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  entries_11_brTaken = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  entries_11_predictBrTaken = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  entries_11_excpAddr = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  entries_11_excpValid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  entries_11_pc = _RAND_130[31:0];
  _RAND_131 = {1{`RANDOM}};
  entries_11_inst = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  regResStat_0_owner = _RAND_132[7:0];
  _RAND_133 = {1{`RANDOM}};
  regResStat_1_owner = _RAND_133[7:0];
  _RAND_134 = {1{`RANDOM}};
  regResStat_2_owner = _RAND_134[7:0];
  _RAND_135 = {1{`RANDOM}};
  regResStat_3_owner = _RAND_135[7:0];
  _RAND_136 = {1{`RANDOM}};
  regResStat_4_owner = _RAND_136[7:0];
  _RAND_137 = {1{`RANDOM}};
  regResStat_5_owner = _RAND_137[7:0];
  _RAND_138 = {1{`RANDOM}};
  regResStat_6_owner = _RAND_138[7:0];
  _RAND_139 = {1{`RANDOM}};
  regResStat_7_owner = _RAND_139[7:0];
  _RAND_140 = {1{`RANDOM}};
  regResStat_8_owner = _RAND_140[7:0];
  _RAND_141 = {1{`RANDOM}};
  regResStat_9_owner = _RAND_141[7:0];
  _RAND_142 = {1{`RANDOM}};
  regResStat_10_owner = _RAND_142[7:0];
  _RAND_143 = {1{`RANDOM}};
  regResStat_11_owner = _RAND_143[7:0];
  _RAND_144 = {1{`RANDOM}};
  regResStat_12_owner = _RAND_144[7:0];
  _RAND_145 = {1{`RANDOM}};
  regResStat_13_owner = _RAND_145[7:0];
  _RAND_146 = {1{`RANDOM}};
  regResStat_14_owner = _RAND_146[7:0];
  _RAND_147 = {1{`RANDOM}};
  regResStat_15_owner = _RAND_147[7:0];
  _RAND_148 = {1{`RANDOM}};
  regResStat_16_owner = _RAND_148[7:0];
  _RAND_149 = {1{`RANDOM}};
  regResStat_17_owner = _RAND_149[7:0];
  _RAND_150 = {1{`RANDOM}};
  regResStat_18_owner = _RAND_150[7:0];
  _RAND_151 = {1{`RANDOM}};
  regResStat_19_owner = _RAND_151[7:0];
  _RAND_152 = {1{`RANDOM}};
  regResStat_20_owner = _RAND_152[7:0];
  _RAND_153 = {1{`RANDOM}};
  regResStat_21_owner = _RAND_153[7:0];
  _RAND_154 = {1{`RANDOM}};
  regResStat_22_owner = _RAND_154[7:0];
  _RAND_155 = {1{`RANDOM}};
  regResStat_23_owner = _RAND_155[7:0];
  _RAND_156 = {1{`RANDOM}};
  regResStat_24_owner = _RAND_156[7:0];
  _RAND_157 = {1{`RANDOM}};
  regResStat_25_owner = _RAND_157[7:0];
  _RAND_158 = {1{`RANDOM}};
  regResStat_26_owner = _RAND_158[7:0];
  _RAND_159 = {1{`RANDOM}};
  regResStat_27_owner = _RAND_159[7:0];
  _RAND_160 = {1{`RANDOM}};
  regResStat_28_owner = _RAND_160[7:0];
  _RAND_161 = {1{`RANDOM}};
  regResStat_29_owner = _RAND_161[7:0];
  _RAND_162 = {1{`RANDOM}};
  regResStat_30_owner = _RAND_162[7:0];
  _RAND_163 = {1{`RANDOM}};
  regResStat_31_owner = _RAND_163[7:0];
  _RAND_164 = {1{`RANDOM}};
  head = _RAND_164[3:0];
  _RAND_165 = {1{`RANDOM}};
  tail = _RAND_165[3:0];
  _RAND_166 = {1{`RANDOM}};
  count = _RAND_166[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
