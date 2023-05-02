module ICache(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [31:0]  io_read_req_bits_addr,
  input          io_read_resp_ready,
  output         io_read_resp_valid,
  output [31:0]  io_read_resp_bits_addr,
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
  input  [127:0] io_tlbus_resp_bits_data,
  input          io_flush
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
`endif // RANDOMIZE_REG_INIT
  wire  db_clock; // @[ICache.scala 59:20]
  wire  db_reset; // @[ICache.scala 59:20]
  wire [6:0] db_io_read_req_bits_set; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_0_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_1_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_2_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_3_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_4_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_5_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_6_7; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_read_resp_7_7; // @[ICache.scala 59:20]
  wire  db_io_write_req_ready; // @[ICache.scala 59:20]
  wire  db_io_write_req_valid; // @[ICache.scala 59:20]
  wire [6:0] db_io_write_req_bits_set; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_0; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_1; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_2; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_3; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_4; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_5; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_6; // @[ICache.scala 59:20]
  wire [31:0] db_io_write_req_bits_data_7; // @[ICache.scala 59:20]
  wire [7:0] db_io_write_req_bits_blockMask; // @[ICache.scala 59:20]
  wire [7:0] db_io_write_req_bits_way; // @[ICache.scala 59:20]
  wire  dir_clock; // @[ICache.scala 60:21]
  wire  dir_reset; // @[ICache.scala 60:21]
  wire  dir_io_read_req_valid; // @[ICache.scala 60:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[ICache.scala 60:21]
  wire  dir_io_read_resp_bits_hit; // @[ICache.scala 60:21]
  wire [7:0] dir_io_read_resp_bits_chosenWay; // @[ICache.scala 60:21]
  wire  dir_io_write_req_ready; // @[ICache.scala 60:21]
  wire  dir_io_write_req_valid; // @[ICache.scala 60:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[ICache.scala 60:21]
  wire [7:0] dir_io_write_req_bits_way; // @[ICache.scala 60:21]
  wire  refillPipe_clock; // @[ICache.scala 61:28]
  wire  refillPipe_reset; // @[ICache.scala 61:28]
  wire  refillPipe_io_req_ready; // @[ICache.scala 61:28]
  wire  refillPipe_io_req_valid; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[ICache.scala 61:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[ICache.scala 61:28]
  wire  refillPipe_io_resp_ready; // @[ICache.scala 61:28]
  wire  refillPipe_io_resp_valid; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_0; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_1; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_2; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_3; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_4; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_5; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_6; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_resp_bits_blockData_7; // @[ICache.scala 61:28]
  wire  refillPipe_io_tlbus_req_ready; // @[ICache.scala 61:28]
  wire  refillPipe_io_tlbus_req_valid; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 61:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[ICache.scala 61:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[ICache.scala 61:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 61:28]
  wire [127:0] refillPipe_io_tlbus_resp_bits_data; // @[ICache.scala 61:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 61:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 61:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[ICache.scala 61:28]
  wire [6:0] refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_0; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_1; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_2; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_3; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_4; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_5; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_6; // @[ICache.scala 61:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_7; // @[ICache.scala 61:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_blockMask; // @[ICache.scala 61:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 61:28]
  wire  refillBuffer_clock; // @[ICache.scala 68:30]
  wire  refillBuffer_reset; // @[ICache.scala 68:30]
  wire  refillBuffer_io_write_valid; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_write_bits_cacheLineAddr; // @[ICache.scala 68:30]
  wire [127:0] refillBuffer_io_write_bits_data; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_0; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_1; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_0; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_1; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_2; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_3; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_4; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_5; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_6; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_7; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_0; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_1; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_2; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_3; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_4; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_5; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_6; // @[ICache.scala 68:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_7; // @[ICache.scala 68:30]
  wire  refillBuffer_io_read_valids_0; // @[ICache.scala 68:30]
  wire  refillBuffer_io_read_valids_1; // @[ICache.scala 68:30]
  wire  readRespArb_io_in_0_valid; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_0_bits_addr; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_0_bits_inst_0; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_0_bits_inst_1; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_0_bits_inst_2; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_0_bits_inst_3; // @[ICache.scala 198:29]
  wire [2:0] readRespArb_io_in_0_bits_size; // @[ICache.scala 198:29]
  wire  readRespArb_io_in_1_ready; // @[ICache.scala 198:29]
  wire  readRespArb_io_in_1_valid; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_1_bits_addr; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_1_bits_inst_0; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_1_bits_inst_1; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_1_bits_inst_2; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_in_1_bits_inst_3; // @[ICache.scala 198:29]
  wire [2:0] readRespArb_io_in_1_bits_size; // @[ICache.scala 198:29]
  wire  readRespArb_io_out_valid; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_out_bits_addr; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_out_bits_inst_0; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_out_bits_inst_1; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_out_bits_inst_2; // @[ICache.scala 198:29]
  wire [31:0] readRespArb_io_out_bits_inst_3; // @[ICache.scala 198:29]
  wire [2:0] readRespArb_io_out_bits_size; // @[ICache.scala 198:29]
  wire  s0_latch = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[ICache.scala 92:24]
  reg  s1_full; // @[ICache.scala 109:26]
  wire  s1_ready = ~s1_full; // @[ICache.scala 116:17]
  wire  s0_fire = s0_valid_REG & s1_ready; // @[ICache.scala 79:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_read_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  reg  s1_respSend; // @[ICache.scala 139:30]
  wire  s1_resp_ready = readRespArb_io_in_1_ready; // @[ICache.scala 137:27 200:26]
  wire  s1_info_dirInfo_hit = dir_io_read_resp_bits_hit; // @[ICache.scala 100:23 101:21]
  wire  _s1_resp_valid_T = ~s1_info_dirInfo_hit; // @[ICache.scala 143:47]
  reg [31:0] s1_addr; // @[Reg.scala 19:16]
  wire [31:0] _bypassVec_T_2 = {s1_addr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire  bypassVec_0 = refillBuffer_io_read_cacheLineAddr_0 == _bypassVec_T_2 & refillBuffer_io_read_valids_0; // @[ICache.scala 121:145]
  wire  bypassVec_1 = refillBuffer_io_read_cacheLineAddr_1 == _bypassVec_T_2 & refillBuffer_io_read_valids_1; // @[ICache.scala 121:145]
  wire [1:0] _s1_bypass_T = {bypassVec_0,bypassVec_1}; // @[Cat.scala 33:92]
  wire  _s1_bypass_T_4 = s1_full | s0_fire; // @[ICache.scala 122:76]
  wire  s1_bypass = |_s1_bypass_T & _s1_resp_valid_T & (s1_full | s0_fire); // @[ICache.scala 122:64]
  reg  s2_full; // @[ICache.scala 156:26]
  reg  s2_dirInfo_hit; // @[Reg.scala 19:16]
  reg  s2_bypass; // @[Reg.scala 19:16]
  wire  _s2_valid_T_1 = ~s2_dirInfo_hit; // @[ICache.scala 190:48]
  wire  _s2_resp_valid_T_2 = refillPipe_io_resp_ready & refillPipe_io_resp_valid; // @[Decoupled.scala 51:35]
  reg  s2_refillValid; // @[ICache.scala 174:33]
  wire  _s2_resp_valid_T_3 = _s2_resp_valid_T_2 | s2_refillValid; // @[ICache.scala 182:77]
  wire  s2_resp_valid = _s2_valid_T_1 & s2_full & (_s2_resp_valid_T_2 | s2_refillValid); // @[ICache.scala 182:49]
  wire  s2_fire = s2_dirInfo_hit | s2_bypass | ~s2_dirInfo_hit & s2_resp_valid; // @[ICache.scala 190:45]
  wire  s2_ready = ~s2_full | s2_fire; // @[ICache.scala 162:26]
  wire  s1_resp_valid = (s1_info_dirInfo_hit | ~s1_info_dirInfo_hit & s1_bypass) & _s1_bypass_T_4 & s2_ready & ~
    s1_respSend; // @[ICache.scala 143:120]
  wire  _s1_valid_T = s1_resp_ready & s1_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_2 = refillPipe_io_req_ready & refillPipe_io_req_valid; // @[Decoupled.scala 51:35]
  wire  s1_valid = s1_respSend | _s1_valid_T | _s1_valid_T_2; // @[ICache.scala 151:45]
  wire  s1_fire = s1_valid & s2_ready; // @[ICache.scala 111:28]
  wire [7:0] s1_info_dirInfo_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 100:23 101:21]
  wire [31:0] s1_info_rdData_0_0 = db_io_read_resp_0_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_8 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_0 = db_io_read_resp_1_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_9 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_0 = db_io_read_resp_2_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_10 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_0 = db_io_read_resp_3_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_11 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_0 = db_io_read_resp_4_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_12 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_0 = db_io_read_resp_5_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_13 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_0 = db_io_read_resp_6_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_14 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_0 = db_io_read_resp_7_0; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_15 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_16 = _s1_rdBlockData_T_8 | _s1_rdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_17 = _s1_rdBlockData_T_16 | _s1_rdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_18 = _s1_rdBlockData_T_17 | _s1_rdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_19 = _s1_rdBlockData_T_18 | _s1_rdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_20 = _s1_rdBlockData_T_19 | _s1_rdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_21 = _s1_rdBlockData_T_20 | _s1_rdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_1 = db_io_read_resp_0_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_23 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_1 = db_io_read_resp_1_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_24 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_1 = db_io_read_resp_2_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_25 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_1 = db_io_read_resp_3_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_26 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_1 = db_io_read_resp_4_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_27 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_1 = db_io_read_resp_5_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_28 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_1 = db_io_read_resp_6_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_29 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_1 = db_io_read_resp_7_1; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_30 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_31 = _s1_rdBlockData_T_23 | _s1_rdBlockData_T_24; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_32 = _s1_rdBlockData_T_31 | _s1_rdBlockData_T_25; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_33 = _s1_rdBlockData_T_32 | _s1_rdBlockData_T_26; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_34 = _s1_rdBlockData_T_33 | _s1_rdBlockData_T_27; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_35 = _s1_rdBlockData_T_34 | _s1_rdBlockData_T_28; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_36 = _s1_rdBlockData_T_35 | _s1_rdBlockData_T_29; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_2 = db_io_read_resp_0_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_38 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_2 = db_io_read_resp_1_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_39 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_2 = db_io_read_resp_2_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_40 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_2 = db_io_read_resp_3_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_41 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_2 = db_io_read_resp_4_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_42 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_2 = db_io_read_resp_5_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_43 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_2 = db_io_read_resp_6_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_44 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_2 = db_io_read_resp_7_2; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_45 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_46 = _s1_rdBlockData_T_38 | _s1_rdBlockData_T_39; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_47 = _s1_rdBlockData_T_46 | _s1_rdBlockData_T_40; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_48 = _s1_rdBlockData_T_47 | _s1_rdBlockData_T_41; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_49 = _s1_rdBlockData_T_48 | _s1_rdBlockData_T_42; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_50 = _s1_rdBlockData_T_49 | _s1_rdBlockData_T_43; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_51 = _s1_rdBlockData_T_50 | _s1_rdBlockData_T_44; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_3 = db_io_read_resp_0_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_53 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_3 = db_io_read_resp_1_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_54 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_3 = db_io_read_resp_2_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_55 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_3 = db_io_read_resp_3_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_56 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_3 = db_io_read_resp_4_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_57 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_3 = db_io_read_resp_5_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_58 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_3 = db_io_read_resp_6_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_59 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_3 = db_io_read_resp_7_3; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_60 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_61 = _s1_rdBlockData_T_53 | _s1_rdBlockData_T_54; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_62 = _s1_rdBlockData_T_61 | _s1_rdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_63 = _s1_rdBlockData_T_62 | _s1_rdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_64 = _s1_rdBlockData_T_63 | _s1_rdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_65 = _s1_rdBlockData_T_64 | _s1_rdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_66 = _s1_rdBlockData_T_65 | _s1_rdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_4 = db_io_read_resp_0_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_68 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_4 = db_io_read_resp_1_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_69 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_4 = db_io_read_resp_2_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_70 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_4 = db_io_read_resp_3_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_71 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_4 = db_io_read_resp_4_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_72 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_4 = db_io_read_resp_5_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_73 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_4 = db_io_read_resp_6_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_74 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_4 = db_io_read_resp_7_4; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_75 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_76 = _s1_rdBlockData_T_68 | _s1_rdBlockData_T_69; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_77 = _s1_rdBlockData_T_76 | _s1_rdBlockData_T_70; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_78 = _s1_rdBlockData_T_77 | _s1_rdBlockData_T_71; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_79 = _s1_rdBlockData_T_78 | _s1_rdBlockData_T_72; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_80 = _s1_rdBlockData_T_79 | _s1_rdBlockData_T_73; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_81 = _s1_rdBlockData_T_80 | _s1_rdBlockData_T_74; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_4 = _s1_rdBlockData_T_81 | _s1_rdBlockData_T_75; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_5 = db_io_read_resp_0_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_83 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_5 = db_io_read_resp_1_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_84 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_5 = db_io_read_resp_2_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_85 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_5 = db_io_read_resp_3_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_86 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_5 = db_io_read_resp_4_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_87 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_5 = db_io_read_resp_5_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_88 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_5 = db_io_read_resp_6_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_89 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_5 = db_io_read_resp_7_5; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_90 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_91 = _s1_rdBlockData_T_83 | _s1_rdBlockData_T_84; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_92 = _s1_rdBlockData_T_91 | _s1_rdBlockData_T_85; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_93 = _s1_rdBlockData_T_92 | _s1_rdBlockData_T_86; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_94 = _s1_rdBlockData_T_93 | _s1_rdBlockData_T_87; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_95 = _s1_rdBlockData_T_94 | _s1_rdBlockData_T_88; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_96 = _s1_rdBlockData_T_95 | _s1_rdBlockData_T_89; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_5 = _s1_rdBlockData_T_96 | _s1_rdBlockData_T_90; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_6 = db_io_read_resp_0_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_98 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_6 = db_io_read_resp_1_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_99 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_6 = db_io_read_resp_2_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_100 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_6 = db_io_read_resp_3_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_101 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_6 = db_io_read_resp_4_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_102 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_6 = db_io_read_resp_5_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_103 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_6 = db_io_read_resp_6_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_104 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_6 = db_io_read_resp_7_6; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_105 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_106 = _s1_rdBlockData_T_98 | _s1_rdBlockData_T_99; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_107 = _s1_rdBlockData_T_106 | _s1_rdBlockData_T_100; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_108 = _s1_rdBlockData_T_107 | _s1_rdBlockData_T_101; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_109 = _s1_rdBlockData_T_108 | _s1_rdBlockData_T_102; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_110 = _s1_rdBlockData_T_109 | _s1_rdBlockData_T_103; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_111 = _s1_rdBlockData_T_110 | _s1_rdBlockData_T_104; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_6 = _s1_rdBlockData_T_111 | _s1_rdBlockData_T_105; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_0_7 = db_io_read_resp_0_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_113 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_1_7 = db_io_read_resp_1_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_114 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_2_7 = db_io_read_resp_2_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_115 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_3_7 = db_io_read_resp_3_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_116 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_4_7 = db_io_read_resp_4_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_117 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_5_7 = db_io_read_resp_5_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_118 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_6_7 = db_io_read_resp_6_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_119 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_info_rdData_7_7 = db_io_read_resp_7_7; // @[ICache.scala 100:23 103:20]
  wire [31:0] _s1_rdBlockData_T_120 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_121 = _s1_rdBlockData_T_113 | _s1_rdBlockData_T_114; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_122 = _s1_rdBlockData_T_121 | _s1_rdBlockData_T_115; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_123 = _s1_rdBlockData_T_122 | _s1_rdBlockData_T_116; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_124 = _s1_rdBlockData_T_123 | _s1_rdBlockData_T_117; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_125 = _s1_rdBlockData_T_124 | _s1_rdBlockData_T_118; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_126 = _s1_rdBlockData_T_125 | _s1_rdBlockData_T_119; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_7 = _s1_rdBlockData_T_126 | _s1_rdBlockData_T_120; // @[Mux.scala 27:73]
  wire  _T = ~s1_fire; // @[ICache.scala 118:22]
  wire  _GEN_2 = s1_full & s1_fire ? 1'h0 : s1_full; // @[ICache.scala 109:26 119:{35,45}]
  wire  _GEN_3 = s0_fire & ~s1_fire | _GEN_2; // @[ICache.scala 118:{32,42}]
  wire [1:0] _s1_bypassIdx_T = {bypassVec_1,bypassVec_0}; // @[Cat.scala 33:92]
  wire  s1_bypassIdx = _s1_bypassIdx_T[1]; // @[CircuitMath.scala 28:8]
  wire [31:0] _GEN_4 = refillBuffer_io_read_cacheLineData_0_0; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_5 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_0 : _GEN_4; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_6 = refillBuffer_io_read_cacheLineData_0_1; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_7 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_1 : _GEN_6; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_8 = refillBuffer_io_read_cacheLineData_0_2; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_9 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_2 : _GEN_8; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_10 = refillBuffer_io_read_cacheLineData_0_3; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_11 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_3 : _GEN_10; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_12 = refillBuffer_io_read_cacheLineData_0_4; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_13 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_4 : _GEN_12; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_14 = refillBuffer_io_read_cacheLineData_0_5; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_15 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_5 : _GEN_14; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_16 = refillBuffer_io_read_cacheLineData_0_6; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_17 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_6 : _GEN_16; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_18 = refillBuffer_io_read_cacheLineData_0_7; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_19 = s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_7 : _GEN_18; // @[Mux.scala 27:{73,73}]
  wire [3:0] rdThreshole = 4'h8 - 4'h4; // @[ICache.scala 131:41]
  wire [2:0] s1_off = s1_addr[4:2]; // @[ICache.scala 132:25]
  wire [3:0] _GEN_41 = {{1'd0}, s1_addr[4:2]}; // @[ICache.scala 134:37]
  wire [3:0] _s1_respHitSize_T_2 = 4'h8 - _GEN_41; // @[ICache.scala 134:71]
  wire [3:0] s1_respHitSize = _GEN_41 >= rdThreshole ? _s1_respHitSize_T_2 : 4'h4; // @[ICache.scala 134:29]
  wire [255:0] _s1_respHitInst_T = {s1_rdBlockData_7,s1_rdBlockData_6,s1_rdBlockData_5,s1_rdBlockData_4,s1_rdBlockData_3
    ,s1_rdBlockData_2,s1_rdBlockData_1,s1_rdBlockData_0}; // @[ICache.scala 135:42]
  wire [7:0] _s1_respHitInst_T_1 = {s1_addr[4:2], 5'h0}; // @[ICache.scala 135:60]
  wire [255:0] _s1_respHitInst_T_2 = _s1_respHitInst_T >> _s1_respHitInst_T_1; // @[ICache.scala 135:49]
  wire [31:0] s1_respHitInst_0 = _s1_respHitInst_T_2[31:0]; // @[ICache.scala 135:111]
  wire [31:0] s1_respHitInst_1 = _s1_respHitInst_T_2[63:32]; // @[ICache.scala 135:111]
  wire [31:0] s1_respHitInst_2 = _s1_respHitInst_T_2[95:64]; // @[ICache.scala 135:111]
  wire [31:0] s1_respHitInst_3 = _s1_respHitInst_T_2[127:96]; // @[ICache.scala 135:111]
  wire [255:0] _s1_respBypassInst_T = {_GEN_19,_GEN_17,_GEN_15,_GEN_13,_GEN_11,_GEN_9,_GEN_7,_GEN_5}; // @[ICache.scala 136:49]
  wire [255:0] _s1_respBypassInst_T_2 = _s1_respBypassInst_T >> _s1_respHitInst_T_1; // @[ICache.scala 136:56]
  wire [31:0] s1_respBypassInst_0 = _s1_respBypassInst_T_2[31:0]; // @[ICache.scala 136:118]
  wire [31:0] s1_respBypassInst_1 = _s1_respBypassInst_T_2[63:32]; // @[ICache.scala 136:118]
  wire [31:0] s1_respBypassInst_2 = _s1_respBypassInst_T_2[95:64]; // @[ICache.scala 136:118]
  wire [31:0] s1_respBypassInst_3 = _s1_respBypassInst_T_2[127:96]; // @[ICache.scala 136:118]
  wire  _GEN_20 = s1_respSend & s1_fire ? 1'h0 : s1_respSend; // @[ICache.scala 139:30 141:{39,53}]
  wire  _GEN_21 = _s1_valid_T & _T | _GEN_20; // @[ICache.scala 140:{36,50}]
  reg [31:0] s2_addr; // @[Reg.scala 19:16]
  wire  _GEN_35 = s2_full & s2_fire ? 1'h0 : s2_full; // @[ICache.scala 156:26 165:{35,45}]
  wire  _GEN_36 = s1_fire | _GEN_35; // @[ICache.scala 164:{20,30}]
  wire  _refillBuffer_io_write_valid_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire [2:0] s2_off = s2_addr[4:2]; // @[ICache.scala 178:25]
  wire [3:0] _GEN_43 = {{1'd0}, s2_off}; // @[ICache.scala 179:38]
  wire [3:0] _s2_respMissSize_T_2 = 4'h8 - _GEN_43; // @[ICache.scala 179:72]
  wire [3:0] s2_respMissSize = _GEN_43 >= rdThreshole ? _s2_respMissSize_T_2 : 4'h4; // @[ICache.scala 179:30]
  wire [255:0] _s2_respRefillInst_T = {refillPipe_io_resp_bits_blockData_7,refillPipe_io_resp_bits_blockData_6,
    refillPipe_io_resp_bits_blockData_5,refillPipe_io_resp_bits_blockData_4,refillPipe_io_resp_bits_blockData_3,
    refillPipe_io_resp_bits_blockData_2,refillPipe_io_resp_bits_blockData_1,refillPipe_io_resp_bits_blockData_0}; // @[ICache.scala 180:64]
  wire [7:0] _s2_respRefillInst_T_1 = {s2_off, 5'h0}; // @[ICache.scala 180:82]
  wire [255:0] _s2_respRefillInst_T_2 = _s2_respRefillInst_T >> _s2_respRefillInst_T_1; // @[ICache.scala 180:71]
  DataBankArray db ( // @[ICache.scala 59:20]
    .clock(db_clock),
    .reset(db_reset),
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
  DCacheDirectory dir ( // @[ICache.scala 60:21]
    .clock(dir_clock),
    .reset(dir_reset),
    .io_read_req_valid(dir_io_read_req_valid),
    .io_read_req_bits_addr(dir_io_read_req_bits_addr),
    .io_read_resp_bits_hit(dir_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(dir_io_read_resp_bits_chosenWay),
    .io_write_req_ready(dir_io_write_req_ready),
    .io_write_req_valid(dir_io_write_req_valid),
    .io_write_req_bits_addr(dir_io_write_req_bits_addr),
    .io_write_req_bits_way(dir_io_write_req_bits_way)
  );
  RefillPipe refillPipe ( // @[ICache.scala 61:28]
    .clock(refillPipe_clock),
    .reset(refillPipe_reset),
    .io_req_ready(refillPipe_io_req_ready),
    .io_req_valid(refillPipe_io_req_valid),
    .io_req_bits_addr(refillPipe_io_req_bits_addr),
    .io_req_bits_chosenWay(refillPipe_io_req_bits_chosenWay),
    .io_resp_ready(refillPipe_io_resp_ready),
    .io_resp_valid(refillPipe_io_resp_valid),
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
  RefillBuffer refillBuffer ( // @[ICache.scala 68:30]
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
  Arbiter readRespArb ( // @[ICache.scala 198:29]
    .io_in_0_valid(readRespArb_io_in_0_valid),
    .io_in_0_bits_addr(readRespArb_io_in_0_bits_addr),
    .io_in_0_bits_inst_0(readRespArb_io_in_0_bits_inst_0),
    .io_in_0_bits_inst_1(readRespArb_io_in_0_bits_inst_1),
    .io_in_0_bits_inst_2(readRespArb_io_in_0_bits_inst_2),
    .io_in_0_bits_inst_3(readRespArb_io_in_0_bits_inst_3),
    .io_in_0_bits_size(readRespArb_io_in_0_bits_size),
    .io_in_1_ready(readRespArb_io_in_1_ready),
    .io_in_1_valid(readRespArb_io_in_1_valid),
    .io_in_1_bits_addr(readRespArb_io_in_1_bits_addr),
    .io_in_1_bits_inst_0(readRespArb_io_in_1_bits_inst_0),
    .io_in_1_bits_inst_1(readRespArb_io_in_1_bits_inst_1),
    .io_in_1_bits_inst_2(readRespArb_io_in_1_bits_inst_2),
    .io_in_1_bits_inst_3(readRespArb_io_in_1_bits_inst_3),
    .io_in_1_bits_size(readRespArb_io_in_1_bits_size),
    .io_out_valid(readRespArb_io_out_valid),
    .io_out_bits_addr(readRespArb_io_out_bits_addr),
    .io_out_bits_inst_0(readRespArb_io_out_bits_inst_0),
    .io_out_bits_inst_1(readRespArb_io_out_bits_inst_1),
    .io_out_bits_inst_2(readRespArb_io_out_bits_inst_2),
    .io_out_bits_inst_3(readRespArb_io_out_bits_inst_3),
    .io_out_bits_size(readRespArb_io_out_bits_size)
  );
  assign io_read_req_ready = ~s1_full; // @[ICache.scala 116:17]
  assign io_read_resp_valid = readRespArb_io_out_valid; // @[ICache.scala 201:18]
  assign io_read_resp_bits_addr = readRespArb_io_out_bits_addr; // @[ICache.scala 201:18]
  assign io_read_resp_bits_inst_0 = readRespArb_io_out_bits_inst_0; // @[ICache.scala 201:18]
  assign io_read_resp_bits_inst_1 = readRespArb_io_out_bits_inst_1; // @[ICache.scala 201:18]
  assign io_read_resp_bits_inst_2 = readRespArb_io_out_bits_inst_2; // @[ICache.scala 201:18]
  assign io_read_resp_bits_inst_3 = readRespArb_io_out_bits_inst_3; // @[ICache.scala 201:18]
  assign io_read_resp_bits_size = readRespArb_io_out_bits_size; // @[ICache.scala 201:18]
  assign io_tlbus_req_valid = refillPipe_io_tlbus_req_valid; // @[ICache.scala 66:25]
  assign io_tlbus_req_bits_address = refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 66:25]
  assign io_tlbus_resp_ready = 1'h1; // @[ICache.scala 206:25]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign db_io_write_req_valid = refillPipe_io_dataWrite_req_valid; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_0 = refillPipe_io_dataWrite_req_bits_data_0; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_1 = refillPipe_io_dataWrite_req_bits_data_1; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_2 = refillPipe_io_dataWrite_req_bits_data_2; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_3 = refillPipe_io_dataWrite_req_bits_data_3; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_4 = refillPipe_io_dataWrite_req_bits_data_4; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_5 = refillPipe_io_dataWrite_req_bits_data_5; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_6 = refillPipe_io_dataWrite_req_bits_data_6; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_data_7 = refillPipe_io_dataWrite_req_bits_data_7; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_blockMask = refillPipe_io_dataWrite_req_bits_blockMask; // @[ICache.scala 64:33]
  assign db_io_write_req_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 64:33]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  assign dir_io_read_req_bits_addr = s0_latch ? io_read_req_bits_addr : s0_reqReg_addr; // @[ICache.scala 81:21]
  assign dir_io_write_req_valid = refillPipe_io_dirWrite_req_valid; // @[ICache.scala 65:32]
  assign dir_io_write_req_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 65:32]
  assign dir_io_write_req_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 65:32]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = _s1_resp_valid_T & s1_full & ~s1_bypass; // @[ICache.scala 127:64]
  assign refillPipe_io_req_bits_addr = s1_addr; // @[ICache.scala 128:33]
  assign refillPipe_io_req_bits_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 100:23 101:21]
  assign refillPipe_io_resp_ready = 1'h1; // @[ICache.scala 204:30]
  assign refillPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 66:25]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 66:25]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 66:25]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 66:25]
  assign refillBuffer_clock = clock;
  assign refillBuffer_reset = reset;
  assign refillBuffer_io_write_valid = _refillBuffer_io_write_valid_T & io_tlbus_resp_bits_opcode == 3'h1; // @[ICache.scala 168:55]
  assign refillBuffer_io_write_bits_cacheLineAddr = s2_addr; // @[ICache.scala 170:46]
  assign refillBuffer_io_write_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 169:37]
  assign readRespArb_io_in_0_valid = _s2_valid_T_1 & s2_full & (_s2_resp_valid_T_2 | s2_refillValid); // @[ICache.scala 182:49]
  assign readRespArb_io_in_0_bits_addr = s2_addr; // @[ICache.scala 181:27 183:23]
  assign readRespArb_io_in_0_bits_inst_0 = _s2_respRefillInst_T_2[31:0]; // @[ICache.scala 180:133]
  assign readRespArb_io_in_0_bits_inst_1 = _s2_respRefillInst_T_2[63:32]; // @[ICache.scala 180:133]
  assign readRespArb_io_in_0_bits_inst_2 = _s2_respRefillInst_T_2[95:64]; // @[ICache.scala 180:133]
  assign readRespArb_io_in_0_bits_inst_3 = _s2_respRefillInst_T_2[127:96]; // @[ICache.scala 180:133]
  assign readRespArb_io_in_0_bits_size = s2_respMissSize[2:0]; // @[ICache.scala 181:27 184:23]
  assign readRespArb_io_in_1_valid = (s1_info_dirInfo_hit | ~s1_info_dirInfo_hit & s1_bypass) & _s1_bypass_T_4 &
    s2_ready & ~s1_respSend; // @[ICache.scala 143:120]
  assign readRespArb_io_in_1_bits_addr = s1_addr; // @[ICache.scala 137:27 144:23]
  assign readRespArb_io_in_1_bits_inst_0 = s1_bypass ? s1_respBypassInst_0 : s1_respHitInst_0; // @[ICache.scala 148:20]
  assign readRespArb_io_in_1_bits_inst_1 = s1_bypass ? s1_respBypassInst_1 : s1_respHitInst_1; // @[ICache.scala 148:20]
  assign readRespArb_io_in_1_bits_inst_2 = s1_bypass ? s1_respBypassInst_2 : s1_respHitInst_2; // @[ICache.scala 148:20]
  assign readRespArb_io_in_1_bits_inst_3 = s1_bypass ? s1_respBypassInst_3 : s1_respHitInst_3; // @[ICache.scala 148:20]
  assign readRespArb_io_in_1_bits_size = s1_respHitSize[2:0]; // @[ICache.scala 137:27 145:23]
  always @(posedge clock) begin
    s0_valid_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[ICache.scala 109:26]
      s1_full <= 1'h0; // @[ICache.scala 109:26]
    end else if (io_flush) begin // @[ICache.scala 192:20]
      s1_full <= 1'h0; // @[ICache.scala 193:17]
    end else begin
      s1_full <= _GEN_3;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 139:30]
      s1_respSend <= 1'h0; // @[ICache.scala 139:30]
    end else begin
      s1_respSend <= _GEN_21;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s1_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 156:26]
      s2_full <= 1'h0; // @[ICache.scala 156:26]
    end else if (io_flush) begin // @[ICache.scala 192:20]
      s2_full <= 1'h0; // @[ICache.scala 194:17]
    end else begin
      s2_full <= _GEN_36;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dirInfo_hit <= s1_info_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_bypass <= s1_bypass; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 174:33]
      s2_refillValid <= 1'h0; // @[ICache.scala 174:33]
    end else if (s2_refillValid & s1_fire | s2_fire) begin // @[ICache.scala 175:50]
      s2_refillValid <= 1'h0; // @[ICache.scala 175:67]
    end else begin
      s2_refillValid <= _s2_resp_valid_T_3;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_addr <= s1_addr; // @[Reg.scala 20:22]
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
  s0_valid_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_full = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_respSend = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s2_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_dirInfo_hit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_bypass = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_refillValid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_addr = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
