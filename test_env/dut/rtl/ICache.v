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
`endif // RANDOMIZE_REG_INIT
  wire  db_clock; // @[ICache.scala 173:20]
  wire  db_reset; // @[ICache.scala 173:20]
  wire  db_io_read_req_ready; // @[ICache.scala 173:20]
  wire  db_io_read_req_valid; // @[ICache.scala 173:20]
  wire [6:0] db_io_read_req_bits_set; // @[ICache.scala 173:20]
  wire [7:0] db_io_read_req_bits_blockSelOH; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_0; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_1; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_2; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_3; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_4; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_5; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_6; // @[ICache.scala 173:20]
  wire [31:0] db_io_read_resp_bits_data_7; // @[ICache.scala 173:20]
  wire  db_io_write_req_ready; // @[ICache.scala 173:20]
  wire  db_io_write_req_valid; // @[ICache.scala 173:20]
  wire [31:0] db_io_write_req_bits_data; // @[ICache.scala 173:20]
  wire [6:0] db_io_write_req_bits_set; // @[ICache.scala 173:20]
  wire [7:0] db_io_write_req_bits_blockSelOH; // @[ICache.scala 173:20]
  wire [7:0] db_io_write_req_bits_way; // @[ICache.scala 173:20]
  wire  dir_clock; // @[ICache.scala 174:21]
  wire  dir_reset; // @[ICache.scala 174:21]
  wire  dir_io_read_req_ready; // @[ICache.scala 174:21]
  wire  dir_io_read_req_valid; // @[ICache.scala 174:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[ICache.scala 174:21]
  wire  dir_io_read_resp_bits_hit; // @[ICache.scala 174:21]
  wire [7:0] dir_io_read_resp_bits_chosenWay; // @[ICache.scala 174:21]
  wire  dir_io_write_req_ready; // @[ICache.scala 174:21]
  wire  dir_io_write_req_valid; // @[ICache.scala 174:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[ICache.scala 174:21]
  wire [7:0] dir_io_write_req_bits_way; // @[ICache.scala 174:21]
  wire  refillPipe_clock; // @[ICache.scala 175:28]
  wire  refillPipe_reset; // @[ICache.scala 175:28]
  wire  refillPipe_io_req_ready; // @[ICache.scala 175:28]
  wire  refillPipe_io_req_valid; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[ICache.scala 175:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[ICache.scala 175:28]
  wire  refillPipe_io_resp_ready; // @[ICache.scala 175:28]
  wire  refillPipe_io_resp_valid; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[ICache.scala 175:28]
  wire  refillPipe_io_tlbus_req_ready; // @[ICache.scala 175:28]
  wire  refillPipe_io_tlbus_req_valid; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 175:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[ICache.scala 175:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[ICache.scala 175:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_tlbus_resp_bits_data; // @[ICache.scala 175:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 175:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 175:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[ICache.scala 175:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 175:28]
  wire [6:0] refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 175:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 175:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 175:28]
  wire  loadQueue_clock; // @[ICache.scala 182:27]
  wire  loadQueue_reset; // @[ICache.scala 182:27]
  wire  loadQueue_io_enq_ready; // @[ICache.scala 182:27]
  wire  loadQueue_io_enq_valid; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_req_addr; // @[ICache.scala 182:27]
  wire  loadQueue_io_enq_bits_dirInfo_hit; // @[ICache.scala 182:27]
  wire [7:0] loadQueue_io_enq_bits_dirInfo_chosenWay; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_0; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_1; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_2; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_3; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_4; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_5; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_6; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_enq_bits_rdData_7; // @[ICache.scala 182:27]
  wire  loadQueue_io_deq_ready; // @[ICache.scala 182:27]
  wire  loadQueue_io_deq_valid; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_req_addr; // @[ICache.scala 182:27]
  wire  loadQueue_io_deq_bits_dirInfo_hit; // @[ICache.scala 182:27]
  wire [7:0] loadQueue_io_deq_bits_dirInfo_chosenWay; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_0; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_1; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_2; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_3; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_4; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_5; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_6; // @[ICache.scala 182:27]
  wire [31:0] loadQueue_io_deq_bits_rdData_7; // @[ICache.scala 182:27]
  reg  s0_full; // @[ICache.scala 193:26]
  wire  s0_latch = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_fire_T = loadQueue_io_enq_ready & loadQueue_io_enq_valid; // @[Decoupled.scala 51:35]
  wire  s0_fire = s0_full & _s0_fire_T; // @[ICache.scala 195:28]
  reg [31:0] s0_req_r_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[ICache.scala 193:26 201:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[ICache.scala 200:{20,30}]
  reg  s1_full; // @[ICache.scala 239:26]
  reg  s1_info_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T_2 = ~s1_info_dirInfo_hit; // @[ICache.scala 254:25]
  wire  _s1_valid_T_3 = refillPipe_io_req_ready & refillPipe_io_req_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_4 = ~s1_info_dirInfo_hit & _s1_valid_T_3; // @[ICache.scala 254:46]
  wire  s1_valid = s1_full & (s1_info_dirInfo_hit & io_read_resp_valid | _s1_valid_T_4); // @[ICache.scala 253:25]
  reg  s2_full; // @[ICache.scala 265:26]
  reg  s2_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s2_valid_T = ~s2_dirInfo_hit; // @[ICache.scala 288:47]
  wire  s2_fire = s2_full & (s2_dirInfo_hit | ~s2_dirInfo_hit & io_read_resp_valid); // @[ICache.scala 288:25]
  wire  s2_ready = ~s2_full | s2_fire; // @[ICache.scala 272:26]
  wire  s1_fire = s1_valid & s2_ready; // @[ICache.scala 241:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[ICache.scala 243:26]
  wire  s1_latch = loadQueue_io_deq_valid & s1_ready; // @[ICache.scala 240:43]
  reg [31:0] s1_info_req_addr; // @[Reg.scala 19:16]
  reg [7:0] s1_info_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_0; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_1; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_2; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_3; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_4; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_5; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_6; // @[Reg.scala 19:16]
  reg [31:0] s1_info_rdData_7; // @[Reg.scala 19:16]
  wire  _GEN_24 = s1_full & s1_fire ? 1'h0 : s1_full; // @[ICache.scala 239:26 247:{35,45}]
  wire  _GEN_25 = s1_latch | _GEN_24; // @[ICache.scala 246:{20,30}]
  wire  _GEN_31 = s2_full & s2_fire ? 1'h0 : s2_full; // @[ICache.scala 265:26 275:{35,45}]
  wire  _GEN_32 = s1_fire | _GEN_31; // @[ICache.scala 274:{20,30}]
  wire  _io_read_resp_valid_T_3 = refillPipe_io_resp_ready & refillPipe_io_resp_valid; // @[Decoupled.scala 51:35]
  wire  _io_read_resp_valid_T_4 = _s2_valid_T & s2_full & _io_read_resp_valid_T_3; // @[ICache.scala 292:56]
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
  DataBankArray db ( // @[ICache.scala 173:20]
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
  DCacheDirectory dir ( // @[ICache.scala 174:21]
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
  RefillPipe refillPipe ( // @[ICache.scala 175:28]
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
  Queue loadQueue ( // @[ICache.scala 182:27]
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
  assign io_read_req_ready = loadQueue_io_enq_ready; // @[ICache.scala 198:23]
  assign io_read_resp_valid = s1_info_dirInfo_hit & s1_full | _io_read_resp_valid_T_4; // @[ICache.scala 291:58]
  assign io_read_resp_bits_data = s1_info_dirInfo_hit ? _io_read_resp_bits_data_T_22 : refillPipe_io_resp_bits_data; // @[ICache.scala 293:34]
  assign io_tlbus_req_valid = refillPipe_io_tlbus_req_valid; // @[ICache.scala 180:25]
  assign io_tlbus_req_bits_address = refillPipe_io_tlbus_req_bits_address; // @[ICache.scala 180:25]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 208:38]
  assign db_io_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign db_io_read_req_bits_blockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  assign db_io_write_req_valid = refillPipe_io_dataWrite_req_valid; // @[ICache.scala 178:33]
  assign db_io_write_req_bits_data = refillPipe_io_dataWrite_req_bits_data; // @[ICache.scala 178:33]
  assign db_io_write_req_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[ICache.scala 178:33]
  assign db_io_write_req_bits_blockSelOH = refillPipe_io_dataWrite_req_bits_blockSelOH; // @[ICache.scala 178:33]
  assign db_io_write_req_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[ICache.scala 178:33]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = s0_latch | s0_full; // @[ICache.scala 212:39]
  assign dir_io_read_req_bits_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 196:21]
  assign dir_io_write_req_valid = refillPipe_io_dirWrite_req_valid; // @[ICache.scala 179:32]
  assign dir_io_write_req_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[ICache.scala 179:32]
  assign dir_io_write_req_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[ICache.scala 179:32]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = _s1_valid_T_2 & s1_full; // @[ICache.scala 249:53]
  assign refillPipe_io_req_bits_addr = s1_info_req_addr; // @[ICache.scala 250:33]
  assign refillPipe_io_req_bits_chosenWay = s1_info_dirInfo_chosenWay; // @[ICache.scala 251:38]
  assign refillPipe_io_resp_ready = 1'h1; // @[ICache.scala 297:30]
  assign refillPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 180:25]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 180:25]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 180:25]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 180:25]
  assign loadQueue_clock = clock;
  assign loadQueue_reset = reset;
  assign loadQueue_io_enq_valid = s0_full; // @[ICache.scala 184:24 215:14]
  assign loadQueue_io_enq_bits_req_addr = s0_latch ? io_read_req_bits_addr : s0_req_r_addr; // @[ICache.scala 196:21]
  assign loadQueue_io_enq_bits_dirInfo_hit = dir_io_read_resp_bits_hit; // @[ICache.scala 230:35]
  assign loadQueue_io_enq_bits_dirInfo_chosenWay = dir_io_read_resp_bits_chosenWay; // @[ICache.scala 230:35]
  assign loadQueue_io_enq_bits_rdData_0 = db_io_read_resp_bits_data_0; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_1 = db_io_read_resp_bits_data_1; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_2 = db_io_read_resp_bits_data_2; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_3 = db_io_read_resp_bits_data_3; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_4 = db_io_read_resp_bits_data_4; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_5 = db_io_read_resp_bits_data_5; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_6 = db_io_read_resp_bits_data_6; // @[ICache.scala 233:34]
  assign loadQueue_io_enq_bits_rdData_7 = db_io_read_resp_bits_data_7; // @[ICache.scala 233:34]
  assign loadQueue_io_deq_ready = ~s1_full | s1_fire; // @[ICache.scala 243:26]
  always @(posedge clock) begin
    if (reset) begin // @[ICache.scala 193:26]
      s0_full <= 1'h0; // @[ICache.scala 193:26]
    end else begin
      s0_full <= _GEN_2;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_req_r_addr <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 239:26]
      s1_full <= 1'h0; // @[ICache.scala 239:26]
    end else begin
      s1_full <= _GEN_25;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_dirInfo_hit <= loadQueue_io_deq_bits_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[ICache.scala 265:26]
      s2_full <= 1'h0; // @[ICache.scala 265:26]
    end else begin
      s2_full <= _GEN_32;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dirInfo_hit <= s1_info_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_info_req_addr <= loadQueue_io_deq_bits_req_addr; // @[Reg.scala 20:22]
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
  s2_full = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s2_dirInfo_hit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_info_req_addr = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s1_info_dirInfo_chosenWay = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  s1_info_rdData_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s1_info_rdData_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s1_info_rdData_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_info_rdData_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_info_rdData_4 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_info_rdData_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_info_rdData_6 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_info_rdData_7 = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
