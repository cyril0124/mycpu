module Core(
  input         clock,
  input         reset,
  input         io_in_start,
  output [31:0] io_out_state_intRegState_regState_0,
  output [31:0] io_out_state_intRegState_regState_1,
  output [31:0] io_out_state_intRegState_regState_2,
  output [31:0] io_out_state_intRegState_regState_3,
  output [31:0] io_out_state_intRegState_regState_4,
  output [31:0] io_out_state_intRegState_regState_5,
  output [31:0] io_out_state_intRegState_regState_6,
  output [31:0] io_out_state_intRegState_regState_7,
  output [31:0] io_out_state_intRegState_regState_8,
  output [31:0] io_out_state_intRegState_regState_9,
  output [31:0] io_out_state_intRegState_regState_10,
  output [31:0] io_out_state_intRegState_regState_11,
  output [31:0] io_out_state_intRegState_regState_12,
  output [31:0] io_out_state_intRegState_regState_13,
  output [31:0] io_out_state_intRegState_regState_14,
  output [31:0] io_out_state_intRegState_regState_15,
  output [31:0] io_out_state_intRegState_regState_16,
  output [31:0] io_out_state_intRegState_regState_17,
  output [31:0] io_out_state_intRegState_regState_18,
  output [31:0] io_out_state_intRegState_regState_19,
  output [31:0] io_out_state_intRegState_regState_20,
  output [31:0] io_out_state_intRegState_regState_21,
  output [31:0] io_out_state_intRegState_regState_22,
  output [31:0] io_out_state_intRegState_regState_23,
  output [31:0] io_out_state_intRegState_regState_24,
  output [31:0] io_out_state_intRegState_regState_25,
  output [31:0] io_out_state_intRegState_regState_26,
  output [31:0] io_out_state_intRegState_regState_27,
  output [31:0] io_out_state_intRegState_regState_28,
  output [31:0] io_out_state_intRegState_regState_29,
  output [31:0] io_out_state_intRegState_regState_30,
  output [31:0] io_out_state_intRegState_regState_31,
  output        io_out_state_instState_commit,
  output [31:0] io_out_state_instState_pc,
  output [31:0] io_out_state_instState_inst,
  output [31:0] io_out_state_csrState_mcycle,
  output [31:0] io_out_state_csrState_mcycleh
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
`endif // RANDOMIZE_REG_INIT
  wire  ib_clock; // @[Core_1.scala 50:20]
  wire  ib_reset; // @[Core_1.scala 50:20]
  wire  ib_io_in_ready; // @[Core_1.scala 50:20]
  wire  ib_io_in_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_data; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_addr; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_inst_0; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_inst_1; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_inst_2; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_icache_inst_3; // @[Core_1.scala 50:20]
  wire [2:0] ib_io_in_bits_icache_size; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_in_bits_pc; // @[Core_1.scala 50:20]
  wire  ib_io_in_bits_flush; // @[Core_1.scala 50:20]
  wire  ib_io_out_ready; // @[Core_1.scala 50:20]
  wire  ib_io_out_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_out_bits_inst_0_inst; // @[Core_1.scala 50:20]
  wire  ib_io_out_bits_inst_0_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_out_bits_inst_1_inst; // @[Core_1.scala 50:20]
  wire  ib_io_out_bits_inst_1_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_out_bits_inst_2_inst; // @[Core_1.scala 50:20]
  wire  ib_io_out_bits_inst_2_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_out_bits_inst_3_inst; // @[Core_1.scala 50:20]
  wire  ib_io_out_bits_inst_3_valid; // @[Core_1.scala 50:20]
  wire [31:0] ib_io_out_bits_pc; // @[Core_1.scala 50:20]
  wire  ib_io_status_back_pressure; // @[Core_1.scala 50:20]
  wire  ib_io_status_full; // @[Core_1.scala 50:20]
  wire  icache_clock; // @[Core_1.scala 52:24]
  wire  icache_reset; // @[Core_1.scala 52:24]
  wire  icache_io_read_req_ready; // @[Core_1.scala 52:24]
  wire  icache_io_read_req_valid; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_req_bits_addr; // @[Core_1.scala 52:24]
  wire  icache_io_read_resp_ready; // @[Core_1.scala 52:24]
  wire  icache_io_read_resp_valid; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_data; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_addr; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_inst_0; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_inst_1; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_inst_2; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_read_resp_bits_inst_3; // @[Core_1.scala 52:24]
  wire [2:0] icache_io_read_resp_bits_size; // @[Core_1.scala 52:24]
  wire  icache_io_tlbus_req_ready; // @[Core_1.scala 52:24]
  wire  icache_io_tlbus_req_valid; // @[Core_1.scala 52:24]
  wire [31:0] icache_io_tlbus_req_bits_address; // @[Core_1.scala 52:24]
  wire  icache_io_tlbus_resp_ready; // @[Core_1.scala 52:24]
  wire  icache_io_tlbus_resp_valid; // @[Core_1.scala 52:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[Core_1.scala 52:24]
  wire [127:0] icache_io_tlbus_resp_bits_data; // @[Core_1.scala 52:24]
  wire  icache_io_flush; // @[Core_1.scala 52:24]
  wire  rf_clock; // @[Core_1.scala 64:20]
  wire  rf_reset; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_0_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_0_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_1_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_1_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_2_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_2_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_3_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_3_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_4_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_4_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_5_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_5_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_6_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_6_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_r_7_addr; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_r_7_data; // @[Core_1.scala 64:20]
  wire [4:0] rf_io_w_0_addr; // @[Core_1.scala 64:20]
  wire  rf_io_w_0_en; // @[Core_1.scala 64:20]
  wire [31:0] rf_io_w_0_data; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_0; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_1; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_2; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_3; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_4; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_5; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_6; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_7; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_8; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_9; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_10; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_11; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_12; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_13; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_14; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_15; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_16; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_17; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_18; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_19; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_20; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_21; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_22; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_23; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_24; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_25; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_26; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_27; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_28; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_29; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_30; // @[Core_1.scala 64:20]
  wire [31:0] rf_regState_0_regState_31; // @[Core_1.scala 64:20]
  wire  rob_clock; // @[Core_1.scala 79:21]
  wire  rob_reset; // @[Core_1.scala 79:21]
  wire  rob_io_enq_ready; // @[Core_1.scala 79:21]
  wire  rob_io_enq_valid; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_enq_bits_rd; // @[Core_1.scala 79:21]
  wire [3:0] rob_io_enq_bits_fuValid; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_enq_bits_fuOp; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_enq_bits_pc; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_enq_bits_inst; // @[Core_1.scala 79:21]
  wire  rob_io_deq_ready; // @[Core_1.scala 79:21]
  wire  rob_io_deq_valid; // @[Core_1.scala 79:21]
  wire  rob_io_deq_bits_rdWrEn; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_deq_bits_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_deq_bits_data; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_deq_bits_id; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_deq_bits_brAddr; // @[Core_1.scala 79:21]
  wire  rob_io_deq_bits_brTaken; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_deq_bits_excpAddr; // @[Core_1.scala 79:21]
  wire  rob_io_deq_bits_excpValid; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_deq_bits_pc; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_deq_bits_inst; // @[Core_1.scala 79:21]
  wire  rob_io_rs_0_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_rs_0_bits_id; // @[Core_1.scala 79:21]
  wire  rob_io_rs_1_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_rs_1_bits_id; // @[Core_1.scala 79:21]
  wire  rob_io_rs_2_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_rs_2_bits_id; // @[Core_1.scala 79:21]
  wire  rob_io_rs_3_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_rs_3_bits_id; // @[Core_1.scala 79:21]
  wire  rob_io_read_0_busy; // @[Core_1.scala 79:21]
  wire [1:0] rob_io_read_0_state; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_read_0_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_read_0_data; // @[Core_1.scala 79:21]
  wire  rob_io_read_1_busy; // @[Core_1.scala 79:21]
  wire [1:0] rob_io_read_1_state; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_read_1_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_read_1_data; // @[Core_1.scala 79:21]
  wire  rob_io_read_2_busy; // @[Core_1.scala 79:21]
  wire [1:0] rob_io_read_2_state; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_read_2_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_read_2_data; // @[Core_1.scala 79:21]
  wire  rob_io_read_3_busy; // @[Core_1.scala 79:21]
  wire [1:0] rob_io_read_3_state; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_read_3_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_read_3_data; // @[Core_1.scala 79:21]
  wire  rob_io_read_4_busy; // @[Core_1.scala 79:21]
  wire [1:0] rob_io_read_4_state; // @[Core_1.scala 79:21]
  wire [4:0] rob_io_read_4_rd; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_read_4_data; // @[Core_1.scala 79:21]
  wire  rob_io_fu_0_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_fu_0_bits_id; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_0_bits_data; // @[Core_1.scala 79:21]
  wire  rob_io_fu_1_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_fu_1_bits_id; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_1_bits_data; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_1_bits_brAddr; // @[Core_1.scala 79:21]
  wire  rob_io_fu_1_bits_brTaken; // @[Core_1.scala 79:21]
  wire  rob_io_fu_2_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_fu_2_bits_id; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_2_bits_data; // @[Core_1.scala 79:21]
  wire  rob_io_fu_3_valid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_fu_3_bits_id; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_3_bits_data; // @[Core_1.scala 79:21]
  wire [31:0] rob_io_fu_3_bits_excpAddr; // @[Core_1.scala 79:21]
  wire  rob_io_fu_3_bits_excpValid; // @[Core_1.scala 79:21]
  wire [2:0] rob_io_id; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_0_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_1_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_2_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_3_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_4_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_5_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_6_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_7_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_8_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_9_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_10_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_11_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_12_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_13_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_14_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_15_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_16_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_17_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_18_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_19_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_20_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_21_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_22_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_23_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_24_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_25_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_26_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_27_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_28_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_29_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_30_owner; // @[Core_1.scala 79:21]
  wire [7:0] rob_io_regStatus_31_owner; // @[Core_1.scala 79:21]
  wire  rob_io_flush; // @[Core_1.scala 79:21]
  wire  aluStage_1_clock; // @[Core_1.scala 81:28]
  wire  aluStage_1_reset; // @[Core_1.scala 81:28]
  wire  aluStage_1_io_in_ready; // @[Core_1.scala 81:28]
  wire  aluStage_1_io_in_valid; // @[Core_1.scala 81:28]
  wire [3:0] aluStage_1_io_in_bits_opr1; // @[Core_1.scala 81:28]
  wire [3:0] aluStage_1_io_in_bits_opr2; // @[Core_1.scala 81:28]
  wire [4:0] aluStage_1_io_in_bits_aluOp; // @[Core_1.scala 81:28]
  wire [2:0] aluStage_1_io_in_bits_immSrc; // @[Core_1.scala 81:28]
  wire  aluStage_1_io_in_bits_immSign; // @[Core_1.scala 81:28]
  wire [31:0] aluStage_1_io_in_bits_rs1Val; // @[Core_1.scala 81:28]
  wire [31:0] aluStage_1_io_in_bits_rs2Val; // @[Core_1.scala 81:28]
  wire [31:0] aluStage_1_io_in_bits_inst; // @[Core_1.scala 81:28]
  wire [31:0] aluStage_1_io_in_bits_pc; // @[Core_1.scala 81:28]
  wire [7:0] aluStage_1_io_in_bits_id; // @[Core_1.scala 81:28]
  wire  aluStage_1_io_out_valid; // @[Core_1.scala 81:28]
  wire [31:0] aluStage_1_io_out_bits_data; // @[Core_1.scala 81:28]
  wire [7:0] aluStage_1_io_out_bits_id; // @[Core_1.scala 81:28]
  wire [4:0] aluStage_1_io_out_bits_rd; // @[Core_1.scala 81:28]
  wire  aluStage_1_io_flush; // @[Core_1.scala 81:28]
  wire  aluRS_clock; // @[Core_1.scala 82:23]
  wire  aluRS_reset; // @[Core_1.scala 82:23]
  wire  aluRS_io_enq_ready; // @[Core_1.scala 82:23]
  wire  aluRS_io_enq_valid; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_enq_bits_op; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_enq_bits_opr1; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_enq_bits_opr2; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_enq_bits_rs1; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_enq_bits_rs2; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_enq_bits_ROBId; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_enq_bits_rs1ROBId; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_enq_bits_rs2ROBId; // @[Core_1.scala 82:23]
  wire [2:0] aluRS_io_enq_bits_immSrc; // @[Core_1.scala 82:23]
  wire  aluRS_io_enq_bits_immSign; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_enq_bits_excpType; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_enq_bits_pc; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_enq_bits_inst; // @[Core_1.scala 82:23]
  wire  aluRS_io_deq_ready; // @[Core_1.scala 82:23]
  wire  aluRS_io_deq_valid; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_deq_bits_op; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_deq_bits_ROBId; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_deq_bits_opr1; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_deq_bits_opr2; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_deq_bits_rs1Val; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_deq_bits_rs2Val; // @[Core_1.scala 82:23]
  wire [2:0] aluRS_io_deq_bits_immSrc; // @[Core_1.scala 82:23]
  wire  aluRS_io_deq_bits_immSign; // @[Core_1.scala 82:23]
  wire [3:0] aluRS_io_deq_bits_excpType; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_deq_bits_pc; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_deq_bits_inst; // @[Core_1.scala 82:23]
  wire  aluRS_io_robOut_valid; // @[Core_1.scala 82:23]
  wire [2:0] aluRS_io_robOut_bits_id; // @[Core_1.scala 82:23]
  wire  aluRS_io_robRead_0_busy; // @[Core_1.scala 82:23]
  wire [1:0] aluRS_io_robRead_0_state; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_robRead_0_rd; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_robRead_0_data; // @[Core_1.scala 82:23]
  wire  aluRS_io_robRead_1_busy; // @[Core_1.scala 82:23]
  wire [1:0] aluRS_io_robRead_1_state; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_robRead_1_rd; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_robRead_1_data; // @[Core_1.scala 82:23]
  wire  aluRS_io_robRead_2_busy; // @[Core_1.scala 82:23]
  wire [1:0] aluRS_io_robRead_2_state; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_robRead_2_rd; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_robRead_2_data; // @[Core_1.scala 82:23]
  wire  aluRS_io_robRead_3_busy; // @[Core_1.scala 82:23]
  wire [1:0] aluRS_io_robRead_3_state; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_robRead_3_rd; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_robRead_3_data; // @[Core_1.scala 82:23]
  wire  aluRS_io_robRead_4_busy; // @[Core_1.scala 82:23]
  wire [1:0] aluRS_io_robRead_4_state; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_robRead_4_rd; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_robRead_4_data; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_0_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_1_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_2_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_3_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_4_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_5_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_6_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_7_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_8_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_9_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_10_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_11_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_12_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_13_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_14_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_15_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_16_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_17_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_18_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_19_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_20_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_21_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_22_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_23_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_24_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_25_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_26_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_27_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_28_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_29_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_30_owner; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_regStatus_31_owner; // @[Core_1.scala 82:23]
  wire  aluRS_io_cdb_0_valid; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_cdb_0_bits_data; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_cdb_0_bits_id; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_cdb_0_bits_rd; // @[Core_1.scala 82:23]
  wire  aluRS_io_cdb_1_valid; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_cdb_1_bits_data; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_cdb_1_bits_id; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_cdb_1_bits_rd; // @[Core_1.scala 82:23]
  wire  aluRS_io_cdb_2_valid; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_cdb_2_bits_data; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_cdb_2_bits_id; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_cdb_2_bits_rd; // @[Core_1.scala 82:23]
  wire  aluRS_io_cdb_3_valid; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_cdb_3_bits_data; // @[Core_1.scala 82:23]
  wire [7:0] aluRS_io_cdb_3_bits_id; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_cdb_3_bits_rd; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_rf_0_addr; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_rf_0_data; // @[Core_1.scala 82:23]
  wire [4:0] aluRS_io_rf_1_addr; // @[Core_1.scala 82:23]
  wire [31:0] aluRS_io_rf_1_data; // @[Core_1.scala 82:23]
  wire  aluRS_io_flush; // @[Core_1.scala 82:23]
  wire  bruStage_1_clock; // @[Core_1.scala 84:28]
  wire  bruStage_1_reset; // @[Core_1.scala 84:28]
  wire  bruStage_1_io_in_ready; // @[Core_1.scala 84:28]
  wire  bruStage_1_io_in_valid; // @[Core_1.scala 84:28]
  wire [3:0] bruStage_1_io_in_bits_opr1; // @[Core_1.scala 84:28]
  wire [3:0] bruStage_1_io_in_bits_opr2; // @[Core_1.scala 84:28]
  wire [3:0] bruStage_1_io_in_bits_bruOp; // @[Core_1.scala 84:28]
  wire [2:0] bruStage_1_io_in_bits_immSrc; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_in_bits_rs1Val; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_in_bits_rs2Val; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_in_bits_inst; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_in_bits_pc; // @[Core_1.scala 84:28]
  wire [7:0] bruStage_1_io_in_bits_id; // @[Core_1.scala 84:28]
  wire  bruStage_1_io_out_valid; // @[Core_1.scala 84:28]
  wire  bruStage_1_io_out_bits_brTaken; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_out_bits_brAddr; // @[Core_1.scala 84:28]
  wire [4:0] bruStage_1_io_out_bits_rd; // @[Core_1.scala 84:28]
  wire [31:0] bruStage_1_io_out_bits_data; // @[Core_1.scala 84:28]
  wire [7:0] bruStage_1_io_out_bits_id; // @[Core_1.scala 84:28]
  wire  bruStage_1_io_flush; // @[Core_1.scala 84:28]
  wire  bruRS_clock; // @[Core_1.scala 85:23]
  wire  bruRS_reset; // @[Core_1.scala 85:23]
  wire  bruRS_io_enq_ready; // @[Core_1.scala 85:23]
  wire  bruRS_io_enq_valid; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_enq_bits_op; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_enq_bits_opr1; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_enq_bits_opr2; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_enq_bits_rs1; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_enq_bits_rs2; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_enq_bits_ROBId; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_enq_bits_rs1ROBId; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_enq_bits_rs2ROBId; // @[Core_1.scala 85:23]
  wire [2:0] bruRS_io_enq_bits_immSrc; // @[Core_1.scala 85:23]
  wire  bruRS_io_enq_bits_immSign; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_enq_bits_excpType; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_enq_bits_pc; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_enq_bits_inst; // @[Core_1.scala 85:23]
  wire  bruRS_io_deq_ready; // @[Core_1.scala 85:23]
  wire  bruRS_io_deq_valid; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_deq_bits_op; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_deq_bits_ROBId; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_deq_bits_opr1; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_deq_bits_opr2; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_deq_bits_rs1Val; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_deq_bits_rs2Val; // @[Core_1.scala 85:23]
  wire [2:0] bruRS_io_deq_bits_immSrc; // @[Core_1.scala 85:23]
  wire  bruRS_io_deq_bits_immSign; // @[Core_1.scala 85:23]
  wire [3:0] bruRS_io_deq_bits_excpType; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_deq_bits_pc; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_deq_bits_inst; // @[Core_1.scala 85:23]
  wire  bruRS_io_robOut_valid; // @[Core_1.scala 85:23]
  wire [2:0] bruRS_io_robOut_bits_id; // @[Core_1.scala 85:23]
  wire  bruRS_io_robRead_0_busy; // @[Core_1.scala 85:23]
  wire [1:0] bruRS_io_robRead_0_state; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_robRead_0_rd; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_robRead_0_data; // @[Core_1.scala 85:23]
  wire  bruRS_io_robRead_1_busy; // @[Core_1.scala 85:23]
  wire [1:0] bruRS_io_robRead_1_state; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_robRead_1_rd; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_robRead_1_data; // @[Core_1.scala 85:23]
  wire  bruRS_io_robRead_2_busy; // @[Core_1.scala 85:23]
  wire [1:0] bruRS_io_robRead_2_state; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_robRead_2_rd; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_robRead_2_data; // @[Core_1.scala 85:23]
  wire  bruRS_io_robRead_3_busy; // @[Core_1.scala 85:23]
  wire [1:0] bruRS_io_robRead_3_state; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_robRead_3_rd; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_robRead_3_data; // @[Core_1.scala 85:23]
  wire  bruRS_io_robRead_4_busy; // @[Core_1.scala 85:23]
  wire [1:0] bruRS_io_robRead_4_state; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_robRead_4_rd; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_robRead_4_data; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_0_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_1_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_2_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_3_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_4_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_5_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_6_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_7_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_8_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_9_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_10_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_11_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_12_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_13_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_14_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_15_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_16_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_17_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_18_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_19_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_20_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_21_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_22_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_23_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_24_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_25_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_26_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_27_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_28_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_29_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_30_owner; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_regStatus_31_owner; // @[Core_1.scala 85:23]
  wire  bruRS_io_cdb_0_valid; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_cdb_0_bits_data; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_cdb_0_bits_id; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_cdb_0_bits_rd; // @[Core_1.scala 85:23]
  wire  bruRS_io_cdb_1_valid; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_cdb_1_bits_data; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_cdb_1_bits_id; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_cdb_1_bits_rd; // @[Core_1.scala 85:23]
  wire  bruRS_io_cdb_2_valid; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_cdb_2_bits_data; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_cdb_2_bits_id; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_cdb_2_bits_rd; // @[Core_1.scala 85:23]
  wire  bruRS_io_cdb_3_valid; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_cdb_3_bits_data; // @[Core_1.scala 85:23]
  wire [7:0] bruRS_io_cdb_3_bits_id; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_cdb_3_bits_rd; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_rf_0_addr; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_rf_0_data; // @[Core_1.scala 85:23]
  wire [4:0] bruRS_io_rf_1_addr; // @[Core_1.scala 85:23]
  wire [31:0] bruRS_io_rf_1_data; // @[Core_1.scala 85:23]
  wire  bruRS_io_flush; // @[Core_1.scala 85:23]
  wire  lsuStage_1_clock; // @[Core_1.scala 87:28]
  wire  lsuStage_1_reset; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_in_ready; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_in_valid; // @[Core_1.scala 87:28]
  wire [4:0] lsuStage_1_io_in_bits_lsuOp; // @[Core_1.scala 87:28]
  wire [2:0] lsuStage_1_io_in_bits_immSrc; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_in_bits_rs1Val; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_in_bits_rs2Val; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_in_bits_inst; // @[Core_1.scala 87:28]
  wire [7:0] lsuStage_1_io_in_bits_id; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_out_valid; // @[Core_1.scala 87:28]
  wire [4:0] lsuStage_1_io_out_bits_rd; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_out_bits_data; // @[Core_1.scala 87:28]
  wire [7:0] lsuStage_1_io_out_bits_id; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_read_req_ready; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_read_req_valid; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_cache_read_req_bits_addr; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_read_resp_ready; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_read_resp_valid; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_cache_read_resp_bits_data; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_write_req_ready; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_write_req_valid; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_cache_write_req_bits_addr; // @[Core_1.scala 87:28]
  wire [31:0] lsuStage_1_io_cache_write_req_bits_data; // @[Core_1.scala 87:28]
  wire [3:0] lsuStage_1_io_cache_write_req_bits_mask; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_write_resp_ready; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_cache_write_resp_valid; // @[Core_1.scala 87:28]
  wire [7:0] lsuStage_1_io_rob_bits_id; // @[Core_1.scala 87:28]
  wire  lsuStage_1_io_flush; // @[Core_1.scala 87:28]
  wire  lsuRS_clock; // @[Core_1.scala 88:23]
  wire  lsuRS_reset; // @[Core_1.scala 88:23]
  wire  lsuRS_io_enq_ready; // @[Core_1.scala 88:23]
  wire  lsuRS_io_enq_valid; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_enq_bits_op; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_enq_bits_opr1; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_enq_bits_opr2; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_enq_bits_rs1; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_enq_bits_rs2; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_enq_bits_ROBId; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_enq_bits_rs1ROBId; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_enq_bits_rs2ROBId; // @[Core_1.scala 88:23]
  wire [2:0] lsuRS_io_enq_bits_immSrc; // @[Core_1.scala 88:23]
  wire  lsuRS_io_enq_bits_immSign; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_enq_bits_excpType; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_enq_bits_pc; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_enq_bits_inst; // @[Core_1.scala 88:23]
  wire  lsuRS_io_deq_ready; // @[Core_1.scala 88:23]
  wire  lsuRS_io_deq_valid; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_deq_bits_op; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_deq_bits_ROBId; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_deq_bits_opr1; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_deq_bits_opr2; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_deq_bits_rs1Val; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_deq_bits_rs2Val; // @[Core_1.scala 88:23]
  wire [2:0] lsuRS_io_deq_bits_immSrc; // @[Core_1.scala 88:23]
  wire  lsuRS_io_deq_bits_immSign; // @[Core_1.scala 88:23]
  wire [3:0] lsuRS_io_deq_bits_excpType; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_deq_bits_pc; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_deq_bits_inst; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robOut_valid; // @[Core_1.scala 88:23]
  wire [2:0] lsuRS_io_robOut_bits_id; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robRead_0_busy; // @[Core_1.scala 88:23]
  wire [1:0] lsuRS_io_robRead_0_state; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_robRead_0_rd; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_robRead_0_data; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robRead_1_busy; // @[Core_1.scala 88:23]
  wire [1:0] lsuRS_io_robRead_1_state; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_robRead_1_rd; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_robRead_1_data; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robRead_2_busy; // @[Core_1.scala 88:23]
  wire [1:0] lsuRS_io_robRead_2_state; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_robRead_2_rd; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_robRead_2_data; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robRead_3_busy; // @[Core_1.scala 88:23]
  wire [1:0] lsuRS_io_robRead_3_state; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_robRead_3_rd; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_robRead_3_data; // @[Core_1.scala 88:23]
  wire  lsuRS_io_robRead_4_busy; // @[Core_1.scala 88:23]
  wire [1:0] lsuRS_io_robRead_4_state; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_robRead_4_rd; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_robRead_4_data; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_0_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_1_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_2_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_3_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_4_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_5_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_6_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_7_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_8_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_9_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_10_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_11_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_12_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_13_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_14_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_15_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_16_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_17_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_18_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_19_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_20_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_21_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_22_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_23_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_24_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_25_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_26_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_27_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_28_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_29_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_30_owner; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_regStatus_31_owner; // @[Core_1.scala 88:23]
  wire  lsuRS_io_cdb_0_valid; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_cdb_0_bits_data; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_cdb_0_bits_id; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_cdb_0_bits_rd; // @[Core_1.scala 88:23]
  wire  lsuRS_io_cdb_1_valid; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_cdb_1_bits_data; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_cdb_1_bits_id; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_cdb_1_bits_rd; // @[Core_1.scala 88:23]
  wire  lsuRS_io_cdb_2_valid; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_cdb_2_bits_data; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_cdb_2_bits_id; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_cdb_2_bits_rd; // @[Core_1.scala 88:23]
  wire  lsuRS_io_cdb_3_valid; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_cdb_3_bits_data; // @[Core_1.scala 88:23]
  wire [7:0] lsuRS_io_cdb_3_bits_id; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_cdb_3_bits_rd; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_rf_0_addr; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_rf_0_data; // @[Core_1.scala 88:23]
  wire [4:0] lsuRS_io_rf_1_addr; // @[Core_1.scala 88:23]
  wire [31:0] lsuRS_io_rf_1_data; // @[Core_1.scala 88:23]
  wire  lsuRS_io_flush; // @[Core_1.scala 88:23]
  wire  csrStage_1_clock; // @[Core_1.scala 90:28]
  wire  csrStage_1_reset; // @[Core_1.scala 90:28]
  wire  csrStage_1_io_in_ready; // @[Core_1.scala 90:28]
  wire  csrStage_1_io_in_valid; // @[Core_1.scala 90:28]
  wire [2:0] csrStage_1_io_in_bits_csrOp; // @[Core_1.scala 90:28]
  wire [3:0] csrStage_1_io_in_bits_excpType; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_io_in_bits_rs1Val; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_io_in_bits_inst; // @[Core_1.scala 90:28]
  wire [7:0] csrStage_1_io_in_bits_id; // @[Core_1.scala 90:28]
  wire  csrStage_1_io_out_valid; // @[Core_1.scala 90:28]
  wire [4:0] csrStage_1_io_out_bits_rd; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_io_out_bits_data; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_io_out_bits_excpAddr; // @[Core_1.scala 90:28]
  wire  csrStage_1_io_out_bits_excpValid; // @[Core_1.scala 90:28]
  wire [7:0] csrStage_1_io_out_bits_id; // @[Core_1.scala 90:28]
  wire  csrStage_1_io_flush; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_csrState_mcycle; // @[Core_1.scala 90:28]
  wire [31:0] csrStage_1_csrState_mcycleh; // @[Core_1.scala 90:28]
  wire  csrRS_clock; // @[Core_1.scala 91:23]
  wire  csrRS_reset; // @[Core_1.scala 91:23]
  wire  csrRS_io_enq_ready; // @[Core_1.scala 91:23]
  wire  csrRS_io_enq_valid; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_enq_bits_op; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_enq_bits_opr1; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_enq_bits_opr2; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_enq_bits_rs1; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_enq_bits_rs2; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_enq_bits_ROBId; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_enq_bits_rs1ROBId; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_enq_bits_rs2ROBId; // @[Core_1.scala 91:23]
  wire [2:0] csrRS_io_enq_bits_immSrc; // @[Core_1.scala 91:23]
  wire  csrRS_io_enq_bits_immSign; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_enq_bits_excpType; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_enq_bits_pc; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_enq_bits_inst; // @[Core_1.scala 91:23]
  wire  csrRS_io_deq_ready; // @[Core_1.scala 91:23]
  wire  csrRS_io_deq_valid; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_deq_bits_op; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_deq_bits_ROBId; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_deq_bits_opr1; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_deq_bits_opr2; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_deq_bits_rs1Val; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_deq_bits_rs2Val; // @[Core_1.scala 91:23]
  wire [2:0] csrRS_io_deq_bits_immSrc; // @[Core_1.scala 91:23]
  wire  csrRS_io_deq_bits_immSign; // @[Core_1.scala 91:23]
  wire [3:0] csrRS_io_deq_bits_excpType; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_deq_bits_pc; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_deq_bits_inst; // @[Core_1.scala 91:23]
  wire  csrRS_io_robOut_valid; // @[Core_1.scala 91:23]
  wire [2:0] csrRS_io_robOut_bits_id; // @[Core_1.scala 91:23]
  wire  csrRS_io_robRead_0_busy; // @[Core_1.scala 91:23]
  wire [1:0] csrRS_io_robRead_0_state; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_robRead_0_rd; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_robRead_0_data; // @[Core_1.scala 91:23]
  wire  csrRS_io_robRead_1_busy; // @[Core_1.scala 91:23]
  wire [1:0] csrRS_io_robRead_1_state; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_robRead_1_rd; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_robRead_1_data; // @[Core_1.scala 91:23]
  wire  csrRS_io_robRead_2_busy; // @[Core_1.scala 91:23]
  wire [1:0] csrRS_io_robRead_2_state; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_robRead_2_rd; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_robRead_2_data; // @[Core_1.scala 91:23]
  wire  csrRS_io_robRead_3_busy; // @[Core_1.scala 91:23]
  wire [1:0] csrRS_io_robRead_3_state; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_robRead_3_rd; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_robRead_3_data; // @[Core_1.scala 91:23]
  wire  csrRS_io_robRead_4_busy; // @[Core_1.scala 91:23]
  wire [1:0] csrRS_io_robRead_4_state; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_robRead_4_rd; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_robRead_4_data; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_0_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_1_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_2_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_3_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_4_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_5_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_6_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_7_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_8_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_9_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_10_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_11_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_12_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_13_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_14_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_15_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_16_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_17_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_18_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_19_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_20_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_21_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_22_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_23_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_24_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_25_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_26_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_27_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_28_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_29_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_30_owner; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_regStatus_31_owner; // @[Core_1.scala 91:23]
  wire  csrRS_io_cdb_0_valid; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_cdb_0_bits_data; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_cdb_0_bits_id; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_cdb_0_bits_rd; // @[Core_1.scala 91:23]
  wire  csrRS_io_cdb_1_valid; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_cdb_1_bits_data; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_cdb_1_bits_id; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_cdb_1_bits_rd; // @[Core_1.scala 91:23]
  wire  csrRS_io_cdb_2_valid; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_cdb_2_bits_data; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_cdb_2_bits_id; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_cdb_2_bits_rd; // @[Core_1.scala 91:23]
  wire  csrRS_io_cdb_3_valid; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_cdb_3_bits_data; // @[Core_1.scala 91:23]
  wire [7:0] csrRS_io_cdb_3_bits_id; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_cdb_3_bits_rd; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_rf_0_addr; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_rf_0_data; // @[Core_1.scala 91:23]
  wire [4:0] csrRS_io_rf_1_addr; // @[Core_1.scala 91:23]
  wire [31:0] csrRS_io_rf_1_data; // @[Core_1.scala 91:23]
  wire  csrRS_io_flush; // @[Core_1.scala 91:23]
  wire  edgeBackPressure_clock; // @[Core_1.scala 130:34]
  wire  edgeBackPressure_io_in; // @[Core_1.scala 130:34]
  wire  edgeBackPressure_io_change; // @[Core_1.scala 130:34]
  wire  fetch_pendingBranch_clock; // @[Core_1.scala 135:37]
  wire  fetch_pendingBranch_reset; // @[Core_1.scala 135:37]
  wire  fetch_pendingBranch_io_enq_ready; // @[Core_1.scala 135:37]
  wire  fetch_pendingBranch_io_enq_valid; // @[Core_1.scala 135:37]
  wire [31:0] fetch_pendingBranch_io_enq_bits; // @[Core_1.scala 135:37]
  wire  fetch_pendingBranch_io_deq_ready; // @[Core_1.scala 135:37]
  wire  fetch_pendingBranch_io_deq_valid; // @[Core_1.scala 135:37]
  wire [31:0] fetch_pendingBranch_io_deq_bits; // @[Core_1.scala 135:37]
  wire [31:0] dec_decoders_0_io_inst; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_0_io_out_brType; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_0_io_out_wbType; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_0_io_out_lsuOp; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_0_io_out_aluOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_0_io_out_opr1; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_0_io_out_opr2; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_0_io_out_immSrc; // @[Core_1.scala 198:53]
  wire  dec_decoders_0_io_out_immSign; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_0_io_out_csrOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_0_io_out_excpType; // @[Core_1.scala 198:53]
  wire [31:0] dec_decoders_1_io_inst; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_1_io_out_brType; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_1_io_out_wbType; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_1_io_out_lsuOp; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_1_io_out_aluOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_1_io_out_opr1; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_1_io_out_opr2; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_1_io_out_immSrc; // @[Core_1.scala 198:53]
  wire  dec_decoders_1_io_out_immSign; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_1_io_out_csrOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_1_io_out_excpType; // @[Core_1.scala 198:53]
  wire [31:0] dec_decoders_2_io_inst; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_2_io_out_brType; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_2_io_out_wbType; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_2_io_out_lsuOp; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_2_io_out_aluOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_2_io_out_opr1; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_2_io_out_opr2; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_2_io_out_immSrc; // @[Core_1.scala 198:53]
  wire  dec_decoders_2_io_out_immSign; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_2_io_out_csrOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_2_io_out_excpType; // @[Core_1.scala 198:53]
  wire [31:0] dec_decoders_3_io_inst; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_3_io_out_brType; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_3_io_out_wbType; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_3_io_out_lsuOp; // @[Core_1.scala 198:53]
  wire [4:0] dec_decoders_3_io_out_aluOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_3_io_out_opr1; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_3_io_out_opr2; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_3_io_out_immSrc; // @[Core_1.scala 198:53]
  wire  dec_decoders_3_io_out_immSign; // @[Core_1.scala 198:53]
  wire [2:0] dec_decoders_3_io_out_csrOp; // @[Core_1.scala 198:53]
  wire [3:0] dec_decoders_3_io_out_excpType; // @[Core_1.scala 198:53]
  wire  dcache_clock; // @[Core_1.scala 570:24]
  wire  dcache_reset; // @[Core_1.scala 570:24]
  wire  dcache_io_read_req_ready; // @[Core_1.scala 570:24]
  wire  dcache_io_read_req_valid; // @[Core_1.scala 570:24]
  wire [31:0] dcache_io_read_req_bits_addr; // @[Core_1.scala 570:24]
  wire  dcache_io_read_resp_ready; // @[Core_1.scala 570:24]
  wire  dcache_io_read_resp_valid; // @[Core_1.scala 570:24]
  wire [31:0] dcache_io_read_resp_bits_data; // @[Core_1.scala 570:24]
  wire  dcache_io_write_req_ready; // @[Core_1.scala 570:24]
  wire  dcache_io_write_req_valid; // @[Core_1.scala 570:24]
  wire [31:0] dcache_io_write_req_bits_addr; // @[Core_1.scala 570:24]
  wire [31:0] dcache_io_write_req_bits_data; // @[Core_1.scala 570:24]
  wire [3:0] dcache_io_write_req_bits_mask; // @[Core_1.scala 570:24]
  wire  dcache_io_write_resp_ready; // @[Core_1.scala 570:24]
  wire  dcache_io_write_resp_valid; // @[Core_1.scala 570:24]
  wire  dcache_io_tlbus_req_ready; // @[Core_1.scala 570:24]
  wire  dcache_io_tlbus_req_valid; // @[Core_1.scala 570:24]
  wire [2:0] dcache_io_tlbus_req_bits_opcode; // @[Core_1.scala 570:24]
  wire [31:0] dcache_io_tlbus_req_bits_address; // @[Core_1.scala 570:24]
  wire [127:0] dcache_io_tlbus_req_bits_data; // @[Core_1.scala 570:24]
  wire  dcache_io_tlbus_resp_valid; // @[Core_1.scala 570:24]
  wire [2:0] dcache_io_tlbus_resp_bits_opcode; // @[Core_1.scala 570:24]
  wire [127:0] dcache_io_tlbus_resp_bits_data; // @[Core_1.scala 570:24]
  wire  dcache_io_flush; // @[Core_1.scala 570:24]
  wire  xbar_clock; // @[Core_1.scala 695:22]
  wire  xbar_reset; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_in_0_ready; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_in_0_valid; // @[Core_1.scala 695:22]
  wire [31:0] xbar_io_masterFace_in_0_bits_address; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_in_1_ready; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_in_1_valid; // @[Core_1.scala 695:22]
  wire [2:0] xbar_io_masterFace_in_1_bits_opcode; // @[Core_1.scala 695:22]
  wire [31:0] xbar_io_masterFace_in_1_bits_address; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_masterFace_in_1_bits_data; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_out_0_valid; // @[Core_1.scala 695:22]
  wire [2:0] xbar_io_masterFace_out_0_bits_opcode; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_masterFace_out_0_bits_data; // @[Core_1.scala 695:22]
  wire  xbar_io_masterFace_out_1_valid; // @[Core_1.scala 695:22]
  wire [2:0] xbar_io_masterFace_out_1_bits_opcode; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_masterFace_out_1_bits_data; // @[Core_1.scala 695:22]
  wire  xbar_io_slaveFace_in_0_ready; // @[Core_1.scala 695:22]
  wire  xbar_io_slaveFace_in_0_valid; // @[Core_1.scala 695:22]
  wire [2:0] xbar_io_slaveFace_in_0_bits_opcode; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_size; // @[Core_1.scala 695:22]
  wire [31:0] xbar_io_slaveFace_in_0_bits_address; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_data; // @[Core_1.scala 695:22]
  wire  xbar_io_slaveFace_out_0_ready; // @[Core_1.scala 695:22]
  wire  xbar_io_slaveFace_out_0_valid; // @[Core_1.scala 695:22]
  wire [2:0] xbar_io_slaveFace_out_0_bits_opcode; // @[Core_1.scala 695:22]
  wire [127:0] xbar_io_slaveFace_out_0_bits_data; // @[Core_1.scala 695:22]
  wire  rom_clock; // @[Core_1.scala 696:21]
  wire  rom_reset; // @[Core_1.scala 696:21]
  wire  rom_io_req_ready; // @[Core_1.scala 696:21]
  wire  rom_io_req_valid; // @[Core_1.scala 696:21]
  wire [2:0] rom_io_req_bits_opcode; // @[Core_1.scala 696:21]
  wire [127:0] rom_io_req_bits_size; // @[Core_1.scala 696:21]
  wire [31:0] rom_io_req_bits_address; // @[Core_1.scala 696:21]
  wire [127:0] rom_io_req_bits_data; // @[Core_1.scala 696:21]
  wire  rom_io_resp_ready; // @[Core_1.scala 696:21]
  wire  rom_io_resp_valid; // @[Core_1.scala 696:21]
  wire [2:0] rom_io_resp_bits_opcode; // @[Core_1.scala 696:21]
  wire [127:0] rom_io_resp_bits_size; // @[Core_1.scala 696:21]
  wire [127:0] rom_io_resp_bits_data; // @[Core_1.scala 696:21]
  wire  _csrExcpValid_T = rob_io_deq_ready & rob_io_deq_valid; // @[Decoupled.scala 51:35]
  wire  csrExcpValid = rob_io_deq_bits_excpValid & _csrExcpValid_T; // @[Core_1.scala 664:47]
  wire  bruBrTaken = rob_io_deq_bits_brTaken & _csrExcpValid_T; // @[Core_1.scala 662:43]
  wire  globalBrTaken = csrExcpValid | bruBrTaken; // @[Core_1.scala 104:38]
  wire [31:0] csrExcpAddr = rob_io_deq_bits_excpAddr; // @[Core_1.scala 102:31 665:17]
  wire [31:0] bruBrAddr = rob_io_deq_bits_brAddr; // @[Core_1.scala 663:15 99:29]
  wire [31:0] globalBrAddr = csrExcpValid ? csrExcpAddr : bruBrAddr; // @[Core_1.scala 105:27]
  reg [31:0] pcReg; // @[Core_1.scala 114:24]
  wire  isAlignAddr = ~(|pcReg[3:0]); // @[Core_1.scala 117:23]
  wire  _lastPc_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] lastPc; // @[Reg.scala 19:16]
  wire [31:0] _pcNext4_T_1 = pcReg + 32'h10; // @[Core_1.scala 120:31]
  wire [4:0] _GEN_108 = {{1'd0}, lastPc[3:0]}; // @[Core_1.scala 121:45]
  wire [4:0] _pcNext4_T_4 = 5'h10 - _GEN_108; // @[Core_1.scala 121:45]
  wire [4:0] _pcNext4_T_6 = {_pcNext4_T_4[4:2], 2'h0}; // @[Core_1.scala 121:82]
  wire [31:0] _GEN_109 = {{27'd0}, _pcNext4_T_6}; // @[Core_1.scala 121:32]
  wire [31:0] _pcNext4_T_8 = lastPc + _GEN_109; // @[Core_1.scala 121:32]
  wire [31:0] pcNext4 = isAlignAddr ? _pcNext4_T_1 : _pcNext4_T_8; // @[Core_1.scala 119:22]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_3 = _lastPc_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  brTaken = fetch_pendingBranch_io_deq_ready & fetch_pendingBranch_io_deq_valid; // @[Decoupled.scala 51:35]
  wire  _preFetchInst_T_2 = ~firstFire; // @[Core_1.scala 143:26]
  wire  fetch_fire = icache_io_read_resp_valid; // @[Core_1.scala 161:17 94:27]
  wire  _preFetchInst_T_6 = (fetch_fire | edgeBackPressure_io_change) & ~ib_io_status_back_pressure | brTaken; // @[Core_1.scala 144:107]
  wire  _preFetchInst_T_7 = ~firstFire & _preFetchInst_T_6; // @[Core_1.scala 143:37]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | _preFetchInst_T_7; // @[Core_1.scala 142:59]
  wire [31:0] pcNext = brTaken ? fetch_pendingBranch_io_deq_bits : pcNext4; // @[Core_1.scala 159:18]
  wire [31:0] _icache_io_read_req_bits_addr_T_1 = firstFire ? pcReg : pcNext; // @[Core_1.scala 151:69]
  wire [31:0] _icache_io_read_req_bits_addr_T_2 = brTaken ? fetch_pendingBranch_io_deq_bits : pcReg; // @[Core_1.scala 151:100]
  reg [31:0] blockAddr; // @[Reg.scala 19:16]
  reg  blockValid; // @[Core_1.scala 166:29]
  wire  willBlock = (globalBrTaken | brTaken) & icache_io_read_resp_bits_addr != globalBrAddr; // @[Core_1.scala 167:48]
  wire  willWakeUp = blockValid & icache_io_read_resp_valid & icache_io_read_resp_bits_addr == blockAddr; // @[Core_1.scala 168:62]
  wire  _GEN_6 = willWakeUp ? 1'h0 : blockValid; // @[Core_1.scala 170:27 166:29 170:40]
  wire  _GEN_7 = willBlock | _GEN_6; // @[Core_1.scala 169:{21,34}]
  wire  icacheRespIsAlignAddr = ~(|icache_io_read_resp_bits_addr[3:0]); // @[Core_1.scala 109:9]
  wire [2:0] _GEN_110 = {{1'd0}, icache_io_read_resp_bits_addr[3:2]}; // @[Core_1.scala 177:93]
  wire [2:0] _ib_io_in_bits_icache_size_T_2 = 3'h4 - _GEN_110; // @[Core_1.scala 177:93]
  wire  _ib_io_in_bits_flush_T_1 = globalBrTaken | reset; // @[Core_1.scala 179:42]
  reg  dec_full; // @[Core_1.scala 186:27]
  wire  _dec_valid_T = ~_ib_io_in_bits_flush_T_1; // @[Core_1.scala 209:30]
  wire  dec_valid = dec_full & ~_ib_io_in_bits_flush_T_1; // @[Core_1.scala 209:27]
  reg  issue_full; // @[Core_1.scala 224:29]
  wire  _issue_ready_T = ~issue_full; // @[Core_1.scala 241:20]
  reg [1:0] issue_ptr; // @[Core_1.scala 231:28]
  reg [3:0] issue_instValid; // @[Reg.scala 19:16]
  wire [1:0] _issue_instSize_T_4 = issue_instValid[0] + issue_instValid[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _issue_instSize_T_6 = issue_instValid[2] + issue_instValid[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _issue_instSize_T_8 = _issue_instSize_T_4 + _issue_instSize_T_6; // @[Bitwise.scala 51:90]
  wire [2:0] issue_instSize = _issue_instSize_T_8 - 3'h1; // @[Core_1.scala 229:52]
  wire [2:0] _GEN_111 = {{1'd0}, issue_ptr}; // @[Core_1.scala 247:32]
  wire  issue_instFire = rob_io_enq_ready & rob_io_enq_valid; // @[Decoupled.scala 51:35]
  wire  issue_fire = _GEN_111 == issue_instSize & issue_instFire & _dec_valid_T; // @[Core_1.scala 247:71]
  wire  issue_ready = ~issue_full | issue_fire; // @[Core_1.scala 241:32]
  wire  dec_fire = dec_valid & issue_ready; // @[Core_1.scala 187:30]
  wire  dec_ready = ~dec_full | dec_fire; // @[Core_1.scala 193:28]
  wire  dec_latch = ib_io_out_valid & dec_ready; // @[Core_1.scala 185:37]
  reg [31:0] dec_inst_0_inst; // @[Reg.scala 19:16]
  reg  dec_inst_0_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_1_inst; // @[Reg.scala 19:16]
  reg  dec_inst_1_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_2_inst; // @[Reg.scala 19:16]
  reg  dec_inst_2_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_3_inst; // @[Reg.scala 19:16]
  reg  dec_inst_3_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_pc; // @[Reg.scala 19:16]
  wire  _GEN_17 = dec_full & dec_fire ? 1'h0 : dec_full; // @[Core_1.scala 186:27 195:{37,48}]
  wire  _GEN_18 = dec_latch | _GEN_17; // @[Core_1.scala 194:{21,32}]
  reg [31:0] issue_pc; // @[Reg.scala 19:16]
  reg [3:0] issue_decodeSigs_0_brType; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_0_lsuOp; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_0_aluOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_0_opr1; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_0_opr2; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_0_immSrc; // @[Core_1.scala 226:31]
  reg  issue_decodeSigs_0_immSign; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_0_csrOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_0_excpType; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_1_brType; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_1_lsuOp; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_1_aluOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_1_opr1; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_1_opr2; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_1_immSrc; // @[Core_1.scala 226:31]
  reg  issue_decodeSigs_1_immSign; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_1_csrOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_1_excpType; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_2_brType; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_2_lsuOp; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_2_aluOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_2_opr1; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_2_opr2; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_2_immSrc; // @[Core_1.scala 226:31]
  reg  issue_decodeSigs_2_immSign; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_2_csrOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_2_excpType; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_3_brType; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_3_lsuOp; // @[Core_1.scala 226:31]
  reg [4:0] issue_decodeSigs_3_aluOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_3_opr1; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_3_opr2; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_3_immSrc; // @[Core_1.scala 226:31]
  reg  issue_decodeSigs_3_immSign; // @[Core_1.scala 226:31]
  reg [2:0] issue_decodeSigs_3_csrOp; // @[Core_1.scala 226:31]
  reg [3:0] issue_decodeSigs_3_excpType; // @[Core_1.scala 226:31]
  wire [3:0] _issue_instValid_T = {dec_inst_0_valid,dec_inst_1_valid,dec_inst_2_valid,dec_inst_3_valid}; // @[Cat.scala 33:92]
  reg [31:0] issue_inst_0; // @[Core_1.scala 228:25]
  reg [31:0] issue_inst_1; // @[Core_1.scala 228:25]
  reg [31:0] issue_inst_2; // @[Core_1.scala 228:25]
  reg [31:0] issue_inst_3; // @[Core_1.scala 228:25]
  wire [3:0] dec_decodeSigs_0_brType = dec_decoders_0_io_out_brType; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_0_wbType = dec_decoders_0_io_out_wbType; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_0_lsuOp = dec_decoders_0_io_out_lsuOp; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_0_aluOp = dec_decoders_0_io_out_aluOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_0_opr1 = dec_decoders_0_io_out_opr1; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_0_opr2 = dec_decoders_0_io_out_opr2; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_0_immSrc = dec_decoders_0_io_out_immSrc; // @[Core_1.scala 199:57 202:27]
  wire  dec_decodeSigs_0_immSign = dec_decoders_0_io_out_immSign; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_0_csrOp = dec_decoders_0_io_out_csrOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_0_excpType = dec_decoders_0_io_out_excpType; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_1_brType = dec_decoders_1_io_out_brType; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_1_wbType = dec_decoders_1_io_out_wbType; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_1_lsuOp = dec_decoders_1_io_out_lsuOp; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_1_aluOp = dec_decoders_1_io_out_aluOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_1_opr1 = dec_decoders_1_io_out_opr1; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_1_opr2 = dec_decoders_1_io_out_opr2; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_1_immSrc = dec_decoders_1_io_out_immSrc; // @[Core_1.scala 199:57 202:27]
  wire  dec_decodeSigs_1_immSign = dec_decoders_1_io_out_immSign; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_1_csrOp = dec_decoders_1_io_out_csrOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_1_excpType = dec_decoders_1_io_out_excpType; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_2_brType = dec_decoders_2_io_out_brType; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_2_wbType = dec_decoders_2_io_out_wbType; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_2_lsuOp = dec_decoders_2_io_out_lsuOp; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_2_aluOp = dec_decoders_2_io_out_aluOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_2_opr1 = dec_decoders_2_io_out_opr1; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_2_opr2 = dec_decoders_2_io_out_opr2; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_2_immSrc = dec_decoders_2_io_out_immSrc; // @[Core_1.scala 199:57 202:27]
  wire  dec_decodeSigs_2_immSign = dec_decoders_2_io_out_immSign; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_2_csrOp = dec_decoders_2_io_out_csrOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_2_excpType = dec_decoders_2_io_out_excpType; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_3_brType = dec_decoders_3_io_out_brType; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_3_wbType = dec_decoders_3_io_out_wbType; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_3_lsuOp = dec_decoders_3_io_out_lsuOp; // @[Core_1.scala 199:57 202:27]
  wire [4:0] dec_decodeSigs_3_aluOp = dec_decoders_3_io_out_aluOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_3_opr1 = dec_decoders_3_io_out_opr1; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_3_opr2 = dec_decoders_3_io_out_opr2; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_3_immSrc = dec_decoders_3_io_out_immSrc; // @[Core_1.scala 199:57 202:27]
  wire  dec_decodeSigs_3_immSign = dec_decoders_3_io_out_immSign; // @[Core_1.scala 199:57 202:27]
  wire [2:0] dec_decodeSigs_3_csrOp = dec_decoders_3_io_out_csrOp; // @[Core_1.scala 199:57 202:27]
  wire [3:0] dec_decodeSigs_3_excpType = dec_decoders_3_io_out_excpType; // @[Core_1.scala 199:57 202:27]
  wire  _GEN_70 = issue_full & issue_fire ? 1'h0 : issue_full; // @[Core_1.scala 224:29 243:{41,54}]
  wire  _GEN_71 = dec_fire | _GEN_70; // @[Core_1.scala 242:{23,36}]
  wire [1:0] _issue_ptr_T_1 = issue_ptr + 2'h1; // @[Core_1.scala 249:56]
  wire [3:0] _issue_chosenDecodesigs_T = 4'h1 << issue_ptr; // @[OneHot.scala 57:35]
  wire [3:0] _issue_chosenDecodesigs_T_5 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_excpType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_6 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_excpType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_7 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_excpType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_8 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_excpType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_9 = _issue_chosenDecodesigs_T_5 | _issue_chosenDecodesigs_T_6; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_10 = _issue_chosenDecodesigs_T_9 | _issue_chosenDecodesigs_T_7; // @[Mux.scala 27:73]
  wire [3:0] issue_chosenDecodesigs_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_12 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_csrOp : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_13 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_csrOp : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_14 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_csrOp : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_15 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_csrOp : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_16 = _issue_chosenDecodesigs_T_12 | _issue_chosenDecodesigs_T_13; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_17 = _issue_chosenDecodesigs_T_16 | _issue_chosenDecodesigs_T_14; // @[Mux.scala 27:73]
  wire [2:0] issue_chosenDecodesigs_csrOp = _issue_chosenDecodesigs_T_17 | _issue_chosenDecodesigs_T_15; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_26 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_immSrc : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_27 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_immSrc : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_28 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_immSrc : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_29 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_immSrc : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_30 = _issue_chosenDecodesigs_T_26 | _issue_chosenDecodesigs_T_27; // @[Mux.scala 27:73]
  wire [2:0] _issue_chosenDecodesigs_T_31 = _issue_chosenDecodesigs_T_30 | _issue_chosenDecodesigs_T_28; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_33 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_opr2 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_34 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_opr2 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_35 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_opr2 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_36 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_opr2 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_37 = _issue_chosenDecodesigs_T_33 | _issue_chosenDecodesigs_T_34; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_38 = _issue_chosenDecodesigs_T_37 | _issue_chosenDecodesigs_T_35; // @[Mux.scala 27:73]
  wire [3:0] issue_chosenDecodesigs_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_40 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_opr1 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_41 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_opr1 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_42 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_opr1 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_43 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_opr1 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_44 = _issue_chosenDecodesigs_T_40 | _issue_chosenDecodesigs_T_41; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_45 = _issue_chosenDecodesigs_T_44 | _issue_chosenDecodesigs_T_42; // @[Mux.scala 27:73]
  wire [3:0] issue_chosenDecodesigs_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_47 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_aluOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_48 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_aluOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_49 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_aluOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_50 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_aluOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_51 = _issue_chosenDecodesigs_T_47 | _issue_chosenDecodesigs_T_48; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_52 = _issue_chosenDecodesigs_T_51 | _issue_chosenDecodesigs_T_49; // @[Mux.scala 27:73]
  wire [4:0] issue_chosenDecodesigs_aluOp = _issue_chosenDecodesigs_T_52 | _issue_chosenDecodesigs_T_50; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_54 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_lsuOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_55 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_lsuOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_56 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_lsuOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_57 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_lsuOp : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_58 = _issue_chosenDecodesigs_T_54 | _issue_chosenDecodesigs_T_55; // @[Mux.scala 27:73]
  wire [4:0] _issue_chosenDecodesigs_T_59 = _issue_chosenDecodesigs_T_58 | _issue_chosenDecodesigs_T_56; // @[Mux.scala 27:73]
  wire [4:0] issue_chosenDecodesigs_lsuOp = _issue_chosenDecodesigs_T_59 | _issue_chosenDecodesigs_T_57; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_68 = _issue_chosenDecodesigs_T[0] ? issue_decodeSigs_0_brType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_69 = _issue_chosenDecodesigs_T[1] ? issue_decodeSigs_1_brType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_70 = _issue_chosenDecodesigs_T[2] ? issue_decodeSigs_2_brType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_71 = _issue_chosenDecodesigs_T[3] ? issue_decodeSigs_3_brType : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_72 = _issue_chosenDecodesigs_T_68 | _issue_chosenDecodesigs_T_69; // @[Mux.scala 27:73]
  wire [3:0] _issue_chosenDecodesigs_T_73 = _issue_chosenDecodesigs_T_72 | _issue_chosenDecodesigs_T_70; // @[Mux.scala 27:73]
  wire [3:0] issue_chosenDecodesigs_brType = _issue_chosenDecodesigs_T_73 | _issue_chosenDecodesigs_T_71; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_5 = _issue_chosenDecodesigs_T[0] ? issue_inst_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_6 = _issue_chosenDecodesigs_T[1] ? issue_inst_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_7 = _issue_chosenDecodesigs_T[2] ? issue_inst_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_8 = _issue_chosenDecodesigs_T[3] ? issue_inst_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_9 = _issue_chosenInst_T_5 | _issue_chosenInst_T_6; // @[Mux.scala 27:73]
  wire [31:0] _issue_chosenInst_T_10 = _issue_chosenInst_T_9 | _issue_chosenInst_T_7; // @[Mux.scala 27:73]
  wire [31:0] issue_chosenInst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  wire [4:0] rs1 = issue_chosenInst[19:15]; // @[util.scala 72:31]
  wire [4:0] rs2 = issue_chosenInst[24:20]; // @[util.scala 73:31]
  wire [4:0] issue_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 266:24]
  wire  issue_aluValid = issue_chosenDecodesigs_aluOp != 5'h11 & issue_full; // @[Core_1.scala 272:67]
  wire  issue_bruValid = issue_chosenDecodesigs_brType != 4'h0 & issue_full; // @[Core_1.scala 273:67]
  wire  issue_lsuValid = issue_chosenDecodesigs_lsuOp != 5'h0 & issue_full; // @[Core_1.scala 274:67]
  wire  issue_csrValid = (issue_chosenDecodesigs_csrOp != 3'h0 | issue_chosenDecodesigs_excpType != 4'h0) & issue_full; // @[Core_1.scala 275:117]
  wire [1:0] _T_8 = issue_aluValid + issue_bruValid; // @[Bitwise.scala 51:90]
  wire [1:0] _T_10 = issue_lsuValid + issue_csrValid; // @[Bitwise.scala 51:90]
  wire [2:0] _T_12 = _T_8 + _T_10; // @[Bitwise.scala 51:90]
  wire [3:0] _issue_stagePc_T = {issue_ptr, 2'h0}; // @[Core_1.scala 319:47]
  wire [31:0] _GEN_112 = {{28'd0}, _issue_stagePc_T}; // @[Core_1.scala 319:34]
  wire [31:0] issue_stagePc = issue_pc + _GEN_112; // @[Core_1.scala 319:34]
  wire  _rsReady_T_1 = issue_lsuValid ? lsuRS_io_enq_ready : issue_csrValid & csrRS_io_enq_ready; // @[Mux.scala 101:16]
  wire  _rsReady_T_2 = issue_bruValid ? bruRS_io_enq_ready : _rsReady_T_1; // @[Mux.scala 101:16]
  wire  rsReady = issue_aluValid ? aluRS_io_enq_ready : _rsReady_T_2; // @[Mux.scala 101:16]
  wire [4:0] _rob_io_enq_bits_fuOp_T = issue_csrValid ? {{2'd0}, issue_chosenDecodesigs_csrOp} : 5'h0; // @[Mux.scala 101:16]
  wire [4:0] _rob_io_enq_bits_fuOp_T_1 = issue_lsuValid ? issue_chosenDecodesigs_lsuOp : _rob_io_enq_bits_fuOp_T; // @[Mux.scala 101:16]
  wire [4:0] _rob_io_enq_bits_fuOp_T_2 = issue_bruValid ? {{1'd0}, issue_chosenDecodesigs_brType} :
    _rob_io_enq_bits_fuOp_T_1; // @[Mux.scala 101:16]
  wire [4:0] _rob_io_enq_bits_fuOp_T_3 = issue_aluValid ? issue_chosenDecodesigs_aluOp : _rob_io_enq_bits_fuOp_T_2; // @[Mux.scala 101:16]
  wire [1:0] rob_io_enq_bits_fuValid_lo = {issue_bruValid,issue_aluValid}; // @[Cat.scala 33:92]
  wire [1:0] rob_io_enq_bits_fuValid_hi = {issue_csrValid,issue_lsuValid}; // @[Cat.scala 33:92]
  wire [4:0] rd = issue_chosenInst[11:7]; // @[util.scala 71:31]
  wire [3:0] _invalidBRU_T = {{1'd0}, rob_io_enq_bits_fuValid[3:1]}; // @[Core_1.scala 474:33]
  wire  invalidBRU = _invalidBRU_T[0] & (rob_io_enq_bits_fuOp != 8'h2 & rob_io_enq_bits_fuOp != 8'h1); // @[Core_1.scala 474:39]
  wire [3:0] _invalidLSU_T = {{2'd0}, rob_io_enq_bits_fuValid[3:2]}; // @[Core_1.scala 475:33]
  wire  invalidLSU = _invalidLSU_T[0] & (rob_io_enq_bits_fuOp == 8'h8 | rob_io_enq_bits_fuOp == 8'h7 |
    rob_io_enq_bits_fuOp == 8'h6 | rob_io_enq_bits_fuOp == 8'h14); // @[Core_1.scala 475:39]
  wire  invalidRd = invalidBRU | invalidLSU | rd == 5'h0; // @[Core_1.scala 476:46]
  wire [7:0] _GEN_76 = rob_io_regStatus_0_owner; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_77 = 5'h1 == issue_rs1 ? rob_io_regStatus_1_owner : _GEN_76; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_78 = 5'h2 == issue_rs1 ? rob_io_regStatus_2_owner : _GEN_77; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_79 = 5'h3 == issue_rs1 ? rob_io_regStatus_3_owner : _GEN_78; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_80 = 5'h4 == issue_rs1 ? rob_io_regStatus_4_owner : _GEN_79; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_81 = 5'h5 == issue_rs1 ? rob_io_regStatus_5_owner : _GEN_80; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_82 = 5'h6 == issue_rs1 ? rob_io_regStatus_6_owner : _GEN_81; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_83 = 5'h7 == issue_rs1 ? rob_io_regStatus_7_owner : _GEN_82; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_84 = 5'h8 == issue_rs1 ? rob_io_regStatus_8_owner : _GEN_83; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_85 = 5'h9 == issue_rs1 ? rob_io_regStatus_9_owner : _GEN_84; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_86 = 5'ha == issue_rs1 ? rob_io_regStatus_10_owner : _GEN_85; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_87 = 5'hb == issue_rs1 ? rob_io_regStatus_11_owner : _GEN_86; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_88 = 5'hc == issue_rs1 ? rob_io_regStatus_12_owner : _GEN_87; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_89 = 5'hd == issue_rs1 ? rob_io_regStatus_13_owner : _GEN_88; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_90 = 5'he == issue_rs1 ? rob_io_regStatus_14_owner : _GEN_89; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_91 = 5'hf == issue_rs1 ? rob_io_regStatus_15_owner : _GEN_90; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_92 = 5'h10 == issue_rs1 ? rob_io_regStatus_16_owner : _GEN_91; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_93 = 5'h11 == issue_rs1 ? rob_io_regStatus_17_owner : _GEN_92; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_94 = 5'h12 == issue_rs1 ? rob_io_regStatus_18_owner : _GEN_93; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_95 = 5'h13 == issue_rs1 ? rob_io_regStatus_19_owner : _GEN_94; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_96 = 5'h14 == issue_rs1 ? rob_io_regStatus_20_owner : _GEN_95; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_97 = 5'h15 == issue_rs1 ? rob_io_regStatus_21_owner : _GEN_96; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_98 = 5'h16 == issue_rs1 ? rob_io_regStatus_22_owner : _GEN_97; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_99 = 5'h17 == issue_rs1 ? rob_io_regStatus_23_owner : _GEN_98; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_100 = 5'h18 == issue_rs1 ? rob_io_regStatus_24_owner : _GEN_99; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_101 = 5'h19 == issue_rs1 ? rob_io_regStatus_25_owner : _GEN_100; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_102 = 5'h1a == issue_rs1 ? rob_io_regStatus_26_owner : _GEN_101; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_103 = 5'h1b == issue_rs1 ? rob_io_regStatus_27_owner : _GEN_102; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_104 = 5'h1c == issue_rs1 ? rob_io_regStatus_28_owner : _GEN_103; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_105 = 5'h1d == issue_rs1 ? rob_io_regStatus_29_owner : _GEN_104; // @[Core_1.scala 500:{22,22}]
  wire [7:0] _GEN_106 = 5'h1e == issue_rs1 ? rob_io_regStatus_30_owner : _GEN_105; // @[Core_1.scala 500:{22,22}]
  reg  io_out_state_instState_REG_commit; // @[Core_1.scala 687:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core_1.scala 687:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core_1.scala 687:38]
  InstBuffer ib ( // @[Core_1.scala 50:20]
    .clock(ib_clock),
    .reset(ib_reset),
    .io_in_ready(ib_io_in_ready),
    .io_in_valid(ib_io_in_valid),
    .io_in_bits_icache_data(ib_io_in_bits_icache_data),
    .io_in_bits_icache_addr(ib_io_in_bits_icache_addr),
    .io_in_bits_icache_inst_0(ib_io_in_bits_icache_inst_0),
    .io_in_bits_icache_inst_1(ib_io_in_bits_icache_inst_1),
    .io_in_bits_icache_inst_2(ib_io_in_bits_icache_inst_2),
    .io_in_bits_icache_inst_3(ib_io_in_bits_icache_inst_3),
    .io_in_bits_icache_size(ib_io_in_bits_icache_size),
    .io_in_bits_pc(ib_io_in_bits_pc),
    .io_in_bits_flush(ib_io_in_bits_flush),
    .io_out_ready(ib_io_out_ready),
    .io_out_valid(ib_io_out_valid),
    .io_out_bits_inst_0_inst(ib_io_out_bits_inst_0_inst),
    .io_out_bits_inst_0_valid(ib_io_out_bits_inst_0_valid),
    .io_out_bits_inst_1_inst(ib_io_out_bits_inst_1_inst),
    .io_out_bits_inst_1_valid(ib_io_out_bits_inst_1_valid),
    .io_out_bits_inst_2_inst(ib_io_out_bits_inst_2_inst),
    .io_out_bits_inst_2_valid(ib_io_out_bits_inst_2_valid),
    .io_out_bits_inst_3_inst(ib_io_out_bits_inst_3_inst),
    .io_out_bits_inst_3_valid(ib_io_out_bits_inst_3_valid),
    .io_out_bits_pc(ib_io_out_bits_pc),
    .io_status_back_pressure(ib_io_status_back_pressure),
    .io_status_full(ib_io_status_full)
  );
  ICache icache ( // @[Core_1.scala 52:24]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_read_req_ready(icache_io_read_req_ready),
    .io_read_req_valid(icache_io_read_req_valid),
    .io_read_req_bits_addr(icache_io_read_req_bits_addr),
    .io_read_resp_ready(icache_io_read_resp_ready),
    .io_read_resp_valid(icache_io_read_resp_valid),
    .io_read_resp_bits_data(icache_io_read_resp_bits_data),
    .io_read_resp_bits_addr(icache_io_read_resp_bits_addr),
    .io_read_resp_bits_inst_0(icache_io_read_resp_bits_inst_0),
    .io_read_resp_bits_inst_1(icache_io_read_resp_bits_inst_1),
    .io_read_resp_bits_inst_2(icache_io_read_resp_bits_inst_2),
    .io_read_resp_bits_inst_3(icache_io_read_resp_bits_inst_3),
    .io_read_resp_bits_size(icache_io_read_resp_bits_size),
    .io_tlbus_req_ready(icache_io_tlbus_req_ready),
    .io_tlbus_req_valid(icache_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(icache_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(icache_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(icache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(icache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(icache_io_tlbus_resp_bits_data),
    .io_flush(icache_io_flush)
  );
  RegFile2 rf ( // @[Core_1.scala 64:20]
    .clock(rf_clock),
    .reset(rf_reset),
    .io_r_0_addr(rf_io_r_0_addr),
    .io_r_0_data(rf_io_r_0_data),
    .io_r_1_addr(rf_io_r_1_addr),
    .io_r_1_data(rf_io_r_1_data),
    .io_r_2_addr(rf_io_r_2_addr),
    .io_r_2_data(rf_io_r_2_data),
    .io_r_3_addr(rf_io_r_3_addr),
    .io_r_3_data(rf_io_r_3_data),
    .io_r_4_addr(rf_io_r_4_addr),
    .io_r_4_data(rf_io_r_4_data),
    .io_r_5_addr(rf_io_r_5_addr),
    .io_r_5_data(rf_io_r_5_data),
    .io_r_6_addr(rf_io_r_6_addr),
    .io_r_6_data(rf_io_r_6_data),
    .io_r_7_addr(rf_io_r_7_addr),
    .io_r_7_data(rf_io_r_7_data),
    .io_w_0_addr(rf_io_w_0_addr),
    .io_w_0_en(rf_io_w_0_en),
    .io_w_0_data(rf_io_w_0_data),
    .regState_0_regState_0(rf_regState_0_regState_0),
    .regState_0_regState_1(rf_regState_0_regState_1),
    .regState_0_regState_2(rf_regState_0_regState_2),
    .regState_0_regState_3(rf_regState_0_regState_3),
    .regState_0_regState_4(rf_regState_0_regState_4),
    .regState_0_regState_5(rf_regState_0_regState_5),
    .regState_0_regState_6(rf_regState_0_regState_6),
    .regState_0_regState_7(rf_regState_0_regState_7),
    .regState_0_regState_8(rf_regState_0_regState_8),
    .regState_0_regState_9(rf_regState_0_regState_9),
    .regState_0_regState_10(rf_regState_0_regState_10),
    .regState_0_regState_11(rf_regState_0_regState_11),
    .regState_0_regState_12(rf_regState_0_regState_12),
    .regState_0_regState_13(rf_regState_0_regState_13),
    .regState_0_regState_14(rf_regState_0_regState_14),
    .regState_0_regState_15(rf_regState_0_regState_15),
    .regState_0_regState_16(rf_regState_0_regState_16),
    .regState_0_regState_17(rf_regState_0_regState_17),
    .regState_0_regState_18(rf_regState_0_regState_18),
    .regState_0_regState_19(rf_regState_0_regState_19),
    .regState_0_regState_20(rf_regState_0_regState_20),
    .regState_0_regState_21(rf_regState_0_regState_21),
    .regState_0_regState_22(rf_regState_0_regState_22),
    .regState_0_regState_23(rf_regState_0_regState_23),
    .regState_0_regState_24(rf_regState_0_regState_24),
    .regState_0_regState_25(rf_regState_0_regState_25),
    .regState_0_regState_26(rf_regState_0_regState_26),
    .regState_0_regState_27(rf_regState_0_regState_27),
    .regState_0_regState_28(rf_regState_0_regState_28),
    .regState_0_regState_29(rf_regState_0_regState_29),
    .regState_0_regState_30(rf_regState_0_regState_30),
    .regState_0_regState_31(rf_regState_0_regState_31)
  );
  ROB rob ( // @[Core_1.scala 79:21]
    .clock(rob_clock),
    .reset(rob_reset),
    .io_enq_ready(rob_io_enq_ready),
    .io_enq_valid(rob_io_enq_valid),
    .io_enq_bits_rd(rob_io_enq_bits_rd),
    .io_enq_bits_fuValid(rob_io_enq_bits_fuValid),
    .io_enq_bits_fuOp(rob_io_enq_bits_fuOp),
    .io_enq_bits_pc(rob_io_enq_bits_pc),
    .io_enq_bits_inst(rob_io_enq_bits_inst),
    .io_deq_ready(rob_io_deq_ready),
    .io_deq_valid(rob_io_deq_valid),
    .io_deq_bits_rdWrEn(rob_io_deq_bits_rdWrEn),
    .io_deq_bits_rd(rob_io_deq_bits_rd),
    .io_deq_bits_data(rob_io_deq_bits_data),
    .io_deq_bits_id(rob_io_deq_bits_id),
    .io_deq_bits_brAddr(rob_io_deq_bits_brAddr),
    .io_deq_bits_brTaken(rob_io_deq_bits_brTaken),
    .io_deq_bits_excpAddr(rob_io_deq_bits_excpAddr),
    .io_deq_bits_excpValid(rob_io_deq_bits_excpValid),
    .io_deq_bits_pc(rob_io_deq_bits_pc),
    .io_deq_bits_inst(rob_io_deq_bits_inst),
    .io_rs_0_valid(rob_io_rs_0_valid),
    .io_rs_0_bits_id(rob_io_rs_0_bits_id),
    .io_rs_1_valid(rob_io_rs_1_valid),
    .io_rs_1_bits_id(rob_io_rs_1_bits_id),
    .io_rs_2_valid(rob_io_rs_2_valid),
    .io_rs_2_bits_id(rob_io_rs_2_bits_id),
    .io_rs_3_valid(rob_io_rs_3_valid),
    .io_rs_3_bits_id(rob_io_rs_3_bits_id),
    .io_read_0_busy(rob_io_read_0_busy),
    .io_read_0_state(rob_io_read_0_state),
    .io_read_0_rd(rob_io_read_0_rd),
    .io_read_0_data(rob_io_read_0_data),
    .io_read_1_busy(rob_io_read_1_busy),
    .io_read_1_state(rob_io_read_1_state),
    .io_read_1_rd(rob_io_read_1_rd),
    .io_read_1_data(rob_io_read_1_data),
    .io_read_2_busy(rob_io_read_2_busy),
    .io_read_2_state(rob_io_read_2_state),
    .io_read_2_rd(rob_io_read_2_rd),
    .io_read_2_data(rob_io_read_2_data),
    .io_read_3_busy(rob_io_read_3_busy),
    .io_read_3_state(rob_io_read_3_state),
    .io_read_3_rd(rob_io_read_3_rd),
    .io_read_3_data(rob_io_read_3_data),
    .io_read_4_busy(rob_io_read_4_busy),
    .io_read_4_state(rob_io_read_4_state),
    .io_read_4_rd(rob_io_read_4_rd),
    .io_read_4_data(rob_io_read_4_data),
    .io_fu_0_valid(rob_io_fu_0_valid),
    .io_fu_0_bits_id(rob_io_fu_0_bits_id),
    .io_fu_0_bits_data(rob_io_fu_0_bits_data),
    .io_fu_1_valid(rob_io_fu_1_valid),
    .io_fu_1_bits_id(rob_io_fu_1_bits_id),
    .io_fu_1_bits_data(rob_io_fu_1_bits_data),
    .io_fu_1_bits_brAddr(rob_io_fu_1_bits_brAddr),
    .io_fu_1_bits_brTaken(rob_io_fu_1_bits_brTaken),
    .io_fu_2_valid(rob_io_fu_2_valid),
    .io_fu_2_bits_id(rob_io_fu_2_bits_id),
    .io_fu_2_bits_data(rob_io_fu_2_bits_data),
    .io_fu_3_valid(rob_io_fu_3_valid),
    .io_fu_3_bits_id(rob_io_fu_3_bits_id),
    .io_fu_3_bits_data(rob_io_fu_3_bits_data),
    .io_fu_3_bits_excpAddr(rob_io_fu_3_bits_excpAddr),
    .io_fu_3_bits_excpValid(rob_io_fu_3_bits_excpValid),
    .io_id(rob_io_id),
    .io_regStatus_0_owner(rob_io_regStatus_0_owner),
    .io_regStatus_1_owner(rob_io_regStatus_1_owner),
    .io_regStatus_2_owner(rob_io_regStatus_2_owner),
    .io_regStatus_3_owner(rob_io_regStatus_3_owner),
    .io_regStatus_4_owner(rob_io_regStatus_4_owner),
    .io_regStatus_5_owner(rob_io_regStatus_5_owner),
    .io_regStatus_6_owner(rob_io_regStatus_6_owner),
    .io_regStatus_7_owner(rob_io_regStatus_7_owner),
    .io_regStatus_8_owner(rob_io_regStatus_8_owner),
    .io_regStatus_9_owner(rob_io_regStatus_9_owner),
    .io_regStatus_10_owner(rob_io_regStatus_10_owner),
    .io_regStatus_11_owner(rob_io_regStatus_11_owner),
    .io_regStatus_12_owner(rob_io_regStatus_12_owner),
    .io_regStatus_13_owner(rob_io_regStatus_13_owner),
    .io_regStatus_14_owner(rob_io_regStatus_14_owner),
    .io_regStatus_15_owner(rob_io_regStatus_15_owner),
    .io_regStatus_16_owner(rob_io_regStatus_16_owner),
    .io_regStatus_17_owner(rob_io_regStatus_17_owner),
    .io_regStatus_18_owner(rob_io_regStatus_18_owner),
    .io_regStatus_19_owner(rob_io_regStatus_19_owner),
    .io_regStatus_20_owner(rob_io_regStatus_20_owner),
    .io_regStatus_21_owner(rob_io_regStatus_21_owner),
    .io_regStatus_22_owner(rob_io_regStatus_22_owner),
    .io_regStatus_23_owner(rob_io_regStatus_23_owner),
    .io_regStatus_24_owner(rob_io_regStatus_24_owner),
    .io_regStatus_25_owner(rob_io_regStatus_25_owner),
    .io_regStatus_26_owner(rob_io_regStatus_26_owner),
    .io_regStatus_27_owner(rob_io_regStatus_27_owner),
    .io_regStatus_28_owner(rob_io_regStatus_28_owner),
    .io_regStatus_29_owner(rob_io_regStatus_29_owner),
    .io_regStatus_30_owner(rob_io_regStatus_30_owner),
    .io_regStatus_31_owner(rob_io_regStatus_31_owner),
    .io_flush(rob_io_flush)
  );
  ALUStage_1 aluStage_1 ( // @[Core_1.scala 81:28]
    .clock(aluStage_1_clock),
    .reset(aluStage_1_reset),
    .io_in_ready(aluStage_1_io_in_ready),
    .io_in_valid(aluStage_1_io_in_valid),
    .io_in_bits_opr1(aluStage_1_io_in_bits_opr1),
    .io_in_bits_opr2(aluStage_1_io_in_bits_opr2),
    .io_in_bits_aluOp(aluStage_1_io_in_bits_aluOp),
    .io_in_bits_immSrc(aluStage_1_io_in_bits_immSrc),
    .io_in_bits_immSign(aluStage_1_io_in_bits_immSign),
    .io_in_bits_rs1Val(aluStage_1_io_in_bits_rs1Val),
    .io_in_bits_rs2Val(aluStage_1_io_in_bits_rs2Val),
    .io_in_bits_inst(aluStage_1_io_in_bits_inst),
    .io_in_bits_pc(aluStage_1_io_in_bits_pc),
    .io_in_bits_id(aluStage_1_io_in_bits_id),
    .io_out_valid(aluStage_1_io_out_valid),
    .io_out_bits_data(aluStage_1_io_out_bits_data),
    .io_out_bits_id(aluStage_1_io_out_bits_id),
    .io_out_bits_rd(aluStage_1_io_out_bits_rd),
    .io_flush(aluStage_1_io_flush)
  );
  ReservationStation aluRS ( // @[Core_1.scala 82:23]
    .clock(aluRS_clock),
    .reset(aluRS_reset),
    .io_enq_ready(aluRS_io_enq_ready),
    .io_enq_valid(aluRS_io_enq_valid),
    .io_enq_bits_op(aluRS_io_enq_bits_op),
    .io_enq_bits_opr1(aluRS_io_enq_bits_opr1),
    .io_enq_bits_opr2(aluRS_io_enq_bits_opr2),
    .io_enq_bits_rs1(aluRS_io_enq_bits_rs1),
    .io_enq_bits_rs2(aluRS_io_enq_bits_rs2),
    .io_enq_bits_ROBId(aluRS_io_enq_bits_ROBId),
    .io_enq_bits_rs1ROBId(aluRS_io_enq_bits_rs1ROBId),
    .io_enq_bits_rs2ROBId(aluRS_io_enq_bits_rs2ROBId),
    .io_enq_bits_immSrc(aluRS_io_enq_bits_immSrc),
    .io_enq_bits_immSign(aluRS_io_enq_bits_immSign),
    .io_enq_bits_excpType(aluRS_io_enq_bits_excpType),
    .io_enq_bits_pc(aluRS_io_enq_bits_pc),
    .io_enq_bits_inst(aluRS_io_enq_bits_inst),
    .io_deq_ready(aluRS_io_deq_ready),
    .io_deq_valid(aluRS_io_deq_valid),
    .io_deq_bits_op(aluRS_io_deq_bits_op),
    .io_deq_bits_ROBId(aluRS_io_deq_bits_ROBId),
    .io_deq_bits_opr1(aluRS_io_deq_bits_opr1),
    .io_deq_bits_opr2(aluRS_io_deq_bits_opr2),
    .io_deq_bits_rs1Val(aluRS_io_deq_bits_rs1Val),
    .io_deq_bits_rs2Val(aluRS_io_deq_bits_rs2Val),
    .io_deq_bits_immSrc(aluRS_io_deq_bits_immSrc),
    .io_deq_bits_immSign(aluRS_io_deq_bits_immSign),
    .io_deq_bits_excpType(aluRS_io_deq_bits_excpType),
    .io_deq_bits_pc(aluRS_io_deq_bits_pc),
    .io_deq_bits_inst(aluRS_io_deq_bits_inst),
    .io_robOut_valid(aluRS_io_robOut_valid),
    .io_robOut_bits_id(aluRS_io_robOut_bits_id),
    .io_robRead_0_busy(aluRS_io_robRead_0_busy),
    .io_robRead_0_state(aluRS_io_robRead_0_state),
    .io_robRead_0_rd(aluRS_io_robRead_0_rd),
    .io_robRead_0_data(aluRS_io_robRead_0_data),
    .io_robRead_1_busy(aluRS_io_robRead_1_busy),
    .io_robRead_1_state(aluRS_io_robRead_1_state),
    .io_robRead_1_rd(aluRS_io_robRead_1_rd),
    .io_robRead_1_data(aluRS_io_robRead_1_data),
    .io_robRead_2_busy(aluRS_io_robRead_2_busy),
    .io_robRead_2_state(aluRS_io_robRead_2_state),
    .io_robRead_2_rd(aluRS_io_robRead_2_rd),
    .io_robRead_2_data(aluRS_io_robRead_2_data),
    .io_robRead_3_busy(aluRS_io_robRead_3_busy),
    .io_robRead_3_state(aluRS_io_robRead_3_state),
    .io_robRead_3_rd(aluRS_io_robRead_3_rd),
    .io_robRead_3_data(aluRS_io_robRead_3_data),
    .io_robRead_4_busy(aluRS_io_robRead_4_busy),
    .io_robRead_4_state(aluRS_io_robRead_4_state),
    .io_robRead_4_rd(aluRS_io_robRead_4_rd),
    .io_robRead_4_data(aluRS_io_robRead_4_data),
    .io_regStatus_0_owner(aluRS_io_regStatus_0_owner),
    .io_regStatus_1_owner(aluRS_io_regStatus_1_owner),
    .io_regStatus_2_owner(aluRS_io_regStatus_2_owner),
    .io_regStatus_3_owner(aluRS_io_regStatus_3_owner),
    .io_regStatus_4_owner(aluRS_io_regStatus_4_owner),
    .io_regStatus_5_owner(aluRS_io_regStatus_5_owner),
    .io_regStatus_6_owner(aluRS_io_regStatus_6_owner),
    .io_regStatus_7_owner(aluRS_io_regStatus_7_owner),
    .io_regStatus_8_owner(aluRS_io_regStatus_8_owner),
    .io_regStatus_9_owner(aluRS_io_regStatus_9_owner),
    .io_regStatus_10_owner(aluRS_io_regStatus_10_owner),
    .io_regStatus_11_owner(aluRS_io_regStatus_11_owner),
    .io_regStatus_12_owner(aluRS_io_regStatus_12_owner),
    .io_regStatus_13_owner(aluRS_io_regStatus_13_owner),
    .io_regStatus_14_owner(aluRS_io_regStatus_14_owner),
    .io_regStatus_15_owner(aluRS_io_regStatus_15_owner),
    .io_regStatus_16_owner(aluRS_io_regStatus_16_owner),
    .io_regStatus_17_owner(aluRS_io_regStatus_17_owner),
    .io_regStatus_18_owner(aluRS_io_regStatus_18_owner),
    .io_regStatus_19_owner(aluRS_io_regStatus_19_owner),
    .io_regStatus_20_owner(aluRS_io_regStatus_20_owner),
    .io_regStatus_21_owner(aluRS_io_regStatus_21_owner),
    .io_regStatus_22_owner(aluRS_io_regStatus_22_owner),
    .io_regStatus_23_owner(aluRS_io_regStatus_23_owner),
    .io_regStatus_24_owner(aluRS_io_regStatus_24_owner),
    .io_regStatus_25_owner(aluRS_io_regStatus_25_owner),
    .io_regStatus_26_owner(aluRS_io_regStatus_26_owner),
    .io_regStatus_27_owner(aluRS_io_regStatus_27_owner),
    .io_regStatus_28_owner(aluRS_io_regStatus_28_owner),
    .io_regStatus_29_owner(aluRS_io_regStatus_29_owner),
    .io_regStatus_30_owner(aluRS_io_regStatus_30_owner),
    .io_regStatus_31_owner(aluRS_io_regStatus_31_owner),
    .io_cdb_0_valid(aluRS_io_cdb_0_valid),
    .io_cdb_0_bits_data(aluRS_io_cdb_0_bits_data),
    .io_cdb_0_bits_id(aluRS_io_cdb_0_bits_id),
    .io_cdb_0_bits_rd(aluRS_io_cdb_0_bits_rd),
    .io_cdb_1_valid(aluRS_io_cdb_1_valid),
    .io_cdb_1_bits_data(aluRS_io_cdb_1_bits_data),
    .io_cdb_1_bits_id(aluRS_io_cdb_1_bits_id),
    .io_cdb_1_bits_rd(aluRS_io_cdb_1_bits_rd),
    .io_cdb_2_valid(aluRS_io_cdb_2_valid),
    .io_cdb_2_bits_data(aluRS_io_cdb_2_bits_data),
    .io_cdb_2_bits_id(aluRS_io_cdb_2_bits_id),
    .io_cdb_2_bits_rd(aluRS_io_cdb_2_bits_rd),
    .io_cdb_3_valid(aluRS_io_cdb_3_valid),
    .io_cdb_3_bits_data(aluRS_io_cdb_3_bits_data),
    .io_cdb_3_bits_id(aluRS_io_cdb_3_bits_id),
    .io_cdb_3_bits_rd(aluRS_io_cdb_3_bits_rd),
    .io_rf_0_addr(aluRS_io_rf_0_addr),
    .io_rf_0_data(aluRS_io_rf_0_data),
    .io_rf_1_addr(aluRS_io_rf_1_addr),
    .io_rf_1_data(aluRS_io_rf_1_data),
    .io_flush(aluRS_io_flush)
  );
  BRUStage_1 bruStage_1 ( // @[Core_1.scala 84:28]
    .clock(bruStage_1_clock),
    .reset(bruStage_1_reset),
    .io_in_ready(bruStage_1_io_in_ready),
    .io_in_valid(bruStage_1_io_in_valid),
    .io_in_bits_opr1(bruStage_1_io_in_bits_opr1),
    .io_in_bits_opr2(bruStage_1_io_in_bits_opr2),
    .io_in_bits_bruOp(bruStage_1_io_in_bits_bruOp),
    .io_in_bits_immSrc(bruStage_1_io_in_bits_immSrc),
    .io_in_bits_rs1Val(bruStage_1_io_in_bits_rs1Val),
    .io_in_bits_rs2Val(bruStage_1_io_in_bits_rs2Val),
    .io_in_bits_inst(bruStage_1_io_in_bits_inst),
    .io_in_bits_pc(bruStage_1_io_in_bits_pc),
    .io_in_bits_id(bruStage_1_io_in_bits_id),
    .io_out_valid(bruStage_1_io_out_valid),
    .io_out_bits_brTaken(bruStage_1_io_out_bits_brTaken),
    .io_out_bits_brAddr(bruStage_1_io_out_bits_brAddr),
    .io_out_bits_rd(bruStage_1_io_out_bits_rd),
    .io_out_bits_data(bruStage_1_io_out_bits_data),
    .io_out_bits_id(bruStage_1_io_out_bits_id),
    .io_flush(bruStage_1_io_flush)
  );
  ReservationStation bruRS ( // @[Core_1.scala 85:23]
    .clock(bruRS_clock),
    .reset(bruRS_reset),
    .io_enq_ready(bruRS_io_enq_ready),
    .io_enq_valid(bruRS_io_enq_valid),
    .io_enq_bits_op(bruRS_io_enq_bits_op),
    .io_enq_bits_opr1(bruRS_io_enq_bits_opr1),
    .io_enq_bits_opr2(bruRS_io_enq_bits_opr2),
    .io_enq_bits_rs1(bruRS_io_enq_bits_rs1),
    .io_enq_bits_rs2(bruRS_io_enq_bits_rs2),
    .io_enq_bits_ROBId(bruRS_io_enq_bits_ROBId),
    .io_enq_bits_rs1ROBId(bruRS_io_enq_bits_rs1ROBId),
    .io_enq_bits_rs2ROBId(bruRS_io_enq_bits_rs2ROBId),
    .io_enq_bits_immSrc(bruRS_io_enq_bits_immSrc),
    .io_enq_bits_immSign(bruRS_io_enq_bits_immSign),
    .io_enq_bits_excpType(bruRS_io_enq_bits_excpType),
    .io_enq_bits_pc(bruRS_io_enq_bits_pc),
    .io_enq_bits_inst(bruRS_io_enq_bits_inst),
    .io_deq_ready(bruRS_io_deq_ready),
    .io_deq_valid(bruRS_io_deq_valid),
    .io_deq_bits_op(bruRS_io_deq_bits_op),
    .io_deq_bits_ROBId(bruRS_io_deq_bits_ROBId),
    .io_deq_bits_opr1(bruRS_io_deq_bits_opr1),
    .io_deq_bits_opr2(bruRS_io_deq_bits_opr2),
    .io_deq_bits_rs1Val(bruRS_io_deq_bits_rs1Val),
    .io_deq_bits_rs2Val(bruRS_io_deq_bits_rs2Val),
    .io_deq_bits_immSrc(bruRS_io_deq_bits_immSrc),
    .io_deq_bits_immSign(bruRS_io_deq_bits_immSign),
    .io_deq_bits_excpType(bruRS_io_deq_bits_excpType),
    .io_deq_bits_pc(bruRS_io_deq_bits_pc),
    .io_deq_bits_inst(bruRS_io_deq_bits_inst),
    .io_robOut_valid(bruRS_io_robOut_valid),
    .io_robOut_bits_id(bruRS_io_robOut_bits_id),
    .io_robRead_0_busy(bruRS_io_robRead_0_busy),
    .io_robRead_0_state(bruRS_io_robRead_0_state),
    .io_robRead_0_rd(bruRS_io_robRead_0_rd),
    .io_robRead_0_data(bruRS_io_robRead_0_data),
    .io_robRead_1_busy(bruRS_io_robRead_1_busy),
    .io_robRead_1_state(bruRS_io_robRead_1_state),
    .io_robRead_1_rd(bruRS_io_robRead_1_rd),
    .io_robRead_1_data(bruRS_io_robRead_1_data),
    .io_robRead_2_busy(bruRS_io_robRead_2_busy),
    .io_robRead_2_state(bruRS_io_robRead_2_state),
    .io_robRead_2_rd(bruRS_io_robRead_2_rd),
    .io_robRead_2_data(bruRS_io_robRead_2_data),
    .io_robRead_3_busy(bruRS_io_robRead_3_busy),
    .io_robRead_3_state(bruRS_io_robRead_3_state),
    .io_robRead_3_rd(bruRS_io_robRead_3_rd),
    .io_robRead_3_data(bruRS_io_robRead_3_data),
    .io_robRead_4_busy(bruRS_io_robRead_4_busy),
    .io_robRead_4_state(bruRS_io_robRead_4_state),
    .io_robRead_4_rd(bruRS_io_robRead_4_rd),
    .io_robRead_4_data(bruRS_io_robRead_4_data),
    .io_regStatus_0_owner(bruRS_io_regStatus_0_owner),
    .io_regStatus_1_owner(bruRS_io_regStatus_1_owner),
    .io_regStatus_2_owner(bruRS_io_regStatus_2_owner),
    .io_regStatus_3_owner(bruRS_io_regStatus_3_owner),
    .io_regStatus_4_owner(bruRS_io_regStatus_4_owner),
    .io_regStatus_5_owner(bruRS_io_regStatus_5_owner),
    .io_regStatus_6_owner(bruRS_io_regStatus_6_owner),
    .io_regStatus_7_owner(bruRS_io_regStatus_7_owner),
    .io_regStatus_8_owner(bruRS_io_regStatus_8_owner),
    .io_regStatus_9_owner(bruRS_io_regStatus_9_owner),
    .io_regStatus_10_owner(bruRS_io_regStatus_10_owner),
    .io_regStatus_11_owner(bruRS_io_regStatus_11_owner),
    .io_regStatus_12_owner(bruRS_io_regStatus_12_owner),
    .io_regStatus_13_owner(bruRS_io_regStatus_13_owner),
    .io_regStatus_14_owner(bruRS_io_regStatus_14_owner),
    .io_regStatus_15_owner(bruRS_io_regStatus_15_owner),
    .io_regStatus_16_owner(bruRS_io_regStatus_16_owner),
    .io_regStatus_17_owner(bruRS_io_regStatus_17_owner),
    .io_regStatus_18_owner(bruRS_io_regStatus_18_owner),
    .io_regStatus_19_owner(bruRS_io_regStatus_19_owner),
    .io_regStatus_20_owner(bruRS_io_regStatus_20_owner),
    .io_regStatus_21_owner(bruRS_io_regStatus_21_owner),
    .io_regStatus_22_owner(bruRS_io_regStatus_22_owner),
    .io_regStatus_23_owner(bruRS_io_regStatus_23_owner),
    .io_regStatus_24_owner(bruRS_io_regStatus_24_owner),
    .io_regStatus_25_owner(bruRS_io_regStatus_25_owner),
    .io_regStatus_26_owner(bruRS_io_regStatus_26_owner),
    .io_regStatus_27_owner(bruRS_io_regStatus_27_owner),
    .io_regStatus_28_owner(bruRS_io_regStatus_28_owner),
    .io_regStatus_29_owner(bruRS_io_regStatus_29_owner),
    .io_regStatus_30_owner(bruRS_io_regStatus_30_owner),
    .io_regStatus_31_owner(bruRS_io_regStatus_31_owner),
    .io_cdb_0_valid(bruRS_io_cdb_0_valid),
    .io_cdb_0_bits_data(bruRS_io_cdb_0_bits_data),
    .io_cdb_0_bits_id(bruRS_io_cdb_0_bits_id),
    .io_cdb_0_bits_rd(bruRS_io_cdb_0_bits_rd),
    .io_cdb_1_valid(bruRS_io_cdb_1_valid),
    .io_cdb_1_bits_data(bruRS_io_cdb_1_bits_data),
    .io_cdb_1_bits_id(bruRS_io_cdb_1_bits_id),
    .io_cdb_1_bits_rd(bruRS_io_cdb_1_bits_rd),
    .io_cdb_2_valid(bruRS_io_cdb_2_valid),
    .io_cdb_2_bits_data(bruRS_io_cdb_2_bits_data),
    .io_cdb_2_bits_id(bruRS_io_cdb_2_bits_id),
    .io_cdb_2_bits_rd(bruRS_io_cdb_2_bits_rd),
    .io_cdb_3_valid(bruRS_io_cdb_3_valid),
    .io_cdb_3_bits_data(bruRS_io_cdb_3_bits_data),
    .io_cdb_3_bits_id(bruRS_io_cdb_3_bits_id),
    .io_cdb_3_bits_rd(bruRS_io_cdb_3_bits_rd),
    .io_rf_0_addr(bruRS_io_rf_0_addr),
    .io_rf_0_data(bruRS_io_rf_0_data),
    .io_rf_1_addr(bruRS_io_rf_1_addr),
    .io_rf_1_data(bruRS_io_rf_1_data),
    .io_flush(bruRS_io_flush)
  );
  LSUStage_1 lsuStage_1 ( // @[Core_1.scala 87:28]
    .clock(lsuStage_1_clock),
    .reset(lsuStage_1_reset),
    .io_in_ready(lsuStage_1_io_in_ready),
    .io_in_valid(lsuStage_1_io_in_valid),
    .io_in_bits_lsuOp(lsuStage_1_io_in_bits_lsuOp),
    .io_in_bits_immSrc(lsuStage_1_io_in_bits_immSrc),
    .io_in_bits_rs1Val(lsuStage_1_io_in_bits_rs1Val),
    .io_in_bits_rs2Val(lsuStage_1_io_in_bits_rs2Val),
    .io_in_bits_inst(lsuStage_1_io_in_bits_inst),
    .io_in_bits_id(lsuStage_1_io_in_bits_id),
    .io_out_valid(lsuStage_1_io_out_valid),
    .io_out_bits_rd(lsuStage_1_io_out_bits_rd),
    .io_out_bits_data(lsuStage_1_io_out_bits_data),
    .io_out_bits_id(lsuStage_1_io_out_bits_id),
    .io_cache_read_req_ready(lsuStage_1_io_cache_read_req_ready),
    .io_cache_read_req_valid(lsuStage_1_io_cache_read_req_valid),
    .io_cache_read_req_bits_addr(lsuStage_1_io_cache_read_req_bits_addr),
    .io_cache_read_resp_ready(lsuStage_1_io_cache_read_resp_ready),
    .io_cache_read_resp_valid(lsuStage_1_io_cache_read_resp_valid),
    .io_cache_read_resp_bits_data(lsuStage_1_io_cache_read_resp_bits_data),
    .io_cache_write_req_ready(lsuStage_1_io_cache_write_req_ready),
    .io_cache_write_req_valid(lsuStage_1_io_cache_write_req_valid),
    .io_cache_write_req_bits_addr(lsuStage_1_io_cache_write_req_bits_addr),
    .io_cache_write_req_bits_data(lsuStage_1_io_cache_write_req_bits_data),
    .io_cache_write_req_bits_mask(lsuStage_1_io_cache_write_req_bits_mask),
    .io_cache_write_resp_ready(lsuStage_1_io_cache_write_resp_ready),
    .io_cache_write_resp_valid(lsuStage_1_io_cache_write_resp_valid),
    .io_rob_bits_id(lsuStage_1_io_rob_bits_id),
    .io_flush(lsuStage_1_io_flush)
  );
  ReservationStation lsuRS ( // @[Core_1.scala 88:23]
    .clock(lsuRS_clock),
    .reset(lsuRS_reset),
    .io_enq_ready(lsuRS_io_enq_ready),
    .io_enq_valid(lsuRS_io_enq_valid),
    .io_enq_bits_op(lsuRS_io_enq_bits_op),
    .io_enq_bits_opr1(lsuRS_io_enq_bits_opr1),
    .io_enq_bits_opr2(lsuRS_io_enq_bits_opr2),
    .io_enq_bits_rs1(lsuRS_io_enq_bits_rs1),
    .io_enq_bits_rs2(lsuRS_io_enq_bits_rs2),
    .io_enq_bits_ROBId(lsuRS_io_enq_bits_ROBId),
    .io_enq_bits_rs1ROBId(lsuRS_io_enq_bits_rs1ROBId),
    .io_enq_bits_rs2ROBId(lsuRS_io_enq_bits_rs2ROBId),
    .io_enq_bits_immSrc(lsuRS_io_enq_bits_immSrc),
    .io_enq_bits_immSign(lsuRS_io_enq_bits_immSign),
    .io_enq_bits_excpType(lsuRS_io_enq_bits_excpType),
    .io_enq_bits_pc(lsuRS_io_enq_bits_pc),
    .io_enq_bits_inst(lsuRS_io_enq_bits_inst),
    .io_deq_ready(lsuRS_io_deq_ready),
    .io_deq_valid(lsuRS_io_deq_valid),
    .io_deq_bits_op(lsuRS_io_deq_bits_op),
    .io_deq_bits_ROBId(lsuRS_io_deq_bits_ROBId),
    .io_deq_bits_opr1(lsuRS_io_deq_bits_opr1),
    .io_deq_bits_opr2(lsuRS_io_deq_bits_opr2),
    .io_deq_bits_rs1Val(lsuRS_io_deq_bits_rs1Val),
    .io_deq_bits_rs2Val(lsuRS_io_deq_bits_rs2Val),
    .io_deq_bits_immSrc(lsuRS_io_deq_bits_immSrc),
    .io_deq_bits_immSign(lsuRS_io_deq_bits_immSign),
    .io_deq_bits_excpType(lsuRS_io_deq_bits_excpType),
    .io_deq_bits_pc(lsuRS_io_deq_bits_pc),
    .io_deq_bits_inst(lsuRS_io_deq_bits_inst),
    .io_robOut_valid(lsuRS_io_robOut_valid),
    .io_robOut_bits_id(lsuRS_io_robOut_bits_id),
    .io_robRead_0_busy(lsuRS_io_robRead_0_busy),
    .io_robRead_0_state(lsuRS_io_robRead_0_state),
    .io_robRead_0_rd(lsuRS_io_robRead_0_rd),
    .io_robRead_0_data(lsuRS_io_robRead_0_data),
    .io_robRead_1_busy(lsuRS_io_robRead_1_busy),
    .io_robRead_1_state(lsuRS_io_robRead_1_state),
    .io_robRead_1_rd(lsuRS_io_robRead_1_rd),
    .io_robRead_1_data(lsuRS_io_robRead_1_data),
    .io_robRead_2_busy(lsuRS_io_robRead_2_busy),
    .io_robRead_2_state(lsuRS_io_robRead_2_state),
    .io_robRead_2_rd(lsuRS_io_robRead_2_rd),
    .io_robRead_2_data(lsuRS_io_robRead_2_data),
    .io_robRead_3_busy(lsuRS_io_robRead_3_busy),
    .io_robRead_3_state(lsuRS_io_robRead_3_state),
    .io_robRead_3_rd(lsuRS_io_robRead_3_rd),
    .io_robRead_3_data(lsuRS_io_robRead_3_data),
    .io_robRead_4_busy(lsuRS_io_robRead_4_busy),
    .io_robRead_4_state(lsuRS_io_robRead_4_state),
    .io_robRead_4_rd(lsuRS_io_robRead_4_rd),
    .io_robRead_4_data(lsuRS_io_robRead_4_data),
    .io_regStatus_0_owner(lsuRS_io_regStatus_0_owner),
    .io_regStatus_1_owner(lsuRS_io_regStatus_1_owner),
    .io_regStatus_2_owner(lsuRS_io_regStatus_2_owner),
    .io_regStatus_3_owner(lsuRS_io_regStatus_3_owner),
    .io_regStatus_4_owner(lsuRS_io_regStatus_4_owner),
    .io_regStatus_5_owner(lsuRS_io_regStatus_5_owner),
    .io_regStatus_6_owner(lsuRS_io_regStatus_6_owner),
    .io_regStatus_7_owner(lsuRS_io_regStatus_7_owner),
    .io_regStatus_8_owner(lsuRS_io_regStatus_8_owner),
    .io_regStatus_9_owner(lsuRS_io_regStatus_9_owner),
    .io_regStatus_10_owner(lsuRS_io_regStatus_10_owner),
    .io_regStatus_11_owner(lsuRS_io_regStatus_11_owner),
    .io_regStatus_12_owner(lsuRS_io_regStatus_12_owner),
    .io_regStatus_13_owner(lsuRS_io_regStatus_13_owner),
    .io_regStatus_14_owner(lsuRS_io_regStatus_14_owner),
    .io_regStatus_15_owner(lsuRS_io_regStatus_15_owner),
    .io_regStatus_16_owner(lsuRS_io_regStatus_16_owner),
    .io_regStatus_17_owner(lsuRS_io_regStatus_17_owner),
    .io_regStatus_18_owner(lsuRS_io_regStatus_18_owner),
    .io_regStatus_19_owner(lsuRS_io_regStatus_19_owner),
    .io_regStatus_20_owner(lsuRS_io_regStatus_20_owner),
    .io_regStatus_21_owner(lsuRS_io_regStatus_21_owner),
    .io_regStatus_22_owner(lsuRS_io_regStatus_22_owner),
    .io_regStatus_23_owner(lsuRS_io_regStatus_23_owner),
    .io_regStatus_24_owner(lsuRS_io_regStatus_24_owner),
    .io_regStatus_25_owner(lsuRS_io_regStatus_25_owner),
    .io_regStatus_26_owner(lsuRS_io_regStatus_26_owner),
    .io_regStatus_27_owner(lsuRS_io_regStatus_27_owner),
    .io_regStatus_28_owner(lsuRS_io_regStatus_28_owner),
    .io_regStatus_29_owner(lsuRS_io_regStatus_29_owner),
    .io_regStatus_30_owner(lsuRS_io_regStatus_30_owner),
    .io_regStatus_31_owner(lsuRS_io_regStatus_31_owner),
    .io_cdb_0_valid(lsuRS_io_cdb_0_valid),
    .io_cdb_0_bits_data(lsuRS_io_cdb_0_bits_data),
    .io_cdb_0_bits_id(lsuRS_io_cdb_0_bits_id),
    .io_cdb_0_bits_rd(lsuRS_io_cdb_0_bits_rd),
    .io_cdb_1_valid(lsuRS_io_cdb_1_valid),
    .io_cdb_1_bits_data(lsuRS_io_cdb_1_bits_data),
    .io_cdb_1_bits_id(lsuRS_io_cdb_1_bits_id),
    .io_cdb_1_bits_rd(lsuRS_io_cdb_1_bits_rd),
    .io_cdb_2_valid(lsuRS_io_cdb_2_valid),
    .io_cdb_2_bits_data(lsuRS_io_cdb_2_bits_data),
    .io_cdb_2_bits_id(lsuRS_io_cdb_2_bits_id),
    .io_cdb_2_bits_rd(lsuRS_io_cdb_2_bits_rd),
    .io_cdb_3_valid(lsuRS_io_cdb_3_valid),
    .io_cdb_3_bits_data(lsuRS_io_cdb_3_bits_data),
    .io_cdb_3_bits_id(lsuRS_io_cdb_3_bits_id),
    .io_cdb_3_bits_rd(lsuRS_io_cdb_3_bits_rd),
    .io_rf_0_addr(lsuRS_io_rf_0_addr),
    .io_rf_0_data(lsuRS_io_rf_0_data),
    .io_rf_1_addr(lsuRS_io_rf_1_addr),
    .io_rf_1_data(lsuRS_io_rf_1_data),
    .io_flush(lsuRS_io_flush)
  );
  CSRStage_1 csrStage_1 ( // @[Core_1.scala 90:28]
    .clock(csrStage_1_clock),
    .reset(csrStage_1_reset),
    .io_in_ready(csrStage_1_io_in_ready),
    .io_in_valid(csrStage_1_io_in_valid),
    .io_in_bits_csrOp(csrStage_1_io_in_bits_csrOp),
    .io_in_bits_excpType(csrStage_1_io_in_bits_excpType),
    .io_in_bits_rs1Val(csrStage_1_io_in_bits_rs1Val),
    .io_in_bits_inst(csrStage_1_io_in_bits_inst),
    .io_in_bits_id(csrStage_1_io_in_bits_id),
    .io_out_valid(csrStage_1_io_out_valid),
    .io_out_bits_rd(csrStage_1_io_out_bits_rd),
    .io_out_bits_data(csrStage_1_io_out_bits_data),
    .io_out_bits_excpAddr(csrStage_1_io_out_bits_excpAddr),
    .io_out_bits_excpValid(csrStage_1_io_out_bits_excpValid),
    .io_out_bits_id(csrStage_1_io_out_bits_id),
    .io_flush(csrStage_1_io_flush),
    .csrState_mcycle(csrStage_1_csrState_mcycle),
    .csrState_mcycleh(csrStage_1_csrState_mcycleh)
  );
  ReservationStation csrRS ( // @[Core_1.scala 91:23]
    .clock(csrRS_clock),
    .reset(csrRS_reset),
    .io_enq_ready(csrRS_io_enq_ready),
    .io_enq_valid(csrRS_io_enq_valid),
    .io_enq_bits_op(csrRS_io_enq_bits_op),
    .io_enq_bits_opr1(csrRS_io_enq_bits_opr1),
    .io_enq_bits_opr2(csrRS_io_enq_bits_opr2),
    .io_enq_bits_rs1(csrRS_io_enq_bits_rs1),
    .io_enq_bits_rs2(csrRS_io_enq_bits_rs2),
    .io_enq_bits_ROBId(csrRS_io_enq_bits_ROBId),
    .io_enq_bits_rs1ROBId(csrRS_io_enq_bits_rs1ROBId),
    .io_enq_bits_rs2ROBId(csrRS_io_enq_bits_rs2ROBId),
    .io_enq_bits_immSrc(csrRS_io_enq_bits_immSrc),
    .io_enq_bits_immSign(csrRS_io_enq_bits_immSign),
    .io_enq_bits_excpType(csrRS_io_enq_bits_excpType),
    .io_enq_bits_pc(csrRS_io_enq_bits_pc),
    .io_enq_bits_inst(csrRS_io_enq_bits_inst),
    .io_deq_ready(csrRS_io_deq_ready),
    .io_deq_valid(csrRS_io_deq_valid),
    .io_deq_bits_op(csrRS_io_deq_bits_op),
    .io_deq_bits_ROBId(csrRS_io_deq_bits_ROBId),
    .io_deq_bits_opr1(csrRS_io_deq_bits_opr1),
    .io_deq_bits_opr2(csrRS_io_deq_bits_opr2),
    .io_deq_bits_rs1Val(csrRS_io_deq_bits_rs1Val),
    .io_deq_bits_rs2Val(csrRS_io_deq_bits_rs2Val),
    .io_deq_bits_immSrc(csrRS_io_deq_bits_immSrc),
    .io_deq_bits_immSign(csrRS_io_deq_bits_immSign),
    .io_deq_bits_excpType(csrRS_io_deq_bits_excpType),
    .io_deq_bits_pc(csrRS_io_deq_bits_pc),
    .io_deq_bits_inst(csrRS_io_deq_bits_inst),
    .io_robOut_valid(csrRS_io_robOut_valid),
    .io_robOut_bits_id(csrRS_io_robOut_bits_id),
    .io_robRead_0_busy(csrRS_io_robRead_0_busy),
    .io_robRead_0_state(csrRS_io_robRead_0_state),
    .io_robRead_0_rd(csrRS_io_robRead_0_rd),
    .io_robRead_0_data(csrRS_io_robRead_0_data),
    .io_robRead_1_busy(csrRS_io_robRead_1_busy),
    .io_robRead_1_state(csrRS_io_robRead_1_state),
    .io_robRead_1_rd(csrRS_io_robRead_1_rd),
    .io_robRead_1_data(csrRS_io_robRead_1_data),
    .io_robRead_2_busy(csrRS_io_robRead_2_busy),
    .io_robRead_2_state(csrRS_io_robRead_2_state),
    .io_robRead_2_rd(csrRS_io_robRead_2_rd),
    .io_robRead_2_data(csrRS_io_robRead_2_data),
    .io_robRead_3_busy(csrRS_io_robRead_3_busy),
    .io_robRead_3_state(csrRS_io_robRead_3_state),
    .io_robRead_3_rd(csrRS_io_robRead_3_rd),
    .io_robRead_3_data(csrRS_io_robRead_3_data),
    .io_robRead_4_busy(csrRS_io_robRead_4_busy),
    .io_robRead_4_state(csrRS_io_robRead_4_state),
    .io_robRead_4_rd(csrRS_io_robRead_4_rd),
    .io_robRead_4_data(csrRS_io_robRead_4_data),
    .io_regStatus_0_owner(csrRS_io_regStatus_0_owner),
    .io_regStatus_1_owner(csrRS_io_regStatus_1_owner),
    .io_regStatus_2_owner(csrRS_io_regStatus_2_owner),
    .io_regStatus_3_owner(csrRS_io_regStatus_3_owner),
    .io_regStatus_4_owner(csrRS_io_regStatus_4_owner),
    .io_regStatus_5_owner(csrRS_io_regStatus_5_owner),
    .io_regStatus_6_owner(csrRS_io_regStatus_6_owner),
    .io_regStatus_7_owner(csrRS_io_regStatus_7_owner),
    .io_regStatus_8_owner(csrRS_io_regStatus_8_owner),
    .io_regStatus_9_owner(csrRS_io_regStatus_9_owner),
    .io_regStatus_10_owner(csrRS_io_regStatus_10_owner),
    .io_regStatus_11_owner(csrRS_io_regStatus_11_owner),
    .io_regStatus_12_owner(csrRS_io_regStatus_12_owner),
    .io_regStatus_13_owner(csrRS_io_regStatus_13_owner),
    .io_regStatus_14_owner(csrRS_io_regStatus_14_owner),
    .io_regStatus_15_owner(csrRS_io_regStatus_15_owner),
    .io_regStatus_16_owner(csrRS_io_regStatus_16_owner),
    .io_regStatus_17_owner(csrRS_io_regStatus_17_owner),
    .io_regStatus_18_owner(csrRS_io_regStatus_18_owner),
    .io_regStatus_19_owner(csrRS_io_regStatus_19_owner),
    .io_regStatus_20_owner(csrRS_io_regStatus_20_owner),
    .io_regStatus_21_owner(csrRS_io_regStatus_21_owner),
    .io_regStatus_22_owner(csrRS_io_regStatus_22_owner),
    .io_regStatus_23_owner(csrRS_io_regStatus_23_owner),
    .io_regStatus_24_owner(csrRS_io_regStatus_24_owner),
    .io_regStatus_25_owner(csrRS_io_regStatus_25_owner),
    .io_regStatus_26_owner(csrRS_io_regStatus_26_owner),
    .io_regStatus_27_owner(csrRS_io_regStatus_27_owner),
    .io_regStatus_28_owner(csrRS_io_regStatus_28_owner),
    .io_regStatus_29_owner(csrRS_io_regStatus_29_owner),
    .io_regStatus_30_owner(csrRS_io_regStatus_30_owner),
    .io_regStatus_31_owner(csrRS_io_regStatus_31_owner),
    .io_cdb_0_valid(csrRS_io_cdb_0_valid),
    .io_cdb_0_bits_data(csrRS_io_cdb_0_bits_data),
    .io_cdb_0_bits_id(csrRS_io_cdb_0_bits_id),
    .io_cdb_0_bits_rd(csrRS_io_cdb_0_bits_rd),
    .io_cdb_1_valid(csrRS_io_cdb_1_valid),
    .io_cdb_1_bits_data(csrRS_io_cdb_1_bits_data),
    .io_cdb_1_bits_id(csrRS_io_cdb_1_bits_id),
    .io_cdb_1_bits_rd(csrRS_io_cdb_1_bits_rd),
    .io_cdb_2_valid(csrRS_io_cdb_2_valid),
    .io_cdb_2_bits_data(csrRS_io_cdb_2_bits_data),
    .io_cdb_2_bits_id(csrRS_io_cdb_2_bits_id),
    .io_cdb_2_bits_rd(csrRS_io_cdb_2_bits_rd),
    .io_cdb_3_valid(csrRS_io_cdb_3_valid),
    .io_cdb_3_bits_data(csrRS_io_cdb_3_bits_data),
    .io_cdb_3_bits_id(csrRS_io_cdb_3_bits_id),
    .io_cdb_3_bits_rd(csrRS_io_cdb_3_bits_rd),
    .io_rf_0_addr(csrRS_io_rf_0_addr),
    .io_rf_0_data(csrRS_io_rf_0_data),
    .io_rf_1_addr(csrRS_io_rf_1_addr),
    .io_rf_1_data(csrRS_io_rf_1_data),
    .io_flush(csrRS_io_flush)
  );
  EdgeDetect edgeBackPressure ( // @[Core_1.scala 130:34]
    .clock(edgeBackPressure_clock),
    .io_in(edgeBackPressure_io_in),
    .io_change(edgeBackPressure_io_change)
  );
  Queue_5 fetch_pendingBranch ( // @[Core_1.scala 135:37]
    .clock(fetch_pendingBranch_clock),
    .reset(fetch_pendingBranch_reset),
    .io_enq_ready(fetch_pendingBranch_io_enq_ready),
    .io_enq_valid(fetch_pendingBranch_io_enq_valid),
    .io_enq_bits(fetch_pendingBranch_io_enq_bits),
    .io_deq_ready(fetch_pendingBranch_io_deq_ready),
    .io_deq_valid(fetch_pendingBranch_io_deq_valid),
    .io_deq_bits(fetch_pendingBranch_io_deq_bits)
  );
  Decoder_1 dec_decoders_0 ( // @[Core_1.scala 198:53]
    .io_inst(dec_decoders_0_io_inst),
    .io_out_brType(dec_decoders_0_io_out_brType),
    .io_out_wbType(dec_decoders_0_io_out_wbType),
    .io_out_lsuOp(dec_decoders_0_io_out_lsuOp),
    .io_out_aluOp(dec_decoders_0_io_out_aluOp),
    .io_out_opr1(dec_decoders_0_io_out_opr1),
    .io_out_opr2(dec_decoders_0_io_out_opr2),
    .io_out_immSrc(dec_decoders_0_io_out_immSrc),
    .io_out_immSign(dec_decoders_0_io_out_immSign),
    .io_out_csrOp(dec_decoders_0_io_out_csrOp),
    .io_out_excpType(dec_decoders_0_io_out_excpType)
  );
  Decoder_1 dec_decoders_1 ( // @[Core_1.scala 198:53]
    .io_inst(dec_decoders_1_io_inst),
    .io_out_brType(dec_decoders_1_io_out_brType),
    .io_out_wbType(dec_decoders_1_io_out_wbType),
    .io_out_lsuOp(dec_decoders_1_io_out_lsuOp),
    .io_out_aluOp(dec_decoders_1_io_out_aluOp),
    .io_out_opr1(dec_decoders_1_io_out_opr1),
    .io_out_opr2(dec_decoders_1_io_out_opr2),
    .io_out_immSrc(dec_decoders_1_io_out_immSrc),
    .io_out_immSign(dec_decoders_1_io_out_immSign),
    .io_out_csrOp(dec_decoders_1_io_out_csrOp),
    .io_out_excpType(dec_decoders_1_io_out_excpType)
  );
  Decoder_1 dec_decoders_2 ( // @[Core_1.scala 198:53]
    .io_inst(dec_decoders_2_io_inst),
    .io_out_brType(dec_decoders_2_io_out_brType),
    .io_out_wbType(dec_decoders_2_io_out_wbType),
    .io_out_lsuOp(dec_decoders_2_io_out_lsuOp),
    .io_out_aluOp(dec_decoders_2_io_out_aluOp),
    .io_out_opr1(dec_decoders_2_io_out_opr1),
    .io_out_opr2(dec_decoders_2_io_out_opr2),
    .io_out_immSrc(dec_decoders_2_io_out_immSrc),
    .io_out_immSign(dec_decoders_2_io_out_immSign),
    .io_out_csrOp(dec_decoders_2_io_out_csrOp),
    .io_out_excpType(dec_decoders_2_io_out_excpType)
  );
  Decoder_1 dec_decoders_3 ( // @[Core_1.scala 198:53]
    .io_inst(dec_decoders_3_io_inst),
    .io_out_brType(dec_decoders_3_io_out_brType),
    .io_out_wbType(dec_decoders_3_io_out_wbType),
    .io_out_lsuOp(dec_decoders_3_io_out_lsuOp),
    .io_out_aluOp(dec_decoders_3_io_out_aluOp),
    .io_out_opr1(dec_decoders_3_io_out_opr1),
    .io_out_opr2(dec_decoders_3_io_out_opr2),
    .io_out_immSrc(dec_decoders_3_io_out_immSrc),
    .io_out_immSign(dec_decoders_3_io_out_immSign),
    .io_out_csrOp(dec_decoders_3_io_out_csrOp),
    .io_out_excpType(dec_decoders_3_io_out_excpType)
  );
  DCache dcache ( // @[Core_1.scala 570:24]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_read_req_ready(dcache_io_read_req_ready),
    .io_read_req_valid(dcache_io_read_req_valid),
    .io_read_req_bits_addr(dcache_io_read_req_bits_addr),
    .io_read_resp_ready(dcache_io_read_resp_ready),
    .io_read_resp_valid(dcache_io_read_resp_valid),
    .io_read_resp_bits_data(dcache_io_read_resp_bits_data),
    .io_write_req_ready(dcache_io_write_req_ready),
    .io_write_req_valid(dcache_io_write_req_valid),
    .io_write_req_bits_addr(dcache_io_write_req_bits_addr),
    .io_write_req_bits_data(dcache_io_write_req_bits_data),
    .io_write_req_bits_mask(dcache_io_write_req_bits_mask),
    .io_write_resp_ready(dcache_io_write_resp_ready),
    .io_write_resp_valid(dcache_io_write_resp_valid),
    .io_tlbus_req_ready(dcache_io_tlbus_req_ready),
    .io_tlbus_req_valid(dcache_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(dcache_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(dcache_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(dcache_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(dcache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(dcache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(dcache_io_tlbus_resp_bits_data),
    .io_flush(dcache_io_flush)
  );
  TLXbar xbar ( // @[Core_1.scala 695:22]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_masterFace_in_0_ready(xbar_io_masterFace_in_0_ready),
    .io_masterFace_in_0_valid(xbar_io_masterFace_in_0_valid),
    .io_masterFace_in_0_bits_address(xbar_io_masterFace_in_0_bits_address),
    .io_masterFace_in_1_ready(xbar_io_masterFace_in_1_ready),
    .io_masterFace_in_1_valid(xbar_io_masterFace_in_1_valid),
    .io_masterFace_in_1_bits_opcode(xbar_io_masterFace_in_1_bits_opcode),
    .io_masterFace_in_1_bits_address(xbar_io_masterFace_in_1_bits_address),
    .io_masterFace_in_1_bits_data(xbar_io_masterFace_in_1_bits_data),
    .io_masterFace_out_0_valid(xbar_io_masterFace_out_0_valid),
    .io_masterFace_out_0_bits_opcode(xbar_io_masterFace_out_0_bits_opcode),
    .io_masterFace_out_0_bits_data(xbar_io_masterFace_out_0_bits_data),
    .io_masterFace_out_1_valid(xbar_io_masterFace_out_1_valid),
    .io_masterFace_out_1_bits_opcode(xbar_io_masterFace_out_1_bits_opcode),
    .io_masterFace_out_1_bits_data(xbar_io_masterFace_out_1_bits_data),
    .io_slaveFace_in_0_ready(xbar_io_slaveFace_in_0_ready),
    .io_slaveFace_in_0_valid(xbar_io_slaveFace_in_0_valid),
    .io_slaveFace_in_0_bits_opcode(xbar_io_slaveFace_in_0_bits_opcode),
    .io_slaveFace_in_0_bits_size(xbar_io_slaveFace_in_0_bits_size),
    .io_slaveFace_in_0_bits_address(xbar_io_slaveFace_in_0_bits_address),
    .io_slaveFace_in_0_bits_data(xbar_io_slaveFace_in_0_bits_data),
    .io_slaveFace_out_0_ready(xbar_io_slaveFace_out_0_ready),
    .io_slaveFace_out_0_valid(xbar_io_slaveFace_out_0_valid),
    .io_slaveFace_out_0_bits_opcode(xbar_io_slaveFace_out_0_bits_opcode),
    .io_slaveFace_out_0_bits_data(xbar_io_slaveFace_out_0_bits_data)
  );
  SingleROM rom ( // @[Core_1.scala 696:21]
    .clock(rom_clock),
    .reset(rom_reset),
    .io_req_ready(rom_io_req_ready),
    .io_req_valid(rom_io_req_valid),
    .io_req_bits_opcode(rom_io_req_bits_opcode),
    .io_req_bits_size(rom_io_req_bits_size),
    .io_req_bits_address(rom_io_req_bits_address),
    .io_req_bits_data(rom_io_req_bits_data),
    .io_resp_ready(rom_io_resp_ready),
    .io_resp_valid(rom_io_resp_valid),
    .io_resp_bits_opcode(rom_io_resp_bits_opcode),
    .io_resp_bits_size(rom_io_resp_bits_size),
    .io_resp_bits_data(rom_io_resp_bits_data)
  );
  assign io_out_state_intRegState_regState_0 = rf_regState_0_regState_0; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_1 = rf_regState_0_regState_1; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_2 = rf_regState_0_regState_2; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_3 = rf_regState_0_regState_3; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_4 = rf_regState_0_regState_4; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_5 = rf_regState_0_regState_5; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_6 = rf_regState_0_regState_6; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_7 = rf_regState_0_regState_7; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_8 = rf_regState_0_regState_8; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_9 = rf_regState_0_regState_9; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_10 = rf_regState_0_regState_10; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_11 = rf_regState_0_regState_11; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_12 = rf_regState_0_regState_12; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_13 = rf_regState_0_regState_13; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_14 = rf_regState_0_regState_14; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_15 = rf_regState_0_regState_15; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_16 = rf_regState_0_regState_16; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_17 = rf_regState_0_regState_17; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_18 = rf_regState_0_regState_18; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_19 = rf_regState_0_regState_19; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_20 = rf_regState_0_regState_20; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_21 = rf_regState_0_regState_21; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_22 = rf_regState_0_regState_22; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_23 = rf_regState_0_regState_23; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_24 = rf_regState_0_regState_24; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_25 = rf_regState_0_regState_25; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_26 = rf_regState_0_regState_26; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_27 = rf_regState_0_regState_27; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_28 = rf_regState_0_regState_28; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_29 = rf_regState_0_regState_29; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_30 = rf_regState_0_regState_30; // @[Core_1.scala 681:28]
  assign io_out_state_intRegState_regState_31 = rf_regState_0_regState_31; // @[Core_1.scala 681:28]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core_1.scala 687:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core_1.scala 687:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core_1.scala 687:28]
  assign io_out_state_csrState_mcycle = csrStage_1_csrState_mcycle; // @[Core_1.scala 684:28]
  assign io_out_state_csrState_mcycleh = csrStage_1_csrState_mcycleh; // @[Core_1.scala 684:28]
  assign ib_clock = clock;
  assign ib_reset = reset;
  assign ib_io_in_valid = fetch_fire & (~blockValid | willWakeUp) & ~willBlock; // @[Core_1.scala 172:66]
  assign ib_io_in_bits_icache_data = icache_io_read_resp_bits_data; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_addr = icache_io_read_resp_bits_addr; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_inst_0 = icache_io_read_resp_bits_inst_0; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_inst_1 = icache_io_read_resp_bits_inst_1; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_inst_2 = icache_io_read_resp_bits_inst_2; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_inst_3 = icache_io_read_resp_bits_inst_3; // @[Core_1.scala 173:26]
  assign ib_io_in_bits_icache_size = icacheRespIsAlignAddr ? icache_io_read_resp_bits_size :
    _ib_io_in_bits_icache_size_T_2; // @[Core_1.scala 177:37]
  assign ib_io_in_bits_pc = icache_io_read_resp_bits_addr; // @[Core_1.scala 178:22]
  assign ib_io_in_bits_flush = globalBrTaken | reset; // @[Core_1.scala 179:42]
  assign ib_io_out_ready = ~dec_full | dec_fire; // @[Core_1.scala 193:28]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = preFetchInst & io_in_start; // @[Core_1.scala 150:46]
  assign icache_io_read_req_bits_addr = _lastPc_T ? _icache_io_read_req_bits_addr_T_1 :
    _icache_io_read_req_bits_addr_T_2; // @[Core_1.scala 151:40]
  assign icache_io_read_resp_ready = ib_io_in_ready; // @[Core_1.scala 152:31]
  assign icache_io_tlbus_req_ready = xbar_io_masterFace_in_0_ready; // @[Core_1.scala 698:25]
  assign icache_io_tlbus_resp_valid = xbar_io_masterFace_out_0_valid; // @[Core_1.scala 699:26]
  assign icache_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_0_bits_opcode; // @[Core_1.scala 699:26]
  assign icache_io_tlbus_resp_bits_data = xbar_io_masterFace_out_0_bits_data; // @[Core_1.scala 699:26]
  assign icache_io_flush = globalBrTaken; // @[Core_1.scala 153:21]
  assign rf_clock = clock;
  assign rf_reset = reset;
  assign rf_io_r_0_addr = aluRS_io_rf_0_addr; // @[Core_1.scala 651:20]
  assign rf_io_r_1_addr = aluRS_io_rf_1_addr; // @[Core_1.scala 652:20]
  assign rf_io_r_2_addr = bruRS_io_rf_0_addr; // @[Core_1.scala 653:20]
  assign rf_io_r_3_addr = bruRS_io_rf_1_addr; // @[Core_1.scala 654:20]
  assign rf_io_r_4_addr = lsuRS_io_rf_0_addr; // @[Core_1.scala 655:20]
  assign rf_io_r_5_addr = lsuRS_io_rf_1_addr; // @[Core_1.scala 656:20]
  assign rf_io_r_6_addr = csrRS_io_rf_0_addr; // @[Core_1.scala 657:20]
  assign rf_io_r_7_addr = csrRS_io_rf_1_addr; // @[Core_1.scala 658:20]
  assign rf_io_w_0_addr = rob_io_deq_bits_rd; // @[Core_1.scala 668:21]
  assign rf_io_w_0_en = rob_io_deq_bits_rdWrEn & _csrExcpValid_T; // @[Core_1.scala 670:45]
  assign rf_io_w_0_data = rob_io_deq_bits_data; // @[Core_1.scala 669:21]
  assign rob_clock = clock;
  assign rob_reset = reset;
  assign rob_io_enq_valid = (issue_aluValid | issue_bruValid | issue_lsuValid | issue_csrValid) & issue_full & rsReady; // @[Core_1.scala 462:110]
  assign rob_io_enq_bits_rd = invalidRd ? 5'h0 : rd; // @[Core_1.scala 477:23]
  assign rob_io_enq_bits_fuValid = {rob_io_enq_bits_fuValid_hi,rob_io_enq_bits_fuValid_lo}; // @[Cat.scala 33:92]
  assign rob_io_enq_bits_fuOp = {{3'd0}, _rob_io_enq_bits_fuOp_T_3}; // @[Core_1.scala 463:26]
  assign rob_io_enq_bits_pc = issue_stagePc; // @[Core_1.scala 471:24]
  assign rob_io_enq_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign rob_io_deq_ready = 1'h1; // @[Core_1.scala 627:22]
  assign rob_io_rs_0_valid = aluRS_io_robOut_valid; // @[Core_1.scala 600:20]
  assign rob_io_rs_0_bits_id = aluRS_io_robOut_bits_id; // @[Core_1.scala 600:20]
  assign rob_io_rs_1_valid = bruRS_io_robOut_valid; // @[Core_1.scala 609:20]
  assign rob_io_rs_1_bits_id = bruRS_io_robOut_bits_id; // @[Core_1.scala 609:20]
  assign rob_io_rs_2_valid = lsuRS_io_robOut_valid; // @[Core_1.scala 616:20]
  assign rob_io_rs_2_bits_id = lsuRS_io_robOut_bits_id; // @[Core_1.scala 616:20]
  assign rob_io_rs_3_valid = csrRS_io_robOut_valid; // @[Core_1.scala 625:20]
  assign rob_io_rs_3_bits_id = csrRS_io_robOut_bits_id; // @[Core_1.scala 625:20]
  assign rob_io_fu_0_valid = aluStage_1_io_out_valid; // @[Core_1.scala 595:26]
  assign rob_io_fu_0_bits_id = aluStage_1_io_out_bits_id[2:0]; // @[Core_1.scala 598:28]
  assign rob_io_fu_0_bits_data = aluStage_1_io_out_bits_data; // @[Core_1.scala 597:30]
  assign rob_io_fu_1_valid = bruStage_1_io_out_valid; // @[Core_1.scala 602:26]
  assign rob_io_fu_1_bits_id = bruStage_1_io_out_bits_id[2:0]; // @[Core_1.scala 605:28]
  assign rob_io_fu_1_bits_data = bruStage_1_io_out_bits_data; // @[Core_1.scala 604:30]
  assign rob_io_fu_1_bits_brAddr = bruStage_1_io_out_bits_brAddr; // @[Core_1.scala 607:32]
  assign rob_io_fu_1_bits_brTaken = bruStage_1_io_out_bits_brTaken; // @[Core_1.scala 608:33]
  assign rob_io_fu_2_valid = lsuStage_1_io_out_valid; // @[Core_1.scala 611:26]
  assign rob_io_fu_2_bits_id = lsuStage_1_io_out_bits_id[2:0]; // @[Core_1.scala 614:28]
  assign rob_io_fu_2_bits_data = lsuStage_1_io_out_bits_data; // @[Core_1.scala 613:30]
  assign rob_io_fu_3_valid = csrStage_1_io_out_valid; // @[Core_1.scala 618:26]
  assign rob_io_fu_3_bits_id = csrStage_1_io_out_bits_id[2:0]; // @[Core_1.scala 621:28]
  assign rob_io_fu_3_bits_data = csrStage_1_io_out_bits_data; // @[Core_1.scala 620:30]
  assign rob_io_fu_3_bits_excpAddr = csrStage_1_io_out_bits_excpAddr; // @[Core_1.scala 624:34]
  assign rob_io_fu_3_bits_excpValid = csrStage_1_io_out_bits_excpValid; // @[Core_1.scala 623:35]
  assign rob_io_flush = globalBrTaken | reset; // @[Core_1.scala 479:35]
  assign aluStage_1_clock = clock;
  assign aluStage_1_reset = reset;
  assign aluStage_1_io_in_valid = aluRS_io_deq_valid; // @[Core_1.scala 511:28]
  assign aluStage_1_io_in_bits_opr1 = aluRS_io_deq_bits_opr1; // @[Core_1.scala 517:32]
  assign aluStage_1_io_in_bits_opr2 = aluRS_io_deq_bits_opr2; // @[Core_1.scala 518:32]
  assign aluStage_1_io_in_bits_aluOp = aluRS_io_deq_bits_op[4:0]; // @[Core_1.scala 512:33]
  assign aluStage_1_io_in_bits_immSrc = aluRS_io_deq_bits_immSrc; // @[Core_1.scala 513:34]
  assign aluStage_1_io_in_bits_immSign = aluRS_io_deq_bits_immSign; // @[Core_1.scala 514:35]
  assign aluStage_1_io_in_bits_rs1Val = aluRS_io_deq_bits_rs1Val; // @[Core_1.scala 520:34]
  assign aluStage_1_io_in_bits_rs2Val = aluRS_io_deq_bits_rs2Val; // @[Core_1.scala 521:34]
  assign aluStage_1_io_in_bits_inst = aluRS_io_deq_bits_inst; // @[Core_1.scala 515:32]
  assign aluStage_1_io_in_bits_pc = aluRS_io_deq_bits_pc; // @[Core_1.scala 516:30]
  assign aluStage_1_io_in_bits_id = aluRS_io_deq_bits_ROBId; // @[Core_1.scala 519:30]
  assign aluStage_1_io_flush = globalBrTaken | reset; // @[Core_1.scala 522:42]
  assign aluRS_clock = clock;
  assign aluRS_reset = reset;
  assign aluRS_io_enq_valid = issue_instFire & issue_aluValid; // @[Core_1.scala 505:43]
  assign aluRS_io_enq_bits_op = {{3'd0}, _rob_io_enq_bits_fuOp_T_3}; // @[Core_1.scala 482:23 489:16]
  assign aluRS_io_enq_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign aluRS_io_enq_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign aluRS_io_enq_bits_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 266:24]
  assign aluRS_io_enq_bits_rs2 = issue_chosenDecodesigs_opr2 == 4'h2 ? rs2 : 5'h0; // @[Core_1.scala 267:24]
  assign aluRS_io_enq_bits_ROBId = {{5'd0}, rob_io_id}; // @[Core_1.scala 482:23 483:19]
  assign aluRS_io_enq_bits_rs1ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign aluRS_io_enq_bits_rs2ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign aluRS_io_enq_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign aluRS_io_enq_bits_immSign = _issue_chosenDecodesigs_T[0] & issue_decodeSigs_0_immSign |
    _issue_chosenDecodesigs_T[1] & issue_decodeSigs_1_immSign | _issue_chosenDecodesigs_T[2] &
    issue_decodeSigs_2_immSign | _issue_chosenDecodesigs_T[3] & issue_decodeSigs_3_immSign; // @[Mux.scala 27:73]
  assign aluRS_io_enq_bits_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  assign aluRS_io_enq_bits_pc = issue_stagePc; // @[Core_1.scala 482:23 488:16]
  assign aluRS_io_enq_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign aluRS_io_deq_ready = aluStage_1_io_in_ready; // @[Core_1.scala 509:24]
  assign aluRS_io_robRead_0_busy = rob_io_read_0_busy; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_0_state = rob_io_read_0_state; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_0_rd = rob_io_read_0_rd; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_0_data = rob_io_read_0_data; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_1_busy = rob_io_read_1_busy; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_1_state = rob_io_read_1_state; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_1_rd = rob_io_read_1_rd; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_1_data = rob_io_read_1_data; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_2_busy = rob_io_read_2_busy; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_2_state = rob_io_read_2_state; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_2_rd = rob_io_read_2_rd; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_2_data = rob_io_read_2_data; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_3_busy = rob_io_read_3_busy; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_3_state = rob_io_read_3_state; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_3_rd = rob_io_read_3_rd; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_3_data = rob_io_read_3_data; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_4_busy = rob_io_read_4_busy; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_4_state = rob_io_read_4_state; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_4_rd = rob_io_read_4_rd; // @[Core_1.scala 646:16]
  assign aluRS_io_robRead_4_data = rob_io_read_4_data; // @[Core_1.scala 646:16]
  assign aluRS_io_regStatus_0_owner = rob_io_regStatus_0_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_1_owner = rob_io_regStatus_1_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_2_owner = rob_io_regStatus_2_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_3_owner = rob_io_regStatus_3_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_4_owner = rob_io_regStatus_4_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_5_owner = rob_io_regStatus_5_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_6_owner = rob_io_regStatus_6_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_7_owner = rob_io_regStatus_7_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_8_owner = rob_io_regStatus_8_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_9_owner = rob_io_regStatus_9_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_10_owner = rob_io_regStatus_10_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_11_owner = rob_io_regStatus_11_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_12_owner = rob_io_regStatus_12_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_13_owner = rob_io_regStatus_13_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_14_owner = rob_io_regStatus_14_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_15_owner = rob_io_regStatus_15_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_16_owner = rob_io_regStatus_16_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_17_owner = rob_io_regStatus_17_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_18_owner = rob_io_regStatus_18_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_19_owner = rob_io_regStatus_19_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_20_owner = rob_io_regStatus_20_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_21_owner = rob_io_regStatus_21_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_22_owner = rob_io_regStatus_22_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_23_owner = rob_io_regStatus_23_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_24_owner = rob_io_regStatus_24_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_25_owner = rob_io_regStatus_25_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_26_owner = rob_io_regStatus_26_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_27_owner = rob_io_regStatus_27_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_28_owner = rob_io_regStatus_28_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_29_owner = rob_io_regStatus_29_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_30_owner = rob_io_regStatus_30_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_regStatus_31_owner = rob_io_regStatus_31_owner; // @[Core_1.scala 507:24]
  assign aluRS_io_cdb_0_valid = aluStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign aluRS_io_cdb_0_bits_data = aluStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign aluRS_io_cdb_0_bits_id = aluStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign aluRS_io_cdb_0_bits_rd = aluStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign aluRS_io_cdb_1_valid = bruStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign aluRS_io_cdb_1_bits_data = bruStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign aluRS_io_cdb_1_bits_id = bruStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign aluRS_io_cdb_1_bits_rd = bruStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign aluRS_io_cdb_2_valid = lsuStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign aluRS_io_cdb_2_bits_data = lsuStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign aluRS_io_cdb_2_bits_id = lsuStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign aluRS_io_cdb_2_bits_rd = lsuStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign aluRS_io_cdb_3_valid = csrStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign aluRS_io_cdb_3_bits_data = csrStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign aluRS_io_cdb_3_bits_id = csrStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign aluRS_io_cdb_3_bits_rd = csrStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign aluRS_io_rf_0_data = rf_io_r_0_data; // @[Core_1.scala 651:20]
  assign aluRS_io_rf_1_data = rf_io_r_1_data; // @[Core_1.scala 652:20]
  assign aluRS_io_flush = globalBrTaken | reset; // @[Core_1.scala 508:37]
  assign bruStage_1_clock = clock;
  assign bruStage_1_reset = reset;
  assign bruStage_1_io_in_valid = bruRS_io_deq_valid; // @[Core_1.scala 534:28]
  assign bruStage_1_io_in_bits_opr1 = bruRS_io_deq_bits_opr1; // @[Core_1.scala 539:32]
  assign bruStage_1_io_in_bits_opr2 = bruRS_io_deq_bits_opr2; // @[Core_1.scala 540:32]
  assign bruStage_1_io_in_bits_bruOp = bruRS_io_deq_bits_op[3:0]; // @[Core_1.scala 535:33]
  assign bruStage_1_io_in_bits_immSrc = bruRS_io_deq_bits_immSrc; // @[Core_1.scala 536:34]
  assign bruStage_1_io_in_bits_rs1Val = bruRS_io_deq_bits_rs1Val; // @[Core_1.scala 542:34]
  assign bruStage_1_io_in_bits_rs2Val = bruRS_io_deq_bits_rs2Val; // @[Core_1.scala 543:34]
  assign bruStage_1_io_in_bits_inst = bruRS_io_deq_bits_inst; // @[Core_1.scala 537:32]
  assign bruStage_1_io_in_bits_pc = bruRS_io_deq_bits_pc; // @[Core_1.scala 538:30]
  assign bruStage_1_io_in_bits_id = bruRS_io_deq_bits_ROBId; // @[Core_1.scala 541:30]
  assign bruStage_1_io_flush = globalBrTaken | reset; // @[Core_1.scala 544:42]
  assign bruRS_clock = clock;
  assign bruRS_reset = reset;
  assign bruRS_io_enq_valid = issue_instFire & issue_bruValid; // @[Core_1.scala 528:43]
  assign bruRS_io_enq_bits_op = {{3'd0}, _rob_io_enq_bits_fuOp_T_3}; // @[Core_1.scala 482:23 489:16]
  assign bruRS_io_enq_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign bruRS_io_enq_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign bruRS_io_enq_bits_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 266:24]
  assign bruRS_io_enq_bits_rs2 = issue_chosenDecodesigs_opr2 == 4'h2 ? rs2 : 5'h0; // @[Core_1.scala 267:24]
  assign bruRS_io_enq_bits_ROBId = {{5'd0}, rob_io_id}; // @[Core_1.scala 482:23 483:19]
  assign bruRS_io_enq_bits_rs1ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign bruRS_io_enq_bits_rs2ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign bruRS_io_enq_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign bruRS_io_enq_bits_immSign = _issue_chosenDecodesigs_T[0] & issue_decodeSigs_0_immSign |
    _issue_chosenDecodesigs_T[1] & issue_decodeSigs_1_immSign | _issue_chosenDecodesigs_T[2] &
    issue_decodeSigs_2_immSign | _issue_chosenDecodesigs_T[3] & issue_decodeSigs_3_immSign; // @[Mux.scala 27:73]
  assign bruRS_io_enq_bits_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  assign bruRS_io_enq_bits_pc = issue_stagePc; // @[Core_1.scala 482:23 488:16]
  assign bruRS_io_enq_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign bruRS_io_deq_ready = bruStage_1_io_in_ready; // @[Core_1.scala 532:24]
  assign bruRS_io_robRead_0_busy = rob_io_read_0_busy; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_0_state = rob_io_read_0_state; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_0_rd = rob_io_read_0_rd; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_0_data = rob_io_read_0_data; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_1_busy = rob_io_read_1_busy; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_1_state = rob_io_read_1_state; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_1_rd = rob_io_read_1_rd; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_1_data = rob_io_read_1_data; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_2_busy = rob_io_read_2_busy; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_2_state = rob_io_read_2_state; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_2_rd = rob_io_read_2_rd; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_2_data = rob_io_read_2_data; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_3_busy = rob_io_read_3_busy; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_3_state = rob_io_read_3_state; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_3_rd = rob_io_read_3_rd; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_3_data = rob_io_read_3_data; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_4_busy = rob_io_read_4_busy; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_4_state = rob_io_read_4_state; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_4_rd = rob_io_read_4_rd; // @[Core_1.scala 646:16]
  assign bruRS_io_robRead_4_data = rob_io_read_4_data; // @[Core_1.scala 646:16]
  assign bruRS_io_regStatus_0_owner = rob_io_regStatus_0_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_1_owner = rob_io_regStatus_1_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_2_owner = rob_io_regStatus_2_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_3_owner = rob_io_regStatus_3_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_4_owner = rob_io_regStatus_4_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_5_owner = rob_io_regStatus_5_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_6_owner = rob_io_regStatus_6_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_7_owner = rob_io_regStatus_7_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_8_owner = rob_io_regStatus_8_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_9_owner = rob_io_regStatus_9_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_10_owner = rob_io_regStatus_10_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_11_owner = rob_io_regStatus_11_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_12_owner = rob_io_regStatus_12_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_13_owner = rob_io_regStatus_13_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_14_owner = rob_io_regStatus_14_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_15_owner = rob_io_regStatus_15_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_16_owner = rob_io_regStatus_16_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_17_owner = rob_io_regStatus_17_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_18_owner = rob_io_regStatus_18_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_19_owner = rob_io_regStatus_19_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_20_owner = rob_io_regStatus_20_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_21_owner = rob_io_regStatus_21_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_22_owner = rob_io_regStatus_22_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_23_owner = rob_io_regStatus_23_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_24_owner = rob_io_regStatus_24_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_25_owner = rob_io_regStatus_25_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_26_owner = rob_io_regStatus_26_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_27_owner = rob_io_regStatus_27_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_28_owner = rob_io_regStatus_28_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_29_owner = rob_io_regStatus_29_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_30_owner = rob_io_regStatus_30_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_regStatus_31_owner = rob_io_regStatus_31_owner; // @[Core_1.scala 530:24]
  assign bruRS_io_cdb_0_valid = aluStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign bruRS_io_cdb_0_bits_data = aluStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign bruRS_io_cdb_0_bits_id = aluStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign bruRS_io_cdb_0_bits_rd = aluStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign bruRS_io_cdb_1_valid = bruStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign bruRS_io_cdb_1_bits_data = bruStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign bruRS_io_cdb_1_bits_id = bruStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign bruRS_io_cdb_1_bits_rd = bruStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign bruRS_io_cdb_2_valid = lsuStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign bruRS_io_cdb_2_bits_data = lsuStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign bruRS_io_cdb_2_bits_id = lsuStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign bruRS_io_cdb_2_bits_rd = lsuStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign bruRS_io_cdb_3_valid = csrStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign bruRS_io_cdb_3_bits_data = csrStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign bruRS_io_cdb_3_bits_id = csrStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign bruRS_io_cdb_3_bits_rd = csrStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign bruRS_io_rf_0_data = rf_io_r_2_data; // @[Core_1.scala 653:20]
  assign bruRS_io_rf_1_data = rf_io_r_3_data; // @[Core_1.scala 654:20]
  assign bruRS_io_flush = globalBrTaken | reset; // @[Core_1.scala 531:37]
  assign lsuStage_1_clock = clock;
  assign lsuStage_1_reset = reset;
  assign lsuStage_1_io_in_valid = lsuRS_io_deq_valid; // @[Core_1.scala 555:28]
  assign lsuStage_1_io_in_bits_lsuOp = lsuRS_io_deq_bits_op[4:0]; // @[Core_1.scala 556:33]
  assign lsuStage_1_io_in_bits_immSrc = lsuRS_io_deq_bits_immSrc; // @[Core_1.scala 557:34]
  assign lsuStage_1_io_in_bits_rs1Val = lsuRS_io_deq_bits_rs1Val; // @[Core_1.scala 560:34]
  assign lsuStage_1_io_in_bits_rs2Val = lsuRS_io_deq_bits_rs2Val; // @[Core_1.scala 561:34]
  assign lsuStage_1_io_in_bits_inst = lsuRS_io_deq_bits_inst; // @[Core_1.scala 558:32]
  assign lsuStage_1_io_in_bits_id = lsuRS_io_deq_bits_ROBId; // @[Core_1.scala 559:30]
  assign lsuStage_1_io_cache_read_req_ready = dcache_io_read_req_ready; // @[Core_1.scala 572:30]
  assign lsuStage_1_io_cache_read_resp_valid = dcache_io_read_resp_valid; // @[Core_1.scala 572:30]
  assign lsuStage_1_io_cache_read_resp_bits_data = dcache_io_read_resp_bits_data; // @[Core_1.scala 572:30]
  assign lsuStage_1_io_cache_write_req_ready = dcache_io_write_req_ready; // @[Core_1.scala 573:31]
  assign lsuStage_1_io_cache_write_resp_valid = dcache_io_write_resp_valid; // @[Core_1.scala 573:31]
  assign lsuStage_1_io_rob_bits_id = rob_io_deq_bits_id; // @[Core_1.scala 567:31]
  assign lsuStage_1_io_flush = globalBrTaken | reset; // @[Core_1.scala 562:42]
  assign lsuRS_clock = clock;
  assign lsuRS_reset = reset;
  assign lsuRS_io_enq_valid = issue_instFire & issue_lsuValid; // @[Core_1.scala 549:43]
  assign lsuRS_io_enq_bits_op = {{3'd0}, _rob_io_enq_bits_fuOp_T_3}; // @[Core_1.scala 482:23 489:16]
  assign lsuRS_io_enq_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign lsuRS_io_enq_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign lsuRS_io_enq_bits_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 266:24]
  assign lsuRS_io_enq_bits_rs2 = issue_chosenDecodesigs_opr2 == 4'h2 ? rs2 : 5'h0; // @[Core_1.scala 267:24]
  assign lsuRS_io_enq_bits_ROBId = {{5'd0}, rob_io_id}; // @[Core_1.scala 482:23 483:19]
  assign lsuRS_io_enq_bits_rs1ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign lsuRS_io_enq_bits_rs2ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign lsuRS_io_enq_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign lsuRS_io_enq_bits_immSign = _issue_chosenDecodesigs_T[0] & issue_decodeSigs_0_immSign |
    _issue_chosenDecodesigs_T[1] & issue_decodeSigs_1_immSign | _issue_chosenDecodesigs_T[2] &
    issue_decodeSigs_2_immSign | _issue_chosenDecodesigs_T[3] & issue_decodeSigs_3_immSign; // @[Mux.scala 27:73]
  assign lsuRS_io_enq_bits_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  assign lsuRS_io_enq_bits_pc = issue_stagePc; // @[Core_1.scala 482:23 488:16]
  assign lsuRS_io_enq_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign lsuRS_io_deq_ready = lsuStage_1_io_in_ready; // @[Core_1.scala 553:24]
  assign lsuRS_io_robRead_0_busy = rob_io_read_0_busy; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_0_state = rob_io_read_0_state; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_0_rd = rob_io_read_0_rd; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_0_data = rob_io_read_0_data; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_1_busy = rob_io_read_1_busy; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_1_state = rob_io_read_1_state; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_1_rd = rob_io_read_1_rd; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_1_data = rob_io_read_1_data; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_2_busy = rob_io_read_2_busy; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_2_state = rob_io_read_2_state; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_2_rd = rob_io_read_2_rd; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_2_data = rob_io_read_2_data; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_3_busy = rob_io_read_3_busy; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_3_state = rob_io_read_3_state; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_3_rd = rob_io_read_3_rd; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_3_data = rob_io_read_3_data; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_4_busy = rob_io_read_4_busy; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_4_state = rob_io_read_4_state; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_4_rd = rob_io_read_4_rd; // @[Core_1.scala 646:16]
  assign lsuRS_io_robRead_4_data = rob_io_read_4_data; // @[Core_1.scala 646:16]
  assign lsuRS_io_regStatus_0_owner = rob_io_regStatus_0_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_1_owner = rob_io_regStatus_1_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_2_owner = rob_io_regStatus_2_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_3_owner = rob_io_regStatus_3_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_4_owner = rob_io_regStatus_4_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_5_owner = rob_io_regStatus_5_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_6_owner = rob_io_regStatus_6_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_7_owner = rob_io_regStatus_7_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_8_owner = rob_io_regStatus_8_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_9_owner = rob_io_regStatus_9_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_10_owner = rob_io_regStatus_10_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_11_owner = rob_io_regStatus_11_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_12_owner = rob_io_regStatus_12_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_13_owner = rob_io_regStatus_13_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_14_owner = rob_io_regStatus_14_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_15_owner = rob_io_regStatus_15_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_16_owner = rob_io_regStatus_16_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_17_owner = rob_io_regStatus_17_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_18_owner = rob_io_regStatus_18_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_19_owner = rob_io_regStatus_19_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_20_owner = rob_io_regStatus_20_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_21_owner = rob_io_regStatus_21_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_22_owner = rob_io_regStatus_22_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_23_owner = rob_io_regStatus_23_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_24_owner = rob_io_regStatus_24_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_25_owner = rob_io_regStatus_25_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_26_owner = rob_io_regStatus_26_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_27_owner = rob_io_regStatus_27_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_28_owner = rob_io_regStatus_28_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_29_owner = rob_io_regStatus_29_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_30_owner = rob_io_regStatus_30_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_regStatus_31_owner = rob_io_regStatus_31_owner; // @[Core_1.scala 551:24]
  assign lsuRS_io_cdb_0_valid = aluStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign lsuRS_io_cdb_0_bits_data = aluStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign lsuRS_io_cdb_0_bits_id = aluStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign lsuRS_io_cdb_0_bits_rd = aluStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign lsuRS_io_cdb_1_valid = bruStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign lsuRS_io_cdb_1_bits_data = bruStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign lsuRS_io_cdb_1_bits_id = bruStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign lsuRS_io_cdb_1_bits_rd = bruStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign lsuRS_io_cdb_2_valid = lsuStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign lsuRS_io_cdb_2_bits_data = lsuStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign lsuRS_io_cdb_2_bits_id = lsuStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign lsuRS_io_cdb_2_bits_rd = lsuStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign lsuRS_io_cdb_3_valid = csrStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign lsuRS_io_cdb_3_bits_data = csrStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign lsuRS_io_cdb_3_bits_id = csrStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign lsuRS_io_cdb_3_bits_rd = csrStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign lsuRS_io_rf_0_data = rf_io_r_4_data; // @[Core_1.scala 655:20]
  assign lsuRS_io_rf_1_data = rf_io_r_5_data; // @[Core_1.scala 656:20]
  assign lsuRS_io_flush = globalBrTaken | reset; // @[Core_1.scala 552:37]
  assign csrStage_1_clock = clock;
  assign csrStage_1_reset = reset;
  assign csrStage_1_io_in_valid = csrRS_io_deq_valid; // @[Core_1.scala 583:28]
  assign csrStage_1_io_in_bits_csrOp = csrRS_io_deq_bits_op[2:0]; // @[Core_1.scala 585:33]
  assign csrStage_1_io_in_bits_excpType = csrRS_io_deq_bits_excpType; // @[Core_1.scala 584:36]
  assign csrStage_1_io_in_bits_rs1Val = csrRS_io_deq_bits_rs1Val; // @[Core_1.scala 588:34]
  assign csrStage_1_io_in_bits_inst = csrRS_io_deq_bits_inst; // @[Core_1.scala 586:32]
  assign csrStage_1_io_in_bits_id = csrRS_io_deq_bits_ROBId; // @[Core_1.scala 587:30]
  assign csrStage_1_io_flush = globalBrTaken | reset; // @[Core_1.scala 590:42]
  assign csrRS_clock = clock;
  assign csrRS_reset = reset;
  assign csrRS_io_enq_valid = issue_instFire & issue_csrValid; // @[Core_1.scala 577:43]
  assign csrRS_io_enq_bits_op = {{3'd0}, _rob_io_enq_bits_fuOp_T_3}; // @[Core_1.scala 482:23 489:16]
  assign csrRS_io_enq_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign csrRS_io_enq_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign csrRS_io_enq_bits_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 266:24]
  assign csrRS_io_enq_bits_rs2 = issue_chosenDecodesigs_opr2 == 4'h2 ? rs2 : 5'h0; // @[Core_1.scala 267:24]
  assign csrRS_io_enq_bits_ROBId = {{5'd0}, rob_io_id}; // @[Core_1.scala 482:23 483:19]
  assign csrRS_io_enq_bits_rs1ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign csrRS_io_enq_bits_rs2ROBId = 5'h1f == issue_rs1 ? rob_io_regStatus_31_owner : _GEN_106; // @[Core_1.scala 500:{22,22}]
  assign csrRS_io_enq_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign csrRS_io_enq_bits_immSign = _issue_chosenDecodesigs_T[0] & issue_decodeSigs_0_immSign |
    _issue_chosenDecodesigs_T[1] & issue_decodeSigs_1_immSign | _issue_chosenDecodesigs_T[2] &
    issue_decodeSigs_2_immSign | _issue_chosenDecodesigs_T[3] & issue_decodeSigs_3_immSign; // @[Mux.scala 27:73]
  assign csrRS_io_enq_bits_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  assign csrRS_io_enq_bits_pc = issue_stagePc; // @[Core_1.scala 482:23 488:16]
  assign csrRS_io_enq_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign csrRS_io_deq_ready = csrStage_1_io_in_ready; // @[Core_1.scala 581:24]
  assign csrRS_io_robRead_0_busy = rob_io_read_0_busy; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_0_state = rob_io_read_0_state; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_0_rd = rob_io_read_0_rd; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_0_data = rob_io_read_0_data; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_1_busy = rob_io_read_1_busy; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_1_state = rob_io_read_1_state; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_1_rd = rob_io_read_1_rd; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_1_data = rob_io_read_1_data; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_2_busy = rob_io_read_2_busy; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_2_state = rob_io_read_2_state; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_2_rd = rob_io_read_2_rd; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_2_data = rob_io_read_2_data; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_3_busy = rob_io_read_3_busy; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_3_state = rob_io_read_3_state; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_3_rd = rob_io_read_3_rd; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_3_data = rob_io_read_3_data; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_4_busy = rob_io_read_4_busy; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_4_state = rob_io_read_4_state; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_4_rd = rob_io_read_4_rd; // @[Core_1.scala 646:16]
  assign csrRS_io_robRead_4_data = rob_io_read_4_data; // @[Core_1.scala 646:16]
  assign csrRS_io_regStatus_0_owner = rob_io_regStatus_0_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_1_owner = rob_io_regStatus_1_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_2_owner = rob_io_regStatus_2_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_3_owner = rob_io_regStatus_3_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_4_owner = rob_io_regStatus_4_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_5_owner = rob_io_regStatus_5_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_6_owner = rob_io_regStatus_6_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_7_owner = rob_io_regStatus_7_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_8_owner = rob_io_regStatus_8_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_9_owner = rob_io_regStatus_9_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_10_owner = rob_io_regStatus_10_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_11_owner = rob_io_regStatus_11_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_12_owner = rob_io_regStatus_12_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_13_owner = rob_io_regStatus_13_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_14_owner = rob_io_regStatus_14_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_15_owner = rob_io_regStatus_15_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_16_owner = rob_io_regStatus_16_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_17_owner = rob_io_regStatus_17_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_18_owner = rob_io_regStatus_18_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_19_owner = rob_io_regStatus_19_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_20_owner = rob_io_regStatus_20_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_21_owner = rob_io_regStatus_21_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_22_owner = rob_io_regStatus_22_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_23_owner = rob_io_regStatus_23_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_24_owner = rob_io_regStatus_24_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_25_owner = rob_io_regStatus_25_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_26_owner = rob_io_regStatus_26_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_27_owner = rob_io_regStatus_27_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_28_owner = rob_io_regStatus_28_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_29_owner = rob_io_regStatus_29_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_30_owner = rob_io_regStatus_30_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_regStatus_31_owner = rob_io_regStatus_31_owner; // @[Core_1.scala 579:24]
  assign csrRS_io_cdb_0_valid = aluStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign csrRS_io_cdb_0_bits_data = aluStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign csrRS_io_cdb_0_bits_id = aluStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign csrRS_io_cdb_0_bits_rd = aluStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign csrRS_io_cdb_1_valid = bruStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign csrRS_io_cdb_1_bits_data = bruStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign csrRS_io_cdb_1_bits_id = bruStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign csrRS_io_cdb_1_bits_rd = bruStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign csrRS_io_cdb_2_valid = lsuStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign csrRS_io_cdb_2_bits_data = lsuStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign csrRS_io_cdb_2_bits_id = lsuStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign csrRS_io_cdb_2_bits_rd = lsuStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign csrRS_io_cdb_3_valid = csrStage_1_io_out_valid; // @[Core_1.scala 634:21]
  assign csrRS_io_cdb_3_bits_data = csrStage_1_io_out_bits_data; // @[Core_1.scala 635:25]
  assign csrRS_io_cdb_3_bits_id = csrStage_1_io_out_bits_id; // @[Core_1.scala 637:23]
  assign csrRS_io_cdb_3_bits_rd = csrStage_1_io_out_bits_rd; // @[Core_1.scala 636:23]
  assign csrRS_io_rf_0_data = rf_io_r_6_data; // @[Core_1.scala 657:20]
  assign csrRS_io_rf_1_data = rf_io_r_7_data; // @[Core_1.scala 658:20]
  assign csrRS_io_flush = globalBrTaken | reset; // @[Core_1.scala 580:37]
  assign edgeBackPressure_clock = clock;
  assign edgeBackPressure_io_in = ib_io_status_back_pressure; // @[Core_1.scala 131:28]
  assign fetch_pendingBranch_clock = clock;
  assign fetch_pendingBranch_reset = reset;
  assign fetch_pendingBranch_io_enq_valid = globalBrTaken; // @[Core_1.scala 137:38]
  assign fetch_pendingBranch_io_enq_bits = csrExcpValid ? csrExcpAddr : bruBrAddr; // @[Core_1.scala 105:27]
  assign fetch_pendingBranch_io_deq_ready = icache_io_read_req_ready; // @[Core_1.scala 138:38]
  assign dec_decoders_0_io_inst = dec_inst_0_inst; // @[Core_1.scala 201:33]
  assign dec_decoders_1_io_inst = dec_inst_1_inst; // @[Core_1.scala 201:33]
  assign dec_decoders_2_io_inst = dec_inst_2_inst; // @[Core_1.scala 201:33]
  assign dec_decoders_3_io_inst = dec_inst_3_inst; // @[Core_1.scala 201:33]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_read_req_valid = lsuStage_1_io_cache_read_req_valid; // @[Core_1.scala 572:30]
  assign dcache_io_read_req_bits_addr = lsuStage_1_io_cache_read_req_bits_addr; // @[Core_1.scala 572:30]
  assign dcache_io_read_resp_ready = lsuStage_1_io_cache_read_resp_ready; // @[Core_1.scala 572:30]
  assign dcache_io_write_req_valid = lsuStage_1_io_cache_write_req_valid; // @[Core_1.scala 573:31]
  assign dcache_io_write_req_bits_addr = lsuStage_1_io_cache_write_req_bits_addr; // @[Core_1.scala 573:31]
  assign dcache_io_write_req_bits_data = lsuStage_1_io_cache_write_req_bits_data; // @[Core_1.scala 573:31]
  assign dcache_io_write_req_bits_mask = lsuStage_1_io_cache_write_req_bits_mask; // @[Core_1.scala 573:31]
  assign dcache_io_write_resp_ready = lsuStage_1_io_cache_write_resp_ready; // @[Core_1.scala 573:31]
  assign dcache_io_tlbus_req_ready = xbar_io_masterFace_in_1_ready; // @[Core_1.scala 701:25]
  assign dcache_io_tlbus_resp_valid = xbar_io_masterFace_out_1_valid; // @[Core_1.scala 702:26]
  assign dcache_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_1_bits_opcode; // @[Core_1.scala 702:26]
  assign dcache_io_tlbus_resp_bits_data = xbar_io_masterFace_out_1_bits_data; // @[Core_1.scala 702:26]
  assign dcache_io_flush = globalBrTaken; // @[Core_1.scala 571:21]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masterFace_in_0_valid = icache_io_tlbus_req_valid; // @[Core_1.scala 698:25]
  assign xbar_io_masterFace_in_0_bits_address = icache_io_tlbus_req_bits_address; // @[Core_1.scala 698:25]
  assign xbar_io_masterFace_in_1_valid = dcache_io_tlbus_req_valid; // @[Core_1.scala 701:25]
  assign xbar_io_masterFace_in_1_bits_opcode = dcache_io_tlbus_req_bits_opcode; // @[Core_1.scala 701:25]
  assign xbar_io_masterFace_in_1_bits_address = dcache_io_tlbus_req_bits_address; // @[Core_1.scala 701:25]
  assign xbar_io_masterFace_in_1_bits_data = dcache_io_tlbus_req_bits_data; // @[Core_1.scala 701:25]
  assign xbar_io_slaveFace_in_0_ready = rom_io_req_ready; // @[Core_1.scala 704:16]
  assign xbar_io_slaveFace_out_0_valid = rom_io_resp_valid; // @[Core_1.scala 705:17]
  assign xbar_io_slaveFace_out_0_bits_opcode = rom_io_resp_bits_opcode; // @[Core_1.scala 705:17]
  assign xbar_io_slaveFace_out_0_bits_data = rom_io_resp_bits_data; // @[Core_1.scala 705:17]
  assign rom_clock = clock;
  assign rom_reset = reset;
  assign rom_io_req_valid = xbar_io_slaveFace_in_0_valid; // @[Core_1.scala 704:16]
  assign rom_io_req_bits_opcode = xbar_io_slaveFace_in_0_bits_opcode; // @[Core_1.scala 704:16]
  assign rom_io_req_bits_size = xbar_io_slaveFace_in_0_bits_size; // @[Core_1.scala 704:16]
  assign rom_io_req_bits_address = xbar_io_slaveFace_in_0_bits_address; // @[Core_1.scala 704:16]
  assign rom_io_req_bits_data = xbar_io_slaveFace_in_0_bits_data; // @[Core_1.scala 704:16]
  assign rom_io_resp_ready = xbar_io_slaveFace_out_0_ready; // @[Core_1.scala 705:17]
  always @(posedge clock) begin
    if (reset) begin // @[Core_1.scala 114:24]
      pcReg <= 32'h0; // @[Core_1.scala 114:24]
    end else if (_lastPc_T & _preFetchInst_T_2) begin // @[Core_1.scala 156:49]
      if (brTaken) begin // @[Core_1.scala 159:18]
        pcReg <= fetch_pendingBranch_io_deq_bits;
      end else if (isAlignAddr) begin // @[Core_1.scala 119:22]
        pcReg <= _pcNext4_T_1;
      end else begin
        pcReg <= _pcNext4_T_8;
      end
    end
    if (_lastPc_T) begin // @[Reg.scala 20:18]
      lastPc <= icache_io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    firstFire <= reset | _GEN_3; // @[Reg.scala 35:{20,20}]
    if (globalBrTaken) begin // @[Reg.scala 20:18]
      if (csrExcpValid) begin // @[Core_1.scala 105:27]
        blockAddr <= csrExcpAddr;
      end else begin
        blockAddr <= bruBrAddr;
      end
    end
    if (reset) begin // @[Core_1.scala 166:29]
      blockValid <= 1'h0; // @[Core_1.scala 166:29]
    end else begin
      blockValid <= _GEN_7;
    end
    if (reset) begin // @[Core_1.scala 186:27]
      dec_full <= 1'h0; // @[Core_1.scala 186:27]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 212:21]
      dec_full <= 1'h0; // @[Core_1.scala 213:18]
    end else begin
      dec_full <= _GEN_18;
    end
    if (reset) begin // @[Core_1.scala 224:29]
      issue_full <= 1'h0; // @[Core_1.scala 224:29]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 257:23]
      issue_full <= 1'h0; // @[Core_1.scala 258:20]
    end else begin
      issue_full <= _GEN_71;
    end
    if (reset) begin // @[Core_1.scala 231:28]
      issue_ptr <= 2'h0; // @[Core_1.scala 231:28]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 257:23]
      issue_ptr <= 2'h0; // @[Core_1.scala 259:19]
    end else if (issue_fire) begin // @[Core_1.scala 248:22]
      issue_ptr <= 2'h0; // @[Core_1.scala 248:34]
    end else if (issue_instFire) begin // @[Core_1.scala 249:31]
      issue_ptr <= _issue_ptr_T_1; // @[Core_1.scala 249:43]
    end
    if (dec_fire) begin // @[Reg.scala 20:18]
      issue_instValid <= _issue_instValid_T; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_0_inst <= ib_io_out_bits_inst_0_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 212:21]
      dec_inst_0_valid <= 1'h0; // @[Core_1.scala 214:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_0_valid <= ib_io_out_bits_inst_0_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_1_inst <= ib_io_out_bits_inst_1_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 212:21]
      dec_inst_1_valid <= 1'h0; // @[Core_1.scala 214:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_1_valid <= ib_io_out_bits_inst_1_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_2_inst <= ib_io_out_bits_inst_2_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 212:21]
      dec_inst_2_valid <= 1'h0; // @[Core_1.scala 214:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_2_valid <= ib_io_out_bits_inst_2_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_3_inst <= ib_io_out_bits_inst_3_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 212:21]
      dec_inst_3_valid <= 1'h0; // @[Core_1.scala 214:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_3_valid <= ib_io_out_bits_inst_3_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_pc <= ib_io_out_bits_pc; // @[Reg.scala 20:22]
    end
    if (dec_fire) begin // @[Reg.scala 20:18]
      issue_pc <= dec_pc; // @[Reg.scala 20:22]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_brType <= dec_decodeSigs_0_brType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_lsuOp <= dec_decodeSigs_0_lsuOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_aluOp <= dec_decodeSigs_0_aluOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_opr1 <= dec_decodeSigs_0_opr1; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_opr2 <= dec_decodeSigs_0_opr2; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_immSrc <= dec_decodeSigs_0_immSrc; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_immSign <= dec_decodeSigs_0_immSign; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_csrOp <= dec_decodeSigs_0_csrOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_0_excpType <= dec_decodeSigs_0_excpType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_brType <= dec_decodeSigs_1_brType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_lsuOp <= dec_decodeSigs_1_lsuOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_aluOp <= dec_decodeSigs_1_aluOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_opr1 <= dec_decodeSigs_1_opr1; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_opr2 <= dec_decodeSigs_1_opr2; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_immSrc <= dec_decodeSigs_1_immSrc; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_immSign <= dec_decodeSigs_1_immSign; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_csrOp <= dec_decodeSigs_1_csrOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_1_excpType <= dec_decodeSigs_1_excpType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_brType <= dec_decodeSigs_2_brType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_lsuOp <= dec_decodeSigs_2_lsuOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_aluOp <= dec_decodeSigs_2_aluOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_opr1 <= dec_decodeSigs_2_opr1; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_opr2 <= dec_decodeSigs_2_opr2; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_immSrc <= dec_decodeSigs_2_immSrc; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_immSign <= dec_decodeSigs_2_immSign; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_csrOp <= dec_decodeSigs_2_csrOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_2_excpType <= dec_decodeSigs_2_excpType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_brType <= dec_decodeSigs_3_brType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_lsuOp <= dec_decodeSigs_3_lsuOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_aluOp <= dec_decodeSigs_3_aluOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_opr1 <= dec_decodeSigs_3_opr1; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_opr2 <= dec_decodeSigs_3_opr2; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_immSrc <= dec_decodeSigs_3_immSrc; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_immSign <= dec_decodeSigs_3_immSign; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_csrOp <= dec_decodeSigs_3_csrOp; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_decodeSigs_3_excpType <= dec_decodeSigs_3_excpType; // @[Core_1.scala 235:33]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_inst_0 <= dec_inst_0_inst; // @[Core_1.scala 236:27]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_inst_1 <= dec_inst_1_inst; // @[Core_1.scala 236:27]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_inst_2 <= dec_inst_2_inst; // @[Core_1.scala 236:27]
    end
    if (dec_fire) begin // @[Core_1.scala 234:27]
      issue_inst_3 <= dec_inst_3_inst; // @[Core_1.scala 236:27]
    end
    io_out_state_instState_REG_commit <= rob_io_deq_ready & rob_io_deq_valid; // @[Decoupled.scala 51:35]
    io_out_state_instState_REG_pc <= rob_io_deq_bits_pc; // @[Core_1.scala 673:25 676:18]
    io_out_state_instState_REG_inst <= rob_io_deq_bits_inst; // @[Core_1.scala 673:25 675:20]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_12 <= 3'h1 & issue_full | _issue_ready_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed: more than one op valid! %d %d %d %d inst=> %x aluOp=> %d bruOp=> %d lsuOp=> %d csrOp=> %d excpType=> %d\n    at Core_1.scala:276 assert(((PopCount(VecInit(Seq(issue_aluValid, issue_bruValid, issue_lsuValid, issue_csrValid))) <= 1.U && issue_full) || !issue_full),\n"
            ,issue_aluValid,issue_bruValid,issue_lsuValid,issue_csrValid,issue_chosenInst,issue_chosenDecodesigs_aluOp,
            issue_chosenDecodesigs_brType,issue_chosenDecodesigs_lsuOp,issue_chosenDecodesigs_csrOp,
            issue_chosenDecodesigs_excpType); // @[Core_1.scala 276:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_12 <= 3'h1 & issue_full | _issue_ready_T) & ~reset) begin
          $fatal; // @[Core_1.scala 276:11]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  lastPc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  firstFire = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  blockAddr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  blockValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dec_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  issue_full = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  issue_ptr = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  issue_instValid = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  dec_inst_0_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  dec_inst_0_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  dec_inst_1_inst = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  dec_inst_1_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  dec_inst_2_inst = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  dec_inst_2_valid = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  dec_inst_3_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  dec_inst_3_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  dec_pc = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  issue_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  issue_decodeSigs_0_brType = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  issue_decodeSigs_0_lsuOp = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  issue_decodeSigs_0_aluOp = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  issue_decodeSigs_0_opr1 = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  issue_decodeSigs_0_opr2 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  issue_decodeSigs_0_immSrc = _RAND_24[2:0];
  _RAND_25 = {1{`RANDOM}};
  issue_decodeSigs_0_immSign = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  issue_decodeSigs_0_csrOp = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  issue_decodeSigs_0_excpType = _RAND_27[3:0];
  _RAND_28 = {1{`RANDOM}};
  issue_decodeSigs_1_brType = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  issue_decodeSigs_1_lsuOp = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  issue_decodeSigs_1_aluOp = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  issue_decodeSigs_1_opr1 = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  issue_decodeSigs_1_opr2 = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  issue_decodeSigs_1_immSrc = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  issue_decodeSigs_1_immSign = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  issue_decodeSigs_1_csrOp = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  issue_decodeSigs_1_excpType = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  issue_decodeSigs_2_brType = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  issue_decodeSigs_2_lsuOp = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  issue_decodeSigs_2_aluOp = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  issue_decodeSigs_2_opr1 = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  issue_decodeSigs_2_opr2 = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  issue_decodeSigs_2_immSrc = _RAND_42[2:0];
  _RAND_43 = {1{`RANDOM}};
  issue_decodeSigs_2_immSign = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  issue_decodeSigs_2_csrOp = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  issue_decodeSigs_2_excpType = _RAND_45[3:0];
  _RAND_46 = {1{`RANDOM}};
  issue_decodeSigs_3_brType = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  issue_decodeSigs_3_lsuOp = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  issue_decodeSigs_3_aluOp = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  issue_decodeSigs_3_opr1 = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  issue_decodeSigs_3_opr2 = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  issue_decodeSigs_3_immSrc = _RAND_51[2:0];
  _RAND_52 = {1{`RANDOM}};
  issue_decodeSigs_3_immSign = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  issue_decodeSigs_3_csrOp = _RAND_53[2:0];
  _RAND_54 = {1{`RANDOM}};
  issue_decodeSigs_3_excpType = _RAND_54[3:0];
  _RAND_55 = {1{`RANDOM}};
  issue_inst_0 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  issue_inst_1 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  issue_inst_2 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  issue_inst_3 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  io_out_state_instState_REG_commit = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  io_out_state_instState_REG_pc = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  io_out_state_instState_REG_inst = _RAND_61[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
