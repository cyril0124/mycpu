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
`endif // RANDOMIZE_REG_INIT
  wire  db_clock; // @[ICache.scala 226:20]
  wire  db_reset; // @[ICache.scala 226:20]
  wire  db_io_read_req_ready; // @[ICache.scala 226:20]
  wire  db_io_read_req_valid; // @[ICache.scala 226:20]
  wire [6:0] db_io_read_req_bits_set; // @[ICache.scala 226:20]
  wire [7:0] db_io_read_req_bits_blockSelOH; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_0; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_1; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_2; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_3; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_4; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_5; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_6; // @[ICache.scala 226:20]
  wire [31:0] db_io_read_resp_bits_data_7; // @[ICache.scala 226:20]
  wire  db_io_write_req_ready; // @[ICache.scala 226:20]
  wire  db_io_write_req_valid; // @[ICache.scala 226:20]
  wire [31:0] db_io_write_req_bits_data; // @[ICache.scala 226:20]
  wire [6:0] db_io_write_req_bits_set; // @[ICache.scala 226:20]
  wire [7:0] db_io_write_req_bits_blockSelOH; // @[ICache.scala 226:20]
  wire [7:0] db_io_write_req_bits_way; // @[ICache.scala 226:20]
  wire  dir_clock; // @[ICache.scala 227:21]
  wire  dir_reset; // @[ICache.scala 227:21]
  wire  dir_io_read_req_ready; // @[ICache.scala 227:21]
  wire  dir_io_read_req_valid; // @[ICache.scala 227:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[ICache.scala 227:21]
  wire  dir_io_read_resp_bits_hit; // @[ICache.scala 227:21]
  wire [7:0] dir_io_read_resp_bits_chosenWay; // @[ICache.scala 227:21]
  wire  dir_io_write_req_ready; // @[ICache.scala 227:21]
  wire  dir_io_write_req_valid; // @[ICache.scala 227:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[ICache.scala 227:21]
  wire [7:0] dir_io_write_req_bits_way; // @[ICache.scala 227:21]
  wire  refillPipe_clock; // @[ICache.scala 228:28]
  wire  refillPipe_reset; // @[ICache.scala 228:28]
  wire  refillPipe_io_req_ready; // @[ICache.scala 228:28]
  wire  refillPipe_io_req_valid; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[ICache.scala 228:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[ICache.scala 228:28]
  wire  refillPipe_io_resp_ready; // @[ICache.scala 228:28]
  wire  refillPipe_io_resp_valid; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[ICache.scala 228:28]
  wire  refillPipe_io_tlbus_req_ready; // @[ICache.scala 228:28]
  wire  refillPipe_io_tlbus_req_valid; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 228:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[ICache.scala 228:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[ICache.scala 228:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_tlbus_resp_bits_data; // @[ICache.scala 228:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 228:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 228:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[ICache.scala 228:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 228:28]
  wire [6:0] refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 228:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 228:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 228:28]
  wire  loadQueue_clock; // @[ICache.scala 236:27]
  wire  loadQueue_reset; // @[ICache.scala 236:27]
  wire  loadQueue_io_enq_ready; // @[ICache.scala 236:27]
  wire  loadQueue_io_enq_valid; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_req_addr; // @[ICache.scala 236:27]
  wire  loadQueue_io_enq_bits_dirInfo_hit; // @[ICache.scala 236:27]
  wire [7:0] loadQueue_io_enq_bits_dirInfo_chosenWay; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_0; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_1; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_2; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_3; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_4; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_5; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_6; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_7; // @[ICache.scala 236:27]
  wire  loadQueue_io_deq_ready; // @[ICache.scala 236:27]
  wire  loadQueue_io_deq_valid; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_req_addr; // @[ICache.scala 236:27]
  wire  loadQueue_io_deq_bits_dirInfo_hit; // @[ICache.scala 236:27]
  wire [7:0] loadQueue_io_deq_bits_dirInfo_chosenWay; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_0; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_1; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_2; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_3; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_4; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_5; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_6; // @[ICache.scala 236:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_7; // @[ICache.scala 236:27]
  wire  refillBuffer_clock; // @[ICache.scala 237:30]
  wire  refillBuffer_reset; // @[ICache.scala 237:30]
  wire  refillBuffer_io_write_valid; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_write_bits_cacheLineAddr; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_write_bits_data; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_0; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_1; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_2; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineAddr_3; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_0; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_1; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_2; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_3; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_4; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_5; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_6; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_0_7; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_0; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_1; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_2; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_3; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_4; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_5; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_6; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_1_7; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_0; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_1; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_2; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_3; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_4; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_5; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_6; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_2_7; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_0; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_1; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_2; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_3; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_4; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_5; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_6; // @[ICache.scala 237:30]
  wire [31:0] refillBuffer_io_read_cacheLineData_3_7; // @[ICache.scala 237:30]
  wire  refillBuffer_io_read_valids_0; // @[ICache.scala 237:30]
  wire  refillBuffer_io_read_valids_1; // @[ICache.scala 237:30]
  wire  refillBuffer_io_read_valids_2; // @[ICache.scala 237:30]
  wire  refillBuffer_io_read_valids_3; // @[ICache.scala 237:30]
  reg  s0_full; // @[ICache.scala 246:26]
  wire  s0_latch = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_fire_T = loadQueue_io_enq_ready & loadQueue_io_enq_valid; // @[Decoupled.scala 51:35]
  wire  s0_fire = s0_full & _s0_fire_T; // @[ICache.scala 248:28]
  reg [31:0] s0_req_r_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[ICache.scala 246:26 254:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[ICache.scala 253:{20,30}]
  reg  s1_full; // @[ICache.scala 286:26]
  reg  s1_info_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T_2 = ~s1_info_dirInfo_hit; // @[ICache.scala 306:25]
  wire  _s1_valid_T_3 = refillPipe_io_req_ready & refillPipe_io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_info_req_addr; // @[Reg.scala 19:16]
  wire [31:0] _bypassVec_T_2 = {s1_info_req_addr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire  bypassVec_0 = refillBuffer_io_read_cacheLineAddr_0 == _bypassVec_T_2 & refillBuffer_io_read_valids_0; // @[ICache.scala 295:154]
  wire  bypassVec_1 = refillBuffer_io_read_cacheLineAddr_1 == _bypassVec_T_2 & refillBuffer_io_read_valids_1; // @[ICache.scala 295:154]
  wire  bypassVec_2 = refillBuffer_io_read_cacheLineAddr_2 == _bypassVec_T_2 & refillBuffer_io_read_valids_2; // @[ICache.scala 295:154]
  wire  bypassVec_3 = refillBuffer_io_read_cacheLineAddr_3 == _bypassVec_T_2 & refillBuffer_io_read_valids_3; // @[ICache.scala 295:154]
  wire [3:0] _s1_bypass_T = {bypassVec_0,bypassVec_1,bypassVec_2,bypassVec_3}; // @[Cat.scala 33:92]
  wire  s1_bypass = |_s1_bypass_T & s1_full & _s1_valid_T_2; // @[ICache.scala 296:51]
  wire  _s1_valid_T_5 = ~s1_bypass; // @[ICache.scala 306:75]
  wire  _s1_valid_T_6 = ~s1_info_dirInfo_hit & _s1_valid_T_3 & ~s1_bypass; // @[ICache.scala 306:72]
  wire  _s1_valid_T_7 = s1_info_dirInfo_hit & io_read_resp_valid | _s1_valid_T_6; // @[ICache.scala 305:71]
  wire  _s1_valid_T_11 = _s1_valid_T_2 & s1_bypass & io_read_resp_valid; // @[ICache.scala 307:59]
  wire  _s1_valid_T_12 = _s1_valid_T_7 | _s1_valid_T_11; // @[ICache.scala 306:86]
  wire  s1_valid = s1_full & _s1_valid_T_12; // @[ICache.scala 305:25]
  reg  s2_full; // @[ICache.scala 317:26]
  reg  s2_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s2_valid_T = ~s2_dirInfo_hit; // @[ICache.scala 334:47]
  reg  s2_bypass; // @[Reg.scala 19:16]
  wire  s2_fire = s2_full & (s2_dirInfo_hit | ~s2_dirInfo_hit & io_read_resp_valid | s2_bypass); // @[ICache.scala 334:25]
  wire  s2_ready = ~s2_full | s2_fire; // @[ICache.scala 323:26]
  wire  s1_fire = s1_valid & s2_ready; // @[ICache.scala 288:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[ICache.scala 290:26]
  wire  s1_latch = loadQueue_io_deq_valid & s1_ready; // @[ICache.scala 287:43]
  reg [7:0] s1_info_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7; // @[Reg.scala 19:16]
  wire  _GEN_24 = s1_full & s1_fire ? 1'h0 : s1_full; // @[ICache.scala 286:26 293:{35,45}]
  wire  _GEN_25 = s1_latch | _GEN_24; // @[ICache.scala 292:{20,30}]
  wire [3:0] _s1_bypassIdx_T = {bypassVec_3,bypassVec_2,bypassVec_1,bypassVec_0}; // @[Cat.scala 33:92]
  wire [1:0] s1_bypassIdx_hi_1 = _s1_bypassIdx_T[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] s1_bypassIdx_lo_1 = _s1_bypassIdx_T[1:0]; // @[OneHot.scala 31:18]
  wire  _s1_bypassIdx_T_1 = |s1_bypassIdx_hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _s1_bypassIdx_T_2 = s1_bypassIdx_hi_1 | s1_bypassIdx_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] s1_bypassIdx = {_s1_bypassIdx_T_1,_s1_bypassIdx_T_2[1]}; // @[Cat.scala 33:92]
  wire [7:0] _s1_bypassData_T_1 = 8'h1 << s1_info_req_addr[4:2]; // @[OneHot.scala 57:35]
  wire [31:0] _GEN_26 = refillBuffer_io_read_cacheLineData_0_0; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_27 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_0 : _GEN_26; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_28 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_0 : _GEN_27; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_29 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_0 : _GEN_28; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_10 = _s1_bypassData_T_1[0] ? _GEN_29 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_30 = refillBuffer_io_read_cacheLineData_0_1; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_31 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_1 : _GEN_30; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_32 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_1 : _GEN_31; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_33 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_1 : _GEN_32; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_11 = _s1_bypassData_T_1[1] ? _GEN_33 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_34 = refillBuffer_io_read_cacheLineData_0_2; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_35 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_2 : _GEN_34; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_36 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_2 : _GEN_35; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_37 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_2 : _GEN_36; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_12 = _s1_bypassData_T_1[2] ? _GEN_37 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_38 = refillBuffer_io_read_cacheLineData_0_3; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_39 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_3 : _GEN_38; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_40 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_3 : _GEN_39; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_41 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_3 : _GEN_40; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_13 = _s1_bypassData_T_1[3] ? _GEN_41 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_42 = refillBuffer_io_read_cacheLineData_0_4; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_43 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_4 : _GEN_42; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_44 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_4 : _GEN_43; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_45 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_4 : _GEN_44; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_14 = _s1_bypassData_T_1[4] ? _GEN_45 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_46 = refillBuffer_io_read_cacheLineData_0_5; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_47 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_5 : _GEN_46; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_48 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_5 : _GEN_47; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_49 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_5 : _GEN_48; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_15 = _s1_bypassData_T_1[5] ? _GEN_49 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_50 = refillBuffer_io_read_cacheLineData_0_6; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_51 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_6 : _GEN_50; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_52 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_6 : _GEN_51; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_53 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_6 : _GEN_52; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_16 = _s1_bypassData_T_1[6] ? _GEN_53 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _GEN_54 = refillBuffer_io_read_cacheLineData_0_7; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_55 = 2'h1 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_1_7 : _GEN_54; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_56 = 2'h2 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_2_7 : _GEN_55; // @[Mux.scala 27:{73,73}]
  wire [31:0] _GEN_57 = 2'h3 == s1_bypassIdx ? refillBuffer_io_read_cacheLineData_3_7 : _GEN_56; // @[Mux.scala 27:{73,73}]
  wire [31:0] _s1_bypassData_T_17 = _s1_bypassData_T_1[7] ? _GEN_57 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_18 = _s1_bypassData_T_10 | _s1_bypassData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_19 = _s1_bypassData_T_18 | _s1_bypassData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_20 = _s1_bypassData_T_19 | _s1_bypassData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_21 = _s1_bypassData_T_20 | _s1_bypassData_T_14; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_22 = _s1_bypassData_T_21 | _s1_bypassData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s1_bypassData_T_23 = _s1_bypassData_T_22 | _s1_bypassData_T_16; // @[Mux.scala 27:73]
  reg [31:0] s2_addr; // @[Reg.scala 19:16]
  wire  _GEN_64 = s2_full & s2_fire ? 1'h0 : s2_full; // @[ICache.scala 317:26 326:{35,45}]
  wire  _GEN_65 = s1_fire | _GEN_64; // @[ICache.scala 325:{20,30}]
  wire  _refillBuffer_io_write_valid_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _io_read_resp_valid_T_3 = refillPipe_io_resp_ready & refillPipe_io_resp_valid; // @[Decoupled.scala 51:35]
  wire  _io_read_resp_valid_T_4 = _s2_valid_T & s2_full & _io_read_resp_valid_T_3; // @[ICache.scala 338:56]
  wire  _io_read_resp_valid_T_5 = s1_info_dirInfo_hit & s1_full | _io_read_resp_valid_T_4; // @[ICache.scala 337:58]
  wire  _io_read_resp_valid_T_8 = s1_bypass & _s1_valid_T_2 & s1_full; // @[ICache.scala 339:63]
  wire [31:0] _io_read_resp_bits_data_T_8 = s1_info_dirInfo_chosenWay[0] ? s1_info_rdData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_9 = s1_info_dirInfo_chosenWay[1] ? s1_info_rdData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_10 = s1_info_dirInfo_chosenWay[2] ? s1_info_rdData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_11 = s1_info_dirInfo_chosenWay[3] ? s1_info_rdData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_12 = s1_info_dirInfo_chosenWay[4] ? s1_info_rdData_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_13 = s1_info_dirInfo_chosenWay[5] ? s1_info_rdData_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_14 = s1_info_dirInfo_chosenWay[6] ? s1_info_rdData_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_15 = s1_info_dirInfo_chosenWay[7] ? s1_info_rdData_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_16 = _io_read_resp_bits_data_T_8 | _io_read_resp_bits_data_T_9; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_17 = _io_read_resp_bits_data_T_16 | _io_read_resp_bits_data_T_10; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_18 = _io_read_resp_bits_data_T_17 | _io_read_resp_bits_data_T_11; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_19 = _io_read_resp_bits_data_T_18 | _io_read_resp_bits_data_T_12; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_20 = _io_read_resp_bits_data_T_19 | _io_read_resp_bits_data_T_13; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_21 = _io_read_resp_bits_data_T_20 | _io_read_resp_bits_data_T_14; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_22 = _io_read_resp_bits_data_T_21 | _io_read_resp_bits_data_T_15; // @[Mux.scala 27:73]
  wire [31:0] s1_bypassData = _s1_bypassData_T_23 | _s1_bypassData_T_17; // @[Mux.scala 27:73]
  wire [31:0] _io_read_resp_bits_data_T_23 = s1_bypass ? s1_bypassData : refillPipe_io_resp_bits_data; // @[ICache.scala 342:40]
  DataBankArray db ( // @[ICache.scala 226:20]
    .clock(db_clock),
    .reset(db_reset),
    .io_read_req_ready(db_io_read_req_ready),
    .io_read_req_valid(db_io_read_req_valid),
    .io_read_req_bits_set(db_io_read_req_bits_set),
    .io_read_req_bits_blockSelOH(db_io_read_req_bits_blockSelOH),
    .io_read_resp_bits_data_0(db_io_read_resp_bits_data_0),
    .io_read_resp_bits_data_1(db_io_read_resp_bits_data_1),
    .io_read_resp_bits_data_2(db_io_read_resp_bits_data_2),
    .io_read_resp_bits_data_3(db_io_read_resp_bits_data_3),
    .io_read_resp_bits_data_4(db_io_read_resp_bits_data_4),
    .io_read_resp_bits_data_5(db_io_read_resp_bits_data_5),
    .io_read_resp_bits_data_6(db_io_read_resp_bits_data_6),
    .io_read_resp_bits_data_7(db_io_read_resp_bits_data_7),
    .io_write_req_ready(db_io_write_req_ready),
    .io_write_req_valid(db_io_write_req_valid),
    .io_write_req_bits_data(db_io_write_req_bits_data),
    .io_write_req_bits_set(db_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(db_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(db_io_write_req_bits_way)
  );
  DCacheDirectory dir ( // @[ICache.scala 227:21]
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
  RefillPipe refillPipe ( // @[ICache.scala 228:28]
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
  Queue loadQueue ( // @[ICache.scala 236:27]
    .clock(loadQueue_clock),
    .reset(loadQueue_reset),
    .io_enq_ready(loadQueue_io_enq_ready),
    .io_enq_valid(loadQueue_io_enq_valid),
    .io_enq_bits_req_addr(loadQueue_io_enq_bits_req_addr),
    .io_enq_bits_dirInfo_hit(loadQueue_io_enq_bits_dirInfo_hit),
    .io_enq_bits_dirInfo_chosenWay(loadQueue_io_enq_bits_dirInfo_chosenWay),
    .io_enq_bits_rdData_0(loadQueue_io_enq_bits_rdData_0),
    .io_enq_bits_rdData_1(loadQueue_io_enq_bits_rdData_1),
    .io_enq_bits_rdData_2(loadQueue_io_enq_bits_rdData_2),
    .io_enq_bits_rdData_3(loadQueue_io_enq_bits_rdData_3),
    .io_enq_bits_rdData_4(loadQueue_io_enq_bits_rdData_4),
    .io_enq_bits_rdData_5(loadQueue_io_enq_bits_rdData_5),
    .io_enq_bits_rdData_6(loadQueue_io_enq_bits_rdData_6),
    .io_enq_bits_rdData_7(loadQueue_io_enq_bits_rdData_7),
    .io_deq_ready(loadQueue_io_deq_ready),
    .io_deq_valid(loadQueue_io_deq_valid),
    .io_deq_bits_req_addr(loadQueue_io_deq_bits_req_addr),
    .io_deq_bits_dirInfo_hit(loadQueue_io_deq_bits_dirInfo_hit),
    .io_deq_bits_dirInfo_chosenWay(loadQueue_io_deq_bits_dirInfo_chosenWay),
    .io_deq_bits_rdData_0(loadQueue_io_deq_bits_rdData_0),
    .io_deq_bits_rdData_1(loadQueue_io_deq_bits_rdData_1),
    .io_deq_bits_rdData_2(loadQueue_io_deq_bits_rdData_2),
    .io_deq_bits_rdData_3(loadQueue_io_deq_bits_rdData_3),
    .io_deq_bits_rdData_4(loadQueue_io_deq_bits_rdData_4),
    .io_deq_bits_rdData_5(loadQueue_io_deq_bits_rdData_5),
    .io_deq_bits_rdData_6(loadQueue_io_deq_bits_rdData_6),
    .io_deq_bits_rdData_7(loadQueue_io_deq_bits_rdData_7)
  );
  RefillBuffer refillBuffer ( // @[ICache.scala 237:30]
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
  assign io_read_req_ready = loadQueue_io_enq_ready; // @[ICache.scala 251:23]
  assign io_read_resp_valid = _io_read_resp_valid_T_5 | _io_read_resp_valid_T_8; // @[ICache.scala 338:83]
  assign io_read_resp_bits_data = s1_info_dirInfo_hit ? _io_read_resp_bits_data_T_22 : _io_read_resp_bits_data_T_23; // @[ICache.scala 340:34]
  assign io_tlbus_req_valid = refillPipe_io_tlbus_req_valid; // @[ICache.scala 233:25]
  assign io_tlbus_req_bits_address = refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 233:25]
  assign io_tlbus_resp_ready = 1'h1; // @[ICache.scala 357:25]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 256:38]
  assign db_io_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign db_io_read_req_bits_blockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  assign db_io_write_req_valid = refillPipe_io_dataWrite_req_valid; // @[ICache.scala 231:33]
  assign db_io_write_req_bits_data = refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 231:33]
  assign db_io_write_req_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 231:33]
  assign db_io_write_req_bits_blockSelOH = refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 231:33]
  assign db_io_write_req_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 231:33]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 260:39]
  assign dir_io_read_req_bits_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 249:21]
  assign dir_io_write_req_valid = refillPipe_io_dirWrite_req_valid; // @[ICache.scala 232:32]
  assign dir_io_write_req_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 232:32]
  assign dir_io_write_req_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 232:32]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = _s1_valid_T_2 & s1_full & _s1_valid_T_5; // @[ICache.scala 301:64]
  assign refillPipe_io_req_bits_addr = s1_info_req_addr; // @[ICache.scala 302:33]
  assign refillPipe_io_req_bits_chosenWay = s1_info_dirInfo_chosenWay; // @[ICache.scala 303:38]
  assign refillPipe_io_resp_ready = 1'h1; // @[ICache.scala 347:30]
  assign refillPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 233:25]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 233:25]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 233:25]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 233:25]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_enq_valid = s0_full; // @[ICache.scala 239:24 263:14]
  assign loadQueue_io_enq_bits_req_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 249:21]
  assign loadQueue_io_enq_bits_dirInfo_hit = dir_io_read_resp_bits_hit; // @[ICache.scala 277:35]
  assign loadQueue_io_enq_bits_dirInfo_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 277:35]
  assign loadQueue_io_enq_bits_rdData_0 = db_io_read_resp_bits_data_0; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_1 = db_io_read_resp_bits_data_1; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_2 = db_io_read_resp_bits_data_2; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_3 = db_io_read_resp_bits_data_3; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_4 = db_io_read_resp_bits_data_4; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_5 = db_io_read_resp_bits_data_5; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_6 = db_io_read_resp_bits_data_6; // @[ICache.scala 280:34]
  assign loadQueue_io_enq_bits_rdData_7 = db_io_read_resp_bits_data_7; // @[ICache.scala 280:34]
  assign loadQueue_io_deq_ready = ~s1_full | s1_fire; // @[ICache.scala 290:26]
  assign refillBuffer_clock = clock;
  assign refillBuffer_reset = reset;
  assign refillBuffer_io_write_valid = _refillBuffer_io_write_valid_T & io_tlbus_resp_bits_opcode == 3'h1; // @[ICache.scala 329:55]
  assign refillBuffer_io_write_bits_cacheLineAddr = s2_addr; // @[ICache.scala 331:46]
  assign refillBuffer_io_write_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 330:37]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 246:26]
      s0_full <= 1'h0; // @[ICache.scala 246:26]
    end else begin
      s0_full <= _GEN_2;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_req_r_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 286:26]
      s1_full <= 1'h0; // @[ICache.scala 286:26]
    end else begin
      s1_full <= _GEN_25;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_dirInfo_hit <= loadQueue_io_deq_bits_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_req_addr <= loadQueue_io_deq_bits_req_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 317:26]
      s2_full <= 1'h0; // @[ICache.scala 317:26]
    end else begin
      s2_full <= _GEN_65;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dirInfo_hit <= s1_info_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_bypass <= s1_bypass; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_dirInfo_chosenWay <= loadQueue_io_deq_bits_dirInfo_chosenWay; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_0 <= loadQueue_io_deq_bits_rdData_0; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_1 <= loadQueue_io_deq_bits_rdData_1; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_2 <= loadQueue_io_deq_bits_rdData_2; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_3 <= loadQueue_io_deq_bits_rdData_3; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_4 <= loadQueue_io_deq_bits_rdData_4; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_5 <= loadQueue_io_deq_bits_rdData_5; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_6 <= loadQueue_io_deq_bits_rdData_6; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_rdData_7 <= loadQueue_io_deq_bits_rdData_7; // @[Reg.scala 20:22]
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
  s0_req_r_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s1_full = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_info_dirInfo_hit = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_info_req_addr = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s2_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_dirInfo_hit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_bypass = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_info_dirInfo_chosenWay = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  s1_info_rdData_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s1_info_rdData_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_info_rdData_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_info_rdData_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_info_rdData_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_info_rdData_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_info_rdData_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_info_rdData_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s2_addr = _RAND_17[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
