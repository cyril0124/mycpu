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
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
`endif // RANDOMIZE_REG_INIT
  wire  ib_clock; // @[Core_1.scala 49:20]
  wire  ib_reset; // @[Core_1.scala 49:20]
  wire  ib_io_in_ready; // @[Core_1.scala 49:20]
  wire  ib_io_in_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_data; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_addr; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_inst_0; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_inst_1; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_inst_2; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_icache_inst_3; // @[Core_1.scala 49:20]
  wire [2:0] ib_io_in_bits_icache_size; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_in_bits_pc; // @[Core_1.scala 49:20]
  wire  ib_io_in_bits_flush; // @[Core_1.scala 49:20]
  wire  ib_io_out_ready; // @[Core_1.scala 49:20]
  wire  ib_io_out_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_out_bits_inst_0_inst; // @[Core_1.scala 49:20]
  wire  ib_io_out_bits_inst_0_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_out_bits_inst_1_inst; // @[Core_1.scala 49:20]
  wire  ib_io_out_bits_inst_1_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_out_bits_inst_2_inst; // @[Core_1.scala 49:20]
  wire  ib_io_out_bits_inst_2_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_out_bits_inst_3_inst; // @[Core_1.scala 49:20]
  wire  ib_io_out_bits_inst_3_valid; // @[Core_1.scala 49:20]
  wire [31:0] ib_io_out_bits_pc; // @[Core_1.scala 49:20]
  wire  ib_io_status_back_pressure; // @[Core_1.scala 49:20]
  wire  ib_io_status_full; // @[Core_1.scala 49:20]
  wire  icache_clock; // @[Core_1.scala 51:24]
  wire  icache_reset; // @[Core_1.scala 51:24]
  wire  icache_io_read_req_ready; // @[Core_1.scala 51:24]
  wire  icache_io_read_req_valid; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_req_bits_addr; // @[Core_1.scala 51:24]
  wire  icache_io_read_resp_ready; // @[Core_1.scala 51:24]
  wire  icache_io_read_resp_valid; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_data; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_addr; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_0; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_1; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_2; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_3; // @[Core_1.scala 51:24]
  wire [2:0] icache_io_read_resp_bits_size; // @[Core_1.scala 51:24]
  wire  icache_io_tlbus_req_ready; // @[Core_1.scala 51:24]
  wire  icache_io_tlbus_req_valid; // @[Core_1.scala 51:24]
  wire [31:0] icache_io_tlbus_req_bits_address; // @[Core_1.scala 51:24]
  wire  icache_io_tlbus_resp_ready; // @[Core_1.scala 51:24]
  wire  icache_io_tlbus_resp_valid; // @[Core_1.scala 51:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[Core_1.scala 51:24]
  wire [127:0] icache_io_tlbus_resp_bits_data; // @[Core_1.scala 51:24]
  wire  icache_io_flush; // @[Core_1.scala 51:24]
  wire  rf_clock; // @[Core_1.scala 63:20]
  wire  rf_reset; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_0_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_0_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_1_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_1_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_2_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_2_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_3_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_3_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_4_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_4_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_5_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_5_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_r_6_addr; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_r_6_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_w_0_addr; // @[Core_1.scala 63:20]
  wire  rf_io_w_0_en; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_w_0_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_w_1_addr; // @[Core_1.scala 63:20]
  wire  rf_io_w_1_en; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_w_1_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_w_2_addr; // @[Core_1.scala 63:20]
  wire  rf_io_w_2_en; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_w_2_data; // @[Core_1.scala 63:20]
  wire [4:0] rf_io_w_3_addr; // @[Core_1.scala 63:20]
  wire  rf_io_w_3_en; // @[Core_1.scala 63:20]
  wire [31:0] rf_io_w_3_data; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_0; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_1; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_2; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_3; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_4; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_5; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_6; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_7; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_8; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_9; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_10; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_11; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_12; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_13; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_14; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_15; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_16; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_17; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_18; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_19; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_20; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_21; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_22; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_23; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_24; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_25; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_26; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_27; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_28; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_29; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_30; // @[Core_1.scala 63:20]
  wire [31:0] rf_regState_0_regState_31; // @[Core_1.scala 63:20]
  wire  aluStage_clock; // @[Core_1.scala 67:26]
  wire  aluStage_reset; // @[Core_1.scala 67:26]
  wire  aluStage_io_in_ready; // @[Core_1.scala 67:26]
  wire  aluStage_io_in_valid; // @[Core_1.scala 67:26]
  wire [3:0] aluStage_io_in_bits_opr1; // @[Core_1.scala 67:26]
  wire [3:0] aluStage_io_in_bits_opr2; // @[Core_1.scala 67:26]
  wire [4:0] aluStage_io_in_bits_aluOp; // @[Core_1.scala 67:26]
  wire [2:0] aluStage_io_in_bits_immSrc; // @[Core_1.scala 67:26]
  wire  aluStage_io_in_bits_immSign; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_in_bits_inst; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_in_bits_pc; // @[Core_1.scala 67:26]
  wire [7:0] aluStage_io_in_bits_id; // @[Core_1.scala 67:26]
  wire  aluStage_io_out_ready; // @[Core_1.scala 67:26]
  wire  aluStage_io_out_valid; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_out_bits_data; // @[Core_1.scala 67:26]
  wire [4:0] aluStage_io_out_bits_rd; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_out_bits_inst; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_out_bits_pc; // @[Core_1.scala 67:26]
  wire [7:0] aluStage_io_out_bits_id; // @[Core_1.scala 67:26]
  wire [4:0] aluStage_io_rfRd_0_addr; // @[Core_1.scala 67:26]
  wire  aluStage_io_rfRd_0_en; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_rfRd_0_data; // @[Core_1.scala 67:26]
  wire [4:0] aluStage_io_rfRd_1_addr; // @[Core_1.scala 67:26]
  wire [31:0] aluStage_io_rfRd_1_data; // @[Core_1.scala 67:26]
  wire  aluStage_io_rfRdReady; // @[Core_1.scala 67:26]
  wire  aluStage_io_flush; // @[Core_1.scala 67:26]
  wire  bruStage_clock; // @[Core_1.scala 68:26]
  wire  bruStage_reset; // @[Core_1.scala 68:26]
  wire  bruStage_io_in_ready; // @[Core_1.scala 68:26]
  wire  bruStage_io_in_valid; // @[Core_1.scala 68:26]
  wire [3:0] bruStage_io_in_bits_opr1; // @[Core_1.scala 68:26]
  wire [3:0] bruStage_io_in_bits_opr2; // @[Core_1.scala 68:26]
  wire [3:0] bruStage_io_in_bits_bruOp; // @[Core_1.scala 68:26]
  wire [2:0] bruStage_io_in_bits_immSrc; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_in_bits_inst; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_in_bits_pc; // @[Core_1.scala 68:26]
  wire [7:0] bruStage_io_in_bits_id; // @[Core_1.scala 68:26]
  wire  bruStage_io_out_ready; // @[Core_1.scala 68:26]
  wire  bruStage_io_out_valid; // @[Core_1.scala 68:26]
  wire  bruStage_io_out_bits_brTaken; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_out_bits_brAddr; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_out_bits_data; // @[Core_1.scala 68:26]
  wire [4:0] bruStage_io_out_bits_rd; // @[Core_1.scala 68:26]
  wire  bruStage_io_out_bits_wrEn; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_out_bits_inst; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_out_bits_pc; // @[Core_1.scala 68:26]
  wire [7:0] bruStage_io_out_bits_id; // @[Core_1.scala 68:26]
  wire [4:0] bruStage_io_rfRd_0_addr; // @[Core_1.scala 68:26]
  wire  bruStage_io_rfRd_0_en; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_rfRd_0_data; // @[Core_1.scala 68:26]
  wire [4:0] bruStage_io_rfRd_1_addr; // @[Core_1.scala 68:26]
  wire [31:0] bruStage_io_rfRd_1_data; // @[Core_1.scala 68:26]
  wire  bruStage_io_rfRdReady; // @[Core_1.scala 68:26]
  wire  bruStage_io_flush; // @[Core_1.scala 68:26]
  wire  lsuStage_clock; // @[Core_1.scala 69:26]
  wire  lsuStage_reset; // @[Core_1.scala 69:26]
  wire  lsuStage_io_in_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_in_valid; // @[Core_1.scala 69:26]
  wire [4:0] lsuStage_io_in_bits_lsuOp; // @[Core_1.scala 69:26]
  wire [2:0] lsuStage_io_in_bits_immSrc; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_in_bits_inst; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_in_bits_pc; // @[Core_1.scala 69:26]
  wire [7:0] lsuStage_io_in_bits_id; // @[Core_1.scala 69:26]
  wire  lsuStage_io_out_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_out_valid; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_out_bits_data; // @[Core_1.scala 69:26]
  wire [4:0] lsuStage_io_out_bits_rd; // @[Core_1.scala 69:26]
  wire  lsuStage_io_out_bits_wrEn; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_out_bits_inst; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_out_bits_pc; // @[Core_1.scala 69:26]
  wire [7:0] lsuStage_io_out_bits_id; // @[Core_1.scala 69:26]
  wire [4:0] lsuStage_io_rfRd_0_addr; // @[Core_1.scala 69:26]
  wire  lsuStage_io_rfRd_0_en; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_rfRd_0_data; // @[Core_1.scala 69:26]
  wire [4:0] lsuStage_io_rfRd_1_addr; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_rfRd_1_data; // @[Core_1.scala 69:26]
  wire  lsuStage_io_rfRdReady; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_read_req_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_read_req_valid; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_cache_read_req_bits_addr; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_read_resp_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_read_resp_valid; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_cache_read_resp_bits_data; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_write_req_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_write_req_valid; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_cache_write_req_bits_addr; // @[Core_1.scala 69:26]
  wire [31:0] lsuStage_io_cache_write_req_bits_data; // @[Core_1.scala 69:26]
  wire [3:0] lsuStage_io_cache_write_req_bits_mask; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_write_resp_ready; // @[Core_1.scala 69:26]
  wire  lsuStage_io_cache_write_resp_valid; // @[Core_1.scala 69:26]
  wire  lsuStage_io_flush; // @[Core_1.scala 69:26]
  wire  csrStage_clock; // @[Core_1.scala 70:26]
  wire  csrStage_reset; // @[Core_1.scala 70:26]
  wire  csrStage_io_in_ready; // @[Core_1.scala 70:26]
  wire  csrStage_io_in_valid; // @[Core_1.scala 70:26]
  wire [2:0] csrStage_io_in_bits_csrOp; // @[Core_1.scala 70:26]
  wire [3:0] csrStage_io_in_bits_excpType; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_in_bits_inst; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_in_bits_pc; // @[Core_1.scala 70:26]
  wire [7:0] csrStage_io_in_bits_id; // @[Core_1.scala 70:26]
  wire  csrStage_io_out_ready; // @[Core_1.scala 70:26]
  wire  csrStage_io_out_valid; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_out_bits_data; // @[Core_1.scala 70:26]
  wire [4:0] csrStage_io_out_bits_rd; // @[Core_1.scala 70:26]
  wire  csrStage_io_out_bits_wrEn; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_out_bits_excpAddr; // @[Core_1.scala 70:26]
  wire  csrStage_io_out_bits_excpValid; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_out_bits_inst; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_out_bits_pc; // @[Core_1.scala 70:26]
  wire [7:0] csrStage_io_out_bits_id; // @[Core_1.scala 70:26]
  wire [4:0] csrStage_io_rfRd_0_addr; // @[Core_1.scala 70:26]
  wire  csrStage_io_rfRd_0_en; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_io_rfRd_0_data; // @[Core_1.scala 70:26]
  wire  csrStage_io_rfRdReady; // @[Core_1.scala 70:26]
  wire  csrStage_io_flush; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_csrState_mcycle; // @[Core_1.scala 70:26]
  wire [31:0] csrStage_csrState_mcycleh; // @[Core_1.scala 70:26]
  wire  edgeBackPressure_clock; // @[Core_1.scala 109:34]
  wire  edgeBackPressure_io_in; // @[Core_1.scala 109:34]
  wire  edgeBackPressure_io_change; // @[Core_1.scala 109:34]
  wire  fetch_pendingBranch_clock; // @[Core_1.scala 114:37]
  wire  fetch_pendingBranch_reset; // @[Core_1.scala 114:37]
  wire  fetch_pendingBranch_io_enq_ready; // @[Core_1.scala 114:37]
  wire  fetch_pendingBranch_io_enq_valid; // @[Core_1.scala 114:37]
  wire [31:0] fetch_pendingBranch_io_enq_bits; // @[Core_1.scala 114:37]
  wire  fetch_pendingBranch_io_deq_ready; // @[Core_1.scala 114:37]
  wire  fetch_pendingBranch_io_deq_valid; // @[Core_1.scala 114:37]
  wire [31:0] fetch_pendingBranch_io_deq_bits; // @[Core_1.scala 114:37]
  wire [31:0] dec_decoders_0_io_inst; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_0_io_out_brType; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_0_io_out_wbType; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_0_io_out_lsuOp; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_0_io_out_aluOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_0_io_out_opr1; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_0_io_out_opr2; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_0_io_out_immSrc; // @[Core_1.scala 177:53]
  wire  dec_decoders_0_io_out_immSign; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_0_io_out_csrOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_0_io_out_excpType; // @[Core_1.scala 177:53]
  wire [31:0] dec_decoders_1_io_inst; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_1_io_out_brType; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_1_io_out_wbType; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_1_io_out_lsuOp; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_1_io_out_aluOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_1_io_out_opr1; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_1_io_out_opr2; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_1_io_out_immSrc; // @[Core_1.scala 177:53]
  wire  dec_decoders_1_io_out_immSign; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_1_io_out_csrOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_1_io_out_excpType; // @[Core_1.scala 177:53]
  wire [31:0] dec_decoders_2_io_inst; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_2_io_out_brType; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_2_io_out_wbType; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_2_io_out_lsuOp; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_2_io_out_aluOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_2_io_out_opr1; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_2_io_out_opr2; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_2_io_out_immSrc; // @[Core_1.scala 177:53]
  wire  dec_decoders_2_io_out_immSign; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_2_io_out_csrOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_2_io_out_excpType; // @[Core_1.scala 177:53]
  wire [31:0] dec_decoders_3_io_inst; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_3_io_out_brType; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_3_io_out_wbType; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_3_io_out_lsuOp; // @[Core_1.scala 177:53]
  wire [4:0] dec_decoders_3_io_out_aluOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_3_io_out_opr1; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_3_io_out_opr2; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_3_io_out_immSrc; // @[Core_1.scala 177:53]
  wire  dec_decoders_3_io_out_immSign; // @[Core_1.scala 177:53]
  wire [2:0] dec_decoders_3_io_out_csrOp; // @[Core_1.scala 177:53]
  wire [3:0] dec_decoders_3_io_out_excpType; // @[Core_1.scala 177:53]
  wire  scoreboard_clock; // @[Core_1.scala 266:28]
  wire  scoreboard_reset; // @[Core_1.scala 266:28]
  wire  scoreboard_io_issue_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_issue_valid; // @[Core_1.scala 266:28]
  wire [1:0] scoreboard_io_issue_bits_fuId; // @[Core_1.scala 266:28]
  wire [7:0] scoreboard_io_issue_bits_op; // @[Core_1.scala 266:28]
  wire [4:0] scoreboard_io_issue_bits_rd; // @[Core_1.scala 266:28]
  wire [4:0] scoreboard_io_issue_bits_rs1; // @[Core_1.scala 266:28]
  wire [4:0] scoreboard_io_issue_bits_rs2; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_0_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_0_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_1_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_1_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_2_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_2_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_3_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_readOpr_3_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_execute_0; // @[Core_1.scala 266:28]
  wire  scoreboard_io_execute_1; // @[Core_1.scala 266:28]
  wire  scoreboard_io_execute_2; // @[Core_1.scala 266:28]
  wire  scoreboard_io_execute_3; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_0_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_0_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_1_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_1_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_2_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_2_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_3_ready; // @[Core_1.scala 266:28]
  wire  scoreboard_io_writeback_3_valid; // @[Core_1.scala 266:28]
  wire  scoreboard_io_flush; // @[Core_1.scala 266:28]
  wire  csrIssue_clock; // @[Core_1.scala 288:26]
  wire  csrIssue_reset; // @[Core_1.scala 288:26]
  wire  csrIssue_io_shiftLeft; // @[Core_1.scala 288:26]
  wire [2:0] csrIssue_io_out; // @[Core_1.scala 288:26]
  wire  csrIssue_io_reset; // @[Core_1.scala 288:26]
  wire  csrCommit_clock; // @[Core_1.scala 295:27]
  wire  csrCommit_reset; // @[Core_1.scala 295:27]
  wire  csrCommit_io_shiftLeft; // @[Core_1.scala 295:27]
  wire [2:0] csrCommit_io_out; // @[Core_1.scala 295:27]
  wire  csrCommit_io_reset; // @[Core_1.scala 295:27]
  wire  dcache_clock; // @[Core_1.scala 372:24]
  wire  dcache_reset; // @[Core_1.scala 372:24]
  wire  dcache_io_read_req_ready; // @[Core_1.scala 372:24]
  wire  dcache_io_read_req_valid; // @[Core_1.scala 372:24]
  wire [31:0] dcache_io_read_req_bits_addr; // @[Core_1.scala 372:24]
  wire  dcache_io_read_resp_valid; // @[Core_1.scala 372:24]
  wire [31:0] dcache_io_read_resp_bits_data; // @[Core_1.scala 372:24]
  wire  dcache_io_write_req_ready; // @[Core_1.scala 372:24]
  wire  dcache_io_write_req_valid; // @[Core_1.scala 372:24]
  wire [31:0] dcache_io_write_req_bits_addr; // @[Core_1.scala 372:24]
  wire [31:0] dcache_io_write_req_bits_data; // @[Core_1.scala 372:24]
  wire [3:0] dcache_io_write_req_bits_mask; // @[Core_1.scala 372:24]
  wire  dcache_io_write_resp_valid; // @[Core_1.scala 372:24]
  wire  dcache_io_tlbus_req_ready; // @[Core_1.scala 372:24]
  wire  dcache_io_tlbus_req_valid; // @[Core_1.scala 372:24]
  wire [2:0] dcache_io_tlbus_req_bits_opcode; // @[Core_1.scala 372:24]
  wire [31:0] dcache_io_tlbus_req_bits_address; // @[Core_1.scala 372:24]
  wire [127:0] dcache_io_tlbus_req_bits_data; // @[Core_1.scala 372:24]
  wire  dcache_io_tlbus_resp_valid; // @[Core_1.scala 372:24]
  wire [2:0] dcache_io_tlbus_resp_bits_opcode; // @[Core_1.scala 372:24]
  wire [127:0] dcache_io_tlbus_resp_bits_data; // @[Core_1.scala 372:24]
  wire  xbar_clock; // @[Core_1.scala 446:22]
  wire  xbar_reset; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_in_0_ready; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_in_0_valid; // @[Core_1.scala 446:22]
  wire [31:0] xbar_io_masterFace_in_0_bits_address; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_in_1_ready; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_in_1_valid; // @[Core_1.scala 446:22]
  wire [2:0] xbar_io_masterFace_in_1_bits_opcode; // @[Core_1.scala 446:22]
  wire [31:0] xbar_io_masterFace_in_1_bits_address; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_masterFace_in_1_bits_data; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_out_0_valid; // @[Core_1.scala 446:22]
  wire [2:0] xbar_io_masterFace_out_0_bits_opcode; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_masterFace_out_0_bits_data; // @[Core_1.scala 446:22]
  wire  xbar_io_masterFace_out_1_valid; // @[Core_1.scala 446:22]
  wire [2:0] xbar_io_masterFace_out_1_bits_opcode; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_masterFace_out_1_bits_data; // @[Core_1.scala 446:22]
  wire  xbar_io_slaveFace_in_0_ready; // @[Core_1.scala 446:22]
  wire  xbar_io_slaveFace_in_0_valid; // @[Core_1.scala 446:22]
  wire [2:0] xbar_io_slaveFace_in_0_bits_opcode; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_size; // @[Core_1.scala 446:22]
  wire [31:0] xbar_io_slaveFace_in_0_bits_address; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_data; // @[Core_1.scala 446:22]
  wire  xbar_io_slaveFace_out_0_ready; // @[Core_1.scala 446:22]
  wire  xbar_io_slaveFace_out_0_valid; // @[Core_1.scala 446:22]
  wire [2:0] xbar_io_slaveFace_out_0_bits_opcode; // @[Core_1.scala 446:22]
  wire [127:0] xbar_io_slaveFace_out_0_bits_data; // @[Core_1.scala 446:22]
  wire  rom_clock; // @[Core_1.scala 447:21]
  wire  rom_reset; // @[Core_1.scala 447:21]
  wire  rom_io_req_ready; // @[Core_1.scala 447:21]
  wire  rom_io_req_valid; // @[Core_1.scala 447:21]
  wire [2:0] rom_io_req_bits_opcode; // @[Core_1.scala 447:21]
  wire [127:0] rom_io_req_bits_size; // @[Core_1.scala 447:21]
  wire [31:0] rom_io_req_bits_address; // @[Core_1.scala 447:21]
  wire [127:0] rom_io_req_bits_data; // @[Core_1.scala 447:21]
  wire  rom_io_resp_ready; // @[Core_1.scala 447:21]
  wire  rom_io_resp_valid; // @[Core_1.scala 447:21]
  wire [2:0] rom_io_resp_bits_opcode; // @[Core_1.scala 447:21]
  wire [127:0] rom_io_resp_bits_size; // @[Core_1.scala 447:21]
  wire [127:0] rom_io_resp_bits_data; // @[Core_1.scala 447:21]
  wire  _csrExcpValid_T = csrStage_io_out_ready & csrStage_io_out_valid; // @[Decoupled.scala 51:35]
  wire  csrExcpValid = csrStage_io_out_bits_excpValid & _csrExcpValid_T; // @[Core_1.scala 397:52]
  wire  _bruBrTaken_T = bruStage_io_out_ready & bruStage_io_out_valid; // @[Decoupled.scala 51:35]
  wire  bruBrTaken = _bruBrTaken_T & bruStage_io_out_bits_brTaken; // @[Core_1.scala 347:40]
  wire  globalBrTaken = csrExcpValid | bruBrTaken; // @[Core_1.scala 83:38]
  wire [31:0] csrExcpAddr = csrStage_io_out_bits_excpAddr; // @[Core_1.scala 398:17 81:31]
  wire [31:0] bruBrAddr = bruStage_io_out_bits_brAddr; // @[Core_1.scala 348:15 78:29]
  wire [31:0] globalBrAddr = csrExcpValid ? csrExcpAddr : bruBrAddr; // @[Core_1.scala 84:27]
  reg [31:0] pcReg; // @[Core_1.scala 93:24]
  wire  isAlignAddr = ~(|pcReg[3:0]); // @[Core_1.scala 96:23]
  wire  _lastPc_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] lastPc; // @[Reg.scala 19:16]
  wire [31:0] _pcNext4_T_1 = pcReg + 32'h10; // @[Core_1.scala 99:31]
  wire [4:0] _GEN_76 = {{1'd0}, lastPc[3:0]}; // @[Core_1.scala 100:45]
  wire [4:0] _pcNext4_T_4 = 5'h10 - _GEN_76; // @[Core_1.scala 100:45]
  wire [4:0] _pcNext4_T_6 = {_pcNext4_T_4[4:2], 2'h0}; // @[Core_1.scala 100:82]
  wire [31:0] _GEN_77 = {{27'd0}, _pcNext4_T_6}; // @[Core_1.scala 100:32]
  wire [31:0] _pcNext4_T_8 = lastPc + _GEN_77; // @[Core_1.scala 100:32]
  wire [31:0] pcNext4 = isAlignAddr ? _pcNext4_T_1 : _pcNext4_T_8; // @[Core_1.scala 98:22]
  reg  fetch_instValid; // @[Core_1.scala 103:34]
  wire  fetch_valid = icache_io_read_resp_valid; // @[Core_1.scala 140:17 72:27]
  wire  fetch_fire = fetch_valid | fetch_instValid; // @[Core_1.scala 104:34]
  wire  _T = icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_1 = fetch_instValid & _lastPc_T ? 1'h0 : fetch_instValid; // @[Core_1.scala 103:34 107:{59,77}]
  wire  _GEN_2 = _T | _GEN_1; // @[Core_1.scala 106:{36,54}]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_3 = _lastPc_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  brTaken = fetch_pendingBranch_io_deq_ready & fetch_pendingBranch_io_deq_valid; // @[Decoupled.scala 51:35]
  wire  _preFetchInst_T_2 = ~firstFire; // @[Core_1.scala 122:26]
  wire  _preFetchInst_T_6 = (fetch_fire | edgeBackPressure_io_change) & ~ib_io_status_back_pressure | brTaken; // @[Core_1.scala 123:107]
  wire  _preFetchInst_T_7 = ~firstFire & _preFetchInst_T_6; // @[Core_1.scala 122:37]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | _preFetchInst_T_7; // @[Core_1.scala 121:59]
  wire [31:0] pcNext = brTaken ? fetch_pendingBranch_io_deq_bits : pcNext4; // @[Core_1.scala 138:18]
  wire [31:0] _icache_io_read_req_bits_addr_T_1 = firstFire ? pcReg : pcNext; // @[Core_1.scala 130:69]
  wire [31:0] _icache_io_read_req_bits_addr_T_2 = brTaken ? fetch_pendingBranch_io_deq_bits : pcReg; // @[Core_1.scala 130:100]
  reg [31:0] blockAddr; // @[Reg.scala 19:16]
  reg  blockValid; // @[Core_1.scala 145:29]
  wire  willBlock = (globalBrTaken | brTaken) & icache_io_read_resp_bits_addr != globalBrAddr; // @[Core_1.scala 146:48]
  wire  willWakeUp = blockValid & icache_io_read_resp_valid & icache_io_read_resp_bits_addr == blockAddr; // @[Core_1.scala 147:62]
  wire  _GEN_6 = willWakeUp ? 1'h0 : blockValid; // @[Core_1.scala 149:27 145:29 149:40]
  wire  _GEN_7 = willBlock | _GEN_6; // @[Core_1.scala 148:{21,34}]
  wire  icacheRespIsAlignAddr = ~(|icache_io_read_resp_bits_addr[3:0]); // @[Core_1.scala 88:9]
  wire [2:0] _GEN_78 = {{1'd0}, icache_io_read_resp_bits_addr[3:2]}; // @[Core_1.scala 156:93]
  wire [2:0] _ib_io_in_bits_icache_size_T_2 = 3'h4 - _GEN_78; // @[Core_1.scala 156:93]
  wire  _ib_io_in_bits_flush_T_1 = globalBrTaken | reset; // @[Core_1.scala 158:42]
  reg  dec_full; // @[Core_1.scala 165:27]
  wire  _dec_valid_T = ~_ib_io_in_bits_flush_T_1; // @[Core_1.scala 189:33]
  wire  dec_valid = dec_full & ~_ib_io_in_bits_flush_T_1; // @[Core_1.scala 189:30]
  reg  issue_full; // @[Core_1.scala 205:29]
  wire  _issue_ready_T = ~issue_full; // @[Core_1.scala 223:20]
  reg [1:0] issue_ptr; // @[Core_1.scala 213:28]
  reg [3:0] issue_instValid; // @[Reg.scala 19:16]
  wire [1:0] _issue_instSize_T_4 = issue_instValid[0] + issue_instValid[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _issue_instSize_T_6 = issue_instValid[2] + issue_instValid[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _issue_instSize_T_8 = _issue_instSize_T_4 + _issue_instSize_T_6; // @[Bitwise.scala 51:90]
  wire [2:0] issue_instSize = _issue_instSize_T_8 - 3'h1; // @[Core_1.scala 211:52]
  wire [2:0] _GEN_79 = {{1'd0}, issue_ptr}; // @[Core_1.scala 229:32]
  wire  _issue_instFire_T = aluStage_io_in_ready & aluStage_io_in_valid; // @[Decoupled.scala 51:35]
  wire  _issue_instFire_T_1 = bruStage_io_in_ready & bruStage_io_in_valid; // @[Decoupled.scala 51:35]
  wire  _issue_instFire_T_3 = lsuStage_io_in_ready & lsuStage_io_in_valid; // @[Decoupled.scala 51:35]
  wire  _issue_instFire_T_5 = csrStage_io_in_ready & csrStage_io_in_valid; // @[Decoupled.scala 51:35]
  wire  issue_instFire = _issue_instFire_T | _issue_instFire_T_1 | _issue_instFire_T_3 | _issue_instFire_T_5; // @[Core_1.scala 233:89]
  wire  issue_fire = _GEN_79 == issue_instSize & issue_instFire & _dec_valid_T; // @[Core_1.scala 229:71]
  wire  issue_ready = ~issue_full | issue_fire; // @[Core_1.scala 223:32]
  wire  dec_fire = dec_valid & issue_ready; // @[Core_1.scala 166:30]
  wire  dec_ready = ~dec_full | dec_fire; // @[Core_1.scala 172:28]
  wire  dec_latch = ib_io_out_valid & dec_ready; // @[Core_1.scala 164:37]
  reg [31:0] dec_inst_0_inst; // @[Reg.scala 19:16]
  reg  dec_inst_0_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_1_inst; // @[Reg.scala 19:16]
  reg  dec_inst_1_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_2_inst; // @[Reg.scala 19:16]
  reg  dec_inst_2_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_inst_3_inst; // @[Reg.scala 19:16]
  reg  dec_inst_3_valid; // @[Reg.scala 19:16]
  reg [31:0] dec_pc; // @[Reg.scala 19:16]
  wire  _GEN_17 = dec_full & dec_fire ? 1'h0 : dec_full; // @[Core_1.scala 165:27 174:{37,48}]
  wire  _GEN_18 = dec_latch | _GEN_17; // @[Core_1.scala 173:{21,32}]
  reg [31:0] issue_pc; // @[Reg.scala 19:16]
  reg [3:0] issue_decodeSigs_0_brType; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_0_lsuOp; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_0_aluOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_0_opr1; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_0_opr2; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_0_immSrc; // @[Core_1.scala 208:31]
  reg  issue_decodeSigs_0_immSign; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_0_csrOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_0_excpType; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_1_brType; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_1_lsuOp; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_1_aluOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_1_opr1; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_1_opr2; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_1_immSrc; // @[Core_1.scala 208:31]
  reg  issue_decodeSigs_1_immSign; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_1_csrOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_1_excpType; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_2_brType; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_2_lsuOp; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_2_aluOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_2_opr1; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_2_opr2; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_2_immSrc; // @[Core_1.scala 208:31]
  reg  issue_decodeSigs_2_immSign; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_2_csrOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_2_excpType; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_3_brType; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_3_lsuOp; // @[Core_1.scala 208:31]
  reg [4:0] issue_decodeSigs_3_aluOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_3_opr1; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_3_opr2; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_3_immSrc; // @[Core_1.scala 208:31]
  reg  issue_decodeSigs_3_immSign; // @[Core_1.scala 208:31]
  reg [2:0] issue_decodeSigs_3_csrOp; // @[Core_1.scala 208:31]
  reg [3:0] issue_decodeSigs_3_excpType; // @[Core_1.scala 208:31]
  wire [3:0] _issue_instValid_T = {dec_inst_0_valid,dec_inst_1_valid,dec_inst_2_valid,dec_inst_3_valid}; // @[Cat.scala 33:92]
  reg [31:0] issue_inst_0; // @[Core_1.scala 210:25]
  reg [31:0] issue_inst_1; // @[Core_1.scala 210:25]
  reg [31:0] issue_inst_2; // @[Core_1.scala 210:25]
  reg [31:0] issue_inst_3; // @[Core_1.scala 210:25]
  wire [3:0] dec_decodeSigs_0_brType = dec_decoders_0_io_out_brType; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_0_wbType = dec_decoders_0_io_out_wbType; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_0_lsuOp = dec_decoders_0_io_out_lsuOp; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_0_aluOp = dec_decoders_0_io_out_aluOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_0_opr1 = dec_decoders_0_io_out_opr1; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_0_opr2 = dec_decoders_0_io_out_opr2; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_0_immSrc = dec_decoders_0_io_out_immSrc; // @[Core_1.scala 178:57 181:27]
  wire  dec_decodeSigs_0_immSign = dec_decoders_0_io_out_immSign; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_0_csrOp = dec_decoders_0_io_out_csrOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_0_excpType = dec_decoders_0_io_out_excpType; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_1_brType = dec_decoders_1_io_out_brType; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_1_wbType = dec_decoders_1_io_out_wbType; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_1_lsuOp = dec_decoders_1_io_out_lsuOp; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_1_aluOp = dec_decoders_1_io_out_aluOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_1_opr1 = dec_decoders_1_io_out_opr1; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_1_opr2 = dec_decoders_1_io_out_opr2; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_1_immSrc = dec_decoders_1_io_out_immSrc; // @[Core_1.scala 178:57 181:27]
  wire  dec_decodeSigs_1_immSign = dec_decoders_1_io_out_immSign; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_1_csrOp = dec_decoders_1_io_out_csrOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_1_excpType = dec_decoders_1_io_out_excpType; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_2_brType = dec_decoders_2_io_out_brType; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_2_wbType = dec_decoders_2_io_out_wbType; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_2_lsuOp = dec_decoders_2_io_out_lsuOp; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_2_aluOp = dec_decoders_2_io_out_aluOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_2_opr1 = dec_decoders_2_io_out_opr1; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_2_opr2 = dec_decoders_2_io_out_opr2; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_2_immSrc = dec_decoders_2_io_out_immSrc; // @[Core_1.scala 178:57 181:27]
  wire  dec_decodeSigs_2_immSign = dec_decoders_2_io_out_immSign; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_2_csrOp = dec_decoders_2_io_out_csrOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_2_excpType = dec_decoders_2_io_out_excpType; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_3_brType = dec_decoders_3_io_out_brType; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_3_wbType = dec_decoders_3_io_out_wbType; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_3_lsuOp = dec_decoders_3_io_out_lsuOp; // @[Core_1.scala 178:57 181:27]
  wire [4:0] dec_decodeSigs_3_aluOp = dec_decoders_3_io_out_aluOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_3_opr1 = dec_decoders_3_io_out_opr1; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_3_opr2 = dec_decoders_3_io_out_opr2; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_3_immSrc = dec_decoders_3_io_out_immSrc; // @[Core_1.scala 178:57 181:27]
  wire  dec_decodeSigs_3_immSign = dec_decoders_3_io_out_immSign; // @[Core_1.scala 178:57 181:27]
  wire [2:0] dec_decodeSigs_3_csrOp = dec_decoders_3_io_out_csrOp; // @[Core_1.scala 178:57 181:27]
  wire [3:0] dec_decodeSigs_3_excpType = dec_decoders_3_io_out_excpType; // @[Core_1.scala 178:57 181:27]
  wire  _GEN_70 = issue_full & issue_fire ? 1'h0 : issue_full; // @[Core_1.scala 205:29 225:{41,54}]
  wire  _GEN_71 = dec_fire | _GEN_70; // @[Core_1.scala 224:{23,36}]
  wire [1:0] _issue_ptr_T_1 = issue_ptr + 2'h1; // @[Core_1.scala 231:56]
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
  wire  issue_aluValid = issue_chosenDecodesigs_aluOp != 5'h11; // @[Core_1.scala 253:55]
  wire  issue_bruValid = issue_chosenDecodesigs_brType != 4'h0; // @[Core_1.scala 254:56]
  wire  issue_lsuValid = issue_chosenDecodesigs_lsuOp != 5'h0; // @[Core_1.scala 255:55]
  wire  issue_csrValid = issue_chosenDecodesigs_csrOp != 3'h0 | issue_chosenDecodesigs_excpType != 4'h0; // @[Core_1.scala 256:67]
  wire [1:0] _T_8 = issue_aluValid + issue_bruValid; // @[Bitwise.scala 51:90]
  wire [1:0] _T_10 = issue_lsuValid + issue_csrValid; // @[Bitwise.scala 51:90]
  wire [2:0] _T_12 = _T_8 + _T_10; // @[Bitwise.scala 51:90]
  wire  _T_19 = ~reset; // @[Core_1.scala 257:11]
  wire [1:0] _scoreboard_io_issue_bits_fuId_T = issue_csrValid ? 2'h3 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _scoreboard_io_issue_bits_fuId_T_1 = issue_lsuValid ? 2'h2 : _scoreboard_io_issue_bits_fuId_T; // @[Mux.scala 101:16]
  wire [1:0] _scoreboard_io_issue_bits_fuId_T_2 = issue_bruValid ? 2'h1 : _scoreboard_io_issue_bits_fuId_T_1; // @[Mux.scala 101:16]
  wire [4:0] _scoreboard_io_issue_bits_op_T = issue_csrValid ? {{2'd0}, issue_chosenDecodesigs_csrOp} : 5'h0; // @[Mux.scala 101:16]
  wire [4:0] _scoreboard_io_issue_bits_op_T_1 = issue_lsuValid ? issue_chosenDecodesigs_lsuOp :
    _scoreboard_io_issue_bits_op_T; // @[Mux.scala 101:16]
  wire [4:0] _scoreboard_io_issue_bits_op_T_2 = issue_bruValid ? {{1'd0}, issue_chosenDecodesigs_brType} :
    _scoreboard_io_issue_bits_op_T_1; // @[Mux.scala 101:16]
  wire [4:0] _scoreboard_io_issue_bits_op_T_3 = issue_aluValid ? issue_chosenDecodesigs_aluOp :
    _scoreboard_io_issue_bits_op_T_2; // @[Mux.scala 101:16]
  wire  _csrCommit_io_shiftLeft_T = aluStage_io_out_ready & aluStage_io_out_valid; // @[Decoupled.scala 51:35]
  wire  _csrCommit_io_shiftLeft_T_3 = lsuStage_io_out_ready & lsuStage_io_out_valid; // @[Decoupled.scala 51:35]
  wire [3:0] _issue_stagePc_T = {issue_ptr, 2'h0}; // @[Core_1.scala 301:47]
  wire [31:0] _GEN_80 = {{28'd0}, _issue_stagePc_T}; // @[Core_1.scala 301:34]
  wire [31:0] issue_stagePc = issue_pc + _GEN_80; // @[Core_1.scala 301:34]
  wire  _aluStage_io_in_valid_T = scoreboard_io_issue_ready & scoreboard_io_issue_valid; // @[Decoupled.scala 51:35]
  wire [7:0] _GEN_81 = {{5'd0}, csrCommit_io_out}; // @[Core_1.scala 318:93]
  wire  _aluStage_io_out_ready_T = aluStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 318:93]
  reg  scoreboard_io_execute_0_REG; // @[Core_1.scala 320:42]
  wire  _bruStage_io_out_ready_T_1 = bruStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 340:129]
  reg  scoreboard_io_execute_1_REG; // @[Core_1.scala 342:42]
  wire  _lsuStage_io_out_ready_T = lsuStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 365:93]
  reg  scoreboard_io_execute_2_REG; // @[Core_1.scala 367:42]
  wire  _csrStage_io_out_ready_T = csrStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 390:93]
  reg  scoreboard_io_execute_3_REG; // @[Core_1.scala 392:42]
  wire [3:0] rfWrVec = {rf_io_w_3_en,rf_io_w_2_en,rf_io_w_1_en,rf_io_w_0_en}; // @[Cat.scala 33:92]
  wire [1:0] _T_25 = rfWrVec[0] + rfWrVec[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_27 = rfWrVec[2] + rfWrVec[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_29 = _T_25 + _T_27; // @[Bitwise.scala 51:90]
  wire [3:0] instCommitVec = {_csrExcpValid_T,_csrCommit_io_shiftLeft_T_3,_bruBrTaken_T,_csrCommit_io_shiftLeft_T}; // @[Cat.scala 33:92]
  wire [1:0] _T_39 = instCommitVec[0] + instCommitVec[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_41 = instCommitVec[2] + instCommitVec[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_43 = _T_39 + _T_41; // @[Bitwise.scala 51:90]
  wire [31:0] _instState_inst_T_4 = instCommitVec[0] ? aluStage_io_out_bits_inst : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_inst_T_5 = instCommitVec[1] ? bruStage_io_out_bits_inst : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_inst_T_6 = instCommitVec[2] ? lsuStage_io_out_bits_inst : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_inst_T_7 = instCommitVec[3] ? csrStage_io_out_bits_inst : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_inst_T_8 = _instState_inst_T_4 | _instState_inst_T_5; // @[Mux.scala 27:73]
  wire [31:0] _instState_inst_T_9 = _instState_inst_T_8 | _instState_inst_T_6; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_4 = instCommitVec[0] ? aluStage_io_out_bits_pc : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_5 = instCommitVec[1] ? bruStage_io_out_bits_pc : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_6 = instCommitVec[2] ? lsuStage_io_out_bits_pc : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_7 = instCommitVec[3] ? csrStage_io_out_bits_pc : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_8 = _instState_pc_T_4 | _instState_pc_T_5; // @[Mux.scala 27:73]
  wire [31:0] _instState_pc_T_9 = _instState_pc_T_8 | _instState_pc_T_6; // @[Mux.scala 27:73]
  reg  io_out_state_instState_REG_commit; // @[Core_1.scala 438:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core_1.scala 438:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core_1.scala 438:38]
  InstBuffer ib ( // @[Core_1.scala 49:20]
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
  ICache icache ( // @[Core_1.scala 51:24]
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
  RegFile2 rf ( // @[Core_1.scala 63:20]
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
    .io_w_0_addr(rf_io_w_0_addr),
    .io_w_0_en(rf_io_w_0_en),
    .io_w_0_data(rf_io_w_0_data),
    .io_w_1_addr(rf_io_w_1_addr),
    .io_w_1_en(rf_io_w_1_en),
    .io_w_1_data(rf_io_w_1_data),
    .io_w_2_addr(rf_io_w_2_addr),
    .io_w_2_en(rf_io_w_2_en),
    .io_w_2_data(rf_io_w_2_data),
    .io_w_3_addr(rf_io_w_3_addr),
    .io_w_3_en(rf_io_w_3_en),
    .io_w_3_data(rf_io_w_3_data),
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
  ALUStage aluStage ( // @[Core_1.scala 67:26]
    .clock(aluStage_clock),
    .reset(aluStage_reset),
    .io_in_ready(aluStage_io_in_ready),
    .io_in_valid(aluStage_io_in_valid),
    .io_in_bits_opr1(aluStage_io_in_bits_opr1),
    .io_in_bits_opr2(aluStage_io_in_bits_opr2),
    .io_in_bits_aluOp(aluStage_io_in_bits_aluOp),
    .io_in_bits_immSrc(aluStage_io_in_bits_immSrc),
    .io_in_bits_immSign(aluStage_io_in_bits_immSign),
    .io_in_bits_inst(aluStage_io_in_bits_inst),
    .io_in_bits_pc(aluStage_io_in_bits_pc),
    .io_in_bits_id(aluStage_io_in_bits_id),
    .io_out_ready(aluStage_io_out_ready),
    .io_out_valid(aluStage_io_out_valid),
    .io_out_bits_data(aluStage_io_out_bits_data),
    .io_out_bits_rd(aluStage_io_out_bits_rd),
    .io_out_bits_inst(aluStage_io_out_bits_inst),
    .io_out_bits_pc(aluStage_io_out_bits_pc),
    .io_out_bits_id(aluStage_io_out_bits_id),
    .io_rfRd_0_addr(aluStage_io_rfRd_0_addr),
    .io_rfRd_0_en(aluStage_io_rfRd_0_en),
    .io_rfRd_0_data(aluStage_io_rfRd_0_data),
    .io_rfRd_1_addr(aluStage_io_rfRd_1_addr),
    .io_rfRd_1_data(aluStage_io_rfRd_1_data),
    .io_rfRdReady(aluStage_io_rfRdReady),
    .io_flush(aluStage_io_flush)
  );
  BRUStage bruStage ( // @[Core_1.scala 68:26]
    .clock(bruStage_clock),
    .reset(bruStage_reset),
    .io_in_ready(bruStage_io_in_ready),
    .io_in_valid(bruStage_io_in_valid),
    .io_in_bits_opr1(bruStage_io_in_bits_opr1),
    .io_in_bits_opr2(bruStage_io_in_bits_opr2),
    .io_in_bits_bruOp(bruStage_io_in_bits_bruOp),
    .io_in_bits_immSrc(bruStage_io_in_bits_immSrc),
    .io_in_bits_inst(bruStage_io_in_bits_inst),
    .io_in_bits_pc(bruStage_io_in_bits_pc),
    .io_in_bits_id(bruStage_io_in_bits_id),
    .io_out_ready(bruStage_io_out_ready),
    .io_out_valid(bruStage_io_out_valid),
    .io_out_bits_brTaken(bruStage_io_out_bits_brTaken),
    .io_out_bits_brAddr(bruStage_io_out_bits_brAddr),
    .io_out_bits_data(bruStage_io_out_bits_data),
    .io_out_bits_rd(bruStage_io_out_bits_rd),
    .io_out_bits_wrEn(bruStage_io_out_bits_wrEn),
    .io_out_bits_inst(bruStage_io_out_bits_inst),
    .io_out_bits_pc(bruStage_io_out_bits_pc),
    .io_out_bits_id(bruStage_io_out_bits_id),
    .io_rfRd_0_addr(bruStage_io_rfRd_0_addr),
    .io_rfRd_0_en(bruStage_io_rfRd_0_en),
    .io_rfRd_0_data(bruStage_io_rfRd_0_data),
    .io_rfRd_1_addr(bruStage_io_rfRd_1_addr),
    .io_rfRd_1_data(bruStage_io_rfRd_1_data),
    .io_rfRdReady(bruStage_io_rfRdReady),
    .io_flush(bruStage_io_flush)
  );
  LSUStage lsuStage ( // @[Core_1.scala 69:26]
    .clock(lsuStage_clock),
    .reset(lsuStage_reset),
    .io_in_ready(lsuStage_io_in_ready),
    .io_in_valid(lsuStage_io_in_valid),
    .io_in_bits_lsuOp(lsuStage_io_in_bits_lsuOp),
    .io_in_bits_immSrc(lsuStage_io_in_bits_immSrc),
    .io_in_bits_inst(lsuStage_io_in_bits_inst),
    .io_in_bits_pc(lsuStage_io_in_bits_pc),
    .io_in_bits_id(lsuStage_io_in_bits_id),
    .io_out_ready(lsuStage_io_out_ready),
    .io_out_valid(lsuStage_io_out_valid),
    .io_out_bits_data(lsuStage_io_out_bits_data),
    .io_out_bits_rd(lsuStage_io_out_bits_rd),
    .io_out_bits_wrEn(lsuStage_io_out_bits_wrEn),
    .io_out_bits_inst(lsuStage_io_out_bits_inst),
    .io_out_bits_pc(lsuStage_io_out_bits_pc),
    .io_out_bits_id(lsuStage_io_out_bits_id),
    .io_rfRd_0_addr(lsuStage_io_rfRd_0_addr),
    .io_rfRd_0_en(lsuStage_io_rfRd_0_en),
    .io_rfRd_0_data(lsuStage_io_rfRd_0_data),
    .io_rfRd_1_addr(lsuStage_io_rfRd_1_addr),
    .io_rfRd_1_data(lsuStage_io_rfRd_1_data),
    .io_rfRdReady(lsuStage_io_rfRdReady),
    .io_cache_read_req_ready(lsuStage_io_cache_read_req_ready),
    .io_cache_read_req_valid(lsuStage_io_cache_read_req_valid),
    .io_cache_read_req_bits_addr(lsuStage_io_cache_read_req_bits_addr),
    .io_cache_read_resp_ready(lsuStage_io_cache_read_resp_ready),
    .io_cache_read_resp_valid(lsuStage_io_cache_read_resp_valid),
    .io_cache_read_resp_bits_data(lsuStage_io_cache_read_resp_bits_data),
    .io_cache_write_req_ready(lsuStage_io_cache_write_req_ready),
    .io_cache_write_req_valid(lsuStage_io_cache_write_req_valid),
    .io_cache_write_req_bits_addr(lsuStage_io_cache_write_req_bits_addr),
    .io_cache_write_req_bits_data(lsuStage_io_cache_write_req_bits_data),
    .io_cache_write_req_bits_mask(lsuStage_io_cache_write_req_bits_mask),
    .io_cache_write_resp_ready(lsuStage_io_cache_write_resp_ready),
    .io_cache_write_resp_valid(lsuStage_io_cache_write_resp_valid),
    .io_flush(lsuStage_io_flush)
  );
  CSRStage csrStage ( // @[Core_1.scala 70:26]
    .clock(csrStage_clock),
    .reset(csrStage_reset),
    .io_in_ready(csrStage_io_in_ready),
    .io_in_valid(csrStage_io_in_valid),
    .io_in_bits_csrOp(csrStage_io_in_bits_csrOp),
    .io_in_bits_excpType(csrStage_io_in_bits_excpType),
    .io_in_bits_inst(csrStage_io_in_bits_inst),
    .io_in_bits_pc(csrStage_io_in_bits_pc),
    .io_in_bits_id(csrStage_io_in_bits_id),
    .io_out_ready(csrStage_io_out_ready),
    .io_out_valid(csrStage_io_out_valid),
    .io_out_bits_data(csrStage_io_out_bits_data),
    .io_out_bits_rd(csrStage_io_out_bits_rd),
    .io_out_bits_wrEn(csrStage_io_out_bits_wrEn),
    .io_out_bits_excpAddr(csrStage_io_out_bits_excpAddr),
    .io_out_bits_excpValid(csrStage_io_out_bits_excpValid),
    .io_out_bits_inst(csrStage_io_out_bits_inst),
    .io_out_bits_pc(csrStage_io_out_bits_pc),
    .io_out_bits_id(csrStage_io_out_bits_id),
    .io_rfRd_0_addr(csrStage_io_rfRd_0_addr),
    .io_rfRd_0_en(csrStage_io_rfRd_0_en),
    .io_rfRd_0_data(csrStage_io_rfRd_0_data),
    .io_rfRdReady(csrStage_io_rfRdReady),
    .io_flush(csrStage_io_flush),
    .csrState_mcycle(csrStage_csrState_mcycle),
    .csrState_mcycleh(csrStage_csrState_mcycleh)
  );
  EdgeDetect edgeBackPressure ( // @[Core_1.scala 109:34]
    .clock(edgeBackPressure_clock),
    .io_in(edgeBackPressure_io_in),
    .io_change(edgeBackPressure_io_change)
  );
  Queue_5 fetch_pendingBranch ( // @[Core_1.scala 114:37]
    .clock(fetch_pendingBranch_clock),
    .reset(fetch_pendingBranch_reset),
    .io_enq_ready(fetch_pendingBranch_io_enq_ready),
    .io_enq_valid(fetch_pendingBranch_io_enq_valid),
    .io_enq_bits(fetch_pendingBranch_io_enq_bits),
    .io_deq_ready(fetch_pendingBranch_io_deq_ready),
    .io_deq_valid(fetch_pendingBranch_io_deq_valid),
    .io_deq_bits(fetch_pendingBranch_io_deq_bits)
  );
  Decoder_1 dec_decoders_0 ( // @[Core_1.scala 177:53]
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
  Decoder_1 dec_decoders_1 ( // @[Core_1.scala 177:53]
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
  Decoder_1 dec_decoders_2 ( // @[Core_1.scala 177:53]
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
  Decoder_1 dec_decoders_3 ( // @[Core_1.scala 177:53]
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
  Scoreboard scoreboard ( // @[Core_1.scala 266:28]
    .clock(scoreboard_clock),
    .reset(scoreboard_reset),
    .io_issue_ready(scoreboard_io_issue_ready),
    .io_issue_valid(scoreboard_io_issue_valid),
    .io_issue_bits_fuId(scoreboard_io_issue_bits_fuId),
    .io_issue_bits_op(scoreboard_io_issue_bits_op),
    .io_issue_bits_rd(scoreboard_io_issue_bits_rd),
    .io_issue_bits_rs1(scoreboard_io_issue_bits_rs1),
    .io_issue_bits_rs2(scoreboard_io_issue_bits_rs2),
    .io_readOpr_0_ready(scoreboard_io_readOpr_0_ready),
    .io_readOpr_0_valid(scoreboard_io_readOpr_0_valid),
    .io_readOpr_1_ready(scoreboard_io_readOpr_1_ready),
    .io_readOpr_1_valid(scoreboard_io_readOpr_1_valid),
    .io_readOpr_2_ready(scoreboard_io_readOpr_2_ready),
    .io_readOpr_2_valid(scoreboard_io_readOpr_2_valid),
    .io_readOpr_3_ready(scoreboard_io_readOpr_3_ready),
    .io_readOpr_3_valid(scoreboard_io_readOpr_3_valid),
    .io_execute_0(scoreboard_io_execute_0),
    .io_execute_1(scoreboard_io_execute_1),
    .io_execute_2(scoreboard_io_execute_2),
    .io_execute_3(scoreboard_io_execute_3),
    .io_writeback_0_ready(scoreboard_io_writeback_0_ready),
    .io_writeback_0_valid(scoreboard_io_writeback_0_valid),
    .io_writeback_1_ready(scoreboard_io_writeback_1_ready),
    .io_writeback_1_valid(scoreboard_io_writeback_1_valid),
    .io_writeback_2_ready(scoreboard_io_writeback_2_ready),
    .io_writeback_2_valid(scoreboard_io_writeback_2_valid),
    .io_writeback_3_ready(scoreboard_io_writeback_3_ready),
    .io_writeback_3_valid(scoreboard_io_writeback_3_valid),
    .io_flush(scoreboard_io_flush)
  );
  CircularShiftRegister csrIssue ( // @[Core_1.scala 288:26]
    .clock(csrIssue_clock),
    .reset(csrIssue_reset),
    .io_shiftLeft(csrIssue_io_shiftLeft),
    .io_out(csrIssue_io_out),
    .io_reset(csrIssue_io_reset)
  );
  CircularShiftRegister csrCommit ( // @[Core_1.scala 295:27]
    .clock(csrCommit_clock),
    .reset(csrCommit_reset),
    .io_shiftLeft(csrCommit_io_shiftLeft),
    .io_out(csrCommit_io_out),
    .io_reset(csrCommit_io_reset)
  );
  DCache dcache ( // @[Core_1.scala 372:24]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_read_req_ready(dcache_io_read_req_ready),
    .io_read_req_valid(dcache_io_read_req_valid),
    .io_read_req_bits_addr(dcache_io_read_req_bits_addr),
    .io_read_resp_valid(dcache_io_read_resp_valid),
    .io_read_resp_bits_data(dcache_io_read_resp_bits_data),
    .io_write_req_ready(dcache_io_write_req_ready),
    .io_write_req_valid(dcache_io_write_req_valid),
    .io_write_req_bits_addr(dcache_io_write_req_bits_addr),
    .io_write_req_bits_data(dcache_io_write_req_bits_data),
    .io_write_req_bits_mask(dcache_io_write_req_bits_mask),
    .io_write_resp_valid(dcache_io_write_resp_valid),
    .io_tlbus_req_ready(dcache_io_tlbus_req_ready),
    .io_tlbus_req_valid(dcache_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(dcache_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(dcache_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(dcache_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(dcache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(dcache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(dcache_io_tlbus_resp_bits_data)
  );
  TLXbar xbar ( // @[Core_1.scala 446:22]
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
  SingleROM rom ( // @[Core_1.scala 447:21]
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
  assign io_out_state_intRegState_regState_0 = rf_regState_0_regState_0; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_1 = rf_regState_0_regState_1; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_2 = rf_regState_0_regState_2; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_3 = rf_regState_0_regState_3; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_4 = rf_regState_0_regState_4; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_5 = rf_regState_0_regState_5; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_6 = rf_regState_0_regState_6; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_7 = rf_regState_0_regState_7; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_8 = rf_regState_0_regState_8; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_9 = rf_regState_0_regState_9; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_10 = rf_regState_0_regState_10; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_11 = rf_regState_0_regState_11; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_12 = rf_regState_0_regState_12; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_13 = rf_regState_0_regState_13; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_14 = rf_regState_0_regState_14; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_15 = rf_regState_0_regState_15; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_16 = rf_regState_0_regState_16; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_17 = rf_regState_0_regState_17; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_18 = rf_regState_0_regState_18; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_19 = rf_regState_0_regState_19; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_20 = rf_regState_0_regState_20; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_21 = rf_regState_0_regState_21; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_22 = rf_regState_0_regState_22; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_23 = rf_regState_0_regState_23; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_24 = rf_regState_0_regState_24; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_25 = rf_regState_0_regState_25; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_26 = rf_regState_0_regState_26; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_27 = rf_regState_0_regState_27; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_28 = rf_regState_0_regState_28; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_29 = rf_regState_0_regState_29; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_30 = rf_regState_0_regState_30; // @[Core_1.scala 432:28]
  assign io_out_state_intRegState_regState_31 = rf_regState_0_regState_31; // @[Core_1.scala 432:28]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core_1.scala 438:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core_1.scala 438:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core_1.scala 438:28]
  assign io_out_state_csrState_mcycle = csrStage_csrState_mcycle; // @[Core_1.scala 435:28]
  assign io_out_state_csrState_mcycleh = csrStage_csrState_mcycleh; // @[Core_1.scala 435:28]
  assign ib_clock = clock;
  assign ib_reset = reset;
  assign ib_io_in_valid = fetch_valid & (~blockValid | willWakeUp) & ~willBlock; // @[Core_1.scala 151:66]
  assign ib_io_in_bits_icache_data = icache_io_read_resp_bits_data; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_addr = icache_io_read_resp_bits_addr; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_inst_0 = icache_io_read_resp_bits_inst_0; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_inst_1 = icache_io_read_resp_bits_inst_1; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_inst_2 = icache_io_read_resp_bits_inst_2; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_inst_3 = icache_io_read_resp_bits_inst_3; // @[Core_1.scala 152:26]
  assign ib_io_in_bits_icache_size = icacheRespIsAlignAddr ? icache_io_read_resp_bits_size :
    _ib_io_in_bits_icache_size_T_2; // @[Core_1.scala 156:37]
  assign ib_io_in_bits_pc = icache_io_read_resp_bits_addr; // @[Core_1.scala 157:22]
  assign ib_io_in_bits_flush = globalBrTaken | reset; // @[Core_1.scala 158:42]
  assign ib_io_out_ready = ~dec_full | dec_fire; // @[Core_1.scala 172:28]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = preFetchInst & io_in_start; // @[Core_1.scala 129:46]
  assign icache_io_read_req_bits_addr = _lastPc_T ? _icache_io_read_req_bits_addr_T_1 :
    _icache_io_read_req_bits_addr_T_2; // @[Core_1.scala 130:40]
  assign icache_io_read_resp_ready = ib_io_in_ready; // @[Core_1.scala 131:31]
  assign icache_io_tlbus_req_ready = xbar_io_masterFace_in_0_ready; // @[Core_1.scala 449:25]
  assign icache_io_tlbus_resp_valid = xbar_io_masterFace_out_0_valid; // @[Core_1.scala 450:26]
  assign icache_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_0_bits_opcode; // @[Core_1.scala 450:26]
  assign icache_io_tlbus_resp_bits_data = xbar_io_masterFace_out_0_bits_data; // @[Core_1.scala 450:26]
  assign icache_io_flush = globalBrTaken; // @[Core_1.scala 132:21]
  assign rf_clock = clock;
  assign rf_reset = reset;
  assign rf_io_r_0_addr = aluStage_io_rfRd_0_addr; // @[Core_1.scala 315:25]
  assign rf_io_r_1_addr = aluStage_io_rfRd_1_addr; // @[Core_1.scala 316:25]
  assign rf_io_r_2_addr = bruStage_io_rfRd_0_addr; // @[Core_1.scala 337:25]
  assign rf_io_r_3_addr = bruStage_io_rfRd_1_addr; // @[Core_1.scala 338:25]
  assign rf_io_r_4_addr = lsuStage_io_rfRd_0_addr; // @[Core_1.scala 362:25]
  assign rf_io_r_5_addr = lsuStage_io_rfRd_1_addr; // @[Core_1.scala 363:25]
  assign rf_io_r_6_addr = csrStage_io_rfRd_0_addr; // @[Core_1.scala 387:25]
  assign rf_io_w_0_addr = aluStage_io_out_bits_rd; // @[Core_1.scala 403:21]
  assign rf_io_w_0_en = aluStage_io_out_ready & aluStage_io_out_valid; // @[Decoupled.scala 51:35]
  assign rf_io_w_0_data = aluStage_io_out_bits_data; // @[Core_1.scala 404:21]
  assign rf_io_w_1_addr = bruStage_io_out_bits_rd; // @[Core_1.scala 407:21]
  assign rf_io_w_1_en = _bruBrTaken_T & bruStage_io_out_bits_wrEn; // @[Core_1.scala 406:43]
  assign rf_io_w_1_data = bruStage_io_out_bits_data; // @[Core_1.scala 408:21]
  assign rf_io_w_2_addr = lsuStage_io_out_bits_rd; // @[Core_1.scala 411:21]
  assign rf_io_w_2_en = _csrCommit_io_shiftLeft_T_3 & lsuStage_io_out_bits_wrEn; // @[Core_1.scala 410:43]
  assign rf_io_w_2_data = lsuStage_io_out_bits_data; // @[Core_1.scala 412:21]
  assign rf_io_w_3_addr = csrStage_io_out_bits_rd; // @[Core_1.scala 415:21]
  assign rf_io_w_3_en = _csrExcpValid_T & csrStage_io_out_bits_wrEn; // @[Core_1.scala 414:43]
  assign rf_io_w_3_data = csrStage_io_out_bits_data; // @[Core_1.scala 416:21]
  assign aluStage_clock = clock;
  assign aluStage_reset = reset;
  assign aluStage_io_in_valid = issue_aluValid & _aluStage_io_in_valid_T; // @[Core_1.scala 314:44]
  assign aluStage_io_in_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_aluOp = _issue_chosenDecodesigs_T_52 | _issue_chosenDecodesigs_T_50; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_immSign = _issue_chosenDecodesigs_T[0] & issue_decodeSigs_0_immSign |
    _issue_chosenDecodesigs_T[1] & issue_decodeSigs_1_immSign | _issue_chosenDecodesigs_T[2] &
    issue_decodeSigs_2_immSign | _issue_chosenDecodesigs_T[3] & issue_decodeSigs_3_immSign; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign aluStage_io_in_bits_pc = issue_stagePc; // @[Core_1.scala 307:28]
  assign aluStage_io_in_bits_id = {{5'd0}, csrIssue_io_out}; // @[Core_1.scala 306:28]
  assign aluStage_io_out_ready = scoreboard_io_writeback_0_ready & aluStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 318:65]
  assign aluStage_io_rfRd_0_data = rf_io_r_0_data; // @[Core_1.scala 315:25]
  assign aluStage_io_rfRd_1_data = rf_io_r_1_data; // @[Core_1.scala 316:25]
  assign aluStage_io_rfRdReady = scoreboard_io_readOpr_0_ready; // @[Core_1.scala 317:27]
  assign aluStage_io_flush = globalBrTaken | reset; // @[Core_1.scala 323:40]
  assign bruStage_clock = clock;
  assign bruStage_reset = reset;
  assign bruStage_io_in_valid = issue_bruValid & _aluStage_io_in_valid_T; // @[Core_1.scala 336:44]
  assign bruStage_io_in_bits_opr1 = _issue_chosenDecodesigs_T_45 | _issue_chosenDecodesigs_T_43; // @[Mux.scala 27:73]
  assign bruStage_io_in_bits_opr2 = _issue_chosenDecodesigs_T_38 | _issue_chosenDecodesigs_T_36; // @[Mux.scala 27:73]
  assign bruStage_io_in_bits_bruOp = _issue_chosenDecodesigs_T_73 | _issue_chosenDecodesigs_T_71; // @[Mux.scala 27:73]
  assign bruStage_io_in_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign bruStage_io_in_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign bruStage_io_in_bits_pc = issue_stagePc; // @[Core_1.scala 330:28]
  assign bruStage_io_in_bits_id = {{5'd0}, csrIssue_io_out}; // @[Core_1.scala 329:28]
  assign bruStage_io_out_ready = scoreboard_io_writeback_1_ready & fetch_pendingBranch_io_enq_ready &
    bruStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 340:101]
  assign bruStage_io_rfRd_0_data = rf_io_r_2_data; // @[Core_1.scala 337:25]
  assign bruStage_io_rfRd_1_data = rf_io_r_3_data; // @[Core_1.scala 338:25]
  assign bruStage_io_rfRdReady = scoreboard_io_readOpr_1_ready; // @[Core_1.scala 339:27]
  assign bruStage_io_flush = globalBrTaken | reset; // @[Core_1.scala 345:40]
  assign lsuStage_clock = clock;
  assign lsuStage_reset = reset;
  assign lsuStage_io_in_valid = issue_lsuValid & _aluStage_io_in_valid_T; // @[Core_1.scala 361:44]
  assign lsuStage_io_in_bits_lsuOp = _issue_chosenDecodesigs_T_59 | _issue_chosenDecodesigs_T_57; // @[Mux.scala 27:73]
  assign lsuStage_io_in_bits_immSrc = _issue_chosenDecodesigs_T_31 | _issue_chosenDecodesigs_T_29; // @[Mux.scala 27:73]
  assign lsuStage_io_in_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign lsuStage_io_in_bits_pc = issue_stagePc; // @[Core_1.scala 355:28]
  assign lsuStage_io_in_bits_id = {{5'd0}, csrIssue_io_out}; // @[Core_1.scala 354:28]
  assign lsuStage_io_out_ready = scoreboard_io_writeback_2_ready & lsuStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 365:65]
  assign lsuStage_io_rfRd_0_data = rf_io_r_4_data; // @[Core_1.scala 362:25]
  assign lsuStage_io_rfRd_1_data = rf_io_r_5_data; // @[Core_1.scala 363:25]
  assign lsuStage_io_rfRdReady = scoreboard_io_readOpr_2_ready; // @[Core_1.scala 364:27]
  assign lsuStage_io_cache_read_req_ready = dcache_io_read_req_ready; // @[Core_1.scala 373:28]
  assign lsuStage_io_cache_read_resp_valid = dcache_io_read_resp_valid; // @[Core_1.scala 373:28]
  assign lsuStage_io_cache_read_resp_bits_data = dcache_io_read_resp_bits_data; // @[Core_1.scala 373:28]
  assign lsuStage_io_cache_write_req_ready = dcache_io_write_req_ready; // @[Core_1.scala 374:29]
  assign lsuStage_io_cache_write_resp_valid = dcache_io_write_resp_valid; // @[Core_1.scala 374:29]
  assign lsuStage_io_flush = globalBrTaken | reset; // @[Core_1.scala 370:40]
  assign csrStage_clock = clock;
  assign csrStage_reset = reset;
  assign csrStage_io_in_valid = issue_csrValid & _aluStage_io_in_valid_T; // @[Core_1.scala 386:44]
  assign csrStage_io_in_bits_csrOp = _issue_chosenDecodesigs_T_17 | _issue_chosenDecodesigs_T_15; // @[Mux.scala 27:73]
  assign csrStage_io_in_bits_excpType = _issue_chosenDecodesigs_T_10 | _issue_chosenDecodesigs_T_8; // @[Mux.scala 27:73]
  assign csrStage_io_in_bits_inst = _issue_chosenInst_T_10 | _issue_chosenInst_T_8; // @[Mux.scala 27:73]
  assign csrStage_io_in_bits_pc = issue_stagePc; // @[Core_1.scala 382:28]
  assign csrStage_io_in_bits_id = {{5'd0}, csrIssue_io_out}; // @[Core_1.scala 381:28]
  assign csrStage_io_out_ready = scoreboard_io_writeback_3_ready & csrStage_io_out_bits_id == _GEN_81; // @[Core_1.scala 390:65]
  assign csrStage_io_rfRd_0_data = rf_io_r_6_data; // @[Core_1.scala 387:25]
  assign csrStage_io_rfRdReady = scoreboard_io_readOpr_3_ready; // @[Core_1.scala 389:27]
  assign csrStage_io_flush = globalBrTaken | reset; // @[Core_1.scala 395:40]
  assign edgeBackPressure_clock = clock;
  assign edgeBackPressure_io_in = ib_io_status_back_pressure; // @[Core_1.scala 110:28]
  assign fetch_pendingBranch_clock = clock;
  assign fetch_pendingBranch_reset = reset;
  assign fetch_pendingBranch_io_enq_valid = globalBrTaken; // @[Core_1.scala 116:38]
  assign fetch_pendingBranch_io_enq_bits = csrExcpValid ? csrExcpAddr : bruBrAddr; // @[Core_1.scala 84:27]
  assign fetch_pendingBranch_io_deq_ready = icache_io_read_req_ready; // @[Core_1.scala 117:38]
  assign dec_decoders_0_io_inst = dec_inst_0_inst; // @[Core_1.scala 180:33]
  assign dec_decoders_1_io_inst = dec_inst_1_inst; // @[Core_1.scala 180:33]
  assign dec_decoders_2_io_inst = dec_inst_2_inst; // @[Core_1.scala 180:33]
  assign dec_decoders_3_io_inst = dec_inst_3_inst; // @[Core_1.scala 180:33]
  assign scoreboard_clock = clock;
  assign scoreboard_reset = reset;
  assign scoreboard_io_issue_valid = (issue_aluValid | issue_bruValid | issue_lsuValid | issue_csrValid) & issue_full; // @[Core_1.scala 269:105]
  assign scoreboard_io_issue_bits_fuId = issue_aluValid ? 2'h0 : _scoreboard_io_issue_bits_fuId_T_2; // @[Mux.scala 101:16]
  assign scoreboard_io_issue_bits_op = {{3'd0}, _scoreboard_io_issue_bits_op_T_3}; // @[Core_1.scala 276:33]
  assign scoreboard_io_issue_bits_rd = issue_chosenInst[11:7]; // @[util.scala 71:31]
  assign scoreboard_io_issue_bits_rs1 = issue_chosenDecodesigs_opr1 == 4'h1 ? rs1 : 5'h0; // @[Core_1.scala 247:24]
  assign scoreboard_io_issue_bits_rs2 = issue_chosenDecodesigs_opr2 == 4'h2 ? rs2 : 5'h0; // @[Core_1.scala 248:24]
  assign scoreboard_io_readOpr_0_valid = aluStage_io_rfRd_0_en; // @[Core_1.scala 319:38]
  assign scoreboard_io_readOpr_1_valid = bruStage_io_rfRd_0_en; // @[Core_1.scala 341:38]
  assign scoreboard_io_readOpr_2_valid = lsuStage_io_rfRd_0_en; // @[Core_1.scala 366:38]
  assign scoreboard_io_readOpr_3_valid = csrStage_io_rfRd_0_en; // @[Core_1.scala 391:38]
  assign scoreboard_io_execute_0 = scoreboard_io_execute_0_REG; // @[Core_1.scala 320:32]
  assign scoreboard_io_execute_1 = scoreboard_io_execute_1_REG; // @[Core_1.scala 342:32]
  assign scoreboard_io_execute_2 = scoreboard_io_execute_2_REG; // @[Core_1.scala 367:32]
  assign scoreboard_io_execute_3 = scoreboard_io_execute_3_REG; // @[Core_1.scala 392:32]
  assign scoreboard_io_writeback_0_valid = aluStage_io_out_valid & _aluStage_io_out_ready_T; // @[Core_1.scala 321:65]
  assign scoreboard_io_writeback_1_valid = bruStage_io_out_valid & fetch_pendingBranch_io_enq_ready &
    _bruStage_io_out_ready_T_1; // @[Core_1.scala 343:101]
  assign scoreboard_io_writeback_2_valid = lsuStage_io_out_valid & _lsuStage_io_out_ready_T; // @[Core_1.scala 368:65]
  assign scoreboard_io_writeback_3_valid = csrStage_io_out_valid & _csrStage_io_out_ready_T; // @[Core_1.scala 393:65]
  assign scoreboard_io_flush = globalBrTaken | reset; // @[Core_1.scala 286:42]
  assign csrIssue_clock = clock;
  assign csrIssue_reset = reset;
  assign csrIssue_io_shiftLeft = _issue_instFire_T | _issue_instFire_T_1 | _issue_instFire_T_3 | _issue_instFire_T_5; // @[Core_1.scala 233:89]
  assign csrIssue_io_reset = globalBrTaken | reset; // @[Core_1.scala 292:40]
  assign csrCommit_clock = clock;
  assign csrCommit_reset = reset;
  assign csrCommit_io_shiftLeft = _csrCommit_io_shiftLeft_T | _bruBrTaken_T | _csrCommit_io_shiftLeft_T_3 |
    _csrExcpValid_T; // @[Core_1.scala 298:100]
  assign csrCommit_io_reset = globalBrTaken | reset; // @[Core_1.scala 299:41]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_read_req_valid = lsuStage_io_cache_read_req_valid; // @[Core_1.scala 373:28]
  assign dcache_io_read_req_bits_addr = lsuStage_io_cache_read_req_bits_addr; // @[Core_1.scala 373:28]
  assign dcache_io_write_req_valid = lsuStage_io_cache_write_req_valid; // @[Core_1.scala 374:29]
  assign dcache_io_write_req_bits_addr = lsuStage_io_cache_write_req_bits_addr; // @[Core_1.scala 374:29]
  assign dcache_io_write_req_bits_data = lsuStage_io_cache_write_req_bits_data; // @[Core_1.scala 374:29]
  assign dcache_io_write_req_bits_mask = lsuStage_io_cache_write_req_bits_mask; // @[Core_1.scala 374:29]
  assign dcache_io_tlbus_req_ready = xbar_io_masterFace_in_1_ready; // @[Core_1.scala 452:25]
  assign dcache_io_tlbus_resp_valid = xbar_io_masterFace_out_1_valid; // @[Core_1.scala 453:26]
  assign dcache_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_1_bits_opcode; // @[Core_1.scala 453:26]
  assign dcache_io_tlbus_resp_bits_data = xbar_io_masterFace_out_1_bits_data; // @[Core_1.scala 453:26]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masterFace_in_0_valid = icache_io_tlbus_req_valid; // @[Core_1.scala 449:25]
  assign xbar_io_masterFace_in_0_bits_address = icache_io_tlbus_req_bits_address; // @[Core_1.scala 449:25]
  assign xbar_io_masterFace_in_1_valid = dcache_io_tlbus_req_valid; // @[Core_1.scala 452:25]
  assign xbar_io_masterFace_in_1_bits_opcode = dcache_io_tlbus_req_bits_opcode; // @[Core_1.scala 452:25]
  assign xbar_io_masterFace_in_1_bits_address = dcache_io_tlbus_req_bits_address; // @[Core_1.scala 452:25]
  assign xbar_io_masterFace_in_1_bits_data = dcache_io_tlbus_req_bits_data; // @[Core_1.scala 452:25]
  assign xbar_io_slaveFace_in_0_ready = rom_io_req_ready; // @[Core_1.scala 455:16]
  assign xbar_io_slaveFace_out_0_valid = rom_io_resp_valid; // @[Core_1.scala 456:17]
  assign xbar_io_slaveFace_out_0_bits_opcode = rom_io_resp_bits_opcode; // @[Core_1.scala 456:17]
  assign xbar_io_slaveFace_out_0_bits_data = rom_io_resp_bits_data; // @[Core_1.scala 456:17]
  assign rom_clock = clock;
  assign rom_reset = reset;
  assign rom_io_req_valid = xbar_io_slaveFace_in_0_valid; // @[Core_1.scala 455:16]
  assign rom_io_req_bits_opcode = xbar_io_slaveFace_in_0_bits_opcode; // @[Core_1.scala 455:16]
  assign rom_io_req_bits_size = xbar_io_slaveFace_in_0_bits_size; // @[Core_1.scala 455:16]
  assign rom_io_req_bits_address = xbar_io_slaveFace_in_0_bits_address; // @[Core_1.scala 455:16]
  assign rom_io_req_bits_data = xbar_io_slaveFace_in_0_bits_data; // @[Core_1.scala 455:16]
  assign rom_io_resp_ready = xbar_io_slaveFace_out_0_ready; // @[Core_1.scala 456:17]
  always @(posedge clock) begin
    if (reset) begin // @[Core_1.scala 93:24]
      pcReg <= 32'h0; // @[Core_1.scala 93:24]
    end else if (_lastPc_T & _preFetchInst_T_2) begin // @[Core_1.scala 135:49]
      if (brTaken) begin // @[Core_1.scala 138:18]
        pcReg <= fetch_pendingBranch_io_deq_bits;
      end else if (isAlignAddr) begin // @[Core_1.scala 98:22]
        pcReg <= _pcNext4_T_1;
      end else begin
        pcReg <= _pcNext4_T_8;
      end
    end
    if (_lastPc_T) begin // @[Reg.scala 20:18]
      lastPc <= icache_io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Core_1.scala 103:34]
      fetch_instValid <= 1'h0; // @[Core_1.scala 103:34]
    end else begin
      fetch_instValid <= _GEN_2;
    end
    firstFire <= reset | _GEN_3; // @[Reg.scala 35:{20,20}]
    if (globalBrTaken) begin // @[Reg.scala 20:18]
      if (csrExcpValid) begin // @[Core_1.scala 84:27]
        blockAddr <= csrExcpAddr;
      end else begin
        blockAddr <= bruBrAddr;
      end
    end
    if (reset) begin // @[Core_1.scala 145:29]
      blockValid <= 1'h0; // @[Core_1.scala 145:29]
    end else begin
      blockValid <= _GEN_7;
    end
    if (reset) begin // @[Core_1.scala 165:27]
      dec_full <= 1'h0; // @[Core_1.scala 165:27]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 192:21]
      dec_full <= 1'h0; // @[Core_1.scala 193:18]
    end else begin
      dec_full <= _GEN_18;
    end
    if (reset) begin // @[Core_1.scala 205:29]
      issue_full <= 1'h0; // @[Core_1.scala 205:29]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 238:23]
      issue_full <= 1'h0; // @[Core_1.scala 239:20]
    end else begin
      issue_full <= _GEN_71;
    end
    if (reset) begin // @[Core_1.scala 213:28]
      issue_ptr <= 2'h0; // @[Core_1.scala 213:28]
    end else if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 238:23]
      issue_ptr <= 2'h0; // @[Core_1.scala 240:19]
    end else if (issue_fire) begin // @[Core_1.scala 230:22]
      issue_ptr <= 2'h0; // @[Core_1.scala 230:34]
    end else if (issue_instFire) begin // @[Core_1.scala 231:31]
      issue_ptr <= _issue_ptr_T_1; // @[Core_1.scala 231:43]
    end
    if (dec_fire) begin // @[Reg.scala 20:18]
      issue_instValid <= _issue_instValid_T; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_0_inst <= ib_io_out_bits_inst_0_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 192:21]
      dec_inst_0_valid <= 1'h0; // @[Core_1.scala 194:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_0_valid <= ib_io_out_bits_inst_0_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_1_inst <= ib_io_out_bits_inst_1_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 192:21]
      dec_inst_1_valid <= 1'h0; // @[Core_1.scala 194:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_1_valid <= ib_io_out_bits_inst_1_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_2_inst <= ib_io_out_bits_inst_2_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 192:21]
      dec_inst_2_valid <= 1'h0; // @[Core_1.scala 194:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_2_valid <= ib_io_out_bits_inst_2_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_3_inst <= ib_io_out_bits_inst_3_inst; // @[Reg.scala 20:22]
    end
    if (_ib_io_in_bits_flush_T_1) begin // @[Core_1.scala 192:21]
      dec_inst_3_valid <= 1'h0; // @[Core_1.scala 194:40]
    end else if (dec_latch) begin // @[Reg.scala 20:18]
      dec_inst_3_valid <= ib_io_out_bits_inst_3_valid; // @[Reg.scala 20:22]
    end
    if (dec_latch) begin // @[Reg.scala 20:18]
      dec_pc <= ib_io_out_bits_pc; // @[Reg.scala 20:22]
    end
    if (dec_fire) begin // @[Reg.scala 20:18]
      issue_pc <= dec_pc; // @[Reg.scala 20:22]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_brType <= dec_decodeSigs_0_brType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_lsuOp <= dec_decodeSigs_0_lsuOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_aluOp <= dec_decodeSigs_0_aluOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_opr1 <= dec_decodeSigs_0_opr1; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_opr2 <= dec_decodeSigs_0_opr2; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_immSrc <= dec_decodeSigs_0_immSrc; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_immSign <= dec_decodeSigs_0_immSign; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_csrOp <= dec_decodeSigs_0_csrOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_0_excpType <= dec_decodeSigs_0_excpType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_brType <= dec_decodeSigs_1_brType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_lsuOp <= dec_decodeSigs_1_lsuOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_aluOp <= dec_decodeSigs_1_aluOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_opr1 <= dec_decodeSigs_1_opr1; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_opr2 <= dec_decodeSigs_1_opr2; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_immSrc <= dec_decodeSigs_1_immSrc; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_immSign <= dec_decodeSigs_1_immSign; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_csrOp <= dec_decodeSigs_1_csrOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_1_excpType <= dec_decodeSigs_1_excpType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_brType <= dec_decodeSigs_2_brType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_lsuOp <= dec_decodeSigs_2_lsuOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_aluOp <= dec_decodeSigs_2_aluOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_opr1 <= dec_decodeSigs_2_opr1; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_opr2 <= dec_decodeSigs_2_opr2; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_immSrc <= dec_decodeSigs_2_immSrc; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_immSign <= dec_decodeSigs_2_immSign; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_csrOp <= dec_decodeSigs_2_csrOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_2_excpType <= dec_decodeSigs_2_excpType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_brType <= dec_decodeSigs_3_brType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_lsuOp <= dec_decodeSigs_3_lsuOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_aluOp <= dec_decodeSigs_3_aluOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_opr1 <= dec_decodeSigs_3_opr1; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_opr2 <= dec_decodeSigs_3_opr2; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_immSrc <= dec_decodeSigs_3_immSrc; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_immSign <= dec_decodeSigs_3_immSign; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_csrOp <= dec_decodeSigs_3_csrOp; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_decodeSigs_3_excpType <= dec_decodeSigs_3_excpType; // @[Core_1.scala 217:33]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_inst_0 <= dec_inst_0_inst; // @[Core_1.scala 218:27]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_inst_1 <= dec_inst_1_inst; // @[Core_1.scala 218:27]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_inst_2 <= dec_inst_2_inst; // @[Core_1.scala 218:27]
    end
    if (dec_fire) begin // @[Core_1.scala 216:27]
      issue_inst_3 <= dec_inst_3_inst; // @[Core_1.scala 218:27]
    end
    scoreboard_io_execute_0_REG <= scoreboard_io_readOpr_0_ready & scoreboard_io_readOpr_0_valid; // @[Decoupled.scala 51:35]
    scoreboard_io_execute_1_REG <= scoreboard_io_readOpr_1_ready & scoreboard_io_readOpr_1_valid; // @[Decoupled.scala 51:35]
    scoreboard_io_execute_2_REG <= scoreboard_io_readOpr_2_ready & scoreboard_io_readOpr_2_valid; // @[Decoupled.scala 51:35]
    scoreboard_io_execute_3_REG <= scoreboard_io_readOpr_3_ready & scoreboard_io_readOpr_3_valid; // @[Decoupled.scala 51:35]
    io_out_state_instState_REG_commit <= |instCommitVec; // @[Core_1.scala 428:39]
    io_out_state_instState_REG_pc <= _instState_pc_T_9 | _instState_pc_T_7; // @[Mux.scala 27:73]
    io_out_state_instState_REG_inst <= _instState_inst_T_9 | _instState_inst_T_7; // @[Mux.scala 27:73]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_12 <= 3'h1 & issue_full | _issue_ready_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed: more than one op valid! %d %d %d %d inst=> %x aluOp=> %d bruOp=> %d lsuOp=> %d csrOp=> %d excpType=> %d\n    at Core_1.scala:257 assert(((PopCount(VecInit(Seq(issue_aluValid, issue_bruValid, issue_lsuValid, issue_csrValid))) <= 1.U && issue_full) || !issue_full),\n"
            ,issue_aluValid,issue_bruValid,issue_lsuValid,issue_csrValid,issue_chosenInst,issue_chosenDecodesigs_aluOp,
            issue_chosenDecodesigs_brType,issue_chosenDecodesigs_lsuOp,issue_chosenDecodesigs_csrOp,
            issue_chosenDecodesigs_excpType); // @[Core_1.scala 257:11]
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
          $fatal; // @[Core_1.scala 257:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_19 & ~(_T_29 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Write multiple reg at the same time! alu:WritePort(addr -> %d, en -> %d, data -> %d) bru:WritePort(addr -> %d, en -> %d, data -> %d) lsu:WritePort(addr -> %d, en -> %d, data -> %d) csr:WritePort(addr -> %d, en -> %d, data -> %d)\n    at Core_1.scala:420 assert(PopCount(rfWrVec) <= 1.U, cf\"Write multiple reg at the same time! alu:${rfw(0)} bru:${rfw(1)} lsu:${rfw(2)} csr:${rfw(3)}\" )\n"
            ,rf_io_w_0_addr,rf_io_w_0_en,rf_io_w_0_data,rf_io_w_1_addr,rf_io_w_1_en,rf_io_w_1_data,rf_io_w_2_addr,
            rf_io_w_2_en,rf_io_w_2_data,rf_io_w_3_addr,rf_io_w_3_en,rf_io_w_3_data); // @[Core_1.scala 420:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_29 <= 3'h1) & _T_19) begin
          $fatal; // @[Core_1.scala 420:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_19 & ~(_T_43 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Commit multiple inst at the same time! alu:%d bru:%d lsu:%d\n    at Core_1.scala:424 assert(PopCount(instCommitVec) <= 1.U, cf\"Commit multiple inst at the same time! alu:${instCommitVec(0)} bru:${instCommitVec(1)} lsu:${instCommitVec(2)}\" )\n"
            ,instCommitVec[0],instCommitVec[1],instCommitVec[2]); // @[Core_1.scala 424:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_43 <= 3'h1) & _T_19) begin
          $fatal; // @[Core_1.scala 424:11]
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
  fetch_instValid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  firstFire = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  blockAddr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  blockValid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  dec_full = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  issue_full = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  issue_ptr = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  issue_instValid = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  dec_inst_0_inst = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  dec_inst_0_valid = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  dec_inst_1_inst = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  dec_inst_1_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  dec_inst_2_inst = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  dec_inst_2_valid = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  dec_inst_3_inst = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  dec_inst_3_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  dec_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  issue_pc = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  issue_decodeSigs_0_brType = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  issue_decodeSigs_0_lsuOp = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  issue_decodeSigs_0_aluOp = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  issue_decodeSigs_0_opr1 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  issue_decodeSigs_0_opr2 = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  issue_decodeSigs_0_immSrc = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  issue_decodeSigs_0_immSign = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  issue_decodeSigs_0_csrOp = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  issue_decodeSigs_0_excpType = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  issue_decodeSigs_1_brType = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  issue_decodeSigs_1_lsuOp = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  issue_decodeSigs_1_aluOp = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  issue_decodeSigs_1_opr1 = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  issue_decodeSigs_1_opr2 = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  issue_decodeSigs_1_immSrc = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  issue_decodeSigs_1_immSign = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  issue_decodeSigs_1_csrOp = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  issue_decodeSigs_1_excpType = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  issue_decodeSigs_2_brType = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  issue_decodeSigs_2_lsuOp = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  issue_decodeSigs_2_aluOp = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  issue_decodeSigs_2_opr1 = _RAND_41[3:0];
  _RAND_42 = {1{`RANDOM}};
  issue_decodeSigs_2_opr2 = _RAND_42[3:0];
  _RAND_43 = {1{`RANDOM}};
  issue_decodeSigs_2_immSrc = _RAND_43[2:0];
  _RAND_44 = {1{`RANDOM}};
  issue_decodeSigs_2_immSign = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  issue_decodeSigs_2_csrOp = _RAND_45[2:0];
  _RAND_46 = {1{`RANDOM}};
  issue_decodeSigs_2_excpType = _RAND_46[3:0];
  _RAND_47 = {1{`RANDOM}};
  issue_decodeSigs_3_brType = _RAND_47[3:0];
  _RAND_48 = {1{`RANDOM}};
  issue_decodeSigs_3_lsuOp = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  issue_decodeSigs_3_aluOp = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  issue_decodeSigs_3_opr1 = _RAND_50[3:0];
  _RAND_51 = {1{`RANDOM}};
  issue_decodeSigs_3_opr2 = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  issue_decodeSigs_3_immSrc = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  issue_decodeSigs_3_immSign = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  issue_decodeSigs_3_csrOp = _RAND_54[2:0];
  _RAND_55 = {1{`RANDOM}};
  issue_decodeSigs_3_excpType = _RAND_55[3:0];
  _RAND_56 = {1{`RANDOM}};
  issue_inst_0 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  issue_inst_1 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  issue_inst_2 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  issue_inst_3 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  scoreboard_io_execute_0_REG = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  scoreboard_io_execute_1_REG = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  scoreboard_io_execute_2_REG = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  scoreboard_io_execute_3_REG = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  io_out_state_instState_REG_commit = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  io_out_state_instState_REG_pc = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  io_out_state_instState_REG_inst = _RAND_66[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
