module ICache(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [31:0]  io_read_req_bits_addr,
  input          io_read_resp_ready,
  output         io_read_resp_valid,
  output [31:0]  io_read_resp_bits_data,
  output [31:0]  io_read_resp_bits_inst_0,
  output [31:0]  io_read_resp_bits_inst_1,
  output [31:0]  io_read_resp_bits_inst_2,
  output [31:0]  io_read_resp_bits_inst_3,
  output [2:0]   io_read_resp_bits_size,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [31:0]  io_tlbus_req_bits_address,
  output         io_tlbus_resp_ready,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [127:0] io_tlbus_resp_bits_data
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
  reg [63:0] _RAND_74;
  reg [63:0] _RAND_75;
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
  wire [6:0] db_io_write_req_bits_set; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_0; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_1; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_2; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_3; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_4; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_5; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_6; // @[ICache.scala 56:20]
  wire [31:0] db_io_write_req_bits_data_7; // @[ICache.scala 56:20]
  wire [7:0] db_io_write_req_bits_blockMask; // @[ICache.scala 56:20]
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
  wire [31:0] refillPipe_io_resp_bits_blockData_0; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_1; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_2; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_3; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_4; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_5; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_6; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_7; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_req_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_req_valid; // @[ICache.scala 58:28]
  wire [127:0] refillPipe_io_tlbus_req_bits_size; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[ICache.scala 58:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[ICache.scala 58:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 58:28]
  wire [127:0] refillPipe_io_tlbus_resp_bits_data; // @[ICache.scala 58:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 58:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[ICache.scala 58:28]
  wire [6:0] refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_0; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_1; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_2; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_3; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_4; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_5; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_6; // @[ICache.scala 58:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_7; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_blockMask; // @[ICache.scala 58:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 58:28]
  wire  refillBuffer_clock; // @[ICache.scala 65:30]
  wire  refillBuffer_reset; // @[ICache.scala 65:30]
  wire  refillBuffer_io_write_valid; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_write_bits_cacheLineAddr; // @[ICache.scala 65:30]
  wire [127:0] refillBuffer_io_write_bits_data; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_0; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_1; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_0; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_1; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_2; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_3; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_4; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_5; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_6; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_7; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_0; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_1; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_2; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_3; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_4; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_5; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_6; // @[ICache.scala 65:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_7; // @[ICache.scala 65:30]
  wire  refillBuffer_io_read_valids_0; // @[ICache.scala 65:30]
  wire  refillBuffer_io_read_valids_1; // @[ICache.scala 65:30]
  reg  s0_full; // @[ICache.scala 75:26]
  wire  s0_latch = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  s1_full; // @[ICache.scala 112:26]
  reg  s1_info_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T_2 = ~s1_info_dirInfo_hit; // @[ICache.scala 137:25]
  wire  _s1_valid_T_3 = refillPipe_io_req_ready & refillPipe_io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_info_req_addr; // @[Reg.scala 19:16]
  wire [31:0] _bypassVec_T_2 = {s1_info_req_addr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire  bypassVec_0 = refillBuffer_io_read_cacheLineAddr_0 == _bypassVec_T_2 & refillBuffer_io_read_valids_0; // @[ICache.scala 124:154]
  wire  bypassVec_1 = refillBuffer_io_read_cacheLineAddr_1 == _bypassVec_T_2 & refillBuffer_io_read_valids_1; // @[ICache.scala 124:154]
  wire [1:0] _s1_bypass_T = {bypassVec_0,bypassVec_1}; // @[Cat.scala 33:92]
  wire  s1_bypass = |_s1_bypass_T & s1_full & _s1_valid_T_2; // @[ICache.scala 125:51]
  wire  _s1_valid_T_5 = ~s1_bypass; // @[ICache.scala 137:75]
  wire  _s1_valid_T_6 = ~s1_info_dirInfo_hit & _s1_valid_T_3 & ~s1_bypass; // @[ICache.scala 137:72]
  wire  _s1_valid_T_7 = s1_info_dirInfo_hit & io_read_resp_valid | _s1_valid_T_6; // @[ICache.scala 136:71]
  wire  _s1_valid_T_11 = _s1_valid_T_2 & s1_bypass & io_read_resp_valid; // @[ICache.scala 138:59]
  wire  _s1_valid_T_12 = _s1_valid_T_7 | _s1_valid_T_11; // @[ICache.scala 137:86]
  wire  s1_valid = s1_full & _s1_valid_T_12; // @[ICache.scala 136:25]
  reg  s2_full; // @[ICache.scala 144:26]
  reg  s2_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s2_valid_T = ~s2_dirInfo_hit; // @[ICache.scala 163:47]
  reg  s2_bypass; // @[Reg.scala 19:16]
  wire  s2_fire = s2_full & (s2_dirInfo_hit | ~s2_dirInfo_hit & io_read_resp_valid | s2_bypass); // @[ICache.scala 163:25]
  wire  s2_ready = ~s2_full | s2_fire; // @[ICache.scala 150:26]
  wire  s1_fire = s1_valid & s2_ready; // @[ICache.scala 114:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[ICache.scala 119:26]
  wire  s0_fire = s0_full & s1_ready; // @[ICache.scala 77:28]
  reg [31:0] s0_req_r_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[ICache.scala 75:26 83:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[ICache.scala 82:{20,30}]
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
  wire [31:0] s0_info_rdData_0_0 = db_io_read_resp_0_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_1 = db_io_read_resp_0_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_2 = db_io_read_resp_0_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_3 = db_io_read_resp_0_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_4 = db_io_read_resp_0_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_5 = db_io_read_resp_0_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_6 = db_io_read_resp_0_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_0_7 = db_io_read_resp_0_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_0 = db_io_read_resp_1_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_1 = db_io_read_resp_1_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_2 = db_io_read_resp_1_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_3 = db_io_read_resp_1_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_4 = db_io_read_resp_1_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_5 = db_io_read_resp_1_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_6 = db_io_read_resp_1_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_1_7 = db_io_read_resp_1_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_0 = db_io_read_resp_2_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_1 = db_io_read_resp_2_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_2 = db_io_read_resp_2_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_3 = db_io_read_resp_2_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_4 = db_io_read_resp_2_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_5 = db_io_read_resp_2_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_6 = db_io_read_resp_2_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_2_7 = db_io_read_resp_2_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_0 = db_io_read_resp_3_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_1 = db_io_read_resp_3_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_2 = db_io_read_resp_3_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_3 = db_io_read_resp_3_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_4 = db_io_read_resp_3_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_5 = db_io_read_resp_3_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_6 = db_io_read_resp_3_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_3_7 = db_io_read_resp_3_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_0 = db_io_read_resp_4_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_1 = db_io_read_resp_4_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_2 = db_io_read_resp_4_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_3 = db_io_read_resp_4_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_4 = db_io_read_resp_4_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_5 = db_io_read_resp_4_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_6 = db_io_read_resp_4_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_4_7 = db_io_read_resp_4_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_0 = db_io_read_resp_5_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_1 = db_io_read_resp_5_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_2 = db_io_read_resp_5_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_3 = db_io_read_resp_5_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_4 = db_io_read_resp_5_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_5 = db_io_read_resp_5_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_6 = db_io_read_resp_5_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_5_7 = db_io_read_resp_5_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_0 = db_io_read_resp_6_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_1 = db_io_read_resp_6_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_2 = db_io_read_resp_6_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_3 = db_io_read_resp_6_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_4 = db_io_read_resp_6_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_5 = db_io_read_resp_6_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_6 = db_io_read_resp_6_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_6_7 = db_io_read_resp_6_7; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_0 = db_io_read_resp_7_0; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_1 = db_io_read_resp_7_1; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_2 = db_io_read_resp_7_2; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_3 = db_io_read_resp_7_3; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_4 = db_io_read_resp_7_4; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_5 = db_io_read_resp_7_5; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_6 = db_io_read_resp_7_6; // @[ICache.scala 103:23 106:20]
  wire [31:0] s0_info_rdData_7_7 = db_io_read_resp_7_7; // @[ICache.scala 103:23 106:20]
  wire  s0_info_dirInfo_hit = dir_io_read_resp_bits_hit; // @[ICache.scala 103:23 104:21]
  wire [7:0] s0_info_dirInfo_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 103:23 104:21]
  wire [7:0] s1_blockSel = 8'h1 << s1_info_req_addr[4:2]; // @[OneHot.scala 57:35]
  wire [31:0] _s1_rdBlockData_T_8 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_9 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_10 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_11 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_12 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_13 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_14 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_15 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_16 = _s1_rdBlockData_T_8 | _s1_rdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_17 = _s1_rdBlockData_T_16 | _s1_rdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_18 = _s1_rdBlockData_T_17 | _s1_rdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_19 = _s1_rdBlockData_T_18 | _s1_rdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_20 = _s1_rdBlockData_T_19 | _s1_rdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_21 = _s1_rdBlockData_T_20 | _s1_rdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_23 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_24 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_25 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_26 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_27 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_28 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_29 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_30 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_31 = _s1_rdBlockData_T_23 | _s1_rdBlockData_T_24; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_32 = _s1_rdBlockData_T_31 | _s1_rdBlockData_T_25; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_33 = _s1_rdBlockData_T_32 | _s1_rdBlockData_T_26; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_34 = _s1_rdBlockData_T_33 | _s1_rdBlockData_T_27; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_35 = _s1_rdBlockData_T_34 | _s1_rdBlockData_T_28; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_36 = _s1_rdBlockData_T_35 | _s1_rdBlockData_T_29; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_38 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_39 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_40 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_41 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_42 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_43 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_44 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_45 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_46 = _s1_rdBlockData_T_38 | _s1_rdBlockData_T_39; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_47 = _s1_rdBlockData_T_46 | _s1_rdBlockData_T_40; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_48 = _s1_rdBlockData_T_47 | _s1_rdBlockData_T_41; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_49 = _s1_rdBlockData_T_48 | _s1_rdBlockData_T_42; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_50 = _s1_rdBlockData_T_49 | _s1_rdBlockData_T_43; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_51 = _s1_rdBlockData_T_50 | _s1_rdBlockData_T_44; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_53 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_54 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_55 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_56 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_57 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_58 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_59 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_60 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_61 = _s1_rdBlockData_T_53 | _s1_rdBlockData_T_54; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_62 = _s1_rdBlockData_T_61 | _s1_rdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_63 = _s1_rdBlockData_T_62 | _s1_rdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_64 = _s1_rdBlockData_T_63 | _s1_rdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_65 = _s1_rdBlockData_T_64 | _s1_rdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_66 = _s1_rdBlockData_T_65 | _s1_rdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_68 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_69 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_70 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_71 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_72 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_73 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_74 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_75 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_76 = _s1_rdBlockData_T_68 | _s1_rdBlockData_T_69; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_77 = _s1_rdBlockData_T_76 | _s1_rdBlockData_T_70; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_78 = _s1_rdBlockData_T_77 | _s1_rdBlockData_T_71; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_79 = _s1_rdBlockData_T_78 | _s1_rdBlockData_T_72; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_80 = _s1_rdBlockData_T_79 | _s1_rdBlockData_T_73; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_81 = _s1_rdBlockData_T_80 | _s1_rdBlockData_T_74; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_4 = _s1_rdBlockData_T_81 | _s1_rdBlockData_T_75; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_83 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_84 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_85 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_86 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_87 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_88 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_89 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_90 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_91 = _s1_rdBlockData_T_83 | _s1_rdBlockData_T_84; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_92 = _s1_rdBlockData_T_91 | _s1_rdBlockData_T_85; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_93 = _s1_rdBlockData_T_92 | _s1_rdBlockData_T_86; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_94 = _s1_rdBlockData_T_93 | _s1_rdBlockData_T_87; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_95 = _s1_rdBlockData_T_94 | _s1_rdBlockData_T_88; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_96 = _s1_rdBlockData_T_95 | _s1_rdBlockData_T_89; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_5 = _s1_rdBlockData_T_96 | _s1_rdBlockData_T_90; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_98 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_99 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_100 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_101 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_102 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_103 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_104 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_105 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_106 = _s1_rdBlockData_T_98 | _s1_rdBlockData_T_99; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_107 = _s1_rdBlockData_T_106 | _s1_rdBlockData_T_100; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_108 = _s1_rdBlockData_T_107 | _s1_rdBlockData_T_101; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_109 = _s1_rdBlockData_T_108 | _s1_rdBlockData_T_102; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_110 = _s1_rdBlockData_T_109 | _s1_rdBlockData_T_103; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_111 = _s1_rdBlockData_T_110 | _s1_rdBlockData_T_104; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_6 = _s1_rdBlockData_T_111 | _s1_rdBlockData_T_105; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_113 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_114 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_115 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_116 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_117 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_118 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_119 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_120 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_121 = _s1_rdBlockData_T_113 | _s1_rdBlockData_T_114; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_122 = _s1_rdBlockData_T_121 | _s1_rdBlockData_T_115; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_123 = _s1_rdBlockData_T_122 | _s1_rdBlockData_T_116; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_124 = _s1_rdBlockData_T_123 | _s1_rdBlockData_T_117; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_125 = _s1_rdBlockData_T_124 | _s1_rdBlockData_T_118; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_126 = _s1_rdBlockData_T_125 | _s1_rdBlockData_T_119; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_7 = _s1_rdBlockData_T_126 | _s1_rdBlockData_T_120; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_8 = s1_blockSel[0] ? s1_rdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_9 = s1_blockSel[1] ? s1_rdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_10 = s1_blockSel[2] ? s1_rdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_11 = s1_blockSel[3] ? s1_rdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_12 = s1_blockSel[4] ? s1_rdBlockData_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_13 = s1_blockSel[5] ? s1_rdBlockData_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_14 = s1_blockSel[6] ? s1_rdBlockData_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_15 = s1_blockSel[7] ? s1_rdBlockData_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_16 = _s1_rdHitData_T_8 | _s1_rdHitData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_17 = _s1_rdHitData_T_16 | _s1_rdHitData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_18 = _s1_rdHitData_T_17 | _s1_rdHitData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_19 = _s1_rdHitData_T_18 | _s1_rdHitData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_20 = _s1_rdHitData_T_19 | _s1_rdHitData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdHitData_T_21 = _s1_rdHitData_T_20 | _s1_rdHitData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_rdHitData = _s1_rdHitData_T_21 | _s1_rdHitData_T_15; // @[Mux.scala 27:73]
  wire  _GEN_79 = s1_full & s1_fire ? 1'h0 : s1_full; // @[ICache.scala 112:26 122:{35,45}]
  wire  _GEN_80 = s0_fire | _GEN_79; // @[ICache.scala 121:{20,30}]
  wire [1:0] _s1_bypassIdx_T = {bypassVec_1,bypassVec_0}; // @[Cat.scala 33:92]
  wire  s1_bypassIdx = _s1_bypassIdx_T[1]; // @[CircuitMath.scala 28:8]
  wire [31:0] _GEN_81 = refillBuffer_io_read_cacheLineData_0_0; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_82 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_0 : _GEN_81; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_8 = s1_blockSel[0] ? _GEN_82 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_83 = refillBuffer_io_read_cacheLineData_0_1; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_84 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_1 : _GEN_83; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_9 = s1_blockSel[1] ? _GEN_84 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_85 = refillBuffer_io_read_cacheLineData_0_2; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_86 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_2 : _GEN_85; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_10 = s1_blockSel[2] ? _GEN_86 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_87 = refillBuffer_io_read_cacheLineData_0_3; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_88 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_3 : _GEN_87; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_11 = s1_blockSel[3] ? _GEN_88 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_89 = refillBuffer_io_read_cacheLineData_0_4; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_90 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_4 : _GEN_89; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_12 = s1_blockSel[4] ? _GEN_90 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_91 = refillBuffer_io_read_cacheLineData_0_5; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_92 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_5 : _GEN_91; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_13 = s1_blockSel[5] ? _GEN_92 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_93 = refillBuffer_io_read_cacheLineData_0_6; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_94 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_6 : _GEN_93; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_14 = s1_blockSel[6] ? _GEN_94 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_95 = refillBuffer_io_read_cacheLineData_0_7; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_96 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_7 : _GEN_95; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_15 = s1_blockSel[7] ? _GEN_96 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_16 = _s1_bypassData_T_8 | _s1_bypassData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_17 = _s1_bypassData_T_16 | _s1_bypassData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_18 = _s1_bypassData_T_17 | _s1_bypassData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_19 = _s1_bypassData_T_18 | _s1_bypassData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_20 = _s1_bypassData_T_19 | _s1_bypassData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_21 = _s1_bypassData_T_20 | _s1_bypassData_T_14; // @[Mux.scala 27:73]
  reg [31:0] s2_addr; // @[Reg.scala 19:16]
  wire  _GEN_110 = s2_full & s2_fire ? 1'h0 : s2_full; // @[ICache.scala 144:26 153:{35,45}]
  wire  _GEN_111 = s1_fire | _GEN_110; // @[ICache.scala 152:{20,30}]
  wire  _refillBuffer_io_write_valid_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  respHit = s1_info_dirInfo_hit & s1_full; // @[ICache.scala 166:39]
  wire  _respMiss_T_2 = refillPipe_io_resp_ready & refillPipe_io_resp_valid; // @[Decoupled.scala 51:35]
  wire  respMiss = _s2_valid_T & s2_full & _respMiss_T_2; // @[ICache.scala 167:47]
  wire  respBypass = s1_bypass & _s1_valid_T_2 & s1_full; // @[ICache.scala 168:56]
  wire [31:0] s1_bypassData = _s1_bypassData_T_21 | _s1_bypassData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T = s1_bypass ? s1_bypassData : refillPipe_io_resp_bits_data; // @[ICache.scala 172:40]
  wire [2:0] s2_off = s2_addr[4:2]; // @[ICache.scala 179:25]
  wire [3:0] rdThreshole = 4'h8 - 4'h4; // @[ICache.scala 181:41]
  wire [3:0] _GEN_112 = {{1'd0}, s1_info_req_addr[4:2]}; // @[ICache.scala 182:34]
  wire [3:0] _respHitSize_T_2 = 4'h8 - _GEN_112; // @[ICache.scala 182:68]
  wire [3:0] respHitSize = _GEN_112 >= rdThreshole ? _respHitSize_T_2 : 4'h4; // @[ICache.scala 182:26]
  wire [3:0] _GEN_114 = {{1'd0}, s2_off}; // @[ICache.scala 183:35]
  wire [3:0] _respMissSize_T_2 = 4'h8 - _GEN_114; // @[ICache.scala 183:69]
  wire [3:0] respMissSize = _GEN_114 >= rdThreshole ? _respMissSize_T_2 : 4'h4; // @[ICache.scala 183:27]
  wire [3:0] _io_read_resp_bits_size_T_1 = s1_info_dirInfo_hit | s1_bypass ? respHitSize : respMissSize; // @[ICache.scala 184:35]
  wire [255:0] _respHitInst_T = {s1_rdBlockData_7,s1_rdBlockData_6,s1_rdBlockData_5,s1_rdBlockData_4,s1_rdBlockData_3,
    s1_rdBlockData_2,s1_rdBlockData_1,s1_rdBlockData_0}; // @[ICache.scala 185:39]
  wire [7:0] _respHitInst_T_1 = {s1_info_req_addr[4:2], 5'h0}; // @[ICache.scala 185:57]
  wire [255:0] _respHitInst_T_2 = _respHitInst_T >> _respHitInst_T_1; // @[ICache.scala 185:46]
  wire [31:0] respHitInst_0 = _respHitInst_T_2[31:0]; // @[ICache.scala 185:108]
  wire [31:0] respHitInst_1 = _respHitInst_T_2[63:32]; // @[ICache.scala 185:108]
  wire [31:0] respHitInst_2 = _respHitInst_T_2[95:64]; // @[ICache.scala 185:108]
  wire [31:0] respHitInst_3 = _respHitInst_T_2[127:96]; // @[ICache.scala 185:108]
  wire [255:0] _respBypassInst_T = {_GEN_96,_GEN_94,_GEN_92,_GEN_90,_GEN_88,_GEN_86,_GEN_84,_GEN_82}; // @[ICache.scala 186:46]
  wire [255:0] _respBypassInst_T_2 = _respBypassInst_T >> _respHitInst_T_1; // @[ICache.scala 186:53]
  wire [31:0] respBypassInst_0 = _respBypassInst_T_2[31:0]; // @[ICache.scala 186:115]
  wire [31:0] respBypassInst_1 = _respBypassInst_T_2[63:32]; // @[ICache.scala 186:115]
  wire [31:0] respBypassInst_2 = _respBypassInst_T_2[95:64]; // @[ICache.scala 186:115]
  wire [31:0] respBypassInst_3 = _respBypassInst_T_2[127:96]; // @[ICache.scala 186:115]
  wire [255:0] _respRefillInst_T = {refillPipe_io_resp_bits_blockData_7,refillPipe_io_resp_bits_blockData_6,
    refillPipe_io_resp_bits_blockData_5,refillPipe_io_resp_bits_blockData_4,refillPipe_io_resp_bits_blockData_3,
    refillPipe_io_resp_bits_blockData_2,refillPipe_io_resp_bits_blockData_1,refillPipe_io_resp_bits_blockData_0}; // @[ICache.scala 187:61]
  wire [7:0] _respRefillInst_T_1 = {s2_off, 5'h0}; // @[ICache.scala 187:79]
  wire [255:0] _respRefillInst_T_2 = _respRefillInst_T >> _respRefillInst_T_1; // @[ICache.scala 187:68]
  wire [31:0] respRefillInst_0 = _respRefillInst_T_2[31:0]; // @[ICache.scala 187:130]
  wire [31:0] respRefillInst_1 = _respRefillInst_T_2[63:32]; // @[ICache.scala 187:130]
  wire [31:0] respRefillInst_2 = _respRefillInst_T_2[95:64]; // @[ICache.scala 187:130]
  wire [31:0] respRefillInst_3 = _respRefillInst_T_2[127:96]; // @[ICache.scala 187:130]
  wire [31:0] _io_read_resp_bits_inst_0_T = s1_bypass ? respBypassInst_0 : respRefillInst_0; // @[ICache.scala 191:48]
  wire [31:0] _io_read_resp_bits_inst_1_T = s1_bypass ? respBypassInst_1 : respRefillInst_1; // @[ICache.scala 191:48]
  wire [31:0] _io_read_resp_bits_inst_2_T = s1_bypass ? respBypassInst_2 : respRefillInst_2; // @[ICache.scala 191:48]
  wire [31:0] _io_read_resp_bits_inst_3_T = s1_bypass ? respBypassInst_3 : respRefillInst_3; // @[ICache.scala 191:48]
  reg [63:0] c; // @[util.scala 162:24]
  wire [63:0] _c_T_1 = c + 64'h1; // @[util.scala 163:16]
  wire [127:0] _T_7 = {io_read_resp_bits_inst_3,io_read_resp_bits_inst_2,io_read_resp_bits_inst_1,
    io_read_resp_bits_inst_0}; // @[ICache.scala 205:152]
  reg [63:0] c_1; // @[util.scala 162:24]
  wire [63:0] _c_T_3 = c_1 + 64'h1; // @[util.scala 163:16]
  DataBankArray db ( // @[ICache.scala 56:20]
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
    .io_write_req_bits_set(db_io_write_req_bits_set),
    .io_write_req_bits_data_0(db_io_write_req_bits_data_0),
    .io_write_req_bits_data_1(db_io_write_req_bits_data_1),
    .io_write_req_bits_data_2(db_io_write_req_bits_data_2),
    .io_write_req_bits_data_3(db_io_write_req_bits_data_3),
    .io_write_req_bits_data_4(db_io_write_req_bits_data_4),
    .io_write_req_bits_data_5(db_io_write_req_bits_data_5),
    .io_write_req_bits_data_6(db_io_write_req_bits_data_6),
    .io_write_req_bits_data_7(db_io_write_req_bits_data_7),
    .io_write_req_bits_blockMask(db_io_write_req_bits_blockMask),
    .io_write_req_bits_way(db_io_write_req_bits_way)
  );
  DCacheDirectory dir ( // @[ICache.scala 57:21]
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
  RefillPipe refillPipe ( // @[ICache.scala 58:28]
    .clock(refillPipe_clock),
    .reset(refillPipe_reset),
    .io_req_ready(refillPipe_io_req_ready),
    .io_req_valid(refillPipe_io_req_valid),
    .io_req_bits_addr(refillPipe_io_req_bits_addr),
    .io_req_bits_chosenWay(refillPipe_io_req_bits_chosenWay),
    .io_resp_ready(refillPipe_io_resp_ready),
    .io_resp_valid(refillPipe_io_resp_valid),
    .io_resp_bits_data(refillPipe_io_resp_bits_data),
    .io_resp_bits_blockData_0(refillPipe_io_resp_bits_blockData_0),
    .io_resp_bits_blockData_1(refillPipe_io_resp_bits_blockData_1),
    .io_resp_bits_blockData_2(refillPipe_io_resp_bits_blockData_2),
    .io_resp_bits_blockData_3(refillPipe_io_resp_bits_blockData_3),
    .io_resp_bits_blockData_4(refillPipe_io_resp_bits_blockData_4),
    .io_resp_bits_blockData_5(refillPipe_io_resp_bits_blockData_5),
    .io_resp_bits_blockData_6(refillPipe_io_resp_bits_blockData_6),
    .io_resp_bits_blockData_7(refillPipe_io_resp_bits_blockData_7),
    .io_tlbus_req_ready(refillPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(refillPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_size(refillPipe_io_tlbus_req_bits_size),
    .io_tlbus_req_bits_address(refillPipe_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(refillPipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(refillPipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(refillPipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(refillPipe_io_tlbus_resp_bits_data),
    .io_dirWrite_req_valid(refillPipe_io_dirWrite_req_valid),
    .io_dirWrite_req_bits_addr(refillPipe_io_dirWrite_req_bits_addr),
    .io_dirWrite_req_bits_way(refillPipe_io_dirWrite_req_bits_way),
    .io_dataWrite_req_valid(refillPipe_io_dataWrite_req_valid),
    .io_dataWrite_req_bits_set(refillPipe_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_data_0(refillPipe_io_dataWrite_req_bits_data_0),
    .io_dataWrite_req_bits_data_1(refillPipe_io_dataWrite_req_bits_data_1),
    .io_dataWrite_req_bits_data_2(refillPipe_io_dataWrite_req_bits_data_2),
    .io_dataWrite_req_bits_data_3(refillPipe_io_dataWrite_req_bits_data_3),
    .io_dataWrite_req_bits_data_4(refillPipe_io_dataWrite_req_bits_data_4),
    .io_dataWrite_req_bits_data_5(refillPipe_io_dataWrite_req_bits_data_5),
    .io_dataWrite_req_bits_data_6(refillPipe_io_dataWrite_req_bits_data_6),
    .io_dataWrite_req_bits_data_7(refillPipe_io_dataWrite_req_bits_data_7),
    .io_dataWrite_req_bits_blockMask(refillPipe_io_dataWrite_req_bits_blockMask),
    .io_dataWrite_req_bits_way(refillPipe_io_dataWrite_req_bits_way)
  );
  RefillBuffer refillBuffer ( // @[ICache.scala 65:30]
    .clock(refillBuffer_clock),
    .reset(refillBuffer_reset),
    .io_write_valid(refillBuffer_io_write_valid),
    .io_write_bits_cacheLineAddr(refillBuffer_io_write_bits_cacheLineAddr),
    .io_write_bits_data(refillBuffer_io_write_bits_data),
    .io_read_cacheLineAddr_0(refillBuffer_io_read_cacheLineAddr_0),
    .io_read_cacheLineAddr_1(refillBuffer_io_read_cacheLineAddr_1),
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
    .io_read_valids_0(refillBuffer_io_read_valids_0),
    .io_read_valids_1(refillBuffer_io_read_valids_1)
  );
  assign io_read_req_ready = ~s0_full | s0_fire; // @[ICache.scala 80:35]
  assign io_read_resp_valid = respHit | respMiss | respBypass; // @[ICache.scala 169:48]
  assign io_read_resp_bits_data = s1_info_dirInfo_hit ? s1_rdHitData : _io_read_resp_bits_data_T; // @[ICache.scala 170:34]
  assign io_read_resp_bits_inst_0 = s1_info_dirInfo_hit ? respHitInst_0 : _io_read_resp_bits_inst_0_T; // @[ICache.scala 189:41]
  assign io_read_resp_bits_inst_1 = s1_info_dirInfo_hit ? respHitInst_1 : _io_read_resp_bits_inst_1_T; // @[ICache.scala 189:41]
  assign io_read_resp_bits_inst_2 = s1_info_dirInfo_hit ? respHitInst_2 : _io_read_resp_bits_inst_2_T; // @[ICache.scala 189:41]
  assign io_read_resp_bits_inst_3 = s1_info_dirInfo_hit ? respHitInst_3 : _io_read_resp_bits_inst_3_T; // @[ICache.scala 189:41]
  assign io_read_resp_bits_size = _io_read_resp_bits_size_T_1[2:0]; // @[ICache.scala 184:28]
  assign io_tlbus_req_valid = refillPipe_io_tlbus_req_valid; // @[ICache.scala 63:25]
  assign io_tlbus_req_bits_address = refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 63:25]
  assign io_tlbus_resp_ready = 1'h1; // @[ICache.scala 201:25]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 85:38]
  assign db_io_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign db_io_write_req_valid = refillPipe_io_dataWrite_req_valid; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_0 = refillPipe_io_dataWrite_req_bits_data_0; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_1 = refillPipe_io_dataWrite_req_bits_data_1; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_2 = refillPipe_io_dataWrite_req_bits_data_2; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_3 = refillPipe_io_dataWrite_req_bits_data_3; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_4 = refillPipe_io_dataWrite_req_bits_data_4; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_5 = refillPipe_io_dataWrite_req_bits_data_5; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_6 = refillPipe_io_dataWrite_req_bits_data_6; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_data_7 = refillPipe_io_dataWrite_req_bits_data_7; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_blockMask = refillPipe_io_dataWrite_req_bits_blockMask; // @[ICache.scala 61:33]
  assign db_io_write_req_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 61:33]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 88:39]
  assign dir_io_read_req_bits_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 78:21]
  assign dir_io_write_req_valid = refillPipe_io_dirWrite_req_valid; // @[ICache.scala 62:32]
  assign dir_io_write_req_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 62:32]
  assign dir_io_write_req_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 62:32]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = _s1_valid_T_2 & s1_full & _s1_valid_T_5; // @[ICache.scala 132:64]
  assign refillPipe_io_req_bits_addr = s1_info_req_addr; // @[ICache.scala 133:33]
  assign refillPipe_io_req_bits_chosenWay = s1_info_dirInfo_chosenWay; // @[ICache.scala 134:38]
  assign refillPipe_io_resp_ready = 1'h1; // @[ICache.scala 199:30]
  assign refillPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 63:25]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 63:25]
  assign refillBuffer_clock = clock;
  assign refillBuffer_reset = reset;
  assign refillBuffer_io_write_valid = _refillBuffer_io_write_valid_T & io_tlbus_resp_bits_opcode == 3'h1; // @[ICache.scala 156:55]
  assign refillBuffer_io_write_bits_cacheLineAddr = s2_addr; // @[ICache.scala 158:46]
  assign refillBuffer_io_write_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 157:37]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 75:26]
      s0_full <= 1'h0; // @[ICache.scala 75:26]
    end else begin
      s0_full <= _GEN_2;
    end
    if (reset) begin // @[ICache.scala 112:26]
      s1_full <= 1'h0; // @[ICache.scala 112:26]
    end else begin
      s1_full <= _GEN_80;
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
    if (reset) begin // @[ICache.scala 144:26]
      s2_full <= 1'h0; // @[ICache.scala 144:26]
    end else begin
      s2_full <= _GEN_111;
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
    if (reset) begin // @[util.scala 162:24]
      c <= 64'h0; // @[util.scala 162:24]
    end else begin
      c <= _c_T_1; // @[util.scala 163:11]
    end
    if (reset) begin // @[util.scala 162:24]
      c_1 <= 64'h0; // @[util.scala 162:24]
    end else begin
      c_1 <= _c_T_3; // @[util.scala 163:11]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (s0_latch & ~reset) begin
          $fwrite(32'h80000002,"[SimLog ][time=%d] [ICache] read req ==> addr: 0x%x\n",c,io_read_req_bits_addr); // @[util.scala 16:23]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_read_resp_valid & ~reset) begin
          $fwrite(32'h80000002,"[SimLog ][time=%d] [ICache] read resp <== data: 0x%x  inst:0x%x\n",c_1,
            io_read_resp_bits_data,_T_7); // @[util.scala 16:23]
        end
    `ifdef PRINTF_COND
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
  _RAND_74 = {2{`RANDOM}};
  c = _RAND_74[63:0];
  _RAND_75 = {2{`RANDOM}};
  c_1 = _RAND_75[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
