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
  output [3:0]  io_robOut_bits_id,
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
  input         io_robRead_5_busy,
  input  [1:0]  io_robRead_5_state,
  input  [4:0]  io_robRead_5_rd,
  input  [31:0] io_robRead_5_data,
  input         io_robRead_6_busy,
  input  [1:0]  io_robRead_6_state,
  input  [4:0]  io_robRead_6_rd,
  input  [31:0] io_robRead_6_data,
  input         io_robRead_7_busy,
  input  [1:0]  io_robRead_7_state,
  input  [4:0]  io_robRead_7_rd,
  input  [31:0] io_robRead_7_data,
  input         io_robRead_8_busy,
  input  [1:0]  io_robRead_8_state,
  input  [4:0]  io_robRead_8_rd,
  input  [31:0] io_robRead_8_data,
  input         io_robRead_9_busy,
  input  [1:0]  io_robRead_9_state,
  input  [4:0]  io_robRead_9_rd,
  input  [31:0] io_robRead_9_data,
  input         io_robRead_10_busy,
  input  [1:0]  io_robRead_10_state,
  input  [4:0]  io_robRead_10_rd,
  input  [31:0] io_robRead_10_data,
  input         io_robRead_11_busy,
  input  [1:0]  io_robRead_11_state,
  input  [4:0]  io_robRead_11_rd,
  input  [31:0] io_robRead_11_data,
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
  reg  entries_3_busy; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_3_op; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_3_ROBId; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_3_opr1; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_3_opr2; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_3_rs1; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_3_rs2; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_3_rs1Val; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_3_rs2Val; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_3_rs1ROBId; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_3_rs2ROBId; // @[ReservationStation.scala 85:22]
  reg [2:0] entries_3_immSrc; // @[ReservationStation.scala 85:22]
  reg  entries_3_immSign; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_3_excpType; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_3_pc; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_3_inst; // @[ReservationStation.scala 85:22]
  reg  entries_4_busy; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_4_op; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_4_ROBId; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_4_opr1; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_4_opr2; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_4_rs1; // @[ReservationStation.scala 85:22]
  reg [4:0] entries_4_rs2; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_4_rs1Val; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_4_rs2Val; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_4_rs1ROBId; // @[ReservationStation.scala 85:22]
  reg [7:0] entries_4_rs2ROBId; // @[ReservationStation.scala 85:22]
  reg [2:0] entries_4_immSrc; // @[ReservationStation.scala 85:22]
  reg  entries_4_immSign; // @[ReservationStation.scala 85:22]
  reg [3:0] entries_4_excpType; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_4_pc; // @[ReservationStation.scala 85:22]
  reg [31:0] entries_4_inst; // @[ReservationStation.scala 85:22]
  reg [2:0] head; // @[ReservationStation.scala 86:23]
  reg [2:0] tail; // @[ReservationStation.scala 87:23]
  reg [2:0] count; // @[ReservationStation.scala 89:24]
  wire  full = count == 3'h5; // @[ReservationStation.scala 90:22]
  wire [7:0] _GEN_1 = 3'h1 == head ? entries_1_rs1ROBId : entries_0_rs1ROBId; // @[ReservationStation.scala 104:{42,42}]
  wire [7:0] _GEN_2 = 3'h2 == head ? entries_2_rs1ROBId : _GEN_1; // @[ReservationStation.scala 104:{42,42}]
  wire [7:0] _GEN_3 = 3'h3 == head ? entries_3_rs1ROBId : _GEN_2; // @[ReservationStation.scala 104:{42,42}]
  wire [7:0] _GEN_4 = 3'h4 == head ? entries_4_rs1ROBId : _GEN_3; // @[ReservationStation.scala 104:{42,42}]
  wire  _oprReady_T = _GEN_4 == 8'h0; // @[ReservationStation.scala 104:42]
  wire [7:0] _rs1ROBEntry_T_13 = entries_4_rs1ROBId - 8'h1; // @[ReservationStation.scala 204:53]
  wire  _GEN_890 = 4'h1 == _rs1ROBEntry_T_13[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_891 = 4'h2 == _rs1ROBEntry_T_13[3:0] ? io_robRead_2_busy : _GEN_890; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_892 = 4'h3 == _rs1ROBEntry_T_13[3:0] ? io_robRead_3_busy : _GEN_891; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_893 = 4'h4 == _rs1ROBEntry_T_13[3:0] ? io_robRead_4_busy : _GEN_892; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_894 = 4'h5 == _rs1ROBEntry_T_13[3:0] ? io_robRead_5_busy : _GEN_893; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_895 = 4'h6 == _rs1ROBEntry_T_13[3:0] ? io_robRead_6_busy : _GEN_894; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_896 = 4'h7 == _rs1ROBEntry_T_13[3:0] ? io_robRead_7_busy : _GEN_895; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_897 = 4'h8 == _rs1ROBEntry_T_13[3:0] ? io_robRead_8_busy : _GEN_896; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_898 = 4'h9 == _rs1ROBEntry_T_13[3:0] ? io_robRead_9_busy : _GEN_897; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_899 = 4'ha == _rs1ROBEntry_T_13[3:0] ? io_robRead_10_busy : _GEN_898; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_900 = 4'hb == _rs1ROBEntry_T_13[3:0] ? io_robRead_11_busy : _GEN_899; // @[ReservationStation.scala 206:{48,48}]
  wire [1:0] _GEN_878 = 4'h1 == _rs1ROBEntry_T_13[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_879 = 4'h2 == _rs1ROBEntry_T_13[3:0] ? io_robRead_2_state : _GEN_878; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_880 = 4'h3 == _rs1ROBEntry_T_13[3:0] ? io_robRead_3_state : _GEN_879; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_881 = 4'h4 == _rs1ROBEntry_T_13[3:0] ? io_robRead_4_state : _GEN_880; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_882 = 4'h5 == _rs1ROBEntry_T_13[3:0] ? io_robRead_5_state : _GEN_881; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_883 = 4'h6 == _rs1ROBEntry_T_13[3:0] ? io_robRead_6_state : _GEN_882; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_884 = 4'h7 == _rs1ROBEntry_T_13[3:0] ? io_robRead_7_state : _GEN_883; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_885 = 4'h8 == _rs1ROBEntry_T_13[3:0] ? io_robRead_8_state : _GEN_884; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_886 = 4'h9 == _rs1ROBEntry_T_13[3:0] ? io_robRead_9_state : _GEN_885; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_887 = 4'ha == _rs1ROBEntry_T_13[3:0] ? io_robRead_10_state : _GEN_886; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_888 = 4'hb == _rs1ROBEntry_T_13[3:0] ? io_robRead_11_state : _GEN_887; // @[ReservationStation.scala 206:{69,69}]
  wire [4:0] _GEN_902 = 4'h1 == _rs1ROBEntry_T_13[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_903 = 4'h2 == _rs1ROBEntry_T_13[3:0] ? io_robRead_2_rd : _GEN_902; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_904 = 4'h3 == _rs1ROBEntry_T_13[3:0] ? io_robRead_3_rd : _GEN_903; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_905 = 4'h4 == _rs1ROBEntry_T_13[3:0] ? io_robRead_4_rd : _GEN_904; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_906 = 4'h5 == _rs1ROBEntry_T_13[3:0] ? io_robRead_5_rd : _GEN_905; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_907 = 4'h6 == _rs1ROBEntry_T_13[3:0] ? io_robRead_6_rd : _GEN_906; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_908 = 4'h7 == _rs1ROBEntry_T_13[3:0] ? io_robRead_7_rd : _GEN_907; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_909 = 4'h8 == _rs1ROBEntry_T_13[3:0] ? io_robRead_8_rd : _GEN_908; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_910 = 4'h9 == _rs1ROBEntry_T_13[3:0] ? io_robRead_9_rd : _GEN_909; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_911 = 4'ha == _rs1ROBEntry_T_13[3:0] ? io_robRead_10_rd : _GEN_910; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_912 = 4'hb == _rs1ROBEntry_T_13[3:0] ? io_robRead_11_rd : _GEN_911; // @[ReservationStation.scala 206:{132,132}]
  wire  rs1FromROB_4 = (_GEN_900 & _GEN_888 == 2'h2 | _GEN_888 == 2'h3) & _GEN_912 == entries_4_rs1 & entries_4_rs1 != 5'h0
    ; // @[ReservationStation.scala 206:142]
  wire  _T_56 = entries_4_rs1ROBId != 8'h0; // @[ReservationStation.scala 209:43]
  wire  _T_58 = head == 3'h4; // @[ReservationStation.scala 213:27]
  wire [7:0] _rs1ROBEntry_T_10 = entries_3_rs1ROBId - 8'h1; // @[ReservationStation.scala 204:53]
  wire  _GEN_758 = 4'h1 == _rs1ROBEntry_T_10[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_759 = 4'h2 == _rs1ROBEntry_T_10[3:0] ? io_robRead_2_busy : _GEN_758; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_760 = 4'h3 == _rs1ROBEntry_T_10[3:0] ? io_robRead_3_busy : _GEN_759; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_761 = 4'h4 == _rs1ROBEntry_T_10[3:0] ? io_robRead_4_busy : _GEN_760; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_762 = 4'h5 == _rs1ROBEntry_T_10[3:0] ? io_robRead_5_busy : _GEN_761; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_763 = 4'h6 == _rs1ROBEntry_T_10[3:0] ? io_robRead_6_busy : _GEN_762; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_764 = 4'h7 == _rs1ROBEntry_T_10[3:0] ? io_robRead_7_busy : _GEN_763; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_765 = 4'h8 == _rs1ROBEntry_T_10[3:0] ? io_robRead_8_busy : _GEN_764; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_766 = 4'h9 == _rs1ROBEntry_T_10[3:0] ? io_robRead_9_busy : _GEN_765; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_767 = 4'ha == _rs1ROBEntry_T_10[3:0] ? io_robRead_10_busy : _GEN_766; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_768 = 4'hb == _rs1ROBEntry_T_10[3:0] ? io_robRead_11_busy : _GEN_767; // @[ReservationStation.scala 206:{48,48}]
  wire [1:0] _GEN_746 = 4'h1 == _rs1ROBEntry_T_10[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_747 = 4'h2 == _rs1ROBEntry_T_10[3:0] ? io_robRead_2_state : _GEN_746; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_748 = 4'h3 == _rs1ROBEntry_T_10[3:0] ? io_robRead_3_state : _GEN_747; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_749 = 4'h4 == _rs1ROBEntry_T_10[3:0] ? io_robRead_4_state : _GEN_748; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_750 = 4'h5 == _rs1ROBEntry_T_10[3:0] ? io_robRead_5_state : _GEN_749; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_751 = 4'h6 == _rs1ROBEntry_T_10[3:0] ? io_robRead_6_state : _GEN_750; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_752 = 4'h7 == _rs1ROBEntry_T_10[3:0] ? io_robRead_7_state : _GEN_751; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_753 = 4'h8 == _rs1ROBEntry_T_10[3:0] ? io_robRead_8_state : _GEN_752; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_754 = 4'h9 == _rs1ROBEntry_T_10[3:0] ? io_robRead_9_state : _GEN_753; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_755 = 4'ha == _rs1ROBEntry_T_10[3:0] ? io_robRead_10_state : _GEN_754; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_756 = 4'hb == _rs1ROBEntry_T_10[3:0] ? io_robRead_11_state : _GEN_755; // @[ReservationStation.scala 206:{69,69}]
  wire [4:0] _GEN_770 = 4'h1 == _rs1ROBEntry_T_10[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_771 = 4'h2 == _rs1ROBEntry_T_10[3:0] ? io_robRead_2_rd : _GEN_770; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_772 = 4'h3 == _rs1ROBEntry_T_10[3:0] ? io_robRead_3_rd : _GEN_771; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_773 = 4'h4 == _rs1ROBEntry_T_10[3:0] ? io_robRead_4_rd : _GEN_772; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_774 = 4'h5 == _rs1ROBEntry_T_10[3:0] ? io_robRead_5_rd : _GEN_773; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_775 = 4'h6 == _rs1ROBEntry_T_10[3:0] ? io_robRead_6_rd : _GEN_774; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_776 = 4'h7 == _rs1ROBEntry_T_10[3:0] ? io_robRead_7_rd : _GEN_775; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_777 = 4'h8 == _rs1ROBEntry_T_10[3:0] ? io_robRead_8_rd : _GEN_776; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_778 = 4'h9 == _rs1ROBEntry_T_10[3:0] ? io_robRead_9_rd : _GEN_777; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_779 = 4'ha == _rs1ROBEntry_T_10[3:0] ? io_robRead_10_rd : _GEN_778; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_780 = 4'hb == _rs1ROBEntry_T_10[3:0] ? io_robRead_11_rd : _GEN_779; // @[ReservationStation.scala 206:{132,132}]
  wire  rs1FromROB_3 = (_GEN_768 & _GEN_756 == 2'h2 | _GEN_756 == 2'h3) & _GEN_780 == entries_3_rs1 & entries_3_rs1 != 5'h0
    ; // @[ReservationStation.scala 206:142]
  wire  _T_44 = entries_3_rs1ROBId != 8'h0; // @[ReservationStation.scala 209:43]
  wire  _T_46 = head == 3'h3; // @[ReservationStation.scala 213:27]
  wire [7:0] _rs1ROBEntry_T_7 = entries_2_rs1ROBId - 8'h1; // @[ReservationStation.scala 204:53]
  wire  _GEN_626 = 4'h1 == _rs1ROBEntry_T_7[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_627 = 4'h2 == _rs1ROBEntry_T_7[3:0] ? io_robRead_2_busy : _GEN_626; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_628 = 4'h3 == _rs1ROBEntry_T_7[3:0] ? io_robRead_3_busy : _GEN_627; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_629 = 4'h4 == _rs1ROBEntry_T_7[3:0] ? io_robRead_4_busy : _GEN_628; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_630 = 4'h5 == _rs1ROBEntry_T_7[3:0] ? io_robRead_5_busy : _GEN_629; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_631 = 4'h6 == _rs1ROBEntry_T_7[3:0] ? io_robRead_6_busy : _GEN_630; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_632 = 4'h7 == _rs1ROBEntry_T_7[3:0] ? io_robRead_7_busy : _GEN_631; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_633 = 4'h8 == _rs1ROBEntry_T_7[3:0] ? io_robRead_8_busy : _GEN_632; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_634 = 4'h9 == _rs1ROBEntry_T_7[3:0] ? io_robRead_9_busy : _GEN_633; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_635 = 4'ha == _rs1ROBEntry_T_7[3:0] ? io_robRead_10_busy : _GEN_634; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_636 = 4'hb == _rs1ROBEntry_T_7[3:0] ? io_robRead_11_busy : _GEN_635; // @[ReservationStation.scala 206:{48,48}]
  wire [1:0] _GEN_614 = 4'h1 == _rs1ROBEntry_T_7[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_615 = 4'h2 == _rs1ROBEntry_T_7[3:0] ? io_robRead_2_state : _GEN_614; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_616 = 4'h3 == _rs1ROBEntry_T_7[3:0] ? io_robRead_3_state : _GEN_615; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_617 = 4'h4 == _rs1ROBEntry_T_7[3:0] ? io_robRead_4_state : _GEN_616; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_618 = 4'h5 == _rs1ROBEntry_T_7[3:0] ? io_robRead_5_state : _GEN_617; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_619 = 4'h6 == _rs1ROBEntry_T_7[3:0] ? io_robRead_6_state : _GEN_618; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_620 = 4'h7 == _rs1ROBEntry_T_7[3:0] ? io_robRead_7_state : _GEN_619; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_621 = 4'h8 == _rs1ROBEntry_T_7[3:0] ? io_robRead_8_state : _GEN_620; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_622 = 4'h9 == _rs1ROBEntry_T_7[3:0] ? io_robRead_9_state : _GEN_621; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_623 = 4'ha == _rs1ROBEntry_T_7[3:0] ? io_robRead_10_state : _GEN_622; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_624 = 4'hb == _rs1ROBEntry_T_7[3:0] ? io_robRead_11_state : _GEN_623; // @[ReservationStation.scala 206:{69,69}]
  wire [4:0] _GEN_638 = 4'h1 == _rs1ROBEntry_T_7[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_639 = 4'h2 == _rs1ROBEntry_T_7[3:0] ? io_robRead_2_rd : _GEN_638; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_640 = 4'h3 == _rs1ROBEntry_T_7[3:0] ? io_robRead_3_rd : _GEN_639; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_641 = 4'h4 == _rs1ROBEntry_T_7[3:0] ? io_robRead_4_rd : _GEN_640; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_642 = 4'h5 == _rs1ROBEntry_T_7[3:0] ? io_robRead_5_rd : _GEN_641; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_643 = 4'h6 == _rs1ROBEntry_T_7[3:0] ? io_robRead_6_rd : _GEN_642; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_644 = 4'h7 == _rs1ROBEntry_T_7[3:0] ? io_robRead_7_rd : _GEN_643; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_645 = 4'h8 == _rs1ROBEntry_T_7[3:0] ? io_robRead_8_rd : _GEN_644; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_646 = 4'h9 == _rs1ROBEntry_T_7[3:0] ? io_robRead_9_rd : _GEN_645; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_647 = 4'ha == _rs1ROBEntry_T_7[3:0] ? io_robRead_10_rd : _GEN_646; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_648 = 4'hb == _rs1ROBEntry_T_7[3:0] ? io_robRead_11_rd : _GEN_647; // @[ReservationStation.scala 206:{132,132}]
  wire  rs1FromROB_2 = (_GEN_636 & _GEN_624 == 2'h2 | _GEN_624 == 2'h3) & _GEN_648 == entries_2_rs1 & entries_2_rs1 != 5'h0
    ; // @[ReservationStation.scala 206:142]
  wire  _T_32 = entries_2_rs1ROBId != 8'h0; // @[ReservationStation.scala 209:43]
  wire  _T_34 = head == 3'h2; // @[ReservationStation.scala 213:27]
  wire [7:0] _rs1ROBEntry_T_4 = entries_1_rs1ROBId - 8'h1; // @[ReservationStation.scala 204:53]
  wire  _GEN_494 = 4'h1 == _rs1ROBEntry_T_4[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_495 = 4'h2 == _rs1ROBEntry_T_4[3:0] ? io_robRead_2_busy : _GEN_494; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_496 = 4'h3 == _rs1ROBEntry_T_4[3:0] ? io_robRead_3_busy : _GEN_495; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_497 = 4'h4 == _rs1ROBEntry_T_4[3:0] ? io_robRead_4_busy : _GEN_496; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_498 = 4'h5 == _rs1ROBEntry_T_4[3:0] ? io_robRead_5_busy : _GEN_497; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_499 = 4'h6 == _rs1ROBEntry_T_4[3:0] ? io_robRead_6_busy : _GEN_498; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_500 = 4'h7 == _rs1ROBEntry_T_4[3:0] ? io_robRead_7_busy : _GEN_499; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_501 = 4'h8 == _rs1ROBEntry_T_4[3:0] ? io_robRead_8_busy : _GEN_500; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_502 = 4'h9 == _rs1ROBEntry_T_4[3:0] ? io_robRead_9_busy : _GEN_501; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_503 = 4'ha == _rs1ROBEntry_T_4[3:0] ? io_robRead_10_busy : _GEN_502; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_504 = 4'hb == _rs1ROBEntry_T_4[3:0] ? io_robRead_11_busy : _GEN_503; // @[ReservationStation.scala 206:{48,48}]
  wire [1:0] _GEN_482 = 4'h1 == _rs1ROBEntry_T_4[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_483 = 4'h2 == _rs1ROBEntry_T_4[3:0] ? io_robRead_2_state : _GEN_482; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_484 = 4'h3 == _rs1ROBEntry_T_4[3:0] ? io_robRead_3_state : _GEN_483; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_485 = 4'h4 == _rs1ROBEntry_T_4[3:0] ? io_robRead_4_state : _GEN_484; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_486 = 4'h5 == _rs1ROBEntry_T_4[3:0] ? io_robRead_5_state : _GEN_485; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_487 = 4'h6 == _rs1ROBEntry_T_4[3:0] ? io_robRead_6_state : _GEN_486; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_488 = 4'h7 == _rs1ROBEntry_T_4[3:0] ? io_robRead_7_state : _GEN_487; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_489 = 4'h8 == _rs1ROBEntry_T_4[3:0] ? io_robRead_8_state : _GEN_488; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_490 = 4'h9 == _rs1ROBEntry_T_4[3:0] ? io_robRead_9_state : _GEN_489; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_491 = 4'ha == _rs1ROBEntry_T_4[3:0] ? io_robRead_10_state : _GEN_490; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_492 = 4'hb == _rs1ROBEntry_T_4[3:0] ? io_robRead_11_state : _GEN_491; // @[ReservationStation.scala 206:{69,69}]
  wire [4:0] _GEN_506 = 4'h1 == _rs1ROBEntry_T_4[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_507 = 4'h2 == _rs1ROBEntry_T_4[3:0] ? io_robRead_2_rd : _GEN_506; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_508 = 4'h3 == _rs1ROBEntry_T_4[3:0] ? io_robRead_3_rd : _GEN_507; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_509 = 4'h4 == _rs1ROBEntry_T_4[3:0] ? io_robRead_4_rd : _GEN_508; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_510 = 4'h5 == _rs1ROBEntry_T_4[3:0] ? io_robRead_5_rd : _GEN_509; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_511 = 4'h6 == _rs1ROBEntry_T_4[3:0] ? io_robRead_6_rd : _GEN_510; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_512 = 4'h7 == _rs1ROBEntry_T_4[3:0] ? io_robRead_7_rd : _GEN_511; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_513 = 4'h8 == _rs1ROBEntry_T_4[3:0] ? io_robRead_8_rd : _GEN_512; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_514 = 4'h9 == _rs1ROBEntry_T_4[3:0] ? io_robRead_9_rd : _GEN_513; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_515 = 4'ha == _rs1ROBEntry_T_4[3:0] ? io_robRead_10_rd : _GEN_514; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_516 = 4'hb == _rs1ROBEntry_T_4[3:0] ? io_robRead_11_rd : _GEN_515; // @[ReservationStation.scala 206:{132,132}]
  wire  rs1FromROB_1 = (_GEN_504 & _GEN_492 == 2'h2 | _GEN_492 == 2'h3) & _GEN_516 == entries_1_rs1 & entries_1_rs1 != 5'h0
    ; // @[ReservationStation.scala 206:142]
  wire  _T_20 = entries_1_rs1ROBId != 8'h0; // @[ReservationStation.scala 209:43]
  wire  _T_22 = head == 3'h1; // @[ReservationStation.scala 213:27]
  wire [7:0] _rs1ROBEntry_T_1 = entries_0_rs1ROBId - 8'h1; // @[ReservationStation.scala 204:53]
  wire  _GEN_362 = 4'h1 == _rs1ROBEntry_T_1[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_363 = 4'h2 == _rs1ROBEntry_T_1[3:0] ? io_robRead_2_busy : _GEN_362; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_364 = 4'h3 == _rs1ROBEntry_T_1[3:0] ? io_robRead_3_busy : _GEN_363; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_365 = 4'h4 == _rs1ROBEntry_T_1[3:0] ? io_robRead_4_busy : _GEN_364; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_366 = 4'h5 == _rs1ROBEntry_T_1[3:0] ? io_robRead_5_busy : _GEN_365; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_367 = 4'h6 == _rs1ROBEntry_T_1[3:0] ? io_robRead_6_busy : _GEN_366; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_368 = 4'h7 == _rs1ROBEntry_T_1[3:0] ? io_robRead_7_busy : _GEN_367; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_369 = 4'h8 == _rs1ROBEntry_T_1[3:0] ? io_robRead_8_busy : _GEN_368; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_370 = 4'h9 == _rs1ROBEntry_T_1[3:0] ? io_robRead_9_busy : _GEN_369; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_371 = 4'ha == _rs1ROBEntry_T_1[3:0] ? io_robRead_10_busy : _GEN_370; // @[ReservationStation.scala 206:{48,48}]
  wire  _GEN_372 = 4'hb == _rs1ROBEntry_T_1[3:0] ? io_robRead_11_busy : _GEN_371; // @[ReservationStation.scala 206:{48,48}]
  wire [1:0] _GEN_350 = 4'h1 == _rs1ROBEntry_T_1[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_351 = 4'h2 == _rs1ROBEntry_T_1[3:0] ? io_robRead_2_state : _GEN_350; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_352 = 4'h3 == _rs1ROBEntry_T_1[3:0] ? io_robRead_3_state : _GEN_351; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_353 = 4'h4 == _rs1ROBEntry_T_1[3:0] ? io_robRead_4_state : _GEN_352; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_354 = 4'h5 == _rs1ROBEntry_T_1[3:0] ? io_robRead_5_state : _GEN_353; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_355 = 4'h6 == _rs1ROBEntry_T_1[3:0] ? io_robRead_6_state : _GEN_354; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_356 = 4'h7 == _rs1ROBEntry_T_1[3:0] ? io_robRead_7_state : _GEN_355; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_357 = 4'h8 == _rs1ROBEntry_T_1[3:0] ? io_robRead_8_state : _GEN_356; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_358 = 4'h9 == _rs1ROBEntry_T_1[3:0] ? io_robRead_9_state : _GEN_357; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_359 = 4'ha == _rs1ROBEntry_T_1[3:0] ? io_robRead_10_state : _GEN_358; // @[ReservationStation.scala 206:{69,69}]
  wire [1:0] _GEN_360 = 4'hb == _rs1ROBEntry_T_1[3:0] ? io_robRead_11_state : _GEN_359; // @[ReservationStation.scala 206:{69,69}]
  wire [4:0] _GEN_374 = 4'h1 == _rs1ROBEntry_T_1[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_375 = 4'h2 == _rs1ROBEntry_T_1[3:0] ? io_robRead_2_rd : _GEN_374; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_376 = 4'h3 == _rs1ROBEntry_T_1[3:0] ? io_robRead_3_rd : _GEN_375; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_377 = 4'h4 == _rs1ROBEntry_T_1[3:0] ? io_robRead_4_rd : _GEN_376; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_378 = 4'h5 == _rs1ROBEntry_T_1[3:0] ? io_robRead_5_rd : _GEN_377; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_379 = 4'h6 == _rs1ROBEntry_T_1[3:0] ? io_robRead_6_rd : _GEN_378; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_380 = 4'h7 == _rs1ROBEntry_T_1[3:0] ? io_robRead_7_rd : _GEN_379; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_381 = 4'h8 == _rs1ROBEntry_T_1[3:0] ? io_robRead_8_rd : _GEN_380; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_382 = 4'h9 == _rs1ROBEntry_T_1[3:0] ? io_robRead_9_rd : _GEN_381; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_383 = 4'ha == _rs1ROBEntry_T_1[3:0] ? io_robRead_10_rd : _GEN_382; // @[ReservationStation.scala 206:{132,132}]
  wire [4:0] _GEN_384 = 4'hb == _rs1ROBEntry_T_1[3:0] ? io_robRead_11_rd : _GEN_383; // @[ReservationStation.scala 206:{132,132}]
  wire  rs1FromROB = (_GEN_372 & _GEN_360 == 2'h2 | _GEN_360 == 2'h3) & _GEN_384 == entries_0_rs1 & entries_0_rs1 != 5'h0
    ; // @[ReservationStation.scala 206:142]
  wire  _T_8 = entries_0_rs1ROBId != 8'h0; // @[ReservationStation.scala 209:43]
  wire  _T_10 = head == 3'h0; // @[ReservationStation.scala 213:27]
  wire  _GEN_437 = rs1FromROB & entries_0_rs1ROBId != 8'h0 & _T_10; // @[ReservationStation.scala 209:52 93:39]
  wire  _GEN_471 = entries_0_busy & _GEN_437; // @[ReservationStation.scala 197:22 93:39]
  wire  _GEN_565 = head == 3'h1 | _GEN_471; // @[ReservationStation.scala 213:36 214:38]
  wire  _GEN_569 = rs1FromROB_1 & entries_1_rs1ROBId != 8'h0 ? _GEN_565 : _GEN_471; // @[ReservationStation.scala 209:52]
  wire  _GEN_603 = entries_1_busy ? _GEN_569 : _GEN_471; // @[ReservationStation.scala 197:22]
  wire  _GEN_697 = head == 3'h2 | _GEN_603; // @[ReservationStation.scala 213:36 214:38]
  wire  _GEN_701 = rs1FromROB_2 & entries_2_rs1ROBId != 8'h0 ? _GEN_697 : _GEN_603; // @[ReservationStation.scala 209:52]
  wire  _GEN_735 = entries_2_busy ? _GEN_701 : _GEN_603; // @[ReservationStation.scala 197:22]
  wire  _GEN_829 = head == 3'h3 | _GEN_735; // @[ReservationStation.scala 213:36 214:38]
  wire  _GEN_833 = rs1FromROB_3 & entries_3_rs1ROBId != 8'h0 ? _GEN_829 : _GEN_735; // @[ReservationStation.scala 209:52]
  wire  _GEN_867 = entries_3_busy ? _GEN_833 : _GEN_735; // @[ReservationStation.scala 197:22]
  wire  _GEN_961 = head == 3'h4 | _GEN_867; // @[ReservationStation.scala 213:36 214:38]
  wire  _GEN_965 = rs1FromROB_4 & entries_4_rs1ROBId != 8'h0 ? _GEN_961 : _GEN_867; // @[ReservationStation.scala 209:52]
  wire  rs1BypassFromROB = entries_4_busy ? _GEN_965 : _GEN_867; // @[ReservationStation.scala 197:22]
  wire [3:0] cdbValidVec_4 = {io_cdb_3_valid,io_cdb_2_valid,io_cdb_1_valid,io_cdb_0_valid}; // @[Cat.scala 33:92]
  wire  _rs1MatchVec_T_19 = io_cdb_3_bits_rd == entries_4_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_18 = io_cdb_2_bits_rd == entries_4_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_17 = io_cdb_1_bits_rd == entries_4_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_16 = io_cdb_0_bits_rd == entries_4_rs1; // @[ReservationStation.scala 229:61]
  wire [3:0] rs1MatchVec_4 = {_rs1MatchVec_T_19,_rs1MatchVec_T_18,_rs1MatchVec_T_17,_rs1MatchVec_T_16}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_4 = cdbValidVec_4 & rs1MatchVec_4; // @[ReservationStation.scala 234:44]
  wire  _rs1IDMatchVec_T_19 = io_cdb_3_bits_id == entries_4_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_18 = io_cdb_2_bits_id == entries_4_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_17 = io_cdb_1_bits_id == entries_4_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_16 = io_cdb_0_bits_id == entries_4_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire [3:0] rs1IDMatchVec_4 = {_rs1IDMatchVec_T_19,_rs1IDMatchVec_T_18,_rs1IDMatchVec_T_17,_rs1IDMatchVec_T_16}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs1_4 = _cdbBypassRs1_T_4 & rs1IDMatchVec_4; // @[ReservationStation.scala 234:58]
  wire  bypassRs1_8 = |cdbBypassRs1_4; // @[ReservationStation.scala 237:42]
  wire  _rs1MatchVec_T_15 = io_cdb_3_bits_rd == entries_3_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_14 = io_cdb_2_bits_rd == entries_3_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_13 = io_cdb_1_bits_rd == entries_3_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_12 = io_cdb_0_bits_rd == entries_3_rs1; // @[ReservationStation.scala 229:61]
  wire [3:0] rs1MatchVec_3 = {_rs1MatchVec_T_15,_rs1MatchVec_T_14,_rs1MatchVec_T_13,_rs1MatchVec_T_12}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_3 = cdbValidVec_4 & rs1MatchVec_3; // @[ReservationStation.scala 234:44]
  wire  _rs1IDMatchVec_T_15 = io_cdb_3_bits_id == entries_3_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_14 = io_cdb_2_bits_id == entries_3_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_13 = io_cdb_1_bits_id == entries_3_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_12 = io_cdb_0_bits_id == entries_3_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire [3:0] rs1IDMatchVec_3 = {_rs1IDMatchVec_T_15,_rs1IDMatchVec_T_14,_rs1IDMatchVec_T_13,_rs1IDMatchVec_T_12}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs1_3 = _cdbBypassRs1_T_3 & rs1IDMatchVec_3; // @[ReservationStation.scala 234:58]
  wire  bypassRs1_6 = |cdbBypassRs1_3; // @[ReservationStation.scala 237:42]
  wire  _rs1MatchVec_T_11 = io_cdb_3_bits_rd == entries_2_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_10 = io_cdb_2_bits_rd == entries_2_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_9 = io_cdb_1_bits_rd == entries_2_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_8 = io_cdb_0_bits_rd == entries_2_rs1; // @[ReservationStation.scala 229:61]
  wire [3:0] rs1MatchVec_2 = {_rs1MatchVec_T_11,_rs1MatchVec_T_10,_rs1MatchVec_T_9,_rs1MatchVec_T_8}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_2 = cdbValidVec_4 & rs1MatchVec_2; // @[ReservationStation.scala 234:44]
  wire  _rs1IDMatchVec_T_11 = io_cdb_3_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_10 = io_cdb_2_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_9 = io_cdb_1_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_8 = io_cdb_0_bits_id == entries_2_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire [3:0] rs1IDMatchVec_2 = {_rs1IDMatchVec_T_11,_rs1IDMatchVec_T_10,_rs1IDMatchVec_T_9,_rs1IDMatchVec_T_8}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs1_2 = _cdbBypassRs1_T_2 & rs1IDMatchVec_2; // @[ReservationStation.scala 234:58]
  wire  bypassRs1_4 = |cdbBypassRs1_2; // @[ReservationStation.scala 237:42]
  wire  _rs1MatchVec_T_7 = io_cdb_3_bits_rd == entries_1_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_6 = io_cdb_2_bits_rd == entries_1_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_5 = io_cdb_1_bits_rd == entries_1_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_4 = io_cdb_0_bits_rd == entries_1_rs1; // @[ReservationStation.scala 229:61]
  wire [3:0] rs1MatchVec_1 = {_rs1MatchVec_T_7,_rs1MatchVec_T_6,_rs1MatchVec_T_5,_rs1MatchVec_T_4}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T_1 = cdbValidVec_4 & rs1MatchVec_1; // @[ReservationStation.scala 234:44]
  wire  _rs1IDMatchVec_T_7 = io_cdb_3_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_6 = io_cdb_2_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_5 = io_cdb_1_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_4 = io_cdb_0_bits_id == entries_1_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire [3:0] rs1IDMatchVec_1 = {_rs1IDMatchVec_T_7,_rs1IDMatchVec_T_6,_rs1IDMatchVec_T_5,_rs1IDMatchVec_T_4}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs1_1 = _cdbBypassRs1_T_1 & rs1IDMatchVec_1; // @[ReservationStation.scala 234:58]
  wire  bypassRs1_2 = |cdbBypassRs1_1; // @[ReservationStation.scala 237:42]
  wire  _rs1MatchVec_T_3 = io_cdb_3_bits_rd == entries_0_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_2 = io_cdb_2_bits_rd == entries_0_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T_1 = io_cdb_1_bits_rd == entries_0_rs1; // @[ReservationStation.scala 229:61]
  wire  _rs1MatchVec_T = io_cdb_0_bits_rd == entries_0_rs1; // @[ReservationStation.scala 229:61]
  wire [3:0] rs1MatchVec = {_rs1MatchVec_T_3,_rs1MatchVec_T_2,_rs1MatchVec_T_1,_rs1MatchVec_T}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs1_T = cdbValidVec_4 & rs1MatchVec; // @[ReservationStation.scala 234:44]
  wire  _rs1IDMatchVec_T_3 = io_cdb_3_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_2 = io_cdb_2_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T_1 = io_cdb_1_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire  _rs1IDMatchVec_T = io_cdb_0_bits_id == entries_0_rs1ROBId; // @[ReservationStation.scala 231:63]
  wire [3:0] rs1IDMatchVec = {_rs1IDMatchVec_T_3,_rs1IDMatchVec_T_2,_rs1IDMatchVec_T_1,_rs1IDMatchVec_T}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs1 = _cdbBypassRs1_T & rs1IDMatchVec; // @[ReservationStation.scala 234:58]
  wire  bypassRs1 = |cdbBypassRs1; // @[ReservationStation.scala 237:42]
  wire  _GEN_461 = bypassRs1 & _T_8 & _T_10; // @[ReservationStation.scala 240:51 98:39]
  wire  _GEN_477 = entries_0_busy & _GEN_461; // @[ReservationStation.scala 197:22 98:39]
  wire  _GEN_589 = _T_22 | _GEN_477; // @[ReservationStation.scala 245:36 246:38]
  wire  _GEN_593 = bypassRs1_2 & _T_20 ? _GEN_589 : _GEN_477; // @[ReservationStation.scala 240:51]
  wire  _GEN_609 = entries_1_busy ? _GEN_593 : _GEN_477; // @[ReservationStation.scala 197:22]
  wire  _GEN_721 = _T_34 | _GEN_609; // @[ReservationStation.scala 245:36 246:38]
  wire  _GEN_725 = bypassRs1_4 & _T_32 ? _GEN_721 : _GEN_609; // @[ReservationStation.scala 240:51]
  wire  _GEN_741 = entries_2_busy ? _GEN_725 : _GEN_609; // @[ReservationStation.scala 197:22]
  wire  _GEN_853 = _T_46 | _GEN_741; // @[ReservationStation.scala 245:36 246:38]
  wire  _GEN_857 = bypassRs1_6 & _T_44 ? _GEN_853 : _GEN_741; // @[ReservationStation.scala 240:51]
  wire  _GEN_873 = entries_3_busy ? _GEN_857 : _GEN_741; // @[ReservationStation.scala 197:22]
  wire  _GEN_985 = _T_58 | _GEN_873; // @[ReservationStation.scala 245:36 246:38]
  wire  _GEN_989 = bypassRs1_8 & _T_56 ? _GEN_985 : _GEN_873; // @[ReservationStation.scala 240:51]
  wire  rs1BypassFromCDB = entries_4_busy ? _GEN_989 : _GEN_873; // @[ReservationStation.scala 197:22]
  wire [7:0] _GEN_6 = 3'h1 == head ? entries_1_rs2ROBId : entries_0_rs2ROBId; // @[ReservationStation.scala 104:{116,116}]
  wire [7:0] _GEN_7 = 3'h2 == head ? entries_2_rs2ROBId : _GEN_6; // @[ReservationStation.scala 104:{116,116}]
  wire [7:0] _GEN_8 = 3'h3 == head ? entries_3_rs2ROBId : _GEN_7; // @[ReservationStation.scala 104:{116,116}]
  wire [7:0] _GEN_9 = 3'h4 == head ? entries_4_rs2ROBId : _GEN_8; // @[ReservationStation.scala 104:{116,116}]
  wire  _oprReady_T_3 = _GEN_9 == 8'h0; // @[ReservationStation.scala 104:116]
  wire [7:0] _rs2ROBEntry_T_13 = entries_4_rs2ROBId - 8'h1; // @[ReservationStation.scala 205:53]
  wire  _GEN_926 = 4'h1 == _rs2ROBEntry_T_13[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_927 = 4'h2 == _rs2ROBEntry_T_13[3:0] ? io_robRead_2_busy : _GEN_926; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_928 = 4'h3 == _rs2ROBEntry_T_13[3:0] ? io_robRead_3_busy : _GEN_927; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_929 = 4'h4 == _rs2ROBEntry_T_13[3:0] ? io_robRead_4_busy : _GEN_928; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_930 = 4'h5 == _rs2ROBEntry_T_13[3:0] ? io_robRead_5_busy : _GEN_929; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_931 = 4'h6 == _rs2ROBEntry_T_13[3:0] ? io_robRead_6_busy : _GEN_930; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_932 = 4'h7 == _rs2ROBEntry_T_13[3:0] ? io_robRead_7_busy : _GEN_931; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_933 = 4'h8 == _rs2ROBEntry_T_13[3:0] ? io_robRead_8_busy : _GEN_932; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_934 = 4'h9 == _rs2ROBEntry_T_13[3:0] ? io_robRead_9_busy : _GEN_933; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_935 = 4'ha == _rs2ROBEntry_T_13[3:0] ? io_robRead_10_busy : _GEN_934; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_936 = 4'hb == _rs2ROBEntry_T_13[3:0] ? io_robRead_11_busy : _GEN_935; // @[ReservationStation.scala 207:{48,48}]
  wire [1:0] _GEN_914 = 4'h1 == _rs2ROBEntry_T_13[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_915 = 4'h2 == _rs2ROBEntry_T_13[3:0] ? io_robRead_2_state : _GEN_914; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_916 = 4'h3 == _rs2ROBEntry_T_13[3:0] ? io_robRead_3_state : _GEN_915; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_917 = 4'h4 == _rs2ROBEntry_T_13[3:0] ? io_robRead_4_state : _GEN_916; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_918 = 4'h5 == _rs2ROBEntry_T_13[3:0] ? io_robRead_5_state : _GEN_917; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_919 = 4'h6 == _rs2ROBEntry_T_13[3:0] ? io_robRead_6_state : _GEN_918; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_920 = 4'h7 == _rs2ROBEntry_T_13[3:0] ? io_robRead_7_state : _GEN_919; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_921 = 4'h8 == _rs2ROBEntry_T_13[3:0] ? io_robRead_8_state : _GEN_920; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_922 = 4'h9 == _rs2ROBEntry_T_13[3:0] ? io_robRead_9_state : _GEN_921; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_923 = 4'ha == _rs2ROBEntry_T_13[3:0] ? io_robRead_10_state : _GEN_922; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_924 = 4'hb == _rs2ROBEntry_T_13[3:0] ? io_robRead_11_state : _GEN_923; // @[ReservationStation.scala 207:{69,69}]
  wire [4:0] _GEN_938 = 4'h1 == _rs2ROBEntry_T_13[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_939 = 4'h2 == _rs2ROBEntry_T_13[3:0] ? io_robRead_2_rd : _GEN_938; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_940 = 4'h3 == _rs2ROBEntry_T_13[3:0] ? io_robRead_3_rd : _GEN_939; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_941 = 4'h4 == _rs2ROBEntry_T_13[3:0] ? io_robRead_4_rd : _GEN_940; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_942 = 4'h5 == _rs2ROBEntry_T_13[3:0] ? io_robRead_5_rd : _GEN_941; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_943 = 4'h6 == _rs2ROBEntry_T_13[3:0] ? io_robRead_6_rd : _GEN_942; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_944 = 4'h7 == _rs2ROBEntry_T_13[3:0] ? io_robRead_7_rd : _GEN_943; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_945 = 4'h8 == _rs2ROBEntry_T_13[3:0] ? io_robRead_8_rd : _GEN_944; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_946 = 4'h9 == _rs2ROBEntry_T_13[3:0] ? io_robRead_9_rd : _GEN_945; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_947 = 4'ha == _rs2ROBEntry_T_13[3:0] ? io_robRead_10_rd : _GEN_946; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_948 = 4'hb == _rs2ROBEntry_T_13[3:0] ? io_robRead_11_rd : _GEN_947; // @[ReservationStation.scala 207:{132,132}]
  wire  rs2FromROB_4 = (_GEN_936 & _GEN_924 == 2'h2 | _GEN_924 == 2'h3) & _GEN_948 == entries_4_rs2 & entries_4_rs2 != 5'h0
    ; // @[ReservationStation.scala 207:142]
  wire  _T_59 = entries_4_rs2ROBId != 8'h0; // @[ReservationStation.scala 218:43]
  wire [7:0] _rs2ROBEntry_T_10 = entries_3_rs2ROBId - 8'h1; // @[ReservationStation.scala 205:53]
  wire  _GEN_794 = 4'h1 == _rs2ROBEntry_T_10[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_795 = 4'h2 == _rs2ROBEntry_T_10[3:0] ? io_robRead_2_busy : _GEN_794; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_796 = 4'h3 == _rs2ROBEntry_T_10[3:0] ? io_robRead_3_busy : _GEN_795; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_797 = 4'h4 == _rs2ROBEntry_T_10[3:0] ? io_robRead_4_busy : _GEN_796; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_798 = 4'h5 == _rs2ROBEntry_T_10[3:0] ? io_robRead_5_busy : _GEN_797; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_799 = 4'h6 == _rs2ROBEntry_T_10[3:0] ? io_robRead_6_busy : _GEN_798; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_800 = 4'h7 == _rs2ROBEntry_T_10[3:0] ? io_robRead_7_busy : _GEN_799; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_801 = 4'h8 == _rs2ROBEntry_T_10[3:0] ? io_robRead_8_busy : _GEN_800; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_802 = 4'h9 == _rs2ROBEntry_T_10[3:0] ? io_robRead_9_busy : _GEN_801; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_803 = 4'ha == _rs2ROBEntry_T_10[3:0] ? io_robRead_10_busy : _GEN_802; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_804 = 4'hb == _rs2ROBEntry_T_10[3:0] ? io_robRead_11_busy : _GEN_803; // @[ReservationStation.scala 207:{48,48}]
  wire [1:0] _GEN_782 = 4'h1 == _rs2ROBEntry_T_10[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_783 = 4'h2 == _rs2ROBEntry_T_10[3:0] ? io_robRead_2_state : _GEN_782; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_784 = 4'h3 == _rs2ROBEntry_T_10[3:0] ? io_robRead_3_state : _GEN_783; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_785 = 4'h4 == _rs2ROBEntry_T_10[3:0] ? io_robRead_4_state : _GEN_784; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_786 = 4'h5 == _rs2ROBEntry_T_10[3:0] ? io_robRead_5_state : _GEN_785; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_787 = 4'h6 == _rs2ROBEntry_T_10[3:0] ? io_robRead_6_state : _GEN_786; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_788 = 4'h7 == _rs2ROBEntry_T_10[3:0] ? io_robRead_7_state : _GEN_787; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_789 = 4'h8 == _rs2ROBEntry_T_10[3:0] ? io_robRead_8_state : _GEN_788; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_790 = 4'h9 == _rs2ROBEntry_T_10[3:0] ? io_robRead_9_state : _GEN_789; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_791 = 4'ha == _rs2ROBEntry_T_10[3:0] ? io_robRead_10_state : _GEN_790; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_792 = 4'hb == _rs2ROBEntry_T_10[3:0] ? io_robRead_11_state : _GEN_791; // @[ReservationStation.scala 207:{69,69}]
  wire [4:0] _GEN_806 = 4'h1 == _rs2ROBEntry_T_10[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_807 = 4'h2 == _rs2ROBEntry_T_10[3:0] ? io_robRead_2_rd : _GEN_806; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_808 = 4'h3 == _rs2ROBEntry_T_10[3:0] ? io_robRead_3_rd : _GEN_807; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_809 = 4'h4 == _rs2ROBEntry_T_10[3:0] ? io_robRead_4_rd : _GEN_808; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_810 = 4'h5 == _rs2ROBEntry_T_10[3:0] ? io_robRead_5_rd : _GEN_809; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_811 = 4'h6 == _rs2ROBEntry_T_10[3:0] ? io_robRead_6_rd : _GEN_810; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_812 = 4'h7 == _rs2ROBEntry_T_10[3:0] ? io_robRead_7_rd : _GEN_811; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_813 = 4'h8 == _rs2ROBEntry_T_10[3:0] ? io_robRead_8_rd : _GEN_812; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_814 = 4'h9 == _rs2ROBEntry_T_10[3:0] ? io_robRead_9_rd : _GEN_813; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_815 = 4'ha == _rs2ROBEntry_T_10[3:0] ? io_robRead_10_rd : _GEN_814; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_816 = 4'hb == _rs2ROBEntry_T_10[3:0] ? io_robRead_11_rd : _GEN_815; // @[ReservationStation.scala 207:{132,132}]
  wire  rs2FromROB_3 = (_GEN_804 & _GEN_792 == 2'h2 | _GEN_792 == 2'h3) & _GEN_816 == entries_3_rs2 & entries_3_rs2 != 5'h0
    ; // @[ReservationStation.scala 207:142]
  wire  _T_47 = entries_3_rs2ROBId != 8'h0; // @[ReservationStation.scala 218:43]
  wire [7:0] _rs2ROBEntry_T_7 = entries_2_rs2ROBId - 8'h1; // @[ReservationStation.scala 205:53]
  wire  _GEN_662 = 4'h1 == _rs2ROBEntry_T_7[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_663 = 4'h2 == _rs2ROBEntry_T_7[3:0] ? io_robRead_2_busy : _GEN_662; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_664 = 4'h3 == _rs2ROBEntry_T_7[3:0] ? io_robRead_3_busy : _GEN_663; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_665 = 4'h4 == _rs2ROBEntry_T_7[3:0] ? io_robRead_4_busy : _GEN_664; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_666 = 4'h5 == _rs2ROBEntry_T_7[3:0] ? io_robRead_5_busy : _GEN_665; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_667 = 4'h6 == _rs2ROBEntry_T_7[3:0] ? io_robRead_6_busy : _GEN_666; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_668 = 4'h7 == _rs2ROBEntry_T_7[3:0] ? io_robRead_7_busy : _GEN_667; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_669 = 4'h8 == _rs2ROBEntry_T_7[3:0] ? io_robRead_8_busy : _GEN_668; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_670 = 4'h9 == _rs2ROBEntry_T_7[3:0] ? io_robRead_9_busy : _GEN_669; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_671 = 4'ha == _rs2ROBEntry_T_7[3:0] ? io_robRead_10_busy : _GEN_670; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_672 = 4'hb == _rs2ROBEntry_T_7[3:0] ? io_robRead_11_busy : _GEN_671; // @[ReservationStation.scala 207:{48,48}]
  wire [1:0] _GEN_650 = 4'h1 == _rs2ROBEntry_T_7[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_651 = 4'h2 == _rs2ROBEntry_T_7[3:0] ? io_robRead_2_state : _GEN_650; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_652 = 4'h3 == _rs2ROBEntry_T_7[3:0] ? io_robRead_3_state : _GEN_651; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_653 = 4'h4 == _rs2ROBEntry_T_7[3:0] ? io_robRead_4_state : _GEN_652; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_654 = 4'h5 == _rs2ROBEntry_T_7[3:0] ? io_robRead_5_state : _GEN_653; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_655 = 4'h6 == _rs2ROBEntry_T_7[3:0] ? io_robRead_6_state : _GEN_654; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_656 = 4'h7 == _rs2ROBEntry_T_7[3:0] ? io_robRead_7_state : _GEN_655; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_657 = 4'h8 == _rs2ROBEntry_T_7[3:0] ? io_robRead_8_state : _GEN_656; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_658 = 4'h9 == _rs2ROBEntry_T_7[3:0] ? io_robRead_9_state : _GEN_657; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_659 = 4'ha == _rs2ROBEntry_T_7[3:0] ? io_robRead_10_state : _GEN_658; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_660 = 4'hb == _rs2ROBEntry_T_7[3:0] ? io_robRead_11_state : _GEN_659; // @[ReservationStation.scala 207:{69,69}]
  wire [4:0] _GEN_674 = 4'h1 == _rs2ROBEntry_T_7[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_675 = 4'h2 == _rs2ROBEntry_T_7[3:0] ? io_robRead_2_rd : _GEN_674; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_676 = 4'h3 == _rs2ROBEntry_T_7[3:0] ? io_robRead_3_rd : _GEN_675; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_677 = 4'h4 == _rs2ROBEntry_T_7[3:0] ? io_robRead_4_rd : _GEN_676; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_678 = 4'h5 == _rs2ROBEntry_T_7[3:0] ? io_robRead_5_rd : _GEN_677; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_679 = 4'h6 == _rs2ROBEntry_T_7[3:0] ? io_robRead_6_rd : _GEN_678; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_680 = 4'h7 == _rs2ROBEntry_T_7[3:0] ? io_robRead_7_rd : _GEN_679; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_681 = 4'h8 == _rs2ROBEntry_T_7[3:0] ? io_robRead_8_rd : _GEN_680; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_682 = 4'h9 == _rs2ROBEntry_T_7[3:0] ? io_robRead_9_rd : _GEN_681; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_683 = 4'ha == _rs2ROBEntry_T_7[3:0] ? io_robRead_10_rd : _GEN_682; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_684 = 4'hb == _rs2ROBEntry_T_7[3:0] ? io_robRead_11_rd : _GEN_683; // @[ReservationStation.scala 207:{132,132}]
  wire  rs2FromROB_2 = (_GEN_672 & _GEN_660 == 2'h2 | _GEN_660 == 2'h3) & _GEN_684 == entries_2_rs2 & entries_2_rs2 != 5'h0
    ; // @[ReservationStation.scala 207:142]
  wire  _T_35 = entries_2_rs2ROBId != 8'h0; // @[ReservationStation.scala 218:43]
  wire [7:0] _rs2ROBEntry_T_4 = entries_1_rs2ROBId - 8'h1; // @[ReservationStation.scala 205:53]
  wire  _GEN_530 = 4'h1 == _rs2ROBEntry_T_4[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_531 = 4'h2 == _rs2ROBEntry_T_4[3:0] ? io_robRead_2_busy : _GEN_530; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_532 = 4'h3 == _rs2ROBEntry_T_4[3:0] ? io_robRead_3_busy : _GEN_531; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_533 = 4'h4 == _rs2ROBEntry_T_4[3:0] ? io_robRead_4_busy : _GEN_532; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_534 = 4'h5 == _rs2ROBEntry_T_4[3:0] ? io_robRead_5_busy : _GEN_533; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_535 = 4'h6 == _rs2ROBEntry_T_4[3:0] ? io_robRead_6_busy : _GEN_534; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_536 = 4'h7 == _rs2ROBEntry_T_4[3:0] ? io_robRead_7_busy : _GEN_535; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_537 = 4'h8 == _rs2ROBEntry_T_4[3:0] ? io_robRead_8_busy : _GEN_536; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_538 = 4'h9 == _rs2ROBEntry_T_4[3:0] ? io_robRead_9_busy : _GEN_537; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_539 = 4'ha == _rs2ROBEntry_T_4[3:0] ? io_robRead_10_busy : _GEN_538; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_540 = 4'hb == _rs2ROBEntry_T_4[3:0] ? io_robRead_11_busy : _GEN_539; // @[ReservationStation.scala 207:{48,48}]
  wire [1:0] _GEN_518 = 4'h1 == _rs2ROBEntry_T_4[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_519 = 4'h2 == _rs2ROBEntry_T_4[3:0] ? io_robRead_2_state : _GEN_518; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_520 = 4'h3 == _rs2ROBEntry_T_4[3:0] ? io_robRead_3_state : _GEN_519; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_521 = 4'h4 == _rs2ROBEntry_T_4[3:0] ? io_robRead_4_state : _GEN_520; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_522 = 4'h5 == _rs2ROBEntry_T_4[3:0] ? io_robRead_5_state : _GEN_521; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_523 = 4'h6 == _rs2ROBEntry_T_4[3:0] ? io_robRead_6_state : _GEN_522; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_524 = 4'h7 == _rs2ROBEntry_T_4[3:0] ? io_robRead_7_state : _GEN_523; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_525 = 4'h8 == _rs2ROBEntry_T_4[3:0] ? io_robRead_8_state : _GEN_524; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_526 = 4'h9 == _rs2ROBEntry_T_4[3:0] ? io_robRead_9_state : _GEN_525; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_527 = 4'ha == _rs2ROBEntry_T_4[3:0] ? io_robRead_10_state : _GEN_526; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_528 = 4'hb == _rs2ROBEntry_T_4[3:0] ? io_robRead_11_state : _GEN_527; // @[ReservationStation.scala 207:{69,69}]
  wire [4:0] _GEN_542 = 4'h1 == _rs2ROBEntry_T_4[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_543 = 4'h2 == _rs2ROBEntry_T_4[3:0] ? io_robRead_2_rd : _GEN_542; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_544 = 4'h3 == _rs2ROBEntry_T_4[3:0] ? io_robRead_3_rd : _GEN_543; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_545 = 4'h4 == _rs2ROBEntry_T_4[3:0] ? io_robRead_4_rd : _GEN_544; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_546 = 4'h5 == _rs2ROBEntry_T_4[3:0] ? io_robRead_5_rd : _GEN_545; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_547 = 4'h6 == _rs2ROBEntry_T_4[3:0] ? io_robRead_6_rd : _GEN_546; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_548 = 4'h7 == _rs2ROBEntry_T_4[3:0] ? io_robRead_7_rd : _GEN_547; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_549 = 4'h8 == _rs2ROBEntry_T_4[3:0] ? io_robRead_8_rd : _GEN_548; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_550 = 4'h9 == _rs2ROBEntry_T_4[3:0] ? io_robRead_9_rd : _GEN_549; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_551 = 4'ha == _rs2ROBEntry_T_4[3:0] ? io_robRead_10_rd : _GEN_550; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_552 = 4'hb == _rs2ROBEntry_T_4[3:0] ? io_robRead_11_rd : _GEN_551; // @[ReservationStation.scala 207:{132,132}]
  wire  rs2FromROB_1 = (_GEN_540 & _GEN_528 == 2'h2 | _GEN_528 == 2'h3) & _GEN_552 == entries_1_rs2 & entries_1_rs2 != 5'h0
    ; // @[ReservationStation.scala 207:142]
  wire  _T_23 = entries_1_rs2ROBId != 8'h0; // @[ReservationStation.scala 218:43]
  wire [7:0] _rs2ROBEntry_T_1 = entries_0_rs2ROBId - 8'h1; // @[ReservationStation.scala 205:53]
  wire  _GEN_398 = 4'h1 == _rs2ROBEntry_T_1[3:0] ? io_robRead_1_busy : io_robRead_0_busy; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_399 = 4'h2 == _rs2ROBEntry_T_1[3:0] ? io_robRead_2_busy : _GEN_398; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_400 = 4'h3 == _rs2ROBEntry_T_1[3:0] ? io_robRead_3_busy : _GEN_399; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_401 = 4'h4 == _rs2ROBEntry_T_1[3:0] ? io_robRead_4_busy : _GEN_400; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_402 = 4'h5 == _rs2ROBEntry_T_1[3:0] ? io_robRead_5_busy : _GEN_401; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_403 = 4'h6 == _rs2ROBEntry_T_1[3:0] ? io_robRead_6_busy : _GEN_402; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_404 = 4'h7 == _rs2ROBEntry_T_1[3:0] ? io_robRead_7_busy : _GEN_403; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_405 = 4'h8 == _rs2ROBEntry_T_1[3:0] ? io_robRead_8_busy : _GEN_404; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_406 = 4'h9 == _rs2ROBEntry_T_1[3:0] ? io_robRead_9_busy : _GEN_405; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_407 = 4'ha == _rs2ROBEntry_T_1[3:0] ? io_robRead_10_busy : _GEN_406; // @[ReservationStation.scala 207:{48,48}]
  wire  _GEN_408 = 4'hb == _rs2ROBEntry_T_1[3:0] ? io_robRead_11_busy : _GEN_407; // @[ReservationStation.scala 207:{48,48}]
  wire [1:0] _GEN_386 = 4'h1 == _rs2ROBEntry_T_1[3:0] ? io_robRead_1_state : io_robRead_0_state; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_387 = 4'h2 == _rs2ROBEntry_T_1[3:0] ? io_robRead_2_state : _GEN_386; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_388 = 4'h3 == _rs2ROBEntry_T_1[3:0] ? io_robRead_3_state : _GEN_387; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_389 = 4'h4 == _rs2ROBEntry_T_1[3:0] ? io_robRead_4_state : _GEN_388; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_390 = 4'h5 == _rs2ROBEntry_T_1[3:0] ? io_robRead_5_state : _GEN_389; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_391 = 4'h6 == _rs2ROBEntry_T_1[3:0] ? io_robRead_6_state : _GEN_390; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_392 = 4'h7 == _rs2ROBEntry_T_1[3:0] ? io_robRead_7_state : _GEN_391; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_393 = 4'h8 == _rs2ROBEntry_T_1[3:0] ? io_robRead_8_state : _GEN_392; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_394 = 4'h9 == _rs2ROBEntry_T_1[3:0] ? io_robRead_9_state : _GEN_393; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_395 = 4'ha == _rs2ROBEntry_T_1[3:0] ? io_robRead_10_state : _GEN_394; // @[ReservationStation.scala 207:{69,69}]
  wire [1:0] _GEN_396 = 4'hb == _rs2ROBEntry_T_1[3:0] ? io_robRead_11_state : _GEN_395; // @[ReservationStation.scala 207:{69,69}]
  wire [4:0] _GEN_410 = 4'h1 == _rs2ROBEntry_T_1[3:0] ? io_robRead_1_rd : io_robRead_0_rd; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_411 = 4'h2 == _rs2ROBEntry_T_1[3:0] ? io_robRead_2_rd : _GEN_410; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_412 = 4'h3 == _rs2ROBEntry_T_1[3:0] ? io_robRead_3_rd : _GEN_411; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_413 = 4'h4 == _rs2ROBEntry_T_1[3:0] ? io_robRead_4_rd : _GEN_412; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_414 = 4'h5 == _rs2ROBEntry_T_1[3:0] ? io_robRead_5_rd : _GEN_413; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_415 = 4'h6 == _rs2ROBEntry_T_1[3:0] ? io_robRead_6_rd : _GEN_414; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_416 = 4'h7 == _rs2ROBEntry_T_1[3:0] ? io_robRead_7_rd : _GEN_415; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_417 = 4'h8 == _rs2ROBEntry_T_1[3:0] ? io_robRead_8_rd : _GEN_416; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_418 = 4'h9 == _rs2ROBEntry_T_1[3:0] ? io_robRead_9_rd : _GEN_417; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_419 = 4'ha == _rs2ROBEntry_T_1[3:0] ? io_robRead_10_rd : _GEN_418; // @[ReservationStation.scala 207:{132,132}]
  wire [4:0] _GEN_420 = 4'hb == _rs2ROBEntry_T_1[3:0] ? io_robRead_11_rd : _GEN_419; // @[ReservationStation.scala 207:{132,132}]
  wire  rs2FromROB = (_GEN_408 & _GEN_396 == 2'h2 | _GEN_396 == 2'h3) & _GEN_420 == entries_0_rs2 & entries_0_rs2 != 5'h0
    ; // @[ReservationStation.scala 207:142]
  wire  _T_11 = entries_0_rs2ROBId != 8'h0; // @[ReservationStation.scala 218:43]
  wire  _GEN_455 = rs2FromROB & entries_0_rs2ROBId != 8'h0 & _T_10; // @[ReservationStation.scala 218:52 94:39]
  wire  _GEN_475 = entries_0_busy & _GEN_455; // @[ReservationStation.scala 197:22 94:39]
  wire  _GEN_583 = _T_22 | _GEN_475; // @[ReservationStation.scala 222:36 223:38]
  wire  _GEN_587 = rs2FromROB_1 & entries_1_rs2ROBId != 8'h0 ? _GEN_583 : _GEN_475; // @[ReservationStation.scala 218:52]
  wire  _GEN_607 = entries_1_busy ? _GEN_587 : _GEN_475; // @[ReservationStation.scala 197:22]
  wire  _GEN_715 = _T_34 | _GEN_607; // @[ReservationStation.scala 222:36 223:38]
  wire  _GEN_719 = rs2FromROB_2 & entries_2_rs2ROBId != 8'h0 ? _GEN_715 : _GEN_607; // @[ReservationStation.scala 218:52]
  wire  _GEN_739 = entries_2_busy ? _GEN_719 : _GEN_607; // @[ReservationStation.scala 197:22]
  wire  _GEN_847 = _T_46 | _GEN_739; // @[ReservationStation.scala 222:36 223:38]
  wire  _GEN_851 = rs2FromROB_3 & entries_3_rs2ROBId != 8'h0 ? _GEN_847 : _GEN_739; // @[ReservationStation.scala 218:52]
  wire  _GEN_871 = entries_3_busy ? _GEN_851 : _GEN_739; // @[ReservationStation.scala 197:22]
  wire  _GEN_979 = _T_58 | _GEN_871; // @[ReservationStation.scala 222:36 223:38]
  wire  _GEN_983 = rs2FromROB_4 & entries_4_rs2ROBId != 8'h0 ? _GEN_979 : _GEN_871; // @[ReservationStation.scala 218:52]
  wire  rs2BypassFromROB = entries_4_busy ? _GEN_983 : _GEN_871; // @[ReservationStation.scala 197:22]
  wire  _rs2MatchVec_T_19 = io_cdb_3_bits_rd == entries_4_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_18 = io_cdb_2_bits_rd == entries_4_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_17 = io_cdb_1_bits_rd == entries_4_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_16 = io_cdb_0_bits_rd == entries_4_rs2; // @[ReservationStation.scala 230:61]
  wire [3:0] rs2MatchVec_4 = {_rs2MatchVec_T_19,_rs2MatchVec_T_18,_rs2MatchVec_T_17,_rs2MatchVec_T_16}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs2_T_4 = cdbValidVec_4 & rs2MatchVec_4; // @[ReservationStation.scala 235:44]
  wire  _rs2IDMatchVec_T_19 = io_cdb_3_bits_id == entries_4_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_18 = io_cdb_2_bits_id == entries_4_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_17 = io_cdb_1_bits_id == entries_4_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_16 = io_cdb_0_bits_id == entries_4_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire [3:0] rs2IDMatchVec_4 = {_rs2IDMatchVec_T_19,_rs2IDMatchVec_T_18,_rs2IDMatchVec_T_17,_rs2IDMatchVec_T_16}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs2_4 = _cdbBypassRs2_T_4 & rs2IDMatchVec_4; // @[ReservationStation.scala 235:58]
  wire  bypassRs2_8 = |cdbBypassRs2_4; // @[ReservationStation.scala 238:42]
  wire  _rs2MatchVec_T_15 = io_cdb_3_bits_rd == entries_3_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_14 = io_cdb_2_bits_rd == entries_3_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_13 = io_cdb_1_bits_rd == entries_3_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_12 = io_cdb_0_bits_rd == entries_3_rs2; // @[ReservationStation.scala 230:61]
  wire [3:0] rs2MatchVec_3 = {_rs2MatchVec_T_15,_rs2MatchVec_T_14,_rs2MatchVec_T_13,_rs2MatchVec_T_12}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs2_T_3 = cdbValidVec_4 & rs2MatchVec_3; // @[ReservationStation.scala 235:44]
  wire  _rs2IDMatchVec_T_15 = io_cdb_3_bits_id == entries_3_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_14 = io_cdb_2_bits_id == entries_3_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_13 = io_cdb_1_bits_id == entries_3_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_12 = io_cdb_0_bits_id == entries_3_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire [3:0] rs2IDMatchVec_3 = {_rs2IDMatchVec_T_15,_rs2IDMatchVec_T_14,_rs2IDMatchVec_T_13,_rs2IDMatchVec_T_12}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs2_3 = _cdbBypassRs2_T_3 & rs2IDMatchVec_3; // @[ReservationStation.scala 235:58]
  wire  bypassRs2_6 = |cdbBypassRs2_3; // @[ReservationStation.scala 238:42]
  wire  _rs2MatchVec_T_11 = io_cdb_3_bits_rd == entries_2_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_10 = io_cdb_2_bits_rd == entries_2_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_9 = io_cdb_1_bits_rd == entries_2_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_8 = io_cdb_0_bits_rd == entries_2_rs2; // @[ReservationStation.scala 230:61]
  wire [3:0] rs2MatchVec_2 = {_rs2MatchVec_T_11,_rs2MatchVec_T_10,_rs2MatchVec_T_9,_rs2MatchVec_T_8}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs2_T_2 = cdbValidVec_4 & rs2MatchVec_2; // @[ReservationStation.scala 235:44]
  wire  _rs2IDMatchVec_T_11 = io_cdb_3_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_10 = io_cdb_2_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_9 = io_cdb_1_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_8 = io_cdb_0_bits_id == entries_2_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire [3:0] rs2IDMatchVec_2 = {_rs2IDMatchVec_T_11,_rs2IDMatchVec_T_10,_rs2IDMatchVec_T_9,_rs2IDMatchVec_T_8}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs2_2 = _cdbBypassRs2_T_2 & rs2IDMatchVec_2; // @[ReservationStation.scala 235:58]
  wire  bypassRs2_4 = |cdbBypassRs2_2; // @[ReservationStation.scala 238:42]
  wire  _rs2MatchVec_T_7 = io_cdb_3_bits_rd == entries_1_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_6 = io_cdb_2_bits_rd == entries_1_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_5 = io_cdb_1_bits_rd == entries_1_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_4 = io_cdb_0_bits_rd == entries_1_rs2; // @[ReservationStation.scala 230:61]
  wire [3:0] rs2MatchVec_1 = {_rs2MatchVec_T_7,_rs2MatchVec_T_6,_rs2MatchVec_T_5,_rs2MatchVec_T_4}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs2_T_1 = cdbValidVec_4 & rs2MatchVec_1; // @[ReservationStation.scala 235:44]
  wire  _rs2IDMatchVec_T_7 = io_cdb_3_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_6 = io_cdb_2_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_5 = io_cdb_1_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_4 = io_cdb_0_bits_id == entries_1_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire [3:0] rs2IDMatchVec_1 = {_rs2IDMatchVec_T_7,_rs2IDMatchVec_T_6,_rs2IDMatchVec_T_5,_rs2IDMatchVec_T_4}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs2_1 = _cdbBypassRs2_T_1 & rs2IDMatchVec_1; // @[ReservationStation.scala 235:58]
  wire  bypassRs2_2 = |cdbBypassRs2_1; // @[ReservationStation.scala 238:42]
  wire  _rs2MatchVec_T_3 = io_cdb_3_bits_rd == entries_0_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_2 = io_cdb_2_bits_rd == entries_0_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T_1 = io_cdb_1_bits_rd == entries_0_rs2; // @[ReservationStation.scala 230:61]
  wire  _rs2MatchVec_T = io_cdb_0_bits_rd == entries_0_rs2; // @[ReservationStation.scala 230:61]
  wire [3:0] rs2MatchVec = {_rs2MatchVec_T_3,_rs2MatchVec_T_2,_rs2MatchVec_T_1,_rs2MatchVec_T}; // @[Cat.scala 33:92]
  wire [3:0] _cdbBypassRs2_T = cdbValidVec_4 & rs2MatchVec; // @[ReservationStation.scala 235:44]
  wire  _rs2IDMatchVec_T_3 = io_cdb_3_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_2 = io_cdb_2_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T_1 = io_cdb_1_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire  _rs2IDMatchVec_T = io_cdb_0_bits_id == entries_0_rs2ROBId; // @[ReservationStation.scala 232:63]
  wire [3:0] rs2IDMatchVec = {_rs2IDMatchVec_T_3,_rs2IDMatchVec_T_2,_rs2IDMatchVec_T_1,_rs2IDMatchVec_T}; // @[Cat.scala 33:92]
  wire [3:0] cdbBypassRs2 = _cdbBypassRs2_T & rs2IDMatchVec; // @[ReservationStation.scala 235:58]
  wire  bypassRs2 = |cdbBypassRs2; // @[ReservationStation.scala 238:42]
  wire  _GEN_467 = bypassRs2 & _T_11 & _T_10; // @[ReservationStation.scala 250:51 99:39]
  wire  _GEN_479 = entries_0_busy & _GEN_467; // @[ReservationStation.scala 197:22 99:39]
  wire  _GEN_595 = _T_22 | _GEN_479; // @[ReservationStation.scala 255:36 256:38]
  wire  _GEN_599 = bypassRs2_2 & _T_23 ? _GEN_595 : _GEN_479; // @[ReservationStation.scala 250:51]
  wire  _GEN_611 = entries_1_busy ? _GEN_599 : _GEN_479; // @[ReservationStation.scala 197:22]
  wire  _GEN_727 = _T_34 | _GEN_611; // @[ReservationStation.scala 255:36 256:38]
  wire  _GEN_731 = bypassRs2_4 & _T_35 ? _GEN_727 : _GEN_611; // @[ReservationStation.scala 250:51]
  wire  _GEN_743 = entries_2_busy ? _GEN_731 : _GEN_611; // @[ReservationStation.scala 197:22]
  wire  _GEN_859 = _T_46 | _GEN_743; // @[ReservationStation.scala 255:36 256:38]
  wire  _GEN_863 = bypassRs2_6 & _T_47 ? _GEN_859 : _GEN_743; // @[ReservationStation.scala 250:51]
  wire  _GEN_875 = entries_3_busy ? _GEN_863 : _GEN_743; // @[ReservationStation.scala 197:22]
  wire  _GEN_991 = _T_58 | _GEN_875; // @[ReservationStation.scala 255:36 256:38]
  wire  _GEN_995 = bypassRs2_8 & _T_59 ? _GEN_991 : _GEN_875; // @[ReservationStation.scala 250:51]
  wire  rs2BypassFromCDB = entries_4_busy ? _GEN_995 : _GEN_875; // @[ReservationStation.scala 197:22]
  wire  oprReady = (_GEN_4 == 8'h0 | rs1BypassFromROB | rs1BypassFromCDB) & (_GEN_9 == 8'h0 | rs2BypassFromROB |
    rs2BypassFromCDB); // @[ReservationStation.scala 104:91]
  wire  _GEN_11 = 3'h1 == tail ? entries_1_busy : entries_0_busy; // @[ReservationStation.scala 105:{30,30}]
  wire  _GEN_12 = 3'h2 == tail ? entries_2_busy : _GEN_11; // @[ReservationStation.scala 105:{30,30}]
  wire  _GEN_13 = 3'h3 == tail ? entries_3_busy : _GEN_12; // @[ReservationStation.scala 105:{30,30}]
  wire  _GEN_14 = 3'h4 == tail ? entries_4_busy : _GEN_13; // @[ReservationStation.scala 105:{30,30}]
  wire  _GEN_16 = 3'h1 == head ? entries_1_busy : entries_0_busy; // @[ReservationStation.scala 106:{30,30}]
  wire  _GEN_17 = 3'h2 == head ? entries_2_busy : _GEN_16; // @[ReservationStation.scala 106:{30,30}]
  wire  _GEN_18 = 3'h3 == head ? entries_3_busy : _GEN_17; // @[ReservationStation.scala 106:{30,30}]
  wire  _GEN_19 = 3'h4 == head ? entries_4_busy : _GEN_18; // @[ReservationStation.scala 106:{30,30}]
  wire [7:0] _GEN_21 = 3'h1 == head ? entries_1_op : entries_0_op; // @[ReservationStation.scala 107:{20,20}]
  wire [7:0] _GEN_22 = 3'h2 == head ? entries_2_op : _GEN_21; // @[ReservationStation.scala 107:{20,20}]
  wire [7:0] _GEN_23 = 3'h3 == head ? entries_3_op : _GEN_22; // @[ReservationStation.scala 107:{20,20}]
  wire [7:0] _GEN_26 = 3'h1 == head ? entries_1_ROBId : entries_0_ROBId; // @[ReservationStation.scala 108:{23,23}]
  wire [7:0] _GEN_27 = 3'h2 == head ? entries_2_ROBId : _GEN_26; // @[ReservationStation.scala 108:{23,23}]
  wire [7:0] _GEN_28 = 3'h3 == head ? entries_3_ROBId : _GEN_27; // @[ReservationStation.scala 108:{23,23}]
  wire [7:0] _GEN_29 = 3'h4 == head ? entries_4_ROBId : _GEN_28; // @[ReservationStation.scala 108:{23,23}]
  wire [3:0] _GEN_31 = 3'h1 == head ? entries_1_opr1 : entries_0_opr1; // @[ReservationStation.scala 109:{22,22}]
  wire [3:0] _GEN_32 = 3'h2 == head ? entries_2_opr1 : _GEN_31; // @[ReservationStation.scala 109:{22,22}]
  wire [3:0] _GEN_33 = 3'h3 == head ? entries_3_opr1 : _GEN_32; // @[ReservationStation.scala 109:{22,22}]
  wire [3:0] _GEN_36 = 3'h1 == head ? entries_1_opr2 : entries_0_opr2; // @[ReservationStation.scala 110:{22,22}]
  wire [3:0] _GEN_37 = 3'h2 == head ? entries_2_opr2 : _GEN_36; // @[ReservationStation.scala 110:{22,22}]
  wire [3:0] _GEN_38 = 3'h3 == head ? entries_3_opr2 : _GEN_37; // @[ReservationStation.scala 110:{22,22}]
  wire [31:0] _GEN_41 = 3'h1 == head ? entries_1_rs1Val : entries_0_rs1Val; // @[ReservationStation.scala 117:{40,40}]
  wire [31:0] _GEN_42 = 3'h2 == head ? entries_2_rs1Val : _GEN_41; // @[ReservationStation.scala 117:{40,40}]
  wire [31:0] _GEN_43 = 3'h3 == head ? entries_3_rs1Val : _GEN_42; // @[ReservationStation.scala 117:{40,40}]
  wire [31:0] _GEN_44 = 3'h4 == head ? entries_4_rs1Val : _GEN_43; // @[ReservationStation.scala 117:{40,40}]
  wire [31:0] _bypassRs1_T_48 = cdbBypassRs1_4[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_49 = cdbBypassRs1_4[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_52 = _bypassRs1_T_48 | _bypassRs1_T_49; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_50 = cdbBypassRs1_4[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_53 = _bypassRs1_T_52 | _bypassRs1_T_50; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_51 = cdbBypassRs1_4[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs1_9 = _bypassRs1_T_53 | _bypassRs1_T_51; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_37 = cdbBypassRs1_3[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_38 = cdbBypassRs1_3[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_41 = _bypassRs1_T_37 | _bypassRs1_T_38; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_39 = cdbBypassRs1_3[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_42 = _bypassRs1_T_41 | _bypassRs1_T_39; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_40 = cdbBypassRs1_3[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs1_7 = _bypassRs1_T_42 | _bypassRs1_T_40; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_26 = cdbBypassRs1_2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_27 = cdbBypassRs1_2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_30 = _bypassRs1_T_26 | _bypassRs1_T_27; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_28 = cdbBypassRs1_2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_31 = _bypassRs1_T_30 | _bypassRs1_T_28; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_29 = cdbBypassRs1_2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs1_5 = _bypassRs1_T_31 | _bypassRs1_T_29; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_15 = cdbBypassRs1_1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_16 = cdbBypassRs1_1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_19 = _bypassRs1_T_15 | _bypassRs1_T_16; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_17 = cdbBypassRs1_1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_20 = _bypassRs1_T_19 | _bypassRs1_T_17; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_18 = cdbBypassRs1_1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs1_3 = _bypassRs1_T_20 | _bypassRs1_T_18; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_4 = cdbBypassRs1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_5 = cdbBypassRs1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_8 = _bypassRs1_T_4 | _bypassRs1_T_5; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_6 = cdbBypassRs1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_9 = _bypassRs1_T_8 | _bypassRs1_T_6; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs1_T_7 = cdbBypassRs1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs1_1 = _bypassRs1_T_9 | _bypassRs1_T_7; // @[Mux.scala 27:73]
  wire [31:0] _GEN_458 = _T_10 ? bypassRs1_1 : 32'h0; // @[ReservationStation.scala 245:36 247:41 100:42]
  wire [31:0] _GEN_462 = bypassRs1 & _T_8 ? _GEN_458 : 32'h0; // @[ReservationStation.scala 100:42 240:51]
  wire [31:0] _GEN_478 = entries_0_busy ? _GEN_462 : 32'h0; // @[ReservationStation.scala 197:22 100:42]
  wire [31:0] _GEN_590 = _T_22 ? bypassRs1_3 : _GEN_478; // @[ReservationStation.scala 245:36 247:41]
  wire [31:0] _GEN_594 = bypassRs1_2 & _T_20 ? _GEN_590 : _GEN_478; // @[ReservationStation.scala 240:51]
  wire [31:0] _GEN_610 = entries_1_busy ? _GEN_594 : _GEN_478; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_722 = _T_34 ? bypassRs1_5 : _GEN_610; // @[ReservationStation.scala 245:36 247:41]
  wire [31:0] _GEN_726 = bypassRs1_4 & _T_32 ? _GEN_722 : _GEN_610; // @[ReservationStation.scala 240:51]
  wire [31:0] _GEN_742 = entries_2_busy ? _GEN_726 : _GEN_610; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_854 = _T_46 ? bypassRs1_7 : _GEN_742; // @[ReservationStation.scala 245:36 247:41]
  wire [31:0] _GEN_858 = bypassRs1_6 & _T_44 ? _GEN_854 : _GEN_742; // @[ReservationStation.scala 240:51]
  wire [31:0] _GEN_874 = entries_3_busy ? _GEN_858 : _GEN_742; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_986 = _T_58 ? bypassRs1_9 : _GEN_874; // @[ReservationStation.scala 245:36 247:41]
  wire [31:0] _GEN_990 = bypassRs1_8 & _T_56 ? _GEN_986 : _GEN_874; // @[ReservationStation.scala 240:51]
  wire [31:0] rs1BypassFromCDBVal = entries_4_busy ? _GEN_990 : _GEN_874; // @[ReservationStation.scala 197:22]
  wire [31:0] _io_deq_bits_rs1Val_T_1 = rs1BypassFromCDB ? rs1BypassFromCDBVal : _GEN_44; // @[ReservationStation.scala 117:40]
  wire [31:0] _GEN_950 = 4'h1 == _rs1ROBEntry_T_13[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_951 = 4'h2 == _rs1ROBEntry_T_13[3:0] ? io_robRead_2_data : _GEN_950; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_952 = 4'h3 == _rs1ROBEntry_T_13[3:0] ? io_robRead_3_data : _GEN_951; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_953 = 4'h4 == _rs1ROBEntry_T_13[3:0] ? io_robRead_4_data : _GEN_952; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_954 = 4'h5 == _rs1ROBEntry_T_13[3:0] ? io_robRead_5_data : _GEN_953; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_955 = 4'h6 == _rs1ROBEntry_T_13[3:0] ? io_robRead_6_data : _GEN_954; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_956 = 4'h7 == _rs1ROBEntry_T_13[3:0] ? io_robRead_7_data : _GEN_955; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_957 = 4'h8 == _rs1ROBEntry_T_13[3:0] ? io_robRead_8_data : _GEN_956; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_958 = 4'h9 == _rs1ROBEntry_T_13[3:0] ? io_robRead_9_data : _GEN_957; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_959 = 4'ha == _rs1ROBEntry_T_13[3:0] ? io_robRead_10_data : _GEN_958; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_960 = 4'hb == _rs1ROBEntry_T_13[3:0] ? io_robRead_11_data : _GEN_959; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_818 = 4'h1 == _rs1ROBEntry_T_10[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_819 = 4'h2 == _rs1ROBEntry_T_10[3:0] ? io_robRead_2_data : _GEN_818; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_820 = 4'h3 == _rs1ROBEntry_T_10[3:0] ? io_robRead_3_data : _GEN_819; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_821 = 4'h4 == _rs1ROBEntry_T_10[3:0] ? io_robRead_4_data : _GEN_820; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_822 = 4'h5 == _rs1ROBEntry_T_10[3:0] ? io_robRead_5_data : _GEN_821; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_823 = 4'h6 == _rs1ROBEntry_T_10[3:0] ? io_robRead_6_data : _GEN_822; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_824 = 4'h7 == _rs1ROBEntry_T_10[3:0] ? io_robRead_7_data : _GEN_823; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_825 = 4'h8 == _rs1ROBEntry_T_10[3:0] ? io_robRead_8_data : _GEN_824; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_826 = 4'h9 == _rs1ROBEntry_T_10[3:0] ? io_robRead_9_data : _GEN_825; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_827 = 4'ha == _rs1ROBEntry_T_10[3:0] ? io_robRead_10_data : _GEN_826; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_828 = 4'hb == _rs1ROBEntry_T_10[3:0] ? io_robRead_11_data : _GEN_827; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_686 = 4'h1 == _rs1ROBEntry_T_7[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_687 = 4'h2 == _rs1ROBEntry_T_7[3:0] ? io_robRead_2_data : _GEN_686; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_688 = 4'h3 == _rs1ROBEntry_T_7[3:0] ? io_robRead_3_data : _GEN_687; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_689 = 4'h4 == _rs1ROBEntry_T_7[3:0] ? io_robRead_4_data : _GEN_688; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_690 = 4'h5 == _rs1ROBEntry_T_7[3:0] ? io_robRead_5_data : _GEN_689; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_691 = 4'h6 == _rs1ROBEntry_T_7[3:0] ? io_robRead_6_data : _GEN_690; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_692 = 4'h7 == _rs1ROBEntry_T_7[3:0] ? io_robRead_7_data : _GEN_691; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_693 = 4'h8 == _rs1ROBEntry_T_7[3:0] ? io_robRead_8_data : _GEN_692; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_694 = 4'h9 == _rs1ROBEntry_T_7[3:0] ? io_robRead_9_data : _GEN_693; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_695 = 4'ha == _rs1ROBEntry_T_7[3:0] ? io_robRead_10_data : _GEN_694; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_696 = 4'hb == _rs1ROBEntry_T_7[3:0] ? io_robRead_11_data : _GEN_695; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_554 = 4'h1 == _rs1ROBEntry_T_4[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_555 = 4'h2 == _rs1ROBEntry_T_4[3:0] ? io_robRead_2_data : _GEN_554; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_556 = 4'h3 == _rs1ROBEntry_T_4[3:0] ? io_robRead_3_data : _GEN_555; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_557 = 4'h4 == _rs1ROBEntry_T_4[3:0] ? io_robRead_4_data : _GEN_556; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_558 = 4'h5 == _rs1ROBEntry_T_4[3:0] ? io_robRead_5_data : _GEN_557; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_559 = 4'h6 == _rs1ROBEntry_T_4[3:0] ? io_robRead_6_data : _GEN_558; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_560 = 4'h7 == _rs1ROBEntry_T_4[3:0] ? io_robRead_7_data : _GEN_559; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_561 = 4'h8 == _rs1ROBEntry_T_4[3:0] ? io_robRead_8_data : _GEN_560; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_562 = 4'h9 == _rs1ROBEntry_T_4[3:0] ? io_robRead_9_data : _GEN_561; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_563 = 4'ha == _rs1ROBEntry_T_4[3:0] ? io_robRead_10_data : _GEN_562; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_564 = 4'hb == _rs1ROBEntry_T_4[3:0] ? io_robRead_11_data : _GEN_563; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_422 = 4'h1 == _rs1ROBEntry_T_1[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_423 = 4'h2 == _rs1ROBEntry_T_1[3:0] ? io_robRead_2_data : _GEN_422; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_424 = 4'h3 == _rs1ROBEntry_T_1[3:0] ? io_robRead_3_data : _GEN_423; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_425 = 4'h4 == _rs1ROBEntry_T_1[3:0] ? io_robRead_4_data : _GEN_424; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_426 = 4'h5 == _rs1ROBEntry_T_1[3:0] ? io_robRead_5_data : _GEN_425; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_427 = 4'h6 == _rs1ROBEntry_T_1[3:0] ? io_robRead_6_data : _GEN_426; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_428 = 4'h7 == _rs1ROBEntry_T_1[3:0] ? io_robRead_7_data : _GEN_427; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_429 = 4'h8 == _rs1ROBEntry_T_1[3:0] ? io_robRead_8_data : _GEN_428; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_430 = 4'h9 == _rs1ROBEntry_T_1[3:0] ? io_robRead_9_data : _GEN_429; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_431 = 4'ha == _rs1ROBEntry_T_1[3:0] ? io_robRead_10_data : _GEN_430; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_432 = 4'hb == _rs1ROBEntry_T_1[3:0] ? io_robRead_11_data : _GEN_431; // @[ReservationStation.scala 210:{26,26}]
  wire [31:0] _GEN_434 = head == 3'h0 ? _GEN_432 : 32'h0; // @[ReservationStation.scala 213:36 215:41 95:42]
  wire [31:0] _GEN_438 = rs1FromROB & entries_0_rs1ROBId != 8'h0 ? _GEN_434 : 32'h0; // @[ReservationStation.scala 209:52 95:42]
  wire [31:0] _GEN_472 = entries_0_busy ? _GEN_438 : 32'h0; // @[ReservationStation.scala 197:22 95:42]
  wire [31:0] _GEN_566 = head == 3'h1 ? _GEN_564 : _GEN_472; // @[ReservationStation.scala 213:36 215:41]
  wire [31:0] _GEN_570 = rs1FromROB_1 & entries_1_rs1ROBId != 8'h0 ? _GEN_566 : _GEN_472; // @[ReservationStation.scala 209:52]
  wire [31:0] _GEN_604 = entries_1_busy ? _GEN_570 : _GEN_472; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_698 = head == 3'h2 ? _GEN_696 : _GEN_604; // @[ReservationStation.scala 213:36 215:41]
  wire [31:0] _GEN_702 = rs1FromROB_2 & entries_2_rs1ROBId != 8'h0 ? _GEN_698 : _GEN_604; // @[ReservationStation.scala 209:52]
  wire [31:0] _GEN_736 = entries_2_busy ? _GEN_702 : _GEN_604; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_830 = head == 3'h3 ? _GEN_828 : _GEN_736; // @[ReservationStation.scala 213:36 215:41]
  wire [31:0] _GEN_834 = rs1FromROB_3 & entries_3_rs1ROBId != 8'h0 ? _GEN_830 : _GEN_736; // @[ReservationStation.scala 209:52]
  wire [31:0] _GEN_868 = entries_3_busy ? _GEN_834 : _GEN_736; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_962 = head == 3'h4 ? _GEN_960 : _GEN_868; // @[ReservationStation.scala 213:36 215:41]
  wire [31:0] _GEN_966 = rs1FromROB_4 & entries_4_rs1ROBId != 8'h0 ? _GEN_962 : _GEN_868; // @[ReservationStation.scala 209:52]
  wire [31:0] rs1BypassFromROBVal = entries_4_busy ? _GEN_966 : _GEN_868; // @[ReservationStation.scala 197:22]
  wire [31:0] _io_deq_bits_rs1Val_T_2 = rs1BypassFromROB ? rs1BypassFromROBVal : _io_deq_bits_rs1Val_T_1; // @[ReservationStation.scala 114:36]
  wire [31:0] _GEN_46 = 3'h1 == head ? entries_1_rs2Val : entries_0_rs2Val; // @[ReservationStation.scala 126:{40,40}]
  wire [31:0] _GEN_47 = 3'h2 == head ? entries_2_rs2Val : _GEN_46; // @[ReservationStation.scala 126:{40,40}]
  wire [31:0] _GEN_48 = 3'h3 == head ? entries_3_rs2Val : _GEN_47; // @[ReservationStation.scala 126:{40,40}]
  wire [31:0] _GEN_49 = 3'h4 == head ? entries_4_rs2Val : _GEN_48; // @[ReservationStation.scala 126:{40,40}]
  wire [31:0] _bypassRs2_T_48 = cdbBypassRs2_4[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_49 = cdbBypassRs2_4[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_52 = _bypassRs2_T_48 | _bypassRs2_T_49; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_50 = cdbBypassRs2_4[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_53 = _bypassRs2_T_52 | _bypassRs2_T_50; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_51 = cdbBypassRs2_4[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs2_9 = _bypassRs2_T_53 | _bypassRs2_T_51; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_37 = cdbBypassRs2_3[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_38 = cdbBypassRs2_3[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_41 = _bypassRs2_T_37 | _bypassRs2_T_38; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_39 = cdbBypassRs2_3[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_42 = _bypassRs2_T_41 | _bypassRs2_T_39; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_40 = cdbBypassRs2_3[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs2_7 = _bypassRs2_T_42 | _bypassRs2_T_40; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_26 = cdbBypassRs2_2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_27 = cdbBypassRs2_2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_30 = _bypassRs2_T_26 | _bypassRs2_T_27; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_28 = cdbBypassRs2_2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_31 = _bypassRs2_T_30 | _bypassRs2_T_28; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_29 = cdbBypassRs2_2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs2_5 = _bypassRs2_T_31 | _bypassRs2_T_29; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_15 = cdbBypassRs2_1[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_16 = cdbBypassRs2_1[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_19 = _bypassRs2_T_15 | _bypassRs2_T_16; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_17 = cdbBypassRs2_1[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_20 = _bypassRs2_T_19 | _bypassRs2_T_17; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_18 = cdbBypassRs2_1[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs2_3 = _bypassRs2_T_20 | _bypassRs2_T_18; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_4 = cdbBypassRs2[0] ? io_cdb_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_5 = cdbBypassRs2[1] ? io_cdb_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_8 = _bypassRs2_T_4 | _bypassRs2_T_5; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_6 = cdbBypassRs2[2] ? io_cdb_2_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_9 = _bypassRs2_T_8 | _bypassRs2_T_6; // @[Mux.scala 27:73]
  wire [31:0] _bypassRs2_T_7 = cdbBypassRs2[3] ? io_cdb_3_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] bypassRs2_1 = _bypassRs2_T_9 | _bypassRs2_T_7; // @[Mux.scala 27:73]
  wire [31:0] _GEN_464 = _T_10 ? bypassRs2_1 : 32'h0; // @[ReservationStation.scala 255:36 257:41 101:42]
  wire [31:0] _GEN_468 = bypassRs2 & _T_11 ? _GEN_464 : 32'h0; // @[ReservationStation.scala 101:42 250:51]
  wire [31:0] _GEN_480 = entries_0_busy ? _GEN_468 : 32'h0; // @[ReservationStation.scala 197:22 101:42]
  wire [31:0] _GEN_596 = _T_22 ? bypassRs2_3 : _GEN_480; // @[ReservationStation.scala 255:36 257:41]
  wire [31:0] _GEN_600 = bypassRs2_2 & _T_23 ? _GEN_596 : _GEN_480; // @[ReservationStation.scala 250:51]
  wire [31:0] _GEN_612 = entries_1_busy ? _GEN_600 : _GEN_480; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_728 = _T_34 ? bypassRs2_5 : _GEN_612; // @[ReservationStation.scala 255:36 257:41]
  wire [31:0] _GEN_732 = bypassRs2_4 & _T_35 ? _GEN_728 : _GEN_612; // @[ReservationStation.scala 250:51]
  wire [31:0] _GEN_744 = entries_2_busy ? _GEN_732 : _GEN_612; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_860 = _T_46 ? bypassRs2_7 : _GEN_744; // @[ReservationStation.scala 255:36 257:41]
  wire [31:0] _GEN_864 = bypassRs2_6 & _T_47 ? _GEN_860 : _GEN_744; // @[ReservationStation.scala 250:51]
  wire [31:0] _GEN_876 = entries_3_busy ? _GEN_864 : _GEN_744; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_992 = _T_58 ? bypassRs2_9 : _GEN_876; // @[ReservationStation.scala 255:36 257:41]
  wire [31:0] _GEN_996 = bypassRs2_8 & _T_59 ? _GEN_992 : _GEN_876; // @[ReservationStation.scala 250:51]
  wire [31:0] rs2BypassFromCDBVal = entries_4_busy ? _GEN_996 : _GEN_876; // @[ReservationStation.scala 197:22]
  wire [31:0] _io_deq_bits_rs2Val_T_1 = rs2BypassFromCDB ? rs2BypassFromCDBVal : _GEN_49; // @[ReservationStation.scala 126:40]
  wire [31:0] _GEN_968 = 4'h1 == _rs2ROBEntry_T_13[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_969 = 4'h2 == _rs2ROBEntry_T_13[3:0] ? io_robRead_2_data : _GEN_968; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_970 = 4'h3 == _rs2ROBEntry_T_13[3:0] ? io_robRead_3_data : _GEN_969; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_971 = 4'h4 == _rs2ROBEntry_T_13[3:0] ? io_robRead_4_data : _GEN_970; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_972 = 4'h5 == _rs2ROBEntry_T_13[3:0] ? io_robRead_5_data : _GEN_971; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_973 = 4'h6 == _rs2ROBEntry_T_13[3:0] ? io_robRead_6_data : _GEN_972; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_974 = 4'h7 == _rs2ROBEntry_T_13[3:0] ? io_robRead_7_data : _GEN_973; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_975 = 4'h8 == _rs2ROBEntry_T_13[3:0] ? io_robRead_8_data : _GEN_974; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_976 = 4'h9 == _rs2ROBEntry_T_13[3:0] ? io_robRead_9_data : _GEN_975; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_977 = 4'ha == _rs2ROBEntry_T_13[3:0] ? io_robRead_10_data : _GEN_976; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_978 = 4'hb == _rs2ROBEntry_T_13[3:0] ? io_robRead_11_data : _GEN_977; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_836 = 4'h1 == _rs2ROBEntry_T_10[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_837 = 4'h2 == _rs2ROBEntry_T_10[3:0] ? io_robRead_2_data : _GEN_836; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_838 = 4'h3 == _rs2ROBEntry_T_10[3:0] ? io_robRead_3_data : _GEN_837; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_839 = 4'h4 == _rs2ROBEntry_T_10[3:0] ? io_robRead_4_data : _GEN_838; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_840 = 4'h5 == _rs2ROBEntry_T_10[3:0] ? io_robRead_5_data : _GEN_839; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_841 = 4'h6 == _rs2ROBEntry_T_10[3:0] ? io_robRead_6_data : _GEN_840; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_842 = 4'h7 == _rs2ROBEntry_T_10[3:0] ? io_robRead_7_data : _GEN_841; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_843 = 4'h8 == _rs2ROBEntry_T_10[3:0] ? io_robRead_8_data : _GEN_842; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_844 = 4'h9 == _rs2ROBEntry_T_10[3:0] ? io_robRead_9_data : _GEN_843; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_845 = 4'ha == _rs2ROBEntry_T_10[3:0] ? io_robRead_10_data : _GEN_844; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_846 = 4'hb == _rs2ROBEntry_T_10[3:0] ? io_robRead_11_data : _GEN_845; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_704 = 4'h1 == _rs2ROBEntry_T_7[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_705 = 4'h2 == _rs2ROBEntry_T_7[3:0] ? io_robRead_2_data : _GEN_704; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_706 = 4'h3 == _rs2ROBEntry_T_7[3:0] ? io_robRead_3_data : _GEN_705; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_707 = 4'h4 == _rs2ROBEntry_T_7[3:0] ? io_robRead_4_data : _GEN_706; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_708 = 4'h5 == _rs2ROBEntry_T_7[3:0] ? io_robRead_5_data : _GEN_707; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_709 = 4'h6 == _rs2ROBEntry_T_7[3:0] ? io_robRead_6_data : _GEN_708; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_710 = 4'h7 == _rs2ROBEntry_T_7[3:0] ? io_robRead_7_data : _GEN_709; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_711 = 4'h8 == _rs2ROBEntry_T_7[3:0] ? io_robRead_8_data : _GEN_710; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_712 = 4'h9 == _rs2ROBEntry_T_7[3:0] ? io_robRead_9_data : _GEN_711; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_713 = 4'ha == _rs2ROBEntry_T_7[3:0] ? io_robRead_10_data : _GEN_712; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_714 = 4'hb == _rs2ROBEntry_T_7[3:0] ? io_robRead_11_data : _GEN_713; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_572 = 4'h1 == _rs2ROBEntry_T_4[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_573 = 4'h2 == _rs2ROBEntry_T_4[3:0] ? io_robRead_2_data : _GEN_572; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_574 = 4'h3 == _rs2ROBEntry_T_4[3:0] ? io_robRead_3_data : _GEN_573; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_575 = 4'h4 == _rs2ROBEntry_T_4[3:0] ? io_robRead_4_data : _GEN_574; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_576 = 4'h5 == _rs2ROBEntry_T_4[3:0] ? io_robRead_5_data : _GEN_575; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_577 = 4'h6 == _rs2ROBEntry_T_4[3:0] ? io_robRead_6_data : _GEN_576; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_578 = 4'h7 == _rs2ROBEntry_T_4[3:0] ? io_robRead_7_data : _GEN_577; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_579 = 4'h8 == _rs2ROBEntry_T_4[3:0] ? io_robRead_8_data : _GEN_578; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_580 = 4'h9 == _rs2ROBEntry_T_4[3:0] ? io_robRead_9_data : _GEN_579; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_581 = 4'ha == _rs2ROBEntry_T_4[3:0] ? io_robRead_10_data : _GEN_580; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_582 = 4'hb == _rs2ROBEntry_T_4[3:0] ? io_robRead_11_data : _GEN_581; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_440 = 4'h1 == _rs2ROBEntry_T_1[3:0] ? io_robRead_1_data : io_robRead_0_data; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_441 = 4'h2 == _rs2ROBEntry_T_1[3:0] ? io_robRead_2_data : _GEN_440; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_442 = 4'h3 == _rs2ROBEntry_T_1[3:0] ? io_robRead_3_data : _GEN_441; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_443 = 4'h4 == _rs2ROBEntry_T_1[3:0] ? io_robRead_4_data : _GEN_442; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_444 = 4'h5 == _rs2ROBEntry_T_1[3:0] ? io_robRead_5_data : _GEN_443; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_445 = 4'h6 == _rs2ROBEntry_T_1[3:0] ? io_robRead_6_data : _GEN_444; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_446 = 4'h7 == _rs2ROBEntry_T_1[3:0] ? io_robRead_7_data : _GEN_445; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_447 = 4'h8 == _rs2ROBEntry_T_1[3:0] ? io_robRead_8_data : _GEN_446; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_448 = 4'h9 == _rs2ROBEntry_T_1[3:0] ? io_robRead_9_data : _GEN_447; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_449 = 4'ha == _rs2ROBEntry_T_1[3:0] ? io_robRead_10_data : _GEN_448; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_450 = 4'hb == _rs2ROBEntry_T_1[3:0] ? io_robRead_11_data : _GEN_449; // @[ReservationStation.scala 219:{26,26}]
  wire [31:0] _GEN_452 = _T_10 ? _GEN_450 : 32'h0; // @[ReservationStation.scala 222:36 224:41 96:42]
  wire [31:0] _GEN_456 = rs2FromROB & entries_0_rs2ROBId != 8'h0 ? _GEN_452 : 32'h0; // @[ReservationStation.scala 218:52 96:42]
  wire [31:0] _GEN_476 = entries_0_busy ? _GEN_456 : 32'h0; // @[ReservationStation.scala 197:22 96:42]
  wire [31:0] _GEN_584 = _T_22 ? _GEN_582 : _GEN_476; // @[ReservationStation.scala 222:36 224:41]
  wire [31:0] _GEN_588 = rs2FromROB_1 & entries_1_rs2ROBId != 8'h0 ? _GEN_584 : _GEN_476; // @[ReservationStation.scala 218:52]
  wire [31:0] _GEN_608 = entries_1_busy ? _GEN_588 : _GEN_476; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_716 = _T_34 ? _GEN_714 : _GEN_608; // @[ReservationStation.scala 222:36 224:41]
  wire [31:0] _GEN_720 = rs2FromROB_2 & entries_2_rs2ROBId != 8'h0 ? _GEN_716 : _GEN_608; // @[ReservationStation.scala 218:52]
  wire [31:0] _GEN_740 = entries_2_busy ? _GEN_720 : _GEN_608; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_848 = _T_46 ? _GEN_846 : _GEN_740; // @[ReservationStation.scala 222:36 224:41]
  wire [31:0] _GEN_852 = rs2FromROB_3 & entries_3_rs2ROBId != 8'h0 ? _GEN_848 : _GEN_740; // @[ReservationStation.scala 218:52]
  wire [31:0] _GEN_872 = entries_3_busy ? _GEN_852 : _GEN_740; // @[ReservationStation.scala 197:22]
  wire [31:0] _GEN_980 = _T_58 ? _GEN_978 : _GEN_872; // @[ReservationStation.scala 222:36 224:41]
  wire [31:0] _GEN_984 = rs2FromROB_4 & entries_4_rs2ROBId != 8'h0 ? _GEN_980 : _GEN_872; // @[ReservationStation.scala 218:52]
  wire [31:0] rs2BypassFromROBVal = entries_4_busy ? _GEN_984 : _GEN_872; // @[ReservationStation.scala 197:22]
  wire [31:0] _io_deq_bits_rs2Val_T_2 = rs2BypassFromROB ? rs2BypassFromROBVal : _io_deq_bits_rs2Val_T_1; // @[ReservationStation.scala 123:36]
  wire [2:0] _GEN_51 = 3'h1 == head ? entries_1_immSrc : entries_0_immSrc; // @[ReservationStation.scala 129:{24,24}]
  wire [2:0] _GEN_52 = 3'h2 == head ? entries_2_immSrc : _GEN_51; // @[ReservationStation.scala 129:{24,24}]
  wire [2:0] _GEN_53 = 3'h3 == head ? entries_3_immSrc : _GEN_52; // @[ReservationStation.scala 129:{24,24}]
  wire  _GEN_56 = 3'h1 == head ? entries_1_immSign : entries_0_immSign; // @[ReservationStation.scala 130:{25,25}]
  wire  _GEN_57 = 3'h2 == head ? entries_2_immSign : _GEN_56; // @[ReservationStation.scala 130:{25,25}]
  wire  _GEN_58 = 3'h3 == head ? entries_3_immSign : _GEN_57; // @[ReservationStation.scala 130:{25,25}]
  wire [3:0] _GEN_61 = 3'h1 == head ? entries_1_excpType : entries_0_excpType; // @[ReservationStation.scala 131:{26,26}]
  wire [3:0] _GEN_62 = 3'h2 == head ? entries_2_excpType : _GEN_61; // @[ReservationStation.scala 131:{26,26}]
  wire [3:0] _GEN_63 = 3'h3 == head ? entries_3_excpType : _GEN_62; // @[ReservationStation.scala 131:{26,26}]
  wire [31:0] _GEN_66 = 3'h1 == head ? entries_1_pc : entries_0_pc; // @[ReservationStation.scala 132:{20,20}]
  wire [31:0] _GEN_67 = 3'h2 == head ? entries_2_pc : _GEN_66; // @[ReservationStation.scala 132:{20,20}]
  wire [31:0] _GEN_68 = 3'h3 == head ? entries_3_pc : _GEN_67; // @[ReservationStation.scala 132:{20,20}]
  wire [31:0] _GEN_71 = 3'h1 == head ? entries_1_inst : entries_0_inst; // @[ReservationStation.scala 133:{22,22}]
  wire [31:0] _GEN_72 = 3'h2 == head ? entries_2_inst : _GEN_71; // @[ReservationStation.scala 133:{22,22}]
  wire [31:0] _GEN_73 = 3'h3 == head ? entries_3_inst : _GEN_72; // @[ReservationStation.scala 133:{22,22}]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_75 = 3'h0 == tail | entries_0_busy; // @[ReservationStation.scala 147:{28,28} 85:22]
  wire  _GEN_76 = 3'h1 == tail | entries_1_busy; // @[ReservationStation.scala 147:{28,28} 85:22]
  wire  _GEN_77 = 3'h2 == tail | entries_2_busy; // @[ReservationStation.scala 147:{28,28} 85:22]
  wire  _GEN_78 = 3'h3 == tail | entries_3_busy; // @[ReservationStation.scala 147:{28,28} 85:22]
  wire  _GEN_79 = 3'h4 == tail | entries_4_busy; // @[ReservationStation.scala 147:{28,28} 85:22]
  wire [7:0] _GEN_90 = 3'h0 == tail ? io_enq_bits_rs1ROBId : entries_0_rs1ROBId; // @[ReservationStation.scala 150:{32,32} 85:22]
  wire [7:0] _GEN_91 = 3'h1 == tail ? io_enq_bits_rs1ROBId : entries_1_rs1ROBId; // @[ReservationStation.scala 150:{32,32} 85:22]
  wire [7:0] _GEN_92 = 3'h2 == tail ? io_enq_bits_rs1ROBId : entries_2_rs1ROBId; // @[ReservationStation.scala 150:{32,32} 85:22]
  wire [7:0] _GEN_93 = 3'h3 == tail ? io_enq_bits_rs1ROBId : entries_3_rs1ROBId; // @[ReservationStation.scala 150:{32,32} 85:22]
  wire [7:0] _GEN_94 = 3'h4 == tail ? io_enq_bits_rs1ROBId : entries_4_rs1ROBId; // @[ReservationStation.scala 150:{32,32} 85:22]
  wire [7:0] _GEN_95 = 3'h0 == tail ? io_enq_bits_rs2ROBId : entries_0_rs2ROBId; // @[ReservationStation.scala 151:{32,32} 85:22]
  wire [7:0] _GEN_96 = 3'h1 == tail ? io_enq_bits_rs2ROBId : entries_1_rs2ROBId; // @[ReservationStation.scala 151:{32,32} 85:22]
  wire [7:0] _GEN_97 = 3'h2 == tail ? io_enq_bits_rs2ROBId : entries_2_rs2ROBId; // @[ReservationStation.scala 151:{32,32} 85:22]
  wire [7:0] _GEN_98 = 3'h3 == tail ? io_enq_bits_rs2ROBId : entries_3_rs2ROBId; // @[ReservationStation.scala 151:{32,32} 85:22]
  wire [7:0] _GEN_99 = 3'h4 == tail ? io_enq_bits_rs2ROBId : entries_4_rs2ROBId; // @[ReservationStation.scala 151:{32,32} 85:22]
  wire [7:0] _GEN_161 = 5'h1 == io_enq_bits_rs1 ? io_regStatus_1_owner : io_regStatus_0_owner; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_162 = 5'h2 == io_enq_bits_rs1 ? io_regStatus_2_owner : _GEN_161; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_163 = 5'h3 == io_enq_bits_rs1 ? io_regStatus_3_owner : _GEN_162; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_164 = 5'h4 == io_enq_bits_rs1 ? io_regStatus_4_owner : _GEN_163; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_165 = 5'h5 == io_enq_bits_rs1 ? io_regStatus_5_owner : _GEN_164; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_166 = 5'h6 == io_enq_bits_rs1 ? io_regStatus_6_owner : _GEN_165; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_167 = 5'h7 == io_enq_bits_rs1 ? io_regStatus_7_owner : _GEN_166; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_168 = 5'h8 == io_enq_bits_rs1 ? io_regStatus_8_owner : _GEN_167; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_169 = 5'h9 == io_enq_bits_rs1 ? io_regStatus_9_owner : _GEN_168; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_170 = 5'ha == io_enq_bits_rs1 ? io_regStatus_10_owner : _GEN_169; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_171 = 5'hb == io_enq_bits_rs1 ? io_regStatus_11_owner : _GEN_170; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_172 = 5'hc == io_enq_bits_rs1 ? io_regStatus_12_owner : _GEN_171; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_173 = 5'hd == io_enq_bits_rs1 ? io_regStatus_13_owner : _GEN_172; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_174 = 5'he == io_enq_bits_rs1 ? io_regStatus_14_owner : _GEN_173; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_175 = 5'hf == io_enq_bits_rs1 ? io_regStatus_15_owner : _GEN_174; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_176 = 5'h10 == io_enq_bits_rs1 ? io_regStatus_16_owner : _GEN_175; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_177 = 5'h11 == io_enq_bits_rs1 ? io_regStatus_17_owner : _GEN_176; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_178 = 5'h12 == io_enq_bits_rs1 ? io_regStatus_18_owner : _GEN_177; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_179 = 5'h13 == io_enq_bits_rs1 ? io_regStatus_19_owner : _GEN_178; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_180 = 5'h14 == io_enq_bits_rs1 ? io_regStatus_20_owner : _GEN_179; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_181 = 5'h15 == io_enq_bits_rs1 ? io_regStatus_21_owner : _GEN_180; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_182 = 5'h16 == io_enq_bits_rs1 ? io_regStatus_22_owner : _GEN_181; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_183 = 5'h17 == io_enq_bits_rs1 ? io_regStatus_23_owner : _GEN_182; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_184 = 5'h18 == io_enq_bits_rs1 ? io_regStatus_24_owner : _GEN_183; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_185 = 5'h19 == io_enq_bits_rs1 ? io_regStatus_25_owner : _GEN_184; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_186 = 5'h1a == io_enq_bits_rs1 ? io_regStatus_26_owner : _GEN_185; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_187 = 5'h1b == io_enq_bits_rs1 ? io_regStatus_27_owner : _GEN_186; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_188 = 5'h1c == io_enq_bits_rs1 ? io_regStatus_28_owner : _GEN_187; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_189 = 5'h1d == io_enq_bits_rs1 ? io_regStatus_29_owner : _GEN_188; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_190 = 5'h1e == io_enq_bits_rs1 ? io_regStatus_30_owner : _GEN_189; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_191 = 5'h1f == io_enq_bits_rs1 ? io_regStatus_31_owner : _GEN_190; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_155 = 3'h0 == tail ? _GEN_191 : _GEN_90; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_156 = 3'h1 == tail ? _GEN_191 : _GEN_91; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_157 = 3'h2 == tail ? _GEN_191 : _GEN_92; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_158 = 3'h3 == tail ? _GEN_191 : _GEN_93; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_159 = 3'h4 == tail ? _GEN_191 : _GEN_94; // @[ReservationStation.scala 166:{32,32}]
  wire [7:0] _GEN_198 = 5'h1 == io_enq_bits_rs2 ? io_regStatus_1_owner : io_regStatus_0_owner; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_199 = 5'h2 == io_enq_bits_rs2 ? io_regStatus_2_owner : _GEN_198; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_200 = 5'h3 == io_enq_bits_rs2 ? io_regStatus_3_owner : _GEN_199; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_201 = 5'h4 == io_enq_bits_rs2 ? io_regStatus_4_owner : _GEN_200; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_202 = 5'h5 == io_enq_bits_rs2 ? io_regStatus_5_owner : _GEN_201; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_203 = 5'h6 == io_enq_bits_rs2 ? io_regStatus_6_owner : _GEN_202; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_204 = 5'h7 == io_enq_bits_rs2 ? io_regStatus_7_owner : _GEN_203; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_205 = 5'h8 == io_enq_bits_rs2 ? io_regStatus_8_owner : _GEN_204; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_206 = 5'h9 == io_enq_bits_rs2 ? io_regStatus_9_owner : _GEN_205; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_207 = 5'ha == io_enq_bits_rs2 ? io_regStatus_10_owner : _GEN_206; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_208 = 5'hb == io_enq_bits_rs2 ? io_regStatus_11_owner : _GEN_207; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_209 = 5'hc == io_enq_bits_rs2 ? io_regStatus_12_owner : _GEN_208; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_210 = 5'hd == io_enq_bits_rs2 ? io_regStatus_13_owner : _GEN_209; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_211 = 5'he == io_enq_bits_rs2 ? io_regStatus_14_owner : _GEN_210; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_212 = 5'hf == io_enq_bits_rs2 ? io_regStatus_15_owner : _GEN_211; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_213 = 5'h10 == io_enq_bits_rs2 ? io_regStatus_16_owner : _GEN_212; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_214 = 5'h11 == io_enq_bits_rs2 ? io_regStatus_17_owner : _GEN_213; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_215 = 5'h12 == io_enq_bits_rs2 ? io_regStatus_18_owner : _GEN_214; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_216 = 5'h13 == io_enq_bits_rs2 ? io_regStatus_19_owner : _GEN_215; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_217 = 5'h14 == io_enq_bits_rs2 ? io_regStatus_20_owner : _GEN_216; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_218 = 5'h15 == io_enq_bits_rs2 ? io_regStatus_21_owner : _GEN_217; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_219 = 5'h16 == io_enq_bits_rs2 ? io_regStatus_22_owner : _GEN_218; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_220 = 5'h17 == io_enq_bits_rs2 ? io_regStatus_23_owner : _GEN_219; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_221 = 5'h18 == io_enq_bits_rs2 ? io_regStatus_24_owner : _GEN_220; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_222 = 5'h19 == io_enq_bits_rs2 ? io_regStatus_25_owner : _GEN_221; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_223 = 5'h1a == io_enq_bits_rs2 ? io_regStatus_26_owner : _GEN_222; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_224 = 5'h1b == io_enq_bits_rs2 ? io_regStatus_27_owner : _GEN_223; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_225 = 5'h1c == io_enq_bits_rs2 ? io_regStatus_28_owner : _GEN_224; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_226 = 5'h1d == io_enq_bits_rs2 ? io_regStatus_29_owner : _GEN_225; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_227 = 5'h1e == io_enq_bits_rs2 ? io_regStatus_30_owner : _GEN_226; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_228 = 5'h1f == io_enq_bits_rs2 ? io_regStatus_31_owner : _GEN_227; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_192 = 3'h0 == tail ? _GEN_228 : _GEN_95; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_193 = 3'h1 == tail ? _GEN_228 : _GEN_96; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_194 = 3'h2 == tail ? _GEN_228 : _GEN_97; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_195 = 3'h3 == tail ? _GEN_228 : _GEN_98; // @[ReservationStation.scala 167:{32,32}]
  wire [7:0] _GEN_196 = 3'h4 == tail ? _GEN_228 : _GEN_99; // @[ReservationStation.scala 167:{32,32}]
  wire [31:0] _GEN_229 = 3'h0 == tail ? io_rf_0_data : entries_0_rs1Val; // @[ReservationStation.scala 172:{30,30} 85:22]
  wire [31:0] _GEN_230 = 3'h1 == tail ? io_rf_0_data : entries_1_rs1Val; // @[ReservationStation.scala 172:{30,30} 85:22]
  wire [31:0] _GEN_231 = 3'h2 == tail ? io_rf_0_data : entries_2_rs1Val; // @[ReservationStation.scala 172:{30,30} 85:22]
  wire [31:0] _GEN_232 = 3'h3 == tail ? io_rf_0_data : entries_3_rs1Val; // @[ReservationStation.scala 172:{30,30} 85:22]
  wire [31:0] _GEN_233 = 3'h4 == tail ? io_rf_0_data : entries_4_rs1Val; // @[ReservationStation.scala 172:{30,30} 85:22]
  wire [31:0] _GEN_234 = 3'h0 == tail ? io_rf_1_data : entries_0_rs2Val; // @[ReservationStation.scala 173:{30,30} 85:22]
  wire [31:0] _GEN_235 = 3'h1 == tail ? io_rf_1_data : entries_1_rs2Val; // @[ReservationStation.scala 173:{30,30} 85:22]
  wire [31:0] _GEN_236 = 3'h2 == tail ? io_rf_1_data : entries_2_rs2Val; // @[ReservationStation.scala 173:{30,30} 85:22]
  wire [31:0] _GEN_237 = 3'h3 == tail ? io_rf_1_data : entries_3_rs2Val; // @[ReservationStation.scala 173:{30,30} 85:22]
  wire [31:0] _GEN_238 = 3'h4 == tail ? io_rf_1_data : entries_4_rs2Val; // @[ReservationStation.scala 173:{30,30} 85:22]
  wire [2:0] _tail_T_2 = tail + 3'h1; // @[ReservationStation.scala 175:60]
  wire  _GEN_239 = _T ? _GEN_75 : entries_0_busy; // @[ReservationStation.scala 146:24 85:22]
  wire  _GEN_240 = _T ? _GEN_76 : entries_1_busy; // @[ReservationStation.scala 146:24 85:22]
  wire  _GEN_241 = _T ? _GEN_77 : entries_2_busy; // @[ReservationStation.scala 146:24 85:22]
  wire  _GEN_242 = _T ? _GEN_78 : entries_3_busy; // @[ReservationStation.scala 146:24 85:22]
  wire  _GEN_243 = _T ? _GEN_79 : entries_4_busy; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_254 = _T ? _GEN_155 : entries_0_rs1ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_255 = _T ? _GEN_156 : entries_1_rs1ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_256 = _T ? _GEN_157 : entries_2_rs1ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_257 = _T ? _GEN_158 : entries_3_rs1ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_258 = _T ? _GEN_159 : entries_4_rs1ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_259 = _T ? _GEN_192 : entries_0_rs2ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_260 = _T ? _GEN_193 : entries_1_rs2ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_261 = _T ? _GEN_194 : entries_2_rs2ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_262 = _T ? _GEN_195 : entries_3_rs2ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [7:0] _GEN_263 = _T ? _GEN_196 : entries_4_rs2ROBId; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_316 = _T ? _GEN_229 : entries_0_rs1Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_317 = _T ? _GEN_230 : entries_1_rs1Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_318 = _T ? _GEN_231 : entries_2_rs1Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_319 = _T ? _GEN_232 : entries_3_rs1Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_320 = _T ? _GEN_233 : entries_4_rs1Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_321 = _T ? _GEN_234 : entries_0_rs2Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_322 = _T ? _GEN_235 : entries_1_rs2Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_323 = _T ? _GEN_236 : entries_2_rs2Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_324 = _T ? _GEN_237 : entries_3_rs2Val; // @[ReservationStation.scala 146:24 85:22]
  wire [31:0] _GEN_325 = _T ? _GEN_238 : entries_4_rs2Val; // @[ReservationStation.scala 146:24 85:22]
  wire  _T_1 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _head_T_2 = head + 3'h1; // @[ReservationStation.scala 184:60]
  wire [7:0] _GEN_343 = _T_1 ? _GEN_29 : 8'h0; // @[ReservationStation.scala 136:23 178:24 181:27]
  wire [2:0] _count_T_1 = count + 3'h1; // @[ReservationStation.scala 189:28]
  wire [2:0] _GEN_346 = _T ? _count_T_1 : count; // @[ReservationStation.scala 188:27 189:19 89:24]
  wire [2:0] _count_T_3 = count - 3'h1; // @[ReservationStation.scala 192:28]
  assign io_enq_ready = ~full & ~_GEN_14; // @[ReservationStation.scala 105:27]
  assign io_deq_valid = oprReady & _GEN_19; // @[ReservationStation.scala 106:30]
  assign io_deq_bits_op = 3'h4 == head ? entries_4_op : _GEN_23; // @[ReservationStation.scala 107:{20,20}]
  assign io_deq_bits_ROBId = 3'h4 == head ? entries_4_ROBId : _GEN_28; // @[ReservationStation.scala 108:{23,23}]
  assign io_deq_bits_opr1 = 3'h4 == head ? entries_4_opr1 : _GEN_33; // @[ReservationStation.scala 109:{22,22}]
  assign io_deq_bits_opr2 = 3'h4 == head ? entries_4_opr2 : _GEN_38; // @[ReservationStation.scala 110:{22,22}]
  assign io_deq_bits_rs1Val = _oprReady_T ? _GEN_44 : _io_deq_bits_rs1Val_T_2; // @[ReservationStation.scala 111:32]
  assign io_deq_bits_rs2Val = _oprReady_T_3 ? _GEN_49 : _io_deq_bits_rs2Val_T_2; // @[ReservationStation.scala 120:32]
  assign io_deq_bits_immSrc = 3'h4 == head ? entries_4_immSrc : _GEN_53; // @[ReservationStation.scala 129:{24,24}]
  assign io_deq_bits_immSign = 3'h4 == head ? entries_4_immSign : _GEN_58; // @[ReservationStation.scala 130:{25,25}]
  assign io_deq_bits_excpType = 3'h4 == head ? entries_4_excpType : _GEN_63; // @[ReservationStation.scala 131:{26,26}]
  assign io_deq_bits_pc = 3'h4 == head ? entries_4_pc : _GEN_68; // @[ReservationStation.scala 132:{20,20}]
  assign io_deq_bits_inst = 3'h4 == head ? entries_4_inst : _GEN_73; // @[ReservationStation.scala 133:{22,22}]
  assign io_robOut_valid = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  assign io_robOut_bits_id = _GEN_343[3:0];
  assign io_rf_0_addr = _T ? io_enq_bits_rs1 : 5'h0; // @[ReservationStation.scala 141:16 146:24 170:23]
  assign io_rf_1_addr = _T ? io_enq_bits_rs2 : 5'h0; // @[ReservationStation.scala 141:16 146:24 171:23]
  always @(posedge clock) begin
    if (io_flush) begin // @[ReservationStation.scala 263:21]
      entries_0_busy <= 1'h0; // @[ReservationStation.scala 264:37]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (3'h0 == head) begin // @[ReservationStation.scala 179:28]
        entries_0_busy <= 1'h0; // @[ReservationStation.scala 179:28]
      end else begin
        entries_0_busy <= _GEN_239;
      end
    end else begin
      entries_0_busy <= _GEN_239;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 149:26]
        entries_0_op <= io_enq_bits_op; // @[ReservationStation.scala 149:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 148:29]
        entries_0_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 148:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 153:28]
        entries_0_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 153:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 154:28]
        entries_0_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 154:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 155:27]
        entries_0_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 155:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 156:27]
        entries_0_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 156:27]
      end
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1 & _T_8) begin // @[ReservationStation.scala 240:51]
        entries_0_rs1Val <= bypassRs1_1; // @[ReservationStation.scala 242:26]
      end else if (rs1FromROB & entries_0_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        if (4'hb == _rs1ROBEntry_T_1[3:0]) begin // @[ReservationStation.scala 210:26]
          entries_0_rs1Val <= io_robRead_11_data; // @[ReservationStation.scala 210:26]
        end else begin
          entries_0_rs1Val <= _GEN_431;
        end
      end else begin
        entries_0_rs1Val <= _GEN_316;
      end
    end else begin
      entries_0_rs1Val <= _GEN_316;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2 & _T_11) begin // @[ReservationStation.scala 250:51]
        entries_0_rs2Val <= bypassRs2_1; // @[ReservationStation.scala 252:26]
      end else if (rs2FromROB & entries_0_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        if (4'hb == _rs2ROBEntry_T_1[3:0]) begin // @[ReservationStation.scala 219:26]
          entries_0_rs2Val <= io_robRead_11_data; // @[ReservationStation.scala 219:26]
        end else begin
          entries_0_rs2Val <= _GEN_449;
        end
      end else begin
        entries_0_rs2Val <= _GEN_321;
      end
    end else begin
      entries_0_rs2Val <= _GEN_321;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1 & _T_8) begin // @[ReservationStation.scala 240:51]
        entries_0_rs1ROBId <= 8'h0; // @[ReservationStation.scala 243:28]
      end else if (rs1FromROB & entries_0_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        entries_0_rs1ROBId <= 8'h0; // @[ReservationStation.scala 211:28]
      end else begin
        entries_0_rs1ROBId <= _GEN_254;
      end
    end else begin
      entries_0_rs1ROBId <= _GEN_254;
    end
    if (entries_0_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2 & _T_11) begin // @[ReservationStation.scala 250:51]
        entries_0_rs2ROBId <= 8'h0; // @[ReservationStation.scala 253:28]
      end else if (rs2FromROB & entries_0_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        entries_0_rs2ROBId <= 8'h0; // @[ReservationStation.scala 220:28]
      end else begin
        entries_0_rs2ROBId <= _GEN_259;
      end
    end else begin
      entries_0_rs2ROBId <= _GEN_259;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 158:30]
        entries_0_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 158:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 159:31]
        entries_0_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 159:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 160:32]
        entries_0_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 160:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 161:26]
        entries_0_pc <= io_enq_bits_pc; // @[ReservationStation.scala 161:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h0 == tail) begin // @[ReservationStation.scala 162:28]
        entries_0_inst <= io_enq_bits_inst; // @[ReservationStation.scala 162:28]
      end else if (3'h0 == tail) begin // @[ReservationStation.scala 152:28]
        entries_0_inst <= io_enq_bits_inst; // @[ReservationStation.scala 152:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 263:21]
      entries_1_busy <= 1'h0; // @[ReservationStation.scala 264:37]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (3'h1 == head) begin // @[ReservationStation.scala 179:28]
        entries_1_busy <= 1'h0; // @[ReservationStation.scala 179:28]
      end else begin
        entries_1_busy <= _GEN_240;
      end
    end else begin
      entries_1_busy <= _GEN_240;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 149:26]
        entries_1_op <= io_enq_bits_op; // @[ReservationStation.scala 149:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 148:29]
        entries_1_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 148:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 153:28]
        entries_1_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 153:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 154:28]
        entries_1_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 154:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 155:27]
        entries_1_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 155:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 156:27]
        entries_1_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 156:27]
      end
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_2 & _T_20) begin // @[ReservationStation.scala 240:51]
        entries_1_rs1Val <= bypassRs1_3; // @[ReservationStation.scala 242:26]
      end else if (rs1FromROB_1 & entries_1_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        if (4'hb == _rs1ROBEntry_T_4[3:0]) begin // @[ReservationStation.scala 210:26]
          entries_1_rs1Val <= io_robRead_11_data; // @[ReservationStation.scala 210:26]
        end else begin
          entries_1_rs1Val <= _GEN_563;
        end
      end else begin
        entries_1_rs1Val <= _GEN_317;
      end
    end else begin
      entries_1_rs1Val <= _GEN_317;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_2 & _T_23) begin // @[ReservationStation.scala 250:51]
        entries_1_rs2Val <= bypassRs2_3; // @[ReservationStation.scala 252:26]
      end else if (rs2FromROB_1 & entries_1_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        if (4'hb == _rs2ROBEntry_T_4[3:0]) begin // @[ReservationStation.scala 219:26]
          entries_1_rs2Val <= io_robRead_11_data; // @[ReservationStation.scala 219:26]
        end else begin
          entries_1_rs2Val <= _GEN_581;
        end
      end else begin
        entries_1_rs2Val <= _GEN_322;
      end
    end else begin
      entries_1_rs2Val <= _GEN_322;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_2 & _T_20) begin // @[ReservationStation.scala 240:51]
        entries_1_rs1ROBId <= 8'h0; // @[ReservationStation.scala 243:28]
      end else if (rs1FromROB_1 & entries_1_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        entries_1_rs1ROBId <= 8'h0; // @[ReservationStation.scala 211:28]
      end else begin
        entries_1_rs1ROBId <= _GEN_255;
      end
    end else begin
      entries_1_rs1ROBId <= _GEN_255;
    end
    if (entries_1_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_2 & _T_23) begin // @[ReservationStation.scala 250:51]
        entries_1_rs2ROBId <= 8'h0; // @[ReservationStation.scala 253:28]
      end else if (rs2FromROB_1 & entries_1_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        entries_1_rs2ROBId <= 8'h0; // @[ReservationStation.scala 220:28]
      end else begin
        entries_1_rs2ROBId <= _GEN_260;
      end
    end else begin
      entries_1_rs2ROBId <= _GEN_260;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 158:30]
        entries_1_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 158:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 159:31]
        entries_1_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 159:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 160:32]
        entries_1_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 160:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 161:26]
        entries_1_pc <= io_enq_bits_pc; // @[ReservationStation.scala 161:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h1 == tail) begin // @[ReservationStation.scala 162:28]
        entries_1_inst <= io_enq_bits_inst; // @[ReservationStation.scala 162:28]
      end else if (3'h1 == tail) begin // @[ReservationStation.scala 152:28]
        entries_1_inst <= io_enq_bits_inst; // @[ReservationStation.scala 152:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 263:21]
      entries_2_busy <= 1'h0; // @[ReservationStation.scala 264:37]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (3'h2 == head) begin // @[ReservationStation.scala 179:28]
        entries_2_busy <= 1'h0; // @[ReservationStation.scala 179:28]
      end else begin
        entries_2_busy <= _GEN_241;
      end
    end else begin
      entries_2_busy <= _GEN_241;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 149:26]
        entries_2_op <= io_enq_bits_op; // @[ReservationStation.scala 149:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 148:29]
        entries_2_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 148:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 153:28]
        entries_2_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 153:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 154:28]
        entries_2_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 154:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 155:27]
        entries_2_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 155:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 156:27]
        entries_2_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 156:27]
      end
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_4 & _T_32) begin // @[ReservationStation.scala 240:51]
        entries_2_rs1Val <= bypassRs1_5; // @[ReservationStation.scala 242:26]
      end else if (rs1FromROB_2 & entries_2_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        if (4'hb == _rs1ROBEntry_T_7[3:0]) begin // @[ReservationStation.scala 210:26]
          entries_2_rs1Val <= io_robRead_11_data; // @[ReservationStation.scala 210:26]
        end else begin
          entries_2_rs1Val <= _GEN_695;
        end
      end else begin
        entries_2_rs1Val <= _GEN_318;
      end
    end else begin
      entries_2_rs1Val <= _GEN_318;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_4 & _T_35) begin // @[ReservationStation.scala 250:51]
        entries_2_rs2Val <= bypassRs2_5; // @[ReservationStation.scala 252:26]
      end else if (rs2FromROB_2 & entries_2_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        if (4'hb == _rs2ROBEntry_T_7[3:0]) begin // @[ReservationStation.scala 219:26]
          entries_2_rs2Val <= io_robRead_11_data; // @[ReservationStation.scala 219:26]
        end else begin
          entries_2_rs2Val <= _GEN_713;
        end
      end else begin
        entries_2_rs2Val <= _GEN_323;
      end
    end else begin
      entries_2_rs2Val <= _GEN_323;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_4 & _T_32) begin // @[ReservationStation.scala 240:51]
        entries_2_rs1ROBId <= 8'h0; // @[ReservationStation.scala 243:28]
      end else if (rs1FromROB_2 & entries_2_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        entries_2_rs1ROBId <= 8'h0; // @[ReservationStation.scala 211:28]
      end else begin
        entries_2_rs1ROBId <= _GEN_256;
      end
    end else begin
      entries_2_rs1ROBId <= _GEN_256;
    end
    if (entries_2_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_4 & _T_35) begin // @[ReservationStation.scala 250:51]
        entries_2_rs2ROBId <= 8'h0; // @[ReservationStation.scala 253:28]
      end else if (rs2FromROB_2 & entries_2_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        entries_2_rs2ROBId <= 8'h0; // @[ReservationStation.scala 220:28]
      end else begin
        entries_2_rs2ROBId <= _GEN_261;
      end
    end else begin
      entries_2_rs2ROBId <= _GEN_261;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 158:30]
        entries_2_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 158:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 159:31]
        entries_2_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 159:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 160:32]
        entries_2_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 160:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 161:26]
        entries_2_pc <= io_enq_bits_pc; // @[ReservationStation.scala 161:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h2 == tail) begin // @[ReservationStation.scala 162:28]
        entries_2_inst <= io_enq_bits_inst; // @[ReservationStation.scala 162:28]
      end else if (3'h2 == tail) begin // @[ReservationStation.scala 152:28]
        entries_2_inst <= io_enq_bits_inst; // @[ReservationStation.scala 152:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 263:21]
      entries_3_busy <= 1'h0; // @[ReservationStation.scala 264:37]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (3'h3 == head) begin // @[ReservationStation.scala 179:28]
        entries_3_busy <= 1'h0; // @[ReservationStation.scala 179:28]
      end else begin
        entries_3_busy <= _GEN_242;
      end
    end else begin
      entries_3_busy <= _GEN_242;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 149:26]
        entries_3_op <= io_enq_bits_op; // @[ReservationStation.scala 149:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 148:29]
        entries_3_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 148:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 153:28]
        entries_3_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 153:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 154:28]
        entries_3_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 154:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 155:27]
        entries_3_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 155:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 156:27]
        entries_3_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 156:27]
      end
    end
    if (entries_3_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_6 & _T_44) begin // @[ReservationStation.scala 240:51]
        entries_3_rs1Val <= bypassRs1_7; // @[ReservationStation.scala 242:26]
      end else if (rs1FromROB_3 & entries_3_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        if (4'hb == _rs1ROBEntry_T_10[3:0]) begin // @[ReservationStation.scala 210:26]
          entries_3_rs1Val <= io_robRead_11_data; // @[ReservationStation.scala 210:26]
        end else begin
          entries_3_rs1Val <= _GEN_827;
        end
      end else begin
        entries_3_rs1Val <= _GEN_319;
      end
    end else begin
      entries_3_rs1Val <= _GEN_319;
    end
    if (entries_3_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_6 & _T_47) begin // @[ReservationStation.scala 250:51]
        entries_3_rs2Val <= bypassRs2_7; // @[ReservationStation.scala 252:26]
      end else if (rs2FromROB_3 & entries_3_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        if (4'hb == _rs2ROBEntry_T_10[3:0]) begin // @[ReservationStation.scala 219:26]
          entries_3_rs2Val <= io_robRead_11_data; // @[ReservationStation.scala 219:26]
        end else begin
          entries_3_rs2Val <= _GEN_845;
        end
      end else begin
        entries_3_rs2Val <= _GEN_324;
      end
    end else begin
      entries_3_rs2Val <= _GEN_324;
    end
    if (entries_3_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_6 & _T_44) begin // @[ReservationStation.scala 240:51]
        entries_3_rs1ROBId <= 8'h0; // @[ReservationStation.scala 243:28]
      end else if (rs1FromROB_3 & entries_3_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        entries_3_rs1ROBId <= 8'h0; // @[ReservationStation.scala 211:28]
      end else begin
        entries_3_rs1ROBId <= _GEN_257;
      end
    end else begin
      entries_3_rs1ROBId <= _GEN_257;
    end
    if (entries_3_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_6 & _T_47) begin // @[ReservationStation.scala 250:51]
        entries_3_rs2ROBId <= 8'h0; // @[ReservationStation.scala 253:28]
      end else if (rs2FromROB_3 & entries_3_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        entries_3_rs2ROBId <= 8'h0; // @[ReservationStation.scala 220:28]
      end else begin
        entries_3_rs2ROBId <= _GEN_262;
      end
    end else begin
      entries_3_rs2ROBId <= _GEN_262;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 158:30]
        entries_3_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 158:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 159:31]
        entries_3_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 159:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 160:32]
        entries_3_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 160:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 161:26]
        entries_3_pc <= io_enq_bits_pc; // @[ReservationStation.scala 161:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h3 == tail) begin // @[ReservationStation.scala 162:28]
        entries_3_inst <= io_enq_bits_inst; // @[ReservationStation.scala 162:28]
      end else if (3'h3 == tail) begin // @[ReservationStation.scala 152:28]
        entries_3_inst <= io_enq_bits_inst; // @[ReservationStation.scala 152:28]
      end
    end
    if (io_flush) begin // @[ReservationStation.scala 263:21]
      entries_4_busy <= 1'h0; // @[ReservationStation.scala 264:37]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (3'h4 == head) begin // @[ReservationStation.scala 179:28]
        entries_4_busy <= 1'h0; // @[ReservationStation.scala 179:28]
      end else begin
        entries_4_busy <= _GEN_243;
      end
    end else begin
      entries_4_busy <= _GEN_243;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 149:26]
        entries_4_op <= io_enq_bits_op; // @[ReservationStation.scala 149:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 148:29]
        entries_4_ROBId <= io_enq_bits_ROBId; // @[ReservationStation.scala 148:29]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 153:28]
        entries_4_opr1 <= io_enq_bits_opr1; // @[ReservationStation.scala 153:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 154:28]
        entries_4_opr2 <= io_enq_bits_opr2; // @[ReservationStation.scala 154:28]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 155:27]
        entries_4_rs1 <= io_enq_bits_rs1; // @[ReservationStation.scala 155:27]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 156:27]
        entries_4_rs2 <= io_enq_bits_rs2; // @[ReservationStation.scala 156:27]
      end
    end
    if (entries_4_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_8 & _T_56) begin // @[ReservationStation.scala 240:51]
        entries_4_rs1Val <= bypassRs1_9; // @[ReservationStation.scala 242:26]
      end else if (rs1FromROB_4 & entries_4_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        if (4'hb == _rs1ROBEntry_T_13[3:0]) begin // @[ReservationStation.scala 210:26]
          entries_4_rs1Val <= io_robRead_11_data; // @[ReservationStation.scala 210:26]
        end else begin
          entries_4_rs1Val <= _GEN_959;
        end
      end else begin
        entries_4_rs1Val <= _GEN_320;
      end
    end else begin
      entries_4_rs1Val <= _GEN_320;
    end
    if (entries_4_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_8 & _T_59) begin // @[ReservationStation.scala 250:51]
        entries_4_rs2Val <= bypassRs2_9; // @[ReservationStation.scala 252:26]
      end else if (rs2FromROB_4 & entries_4_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        if (4'hb == _rs2ROBEntry_T_13[3:0]) begin // @[ReservationStation.scala 219:26]
          entries_4_rs2Val <= io_robRead_11_data; // @[ReservationStation.scala 219:26]
        end else begin
          entries_4_rs2Val <= _GEN_977;
        end
      end else begin
        entries_4_rs2Val <= _GEN_325;
      end
    end else begin
      entries_4_rs2Val <= _GEN_325;
    end
    if (entries_4_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs1_8 & _T_56) begin // @[ReservationStation.scala 240:51]
        entries_4_rs1ROBId <= 8'h0; // @[ReservationStation.scala 243:28]
      end else if (rs1FromROB_4 & entries_4_rs1ROBId != 8'h0) begin // @[ReservationStation.scala 209:52]
        entries_4_rs1ROBId <= 8'h0; // @[ReservationStation.scala 211:28]
      end else begin
        entries_4_rs1ROBId <= _GEN_258;
      end
    end else begin
      entries_4_rs1ROBId <= _GEN_258;
    end
    if (entries_4_busy) begin // @[ReservationStation.scala 197:22]
      if (bypassRs2_8 & _T_59) begin // @[ReservationStation.scala 250:51]
        entries_4_rs2ROBId <= 8'h0; // @[ReservationStation.scala 253:28]
      end else if (rs2FromROB_4 & entries_4_rs2ROBId != 8'h0) begin // @[ReservationStation.scala 218:52]
        entries_4_rs2ROBId <= 8'h0; // @[ReservationStation.scala 220:28]
      end else begin
        entries_4_rs2ROBId <= _GEN_263;
      end
    end else begin
      entries_4_rs2ROBId <= _GEN_263;
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 158:30]
        entries_4_immSrc <= io_enq_bits_immSrc; // @[ReservationStation.scala 158:30]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 159:31]
        entries_4_immSign <= io_enq_bits_immSign; // @[ReservationStation.scala 159:31]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 160:32]
        entries_4_excpType <= io_enq_bits_excpType; // @[ReservationStation.scala 160:32]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 161:26]
        entries_4_pc <= io_enq_bits_pc; // @[ReservationStation.scala 161:26]
      end
    end
    if (_T) begin // @[ReservationStation.scala 146:24]
      if (3'h4 == tail) begin // @[ReservationStation.scala 162:28]
        entries_4_inst <= io_enq_bits_inst; // @[ReservationStation.scala 162:28]
      end else if (3'h4 == tail) begin // @[ReservationStation.scala 152:28]
        entries_4_inst <= io_enq_bits_inst; // @[ReservationStation.scala 152:28]
      end
    end
    if (reset) begin // @[ReservationStation.scala 86:23]
      head <= 3'h0; // @[ReservationStation.scala 86:23]
    end else if (io_flush) begin // @[ReservationStation.scala 263:21]
      head <= 3'h0; // @[ReservationStation.scala 265:14]
    end else if (_T_1) begin // @[ReservationStation.scala 178:24]
      if (_T_58) begin // @[ReservationStation.scala 184:20]
        head <= 3'h0;
      end else begin
        head <= _head_T_2;
      end
    end
    if (reset) begin // @[ReservationStation.scala 87:23]
      tail <= 3'h0; // @[ReservationStation.scala 87:23]
    end else if (io_flush) begin // @[ReservationStation.scala 263:21]
      tail <= 3'h0; // @[ReservationStation.scala 266:14]
    end else if (_T) begin // @[ReservationStation.scala 146:24]
      if (tail == 3'h4) begin // @[ReservationStation.scala 175:20]
        tail <= 3'h0;
      end else begin
        tail <= _tail_T_2;
      end
    end
    if (reset) begin // @[ReservationStation.scala 89:24]
      count <= 3'h0; // @[ReservationStation.scala 89:24]
    end else if (io_flush) begin // @[ReservationStation.scala 263:21]
      count <= 3'h0; // @[ReservationStation.scala 267:15]
    end else if (~(_T_1 & _T)) begin // @[ReservationStation.scala 187:43]
      if (_T_1) begin // @[ReservationStation.scala 191:27]
        count <= _count_T_3; // @[ReservationStation.scala 192:19]
      end else begin
        count <= _GEN_346;
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
  entries_3_busy = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  entries_3_op = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  entries_3_ROBId = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  entries_3_opr1 = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  entries_3_opr2 = _RAND_52[3:0];
  _RAND_53 = {1{`RANDOM}};
  entries_3_rs1 = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  entries_3_rs2 = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  entries_3_rs1Val = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  entries_3_rs2Val = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  entries_3_rs1ROBId = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  entries_3_rs2ROBId = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  entries_3_immSrc = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  entries_3_immSign = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  entries_3_excpType = _RAND_61[3:0];
  _RAND_62 = {1{`RANDOM}};
  entries_3_pc = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  entries_3_inst = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  entries_4_busy = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  entries_4_op = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  entries_4_ROBId = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  entries_4_opr1 = _RAND_67[3:0];
  _RAND_68 = {1{`RANDOM}};
  entries_4_opr2 = _RAND_68[3:0];
  _RAND_69 = {1{`RANDOM}};
  entries_4_rs1 = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  entries_4_rs2 = _RAND_70[4:0];
  _RAND_71 = {1{`RANDOM}};
  entries_4_rs1Val = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  entries_4_rs2Val = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  entries_4_rs1ROBId = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  entries_4_rs2ROBId = _RAND_74[7:0];
  _RAND_75 = {1{`RANDOM}};
  entries_4_immSrc = _RAND_75[2:0];
  _RAND_76 = {1{`RANDOM}};
  entries_4_immSign = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  entries_4_excpType = _RAND_77[3:0];
  _RAND_78 = {1{`RANDOM}};
  entries_4_pc = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  entries_4_inst = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  head = _RAND_80[2:0];
  _RAND_81 = {1{`RANDOM}};
  tail = _RAND_81[2:0];
  _RAND_82 = {1{`RANDOM}};
  count = _RAND_82[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
