module ICache(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  input         io_read_resp_ready,
  output        io_read_resp_valid,
  output [31:0] io_read_resp_bits_data,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [31:0] io_tlbus_req_bits_address,
  output        io_tlbus_resp_ready,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data
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
`endif // RANDOMIZE_REG_INIT
  wire  db_clock; // @[ICache.scala 56:20]
  wire  db_reset; // @[ICache.scala 56:20]
  wire  db_io_read_req_ready; // @[ICache.scala 56:20]
  wire  db_io_read_req_valid; // @[ICache.scala 56:20]
  wire [6:0] db_io_read_req_bits_set; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_0_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_1_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_2_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_3_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_4_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_5_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_6_7; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_read_resp_7_7; // @[ICache.scala 56:20]
  wire  db_io_write_req_ready; // @[ICache.scala 56:20]
  wire  db_io_write_req_valid; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data; // @[ICache.scala 56:20]
  wire [6:0] db_io_write_req_bits_set; // @[ICache.scala 56:20]
  wire [7:0] db_io_write_req_bits_blockSelOH; // @[ICache.scala 56:20]
  wire [7:0] db_io_write_req_bits_way; // @[ICache.scala 56:20]
  wire  dir_clock; // @[ICache.scala 57:21]
  wire  dir_reset; // @[ICache.scala 57:21]
  wire  dir_io_read_req_ready; // @[ICache.scala 57:21]
  wire  dir_io_read_req_valid; // @[ICache.scala 57:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[ICache.scala 57:21]
  wire  dir_io_read_resp_bits_hit; // @[ICache.scala 57:21]
  wire [7:0] dir_io_read_resp_bits_chosenWay; // @[ICache.scala 57:21]
  wire  dir_io_write_req_ready; // @[ICache.scala 57:21]
  wire  dir_io_write_req_valid; // @[ICache.scala 57:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[ICache.scala 57:21]
  wire [7:0] dir_io_write_req_bits_way; // @[ICache.scala 57:21]
  wire  refillPipe_clock; // @[ICache.scala 58:28]
  wire  refillPipe_reset; // @[ICache.scala 58:28]
  wire  refillPipe_io_req_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_req_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[ICache.scala 58:28]
  wire  refillPipe_io_resp_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_resp_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_req_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_req_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[ICache.scala 58:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_tlbus_resp_bits_data; // @[ICache.scala 58:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 58:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 58:28]
  wire [6:0] refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 58:28]
  wire  refillBuffer_clock; // @[ICache.scala 67:30]
  wire  refillBuffer_reset; // @[ICache.scala 67:30]
  wire  refillBuffer_io_write_valid; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_write_bits_cacheLineAddr; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_write_bits_data; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_0; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_1; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_2; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_3; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_0; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_1; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_2; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_3; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_4; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_5; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_6; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_7; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_0; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_1; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_2; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_3; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_4; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_5; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_6; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_7; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_0; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_1; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_2; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_3; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_4; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_5; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_6; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_7; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_0; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_1; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_2; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_3; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_4; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_5; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_6; // @[ICache.scala 67:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_7; // @[ICache.scala 67:30]
  wire  refillBuffer_io_read_valids_0; // @[ICache.scala 67:30]
  wire  refillBuffer_io_read_valids_1; // @[ICache.scala 67:30]
  wire  refillBuffer_io_read_valids_2; // @[ICache.scala 67:30]
  wire  refillBuffer_io_read_valids_3; // @[ICache.scala 67:30]
  reg  s0_full; // @[ICache.scala 77:26]
  wire  s0_latch = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  s1_full; // @[ICache.scala 123:26]
  reg  s1_info_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T_2 = ~s1_info_dirInfo_hit; // @[ICache.scala 146:25]
  wire  _s1_valid_T_3 = refillPipe_io_req_ready & refillPipe_io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_info_req_addr; // @[Reg.scala 19:16]
  wire [31:0] _bypassVec_T_2 = {s1_info_req_addr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire  bypassVec_0 = refillBuffer_io_read_cacheLineAddr_0 == _bypassVec_T_2 & refillBuffer_io_read_valids_0; // @[ICache.scala 135:154]
  wire  bypassVec_1 = refillBuffer_io_read_cacheLineAddr_1 == _bypassVec_T_2 & refillBuffer_io_read_valids_1; // @[ICache.scala 135:154]
  wire  bypassVec_2 = refillBuffer_io_read_cacheLineAddr_2 == _bypassVec_T_2 & refillBuffer_io_read_valids_2; // @[ICache.scala 135:154]
  wire  bypassVec_3 = refillBuffer_io_read_cacheLineAddr_3 == _bypassVec_T_2 & refillBuffer_io_read_valids_3; // @[ICache.scala 135:154]
  wire [3:0] _s1_bypass_T = {bypassVec_0,bypassVec_1,bypassVec_2,bypassVec_3}; // @[Cat.scala 33:92]
  wire  s1_bypass = |_s1_bypass_T & s1_full & _s1_valid_T_2; // @[ICache.scala 136:51]
  wire  _s1_valid_T_5 = ~s1_bypass; // @[ICache.scala 146:75]
  wire  _s1_valid_T_6 = ~s1_info_dirInfo_hit & _s1_valid_T_3 & ~s1_bypass; // @[ICache.scala 146:72]
  wire  _s1_valid_T_7 = s1_info_dirInfo_hit & io_read_resp_valid | _s1_valid_T_6; // @[ICache.scala 145:71]
  wire  _s1_valid_T_11 = _s1_valid_T_2 & s1_bypass & io_read_resp_valid; // @[ICache.scala 147:59]
  wire  _s1_valid_T_12 = _s1_valid_T_7 | _s1_valid_T_11; // @[ICache.scala 146:86]
  wire  s1_valid = s1_full & _s1_valid_T_12; // @[ICache.scala 145:25]
  reg  s2_full; // @[ICache.scala 153:26]
  reg  s2_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s2_valid_T = ~s2_dirInfo_hit; // @[ICache.scala 170:47]
  reg  s2_bypass; // @[Reg.scala 19:16]
  wire  s2_fire = s2_full & (s2_dirInfo_hit | ~s2_dirInfo_hit & io_read_resp_valid | s2_bypass); // @[ICache.scala 170:25]
  wire  s2_ready = ~s2_full | s2_fire; // @[ICache.scala 159:26]
  wire  s1_fire = s1_valid & s2_ready; // @[ICache.scala 126:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[ICache.scala 130:26]
  wire  s0_fire = s0_full & s1_ready; // @[ICache.scala 80:28]
  reg [31:0] s0_req_r_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[ICache.scala 77:26 87:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[ICache.scala 86:{20,30}]
  reg [7:0] s1_info_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6_7; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7_7; // @[Reg.scala 19:16]
  wire [31:0] s0_info_rdData_0_0 = db_io_read_resp_0_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_1 = db_io_read_resp_0_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_2 = db_io_read_resp_0_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_3 = db_io_read_resp_0_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_4 = db_io_read_resp_0_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_5 = db_io_read_resp_0_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_6 = db_io_read_resp_0_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_0_7 = db_io_read_resp_0_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_0 = db_io_read_resp_1_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_1 = db_io_read_resp_1_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_2 = db_io_read_resp_1_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_3 = db_io_read_resp_1_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_4 = db_io_read_resp_1_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_5 = db_io_read_resp_1_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_6 = db_io_read_resp_1_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_1_7 = db_io_read_resp_1_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_0 = db_io_read_resp_2_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_1 = db_io_read_resp_2_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_2 = db_io_read_resp_2_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_3 = db_io_read_resp_2_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_4 = db_io_read_resp_2_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_5 = db_io_read_resp_2_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_6 = db_io_read_resp_2_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_2_7 = db_io_read_resp_2_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_0 = db_io_read_resp_3_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_1 = db_io_read_resp_3_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_2 = db_io_read_resp_3_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_3 = db_io_read_resp_3_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_4 = db_io_read_resp_3_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_5 = db_io_read_resp_3_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_6 = db_io_read_resp_3_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_3_7 = db_io_read_resp_3_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_0 = db_io_read_resp_4_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_1 = db_io_read_resp_4_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_2 = db_io_read_resp_4_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_3 = db_io_read_resp_4_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_4 = db_io_read_resp_4_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_5 = db_io_read_resp_4_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_6 = db_io_read_resp_4_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_4_7 = db_io_read_resp_4_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_0 = db_io_read_resp_5_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_1 = db_io_read_resp_5_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_2 = db_io_read_resp_5_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_3 = db_io_read_resp_5_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_4 = db_io_read_resp_5_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_5 = db_io_read_resp_5_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_6 = db_io_read_resp_5_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_5_7 = db_io_read_resp_5_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_0 = db_io_read_resp_6_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_1 = db_io_read_resp_6_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_2 = db_io_read_resp_6_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_3 = db_io_read_resp_6_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_4 = db_io_read_resp_6_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_5 = db_io_read_resp_6_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_6 = db_io_read_resp_6_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_6_7 = db_io_read_resp_6_7; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_0 = db_io_read_resp_7_0; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_1 = db_io_read_resp_7_1; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_2 = db_io_read_resp_7_2; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_3 = db_io_read_resp_7_3; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_4 = db_io_read_resp_7_4; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_5 = db_io_read_resp_7_5; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_6 = db_io_read_resp_7_6; // @[ICache.scala 111:23 114:20]
  wire [31:0] s0_info_rdData_7_7 = db_io_read_resp_7_7; // @[ICache.scala 111:23 114:20]
  wire  s0_info_dirInfo_hit = dir_io_read_resp_bits_hit; // @[ICache.scala 111:23 112:21]
  wire [7:0] s0_info_dirInfo_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 111:23 112:21]
  wire [7:0] s1_blockSel = 8'h1 << s1_info_req_addr[4:2]; // @[OneHot.scala 57:35]
  wire  _GEN_72 = s1_full & s1_fire ? 1'h0 : s1_full; // @[ICache.scala 123:26 133:{35,45}]
  wire  _GEN_73 = s0_fire | _GEN_72; // @[ICache.scala 132:{20,30}]
  wire [3:0] _s1_bypassIdx_T = {bypassVec_3,bypassVec_2,bypassVec_1,bypassVec_0}; // @[Cat.scala 33:92]
  wire [1:0] s1_bypassIdx_hi_1 = _s1_bypassIdx_T[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] s1_bypassIdx_lo_1 = _s1_bypassIdx_T[1:0]; // @[OneHot.scala 31:18]
  wire  _s1_bypassIdx_T_1 = |s1_bypassIdx_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _s1_bypassIdx_T_2 = s1_bypassIdx_hi_1 | s1_bypassIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] s1_bypassIdx = {_s1_bypassIdx_T_1,_s1_bypassIdx_T_2[1]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_74 = refillBuffer_io_read_cacheLineData_0_0; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_75 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_0 : _GEN_74; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_76 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_0 : _GEN_75; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_77 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_0 : _GEN_76; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_10 = s1_blockSel[0] ? _GEN_77 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_78 = refillBuffer_io_read_cacheLineData_0_1; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_79 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_1 : _GEN_78; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_80 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_1 : _GEN_79; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_81 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_1 : _GEN_80; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_11 = s1_blockSel[1] ? _GEN_81 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_82 = refillBuffer_io_read_cacheLineData_0_2; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_83 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_2 : _GEN_82; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_84 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_2 : _GEN_83; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_85 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_2 : _GEN_84; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_12 = s1_blockSel[2] ? _GEN_85 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_86 = refillBuffer_io_read_cacheLineData_0_3; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_87 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_3 : _GEN_86; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_88 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_3 : _GEN_87; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_89 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_3 : _GEN_88; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_13 = s1_blockSel[3] ? _GEN_89 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_90 = refillBuffer_io_read_cacheLineData_0_4; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_91 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_4 : _GEN_90; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_92 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_4 : _GEN_91; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_93 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_4 : _GEN_92; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_14 = s1_blockSel[4] ? _GEN_93 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_94 = refillBuffer_io_read_cacheLineData_0_5; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_95 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_5 : _GEN_94; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_96 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_5 : _GEN_95; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_97 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_5 : _GEN_96; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_15 = s1_blockSel[5] ? _GEN_97 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_98 = refillBuffer_io_read_cacheLineData_0_6; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_99 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_6 : _GEN_98; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_100 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_6 : _GEN_99; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_101 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_6 : _GEN_100; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_16 = s1_blockSel[6] ? _GEN_101 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_102 = refillBuffer_io_read_cacheLineData_0_7; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_103 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_7 : _GEN_102; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_104 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_7 : _GEN_103; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_105 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_7 : _GEN_104; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_17 = s1_blockSel[7] ? _GEN_105 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_18 = _s1_bypassData_T_10 | _s1_bypassData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_19 = _s1_bypassData_T_18 | _s1_bypassData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_20 = _s1_bypassData_T_19 | _s1_bypassData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_21 = _s1_bypassData_T_20 | _s1_bypassData_T_14; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_22 = _s1_bypassData_T_21 | _s1_bypassData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_23 = _s1_bypassData_T_22 | _s1_bypassData_T_16; // @[Mux.scala 27:73]
  reg [31:0] s2_addr; // @[Reg.scala 19:16]
  wire  _GEN_112 = s2_full & s2_fire ? 1'h0 : s2_full; // @[ICache.scala 153:26 162:{35,45}]
  wire  _GEN_113 = s1_fire | _GEN_112; // @[ICache.scala 161:{20,30}]
  wire  _refillBuffer_io_write_valid_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _io_read_resp_valid_T_3 = refillPipe_io_resp_ready & refillPipe_io_resp_valid; // @[Decoupled.scala 51:35]
  wire  _io_read_resp_valid_T_4 = _s2_valid_T & s2_full & _io_read_resp_valid_T_3; // @[ICache.scala 173:56]
  wire  _io_read_resp_valid_T_5 = s1_info_dirInfo_hit & s1_full | _io_read_resp_valid_T_4; // @[ICache.scala 172:58]
  wire  _io_read_resp_valid_T_8 = s1_bypass & _s1_valid_T_2 & s1_full; // @[ICache.scala 174:63]
  wire [31:0] _io_read_resp_bits_data_T_8 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_9 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_10 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_11 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_12 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_13 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_14 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_15 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_16 = _io_read_resp_bits_data_T_8 | _io_read_resp_bits_data_T_9; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_17 = _io_read_resp_bits_data_T_16 | _io_read_resp_bits_data_T_10; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_18 = _io_read_resp_bits_data_T_17 | _io_read_resp_bits_data_T_11; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_19 = _io_read_resp_bits_data_T_18 | _io_read_resp_bits_data_T_12; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_20 = _io_read_resp_bits_data_T_19 | _io_read_resp_bits_data_T_13; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_21 = _io_read_resp_bits_data_T_20 | _io_read_resp_bits_data_T_14; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_22 = _io_read_resp_bits_data_T_21 | _io_read_resp_bits_data_T_15; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_23 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_24 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_25 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_26 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_27 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_28 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_29 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_30 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_31 = _io_read_resp_bits_data_T_23 | _io_read_resp_bits_data_T_24; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_32 = _io_read_resp_bits_data_T_31 | _io_read_resp_bits_data_T_25; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_33 = _io_read_resp_bits_data_T_32 | _io_read_resp_bits_data_T_26; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_34 = _io_read_resp_bits_data_T_33 | _io_read_resp_bits_data_T_27; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_35 = _io_read_resp_bits_data_T_34 | _io_read_resp_bits_data_T_28; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_36 = _io_read_resp_bits_data_T_35 | _io_read_resp_bits_data_T_29; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_37 = _io_read_resp_bits_data_T_36 | _io_read_resp_bits_data_T_30; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_38 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_39 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_40 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_41 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_42 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_43 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_44 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_45 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_46 = _io_read_resp_bits_data_T_38 | _io_read_resp_bits_data_T_39; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_47 = _io_read_resp_bits_data_T_46 | _io_read_resp_bits_data_T_40; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_48 = _io_read_resp_bits_data_T_47 | _io_read_resp_bits_data_T_41; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_49 = _io_read_resp_bits_data_T_48 | _io_read_resp_bits_data_T_42; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_50 = _io_read_resp_bits_data_T_49 | _io_read_resp_bits_data_T_43; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_51 = _io_read_resp_bits_data_T_50 | _io_read_resp_bits_data_T_44; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_52 = _io_read_resp_bits_data_T_51 | _io_read_resp_bits_data_T_45; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_53 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_54 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_55 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_56 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_57 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_58 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_59 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_60 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_61 = _io_read_resp_bits_data_T_53 | _io_read_resp_bits_data_T_54; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_62 = _io_read_resp_bits_data_T_61 | _io_read_resp_bits_data_T_55; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_63 = _io_read_resp_bits_data_T_62 | _io_read_resp_bits_data_T_56; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_64 = _io_read_resp_bits_data_T_63 | _io_read_resp_bits_data_T_57; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_65 = _io_read_resp_bits_data_T_64 | _io_read_resp_bits_data_T_58; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_66 = _io_read_resp_bits_data_T_65 | _io_read_resp_bits_data_T_59; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_67 = _io_read_resp_bits_data_T_66 | _io_read_resp_bits_data_T_60; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_68 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_69 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_70 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_71 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_72 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_73 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_74 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_75 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_76 = _io_read_resp_bits_data_T_68 | _io_read_resp_bits_data_T_69; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_77 = _io_read_resp_bits_data_T_76 | _io_read_resp_bits_data_T_70; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_78 = _io_read_resp_bits_data_T_77 | _io_read_resp_bits_data_T_71; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_79 = _io_read_resp_bits_data_T_78 | _io_read_resp_bits_data_T_72; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_80 = _io_read_resp_bits_data_T_79 | _io_read_resp_bits_data_T_73; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_81 = _io_read_resp_bits_data_T_80 | _io_read_resp_bits_data_T_74; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_82 = _io_read_resp_bits_data_T_81 | _io_read_resp_bits_data_T_75; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_83 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_84 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_85 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_86 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_87 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_88 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_89 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_90 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_91 = _io_read_resp_bits_data_T_83 | _io_read_resp_bits_data_T_84; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_92 = _io_read_resp_bits_data_T_91 | _io_read_resp_bits_data_T_85; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_93 = _io_read_resp_bits_data_T_92 | _io_read_resp_bits_data_T_86; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_94 = _io_read_resp_bits_data_T_93 | _io_read_resp_bits_data_T_87; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_95 = _io_read_resp_bits_data_T_94 | _io_read_resp_bits_data_T_88; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_96 = _io_read_resp_bits_data_T_95 | _io_read_resp_bits_data_T_89; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_97 = _io_read_resp_bits_data_T_96 | _io_read_resp_bits_data_T_90; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_98 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_99 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_100 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_101 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_102 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_103 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_104 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_105 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_106 = _io_read_resp_bits_data_T_98 | _io_read_resp_bits_data_T_99; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_107 = _io_read_resp_bits_data_T_106 | _io_read_resp_bits_data_T_100; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_108 = _io_read_resp_bits_data_T_107 | _io_read_resp_bits_data_T_101; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_109 = _io_read_resp_bits_data_T_108 | _io_read_resp_bits_data_T_102; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_110 = _io_read_resp_bits_data_T_109 | _io_read_resp_bits_data_T_103; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_111 = _io_read_resp_bits_data_T_110 | _io_read_resp_bits_data_T_104; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_112 = _io_read_resp_bits_data_T_111 | _io_read_resp_bits_data_T_105; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_113 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_114 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_115 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_116 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_117 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_118 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_119 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_120 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_121 = _io_read_resp_bits_data_T_113 | _io_read_resp_bits_data_T_114; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_122 = _io_read_resp_bits_data_T_121 | _io_read_resp_bits_data_T_115; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_123 = _io_read_resp_bits_data_T_122 | _io_read_resp_bits_data_T_116; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_124 = _io_read_resp_bits_data_T_123 | _io_read_resp_bits_data_T_117; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_125 = _io_read_resp_bits_data_T_124 | _io_read_resp_bits_data_T_118; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_126 = _io_read_resp_bits_data_T_125 | _io_read_resp_bits_data_T_119; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_127 = _io_read_resp_bits_data_T_126 | _io_read_resp_bits_data_T_120; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_136 = s1_blockSel[0] ? _io_read_resp_bits_data_T_22 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_137 = s1_blockSel[1] ? _io_read_resp_bits_data_T_37 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_138 = s1_blockSel[2] ? _io_read_resp_bits_data_T_52 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_139 = s1_blockSel[3] ? _io_read_resp_bits_data_T_67 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_140 = s1_blockSel[4] ? _io_read_resp_bits_data_T_82 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_141 = s1_blockSel[5] ? _io_read_resp_bits_data_T_97 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_142 = s1_blockSel[6] ? _io_read_resp_bits_data_T_112 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_143 = s1_blockSel[7] ? _io_read_resp_bits_data_T_127 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_144 = _io_read_resp_bits_data_T_136 | _io_read_resp_bits_data_T_137; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_145 = _io_read_resp_bits_data_T_144 | _io_read_resp_bits_data_T_138; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_146 = _io_read_resp_bits_data_T_145 | _io_read_resp_bits_data_T_139; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_147 = _io_read_resp_bits_data_T_146 | _io_read_resp_bits_data_T_140; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_148 = _io_read_resp_bits_data_T_147 | _io_read_resp_bits_data_T_141; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_149 = _io_read_resp_bits_data_T_148 | _io_read_resp_bits_data_T_142; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_150 = _io_read_resp_bits_data_T_149 | _io_read_resp_bits_data_T_143; // @[Mux.scala 27:73]
  wire [31:0] s1_bypassData = _s1_bypassData_T_23 | _s1_bypassData_T_17; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_151 = s1_bypass ? s1_bypassData : refillPipe_io_resp_bits_data; // @[ICache.scala 177:40]
  DataBankArray_1 db ( // @[ICache.scala 56:20]
    .clock(db_clock),
    .reset(db_reset),
    .io_read_req_ready(db_io_read_req_ready),
    .io_read_req_valid(db_io_read_req_valid),
    .io_read_req_bits_set(db_io_read_req_bits_set),
    .io_read_resp_0_0(db_io_read_resp_0_0),
    .io_read_resp_0_1(db_io_read_resp_0_1),
    .io_read_resp_0_2(db_io_read_resp_0_2),
    .io_read_resp_0_3(db_io_read_resp_0_3),
    .io_read_resp_0_4(db_io_read_resp_0_4),
    .io_read_resp_0_5(db_io_read_resp_0_5),
    .io_read_resp_0_6(db_io_read_resp_0_6),
    .io_read_resp_0_7(db_io_read_resp_0_7),
    .io_read_resp_1_0(db_io_read_resp_1_0),
    .io_read_resp_1_1(db_io_read_resp_1_1),
    .io_read_resp_1_2(db_io_read_resp_1_2),
    .io_read_resp_1_3(db_io_read_resp_1_3),
    .io_read_resp_1_4(db_io_read_resp_1_4),
    .io_read_resp_1_5(db_io_read_resp_1_5),
    .io_read_resp_1_6(db_io_read_resp_1_6),
    .io_read_resp_1_7(db_io_read_resp_1_7),
    .io_read_resp_2_0(db_io_read_resp_2_0),
    .io_read_resp_2_1(db_io_read_resp_2_1),
    .io_read_resp_2_2(db_io_read_resp_2_2),
    .io_read_resp_2_3(db_io_read_resp_2_3),
    .io_read_resp_2_4(db_io_read_resp_2_4),
    .io_read_resp_2_5(db_io_read_resp_2_5),
    .io_read_resp_2_6(db_io_read_resp_2_6),
    .io_read_resp_2_7(db_io_read_resp_2_7),
    .io_read_resp_3_0(db_io_read_resp_3_0),
    .io_read_resp_3_1(db_io_read_resp_3_1),
    .io_read_resp_3_2(db_io_read_resp_3_2),
    .io_read_resp_3_3(db_io_read_resp_3_3),
    .io_read_resp_3_4(db_io_read_resp_3_4),
    .io_read_resp_3_5(db_io_read_resp_3_5),
    .io_read_resp_3_6(db_io_read_resp_3_6),
    .io_read_resp_3_7(db_io_read_resp_3_7),
    .io_read_resp_4_0(db_io_read_resp_4_0),
    .io_read_resp_4_1(db_io_read_resp_4_1),
    .io_read_resp_4_2(db_io_read_resp_4_2),
    .io_read_resp_4_3(db_io_read_resp_4_3),
    .io_read_resp_4_4(db_io_read_resp_4_4),
    .io_read_resp_4_5(db_io_read_resp_4_5),
    .io_read_resp_4_6(db_io_read_resp_4_6),
    .io_read_resp_4_7(db_io_read_resp_4_7),
    .io_read_resp_5_0(db_io_read_resp_5_0),
    .io_read_resp_5_1(db_io_read_resp_5_1),
    .io_read_resp_5_2(db_io_read_resp_5_2),
    .io_read_resp_5_3(db_io_read_resp_5_3),
    .io_read_resp_5_4(db_io_read_resp_5_4),
    .io_read_resp_5_5(db_io_read_resp_5_5),
    .io_read_resp_5_6(db_io_read_resp_5_6),
    .io_read_resp_5_7(db_io_read_resp_5_7),
    .io_read_resp_6_0(db_io_read_resp_6_0),
    .io_read_resp_6_1(db_io_read_resp_6_1),
    .io_read_resp_6_2(db_io_read_resp_6_2),
    .io_read_resp_6_3(db_io_read_resp_6_3),
    .io_read_resp_6_4(db_io_read_resp_6_4),
    .io_read_resp_6_5(db_io_read_resp_6_5),
    .io_read_resp_6_6(db_io_read_resp_6_6),
    .io_read_resp_6_7(db_io_read_resp_6_7),
    .io_read_resp_7_0(db_io_read_resp_7_0),
    .io_read_resp_7_1(db_io_read_resp_7_1),
    .io_read_resp_7_2(db_io_read_resp_7_2),
    .io_read_resp_7_3(db_io_read_resp_7_3),
    .io_read_resp_7_4(db_io_read_resp_7_4),
    .io_read_resp_7_5(db_io_read_resp_7_5),
    .io_read_resp_7_6(db_io_read_resp_7_6),
    .io_read_resp_7_7(db_io_read_resp_7_7),
    .io_write_req_ready(db_io_write_req_ready),
    .io_write_req_valid(db_io_write_req_valid),
    .io_write_req_bits_data(db_io_write_req_bits_data),
    .io_write_req_bits_set(db_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(db_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(db_io_write_req_bits_way)
  );
  DCacheDirectory_1 dir ( // @[ICache.scala 57:21]
    .clock(dir_clock),
    .reset(dir_reset),
    .io_read_req_ready(dir_io_read_req_ready),
    .io_read_req_valid(dir_io_read_req_valid),
    .io_read_req_bits_addr(dir_io_read_req_bits_addr),
    .io_read_resp_bits_hit(dir_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(dir_io_read_resp_bits_chosenWay),
    .io_write_req_ready(dir_io_write_req_ready),
    .io_write_req_valid(dir_io_write_req_valid),
    .io_write_req_bits_addr(dir_io_write_req_bits_addr),
    .io_write_req_bits_way(dir_io_write_req_bits_way)
  );
  RefillPipe_1 refillPipe ( // @[ICache.scala 58:28]
    .clock(refillPipe_clock),
    .reset(refillPipe_reset),
    .io_req_ready(refillPipe_io_req_ready),
    .io_req_valid(refillPipe_io_req_valid),
    .io_req_bits_addr(refillPipe_io_req_bits_addr),
    .io_req_bits_chosenWay(refillPipe_io_req_bits_chosenWay),
    .io_resp_ready(refillPipe_io_resp_ready),
    .io_resp_valid(refillPipe_io_resp_valid),
    .io_resp_bits_data(refillPipe_io_resp_bits_data),
    .io_tlbus_req_ready(refillPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(refillPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(refillPipe_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(refillPipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(refillPipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(refillPipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(refillPipe_io_tlbus_resp_bits_data),
    .io_dirWrite_req_valid(refillPipe_io_dirWrite_req_valid),
    .io_dirWrite_req_bits_addr(refillPipe_io_dirWrite_req_bits_addr),
    .io_dirWrite_req_bits_way(refillPipe_io_dirWrite_req_bits_way),
    .io_dataWrite_req_valid(refillPipe_io_dataWrite_req_valid),
    .io_dataWrite_req_bits_data(refillPipe_io_dataWrite_req_bits_data),
    .io_dataWrite_req_bits_set(refillPipe_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_blockSelOH(refillPipe_io_dataWrite_req_bits_blockSelOH),
    .io_dataWrite_req_bits_way(refillPipe_io_dataWrite_req_bits_way)
  );
  RefillBuffer refillBuffer ( // @[ICache.scala 67:30]
    .clock(refillBuffer_clock),
    .reset(refillBuffer_reset),
    .io_write_valid(refillBuffer_io_write_valid),
    .io_write_bits_cacheLineAddr(refillBuffer_io_write_bits_cacheLineAddr),
    .io_write_bits_data(refillBuffer_io_write_bits_data),
    .io_read_cacheLineAddr_0(refillBuffer_io_read_cacheLineAddr_0),
    .io_read_cacheLineAddr_1(refillBuffer_io_read_cacheLineAddr_1),
    .io_read_cacheLineAddr_2(refillBuffer_io_read_cacheLineAddr_2),
    .io_read_cacheLineAddr_3(refillBuffer_io_read_cacheLineAddr_3),
    .io_read_cacheLineData_0_0(refillBuffer_io_read_cacheLineData_0_0),
    .io_read_cacheLineData_0_1(refillBuffer_io_read_cacheLineData_0_1),
    .io_read_cacheLineData_0_2(refillBuffer_io_read_cacheLineData_0_2),
    .io_read_cacheLineData_0_3(refillBuffer_io_read_cacheLineData_0_3),
    .io_read_cacheLineData_0_4(refillBuffer_io_read_cacheLineData_0_4),
    .io_read_cacheLineData_0_5(refillBuffer_io_read_cacheLineData_0_5),
    .io_read_cacheLineData_0_6(refillBuffer_io_read_cacheLineData_0_6),
    .io_read_cacheLineData_0_7(refillBuffer_io_read_cacheLineData_0_7),
    .io_read_cacheLineData_1_0(refillBuffer_io_read_cacheLineData_1_0),
    .io_read_cacheLineData_1_1(refillBuffer_io_read_cacheLineData_1_1),
    .io_read_cacheLineData_1_2(refillBuffer_io_read_cacheLineData_1_2),
    .io_read_cacheLineData_1_3(refillBuffer_io_read_cacheLineData_1_3),
    .io_read_cacheLineData_1_4(refillBuffer_io_read_cacheLineData_1_4),
    .io_read_cacheLineData_1_5(refillBuffer_io_read_cacheLineData_1_5),
    .io_read_cacheLineData_1_6(refillBuffer_io_read_cacheLineData_1_6),
    .io_read_cacheLineData_1_7(refillBuffer_io_read_cacheLineData_1_7),
    .io_read_cacheLineData_2_0(refillBuffer_io_read_cacheLineData_2_0),
    .io_read_cacheLineData_2_1(refillBuffer_io_read_cacheLineData_2_1),
    .io_read_cacheLineData_2_2(refillBuffer_io_read_cacheLineData_2_2),
    .io_read_cacheLineData_2_3(refillBuffer_io_read_cacheLineData_2_3),
    .io_read_cacheLineData_2_4(refillBuffer_io_read_cacheLineData_2_4),
    .io_read_cacheLineData_2_5(refillBuffer_io_read_cacheLineData_2_5),
    .io_read_cacheLineData_2_6(refillBuffer_io_read_cacheLineData_2_6),
    .io_read_cacheLineData_2_7(refillBuffer_io_read_cacheLineData_2_7),
    .io_read_cacheLineData_3_0(refillBuffer_io_read_cacheLineData_3_0),
    .io_read_cacheLineData_3_1(refillBuffer_io_read_cacheLineData_3_1),
    .io_read_cacheLineData_3_2(refillBuffer_io_read_cacheLineData_3_2),
    .io_read_cacheLineData_3_3(refillBuffer_io_read_cacheLineData_3_3),
    .io_read_cacheLineData_3_4(refillBuffer_io_read_cacheLineData_3_4),
    .io_read_cacheLineData_3_5(refillBuffer_io_read_cacheLineData_3_5),
    .io_read_cacheLineData_3_6(refillBuffer_io_read_cacheLineData_3_6),
    .io_read_cacheLineData_3_7(refillBuffer_io_read_cacheLineData_3_7),
    .io_read_valids_0(refillBuffer_io_read_valids_0),
    .io_read_valids_1(refillBuffer_io_read_valids_1),
    .io_read_valids_2(refillBuffer_io_read_valids_2),
    .io_read_valids_3(refillBuffer_io_read_valids_3)
  );
  assign io_read_req_ready = ~s0_full | s0_fire; // @[ICache.scala 84:35]
  assign io_read_resp_valid = _io_read_resp_valid_T_5 | _io_read_resp_valid_T_8; // @[ICache.scala 173:83]
  assign io_read_resp_bits_data = s1_info_dirInfo_hit ? _io_read_resp_bits_data_T_150 : _io_read_resp_bits_data_T_151; // @[ICache.scala 175:34]
  assign io_tlbus_req_valid = refillPipe_io_tlbus_req_valid; // @[ICache.scala 63:25]
  assign io_tlbus_req_bits_address = refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 63:25]
  assign io_tlbus_resp_ready = 1'h1; // @[ICache.scala 185:25]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 89:38]
  assign db_io_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign db_io_write_req_valid = refillPipe_io_dataWrite_req_valid; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data = refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_blockSelOH = refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 61:33]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 92:39]
  assign dir_io_read_req_bits_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 81:21]
  assign dir_io_write_req_valid = refillPipe_io_dirWrite_req_valid; // @[ICache.scala 62:32]
  assign dir_io_write_req_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 62:32]
  assign dir_io_write_req_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 62:32]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = _s1_valid_T_2 & s1_full & _s1_valid_T_5; // @[ICache.scala 141:64]
  assign refillPipe_io_req_bits_addr = s1_info_req_addr; // @[ICache.scala 142:33]
  assign refillPipe_io_req_bits_chosenWay = s1_info_dirInfo_chosenWay; // @[ICache.scala 143:38]
  assign refillPipe_io_resp_ready = 1'h1; // @[ICache.scala 183:30]
  assign refillPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 63:25]
  assign refillBuffer_clock = clock;
  assign refillBuffer_reset = reset;
  assign refillBuffer_io_write_valid = _refillBuffer_io_write_valid_T & io_tlbus_resp_bits_opcode == 3'h1; // @[ICache.scala 165:55]
  assign refillBuffer_io_write_bits_cacheLineAddr = s2_addr; // @[ICache.scala 167:46]
  assign refillBuffer_io_write_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 166:37]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 77:26]
      s0_full <= 1'h0; // @[ICache.scala 77:26]
    end else begin
      s0_full <= _GEN_2;
    end
    if (reset) begin // @[ICache.scala 123:26]
      s1_full <= 1'h0; // @[ICache.scala 123:26]
    end else begin
      s1_full <= _GEN_73;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_dirInfo_hit <= s0_info_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (s0_latch) begin // @[Reg.scala 20:18]
        s1_info_req_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
      end else begin
        s1_info_req_addr <= s0_req_r_addr; // @[Reg.scala 19:16]
      end
    end
    if (reset) begin // @[ICache.scala 153:26]
      s2_full <= 1'h0; // @[ICache.scala 153:26]
    end else begin
      s2_full <= _GEN_113;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dirInfo_hit <= s1_info_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_bypass <= s1_bypass; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_req_r_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_dirInfo_chosenWay <= s0_info_dirInfo_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_0 <= s0_info_rdData_0_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_1 <= s0_info_rdData_0_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_2 <= s0_info_rdData_0_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_3 <= s0_info_rdData_0_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_4 <= s0_info_rdData_0_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_5 <= s0_info_rdData_0_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_6 <= s0_info_rdData_0_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_0_7 <= s0_info_rdData_0_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_0 <= s0_info_rdData_1_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_1 <= s0_info_rdData_1_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_2 <= s0_info_rdData_1_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_3 <= s0_info_rdData_1_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_4 <= s0_info_rdData_1_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_5 <= s0_info_rdData_1_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_6 <= s0_info_rdData_1_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_1_7 <= s0_info_rdData_1_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_0 <= s0_info_rdData_2_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_1 <= s0_info_rdData_2_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_2 <= s0_info_rdData_2_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_3 <= s0_info_rdData_2_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_4 <= s0_info_rdData_2_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_5 <= s0_info_rdData_2_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_6 <= s0_info_rdData_2_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_2_7 <= s0_info_rdData_2_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_0 <= s0_info_rdData_3_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_1 <= s0_info_rdData_3_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_2 <= s0_info_rdData_3_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_3 <= s0_info_rdData_3_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_4 <= s0_info_rdData_3_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_5 <= s0_info_rdData_3_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_6 <= s0_info_rdData_3_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_3_7 <= s0_info_rdData_3_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_0 <= s0_info_rdData_4_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_1 <= s0_info_rdData_4_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_2 <= s0_info_rdData_4_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_3 <= s0_info_rdData_4_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_4 <= s0_info_rdData_4_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_5 <= s0_info_rdData_4_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_6 <= s0_info_rdData_4_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_4_7 <= s0_info_rdData_4_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_0 <= s0_info_rdData_5_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_1 <= s0_info_rdData_5_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_2 <= s0_info_rdData_5_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_3 <= s0_info_rdData_5_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_4 <= s0_info_rdData_5_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_5 <= s0_info_rdData_5_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_6 <= s0_info_rdData_5_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_5_7 <= s0_info_rdData_5_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_0 <= s0_info_rdData_6_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_1 <= s0_info_rdData_6_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_2 <= s0_info_rdData_6_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_3 <= s0_info_rdData_6_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_4 <= s0_info_rdData_6_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_5 <= s0_info_rdData_6_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_6 <= s0_info_rdData_6_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_6_7 <= s0_info_rdData_6_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_0 <= s0_info_rdData_7_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_1 <= s0_info_rdData_7_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_2 <= s0_info_rdData_7_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_3 <= s0_info_rdData_7_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_4 <= s0_info_rdData_7_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_5 <= s0_info_rdData_7_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_6 <= s0_info_rdData_7_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_info_rdData_7_7 <= s0_info_rdData_7_7; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_addr <= s1_info_req_addr; // @[Reg.scala 20:22]
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
  s0_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_full = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_info_dirInfo_hit = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_info_req_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s2_full = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s2_dirInfo_hit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_bypass = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s0_req_r_addr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s1_info_dirInfo_chosenWay = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  s1_info_rdData_0_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s1_info_rdData_0_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_info_rdData_0_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_info_rdData_0_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_info_rdData_0_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_info_rdData_0_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_info_rdData_0_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_info_rdData_0_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_info_rdData_1_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s1_info_rdData_1_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s1_info_rdData_1_2 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s1_info_rdData_1_3 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s1_info_rdData_1_4 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  s1_info_rdData_1_5 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s1_info_rdData_1_6 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_info_rdData_1_7 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_info_rdData_2_0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_info_rdData_2_1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s1_info_rdData_2_2 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  s1_info_rdData_2_3 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s1_info_rdData_2_4 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_info_rdData_2_5 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_info_rdData_2_6 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s1_info_rdData_2_7 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s1_info_rdData_3_0 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s1_info_rdData_3_1 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s1_info_rdData_3_2 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  s1_info_rdData_3_3 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s1_info_rdData_3_4 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s1_info_rdData_3_5 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s1_info_rdData_3_6 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s1_info_rdData_3_7 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  s1_info_rdData_4_0 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  s1_info_rdData_4_1 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  s1_info_rdData_4_2 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  s1_info_rdData_4_3 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  s1_info_rdData_4_4 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  s1_info_rdData_4_5 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  s1_info_rdData_4_6 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  s1_info_rdData_4_7 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  s1_info_rdData_5_0 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  s1_info_rdData_5_1 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  s1_info_rdData_5_2 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  s1_info_rdData_5_3 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  s1_info_rdData_5_4 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  s1_info_rdData_5_5 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  s1_info_rdData_5_6 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  s1_info_rdData_5_7 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  s1_info_rdData_6_0 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  s1_info_rdData_6_1 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  s1_info_rdData_6_2 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  s1_info_rdData_6_3 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  s1_info_rdData_6_4 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  s1_info_rdData_6_5 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  s1_info_rdData_6_6 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  s1_info_rdData_6_7 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  s1_info_rdData_7_0 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  s1_info_rdData_7_1 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  s1_info_rdData_7_2 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  s1_info_rdData_7_3 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  s1_info_rdData_7_4 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  s1_info_rdData_7_5 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  s1_info_rdData_7_6 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  s1_info_rdData_7_7 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  s2_addr = _RAND_73[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
