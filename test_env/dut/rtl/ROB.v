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
  input         io_rs_0_valid,
  input  [2:0]  io_rs_0_bits_id,
  input         io_rs_1_valid,
  input  [2:0]  io_rs_1_bits_id,
  input         io_rs_2_valid,
  input  [2:0]  io_rs_2_bits_id,
  input         io_rs_3_valid,
  input  [2:0]  io_rs_3_bits_id,
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
  input         io_fu_0_valid,
  input  [2:0]  io_fu_0_bits_id,
  input  [31:0] io_fu_0_bits_data,
  input         io_fu_1_valid,
  input  [2:0]  io_fu_1_bits_id,
  input  [31:0] io_fu_1_bits_data,
  input  [31:0] io_fu_1_bits_brAddr,
  input         io_fu_1_bits_brTaken,
  input         io_fu_2_valid,
  input  [2:0]  io_fu_2_bits_id,
  input  [31:0] io_fu_2_bits_data,
  input         io_fu_3_valid,
  input  [2:0]  io_fu_3_bits_id,
  input  [31:0] io_fu_3_bits_data,
  input  [31:0] io_fu_3_bits_excpAddr,
  input         io_fu_3_bits_excpValid,
  output [2:0]  io_id,
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
`endif // RANDOMIZE_REG_INIT
  reg  entries_0_busy; // @[ROB.scala 118:22]
  reg [1:0] entries_0_state; // @[ROB.scala 118:22]
  reg [4:0] entries_0_rd; // @[ROB.scala 118:22]
  reg [31:0] entries_0_data; // @[ROB.scala 118:22]
  reg [31:0] entries_0_brAddr; // @[ROB.scala 118:22]
  reg  entries_0_brTaken; // @[ROB.scala 118:22]
  reg [31:0] entries_0_excpAddr; // @[ROB.scala 118:22]
  reg  entries_0_excpValid; // @[ROB.scala 118:22]
  reg [31:0] entries_0_pc; // @[ROB.scala 118:22]
  reg [31:0] entries_0_inst; // @[ROB.scala 118:22]
  reg  entries_1_busy; // @[ROB.scala 118:22]
  reg [1:0] entries_1_state; // @[ROB.scala 118:22]
  reg [4:0] entries_1_rd; // @[ROB.scala 118:22]
  reg [31:0] entries_1_data; // @[ROB.scala 118:22]
  reg [31:0] entries_1_brAddr; // @[ROB.scala 118:22]
  reg  entries_1_brTaken; // @[ROB.scala 118:22]
  reg [31:0] entries_1_excpAddr; // @[ROB.scala 118:22]
  reg  entries_1_excpValid; // @[ROB.scala 118:22]
  reg [31:0] entries_1_pc; // @[ROB.scala 118:22]
  reg [31:0] entries_1_inst; // @[ROB.scala 118:22]
  reg  entries_2_busy; // @[ROB.scala 118:22]
  reg [1:0] entries_2_state; // @[ROB.scala 118:22]
  reg [4:0] entries_2_rd; // @[ROB.scala 118:22]
  reg [31:0] entries_2_data; // @[ROB.scala 118:22]
  reg [31:0] entries_2_brAddr; // @[ROB.scala 118:22]
  reg  entries_2_brTaken; // @[ROB.scala 118:22]
  reg [31:0] entries_2_excpAddr; // @[ROB.scala 118:22]
  reg  entries_2_excpValid; // @[ROB.scala 118:22]
  reg [31:0] entries_2_pc; // @[ROB.scala 118:22]
  reg [31:0] entries_2_inst; // @[ROB.scala 118:22]
  reg  entries_3_busy; // @[ROB.scala 118:22]
  reg [1:0] entries_3_state; // @[ROB.scala 118:22]
  reg [4:0] entries_3_rd; // @[ROB.scala 118:22]
  reg [31:0] entries_3_data; // @[ROB.scala 118:22]
  reg [31:0] entries_3_brAddr; // @[ROB.scala 118:22]
  reg  entries_3_brTaken; // @[ROB.scala 118:22]
  reg [31:0] entries_3_excpAddr; // @[ROB.scala 118:22]
  reg  entries_3_excpValid; // @[ROB.scala 118:22]
  reg [31:0] entries_3_pc; // @[ROB.scala 118:22]
  reg [31:0] entries_3_inst; // @[ROB.scala 118:22]
  reg  entries_4_busy; // @[ROB.scala 118:22]
  reg [1:0] entries_4_state; // @[ROB.scala 118:22]
  reg [4:0] entries_4_rd; // @[ROB.scala 118:22]
  reg [31:0] entries_4_data; // @[ROB.scala 118:22]
  reg [31:0] entries_4_brAddr; // @[ROB.scala 118:22]
  reg  entries_4_brTaken; // @[ROB.scala 118:22]
  reg [31:0] entries_4_excpAddr; // @[ROB.scala 118:22]
  reg  entries_4_excpValid; // @[ROB.scala 118:22]
  reg [31:0] entries_4_pc; // @[ROB.scala 118:22]
  reg [31:0] entries_4_inst; // @[ROB.scala 118:22]
  reg [7:0] regResStat_0_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_1_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_2_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_3_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_4_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_5_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_6_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_7_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_8_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_9_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_10_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_11_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_12_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_13_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_14_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_15_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_16_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_17_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_18_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_19_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_20_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_21_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_22_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_23_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_24_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_25_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_26_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_27_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_28_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_29_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_30_owner; // @[ROB.scala 119:25]
  reg [7:0] regResStat_31_owner; // @[ROB.scala 119:25]
  reg [2:0] head; // @[ROB.scala 121:23]
  reg [2:0] tail; // @[ROB.scala 122:23]
  reg [2:0] count; // @[ROB.scala 124:24]
  wire  full = count == 3'h5; // @[ROB.scala 125:22]
  wire [2:0] _io_id_T_1 = tail + 3'h1; // @[ROB.scala 133:19]
  wire  _GEN_1 = 3'h1 == tail ? entries_1_busy : entries_0_busy; // @[ROB.scala 134:{30,30}]
  wire  _GEN_2 = 3'h2 == tail ? entries_2_busy : _GEN_1; // @[ROB.scala 134:{30,30}]
  wire  _GEN_3 = 3'h3 == tail ? entries_3_busy : _GEN_2; // @[ROB.scala 134:{30,30}]
  wire  _GEN_4 = 3'h4 == tail ? entries_4_busy : _GEN_3; // @[ROB.scala 134:{30,30}]
  wire [1:0] _GEN_6 = 3'h1 == head ? entries_1_state : entries_0_state; // @[ROB.scala 135:{41,41}]
  wire [1:0] _GEN_7 = 3'h2 == head ? entries_2_state : _GEN_6; // @[ROB.scala 135:{41,41}]
  wire [1:0] _GEN_8 = 3'h3 == head ? entries_3_state : _GEN_7; // @[ROB.scala 135:{41,41}]
  wire [1:0] _GEN_9 = 3'h4 == head ? entries_4_state : _GEN_8; // @[ROB.scala 135:{41,41}]
  wire  _GEN_11 = 3'h1 == head ? entries_1_busy : entries_0_busy; // @[ROB.scala 135:{52,52}]
  wire  _GEN_12 = 3'h2 == head ? entries_2_busy : _GEN_11; // @[ROB.scala 135:{52,52}]
  wire  _GEN_13 = 3'h3 == head ? entries_3_busy : _GEN_12; // @[ROB.scala 135:{52,52}]
  wire  _GEN_14 = 3'h4 == head ? entries_4_busy : _GEN_13; // @[ROB.scala 135:{52,52}]
  wire [31:0] _GEN_16 = 3'h1 == head ? entries_1_data : entries_0_data; // @[ROB.scala 136:{22,22}]
  wire [31:0] _GEN_17 = 3'h2 == head ? entries_2_data : _GEN_16; // @[ROB.scala 136:{22,22}]
  wire [31:0] _GEN_18 = 3'h3 == head ? entries_3_data : _GEN_17; // @[ROB.scala 136:{22,22}]
  wire [4:0] _GEN_21 = 3'h1 == head ? entries_1_rd : entries_0_rd; // @[ROB.scala 137:{20,20}]
  wire [4:0] _GEN_22 = 3'h2 == head ? entries_2_rd : _GEN_21; // @[ROB.scala 137:{20,20}]
  wire [4:0] _GEN_23 = 3'h3 == head ? entries_3_rd : _GEN_22; // @[ROB.scala 137:{20,20}]
  wire [4:0] _GEN_24 = 3'h4 == head ? entries_4_rd : _GEN_23; // @[ROB.scala 137:{20,20}]
  wire [31:0] _GEN_26 = 3'h1 == head ? entries_1_pc : entries_0_pc; // @[ROB.scala 139:{20,20}]
  wire [31:0] _GEN_27 = 3'h2 == head ? entries_2_pc : _GEN_26; // @[ROB.scala 139:{20,20}]
  wire [31:0] _GEN_28 = 3'h3 == head ? entries_3_pc : _GEN_27; // @[ROB.scala 139:{20,20}]
  wire [31:0] _GEN_31 = 3'h1 == head ? entries_1_inst : entries_0_inst; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_32 = 3'h2 == head ? entries_2_inst : _GEN_31; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_33 = 3'h3 == head ? entries_3_inst : _GEN_32; // @[ROB.scala 140:{22,22}]
  wire [31:0] _GEN_36 = 3'h1 == head ? entries_1_brAddr : entries_0_brAddr; // @[ROB.scala 141:{24,24}]
  wire [31:0] _GEN_37 = 3'h2 == head ? entries_2_brAddr : _GEN_36; // @[ROB.scala 141:{24,24}]
  wire [31:0] _GEN_38 = 3'h3 == head ? entries_3_brAddr : _GEN_37; // @[ROB.scala 141:{24,24}]
  wire  _GEN_41 = 3'h1 == head ? entries_1_brTaken : entries_0_brTaken; // @[ROB.scala 142:{25,25}]
  wire  _GEN_42 = 3'h2 == head ? entries_2_brTaken : _GEN_41; // @[ROB.scala 142:{25,25}]
  wire  _GEN_43 = 3'h3 == head ? entries_3_brTaken : _GEN_42; // @[ROB.scala 142:{25,25}]
  wire [31:0] _GEN_46 = 3'h1 == head ? entries_1_excpAddr : entries_0_excpAddr; // @[ROB.scala 143:{26,26}]
  wire [31:0] _GEN_47 = 3'h2 == head ? entries_2_excpAddr : _GEN_46; // @[ROB.scala 143:{26,26}]
  wire [31:0] _GEN_48 = 3'h3 == head ? entries_3_excpAddr : _GEN_47; // @[ROB.scala 143:{26,26}]
  wire  _GEN_51 = 3'h1 == head ? entries_1_excpValid : entries_0_excpValid; // @[ROB.scala 144:{27,27}]
  wire  _GEN_52 = 3'h2 == head ? entries_2_excpValid : _GEN_51; // @[ROB.scala 144:{27,27}]
  wire  _GEN_53 = 3'h3 == head ? entries_3_excpValid : _GEN_52; // @[ROB.scala 144:{27,27}]
  wire [2:0] _io_deq_bits_id_T_1 = head + 3'h1; // @[ROB.scala 145:28]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_55 = 3'h0 == tail | entries_0_busy; // @[ROB.scala 118:22 149:{28,28}]
  wire  _GEN_56 = 3'h1 == tail | entries_1_busy; // @[ROB.scala 118:22 149:{28,28}]
  wire  _GEN_57 = 3'h2 == tail | entries_2_busy; // @[ROB.scala 118:22 149:{28,28}]
  wire  _GEN_58 = 3'h3 == tail | entries_3_busy; // @[ROB.scala 118:22 149:{28,28}]
  wire  _GEN_59 = 3'h4 == tail | entries_4_busy; // @[ROB.scala 118:22 149:{28,28}]
  wire [1:0] _GEN_60 = 3'h0 == tail ? 2'h0 : entries_0_state; // @[ROB.scala 118:22 150:{29,29}]
  wire [1:0] _GEN_61 = 3'h1 == tail ? 2'h0 : entries_1_state; // @[ROB.scala 118:22 150:{29,29}]
  wire [1:0] _GEN_62 = 3'h2 == tail ? 2'h0 : entries_2_state; // @[ROB.scala 118:22 150:{29,29}]
  wire [1:0] _GEN_63 = 3'h3 == tail ? 2'h0 : entries_3_state; // @[ROB.scala 118:22 150:{29,29}]
  wire [1:0] _GEN_64 = 3'h4 == tail ? 2'h0 : entries_4_state; // @[ROB.scala 118:22 150:{29,29}]
  wire [2:0] _regResStat_owner_T_3 = io_enq_bits_rd == 5'h0 ? 3'h0 : _io_id_T_1; // @[ROB.scala 157:36]
  wire [7:0] _regResStat_io_enq_bits_rd_owner = {{5'd0}, _regResStat_owner_T_3}; // @[ROB.scala 157:{30,30}]
  wire [7:0] _GEN_85 = 5'h0 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_0_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_86 = 5'h1 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_1_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_87 = 5'h2 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_2_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_88 = 5'h3 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_3_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_89 = 5'h4 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_4_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_90 = 5'h5 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_5_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_91 = 5'h6 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_6_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_92 = 5'h7 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_7_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_93 = 5'h8 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_8_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_94 = 5'h9 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_9_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_95 = 5'ha == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_10_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_96 = 5'hb == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_11_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_97 = 5'hc == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_12_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_98 = 5'hd == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_13_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_99 = 5'he == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_14_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_100 = 5'hf == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_15_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_101 = 5'h10 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_16_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_102 = 5'h11 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_17_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_103 = 5'h12 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_18_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_104 = 5'h13 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_19_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_105 = 5'h14 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_20_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_106 = 5'h15 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_21_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_107 = 5'h16 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_22_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_108 = 5'h17 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_23_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_109 = 5'h18 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_24_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_110 = 5'h19 == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_25_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_111 = 5'h1a == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_26_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_112 = 5'h1b == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_27_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_113 = 5'h1c == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_28_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_114 = 5'h1d == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_29_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_115 = 5'h1e == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_30_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire [7:0] _GEN_116 = 5'h1f == io_enq_bits_rd ? _regResStat_io_enq_bits_rd_owner : regResStat_31_owner; // @[ROB.scala 119:25 157:{30,30}]
  wire  _GEN_117 = _T ? _GEN_55 : entries_0_busy; // @[ROB.scala 118:22 148:24]
  wire  _GEN_118 = _T ? _GEN_56 : entries_1_busy; // @[ROB.scala 118:22 148:24]
  wire  _GEN_119 = _T ? _GEN_57 : entries_2_busy; // @[ROB.scala 118:22 148:24]
  wire  _GEN_120 = _T ? _GEN_58 : entries_3_busy; // @[ROB.scala 118:22 148:24]
  wire  _GEN_121 = _T ? _GEN_59 : entries_4_busy; // @[ROB.scala 118:22 148:24]
  wire [1:0] _GEN_122 = _T ? _GEN_60 : entries_0_state; // @[ROB.scala 118:22 148:24]
  wire [1:0] _GEN_123 = _T ? _GEN_61 : entries_1_state; // @[ROB.scala 118:22 148:24]
  wire [1:0] _GEN_124 = _T ? _GEN_62 : entries_2_state; // @[ROB.scala 118:22 148:24]
  wire [1:0] _GEN_125 = _T ? _GEN_63 : entries_3_state; // @[ROB.scala 118:22 148:24]
  wire [1:0] _GEN_126 = _T ? _GEN_64 : entries_4_state; // @[ROB.scala 118:22 148:24]
  wire [7:0] _GEN_142 = _T ? _GEN_85 : regResStat_0_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_143 = _T ? _GEN_86 : regResStat_1_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_144 = _T ? _GEN_87 : regResStat_2_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_145 = _T ? _GEN_88 : regResStat_3_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_146 = _T ? _GEN_89 : regResStat_4_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_147 = _T ? _GEN_90 : regResStat_5_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_148 = _T ? _GEN_91 : regResStat_6_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_149 = _T ? _GEN_92 : regResStat_7_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_150 = _T ? _GEN_93 : regResStat_8_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_151 = _T ? _GEN_94 : regResStat_9_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_152 = _T ? _GEN_95 : regResStat_10_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_153 = _T ? _GEN_96 : regResStat_11_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_154 = _T ? _GEN_97 : regResStat_12_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_155 = _T ? _GEN_98 : regResStat_13_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_156 = _T ? _GEN_99 : regResStat_14_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_157 = _T ? _GEN_100 : regResStat_15_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_158 = _T ? _GEN_101 : regResStat_16_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_159 = _T ? _GEN_102 : regResStat_17_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_160 = _T ? _GEN_103 : regResStat_18_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_161 = _T ? _GEN_104 : regResStat_19_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_162 = _T ? _GEN_105 : regResStat_20_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_163 = _T ? _GEN_106 : regResStat_21_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_164 = _T ? _GEN_107 : regResStat_22_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_165 = _T ? _GEN_108 : regResStat_23_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_166 = _T ? _GEN_109 : regResStat_24_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_167 = _T ? _GEN_110 : regResStat_25_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_168 = _T ? _GEN_111 : regResStat_26_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_169 = _T ? _GEN_112 : regResStat_27_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_170 = _T ? _GEN_113 : regResStat_28_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_171 = _T ? _GEN_114 : regResStat_29_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_172 = _T ? _GEN_115 : regResStat_30_owner; // @[ROB.scala 148:24 119:25]
  wire [7:0] _GEN_173 = _T ? _GEN_116 : regResStat_31_owner; // @[ROB.scala 148:24 119:25]
  wire [1:0] _GEN_180 = 3'h0 == head ? 2'h3 : _GEN_122; // @[ROB.scala 164:{29,29}]
  wire [1:0] _GEN_181 = 3'h1 == head ? 2'h3 : _GEN_123; // @[ROB.scala 164:{29,29}]
  wire [1:0] _GEN_182 = 3'h2 == head ? 2'h3 : _GEN_124; // @[ROB.scala 164:{29,29}]
  wire [1:0] _GEN_183 = 3'h3 == head ? 2'h3 : _GEN_125; // @[ROB.scala 164:{29,29}]
  wire [1:0] _GEN_184 = 3'h4 == head ? 2'h3 : _GEN_126; // @[ROB.scala 164:{29,29}]
  wire  _GEN_185 = 3'h0 == head ? 1'h0 : entries_0_brTaken; // @[ROB.scala 118:22 165:{31,31}]
  wire  _GEN_186 = 3'h1 == head ? 1'h0 : entries_1_brTaken; // @[ROB.scala 118:22 165:{31,31}]
  wire  _GEN_187 = 3'h2 == head ? 1'h0 : entries_2_brTaken; // @[ROB.scala 118:22 165:{31,31}]
  wire  _GEN_188 = 3'h3 == head ? 1'h0 : entries_3_brTaken; // @[ROB.scala 118:22 165:{31,31}]
  wire  _GEN_189 = 3'h4 == head ? 1'h0 : entries_4_brTaken; // @[ROB.scala 118:22 165:{31,31}]
  wire  _GEN_190 = 3'h0 == head ? 1'h0 : entries_0_excpValid; // @[ROB.scala 118:22 166:{33,33}]
  wire  _GEN_191 = 3'h1 == head ? 1'h0 : entries_1_excpValid; // @[ROB.scala 118:22 166:{33,33}]
  wire  _GEN_192 = 3'h2 == head ? 1'h0 : entries_2_excpValid; // @[ROB.scala 118:22 166:{33,33}]
  wire  _GEN_193 = 3'h3 == head ? 1'h0 : entries_3_excpValid; // @[ROB.scala 118:22 166:{33,33}]
  wire  _GEN_194 = 3'h4 == head ? 1'h0 : entries_4_excpValid; // @[ROB.scala 118:22 166:{33,33}]
  wire [7:0] _GEN_196 = 5'h1 == _GEN_24 ? regResStat_1_owner : regResStat_0_owner; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_197 = 5'h2 == _GEN_24 ? regResStat_2_owner : _GEN_196; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_198 = 5'h3 == _GEN_24 ? regResStat_3_owner : _GEN_197; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_199 = 5'h4 == _GEN_24 ? regResStat_4_owner : _GEN_198; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_200 = 5'h5 == _GEN_24 ? regResStat_5_owner : _GEN_199; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_201 = 5'h6 == _GEN_24 ? regResStat_6_owner : _GEN_200; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_202 = 5'h7 == _GEN_24 ? regResStat_7_owner : _GEN_201; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_203 = 5'h8 == _GEN_24 ? regResStat_8_owner : _GEN_202; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_204 = 5'h9 == _GEN_24 ? regResStat_9_owner : _GEN_203; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_205 = 5'ha == _GEN_24 ? regResStat_10_owner : _GEN_204; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_206 = 5'hb == _GEN_24 ? regResStat_11_owner : _GEN_205; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_207 = 5'hc == _GEN_24 ? regResStat_12_owner : _GEN_206; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_208 = 5'hd == _GEN_24 ? regResStat_13_owner : _GEN_207; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_209 = 5'he == _GEN_24 ? regResStat_14_owner : _GEN_208; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_210 = 5'hf == _GEN_24 ? regResStat_15_owner : _GEN_209; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_211 = 5'h10 == _GEN_24 ? regResStat_16_owner : _GEN_210; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_212 = 5'h11 == _GEN_24 ? regResStat_17_owner : _GEN_211; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_213 = 5'h12 == _GEN_24 ? regResStat_18_owner : _GEN_212; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_214 = 5'h13 == _GEN_24 ? regResStat_19_owner : _GEN_213; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_215 = 5'h14 == _GEN_24 ? regResStat_20_owner : _GEN_214; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_216 = 5'h15 == _GEN_24 ? regResStat_21_owner : _GEN_215; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_217 = 5'h16 == _GEN_24 ? regResStat_22_owner : _GEN_216; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_218 = 5'h17 == _GEN_24 ? regResStat_23_owner : _GEN_217; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_219 = 5'h18 == _GEN_24 ? regResStat_24_owner : _GEN_218; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_220 = 5'h19 == _GEN_24 ? regResStat_25_owner : _GEN_219; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_221 = 5'h1a == _GEN_24 ? regResStat_26_owner : _GEN_220; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_222 = 5'h1b == _GEN_24 ? regResStat_27_owner : _GEN_221; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_223 = 5'h1c == _GEN_24 ? regResStat_28_owner : _GEN_222; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_224 = 5'h1d == _GEN_24 ? regResStat_29_owner : _GEN_223; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_225 = 5'h1e == _GEN_24 ? regResStat_30_owner : _GEN_224; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_226 = 5'h1f == _GEN_24 ? regResStat_31_owner : _GEN_225; // @[ROB.scala 169:{43,43}]
  wire [7:0] _GEN_672 = {{5'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 169:43]
  wire [1:0] _GEN_296 = io_deq_valid ? _GEN_180 : _GEN_122; // @[ROB.scala 162:24]
  wire [1:0] _GEN_297 = io_deq_valid ? _GEN_181 : _GEN_123; // @[ROB.scala 162:24]
  wire [1:0] _GEN_298 = io_deq_valid ? _GEN_182 : _GEN_124; // @[ROB.scala 162:24]
  wire [1:0] _GEN_299 = io_deq_valid ? _GEN_183 : _GEN_125; // @[ROB.scala 162:24]
  wire [1:0] _GEN_300 = io_deq_valid ? _GEN_184 : _GEN_126; // @[ROB.scala 162:24]
  wire  _GEN_301 = io_deq_valid ? _GEN_185 : entries_0_brTaken; // @[ROB.scala 118:22 162:24]
  wire  _GEN_302 = io_deq_valid ? _GEN_186 : entries_1_brTaken; // @[ROB.scala 118:22 162:24]
  wire  _GEN_303 = io_deq_valid ? _GEN_187 : entries_2_brTaken; // @[ROB.scala 118:22 162:24]
  wire  _GEN_304 = io_deq_valid ? _GEN_188 : entries_3_brTaken; // @[ROB.scala 118:22 162:24]
  wire  _GEN_305 = io_deq_valid ? _GEN_189 : entries_4_brTaken; // @[ROB.scala 118:22 162:24]
  wire  _GEN_306 = io_deq_valid ? _GEN_190 : entries_0_excpValid; // @[ROB.scala 118:22 162:24]
  wire  _GEN_307 = io_deq_valid ? _GEN_191 : entries_1_excpValid; // @[ROB.scala 118:22 162:24]
  wire  _GEN_308 = io_deq_valid ? _GEN_192 : entries_2_excpValid; // @[ROB.scala 118:22 162:24]
  wire  _GEN_309 = io_deq_valid ? _GEN_193 : entries_3_excpValid; // @[ROB.scala 118:22 162:24]
  wire  _GEN_310 = io_deq_valid ? _GEN_194 : entries_4_excpValid; // @[ROB.scala 118:22 162:24]
  wire [2:0] _count_T_1 = count + 3'h1; // @[ROB.scala 178:28]
  wire [2:0] _GEN_344 = _T ? _count_T_1 : count; // @[ROB.scala 177:27 178:19 124:24]
  wire [2:0] _count_T_3 = count - 3'h1; // @[ROB.scala 181:28]
  wire [2:0] _T_17 = io_fu_0_bits_id - 3'h1; // @[ROB.scala 187:31]
  wire [31:0] _GEN_347 = 3'h0 == _T_17 ? io_fu_0_bits_data : entries_0_data; // @[ROB.scala 118:22 187:{43,43}]
  wire [31:0] _GEN_348 = 3'h1 == _T_17 ? io_fu_0_bits_data : entries_1_data; // @[ROB.scala 118:22 187:{43,43}]
  wire [31:0] _GEN_349 = 3'h2 == _T_17 ? io_fu_0_bits_data : entries_2_data; // @[ROB.scala 118:22 187:{43,43}]
  wire [31:0] _GEN_350 = 3'h3 == _T_17 ? io_fu_0_bits_data : entries_3_data; // @[ROB.scala 118:22 187:{43,43}]
  wire [31:0] _GEN_351 = 3'h4 == _T_17 ? io_fu_0_bits_data : entries_4_data; // @[ROB.scala 118:22 187:{43,43}]
  wire [1:0] _GEN_352 = 3'h0 == _T_17 ? 2'h2 : _GEN_296; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_353 = 3'h1 == _T_17 ? 2'h2 : _GEN_297; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_354 = 3'h2 == _T_17 ? 2'h2 : _GEN_298; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_355 = 3'h3 == _T_17 ? 2'h2 : _GEN_299; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_356 = 3'h4 == _T_17 ? 2'h2 : _GEN_300; // @[ROB.scala 188:{44,44}]
  wire [31:0] _GEN_357 = 3'h0 == _T_17 ? 32'h0 : entries_0_brAddr; // @[ROB.scala 118:22 189:{45,45}]
  wire [31:0] _GEN_358 = 3'h1 == _T_17 ? 32'h0 : entries_1_brAddr; // @[ROB.scala 118:22 189:{45,45}]
  wire [31:0] _GEN_359 = 3'h2 == _T_17 ? 32'h0 : entries_2_brAddr; // @[ROB.scala 118:22 189:{45,45}]
  wire [31:0] _GEN_360 = 3'h3 == _T_17 ? 32'h0 : entries_3_brAddr; // @[ROB.scala 118:22 189:{45,45}]
  wire [31:0] _GEN_361 = 3'h4 == _T_17 ? 32'h0 : entries_4_brAddr; // @[ROB.scala 118:22 189:{45,45}]
  wire  _GEN_362 = 3'h0 == _T_17 ? 1'h0 : _GEN_301; // @[ROB.scala 190:{46,46}]
  wire  _GEN_363 = 3'h1 == _T_17 ? 1'h0 : _GEN_302; // @[ROB.scala 190:{46,46}]
  wire  _GEN_364 = 3'h2 == _T_17 ? 1'h0 : _GEN_303; // @[ROB.scala 190:{46,46}]
  wire  _GEN_365 = 3'h3 == _T_17 ? 1'h0 : _GEN_304; // @[ROB.scala 190:{46,46}]
  wire  _GEN_366 = 3'h4 == _T_17 ? 1'h0 : _GEN_305; // @[ROB.scala 190:{46,46}]
  wire [31:0] _GEN_367 = 3'h0 == _T_17 ? 32'h0 : entries_0_excpAddr; // @[ROB.scala 118:22 191:{47,47}]
  wire [31:0] _GEN_368 = 3'h1 == _T_17 ? 32'h0 : entries_1_excpAddr; // @[ROB.scala 118:22 191:{47,47}]
  wire [31:0] _GEN_369 = 3'h2 == _T_17 ? 32'h0 : entries_2_excpAddr; // @[ROB.scala 118:22 191:{47,47}]
  wire [31:0] _GEN_370 = 3'h3 == _T_17 ? 32'h0 : entries_3_excpAddr; // @[ROB.scala 118:22 191:{47,47}]
  wire [31:0] _GEN_371 = 3'h4 == _T_17 ? 32'h0 : entries_4_excpAddr; // @[ROB.scala 118:22 191:{47,47}]
  wire  _GEN_372 = 3'h0 == _T_17 ? 1'h0 : _GEN_306; // @[ROB.scala 192:{48,48}]
  wire  _GEN_373 = 3'h1 == _T_17 ? 1'h0 : _GEN_307; // @[ROB.scala 192:{48,48}]
  wire  _GEN_374 = 3'h2 == _T_17 ? 1'h0 : _GEN_308; // @[ROB.scala 192:{48,48}]
  wire  _GEN_375 = 3'h3 == _T_17 ? 1'h0 : _GEN_309; // @[ROB.scala 192:{48,48}]
  wire  _GEN_376 = 3'h4 == _T_17 ? 1'h0 : _GEN_310; // @[ROB.scala 192:{48,48}]
  wire [31:0] _GEN_377 = io_fu_0_valid ? _GEN_347 : entries_0_data; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_378 = io_fu_0_valid ? _GEN_348 : entries_1_data; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_379 = io_fu_0_valid ? _GEN_349 : entries_2_data; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_380 = io_fu_0_valid ? _GEN_350 : entries_3_data; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_381 = io_fu_0_valid ? _GEN_351 : entries_4_data; // @[ROB.scala 118:22 186:23]
  wire [1:0] _GEN_382 = io_fu_0_valid ? _GEN_352 : _GEN_296; // @[ROB.scala 186:23]
  wire [1:0] _GEN_383 = io_fu_0_valid ? _GEN_353 : _GEN_297; // @[ROB.scala 186:23]
  wire [1:0] _GEN_384 = io_fu_0_valid ? _GEN_354 : _GEN_298; // @[ROB.scala 186:23]
  wire [1:0] _GEN_385 = io_fu_0_valid ? _GEN_355 : _GEN_299; // @[ROB.scala 186:23]
  wire [1:0] _GEN_386 = io_fu_0_valid ? _GEN_356 : _GEN_300; // @[ROB.scala 186:23]
  wire [31:0] _GEN_387 = io_fu_0_valid ? _GEN_357 : entries_0_brAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_388 = io_fu_0_valid ? _GEN_358 : entries_1_brAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_389 = io_fu_0_valid ? _GEN_359 : entries_2_brAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_390 = io_fu_0_valid ? _GEN_360 : entries_3_brAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_391 = io_fu_0_valid ? _GEN_361 : entries_4_brAddr; // @[ROB.scala 118:22 186:23]
  wire  _GEN_392 = io_fu_0_valid ? _GEN_362 : _GEN_301; // @[ROB.scala 186:23]
  wire  _GEN_393 = io_fu_0_valid ? _GEN_363 : _GEN_302; // @[ROB.scala 186:23]
  wire  _GEN_394 = io_fu_0_valid ? _GEN_364 : _GEN_303; // @[ROB.scala 186:23]
  wire  _GEN_395 = io_fu_0_valid ? _GEN_365 : _GEN_304; // @[ROB.scala 186:23]
  wire  _GEN_396 = io_fu_0_valid ? _GEN_366 : _GEN_305; // @[ROB.scala 186:23]
  wire [31:0] _GEN_397 = io_fu_0_valid ? _GEN_367 : entries_0_excpAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_398 = io_fu_0_valid ? _GEN_368 : entries_1_excpAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_399 = io_fu_0_valid ? _GEN_369 : entries_2_excpAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_400 = io_fu_0_valid ? _GEN_370 : entries_3_excpAddr; // @[ROB.scala 118:22 186:23]
  wire [31:0] _GEN_401 = io_fu_0_valid ? _GEN_371 : entries_4_excpAddr; // @[ROB.scala 118:22 186:23]
  wire  _GEN_402 = io_fu_0_valid ? _GEN_372 : _GEN_306; // @[ROB.scala 186:23]
  wire  _GEN_403 = io_fu_0_valid ? _GEN_373 : _GEN_307; // @[ROB.scala 186:23]
  wire  _GEN_404 = io_fu_0_valid ? _GEN_374 : _GEN_308; // @[ROB.scala 186:23]
  wire  _GEN_405 = io_fu_0_valid ? _GEN_375 : _GEN_309; // @[ROB.scala 186:23]
  wire  _GEN_406 = io_fu_0_valid ? _GEN_376 : _GEN_310; // @[ROB.scala 186:23]
  wire [2:0] _T_29 = io_fu_1_bits_id - 3'h1; // @[ROB.scala 187:31]
  wire [31:0] _GEN_407 = 3'h0 == _T_29 ? io_fu_1_bits_data : _GEN_377; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_408 = 3'h1 == _T_29 ? io_fu_1_bits_data : _GEN_378; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_409 = 3'h2 == _T_29 ? io_fu_1_bits_data : _GEN_379; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_410 = 3'h3 == _T_29 ? io_fu_1_bits_data : _GEN_380; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_411 = 3'h4 == _T_29 ? io_fu_1_bits_data : _GEN_381; // @[ROB.scala 187:{43,43}]
  wire [1:0] _GEN_412 = 3'h0 == _T_29 ? 2'h2 : _GEN_382; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_413 = 3'h1 == _T_29 ? 2'h2 : _GEN_383; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_414 = 3'h2 == _T_29 ? 2'h2 : _GEN_384; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_415 = 3'h3 == _T_29 ? 2'h2 : _GEN_385; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_416 = 3'h4 == _T_29 ? 2'h2 : _GEN_386; // @[ROB.scala 188:{44,44}]
  wire [31:0] _GEN_417 = 3'h0 == _T_29 ? io_fu_1_bits_brAddr : _GEN_387; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_418 = 3'h1 == _T_29 ? io_fu_1_bits_brAddr : _GEN_388; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_419 = 3'h2 == _T_29 ? io_fu_1_bits_brAddr : _GEN_389; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_420 = 3'h3 == _T_29 ? io_fu_1_bits_brAddr : _GEN_390; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_421 = 3'h4 == _T_29 ? io_fu_1_bits_brAddr : _GEN_391; // @[ROB.scala 189:{45,45}]
  wire  _GEN_422 = 3'h0 == _T_29 ? io_fu_1_bits_brTaken : _GEN_392; // @[ROB.scala 190:{46,46}]
  wire  _GEN_423 = 3'h1 == _T_29 ? io_fu_1_bits_brTaken : _GEN_393; // @[ROB.scala 190:{46,46}]
  wire  _GEN_424 = 3'h2 == _T_29 ? io_fu_1_bits_brTaken : _GEN_394; // @[ROB.scala 190:{46,46}]
  wire  _GEN_425 = 3'h3 == _T_29 ? io_fu_1_bits_brTaken : _GEN_395; // @[ROB.scala 190:{46,46}]
  wire  _GEN_426 = 3'h4 == _T_29 ? io_fu_1_bits_brTaken : _GEN_396; // @[ROB.scala 190:{46,46}]
  wire [31:0] _GEN_427 = 3'h0 == _T_29 ? 32'h0 : _GEN_397; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_428 = 3'h1 == _T_29 ? 32'h0 : _GEN_398; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_429 = 3'h2 == _T_29 ? 32'h0 : _GEN_399; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_430 = 3'h3 == _T_29 ? 32'h0 : _GEN_400; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_431 = 3'h4 == _T_29 ? 32'h0 : _GEN_401; // @[ROB.scala 191:{47,47}]
  wire  _GEN_432 = 3'h0 == _T_29 ? 1'h0 : _GEN_402; // @[ROB.scala 192:{48,48}]
  wire  _GEN_433 = 3'h1 == _T_29 ? 1'h0 : _GEN_403; // @[ROB.scala 192:{48,48}]
  wire  _GEN_434 = 3'h2 == _T_29 ? 1'h0 : _GEN_404; // @[ROB.scala 192:{48,48}]
  wire  _GEN_435 = 3'h3 == _T_29 ? 1'h0 : _GEN_405; // @[ROB.scala 192:{48,48}]
  wire  _GEN_436 = 3'h4 == _T_29 ? 1'h0 : _GEN_406; // @[ROB.scala 192:{48,48}]
  wire [31:0] _GEN_437 = io_fu_1_valid ? _GEN_407 : _GEN_377; // @[ROB.scala 186:23]
  wire [31:0] _GEN_438 = io_fu_1_valid ? _GEN_408 : _GEN_378; // @[ROB.scala 186:23]
  wire [31:0] _GEN_439 = io_fu_1_valid ? _GEN_409 : _GEN_379; // @[ROB.scala 186:23]
  wire [31:0] _GEN_440 = io_fu_1_valid ? _GEN_410 : _GEN_380; // @[ROB.scala 186:23]
  wire [31:0] _GEN_441 = io_fu_1_valid ? _GEN_411 : _GEN_381; // @[ROB.scala 186:23]
  wire [1:0] _GEN_442 = io_fu_1_valid ? _GEN_412 : _GEN_382; // @[ROB.scala 186:23]
  wire [1:0] _GEN_443 = io_fu_1_valid ? _GEN_413 : _GEN_383; // @[ROB.scala 186:23]
  wire [1:0] _GEN_444 = io_fu_1_valid ? _GEN_414 : _GEN_384; // @[ROB.scala 186:23]
  wire [1:0] _GEN_445 = io_fu_1_valid ? _GEN_415 : _GEN_385; // @[ROB.scala 186:23]
  wire [1:0] _GEN_446 = io_fu_1_valid ? _GEN_416 : _GEN_386; // @[ROB.scala 186:23]
  wire [31:0] _GEN_447 = io_fu_1_valid ? _GEN_417 : _GEN_387; // @[ROB.scala 186:23]
  wire [31:0] _GEN_448 = io_fu_1_valid ? _GEN_418 : _GEN_388; // @[ROB.scala 186:23]
  wire [31:0] _GEN_449 = io_fu_1_valid ? _GEN_419 : _GEN_389; // @[ROB.scala 186:23]
  wire [31:0] _GEN_450 = io_fu_1_valid ? _GEN_420 : _GEN_390; // @[ROB.scala 186:23]
  wire [31:0] _GEN_451 = io_fu_1_valid ? _GEN_421 : _GEN_391; // @[ROB.scala 186:23]
  wire  _GEN_452 = io_fu_1_valid ? _GEN_422 : _GEN_392; // @[ROB.scala 186:23]
  wire  _GEN_453 = io_fu_1_valid ? _GEN_423 : _GEN_393; // @[ROB.scala 186:23]
  wire  _GEN_454 = io_fu_1_valid ? _GEN_424 : _GEN_394; // @[ROB.scala 186:23]
  wire  _GEN_455 = io_fu_1_valid ? _GEN_425 : _GEN_395; // @[ROB.scala 186:23]
  wire  _GEN_456 = io_fu_1_valid ? _GEN_426 : _GEN_396; // @[ROB.scala 186:23]
  wire [31:0] _GEN_457 = io_fu_1_valid ? _GEN_427 : _GEN_397; // @[ROB.scala 186:23]
  wire [31:0] _GEN_458 = io_fu_1_valid ? _GEN_428 : _GEN_398; // @[ROB.scala 186:23]
  wire [31:0] _GEN_459 = io_fu_1_valid ? _GEN_429 : _GEN_399; // @[ROB.scala 186:23]
  wire [31:0] _GEN_460 = io_fu_1_valid ? _GEN_430 : _GEN_400; // @[ROB.scala 186:23]
  wire [31:0] _GEN_461 = io_fu_1_valid ? _GEN_431 : _GEN_401; // @[ROB.scala 186:23]
  wire  _GEN_462 = io_fu_1_valid ? _GEN_432 : _GEN_402; // @[ROB.scala 186:23]
  wire  _GEN_463 = io_fu_1_valid ? _GEN_433 : _GEN_403; // @[ROB.scala 186:23]
  wire  _GEN_464 = io_fu_1_valid ? _GEN_434 : _GEN_404; // @[ROB.scala 186:23]
  wire  _GEN_465 = io_fu_1_valid ? _GEN_435 : _GEN_405; // @[ROB.scala 186:23]
  wire  _GEN_466 = io_fu_1_valid ? _GEN_436 : _GEN_406; // @[ROB.scala 186:23]
  wire [2:0] _T_41 = io_fu_2_bits_id - 3'h1; // @[ROB.scala 187:31]
  wire [31:0] _GEN_467 = 3'h0 == _T_41 ? io_fu_2_bits_data : _GEN_437; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_468 = 3'h1 == _T_41 ? io_fu_2_bits_data : _GEN_438; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_469 = 3'h2 == _T_41 ? io_fu_2_bits_data : _GEN_439; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_470 = 3'h3 == _T_41 ? io_fu_2_bits_data : _GEN_440; // @[ROB.scala 187:{43,43}]
  wire [31:0] _GEN_471 = 3'h4 == _T_41 ? io_fu_2_bits_data : _GEN_441; // @[ROB.scala 187:{43,43}]
  wire [1:0] _GEN_472 = 3'h0 == _T_41 ? 2'h2 : _GEN_442; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_473 = 3'h1 == _T_41 ? 2'h2 : _GEN_443; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_474 = 3'h2 == _T_41 ? 2'h2 : _GEN_444; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_475 = 3'h3 == _T_41 ? 2'h2 : _GEN_445; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_476 = 3'h4 == _T_41 ? 2'h2 : _GEN_446; // @[ROB.scala 188:{44,44}]
  wire [31:0] _GEN_477 = 3'h0 == _T_41 ? 32'h0 : _GEN_447; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_478 = 3'h1 == _T_41 ? 32'h0 : _GEN_448; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_479 = 3'h2 == _T_41 ? 32'h0 : _GEN_449; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_480 = 3'h3 == _T_41 ? 32'h0 : _GEN_450; // @[ROB.scala 189:{45,45}]
  wire [31:0] _GEN_481 = 3'h4 == _T_41 ? 32'h0 : _GEN_451; // @[ROB.scala 189:{45,45}]
  wire  _GEN_482 = 3'h0 == _T_41 ? 1'h0 : _GEN_452; // @[ROB.scala 190:{46,46}]
  wire  _GEN_483 = 3'h1 == _T_41 ? 1'h0 : _GEN_453; // @[ROB.scala 190:{46,46}]
  wire  _GEN_484 = 3'h2 == _T_41 ? 1'h0 : _GEN_454; // @[ROB.scala 190:{46,46}]
  wire  _GEN_485 = 3'h3 == _T_41 ? 1'h0 : _GEN_455; // @[ROB.scala 190:{46,46}]
  wire  _GEN_486 = 3'h4 == _T_41 ? 1'h0 : _GEN_456; // @[ROB.scala 190:{46,46}]
  wire [31:0] _GEN_487 = 3'h0 == _T_41 ? 32'h0 : _GEN_457; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_488 = 3'h1 == _T_41 ? 32'h0 : _GEN_458; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_489 = 3'h2 == _T_41 ? 32'h0 : _GEN_459; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_490 = 3'h3 == _T_41 ? 32'h0 : _GEN_460; // @[ROB.scala 191:{47,47}]
  wire [31:0] _GEN_491 = 3'h4 == _T_41 ? 32'h0 : _GEN_461; // @[ROB.scala 191:{47,47}]
  wire  _GEN_492 = 3'h0 == _T_41 ? 1'h0 : _GEN_462; // @[ROB.scala 192:{48,48}]
  wire  _GEN_493 = 3'h1 == _T_41 ? 1'h0 : _GEN_463; // @[ROB.scala 192:{48,48}]
  wire  _GEN_494 = 3'h2 == _T_41 ? 1'h0 : _GEN_464; // @[ROB.scala 192:{48,48}]
  wire  _GEN_495 = 3'h3 == _T_41 ? 1'h0 : _GEN_465; // @[ROB.scala 192:{48,48}]
  wire  _GEN_496 = 3'h4 == _T_41 ? 1'h0 : _GEN_466; // @[ROB.scala 192:{48,48}]
  wire [31:0] _GEN_497 = io_fu_2_valid ? _GEN_467 : _GEN_437; // @[ROB.scala 186:23]
  wire [31:0] _GEN_498 = io_fu_2_valid ? _GEN_468 : _GEN_438; // @[ROB.scala 186:23]
  wire [31:0] _GEN_499 = io_fu_2_valid ? _GEN_469 : _GEN_439; // @[ROB.scala 186:23]
  wire [31:0] _GEN_500 = io_fu_2_valid ? _GEN_470 : _GEN_440; // @[ROB.scala 186:23]
  wire [31:0] _GEN_501 = io_fu_2_valid ? _GEN_471 : _GEN_441; // @[ROB.scala 186:23]
  wire [1:0] _GEN_502 = io_fu_2_valid ? _GEN_472 : _GEN_442; // @[ROB.scala 186:23]
  wire [1:0] _GEN_503 = io_fu_2_valid ? _GEN_473 : _GEN_443; // @[ROB.scala 186:23]
  wire [1:0] _GEN_504 = io_fu_2_valid ? _GEN_474 : _GEN_444; // @[ROB.scala 186:23]
  wire [1:0] _GEN_505 = io_fu_2_valid ? _GEN_475 : _GEN_445; // @[ROB.scala 186:23]
  wire [1:0] _GEN_506 = io_fu_2_valid ? _GEN_476 : _GEN_446; // @[ROB.scala 186:23]
  wire [31:0] _GEN_507 = io_fu_2_valid ? _GEN_477 : _GEN_447; // @[ROB.scala 186:23]
  wire [31:0] _GEN_508 = io_fu_2_valid ? _GEN_478 : _GEN_448; // @[ROB.scala 186:23]
  wire [31:0] _GEN_509 = io_fu_2_valid ? _GEN_479 : _GEN_449; // @[ROB.scala 186:23]
  wire [31:0] _GEN_510 = io_fu_2_valid ? _GEN_480 : _GEN_450; // @[ROB.scala 186:23]
  wire [31:0] _GEN_511 = io_fu_2_valid ? _GEN_481 : _GEN_451; // @[ROB.scala 186:23]
  wire  _GEN_512 = io_fu_2_valid ? _GEN_482 : _GEN_452; // @[ROB.scala 186:23]
  wire  _GEN_513 = io_fu_2_valid ? _GEN_483 : _GEN_453; // @[ROB.scala 186:23]
  wire  _GEN_514 = io_fu_2_valid ? _GEN_484 : _GEN_454; // @[ROB.scala 186:23]
  wire  _GEN_515 = io_fu_2_valid ? _GEN_485 : _GEN_455; // @[ROB.scala 186:23]
  wire  _GEN_516 = io_fu_2_valid ? _GEN_486 : _GEN_456; // @[ROB.scala 186:23]
  wire [31:0] _GEN_517 = io_fu_2_valid ? _GEN_487 : _GEN_457; // @[ROB.scala 186:23]
  wire [31:0] _GEN_518 = io_fu_2_valid ? _GEN_488 : _GEN_458; // @[ROB.scala 186:23]
  wire [31:0] _GEN_519 = io_fu_2_valid ? _GEN_489 : _GEN_459; // @[ROB.scala 186:23]
  wire [31:0] _GEN_520 = io_fu_2_valid ? _GEN_490 : _GEN_460; // @[ROB.scala 186:23]
  wire [31:0] _GEN_521 = io_fu_2_valid ? _GEN_491 : _GEN_461; // @[ROB.scala 186:23]
  wire  _GEN_522 = io_fu_2_valid ? _GEN_492 : _GEN_462; // @[ROB.scala 186:23]
  wire  _GEN_523 = io_fu_2_valid ? _GEN_493 : _GEN_463; // @[ROB.scala 186:23]
  wire  _GEN_524 = io_fu_2_valid ? _GEN_494 : _GEN_464; // @[ROB.scala 186:23]
  wire  _GEN_525 = io_fu_2_valid ? _GEN_495 : _GEN_465; // @[ROB.scala 186:23]
  wire  _GEN_526 = io_fu_2_valid ? _GEN_496 : _GEN_466; // @[ROB.scala 186:23]
  wire [2:0] _T_53 = io_fu_3_bits_id - 3'h1; // @[ROB.scala 187:31]
  wire [1:0] _GEN_532 = 3'h0 == _T_53 ? 2'h2 : _GEN_502; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_533 = 3'h1 == _T_53 ? 2'h2 : _GEN_503; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_534 = 3'h2 == _T_53 ? 2'h2 : _GEN_504; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_535 = 3'h3 == _T_53 ? 2'h2 : _GEN_505; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_536 = 3'h4 == _T_53 ? 2'h2 : _GEN_506; // @[ROB.scala 188:{44,44}]
  wire [1:0] _GEN_562 = io_fu_3_valid ? _GEN_532 : _GEN_502; // @[ROB.scala 186:23]
  wire [1:0] _GEN_563 = io_fu_3_valid ? _GEN_533 : _GEN_503; // @[ROB.scala 186:23]
  wire [1:0] _GEN_564 = io_fu_3_valid ? _GEN_534 : _GEN_504; // @[ROB.scala 186:23]
  wire [1:0] _GEN_565 = io_fu_3_valid ? _GEN_535 : _GEN_505; // @[ROB.scala 186:23]
  wire [1:0] _GEN_566 = io_fu_3_valid ? _GEN_536 : _GEN_506; // @[ROB.scala 186:23]
  wire [2:0] _T_65 = io_rs_0_bits_id - 3'h1; // @[ROB.scala 206:31]
  wire [1:0] _GEN_587 = 3'h0 == _T_65 ? 2'h1 : _GEN_562; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_588 = 3'h1 == _T_65 ? 2'h1 : _GEN_563; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_589 = 3'h2 == _T_65 ? 2'h1 : _GEN_564; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_590 = 3'h3 == _T_65 ? 2'h1 : _GEN_565; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_591 = 3'h4 == _T_65 ? 2'h1 : _GEN_566; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_592 = io_rs_0_valid ? _GEN_587 : _GEN_562; // @[ROB.scala 205:22]
  wire [1:0] _GEN_593 = io_rs_0_valid ? _GEN_588 : _GEN_563; // @[ROB.scala 205:22]
  wire [1:0] _GEN_594 = io_rs_0_valid ? _GEN_589 : _GEN_564; // @[ROB.scala 205:22]
  wire [1:0] _GEN_595 = io_rs_0_valid ? _GEN_590 : _GEN_565; // @[ROB.scala 205:22]
  wire [1:0] _GEN_596 = io_rs_0_valid ? _GEN_591 : _GEN_566; // @[ROB.scala 205:22]
  wire [2:0] _T_67 = io_rs_1_bits_id - 3'h1; // @[ROB.scala 206:31]
  wire [1:0] _GEN_597 = 3'h0 == _T_67 ? 2'h1 : _GEN_592; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_598 = 3'h1 == _T_67 ? 2'h1 : _GEN_593; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_599 = 3'h2 == _T_67 ? 2'h1 : _GEN_594; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_600 = 3'h3 == _T_67 ? 2'h1 : _GEN_595; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_601 = 3'h4 == _T_67 ? 2'h1 : _GEN_596; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_602 = io_rs_1_valid ? _GEN_597 : _GEN_592; // @[ROB.scala 205:22]
  wire [1:0] _GEN_603 = io_rs_1_valid ? _GEN_598 : _GEN_593; // @[ROB.scala 205:22]
  wire [1:0] _GEN_604 = io_rs_1_valid ? _GEN_599 : _GEN_594; // @[ROB.scala 205:22]
  wire [1:0] _GEN_605 = io_rs_1_valid ? _GEN_600 : _GEN_595; // @[ROB.scala 205:22]
  wire [1:0] _GEN_606 = io_rs_1_valid ? _GEN_601 : _GEN_596; // @[ROB.scala 205:22]
  wire [2:0] _T_69 = io_rs_2_bits_id - 3'h1; // @[ROB.scala 206:31]
  wire [1:0] _GEN_607 = 3'h0 == _T_69 ? 2'h1 : _GEN_602; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_608 = 3'h1 == _T_69 ? 2'h1 : _GEN_603; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_609 = 3'h2 == _T_69 ? 2'h1 : _GEN_604; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_610 = 3'h3 == _T_69 ? 2'h1 : _GEN_605; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_611 = 3'h4 == _T_69 ? 2'h1 : _GEN_606; // @[ROB.scala 206:{44,44}]
  wire [1:0] _GEN_612 = io_rs_2_valid ? _GEN_607 : _GEN_602; // @[ROB.scala 205:22]
  wire [1:0] _GEN_613 = io_rs_2_valid ? _GEN_608 : _GEN_603; // @[ROB.scala 205:22]
  wire [1:0] _GEN_614 = io_rs_2_valid ? _GEN_609 : _GEN_604; // @[ROB.scala 205:22]
  wire [1:0] _GEN_615 = io_rs_2_valid ? _GEN_610 : _GEN_605; // @[ROB.scala 205:22]
  wire [1:0] _GEN_616 = io_rs_2_valid ? _GEN_611 : _GEN_606; // @[ROB.scala 205:22]
  wire [2:0] _T_71 = io_rs_3_bits_id - 3'h1; // @[ROB.scala 206:31]
  assign io_enq_ready = ~full & ~_GEN_4; // @[ROB.scala 134:27]
  assign io_deq_valid = _GEN_9 == 2'h2 & _GEN_14; // @[ROB.scala 135:52]
  assign io_deq_bits_rdWrEn = _GEN_24 != 5'h0; // @[ROB.scala 138:44]
  assign io_deq_bits_rd = 3'h4 == head ? entries_4_rd : _GEN_23; // @[ROB.scala 137:{20,20}]
  assign io_deq_bits_data = 3'h4 == head ? entries_4_data : _GEN_18; // @[ROB.scala 136:{22,22}]
  assign io_deq_bits_id = {{5'd0}, _io_deq_bits_id_T_1}; // @[ROB.scala 145:20]
  assign io_deq_bits_brAddr = 3'h4 == head ? entries_4_brAddr : _GEN_38; // @[ROB.scala 141:{24,24}]
  assign io_deq_bits_brTaken = 3'h4 == head ? entries_4_brTaken : _GEN_43; // @[ROB.scala 142:{25,25}]
  assign io_deq_bits_excpAddr = 3'h4 == head ? entries_4_excpAddr : _GEN_48; // @[ROB.scala 143:{26,26}]
  assign io_deq_bits_excpValid = 3'h4 == head ? entries_4_excpValid : _GEN_53; // @[ROB.scala 144:{27,27}]
  assign io_deq_bits_pc = 3'h4 == head ? entries_4_pc : _GEN_28; // @[ROB.scala 139:{20,20}]
  assign io_deq_bits_inst = 3'h4 == head ? entries_4_inst : _GEN_33; // @[ROB.scala 140:{22,22}]
  assign io_read_0_busy = entries_0_busy; // @[ROB.scala 197:16]
  assign io_read_0_state = entries_0_state; // @[ROB.scala 199:17]
  assign io_read_0_rd = entries_0_rd; // @[ROB.scala 200:14]
  assign io_read_0_data = entries_0_data; // @[ROB.scala 198:16]
  assign io_read_1_busy = entries_1_busy; // @[ROB.scala 197:16]
  assign io_read_1_state = entries_1_state; // @[ROB.scala 199:17]
  assign io_read_1_rd = entries_1_rd; // @[ROB.scala 200:14]
  assign io_read_1_data = entries_1_data; // @[ROB.scala 198:16]
  assign io_read_2_busy = entries_2_busy; // @[ROB.scala 197:16]
  assign io_read_2_state = entries_2_state; // @[ROB.scala 199:17]
  assign io_read_2_rd = entries_2_rd; // @[ROB.scala 200:14]
  assign io_read_2_data = entries_2_data; // @[ROB.scala 198:16]
  assign io_read_3_busy = entries_3_busy; // @[ROB.scala 197:16]
  assign io_read_3_state = entries_3_state; // @[ROB.scala 199:17]
  assign io_read_3_rd = entries_3_rd; // @[ROB.scala 200:14]
  assign io_read_3_data = entries_3_data; // @[ROB.scala 198:16]
  assign io_read_4_busy = entries_4_busy; // @[ROB.scala 197:16]
  assign io_read_4_state = entries_4_state; // @[ROB.scala 199:17]
  assign io_read_4_rd = entries_4_rd; // @[ROB.scala 200:14]
  assign io_read_4_data = entries_4_data; // @[ROB.scala 198:16]
  assign io_id = tail + 3'h1; // @[ROB.scala 133:19]
  assign io_regStatus_0_owner = regResStat_0_owner; // @[ROB.scala 132:18]
  assign io_regStatus_1_owner = regResStat_1_owner; // @[ROB.scala 132:18]
  assign io_regStatus_2_owner = regResStat_2_owner; // @[ROB.scala 132:18]
  assign io_regStatus_3_owner = regResStat_3_owner; // @[ROB.scala 132:18]
  assign io_regStatus_4_owner = regResStat_4_owner; // @[ROB.scala 132:18]
  assign io_regStatus_5_owner = regResStat_5_owner; // @[ROB.scala 132:18]
  assign io_regStatus_6_owner = regResStat_6_owner; // @[ROB.scala 132:18]
  assign io_regStatus_7_owner = regResStat_7_owner; // @[ROB.scala 132:18]
  assign io_regStatus_8_owner = regResStat_8_owner; // @[ROB.scala 132:18]
  assign io_regStatus_9_owner = regResStat_9_owner; // @[ROB.scala 132:18]
  assign io_regStatus_10_owner = regResStat_10_owner; // @[ROB.scala 132:18]
  assign io_regStatus_11_owner = regResStat_11_owner; // @[ROB.scala 132:18]
  assign io_regStatus_12_owner = regResStat_12_owner; // @[ROB.scala 132:18]
  assign io_regStatus_13_owner = regResStat_13_owner; // @[ROB.scala 132:18]
  assign io_regStatus_14_owner = regResStat_14_owner; // @[ROB.scala 132:18]
  assign io_regStatus_15_owner = regResStat_15_owner; // @[ROB.scala 132:18]
  assign io_regStatus_16_owner = regResStat_16_owner; // @[ROB.scala 132:18]
  assign io_regStatus_17_owner = regResStat_17_owner; // @[ROB.scala 132:18]
  assign io_regStatus_18_owner = regResStat_18_owner; // @[ROB.scala 132:18]
  assign io_regStatus_19_owner = regResStat_19_owner; // @[ROB.scala 132:18]
  assign io_regStatus_20_owner = regResStat_20_owner; // @[ROB.scala 132:18]
  assign io_regStatus_21_owner = regResStat_21_owner; // @[ROB.scala 132:18]
  assign io_regStatus_22_owner = regResStat_22_owner; // @[ROB.scala 132:18]
  assign io_regStatus_23_owner = regResStat_23_owner; // @[ROB.scala 132:18]
  assign io_regStatus_24_owner = regResStat_24_owner; // @[ROB.scala 132:18]
  assign io_regStatus_25_owner = regResStat_25_owner; // @[ROB.scala 132:18]
  assign io_regStatus_26_owner = regResStat_26_owner; // @[ROB.scala 132:18]
  assign io_regStatus_27_owner = regResStat_27_owner; // @[ROB.scala 132:18]
  assign io_regStatus_28_owner = regResStat_28_owner; // @[ROB.scala 132:18]
  assign io_regStatus_29_owner = regResStat_29_owner; // @[ROB.scala 132:18]
  assign io_regStatus_30_owner = regResStat_30_owner; // @[ROB.scala 132:18]
  assign io_regStatus_31_owner = regResStat_31_owner; // @[ROB.scala 132:18]
  always @(posedge clock) begin
    if (io_flush) begin // @[ROB.scala 210:21]
      entries_0_busy <= 1'h0; // @[ROB.scala 211:37]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (3'h0 == head) begin // @[ROB.scala 163:28]
        entries_0_busy <= 1'h0; // @[ROB.scala 163:28]
      end else begin
        entries_0_busy <= _GEN_117;
      end
    end else begin
      entries_0_busy <= _GEN_117;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 205:22]
      if (3'h0 == _T_71) begin // @[ROB.scala 206:44]
        entries_0_state <= 2'h1; // @[ROB.scala 206:44]
      end else begin
        entries_0_state <= _GEN_612;
      end
    end else begin
      entries_0_state <= _GEN_612;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h0 == tail) begin // @[ROB.scala 152:26]
        entries_0_rd <= io_enq_bits_rd; // @[ROB.scala 152:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h0 == _T_53) begin // @[ROB.scala 187:43]
        entries_0_data <= io_fu_3_bits_data; // @[ROB.scala 187:43]
      end else begin
        entries_0_data <= _GEN_497;
      end
    end else begin
      entries_0_data <= _GEN_497;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h0 == _T_53) begin // @[ROB.scala 189:45]
        entries_0_brAddr <= 32'h0; // @[ROB.scala 189:45]
      end else begin
        entries_0_brAddr <= _GEN_507;
      end
    end else begin
      entries_0_brAddr <= _GEN_507;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h0 == _T_53) begin // @[ROB.scala 190:46]
        entries_0_brTaken <= 1'h0; // @[ROB.scala 190:46]
      end else begin
        entries_0_brTaken <= _GEN_512;
      end
    end else begin
      entries_0_brTaken <= _GEN_512;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h0 == _T_53) begin // @[ROB.scala 191:47]
        entries_0_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 191:47]
      end else begin
        entries_0_excpAddr <= _GEN_517;
      end
    end else begin
      entries_0_excpAddr <= _GEN_517;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h0 == _T_53) begin // @[ROB.scala 192:48]
        entries_0_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 192:48]
      end else begin
        entries_0_excpValid <= _GEN_522;
      end
    end else begin
      entries_0_excpValid <= _GEN_522;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h0 == tail) begin // @[ROB.scala 153:26]
        entries_0_pc <= io_enq_bits_pc; // @[ROB.scala 153:26]
      end
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h0 == tail) begin // @[ROB.scala 154:28]
        entries_0_inst <= io_enq_bits_inst; // @[ROB.scala 154:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      entries_1_busy <= 1'h0; // @[ROB.scala 211:37]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (3'h1 == head) begin // @[ROB.scala 163:28]
        entries_1_busy <= 1'h0; // @[ROB.scala 163:28]
      end else begin
        entries_1_busy <= _GEN_118;
      end
    end else begin
      entries_1_busy <= _GEN_118;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 205:22]
      if (3'h1 == _T_71) begin // @[ROB.scala 206:44]
        entries_1_state <= 2'h1; // @[ROB.scala 206:44]
      end else begin
        entries_1_state <= _GEN_613;
      end
    end else begin
      entries_1_state <= _GEN_613;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h1 == tail) begin // @[ROB.scala 152:26]
        entries_1_rd <= io_enq_bits_rd; // @[ROB.scala 152:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h1 == _T_53) begin // @[ROB.scala 187:43]
        entries_1_data <= io_fu_3_bits_data; // @[ROB.scala 187:43]
      end else begin
        entries_1_data <= _GEN_498;
      end
    end else begin
      entries_1_data <= _GEN_498;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h1 == _T_53) begin // @[ROB.scala 189:45]
        entries_1_brAddr <= 32'h0; // @[ROB.scala 189:45]
      end else begin
        entries_1_brAddr <= _GEN_508;
      end
    end else begin
      entries_1_brAddr <= _GEN_508;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h1 == _T_53) begin // @[ROB.scala 190:46]
        entries_1_brTaken <= 1'h0; // @[ROB.scala 190:46]
      end else begin
        entries_1_brTaken <= _GEN_513;
      end
    end else begin
      entries_1_brTaken <= _GEN_513;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h1 == _T_53) begin // @[ROB.scala 191:47]
        entries_1_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 191:47]
      end else begin
        entries_1_excpAddr <= _GEN_518;
      end
    end else begin
      entries_1_excpAddr <= _GEN_518;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h1 == _T_53) begin // @[ROB.scala 192:48]
        entries_1_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 192:48]
      end else begin
        entries_1_excpValid <= _GEN_523;
      end
    end else begin
      entries_1_excpValid <= _GEN_523;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h1 == tail) begin // @[ROB.scala 153:26]
        entries_1_pc <= io_enq_bits_pc; // @[ROB.scala 153:26]
      end
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h1 == tail) begin // @[ROB.scala 154:28]
        entries_1_inst <= io_enq_bits_inst; // @[ROB.scala 154:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      entries_2_busy <= 1'h0; // @[ROB.scala 211:37]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (3'h2 == head) begin // @[ROB.scala 163:28]
        entries_2_busy <= 1'h0; // @[ROB.scala 163:28]
      end else begin
        entries_2_busy <= _GEN_119;
      end
    end else begin
      entries_2_busy <= _GEN_119;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 205:22]
      if (3'h2 == _T_71) begin // @[ROB.scala 206:44]
        entries_2_state <= 2'h1; // @[ROB.scala 206:44]
      end else begin
        entries_2_state <= _GEN_614;
      end
    end else begin
      entries_2_state <= _GEN_614;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h2 == tail) begin // @[ROB.scala 152:26]
        entries_2_rd <= io_enq_bits_rd; // @[ROB.scala 152:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h2 == _T_53) begin // @[ROB.scala 187:43]
        entries_2_data <= io_fu_3_bits_data; // @[ROB.scala 187:43]
      end else begin
        entries_2_data <= _GEN_499;
      end
    end else begin
      entries_2_data <= _GEN_499;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h2 == _T_53) begin // @[ROB.scala 189:45]
        entries_2_brAddr <= 32'h0; // @[ROB.scala 189:45]
      end else begin
        entries_2_brAddr <= _GEN_509;
      end
    end else begin
      entries_2_brAddr <= _GEN_509;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h2 == _T_53) begin // @[ROB.scala 190:46]
        entries_2_brTaken <= 1'h0; // @[ROB.scala 190:46]
      end else begin
        entries_2_brTaken <= _GEN_514;
      end
    end else begin
      entries_2_brTaken <= _GEN_514;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h2 == _T_53) begin // @[ROB.scala 191:47]
        entries_2_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 191:47]
      end else begin
        entries_2_excpAddr <= _GEN_519;
      end
    end else begin
      entries_2_excpAddr <= _GEN_519;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h2 == _T_53) begin // @[ROB.scala 192:48]
        entries_2_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 192:48]
      end else begin
        entries_2_excpValid <= _GEN_524;
      end
    end else begin
      entries_2_excpValid <= _GEN_524;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h2 == tail) begin // @[ROB.scala 153:26]
        entries_2_pc <= io_enq_bits_pc; // @[ROB.scala 153:26]
      end
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h2 == tail) begin // @[ROB.scala 154:28]
        entries_2_inst <= io_enq_bits_inst; // @[ROB.scala 154:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      entries_3_busy <= 1'h0; // @[ROB.scala 211:37]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (3'h3 == head) begin // @[ROB.scala 163:28]
        entries_3_busy <= 1'h0; // @[ROB.scala 163:28]
      end else begin
        entries_3_busy <= _GEN_120;
      end
    end else begin
      entries_3_busy <= _GEN_120;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 205:22]
      if (3'h3 == _T_71) begin // @[ROB.scala 206:44]
        entries_3_state <= 2'h1; // @[ROB.scala 206:44]
      end else begin
        entries_3_state <= _GEN_615;
      end
    end else begin
      entries_3_state <= _GEN_615;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h3 == tail) begin // @[ROB.scala 152:26]
        entries_3_rd <= io_enq_bits_rd; // @[ROB.scala 152:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h3 == _T_53) begin // @[ROB.scala 187:43]
        entries_3_data <= io_fu_3_bits_data; // @[ROB.scala 187:43]
      end else begin
        entries_3_data <= _GEN_500;
      end
    end else begin
      entries_3_data <= _GEN_500;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h3 == _T_53) begin // @[ROB.scala 189:45]
        entries_3_brAddr <= 32'h0; // @[ROB.scala 189:45]
      end else begin
        entries_3_brAddr <= _GEN_510;
      end
    end else begin
      entries_3_brAddr <= _GEN_510;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h3 == _T_53) begin // @[ROB.scala 190:46]
        entries_3_brTaken <= 1'h0; // @[ROB.scala 190:46]
      end else begin
        entries_3_brTaken <= _GEN_515;
      end
    end else begin
      entries_3_brTaken <= _GEN_515;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h3 == _T_53) begin // @[ROB.scala 191:47]
        entries_3_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 191:47]
      end else begin
        entries_3_excpAddr <= _GEN_520;
      end
    end else begin
      entries_3_excpAddr <= _GEN_520;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h3 == _T_53) begin // @[ROB.scala 192:48]
        entries_3_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 192:48]
      end else begin
        entries_3_excpValid <= _GEN_525;
      end
    end else begin
      entries_3_excpValid <= _GEN_525;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h3 == tail) begin // @[ROB.scala 153:26]
        entries_3_pc <= io_enq_bits_pc; // @[ROB.scala 153:26]
      end
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h3 == tail) begin // @[ROB.scala 154:28]
        entries_3_inst <= io_enq_bits_inst; // @[ROB.scala 154:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      entries_4_busy <= 1'h0; // @[ROB.scala 211:37]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (3'h4 == head) begin // @[ROB.scala 163:28]
        entries_4_busy <= 1'h0; // @[ROB.scala 163:28]
      end else begin
        entries_4_busy <= _GEN_121;
      end
    end else begin
      entries_4_busy <= _GEN_121;
    end
    if (io_rs_3_valid) begin // @[ROB.scala 205:22]
      if (3'h4 == _T_71) begin // @[ROB.scala 206:44]
        entries_4_state <= 2'h1; // @[ROB.scala 206:44]
      end else begin
        entries_4_state <= _GEN_616;
      end
    end else begin
      entries_4_state <= _GEN_616;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h4 == tail) begin // @[ROB.scala 152:26]
        entries_4_rd <= io_enq_bits_rd; // @[ROB.scala 152:26]
      end
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h4 == _T_53) begin // @[ROB.scala 187:43]
        entries_4_data <= io_fu_3_bits_data; // @[ROB.scala 187:43]
      end else begin
        entries_4_data <= _GEN_501;
      end
    end else begin
      entries_4_data <= _GEN_501;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h4 == _T_53) begin // @[ROB.scala 189:45]
        entries_4_brAddr <= 32'h0; // @[ROB.scala 189:45]
      end else begin
        entries_4_brAddr <= _GEN_511;
      end
    end else begin
      entries_4_brAddr <= _GEN_511;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h4 == _T_53) begin // @[ROB.scala 190:46]
        entries_4_brTaken <= 1'h0; // @[ROB.scala 190:46]
      end else begin
        entries_4_brTaken <= _GEN_516;
      end
    end else begin
      entries_4_brTaken <= _GEN_516;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h4 == _T_53) begin // @[ROB.scala 191:47]
        entries_4_excpAddr <= io_fu_3_bits_excpAddr; // @[ROB.scala 191:47]
      end else begin
        entries_4_excpAddr <= _GEN_521;
      end
    end else begin
      entries_4_excpAddr <= _GEN_521;
    end
    if (io_fu_3_valid) begin // @[ROB.scala 186:23]
      if (3'h4 == _T_53) begin // @[ROB.scala 192:48]
        entries_4_excpValid <= io_fu_3_bits_excpValid; // @[ROB.scala 192:48]
      end else begin
        entries_4_excpValid <= _GEN_526;
      end
    end else begin
      entries_4_excpValid <= _GEN_526;
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h4 == tail) begin // @[ROB.scala 153:26]
        entries_4_pc <= io_enq_bits_pc; // @[ROB.scala 153:26]
      end
    end
    if (_T) begin // @[ROB.scala 148:24]
      if (3'h4 == tail) begin // @[ROB.scala 154:28]
        entries_4_inst <= io_enq_bits_inst; // @[ROB.scala 154:28]
      end
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_0_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h0 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_0_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_0_owner <= _GEN_142;
        end
      end else begin
        regResStat_0_owner <= _GEN_142;
      end
    end else begin
      regResStat_0_owner <= _GEN_142;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_1_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_1_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_1_owner <= _GEN_143;
        end
      end else begin
        regResStat_1_owner <= _GEN_143;
      end
    end else begin
      regResStat_1_owner <= _GEN_143;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_2_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h2 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_2_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_2_owner <= _GEN_144;
        end
      end else begin
        regResStat_2_owner <= _GEN_144;
      end
    end else begin
      regResStat_2_owner <= _GEN_144;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_3_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h3 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_3_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_3_owner <= _GEN_145;
        end
      end else begin
        regResStat_3_owner <= _GEN_145;
      end
    end else begin
      regResStat_3_owner <= _GEN_145;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_4_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h4 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_4_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_4_owner <= _GEN_146;
        end
      end else begin
        regResStat_4_owner <= _GEN_146;
      end
    end else begin
      regResStat_4_owner <= _GEN_146;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_5_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h5 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_5_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_5_owner <= _GEN_147;
        end
      end else begin
        regResStat_5_owner <= _GEN_147;
      end
    end else begin
      regResStat_5_owner <= _GEN_147;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_6_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h6 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_6_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_6_owner <= _GEN_148;
        end
      end else begin
        regResStat_6_owner <= _GEN_148;
      end
    end else begin
      regResStat_6_owner <= _GEN_148;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_7_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h7 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_7_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_7_owner <= _GEN_149;
        end
      end else begin
        regResStat_7_owner <= _GEN_149;
      end
    end else begin
      regResStat_7_owner <= _GEN_149;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_8_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h8 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_8_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_8_owner <= _GEN_150;
        end
      end else begin
        regResStat_8_owner <= _GEN_150;
      end
    end else begin
      regResStat_8_owner <= _GEN_150;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_9_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h9 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_9_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_9_owner <= _GEN_151;
        end
      end else begin
        regResStat_9_owner <= _GEN_151;
      end
    end else begin
      regResStat_9_owner <= _GEN_151;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_10_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'ha == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_10_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_10_owner <= _GEN_152;
        end
      end else begin
        regResStat_10_owner <= _GEN_152;
      end
    end else begin
      regResStat_10_owner <= _GEN_152;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_11_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'hb == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_11_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_11_owner <= _GEN_153;
        end
      end else begin
        regResStat_11_owner <= _GEN_153;
      end
    end else begin
      regResStat_11_owner <= _GEN_153;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_12_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'hc == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_12_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_12_owner <= _GEN_154;
        end
      end else begin
        regResStat_12_owner <= _GEN_154;
      end
    end else begin
      regResStat_12_owner <= _GEN_154;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_13_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'hd == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_13_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_13_owner <= _GEN_155;
        end
      end else begin
        regResStat_13_owner <= _GEN_155;
      end
    end else begin
      regResStat_13_owner <= _GEN_155;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_14_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'he == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_14_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_14_owner <= _GEN_156;
        end
      end else begin
        regResStat_14_owner <= _GEN_156;
      end
    end else begin
      regResStat_14_owner <= _GEN_156;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_15_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'hf == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_15_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_15_owner <= _GEN_157;
        end
      end else begin
        regResStat_15_owner <= _GEN_157;
      end
    end else begin
      regResStat_15_owner <= _GEN_157;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_16_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h10 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_16_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_16_owner <= _GEN_158;
        end
      end else begin
        regResStat_16_owner <= _GEN_158;
      end
    end else begin
      regResStat_16_owner <= _GEN_158;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_17_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h11 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_17_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_17_owner <= _GEN_159;
        end
      end else begin
        regResStat_17_owner <= _GEN_159;
      end
    end else begin
      regResStat_17_owner <= _GEN_159;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_18_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h12 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_18_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_18_owner <= _GEN_160;
        end
      end else begin
        regResStat_18_owner <= _GEN_160;
      end
    end else begin
      regResStat_18_owner <= _GEN_160;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_19_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h13 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_19_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_19_owner <= _GEN_161;
        end
      end else begin
        regResStat_19_owner <= _GEN_161;
      end
    end else begin
      regResStat_19_owner <= _GEN_161;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_20_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h14 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_20_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_20_owner <= _GEN_162;
        end
      end else begin
        regResStat_20_owner <= _GEN_162;
      end
    end else begin
      regResStat_20_owner <= _GEN_162;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_21_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h15 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_21_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_21_owner <= _GEN_163;
        end
      end else begin
        regResStat_21_owner <= _GEN_163;
      end
    end else begin
      regResStat_21_owner <= _GEN_163;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_22_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h16 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_22_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_22_owner <= _GEN_164;
        end
      end else begin
        regResStat_22_owner <= _GEN_164;
      end
    end else begin
      regResStat_22_owner <= _GEN_164;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_23_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h17 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_23_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_23_owner <= _GEN_165;
        end
      end else begin
        regResStat_23_owner <= _GEN_165;
      end
    end else begin
      regResStat_23_owner <= _GEN_165;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_24_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h18 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_24_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_24_owner <= _GEN_166;
        end
      end else begin
        regResStat_24_owner <= _GEN_166;
      end
    end else begin
      regResStat_24_owner <= _GEN_166;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_25_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h19 == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_25_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_25_owner <= _GEN_167;
        end
      end else begin
        regResStat_25_owner <= _GEN_167;
      end
    end else begin
      regResStat_25_owner <= _GEN_167;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_26_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1a == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_26_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_26_owner <= _GEN_168;
        end
      end else begin
        regResStat_26_owner <= _GEN_168;
      end
    end else begin
      regResStat_26_owner <= _GEN_168;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_27_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1b == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_27_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_27_owner <= _GEN_169;
        end
      end else begin
        regResStat_27_owner <= _GEN_169;
      end
    end else begin
      regResStat_27_owner <= _GEN_169;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_28_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1c == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_28_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_28_owner <= _GEN_170;
        end
      end else begin
        regResStat_28_owner <= _GEN_170;
      end
    end else begin
      regResStat_28_owner <= _GEN_170;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_29_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1d == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_29_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_29_owner <= _GEN_171;
        end
      end else begin
        regResStat_29_owner <= _GEN_171;
      end
    end else begin
      regResStat_29_owner <= _GEN_171;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_30_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1e == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_30_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_30_owner <= _GEN_172;
        end
      end else begin
        regResStat_30_owner <= _GEN_172;
      end
    end else begin
      regResStat_30_owner <= _GEN_172;
    end
    if (io_flush) begin // @[ROB.scala 210:21]
      regResStat_31_owner <= 8'h0; // @[ROB.scala 212:41]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (_GEN_226 == _GEN_672 & ~(_T & io_enq_bits_rd == _GEN_24)) begin // @[ROB.scala 169:111]
        if (5'h1f == _GEN_24) begin // @[ROB.scala 170:42]
          regResStat_31_owner <= 8'h0; // @[ROB.scala 170:42]
        end else begin
          regResStat_31_owner <= _GEN_173;
        end
      end else begin
        regResStat_31_owner <= _GEN_173;
      end
    end else begin
      regResStat_31_owner <= _GEN_173;
    end
    if (reset) begin // @[ROB.scala 121:23]
      head <= 3'h0; // @[ROB.scala 121:23]
    end else if (io_flush) begin // @[ROB.scala 210:21]
      head <= 3'h0; // @[ROB.scala 213:14]
    end else if (io_deq_valid) begin // @[ROB.scala 162:24]
      if (head == 3'h4) begin // @[ROB.scala 173:20]
        head <= 3'h0;
      end else begin
        head <= _io_deq_bits_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 122:23]
      tail <= 3'h0; // @[ROB.scala 122:23]
    end else if (io_flush) begin // @[ROB.scala 210:21]
      tail <= 3'h0; // @[ROB.scala 214:14]
    end else if (_T) begin // @[ROB.scala 148:24]
      if (tail == 3'h4) begin // @[ROB.scala 159:20]
        tail <= 3'h0;
      end else begin
        tail <= _io_id_T_1;
      end
    end
    if (reset) begin // @[ROB.scala 124:24]
      count <= 3'h0; // @[ROB.scala 124:24]
    end else if (io_flush) begin // @[ROB.scala 210:21]
      count <= 3'h0; // @[ROB.scala 215:15]
    end else if (~(io_deq_valid & _T)) begin // @[ROB.scala 176:43]
      if (io_deq_valid) begin // @[ROB.scala 180:27]
        count <= _count_T_3; // @[ROB.scala 181:19]
      end else begin
        count <= _GEN_344;
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
  entries_0_excpAddr = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_excpValid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_pc = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  entries_1_busy = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  entries_1_state = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  entries_1_rd = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_brAddr = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_brTaken = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_excpAddr = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_excpValid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_inst = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  entries_2_busy = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  entries_2_state = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  entries_2_rd = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  entries_2_data = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  entries_2_brAddr = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  entries_2_brTaken = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_excpAddr = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  entries_2_excpValid = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  entries_2_pc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  entries_2_inst = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  entries_3_busy = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  entries_3_state = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  entries_3_rd = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  entries_3_data = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  entries_3_brAddr = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  entries_3_brTaken = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  entries_3_excpAddr = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  entries_3_excpValid = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  entries_3_pc = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  entries_3_inst = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  entries_4_busy = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  entries_4_state = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  entries_4_rd = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  entries_4_data = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  entries_4_brAddr = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  entries_4_brTaken = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  entries_4_excpAddr = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  entries_4_excpValid = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  entries_4_pc = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  entries_4_inst = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  regResStat_0_owner = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  regResStat_1_owner = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  regResStat_2_owner = _RAND_52[7:0];
  _RAND_53 = {1{`RANDOM}};
  regResStat_3_owner = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  regResStat_4_owner = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  regResStat_5_owner = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  regResStat_6_owner = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  regResStat_7_owner = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  regResStat_8_owner = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  regResStat_9_owner = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  regResStat_10_owner = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  regResStat_11_owner = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  regResStat_12_owner = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  regResStat_13_owner = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  regResStat_14_owner = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  regResStat_15_owner = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  regResStat_16_owner = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  regResStat_17_owner = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  regResStat_18_owner = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  regResStat_19_owner = _RAND_69[7:0];
  _RAND_70 = {1{`RANDOM}};
  regResStat_20_owner = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  regResStat_21_owner = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  regResStat_22_owner = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  regResStat_23_owner = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  regResStat_24_owner = _RAND_74[7:0];
  _RAND_75 = {1{`RANDOM}};
  regResStat_25_owner = _RAND_75[7:0];
  _RAND_76 = {1{`RANDOM}};
  regResStat_26_owner = _RAND_76[7:0];
  _RAND_77 = {1{`RANDOM}};
  regResStat_27_owner = _RAND_77[7:0];
  _RAND_78 = {1{`RANDOM}};
  regResStat_28_owner = _RAND_78[7:0];
  _RAND_79 = {1{`RANDOM}};
  regResStat_29_owner = _RAND_79[7:0];
  _RAND_80 = {1{`RANDOM}};
  regResStat_30_owner = _RAND_80[7:0];
  _RAND_81 = {1{`RANDOM}};
  regResStat_31_owner = _RAND_81[7:0];
  _RAND_82 = {1{`RANDOM}};
  head = _RAND_82[2:0];
  _RAND_83 = {1{`RANDOM}};
  tail = _RAND_83[2:0];
  _RAND_84 = {1{`RANDOM}};
  count = _RAND_84[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
