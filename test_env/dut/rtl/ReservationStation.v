module ReservationStation(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [7:0]  io_enq_bits_op,
  input  [3:0]  io_enq_bits_opr1,
  input  [3:0]  io_enq_bits_opr2,
  input  [4:0]  io_enq_bits_rs1,
  input  [4:0]  io_enq_bits_rs2,
  input  [7:0]  io_enq_bits_ROBId,
  input  [7:0]  io_enq_bits_rs1ROBId,
  input  [7:0]  io_enq_bits_rs2ROBId,
  input  [2:0]  io_enq_bits_immSrc,
  input         io_enq_bits_immSign,
  input  [3:0]  io_enq_bits_excpType,
  input  [31:0] io_enq_bits_pc,
  input  [31:0] io_enq_bits_inst,
  input         io_deq_ready,
  output        io_deq_valid,
  output [7:0]  io_deq_bits_op,
  output [7:0]  io_deq_bits_ROBId,
  output [3:0]  io_deq_bits_opr1,
  output [3:0]  io_deq_bits_opr2,
  output [31:0] io_deq_bits_rs1Val,
  output [31:0] io_deq_bits_rs2Val,
  output [2:0]  io_deq_bits_immSrc,
  output        io_deq_bits_immSign,
  output [3:0]  io_deq_bits_excpType,
  output [31:0] io_deq_bits_pc,
  output [31:0] io_deq_bits_inst,
  output        io_robOut_valid,
  output [2:0]  io_robOut_bits_id,
  input         io_robRead_0_busy,
  input  [1:0]  io_robRead_0_state,
  input  [4:0]  io_robRead_0_rd,
  input  [31:0] io_robRead_0_data,
  input         io_robRead_1_busy,
  input  [1:0]  io_robRead_1_state,
  input  [4:0]  io_robRead_1_rd,
  input  [31:0] io_robRead_1_data,
  input         io_robRead_2_busy,
  input  [1:0]  io_robRead_2_state,
  input  [4:0]  io_robRead_2_rd,
  input  [31:0] io_robRead_2_data,
  input         io_robRead_3_busy,
  input  [1:0]  io_robRead_3_state,
  input  [4:0]  io_robRead_3_rd,
  input  [31:0] io_robRead_3_data,
  input         io_robRead_4_busy,
  input  [1:0]  io_robRead_4_state,
  input  [4:0]  io_robRead_4_rd,
  input  [31:0] io_robRead_4_data,
  input  [7:0]  io_regStatus_0_owner,
  input  [7:0]  io_regStatus_1_owner,
  input  [7:0]  io_regStatus_2_owner,
  input  [7:0]  io_regStatus_3_owner,
  input  [7:0]  io_regStatus_4_owner,
  input  [7:0]  io_regStatus_5_owner,
  input  [7:0]  io_regStatus_6_owner,
  input  [7:0]  io_regStatus_7_owner,
  input  [7:0]  io_regStatus_8_owner,
  input  [7:0]  io_regStatus_9_owner,
  input  [7:0]  io_regStatus_10_owner,
  input  [7:0]  io_regStatus_11_owner,
  input  [7:0]  io_regStatus_12_owner,
  input  [7:0]  io_regStatus_13_owner,
  input  [7:0]  io_regStatus_14_owner,
  input  [7:0]  io_regStatus_15_owner,
  input  [7:0]  io_regStatus_16_owner,
  input  [7:0]  io_regStatus_17_owner,
  input  [7:0]  io_regStatus_18_owner,
  input  [7:0]  io_regStatus_19_owner,
  input  [7:0]  io_regStatus_20_owner,
  input  [7:0]  io_regStatus_21_owner,
  input  [7:0]  io_regStatus_22_owner,
  input  [7:0]  io_regStatus_23_owner,
  input  [7:0]  io_regStatus_24_owner,
  input  [7:0]  io_regStatus_25_owner,
  input  [7:0]  io_regStatus_26_owner,
  input  [7:0]  io_regStatus_27_owner,
  input  [7:0]  io_regStatus_28_owner,
  input  [7:0]  io_regStatus_29_owner,
  input  [7:0]  io_regStatus_30_owner,
  input  [7:0]  io_regStatus_31_owner,
  input         io_cdb_0_valid,
  input  [31:0] io_cdb_0_bits_data,
  input  [7:0]  io_cdb_0_bits_id,
  input  [4:0]  io_cdb_0_bits_rd,
  input         io_cdb_1_valid,
  input  [31:0] io_cdb_1_bits_data,
  input  [7:0]  io_cdb_1_bits_id,
  input  [4:0]  io_cdb_1_bits_rd,
  input         io_cdb_2_valid,
  input  [31:0] io_cdb_2_bits_data,
  input  [7:0]  io_cdb_2_bits_id,
  input  [4:0]  io_cdb_2_bits_rd,
  input         io_cdb_3_valid,
  input  [31:0] io_cdb_3_bits_data,
  input  [7:0]  io_cdb_3_bits_id,
  input  [4:0]  io_cdb_3_bits_rd,
  output [4:0]  io_rf_0_addr,
  input  [31:0] io_rf_0_data,
  output [4:0]  io_rf_1_addr,
  input  [31:0] io_rf_1_data,
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
`endif // RANDOMIZE_REG_INIT
  reg  entries_0_busy; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_0_op; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_0_ROBId; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_0_opr1; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_0_opr2; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_0_rs1; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_0_rs2; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_0_rs1Val; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_0_rs2Val; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_0_rs1ROBId; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_0_rs2ROBId; // @[ReservationStation.scala 85:22]
  reg [2:0] entries_0_immSrc; // @[ReservationStation.scala 85:22]
  reg  entries_0_immSign; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_0_excpType; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_0_pc; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_0_inst; // @[ReservationStation.scala 85:22]
  reg  entries_1_busy; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_1_op; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_1_ROBId; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_1_opr1; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_1_opr2; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_1_rs1; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_1_rs2; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_1_rs1Val; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_1_rs2Val; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_1_rs1ROBId; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_1_rs2ROBId; // @[ReservationStation.scala 85:22]
  reg [2:0] entries_1_immSrc; // @[ReservationStation.scala 85:22]
  reg  entries_1_immSign; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_1_excpType; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_1_pc; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_1_inst; // @[ReservationStation.scala 85:22]
  reg  entries_2_busy; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_2_op; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_2_ROBId; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_2_opr1; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_2_opr2; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_2_rs1; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_2_rs2; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_2_rs1Val; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_2_rs2Val; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_2_rs1ROBId; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_2_rs2ROBId; // @[ReservationStation.scala 85:22]
  reg [2:0] entries_2_immSrc; // @[ReservationStation.scala 85:22]
  reg  entries_2_immSign; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_2_excpType; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_2_pc; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_2_inst; // @[ReservationStation.scala 85:22]
  reg [1:0] head; // @[ReservationStation.scala 86:23]
  reg [1:0] tail; // @[ReservationStation.scala 87:23]
  reg [1:0] count; // @[ReservationStation.scala 89:24]
  wire  full = count == 2'h3; // @[ReservationStation.scala 90:22]
  wire [7:0] _GEN_1 = 2'h1 == head ? entries_1_rs1ROBId : entries_0_rs1ROBId; // @[ReservationStation.scala 94:{41,41}]
  wire [7:0] _GEN_2 = 2'h2 == head ? entries_2_rs1ROBId : _GEN_1; // @[ReservationStation.scala 94:{41,41}]
  wire [7:0] _GEN_4 = 2'h1 == head ? entries_1_rs2ROBId : entries_0_rs2ROBId; // @[ReservationStation.scala 94:{73,73}]
  wire [7:0] _GEN_5 = 2'h2 == head ? entries_2_rs2ROBId : _GEN_4; // @[ReservationStation.scala 94:{73,73}]
  wire  oprReady = _GEN_2 == 8'h0 & _GEN_5 == 8'h0; // @[ReservationStation.scala 94:49]
  wire  _GEN_7 = 2'h1 == tail ? entries_1_busy : entries_0_busy; // @[ReservationStation.scala 95:{30,30}]
  wire  _GEN_8 = 2'h2 == tail ? entries_2_busy : _GEN_7; // @[ReservationStation.scala 95:{30,30}]
  wire  _GEN_10 = 2'h1 == head ? entries_1_busy : entries_0_busy; // @[ReservationStation.scala 96:{30,30}]
  wire  _GEN_11 = 2'h2 == head ? entries_2_busy : _GEN_10; // @[ReservationStation.scala 96:{30,30}]
  wire [7:0] _GEN_13 = 2'h1 == head ? entries_1_op : entries_0_op; // @[ReservationStation.scala 97:{20,20}]
  wire [7:0] _GEN_16 = 2'h1 == head ? entries_1_ROBId : entries_0_ROBId; // @[ReservationStation.scala 98:{23,23}]
  wire [7:0] _GEN_17 = 2'h2 == head ? entries_2_ROBId : _GEN_16; // @[ReservationStation.scala 98:{23,23}]
  wire [3:0] _GEN_19 = 2'h1 == head ? entries_1_opr1 : entries_0_opr1; // @[ReservationStation.scala 99:{22,22}]
  wire [3:0] _GEN_22 = 2'h1 == head ? entries_1_opr2 : entries_0_opr2; // @[ReservationStation.scala 100:{22,22}]
  wire [31:0] _GEN_25 = 2'h1 == head ? entries_1_rs1Val : entries_0_rs1Val; // @[ReservationStation.scala 101:{24,24}]
  wire [31:0] _GEN_28 = 2'h1 == head ? entries_1_rs2Val : entries_0_rs2Val; // @[ReservationStation.scala 102:{24,24}]
  wire [2:0] _GEN_31 = 2'h1 == head ? entries_1_immSrc : entries_0_immSrc; // @[ReservationStation.scala 103:{24,24}]
  wire  _GEN_34 = 2'h1 == head ? entries_1_immSign : entries_0_immSign; // @[ReservationStation.scala 104:{25,25}]
  wire [3:0] _GEN_37 = 2'h1 == head ? entries_1_excpType : entries_0_excpType; // @[ReservationStation.scala 105:{26,26}]
  wire [31:0] _GEN_40 = 2'h1 == head ? entries_1_pc : entries_0_pc; // @[ReservationStation.scala 106:{20,20}]
  wire [31:0] _GEN_43 = 2'h1 == head ? entries_1_inst : entries_0_inst; // @[ReservationStation.scala 107:{22,22}]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_45 = 2'h0 == tail | entries_0_busy; // @[ReservationStation.scala 121:{28,28} 85:22]
  wire  _GEN_46 = 2'h1 == tail | entries_1_busy; // @[ReservationStation.scala 121:{28,28} 85:22]
  wire  _GEN_47 = 2'h2 == tail | entries_2_busy; // @[ReservationStation.scala 121:{28,28} 85:22]
  wire [7:0] _GEN_54 = 2'h0 == tail ? io_enq_bits_rs1ROBId : entries_0_rs1ROBId; // @[ReservationStation.scala 124:{32,32} 85:22]
  wire [7:0] _GEN_55 = 2'h1 == tail ? io_enq_bits_rs1ROBId : entries_1_rs1ROBId; // @[ReservationStation.scala 124:{32,32} 85:22]
  wire [7:0] _GEN_56 = 2'h2 == tail ? io_enq_bits_rs1ROBId : entries_2_rs1ROBId; // @[ReservationStation.scala 124:{32,32} 85:22]
  wire [7:0] _GEN_57 = 2'h0 == tail ? io_enq_bits_rs2ROBId : entries_0_rs2ROBId; // @[ReservationStation.scala 125:{32,32} 85:22]
  wire [7:0] _GEN_58 = 2'h1 == tail ? io_enq_bits_rs2ROBId : entries_1_rs2ROBId; // @[ReservationStation.scala 125:{32,32} 85:22]
  wire [7:0] _GEN_59 = 2'h2 == tail ? io_enq_bits_rs2ROBId : entries_2_rs2ROBId; // @[ReservationStation.scala 125:{32,32} 85:22]
  wire [7:0] _GEN_97 = 5'h1 == io_enq_bits_rs1 ? io_regStatus_1_owner : io_regStatus_0_owner; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_98 = 5'h2 == io_enq_bits_rs1 ? io_regStatus_2_owner : _GEN_97; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_99 = 5'h3 == io_enq_bits_rs1 ? io_regStatus_3_owner : _GEN_98; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_100 = 5'h4 == io_enq_bits_rs1 ? io_regStatus_4_owner : _GEN_99; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_101 = 5'h5 == io_enq_bits_rs1 ? io_regStatus_5_owner : _GEN_100; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_102 = 5'h6 == io_enq_bits_rs1 ? io_regStatus_6_owner : _GEN_101; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_103 = 5'h7 == io_enq_bits_rs1 ? io_regStatus_7_owner : _GEN_102; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_104 = 5'h8 == io_enq_bits_rs1 ? io_regStatus_8_owner : _GEN_103; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_105 = 5'h9 == io_enq_bits_rs1 ? io_regStatus_9_owner : _GEN_104; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_106 = 5'ha == io_enq_bits_rs1 ? io_regStatus_10_owner : _GEN_105; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_107 = 5'hb == io_enq_bits_rs1 ? io_regStatus_11_owner : _GEN_106; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_108 = 5'hc == io_enq_bits_rs1 ? io_regStatus_12_owner : _GEN_107; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_109 = 5'hd == io_enq_bits_rs1 ? io_regStatus_13_owner : _GEN_108; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_110 = 5'he == io_enq_bits_rs1 ? io_regStatus_14_owner : _GEN_109; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_111 = 5'hf == io_enq_bits_rs1 ? io_regStatus_15_owner : _GEN_110; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_112 = 5'h10 == io_enq_bits_rs1 ? io_regStatus_16_owner : _GEN_111; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_113 = 5'h11 == io_enq_bits_rs1 ? io_regStatus_17_owner : _GEN_112; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_114 = 5'h12 == io_enq_bits_rs1 ? io_regStatus_18_owner : _GEN_113; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_115 = 5'h13 == io_enq_bits_rs1 ? io_regStatus_19_owner : _GEN_114; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_116 = 5'h14 == io_enq_bits_rs1 ? io_regStatus_20_owner : _GEN_115; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_117 = 5'h15 == io_enq_bits_rs1 ? io_regStatus_21_owner : _GEN_116; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_118 = 5'h16 == io_enq_bits_rs1 ? io_regStatus_22_owner : _GEN_117; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_119 = 5'h17 == io_enq_bits_rs1 ? io_regStatus_23_owner : _GEN_118; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_120 = 5'h18 == io_enq_bits_rs1 ? io_regStatus_24_owner : _GEN_119; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_121 = 5'h19 == io_enq_bits_rs1 ? io_regStatus_25_owner : _GEN_120; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_122 = 5'h1a == io_enq_bits_rs1 ? io_regStatus_26_owner : _GEN_121; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_123 = 5'h1b == io_enq_bits_rs1 ? io_regStatus_27_owner : _GEN_122; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_124 = 5'h1c == io_enq_bits_rs1 ? io_regStatus_28_owner : _GEN_123; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_125 = 5'h1d == io_enq_bits_rs1 ? io_regStatus_29_owner : _GEN_124; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_126 = 5'h1e == io_enq_bits_rs1 ? io_regStatus_30_owner : _GEN_125; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_127 = 5'h1f == io_enq_bits_rs1 ? io_regStatus_31_owner : _GEN_126; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_93 = 2'h0 == tail ? _GEN_127 : _GEN_54; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_94 = 2'h1 == tail ? _GEN_127 : _GEN_55; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_95 = 2'h2 == tail ? _GEN_127 : _GEN_56; // @[ReservationStation.scala 140:{32,32}]
  wire [7:0] _GEN_132 = 5'h1 == io_enq_bits_rs2 ? io_regStatus_1_owner : io_regStatus_0_owner; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_133 = 5'h2 == io_enq_bits_rs2 ? io_regStatus_2_owner : _GEN_132; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_134 = 5'h3 == io_enq_bits_rs2 ? io_regStatus_3_owner : _GEN_133; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_135 = 5'h4 == io_enq_bits_rs2 ? io_regStatus_4_owner : _GEN_134; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_136 = 5'h5 == io_enq_bits_rs2 ? io_regStatus_5_owner : _GEN_135; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_137 = 5'h6 == io_enq_bits_rs2 ? io_regStatus_6_owner : _GEN_136; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_138 = 5'h7 == io_enq_bits_rs2 ? io_regStatus_7_owner : _GEN_137; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_139 = 5'h8 == io_enq_bits_rs2 ? io_regStatus_8_owner : _GEN_138; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_140 = 5'h9 == io_enq_bits_rs2 ? io_regStatus_9_owner : _GEN_139; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_141 = 5'ha == io_enq_bits_rs2 ? io_regStatus_10_owner : _GEN_140; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_142 = 5'hb == io_enq_bits_rs2 ? io_regStatus_11_owner : _GEN_141; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_143 = 5'hc == io_enq_bits_rs2 ? io_regStatus_12_owner : _GEN_142; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_144 = 5'hd == io_enq_bits_rs2 ? io_regStatus_13_owner : _GEN_143; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_145 = 5'he == io_enq_bits_rs2 ? io_regStatus_14_owner : _GEN_144; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_146 = 5'hf == io_enq_bits_rs2 ? io_regStatus_15_owner : _GEN_145; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_147 = 5'h10 == io_enq_bits_rs2 ? io_regStatus_16_owner : _GEN_146; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_148 = 5'h11 == io_enq_bits_rs2 ? io_regStatus_17_owner : _GEN_147; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_149 = 5'h12 == io_enq_bits_rs2 ? io_regStatus_18_owner : _GEN_148; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_150 = 5'h13 == io_enq_bits_rs2 ? io_regStatus_19_owner : _GEN_149; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_151 = 5'h14 == io_enq_bits_rs2 ? io_regStatus_20_owner : _GEN_150; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_152 = 5'h15 == io_enq_bits_rs2 ? io_regStatus_21_owner : _GEN_151; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_153 = 5'h16 == io_enq_bits_rs2 ? io_regStatus_22_owner : _GEN_152; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_154 = 5'h17 == io_enq_bits_rs2 ? io_regStatus_23_owner : _GEN_153; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_155 = 5'h18 == io_enq_bits_rs2 ? io_regStatus_24_owner : _GEN_154; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_156 = 5'h19 == io_enq_bits_rs2 ? io_regStatus_25_owner : _GEN_155; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_157 = 5'h1a == io_enq_bits_rs2 ? io_regStatus_26_owner : _GEN_156; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_158 = 5'h1b == io_enq_bits_rs2 ? io_regStatus_27_owner : _GEN_157; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_159 = 5'h1c == io_enq_bits_rs2 ? io_regStatus_28_owner : _GEN_158; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_160 = 5'h1d == io_enq_bits_rs2 ? io_regStatus_29_owner : _GEN_159; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_161 = 5'h1e == io_enq_bits_rs2 ? io_regStatus_30_owner : _GEN_160; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_162 = 5'h1f == io_enq_bits_rs2 ? io_regStatus_31_owner : _GEN_161; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_128 = 2'h0 == tail ? _GEN_162 : _GEN_57; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_129 = 2'h1 == tail ? _GEN_162 : _GEN_58; // @[ReservationStation.scala 141:{32,32}]
  wire [7:0] _GEN_130 = 2'h2 == tail ? _GEN_162 : _GEN_59; // @[ReservationStation.scala 141:{32,32}]
  wire [31:0] _GEN_163 = 2'h0 == tail ? io_rf_0_data : entries_0_rs1Val; // @[ReservationStation.scala 146:{30,30} 85:22]
  wire [31:0] _GEN_164 = 2'h1 == tail ? io_rf_0_data : entries_1_rs1Val; // @[ReservationStation.scala 146:{30,30} 85:22]
  wire [31:0] _GEN_165 = 2'h2 == tail ? io_rf_0_data : entries_2_rs1Val; // @[ReservationStation.scala 146:{30,30} 85:22]
  wire [31:0] _GEN_166 = 2'h0 == tail ? io_rf_1_data : entries_0_rs2Val; // @[ReservationStation.scala 147:{30,30} 85:22]
  wire [31:0] _GEN_167 = 2'h1 == tail ? io_rf_1_data : entries_1_rs2Val; // @[ReservationStation.scala 147:{30,30} 85:22]
  wire [31:0] _GEN_168 = 2'h2 == tail ? io_rf_1_data : entries_2_rs2Val; // @[ReservationStation.scala 147:{30,30} 85:22]
  wire [1:0] _tail_T_2 = tail + 2'h1; // @[ReservationStation.scala 149:60]
  wire  _GEN_169 = _T ? _GEN_45 : entries_0_busy; // @[ReservationStation.scala 120:24 85:22]
  wire  _GEN_170 = _T ? _GEN_46 : entries_1_busy; // @[ReservationStation.scala 120:24 85:22]
  wire  _GEN_171 = _T ? _GEN_47 : entries_2_busy; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_178 = _T ? _GEN_93 : entries_0_rs1ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_179 = _T ? _GEN_94 : entries_1_rs1ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_180 = _T ? _GEN_95 : entries_2_rs1ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_181 = _T ? _GEN_128 : entries_0_rs2ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_182 = _T ? _GEN_129 : entries_1_rs2ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [7:0] _GEN_183 = _T ? _GEN_130 : entries_2_rs2ROBId; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_216 = _T ? _GEN_163 : entries_0_rs1Val; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_217 = _T ? _GEN_164 : entries_1_rs1Val; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_218 = _T ? _GEN_165 : entries_2_rs1Val; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_219 = _T ? _GEN_166 : entries_0_rs2Val; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_220 = _T ? _GEN_167 : entries_1_rs2Val; // @[ReservationStation.scala 120:24 85:22]
  wire [31:0] _GEN_221 = _T ? _GEN_168 : entries_2_rs2Val; // @[ReservationStation.scala 120:24 85:22]
  wire  _T_1 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _head_T_2 = head + 2'h1; // @[ReservationStation.scala 158:60]
  wire [7:0] _GEN_233 = _T_1 ? _GEN_17 : 8'h0; // @[ReservationStation.scala 110:23 152:24 155:27]
  wire [1:0] _count_T_1 = count + 2'h1; // @[ReservationStation.scala 163:28]
  wire [1:0] _GEN_236 = _T ? _count_T_1 : count; // @[ReservationStation.scala 162:27 163:19 89:24]
  wire [1:0] _count_T_3 = count - 2'h1; // @[ReservationStation.scala 166:28]
  wire [7:0] _rs1ROBEntry_T_1 = entries_0_rs1ROBId - 8'h1; // @[ReservationStation.scala 176:53]
  wire [7:0] _rs2ROBEntry_T_1 = entries_0_rs2ROBId - 8'h1; // @[ReservationStation.scala 177:53]
  wire [1:0] _GEN_240 = 3'h1 == _rs1ROBEntry_T_1[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_241 = 3'h2 == _rs1ROBEntry_T_1[2:0] ? io_robRead_2_state : _GEN_240; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_242 = 3'h3 == _rs1ROBEntry_T_1[2:0] ? io_robRead_3_state : _GEN_241; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_243 = 3'h4 == _rs1ROBEntry_T_1[2:0] ? io_robRead_4_state : _GEN_242; // @[ReservationStation.scala 178:{69,69}]
  wire  _GEN_245 = 3'h1 == _rs1ROBEntry_T_1[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_246 = 3'h2 == _rs1ROBEntry_T_1[2:0] ? io_robRead_2_busy : _GEN_245; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_247 = 3'h3 == _rs1ROBEntry_T_1[2:0] ? io_robRead_3_busy : _GEN_246; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_248 = 3'h4 == _rs1ROBEntry_T_1[2:0] ? io_robRead_4_busy : _GEN_247; // @[ReservationStation.scala 178:{48,48}]
  wire [4:0] _GEN_250 = 3'h1 == _rs1ROBEntry_T_1[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_251 = 3'h2 == _rs1ROBEntry_T_1[2:0] ? io_robRead_2_rd : _GEN_250; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_252 = 3'h3 == _rs1ROBEntry_T_1[2:0] ? io_robRead_3_rd : _GEN_251; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_253 = 3'h4 == _rs1ROBEntry_T_1[2:0] ? io_robRead_4_rd : _GEN_252; // @[ReservationStation.scala 178:{132,132}]
  wire  rs1FromROB = (_GEN_248 & _GEN_243 == 2'h2 | _GEN_243 == 2'h3) & _GEN_253 == entries_0_rs1 & entries_0_rs1 != 5'h0
    ; // @[ReservationStation.scala 178:142]
  wire [1:0] _GEN_255 = 3'h1 == _rs2ROBEntry_T_1[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_256 = 3'h2 == _rs2ROBEntry_T_1[2:0] ? io_robRead_2_state : _GEN_255; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_257 = 3'h3 == _rs2ROBEntry_T_1[2:0] ? io_robRead_3_state : _GEN_256; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_258 = 3'h4 == _rs2ROBEntry_T_1[2:0] ? io_robRead_4_state : _GEN_257; // @[ReservationStation.scala 179:{69,69}]
  wire  _GEN_260 = 3'h1 == _rs2ROBEntry_T_1[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_261 = 3'h2 == _rs2ROBEntry_T_1[2:0] ? io_robRead_2_busy : _GEN_260; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_262 = 3'h3 == _rs2ROBEntry_T_1[2:0] ? io_robRead_3_busy : _GEN_261; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_263 = 3'h4 == _rs2ROBEntry_T_1[2:0] ? io_robRead_4_busy : _GEN_262; // @[ReservationStation.scala 179:{48,48}]
  wire [4:0] _GEN_265 = 3'h1 == _rs2ROBEntry_T_1[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_266 = 3'h2 == _rs2ROBEntry_T_1[2:0] ? io_robRead_2_rd : _GEN_265; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_267 = 3'h3 == _rs2ROBEntry_T_1[2:0] ? io_robRead_3_rd : _GEN_266; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_268 = 3'h4 == _rs2ROBEntry_T_1[2:0] ? io_robRead_4_rd : _GEN_267; // @[ReservationStation.scala 179:{132,132}]
  wire  rs2FromROB = (_GEN_263 & _GEN_258 == 2'h2 | _GEN_258 == 2'h3) & _GEN_268 == entries_0_rs2 & entries_0_rs2 != 5'h0
    ; // @[ReservationStation.scala 179:142]
  wire [31:0] _GEN_270 = 3'h1 == _rs1ROBEntry_T_1[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_271 = 3'h2 == _rs1ROBEntry_T_1[2:0] ? io_robRead_2_data : _GEN_270; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_272 = 3'h3 == _rs1ROBEntry_T_1[2:0] ? io_robRead_3_data : _GEN_271; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_277 = 3'h1 == _rs2ROBEntry_T_1[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_278 = 3'h2 == _rs2ROBEntry_T_1[2:0] ? io_robRead_2_data : _GEN_277; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_279 = 3'h3 == _rs2ROBEntry_T_1[2:0] ? io_robRead_3_data : _GEN_278; // @[ReservationStation.scala 185:{26,26}]
  wire  _rs1MatchVec_T = io_cdb_0_bits_rd == entries_0_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_1 = io_cdb_1_bits_rd == entries_0_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_2 = io_cdb_2_bits_rd == entries_0_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_3 = io_cdb_3_bits_rd == entries_0_rs1; // @[ReservationStation.scala 189:61]
  wire [3:0] rs1MatchVec = {_rs1MatchVec_T_3,_rs1MatchVec_T_2,_rs1MatchVec_T_1,_rs1MatchVec_T}; // @[Cat.scala 33:92]
  wire  _rs2MatchVec_T = io_cdb_0_bits_rd == entries_0_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_1 = io_cdb_1_bits_rd == entries_0_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_2 = io_cdb_2_bits_rd == entries_0_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_3 = io_cdb_3_bits_rd == entries_0_rs2; // @[ReservationStation.scala 190:61]
  wire [3:0] rs2MatchVec = {_rs2MatchVec_T_3,_rs2MatchVec_T_2,_rs2MatchVec_T_1,_rs2MatchVec_T}; // @[Cat.scala 33:92]
  wire  _rs1IDMatchVec_T = io_cdb_0_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_1 = io_cdb_1_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_2 = io_cdb_2_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_3 = io_cdb_3_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire [3:0] rs1IDMatchVec = {_rs1IDMatchVec_T_3,_rs1IDMatchVec_T_2,_rs1IDMatchVec_T_1,_rs1IDMatchVec_T}; // @[Cat.scala 33:92]
  wire  _rs2IDMatchVec_T = io_cdb_0_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_1 = io_cdb_1_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_2 = io_cdb_2_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_3 = io_cdb_3_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire [3:0] rs2IDMatchVec = {_rs2IDMatchVec_T_3,_rs2IDMatchVec_T_2,_rs2IDMatchVec_T_1,_rs2IDMatchVec_T}; // @[Cat.scala 33:92]
  wire [3:0] cdbValidVec = {io_cdb_3_valid,io_cdb_2_valid,io_cdb_1_valid,io_cdb_0_valid}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T = cdbValidVec & rs1MatchVec; // @[ReservationStation.scala 194:44]
  wire [3:0] cdbBypassRs1 = _cdbBypassRs1_T & rs1IDMatchVec; // @[ReservationStation.scala 194:58]
  wire [3:0] _cdbBypassRs2_T = cdbValidVec & rs2MatchVec; // @[ReservationStation.scala 195:44]
  wire [3:0] cdbBypassRs2 = _cdbBypassRs2_T & rs2IDMatchVec; // @[ReservationStation.scala 195:58]
  wire  bypassRs1 = |cdbBypassRs1; // @[ReservationStation.scala 198:42]
  wire  bypassRs2 = |cdbBypassRs2; // @[ReservationStation.scala 199:42]
  wire [31:0] _entries_0_rs1Val_T_4 = cdbBypassRs1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_5 = cdbBypassRs1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_6 = cdbBypassRs1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_7 = cdbBypassRs1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_8 = _entries_0_rs1Val_T_4 | _entries_0_rs1Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_9 = _entries_0_rs1Val_T_8 | _entries_0_rs1Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs1Val_T_10 = _entries_0_rs1Val_T_9 | _entries_0_rs1Val_T_7; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_4 = cdbBypassRs2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_5 = cdbBypassRs2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_6 = cdbBypassRs2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_7 = cdbBypassRs2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_8 = _entries_0_rs2Val_T_4 | _entries_0_rs2Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_9 = _entries_0_rs2Val_T_8 | _entries_0_rs2Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_0_rs2Val_T_10 = _entries_0_rs2Val_T_9 | _entries_0_rs2Val_T_7; // @[Mux.scala 27:73]
  wire [7:0] _rs1ROBEntry_T_4 = entries_1_rs1ROBId - 8'h1; // @[ReservationStation.scala 176:53]
  wire [7:0] _rs2ROBEntry_T_4 = entries_1_rs2ROBId - 8'h1; // @[ReservationStation.scala 177:53]
  wire [1:0] _GEN_292 = 3'h1 == _rs1ROBEntry_T_4[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_293 = 3'h2 == _rs1ROBEntry_T_4[2:0] ? io_robRead_2_state : _GEN_292; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_294 = 3'h3 == _rs1ROBEntry_T_4[2:0] ? io_robRead_3_state : _GEN_293; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_295 = 3'h4 == _rs1ROBEntry_T_4[2:0] ? io_robRead_4_state : _GEN_294; // @[ReservationStation.scala 178:{69,69}]
  wire  _GEN_297 = 3'h1 == _rs1ROBEntry_T_4[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_298 = 3'h2 == _rs1ROBEntry_T_4[2:0] ? io_robRead_2_busy : _GEN_297; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_299 = 3'h3 == _rs1ROBEntry_T_4[2:0] ? io_robRead_3_busy : _GEN_298; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_300 = 3'h4 == _rs1ROBEntry_T_4[2:0] ? io_robRead_4_busy : _GEN_299; // @[ReservationStation.scala 178:{48,48}]
  wire [4:0] _GEN_302 = 3'h1 == _rs1ROBEntry_T_4[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_303 = 3'h2 == _rs1ROBEntry_T_4[2:0] ? io_robRead_2_rd : _GEN_302; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_304 = 3'h3 == _rs1ROBEntry_T_4[2:0] ? io_robRead_3_rd : _GEN_303; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_305 = 3'h4 == _rs1ROBEntry_T_4[2:0] ? io_robRead_4_rd : _GEN_304; // @[ReservationStation.scala 178:{132,132}]
  wire  rs1FromROB_1 = (_GEN_300 & _GEN_295 == 2'h2 | _GEN_295 == 2'h3) & _GEN_305 == entries_1_rs1 & entries_1_rs1 != 5'h0
    ; // @[ReservationStation.scala 178:142]
  wire [1:0] _GEN_307 = 3'h1 == _rs2ROBEntry_T_4[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_308 = 3'h2 == _rs2ROBEntry_T_4[2:0] ? io_robRead_2_state : _GEN_307; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_309 = 3'h3 == _rs2ROBEntry_T_4[2:0] ? io_robRead_3_state : _GEN_308; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_310 = 3'h4 == _rs2ROBEntry_T_4[2:0] ? io_robRead_4_state : _GEN_309; // @[ReservationStation.scala 179:{69,69}]
  wire  _GEN_312 = 3'h1 == _rs2ROBEntry_T_4[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_313 = 3'h2 == _rs2ROBEntry_T_4[2:0] ? io_robRead_2_busy : _GEN_312; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_314 = 3'h3 == _rs2ROBEntry_T_4[2:0] ? io_robRead_3_busy : _GEN_313; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_315 = 3'h4 == _rs2ROBEntry_T_4[2:0] ? io_robRead_4_busy : _GEN_314; // @[ReservationStation.scala 179:{48,48}]
  wire [4:0] _GEN_317 = 3'h1 == _rs2ROBEntry_T_4[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_318 = 3'h2 == _rs2ROBEntry_T_4[2:0] ? io_robRead_2_rd : _GEN_317; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_319 = 3'h3 == _rs2ROBEntry_T_4[2:0] ? io_robRead_3_rd : _GEN_318; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_320 = 3'h4 == _rs2ROBEntry_T_4[2:0] ? io_robRead_4_rd : _GEN_319; // @[ReservationStation.scala 179:{132,132}]
  wire  rs2FromROB_1 = (_GEN_315 & _GEN_310 == 2'h2 | _GEN_310 == 2'h3) & _GEN_320 == entries_1_rs2 & entries_1_rs2 != 5'h0
    ; // @[ReservationStation.scala 179:142]
  wire [31:0] _GEN_322 = 3'h1 == _rs1ROBEntry_T_4[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_323 = 3'h2 == _rs1ROBEntry_T_4[2:0] ? io_robRead_2_data : _GEN_322; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_324 = 3'h3 == _rs1ROBEntry_T_4[2:0] ? io_robRead_3_data : _GEN_323; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_329 = 3'h1 == _rs2ROBEntry_T_4[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_330 = 3'h2 == _rs2ROBEntry_T_4[2:0] ? io_robRead_2_data : _GEN_329; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_331 = 3'h3 == _rs2ROBEntry_T_4[2:0] ? io_robRead_3_data : _GEN_330; // @[ReservationStation.scala 185:{26,26}]
  wire  _rs1MatchVec_T_4 = io_cdb_0_bits_rd == entries_1_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_5 = io_cdb_1_bits_rd == entries_1_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_6 = io_cdb_2_bits_rd == entries_1_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_7 = io_cdb_3_bits_rd == entries_1_rs1; // @[ReservationStation.scala 189:61]
  wire [3:0] rs1MatchVec_1 = {_rs1MatchVec_T_7,_rs1MatchVec_T_6,_rs1MatchVec_T_5,_rs1MatchVec_T_4}; // @[Cat.scala 33:92]
  wire  _rs2MatchVec_T_4 = io_cdb_0_bits_rd == entries_1_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_5 = io_cdb_1_bits_rd == entries_1_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_6 = io_cdb_2_bits_rd == entries_1_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_7 = io_cdb_3_bits_rd == entries_1_rs2; // @[ReservationStation.scala 190:61]
  wire [3:0] rs2MatchVec_1 = {_rs2MatchVec_T_7,_rs2MatchVec_T_6,_rs2MatchVec_T_5,_rs2MatchVec_T_4}; // @[Cat.scala 33:92]
  wire  _rs1IDMatchVec_T_4 = io_cdb_0_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_5 = io_cdb_1_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_6 = io_cdb_2_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_7 = io_cdb_3_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire [3:0] rs1IDMatchVec_1 = {_rs1IDMatchVec_T_7,_rs1IDMatchVec_T_6,_rs1IDMatchVec_T_5,_rs1IDMatchVec_T_4}; // @[Cat.scala 33:92]
  wire  _rs2IDMatchVec_T_4 = io_cdb_0_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_5 = io_cdb_1_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_6 = io_cdb_2_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_7 = io_cdb_3_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire [3:0] rs2IDMatchVec_1 = {_rs2IDMatchVec_T_7,_rs2IDMatchVec_T_6,_rs2IDMatchVec_T_5,_rs2IDMatchVec_T_4}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_1 = cdbValidVec & rs1MatchVec_1; // @[ReservationStation.scala 194:44]
  wire [3:0] cdbBypassRs1_1 = _cdbBypassRs1_T_1 & rs1IDMatchVec_1; // @[ReservationStation.scala 194:58]
  wire [3:0] _cdbBypassRs2_T_1 = cdbValidVec & rs2MatchVec_1; // @[ReservationStation.scala 195:44]
  wire [3:0] cdbBypassRs2_1 = _cdbBypassRs2_T_1 & rs2IDMatchVec_1; // @[ReservationStation.scala 195:58]
  wire  bypassRs1_1 = |cdbBypassRs1_1; // @[ReservationStation.scala 198:42]
  wire  bypassRs2_1 = |cdbBypassRs2_1; // @[ReservationStation.scala 199:42]
  wire [31:0] _entries_1_rs1Val_T_4 = cdbBypassRs1_1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_5 = cdbBypassRs1_1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_6 = cdbBypassRs1_1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_7 = cdbBypassRs1_1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_8 = _entries_1_rs1Val_T_4 | _entries_1_rs1Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_9 = _entries_1_rs1Val_T_8 | _entries_1_rs1Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs1Val_T_10 = _entries_1_rs1Val_T_9 | _entries_1_rs1Val_T_7; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_4 = cdbBypassRs2_1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_5 = cdbBypassRs2_1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_6 = cdbBypassRs2_1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_7 = cdbBypassRs2_1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_8 = _entries_1_rs2Val_T_4 | _entries_1_rs2Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_9 = _entries_1_rs2Val_T_8 | _entries_1_rs2Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_1_rs2Val_T_10 = _entries_1_rs2Val_T_9 | _entries_1_rs2Val_T_7; // @[Mux.scala 27:73]
  wire [7:0] _rs1ROBEntry_T_7 = entries_2_rs1ROBId - 8'h1; // @[ReservationStation.scala 176:53]
  wire [7:0] _rs2ROBEntry_T_7 = entries_2_rs2ROBId - 8'h1; // @[ReservationStation.scala 177:53]
  wire [1:0] _GEN_344 = 3'h1 == _rs1ROBEntry_T_7[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_345 = 3'h2 == _rs1ROBEntry_T_7[2:0] ? io_robRead_2_state : _GEN_344; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_346 = 3'h3 == _rs1ROBEntry_T_7[2:0] ? io_robRead_3_state : _GEN_345; // @[ReservationStation.scala 178:{69,69}]
  wire [1:0] _GEN_347 = 3'h4 == _rs1ROBEntry_T_7[2:0] ? io_robRead_4_state : _GEN_346; // @[ReservationStation.scala 178:{69,69}]
  wire  _GEN_349 = 3'h1 == _rs1ROBEntry_T_7[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_350 = 3'h2 == _rs1ROBEntry_T_7[2:0] ? io_robRead_2_busy : _GEN_349; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_351 = 3'h3 == _rs1ROBEntry_T_7[2:0] ? io_robRead_3_busy : _GEN_350; // @[ReservationStation.scala 178:{48,48}]
  wire  _GEN_352 = 3'h4 == _rs1ROBEntry_T_7[2:0] ? io_robRead_4_busy : _GEN_351; // @[ReservationStation.scala 178:{48,48}]
  wire [4:0] _GEN_354 = 3'h1 == _rs1ROBEntry_T_7[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_355 = 3'h2 == _rs1ROBEntry_T_7[2:0] ? io_robRead_2_rd : _GEN_354; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_356 = 3'h3 == _rs1ROBEntry_T_7[2:0] ? io_robRead_3_rd : _GEN_355; // @[ReservationStation.scala 178:{132,132}]
  wire [4:0] _GEN_357 = 3'h4 == _rs1ROBEntry_T_7[2:0] ? io_robRead_4_rd : _GEN_356; // @[ReservationStation.scala 178:{132,132}]
  wire  rs1FromROB_2 = (_GEN_352 & _GEN_347 == 2'h2 | _GEN_347 == 2'h3) & _GEN_357 == entries_2_rs1 & entries_2_rs1 != 5'h0
    ; // @[ReservationStation.scala 178:142]
  wire [1:0] _GEN_359 = 3'h1 == _rs2ROBEntry_T_7[2:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_360 = 3'h2 == _rs2ROBEntry_T_7[2:0] ? io_robRead_2_state : _GEN_359; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_361 = 3'h3 == _rs2ROBEntry_T_7[2:0] ? io_robRead_3_state : _GEN_360; // @[ReservationStation.scala 179:{69,69}]
  wire [1:0] _GEN_362 = 3'h4 == _rs2ROBEntry_T_7[2:0] ? io_robRead_4_state : _GEN_361; // @[ReservationStation.scala 179:{69,69}]
  wire  _GEN_364 = 3'h1 == _rs2ROBEntry_T_7[2:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_365 = 3'h2 == _rs2ROBEntry_T_7[2:0] ? io_robRead_2_busy : _GEN_364; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_366 = 3'h3 == _rs2ROBEntry_T_7[2:0] ? io_robRead_3_busy : _GEN_365; // @[ReservationStation.scala 179:{48,48}]
  wire  _GEN_367 = 3'h4 == _rs2ROBEntry_T_7[2:0] ? io_robRead_4_busy : _GEN_366; // @[ReservationStation.scala 179:{48,48}]
  wire [4:0] _GEN_369 = 3'h1 == _rs2ROBEntry_T_7[2:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_370 = 3'h2 == _rs2ROBEntry_T_7[2:0] ? io_robRead_2_rd : _GEN_369; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_371 = 3'h3 == _rs2ROBEntry_T_7[2:0] ? io_robRead_3_rd : _GEN_370; // @[ReservationStation.scala 179:{132,132}]
  wire [4:0] _GEN_372 = 3'h4 == _rs2ROBEntry_T_7[2:0] ? io_robRead_4_rd : _GEN_371; // @[ReservationStation.scala 179:{132,132}]
  wire  rs2FromROB_2 = (_GEN_367 & _GEN_362 == 2'h2 | _GEN_362 == 2'h3) & _GEN_372 == entries_2_rs2 & entries_2_rs2 != 5'h0
    ; // @[ReservationStation.scala 179:142]
  wire [31:0] _GEN_374 = 3'h1 == _rs1ROBEntry_T_7[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_375 = 3'h2 == _rs1ROBEntry_T_7[2:0] ? io_robRead_2_data : _GEN_374; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_376 = 3'h3 == _rs1ROBEntry_T_7[2:0] ? io_robRead_3_data : _GEN_375; // @[ReservationStation.scala 181:{26,26}]
  wire [31:0] _GEN_381 = 3'h1 == _rs2ROBEntry_T_7[2:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_382 = 3'h2 == _rs2ROBEntry_T_7[2:0] ? io_robRead_2_data : _GEN_381; // @[ReservationStation.scala 185:{26,26}]
  wire [31:0] _GEN_383 = 3'h3 == _rs2ROBEntry_T_7[2:0] ? io_robRead_3_data : _GEN_382; // @[ReservationStation.scala 185:{26,26}]
  wire  _rs1MatchVec_T_8 = io_cdb_0_bits_rd == entries_2_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_9 = io_cdb_1_bits_rd == entries_2_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_10 = io_cdb_2_bits_rd == entries_2_rs1; // @[ReservationStation.scala 189:61]
  wire  _rs1MatchVec_T_11 = io_cdb_3_bits_rd == entries_2_rs1; // @[ReservationStation.scala 189:61]
  wire [3:0] rs1MatchVec_2 = {_rs1MatchVec_T_11,_rs1MatchVec_T_10,_rs1MatchVec_T_9,_rs1MatchVec_T_8}; // @[Cat.scala 33:92]
  wire  _rs2MatchVec_T_8 = io_cdb_0_bits_rd == entries_2_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_9 = io_cdb_1_bits_rd == entries_2_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_10 = io_cdb_2_bits_rd == entries_2_rs2; // @[ReservationStation.scala 190:61]
  wire  _rs2MatchVec_T_11 = io_cdb_3_bits_rd == entries_2_rs2; // @[ReservationStation.scala 190:61]
  wire [3:0] rs2MatchVec_2 = {_rs2MatchVec_T_11,_rs2MatchVec_T_10,_rs2MatchVec_T_9,_rs2MatchVec_T_8}; // @[Cat.scala 33:92]
  wire  _rs1IDMatchVec_T_8 = io_cdb_0_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_9 = io_cdb_1_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_10 = io_cdb_2_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire  _rs1IDMatchVec_T_11 = io_cdb_3_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 191:63]
  wire [3:0] rs1IDMatchVec_2 = {_rs1IDMatchVec_T_11,_rs1IDMatchVec_T_10,_rs1IDMatchVec_T_9,_rs1IDMatchVec_T_8}; // @[Cat.scala 33:92]
  wire  _rs2IDMatchVec_T_8 = io_cdb_0_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_9 = io_cdb_1_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_10 = io_cdb_2_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire  _rs2IDMatchVec_T_11 = io_cdb_3_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 192:63]
  wire [3:0] rs2IDMatchVec_2 = {_rs2IDMatchVec_T_11,_rs2IDMatchVec_T_10,_rs2IDMatchVec_T_9,_rs2IDMatchVec_T_8}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_2 = cdbValidVec & rs1MatchVec_2; // @[ReservationStation.scala 194:44]
  wire [3:0] cdbBypassRs1_2 = _cdbBypassRs1_T_2 & rs1IDMatchVec_2; // @[ReservationStation.scala 194:58]
  wire [3:0] _cdbBypassRs2_T_2 = cdbValidVec & rs2MatchVec_2; // @[ReservationStation.scala 195:44]
  wire [3:0] cdbBypassRs2_2 = _cdbBypassRs2_T_2 & rs2IDMatchVec_2; // @[ReservationStation.scala 195:58]
  wire  bypassRs1_2 = |cdbBypassRs1_2; // @[ReservationStation.scala 198:42]
  wire  bypassRs2_2 = |cdbBypassRs2_2; // @[ReservationStation.scala 199:42]
  wire [31:0] _entries_2_rs1Val_T_4 = cdbBypassRs1_2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_5 = cdbBypassRs1_2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_6 = cdbBypassRs1_2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_7 = cdbBypassRs1_2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_8 = _entries_2_rs1Val_T_4 | _entries_2_rs1Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_9 = _entries_2_rs1Val_T_8 | _entries_2_rs1Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs1Val_T_10 = _entries_2_rs1Val_T_9 | _entries_2_rs1Val_T_7; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_4 = cdbBypassRs2_2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_5 = cdbBypassRs2_2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_6 = cdbBypassRs2_2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_7 = cdbBypassRs2_2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_8 = _entries_2_rs2Val_T_4 | _entries_2_rs2Val_T_5; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_9 = _entries_2_rs2Val_T_8 | _entries_2_rs2Val_T_6; // @[Mux.scala 27:73]
  wire [31:0] _entries_2_rs2Val_T_10 = _entries_2_rs2Val_T_9 | _entries_2_rs2Val_T_7; // @[Mux.scala 27:73]
  assign io_enq_ready = ~full & ~_GEN_8; // @[ReservationStation.scala 95:27]
  assign io_deq_valid = oprReady & _GEN_11; // @[ReservationStation.scala 96:30]
  assign io_deq_bits_op = 2'h2 == head ? entries_2_op : _GEN_13; // @[ReservationStation.scala 97:{20,20}]
  assign io_deq_bits_ROBId = 2'h2 == head ? entries_2_ROBId : _GEN_16; // @[ReservationStation.scala 98:{23,23}]
  assign io_deq_bits_opr1 = 2'h2 == head ? entries_2_opr1 : _GEN_19; // @[ReservationStation.scala 99:{22,22}]
  assign io_deq_bits_opr2 = 2'h2 == head ? entries_2_opr2 : _GEN_22; // @[ReservationStation.scala 100:{22,22}]
  assign io_deq_bits_rs1Val = 2'h2 == head ? entries_2_rs1Val : _GEN_25; // @[ReservationStation.scala 101:{24,24}]
  assign io_deq_bits_rs2Val = 2'h2 == head ? entries_2_rs2Val : _GEN_28; // @[ReservationStation.scala 102:{24,24}]
  assign io_deq_bits_immSrc = 2'h2 == head ? entries_2_immSrc : _GEN_31; // @[ReservationStation.scala 103:{24,24}]
  assign io_deq_bits_immSign = 2'h2 == head ? entries_2_immSign : _GEN_34; // @[ReservationStation.scala 104:{25,25}]
  assign io_deq_bits_excpType = 2'h2 == head ? entries_2_excpType : _GEN_37; // @[ReservationStation.scala 105:{26,26}]
  assign io_deq_bits_pc = 2'h2 == head ? entries_2_pc : _GEN_40; // @[ReservationStation.scala 106:{20,20}]
  assign io_deq_bits_inst = 2'h2 == head ? entries_2_inst : _GEN_43; // @[ReservationStation.scala 107:{22,22}]
  assign io_robOut_valid = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign io_robOut_bits_id = _GEN_233[2:0];
  assign io_rf_0_addr = _T ? io_enq_bits_rs1 : 5'h0; // @[ReservationStation.scala 115:16 120:24 144:23]
  assign io_rf_1_addr = _T ? io_enq_bits_rs2 : 5'h0; // @[ReservationStation.scala 115:16 120:24 145:23]
  always @(posedge clock) begin
    if (io_flush) begin // @[ReservationStation.scala 212:21]
      entries_0_busy <= 1'h0; // @[ReservationStation.scala 213:37]
    end else if (_T_1) begin // @[ReservationStation.scala 152:24]
      if (2'h0 == head) begin // @[ReservationStation.scala 153:28]
        entries_0_busy <= 1'h0; // @[ReservationStation.scala 153:28]
      end else begin
        entries_0_busy <= _GEN_169;
      end
    end else begin
      entries_0_busy <= _GEN_169;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 123:26]
        entries_0_op <= io_enq_bits_op; // @[ReservationStation.scala 123:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 122:29]
        entries_0_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 122:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 127:28]
        entries_0_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 127:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 128:28]
        entries_0_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 128:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 129:27]
        entries_0_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 129:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 130:27]
        entries_0_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 130:27]
      end
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1) begin // @[ReservationStation.scala 201:29]
        entries_0_rs1Val <= _entries_0_rs1Val_T_10; // @[ReservationStation.scala 202:26]
      end else if (rs1FromROB) begin // @[ReservationStation.scala 180:30]
        if (3'h4 == _rs1ROBEntry_T_1[2:0]) begin // @[ReservationStation.scala 181:26]
          entries_0_rs1Val <= io_robRead_4_data; // @[ReservationStation.scala 181:26]
        end else begin
          entries_0_rs1Val <= _GEN_272;
        end
      end else begin
        entries_0_rs1Val <= _GEN_216;
      end
    end else begin
      entries_0_rs1Val <= _GEN_216;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2) begin // @[ReservationStation.scala 205:29]
        entries_0_rs2Val <= _entries_0_rs2Val_T_10; // @[ReservationStation.scala 206:26]
      end else if (rs2FromROB) begin // @[ReservationStation.scala 184:30]
        if (3'h4 == _rs2ROBEntry_T_1[2:0]) begin // @[ReservationStation.scala 185:26]
          entries_0_rs2Val <= io_robRead_4_data; // @[ReservationStation.scala 185:26]
        end else begin
          entries_0_rs2Val <= _GEN_279;
        end
      end else begin
        entries_0_rs2Val <= _GEN_219;
      end
    end else begin
      entries_0_rs2Val <= _GEN_219;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1) begin // @[ReservationStation.scala 201:29]
        entries_0_rs1ROBId <= 8'h0; // @[ReservationStation.scala 203:28]
      end else if (rs1FromROB) begin // @[ReservationStation.scala 180:30]
        entries_0_rs1ROBId <= 8'h0; // @[ReservationStation.scala 182:28]
      end else begin
        entries_0_rs1ROBId <= _GEN_178;
      end
    end else begin
      entries_0_rs1ROBId <= _GEN_178;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2) begin // @[ReservationStation.scala 205:29]
        entries_0_rs2ROBId <= 8'h0; // @[ReservationStation.scala 207:28]
      end else if (rs2FromROB) begin // @[ReservationStation.scala 184:30]
        entries_0_rs2ROBId <= 8'h0; // @[ReservationStation.scala 186:28]
      end else begin
        entries_0_rs2ROBId <= _GEN_181;
      end
    end else begin
      entries_0_rs2ROBId <= _GEN_181;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 132:30]
        entries_0_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 132:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 133:31]
        entries_0_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 133:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 134:32]
        entries_0_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 134:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 135:26]
        entries_0_pc <= io_enq_bits_pc; // @[ReservationStation.scala 135:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h0 == tail) begin // @[ReservationStation.scala 136:28]
        entries_0_inst <= io_enq_bits_inst; // @[ReservationStation.scala 136:28]
      end else if (2'h0 == tail) begin // @[ReservationStation.scala 126:28]
        entries_0_inst <= io_enq_bits_inst; // @[ReservationStation.scala 126:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 212:21]
      entries_1_busy <= 1'h0; // @[ReservationStation.scala 213:37]
    end else if (_T_1) begin // @[ReservationStation.scala 152:24]
      if (2'h1 == head) begin // @[ReservationStation.scala 153:28]
        entries_1_busy <= 1'h0; // @[ReservationStation.scala 153:28]
      end else begin
        entries_1_busy <= _GEN_170;
      end
    end else begin
      entries_1_busy <= _GEN_170;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 123:26]
        entries_1_op <= io_enq_bits_op; // @[ReservationStation.scala 123:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 122:29]
        entries_1_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 122:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 127:28]
        entries_1_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 127:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 128:28]
        entries_1_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 128:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 129:27]
        entries_1_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 129:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 130:27]
        entries_1_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 130:27]
      end
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1_1) begin // @[ReservationStation.scala 201:29]
        entries_1_rs1Val <= _entries_1_rs1Val_T_10; // @[ReservationStation.scala 202:26]
      end else if (rs1FromROB_1) begin // @[ReservationStation.scala 180:30]
        if (3'h4 == _rs1ROBEntry_T_4[2:0]) begin // @[ReservationStation.scala 181:26]
          entries_1_rs1Val <= io_robRead_4_data; // @[ReservationStation.scala 181:26]
        end else begin
          entries_1_rs1Val <= _GEN_324;
        end
      end else begin
        entries_1_rs1Val <= _GEN_217;
      end
    end else begin
      entries_1_rs1Val <= _GEN_217;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2_1) begin // @[ReservationStation.scala 205:29]
        entries_1_rs2Val <= _entries_1_rs2Val_T_10; // @[ReservationStation.scala 206:26]
      end else if (rs2FromROB_1) begin // @[ReservationStation.scala 184:30]
        if (3'h4 == _rs2ROBEntry_T_4[2:0]) begin // @[ReservationStation.scala 185:26]
          entries_1_rs2Val <= io_robRead_4_data; // @[ReservationStation.scala 185:26]
        end else begin
          entries_1_rs2Val <= _GEN_331;
        end
      end else begin
        entries_1_rs2Val <= _GEN_220;
      end
    end else begin
      entries_1_rs2Val <= _GEN_220;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1_1) begin // @[ReservationStation.scala 201:29]
        entries_1_rs1ROBId <= 8'h0; // @[ReservationStation.scala 203:28]
      end else if (rs1FromROB_1) begin // @[ReservationStation.scala 180:30]
        entries_1_rs1ROBId <= 8'h0; // @[ReservationStation.scala 182:28]
      end else begin
        entries_1_rs1ROBId <= _GEN_179;
      end
    end else begin
      entries_1_rs1ROBId <= _GEN_179;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2_1) begin // @[ReservationStation.scala 205:29]
        entries_1_rs2ROBId <= 8'h0; // @[ReservationStation.scala 207:28]
      end else if (rs2FromROB_1) begin // @[ReservationStation.scala 184:30]
        entries_1_rs2ROBId <= 8'h0; // @[ReservationStation.scala 186:28]
      end else begin
        entries_1_rs2ROBId <= _GEN_182;
      end
    end else begin
      entries_1_rs2ROBId <= _GEN_182;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 132:30]
        entries_1_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 132:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 133:31]
        entries_1_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 133:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 134:32]
        entries_1_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 134:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 135:26]
        entries_1_pc <= io_enq_bits_pc; // @[ReservationStation.scala 135:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h1 == tail) begin // @[ReservationStation.scala 136:28]
        entries_1_inst <= io_enq_bits_inst; // @[ReservationStation.scala 136:28]
      end else if (2'h1 == tail) begin // @[ReservationStation.scala 126:28]
        entries_1_inst <= io_enq_bits_inst; // @[ReservationStation.scala 126:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 212:21]
      entries_2_busy <= 1'h0; // @[ReservationStation.scala 213:37]
    end else if (_T_1) begin // @[ReservationStation.scala 152:24]
      if (2'h2 == head) begin // @[ReservationStation.scala 153:28]
        entries_2_busy <= 1'h0; // @[ReservationStation.scala 153:28]
      end else begin
        entries_2_busy <= _GEN_171;
      end
    end else begin
      entries_2_busy <= _GEN_171;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 123:26]
        entries_2_op <= io_enq_bits_op; // @[ReservationStation.scala 123:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 122:29]
        entries_2_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 122:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 127:28]
        entries_2_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 127:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 128:28]
        entries_2_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 128:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 129:27]
        entries_2_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 129:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 130:27]
        entries_2_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 130:27]
      end
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1_2) begin // @[ReservationStation.scala 201:29]
        entries_2_rs1Val <= _entries_2_rs1Val_T_10; // @[ReservationStation.scala 202:26]
      end else if (rs1FromROB_2) begin // @[ReservationStation.scala 180:30]
        if (3'h4 == _rs1ROBEntry_T_7[2:0]) begin // @[ReservationStation.scala 181:26]
          entries_2_rs1Val <= io_robRead_4_data; // @[ReservationStation.scala 181:26]
        end else begin
          entries_2_rs1Val <= _GEN_376;
        end
      end else begin
        entries_2_rs1Val <= _GEN_218;
      end
    end else begin
      entries_2_rs1Val <= _GEN_218;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2_2) begin // @[ReservationStation.scala 205:29]
        entries_2_rs2Val <= _entries_2_rs2Val_T_10; // @[ReservationStation.scala 206:26]
      end else if (rs2FromROB_2) begin // @[ReservationStation.scala 184:30]
        if (3'h4 == _rs2ROBEntry_T_7[2:0]) begin // @[ReservationStation.scala 185:26]
          entries_2_rs2Val <= io_robRead_4_data; // @[ReservationStation.scala 185:26]
        end else begin
          entries_2_rs2Val <= _GEN_383;
        end
      end else begin
        entries_2_rs2Val <= _GEN_221;
      end
    end else begin
      entries_2_rs2Val <= _GEN_221;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs1_2) begin // @[ReservationStation.scala 201:29]
        entries_2_rs1ROBId <= 8'h0; // @[ReservationStation.scala 203:28]
      end else if (rs1FromROB_2) begin // @[ReservationStation.scala 180:30]
        entries_2_rs1ROBId <= 8'h0; // @[ReservationStation.scala 182:28]
      end else begin
        entries_2_rs1ROBId <= _GEN_180;
      end
    end else begin
      entries_2_rs1ROBId <= _GEN_180;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 171:22]
      if (bypassRs2_2) begin // @[ReservationStation.scala 205:29]
        entries_2_rs2ROBId <= 8'h0; // @[ReservationStation.scala 207:28]
      end else if (rs2FromROB_2) begin // @[ReservationStation.scala 184:30]
        entries_2_rs2ROBId <= 8'h0; // @[ReservationStation.scala 186:28]
      end else begin
        entries_2_rs2ROBId <= _GEN_183;
      end
    end else begin
      entries_2_rs2ROBId <= _GEN_183;
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 132:30]
        entries_2_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 132:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 133:31]
        entries_2_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 133:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 134:32]
        entries_2_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 134:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 135:26]
        entries_2_pc <= io_enq_bits_pc; // @[ReservationStation.scala 135:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 120:24]
      if (2'h2 == tail) begin // @[ReservationStation.scala 136:28]
        entries_2_inst <= io_enq_bits_inst; // @[ReservationStation.scala 136:28]
      end else if (2'h2 == tail) begin // @[ReservationStation.scala 126:28]
        entries_2_inst <= io_enq_bits_inst; // @[ReservationStation.scala 126:28]
      end
    end
    if (reset) begin // @[ReservationStation.scala 86:23]
      head <= 2'h0; // @[ReservationStation.scala 86:23]
    end else if (io_flush) begin // @[ReservationStation.scala 212:21]
      head <= 2'h0; // @[ReservationStation.scala 214:14]
    end else if (_T_1) begin // @[ReservationStation.scala 152:24]
      if (head == 2'h2) begin // @[ReservationStation.scala 158:20]
        head <= 2'h0;
      end else begin
        head <= _head_T_2;
      end
    end
    if (reset) begin // @[ReservationStation.scala 87:23]
      tail <= 2'h0; // @[ReservationStation.scala 87:23]
    end else if (io_flush) begin // @[ReservationStation.scala 212:21]
      tail <= 2'h0; // @[ReservationStation.scala 215:14]
    end else if (_T) begin // @[ReservationStation.scala 120:24]
      if (tail == 2'h2) begin // @[ReservationStation.scala 149:20]
        tail <= 2'h0;
      end else begin
        tail <= _tail_T_2;
      end
    end
    if (reset) begin // @[ReservationStation.scala 89:24]
      count <= 2'h0; // @[ReservationStation.scala 89:24]
    end else if (io_flush) begin // @[ReservationStation.scala 212:21]
      count <= 2'h0; // @[ReservationStation.scala 216:15]
    end else if (~(_T_1 & _T)) begin // @[ReservationStation.scala 161:43]
      if (_T_1) begin // @[ReservationStation.scala 165:27]
        count <= _count_T_3; // @[ReservationStation.scala 166:19]
      end else begin
        count <= _GEN_236;
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
  entries_0_op = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_ROBId = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_opr1 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_opr2 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_rs1 = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_rs2 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_rs1Val = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_rs2Val = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_rs1ROBId = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_rs2ROBId = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  entries_0_immSrc = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  entries_0_immSign = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  entries_0_excpType = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  entries_0_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  entries_0_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_busy = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_op = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_ROBId = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_opr1 = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  entries_1_opr2 = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_rs1 = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  entries_1_rs2 = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  entries_1_rs1Val = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  entries_1_rs2Val = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  entries_1_rs1ROBId = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  entries_1_rs2ROBId = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  entries_1_immSrc = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  entries_1_immSign = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entries_1_excpType = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  entries_1_pc = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  entries_1_inst = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  entries_2_busy = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  entries_2_op = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  entries_2_ROBId = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  entries_2_opr1 = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  entries_2_opr2 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  entries_2_rs1 = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  entries_2_rs2 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  entries_2_rs1Val = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  entries_2_rs2Val = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  entries_2_rs1ROBId = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  entries_2_rs2ROBId = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  entries_2_immSrc = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  entries_2_immSign = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  entries_2_excpType = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  entries_2_pc = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  entries_2_inst = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  head = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  tail = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  count = _RAND_50[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
