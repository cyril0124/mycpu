module Arbiter(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input  [1:0]  io_in_0_bits_stageID,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input  [1:0]  io_in_1_bits_stageID,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [1:0]  io_out_bits_stageID
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_stageID = io_in_0_valid ? io_in_0_bits_stageID : io_in_1_bits_stageID; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module Arbiter_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_address,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
  input  [31:0] io_in_1_bits_address,
  input  [31:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [31:0] io_out_bits_address,
  output [31:0] io_out_bits_data
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_opcode = io_in_0_valid ? 3'h4 : io_in_1_bits_opcode; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_address = io_in_0_valid ? io_in_0_bits_address : io_in_1_bits_address; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data = io_in_0_valid ? 32'h0 : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module LoadPipe(
  input          clock,
  input          reset,
  output         io_load_req_ready,
  input          io_load_req_valid,
  input  [31:0]  io_load_req_bits_addr,
  output         io_load_resp_valid,
  output [31:0]  io_load_resp_bits_data,
  output [1:0]   io_load_resp_bits_stageID,
  output         io_dir_read_req_valid,
  output [31:0]  io_dir_read_req_bits_addr,
  input          io_dir_read_resp_valid,
  input          io_dir_read_resp_bits_hit,
  input  [3:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [3:0]   io_dir_write_req_bits_way,
  output [1:0]   io_dir_write_req_bits_meta,
  output         io_dataBank_read_req_valid,
  output [5:0]   io_dataBank_read_req_bits_set,
  output [1:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [31:0]  io_dataBank_read_resp_bits_data_0,
  input  [31:0]  io_dataBank_read_resp_bits_data_1,
  input  [31:0]  io_dataBank_read_resp_bits_data_2,
  input  [31:0]  io_dataBank_read_resp_bits_data_3,
  input  [127:0] io_dataBank_read_resp_bits_blockData_0,
  input  [127:0] io_dataBank_read_resp_bits_blockData_1,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [5:0]   io_dataBank_write_req_bits_set,
  output [1:0]   io_dataBank_write_req_bits_blockSelOH,
  output [3:0]   io_dataBank_write_req_bits_way,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [2:0]   io_tlbus_req_bits_opcode,
  output [31:0]  io_tlbus_req_bits_address,
  output [31:0]  io_tlbus_req_bits_data,
  output         io_tlbus_resp_ready,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [31:0]  io_tlbus_resp_bits_data
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
`endif // RANDOMIZE_REG_INIT
  wire  loadRespArb_io_in_0_valid; // @[LoadPipe.scala 210:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[LoadPipe.scala 210:29]
  wire [1:0] loadRespArb_io_in_0_bits_stageID; // @[LoadPipe.scala 210:29]
  wire  loadRespArb_io_in_1_ready; // @[LoadPipe.scala 210:29]
  wire  loadRespArb_io_in_1_valid; // @[LoadPipe.scala 210:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[LoadPipe.scala 210:29]
  wire [1:0] loadRespArb_io_in_1_bits_stageID; // @[LoadPipe.scala 210:29]
  wire  loadRespArb_io_out_valid; // @[LoadPipe.scala 210:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[LoadPipe.scala 210:29]
  wire [1:0] loadRespArb_io_out_bits_stageID; // @[LoadPipe.scala 210:29]
  wire  tlbusReqArb_io_in_0_ready; // @[LoadPipe.scala 215:29]
  wire  tlbusReqArb_io_in_0_valid; // @[LoadPipe.scala 215:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[LoadPipe.scala 215:29]
  wire  tlbusReqArb_io_in_1_ready; // @[LoadPipe.scala 215:29]
  wire  tlbusReqArb_io_in_1_valid; // @[LoadPipe.scala 215:29]
  wire [2:0] tlbusReqArb_io_in_1_bits_opcode; // @[LoadPipe.scala 215:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[LoadPipe.scala 215:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_data; // @[LoadPipe.scala 215:29]
  wire  tlbusReqArb_io_out_ready; // @[LoadPipe.scala 215:29]
  wire  tlbusReqArb_io_out_valid; // @[LoadPipe.scala 215:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[LoadPipe.scala 215:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[LoadPipe.scala 215:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[LoadPipe.scala 215:29]
  reg  s0_full; // @[LoadPipe.scala 33:26]
  wire  s0_latch = io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
  wire  _loadMissClean_T = ~io_dir_read_resp_bits_hit; // @[LoadPipe.scala 61:25]
  wire  loadMissClean = ~io_dir_read_resp_bits_hit & ~io_dir_read_resp_bits_isDirtyWay; // @[LoadPipe.scala 61:35]
  wire  s0_tlbusReq_ready = tlbusReqArb_io_in_1_ready; // @[LoadPipe.scala 217:26 80:27]
  reg  s0_putAllBeat; // @[Reg.scala 35:20]
  wire  loadMissDirty = _loadMissClean_T & io_dir_read_resp_bits_isDirtyWay; // @[LoadPipe.scala 62:35]
  wire  s0_tlbusReq_valid = s0_full & (loadMissClean & ~s0_putAllBeat | loadMissDirty & ~s0_putAllBeat); // @[LoadPipe.scala 95:34]
  wire  _s0_valid_T_5 = s0_tlbusReq_ready & s0_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_6 = loadMissClean & _s0_valid_T_5; // @[LoadPipe.scala 110:31]
  wire  _s0_valid_T_7 = io_dir_read_resp_bits_hit & io_load_resp_valid & io_load_resp_bits_stageID == 2'h0 |
    _s0_valid_T_6; // @[LoadPipe.scala 109:84]
  wire  _s0_valid_T_8 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_10 = io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe.scala 111:82]
  wire  _s0_valid_T_11 = loadMissDirty & _s0_valid_T_8 & io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe.scala 111:53]
  wire  _s0_valid_T_12 = _s0_valid_T_7 | _s0_valid_T_11; // @[LoadPipe.scala 110:51]
  wire  s0_valid = s0_full & io_dir_read_resp_valid & _s0_valid_T_12; // @[LoadPipe.scala 108:51]
  reg  s1_full; // @[LoadPipe.scala 117:26]
  wire  s1_ready = ~s1_full; // @[LoadPipe.scala 128:17]
  wire  s0_fire = s0_valid & s1_ready; // @[LoadPipe.scala 35:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] s0_dataBlockSelOH = 2'h1 << _GEN_0[2]; // @[OneHot.scala 57:35]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LoadPipe.scala 33:26 43:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[LoadPipe.scala 42:{20,30}]
  wire [31:0] _s0_rdData_T_4 = io_dir_read_resp_bits_chosenWay[0] ? io_dataBank_read_resp_bits_data_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_rdData_T_5 = io_dir_read_resp_bits_chosenWay[1] ? io_dataBank_read_resp_bits_data_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_rdData_T_6 = io_dir_read_resp_bits_chosenWay[2] ? io_dataBank_read_resp_bits_data_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_rdData_T_7 = io_dir_read_resp_bits_chosenWay[3] ? io_dataBank_read_resp_bits_data_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_rdData_T_8 = _s0_rdData_T_4 | _s0_rdData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s0_rdData_T_9 = _s0_rdData_T_8 | _s0_rdData_T_6; // @[Mux.scala 27:73]
  wire [31:0] s0_rdData = _s0_rdData_T_9 | _s0_rdData_T_7; // @[Mux.scala 27:73]
  reg  s0_beatCounter_value; // @[Counter.scala 61:40]
  wire [1:0] s0_beatOH = 2'h1 << s0_beatCounter_value; // @[OneHot.scala 57:35]
  wire  _s0_putAllBeat_T_1 = s0_beatCounter_value & _s0_valid_T_5; // @[LoadPipe.scala 85:64]
  wire  _GEN_3 = _s0_putAllBeat_T_1 | s0_putAllBeat; // @[Reg.scala 36:18 35:20 36:22]
  wire [2:0] s0_tlbusReq_bits_opcode = loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe.scala 97:35]
  wire [31:0] blockAddr = {_GEN_0[31:3],3'h0}; // @[Cat.scala 33:92]
  wire [2:0] _s0_tlbusReq_bits_address_T = {s0_beatCounter_value, 2'h0}; // @[LoadPipe.scala 100:71]
  wire [31:0] _GEN_24 = {{29'd0}, _s0_tlbusReq_bits_address_T}; // @[LoadPipe.scala 100:47]
  wire [31:0] _s0_tlbusReq_bits_address_T_2 = blockAddr + _GEN_24; // @[LoadPipe.scala 100:47]
  wire [127:0] _s0_tlbusReq_bits_data_T_2 = s0_beatOH[0] ? io_dataBank_read_resp_bits_blockData_0 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_3 = s0_beatOH[1] ? io_dataBank_read_resp_bits_blockData_1 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_4 = _s0_tlbusReq_bits_data_T_2 | _s0_tlbusReq_bits_data_T_3; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_5 = loadMissDirty ? _s0_tlbusReq_bits_data_T_4 : 128'h0; // @[LoadPipe.scala 103:33]
  reg [31:0] s1_rAddr; // @[Reg.scala 19:16]
  reg [3:0] s1_chosenWayOH; // @[Reg.scala 19:16]
  reg  s1_loadHit_r; // @[Reg.scala 19:16]
  wire  s1_loadHit = s1_loadHit_r & s1_full; // @[LoadPipe.scala 123:51]
  reg  s1_loadMissClean_r; // @[Reg.scala 19:16]
  wire  s1_loadMissClean = s1_loadMissClean_r & s1_full; // @[LoadPipe.scala 124:63]
  reg  s1_loadMissDirty_r; // @[Reg.scala 19:16]
  wire  s1_loadMissDirty = s1_loadMissDirty_r & s1_full; // @[LoadPipe.scala 125:63]
  reg [1:0] s1_dataBlockSelOH; // @[Reg.scala 19:16]
  wire  _s1_valid_T_2 = io_load_resp_bits_stageID == 2'h1; // @[LoadPipe.scala 204:84]
  wire  _s1_valid_T_7 = s1_loadMissDirty & io_load_resp_valid & _s1_valid_T_2; // @[LoadPipe.scala 205:55]
  wire  _s1_valid_T_8 = s1_loadMissClean & io_load_resp_valid & io_load_resp_bits_stageID == 2'h1 | _s1_valid_T_7; // @[LoadPipe.scala 204:93]
  wire  s1_fire = _s1_valid_T_8 | s1_loadHit; // @[LoadPipe.scala 205:92]
  wire  _GEN_13 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LoadPipe.scala 117:26 130:{35,45}]
  wire  _GEN_14 = s0_fire | _GEN_13; // @[LoadPipe.scala 129:{20,30}]
  wire  s1_tlbusReq_ready = tlbusReqArb_io_in_0_ready; // @[LoadPipe.scala 133:27 216:26]
  reg  s1_sendGet; // @[Reg.scala 35:20]
  wire  s1_tlbusReq_valid = s1_loadMissDirty & ~s1_sendGet; // @[LoadPipe.scala 135:43]
  wire  _s1_sendGet_T = s1_tlbusReq_ready & s1_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_15 = _s1_sendGet_T | s1_sendGet; // @[Reg.scala 36:18 35:20 36:22]
  wire  s1_refillFire = io_tlbus_resp_bits_opcode == 3'h1 & _s0_valid_T_8; // @[LoadPipe.scala 148:67]
  reg  s1_beatCounter_value; // @[Counter.scala 61:40]
  reg [31:0] s1_refillBlockDataArray_0; // @[LoadPipe.scala 158:42]
  wire [31:0] _s1_readRespData_T_2 = s1_dataBlockSelOH[0] ? s1_refillBlockDataArray_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_readRespData_T_3 = s1_dataBlockSelOH[1] ? io_tlbus_resp_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] s1_readRespData = _s1_readRespData_T_2 | _s1_readRespData_T_3; // @[Mux.scala 27:73]
  wire  _s1_loadResp_valid_T = s1_refillFire & s1_beatCounter_value; // @[LoadPipe.scala 199:53]
  wire  _s1_loadResp_valid_T_1 = s0_fire | s1_fire; // @[LoadPipe.scala 199:78]
  reg  s1_loadResp_valid_holdReg; // @[Reg.scala 19:16]
  wire  _GEN_22 = _s1_loadResp_valid_T | s1_loadResp_valid_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s0_rdData_T_10 = s0_rdData; // @[Mux.scala 27:73]
  wire  s0_loadResp_ready = loadRespArb_io_in_1_ready; // @[LoadPipe.scala 212:26 71:27]
  wire  s0_loadResp_valid = io_dir_read_resp_bits_hit & s1_ready & s0_full; // @[LoadPipe.scala 74:46]
  wire [31:0] s0_loadResp_bits_data = s0_rdData; // @[Mux.scala 27:73]
  wire [1:0] s0_loadResp_bits_stageID = 2'h0; // @[LoadPipe.scala 71:27 76:30]
  wire [31:0] _s1_readRespData_T_4 = s1_readRespData; // @[Mux.scala 27:73]
  wire  s1_loadResp_ready = 1'h1; // @[LoadPipe.scala 194:27 211:26]
  wire  s1_loadResp_valid = _GEN_22 & (s1_loadMissClean | s1_loadMissDirty); // @[LoadPipe.scala 199:91]
  wire [31:0] s1_loadResp_bits_data = s1_readRespData; // @[Mux.scala 27:73]
  wire [1:0] s1_loadResp_bits_stageID = 2'h1; // @[LoadPipe.scala 194:27 201:30]
  Arbiter loadRespArb ( // @[LoadPipe.scala 210:29]
    .io_in_0_valid(loadRespArb_io_in_0_valid),
    .io_in_0_bits_data(loadRespArb_io_in_0_bits_data),
    .io_in_0_bits_stageID(loadRespArb_io_in_0_bits_stageID),
    .io_in_1_ready(loadRespArb_io_in_1_ready),
    .io_in_1_valid(loadRespArb_io_in_1_valid),
    .io_in_1_bits_data(loadRespArb_io_in_1_bits_data),
    .io_in_1_bits_stageID(loadRespArb_io_in_1_bits_stageID),
    .io_out_valid(loadRespArb_io_out_valid),
    .io_out_bits_data(loadRespArb_io_out_bits_data),
    .io_out_bits_stageID(loadRespArb_io_out_bits_stageID)
  );
  Arbiter_1 tlbusReqArb ( // @[LoadPipe.scala 215:29]
    .io_in_0_ready(tlbusReqArb_io_in_0_ready),
    .io_in_0_valid(tlbusReqArb_io_in_0_valid),
    .io_in_0_bits_address(tlbusReqArb_io_in_0_bits_address),
    .io_in_1_ready(tlbusReqArb_io_in_1_ready),
    .io_in_1_valid(tlbusReqArb_io_in_1_valid),
    .io_in_1_bits_opcode(tlbusReqArb_io_in_1_bits_opcode),
    .io_in_1_bits_address(tlbusReqArb_io_in_1_bits_address),
    .io_in_1_bits_data(tlbusReqArb_io_in_1_bits_data),
    .io_out_ready(tlbusReqArb_io_out_ready),
    .io_out_valid(tlbusReqArb_io_out_valid),
    .io_out_bits_opcode(tlbusReqArb_io_out_bits_opcode),
    .io_out_bits_address(tlbusReqArb_io_out_bits_address),
    .io_out_bits_data(tlbusReqArb_io_out_bits_data)
  );
  assign io_load_req_ready = ~s0_full; // @[LoadPipe.scala 41:26]
  assign io_load_resp_valid = loadRespArb_io_out_valid; // @[LoadPipe.scala 213:18]
  assign io_load_resp_bits_data = loadRespArb_io_out_bits_data; // @[LoadPipe.scala 213:18]
  assign io_load_resp_bits_stageID = loadRespArb_io_out_bits_stageID; // @[LoadPipe.scala 213:18]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[LoadPipe.scala 46:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[LoadPipe.scala 37:23]
  assign io_dir_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s0_valid_T_8; // @[LoadPipe.scala 148:67]
  assign io_dir_write_req_bits_addr = s1_rAddr; // @[LoadPipe.scala 175:32]
  assign io_dir_write_req_bits_way = s1_chosenWayOH; // @[LoadPipe.scala 176:31]
  assign io_dir_write_req_bits_meta = {1'h0,s1_refillFire}; // @[LoadPipe.scala 180:51]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[LoadPipe.scala 49:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[8:3]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 2'h1 << _GEN_0[2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s0_valid_T_8; // @[LoadPipe.scala 148:67]
  assign io_dataBank_write_req_bits_data = io_tlbus_resp_bits_data; // @[LoadPipe.scala 169:37]
  assign io_dataBank_write_req_bits_set = s1_rAddr[8:3]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_blockSelOH = 2'h1 << s1_beatCounter_value; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s1_chosenWayOH; // @[LoadPipe.scala 168:36]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[LoadPipe.scala 218:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[LoadPipe.scala 218:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[LoadPipe.scala 218:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[LoadPipe.scala 218:18]
  assign io_tlbus_resp_ready = 1'h1; // @[LoadPipe.scala 146:25]
  assign loadRespArb_io_in_0_valid = s1_loadResp_valid; // @[LoadPipe.scala 211:26]
  assign loadRespArb_io_in_0_bits_data = _s1_readRespData_T_4; // @[LoadPipe.scala 211:26]
  assign loadRespArb_io_in_0_bits_stageID = s1_loadResp_bits_stageID; // @[LoadPipe.scala 211:26]
  assign loadRespArb_io_in_1_valid = s0_loadResp_valid; // @[LoadPipe.scala 212:26]
  assign loadRespArb_io_in_1_bits_data = _s0_rdData_T_10; // @[LoadPipe.scala 212:26]
  assign loadRespArb_io_in_1_bits_stageID = s0_loadResp_bits_stageID; // @[LoadPipe.scala 212:26]
  assign tlbusReqArb_io_in_0_valid = s1_loadMissDirty & ~s1_sendGet; // @[LoadPipe.scala 135:43]
  assign tlbusReqArb_io_in_0_bits_address = {s1_rAddr[31:3],3'h0}; // @[Cat.scala 33:92]
  assign tlbusReqArb_io_in_1_valid = s0_full & (loadMissClean & ~s0_putAllBeat | loadMissDirty & ~s0_putAllBeat); // @[LoadPipe.scala 95:34]
  assign tlbusReqArb_io_in_1_bits_opcode = loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe.scala 97:35]
  assign tlbusReqArb_io_in_1_bits_address = loadMissDirty ? _s0_tlbusReq_bits_address_T_2 : blockAddr; // @[LoadPipe.scala 99:36]
  assign tlbusReqArb_io_in_1_bits_data = _s0_tlbusReq_bits_data_T_5[31:0]; // @[LoadPipe.scala 103:27 80:27]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[LoadPipe.scala 218:18]
  always @(posedge clock) begin
    if (reset) begin // @[LoadPipe.scala 33:26]
      s0_full <= 1'h0; // @[LoadPipe.scala 33:26]
    end else begin
      s0_full <= _GEN_2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      s0_putAllBeat <= 1'h0; // @[Reg.scala 35:20]
    end else if (s0_fire) begin // @[LoadPipe.scala 91:19]
      s0_putAllBeat <= 1'h0; // @[LoadPipe.scala 92:23]
    end else begin
      s0_putAllBeat <= _GEN_3;
    end
    if (reset) begin // @[LoadPipe.scala 117:26]
      s1_full <= 1'h0; // @[LoadPipe.scala 117:26]
    end else begin
      s1_full <= _GEN_14;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Counter.scala 61:40]
      s0_beatCounter_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (_s0_valid_T_5 & s0_tlbusReq_bits_opcode == 3'h2) begin // @[LoadPipe.scala 86:71]
      s0_beatCounter_value <= s0_beatCounter_value + 1'h1; // @[Counter.scala 77:15]
    end else if (_s0_valid_T_8 & _s0_valid_T_10) begin // @[LoadPipe.scala 88:79]
      s0_beatCounter_value <= 1'h0; // @[Counter.scala 98:11]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (s0_latch) begin // @[Reg.scala 20:18]
        s1_rAddr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
      end else begin
        s1_rAddr <= s0_reqReg_addr; // @[Reg.scala 19:16]
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_chosenWayOH <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_loadHit_r <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_loadMissClean_r <= loadMissClean; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_loadMissDirty_r <= loadMissDirty; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dataBlockSelOH <= s0_dataBlockSelOH; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_sendGet <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      s1_sendGet <= _GEN_15;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (~s1_beatCounter_value & s1_refillFire) begin // @[LoadPipe.scala 152:41]
      s1_beatCounter_value <= s1_beatCounter_value + 1'h1; // @[Counter.scala 77:15]
    end else if (s0_fire) begin // @[LoadPipe.scala 154:26]
      s1_beatCounter_value <= 1'h0; // @[Counter.scala 98:11]
    end
    if (reset) begin // @[LoadPipe.scala 158:42]
      s1_refillBlockDataArray_0 <= 32'h0; // @[LoadPipe.scala 158:42]
    end else if (s1_refillFire) begin // @[LoadPipe.scala 159:25]
      if (~s1_beatCounter_value) begin // @[LoadPipe.scala 159:73]
        s1_refillBlockDataArray_0 <= io_tlbus_resp_bits_data; // @[LoadPipe.scala 159:73]
      end
    end
    if (_s1_loadResp_valid_T_1) begin // @[util.scala 11:21]
      s1_loadResp_valid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      s1_loadResp_valid_holdReg <= _GEN_22;
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
  s0_putAllBeat = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_full = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s0_beatCounter_value = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_rAddr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s1_chosenWayOH = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  s1_loadHit_r = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_loadMissClean_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_loadMissDirty_r = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_dataBlockSelOH = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s1_sendGet = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_refillBlockDataArray_0 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_loadResp_valid_holdReg = _RAND_14[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BankRam1P_1(
  input         clock,
  input         reset,
  input  [5:0]  io_addr,
  input         io_rw,
  input  [31:0] io_wdata,
  input  [3:0]  io_wmask,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram_0 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_0_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_0_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_1 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_1_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_1_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_2 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_2_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_2_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_3 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [7:0] ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_3_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_3_io_rdata_MPORT_addr_pipe_0;
  wire [15:0] io_rdata_lo = {ram_1_io_rdata_MPORT_data,ram_0_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  wire [15:0] io_rdata_hi = {ram_3_io_rdata_MPORT_data,ram_2_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  assign ram_0_io_rdata_MPORT_en = ram_0_io_rdata_MPORT_en_pipe_0;
  assign ram_0_io_rdata_MPORT_addr = ram_0_io_rdata_MPORT_addr_pipe_0;
  assign ram_0_io_rdata_MPORT_data = ram_0[ram_0_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_0_MPORT_data = 8'h0;
  assign ram_0_MPORT_addr = 6'h0;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = reset;
  assign ram_0_MPORT_1_data = 8'h0;
  assign ram_0_MPORT_1_addr = 6'h1;
  assign ram_0_MPORT_1_mask = 1'h1;
  assign ram_0_MPORT_1_en = reset;
  assign ram_0_MPORT_2_data = 8'h0;
  assign ram_0_MPORT_2_addr = 6'h2;
  assign ram_0_MPORT_2_mask = 1'h1;
  assign ram_0_MPORT_2_en = reset;
  assign ram_0_MPORT_3_data = 8'h0;
  assign ram_0_MPORT_3_addr = 6'h3;
  assign ram_0_MPORT_3_mask = 1'h1;
  assign ram_0_MPORT_3_en = reset;
  assign ram_0_MPORT_4_data = 8'h0;
  assign ram_0_MPORT_4_addr = 6'h4;
  assign ram_0_MPORT_4_mask = 1'h1;
  assign ram_0_MPORT_4_en = reset;
  assign ram_0_MPORT_5_data = 8'h0;
  assign ram_0_MPORT_5_addr = 6'h5;
  assign ram_0_MPORT_5_mask = 1'h1;
  assign ram_0_MPORT_5_en = reset;
  assign ram_0_MPORT_6_data = 8'h0;
  assign ram_0_MPORT_6_addr = 6'h6;
  assign ram_0_MPORT_6_mask = 1'h1;
  assign ram_0_MPORT_6_en = reset;
  assign ram_0_MPORT_7_data = 8'h0;
  assign ram_0_MPORT_7_addr = 6'h7;
  assign ram_0_MPORT_7_mask = 1'h1;
  assign ram_0_MPORT_7_en = reset;
  assign ram_0_MPORT_8_data = 8'h0;
  assign ram_0_MPORT_8_addr = 6'h8;
  assign ram_0_MPORT_8_mask = 1'h1;
  assign ram_0_MPORT_8_en = reset;
  assign ram_0_MPORT_9_data = 8'h0;
  assign ram_0_MPORT_9_addr = 6'h9;
  assign ram_0_MPORT_9_mask = 1'h1;
  assign ram_0_MPORT_9_en = reset;
  assign ram_0_MPORT_10_data = 8'h0;
  assign ram_0_MPORT_10_addr = 6'ha;
  assign ram_0_MPORT_10_mask = 1'h1;
  assign ram_0_MPORT_10_en = reset;
  assign ram_0_MPORT_11_data = 8'h0;
  assign ram_0_MPORT_11_addr = 6'hb;
  assign ram_0_MPORT_11_mask = 1'h1;
  assign ram_0_MPORT_11_en = reset;
  assign ram_0_MPORT_12_data = 8'h0;
  assign ram_0_MPORT_12_addr = 6'hc;
  assign ram_0_MPORT_12_mask = 1'h1;
  assign ram_0_MPORT_12_en = reset;
  assign ram_0_MPORT_13_data = 8'h0;
  assign ram_0_MPORT_13_addr = 6'hd;
  assign ram_0_MPORT_13_mask = 1'h1;
  assign ram_0_MPORT_13_en = reset;
  assign ram_0_MPORT_14_data = 8'h0;
  assign ram_0_MPORT_14_addr = 6'he;
  assign ram_0_MPORT_14_mask = 1'h1;
  assign ram_0_MPORT_14_en = reset;
  assign ram_0_MPORT_15_data = 8'h0;
  assign ram_0_MPORT_15_addr = 6'hf;
  assign ram_0_MPORT_15_mask = 1'h1;
  assign ram_0_MPORT_15_en = reset;
  assign ram_0_MPORT_16_data = 8'h0;
  assign ram_0_MPORT_16_addr = 6'h10;
  assign ram_0_MPORT_16_mask = 1'h1;
  assign ram_0_MPORT_16_en = reset;
  assign ram_0_MPORT_17_data = 8'h0;
  assign ram_0_MPORT_17_addr = 6'h11;
  assign ram_0_MPORT_17_mask = 1'h1;
  assign ram_0_MPORT_17_en = reset;
  assign ram_0_MPORT_18_data = 8'h0;
  assign ram_0_MPORT_18_addr = 6'h12;
  assign ram_0_MPORT_18_mask = 1'h1;
  assign ram_0_MPORT_18_en = reset;
  assign ram_0_MPORT_19_data = 8'h0;
  assign ram_0_MPORT_19_addr = 6'h13;
  assign ram_0_MPORT_19_mask = 1'h1;
  assign ram_0_MPORT_19_en = reset;
  assign ram_0_MPORT_20_data = 8'h0;
  assign ram_0_MPORT_20_addr = 6'h14;
  assign ram_0_MPORT_20_mask = 1'h1;
  assign ram_0_MPORT_20_en = reset;
  assign ram_0_MPORT_21_data = 8'h0;
  assign ram_0_MPORT_21_addr = 6'h15;
  assign ram_0_MPORT_21_mask = 1'h1;
  assign ram_0_MPORT_21_en = reset;
  assign ram_0_MPORT_22_data = 8'h0;
  assign ram_0_MPORT_22_addr = 6'h16;
  assign ram_0_MPORT_22_mask = 1'h1;
  assign ram_0_MPORT_22_en = reset;
  assign ram_0_MPORT_23_data = 8'h0;
  assign ram_0_MPORT_23_addr = 6'h17;
  assign ram_0_MPORT_23_mask = 1'h1;
  assign ram_0_MPORT_23_en = reset;
  assign ram_0_MPORT_24_data = 8'h0;
  assign ram_0_MPORT_24_addr = 6'h18;
  assign ram_0_MPORT_24_mask = 1'h1;
  assign ram_0_MPORT_24_en = reset;
  assign ram_0_MPORT_25_data = 8'h0;
  assign ram_0_MPORT_25_addr = 6'h19;
  assign ram_0_MPORT_25_mask = 1'h1;
  assign ram_0_MPORT_25_en = reset;
  assign ram_0_MPORT_26_data = 8'h0;
  assign ram_0_MPORT_26_addr = 6'h1a;
  assign ram_0_MPORT_26_mask = 1'h1;
  assign ram_0_MPORT_26_en = reset;
  assign ram_0_MPORT_27_data = 8'h0;
  assign ram_0_MPORT_27_addr = 6'h1b;
  assign ram_0_MPORT_27_mask = 1'h1;
  assign ram_0_MPORT_27_en = reset;
  assign ram_0_MPORT_28_data = 8'h0;
  assign ram_0_MPORT_28_addr = 6'h1c;
  assign ram_0_MPORT_28_mask = 1'h1;
  assign ram_0_MPORT_28_en = reset;
  assign ram_0_MPORT_29_data = 8'h0;
  assign ram_0_MPORT_29_addr = 6'h1d;
  assign ram_0_MPORT_29_mask = 1'h1;
  assign ram_0_MPORT_29_en = reset;
  assign ram_0_MPORT_30_data = 8'h0;
  assign ram_0_MPORT_30_addr = 6'h1e;
  assign ram_0_MPORT_30_mask = 1'h1;
  assign ram_0_MPORT_30_en = reset;
  assign ram_0_MPORT_31_data = 8'h0;
  assign ram_0_MPORT_31_addr = 6'h1f;
  assign ram_0_MPORT_31_mask = 1'h1;
  assign ram_0_MPORT_31_en = reset;
  assign ram_0_MPORT_32_data = 8'h0;
  assign ram_0_MPORT_32_addr = 6'h20;
  assign ram_0_MPORT_32_mask = 1'h1;
  assign ram_0_MPORT_32_en = reset;
  assign ram_0_MPORT_33_data = 8'h0;
  assign ram_0_MPORT_33_addr = 6'h21;
  assign ram_0_MPORT_33_mask = 1'h1;
  assign ram_0_MPORT_33_en = reset;
  assign ram_0_MPORT_34_data = 8'h0;
  assign ram_0_MPORT_34_addr = 6'h22;
  assign ram_0_MPORT_34_mask = 1'h1;
  assign ram_0_MPORT_34_en = reset;
  assign ram_0_MPORT_35_data = 8'h0;
  assign ram_0_MPORT_35_addr = 6'h23;
  assign ram_0_MPORT_35_mask = 1'h1;
  assign ram_0_MPORT_35_en = reset;
  assign ram_0_MPORT_36_data = 8'h0;
  assign ram_0_MPORT_36_addr = 6'h24;
  assign ram_0_MPORT_36_mask = 1'h1;
  assign ram_0_MPORT_36_en = reset;
  assign ram_0_MPORT_37_data = 8'h0;
  assign ram_0_MPORT_37_addr = 6'h25;
  assign ram_0_MPORT_37_mask = 1'h1;
  assign ram_0_MPORT_37_en = reset;
  assign ram_0_MPORT_38_data = 8'h0;
  assign ram_0_MPORT_38_addr = 6'h26;
  assign ram_0_MPORT_38_mask = 1'h1;
  assign ram_0_MPORT_38_en = reset;
  assign ram_0_MPORT_39_data = 8'h0;
  assign ram_0_MPORT_39_addr = 6'h27;
  assign ram_0_MPORT_39_mask = 1'h1;
  assign ram_0_MPORT_39_en = reset;
  assign ram_0_MPORT_40_data = 8'h0;
  assign ram_0_MPORT_40_addr = 6'h28;
  assign ram_0_MPORT_40_mask = 1'h1;
  assign ram_0_MPORT_40_en = reset;
  assign ram_0_MPORT_41_data = 8'h0;
  assign ram_0_MPORT_41_addr = 6'h29;
  assign ram_0_MPORT_41_mask = 1'h1;
  assign ram_0_MPORT_41_en = reset;
  assign ram_0_MPORT_42_data = 8'h0;
  assign ram_0_MPORT_42_addr = 6'h2a;
  assign ram_0_MPORT_42_mask = 1'h1;
  assign ram_0_MPORT_42_en = reset;
  assign ram_0_MPORT_43_data = 8'h0;
  assign ram_0_MPORT_43_addr = 6'h2b;
  assign ram_0_MPORT_43_mask = 1'h1;
  assign ram_0_MPORT_43_en = reset;
  assign ram_0_MPORT_44_data = 8'h0;
  assign ram_0_MPORT_44_addr = 6'h2c;
  assign ram_0_MPORT_44_mask = 1'h1;
  assign ram_0_MPORT_44_en = reset;
  assign ram_0_MPORT_45_data = 8'h0;
  assign ram_0_MPORT_45_addr = 6'h2d;
  assign ram_0_MPORT_45_mask = 1'h1;
  assign ram_0_MPORT_45_en = reset;
  assign ram_0_MPORT_46_data = 8'h0;
  assign ram_0_MPORT_46_addr = 6'h2e;
  assign ram_0_MPORT_46_mask = 1'h1;
  assign ram_0_MPORT_46_en = reset;
  assign ram_0_MPORT_47_data = 8'h0;
  assign ram_0_MPORT_47_addr = 6'h2f;
  assign ram_0_MPORT_47_mask = 1'h1;
  assign ram_0_MPORT_47_en = reset;
  assign ram_0_MPORT_48_data = 8'h0;
  assign ram_0_MPORT_48_addr = 6'h30;
  assign ram_0_MPORT_48_mask = 1'h1;
  assign ram_0_MPORT_48_en = reset;
  assign ram_0_MPORT_49_data = 8'h0;
  assign ram_0_MPORT_49_addr = 6'h31;
  assign ram_0_MPORT_49_mask = 1'h1;
  assign ram_0_MPORT_49_en = reset;
  assign ram_0_MPORT_50_data = 8'h0;
  assign ram_0_MPORT_50_addr = 6'h32;
  assign ram_0_MPORT_50_mask = 1'h1;
  assign ram_0_MPORT_50_en = reset;
  assign ram_0_MPORT_51_data = 8'h0;
  assign ram_0_MPORT_51_addr = 6'h33;
  assign ram_0_MPORT_51_mask = 1'h1;
  assign ram_0_MPORT_51_en = reset;
  assign ram_0_MPORT_52_data = 8'h0;
  assign ram_0_MPORT_52_addr = 6'h34;
  assign ram_0_MPORT_52_mask = 1'h1;
  assign ram_0_MPORT_52_en = reset;
  assign ram_0_MPORT_53_data = 8'h0;
  assign ram_0_MPORT_53_addr = 6'h35;
  assign ram_0_MPORT_53_mask = 1'h1;
  assign ram_0_MPORT_53_en = reset;
  assign ram_0_MPORT_54_data = 8'h0;
  assign ram_0_MPORT_54_addr = 6'h36;
  assign ram_0_MPORT_54_mask = 1'h1;
  assign ram_0_MPORT_54_en = reset;
  assign ram_0_MPORT_55_data = 8'h0;
  assign ram_0_MPORT_55_addr = 6'h37;
  assign ram_0_MPORT_55_mask = 1'h1;
  assign ram_0_MPORT_55_en = reset;
  assign ram_0_MPORT_56_data = 8'h0;
  assign ram_0_MPORT_56_addr = 6'h38;
  assign ram_0_MPORT_56_mask = 1'h1;
  assign ram_0_MPORT_56_en = reset;
  assign ram_0_MPORT_57_data = 8'h0;
  assign ram_0_MPORT_57_addr = 6'h39;
  assign ram_0_MPORT_57_mask = 1'h1;
  assign ram_0_MPORT_57_en = reset;
  assign ram_0_MPORT_58_data = 8'h0;
  assign ram_0_MPORT_58_addr = 6'h3a;
  assign ram_0_MPORT_58_mask = 1'h1;
  assign ram_0_MPORT_58_en = reset;
  assign ram_0_MPORT_59_data = 8'h0;
  assign ram_0_MPORT_59_addr = 6'h3b;
  assign ram_0_MPORT_59_mask = 1'h1;
  assign ram_0_MPORT_59_en = reset;
  assign ram_0_MPORT_60_data = 8'h0;
  assign ram_0_MPORT_60_addr = 6'h3c;
  assign ram_0_MPORT_60_mask = 1'h1;
  assign ram_0_MPORT_60_en = reset;
  assign ram_0_MPORT_61_data = 8'h0;
  assign ram_0_MPORT_61_addr = 6'h3d;
  assign ram_0_MPORT_61_mask = 1'h1;
  assign ram_0_MPORT_61_en = reset;
  assign ram_0_MPORT_62_data = 8'h0;
  assign ram_0_MPORT_62_addr = 6'h3e;
  assign ram_0_MPORT_62_mask = 1'h1;
  assign ram_0_MPORT_62_en = reset;
  assign ram_0_MPORT_63_data = 8'h0;
  assign ram_0_MPORT_63_addr = 6'h3f;
  assign ram_0_MPORT_63_mask = 1'h1;
  assign ram_0_MPORT_63_en = reset;
  assign ram_0_MPORT_64_data = io_wdata[7:0];
  assign ram_0_MPORT_64_addr = io_addr;
  assign ram_0_MPORT_64_mask = io_wmask[0];
  assign ram_0_MPORT_64_en = io_rw;
  assign ram_1_io_rdata_MPORT_en = ram_1_io_rdata_MPORT_en_pipe_0;
  assign ram_1_io_rdata_MPORT_addr = ram_1_io_rdata_MPORT_addr_pipe_0;
  assign ram_1_io_rdata_MPORT_data = ram_1[ram_1_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_1_MPORT_data = 8'h0;
  assign ram_1_MPORT_addr = 6'h0;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = reset;
  assign ram_1_MPORT_1_data = 8'h0;
  assign ram_1_MPORT_1_addr = 6'h1;
  assign ram_1_MPORT_1_mask = 1'h1;
  assign ram_1_MPORT_1_en = reset;
  assign ram_1_MPORT_2_data = 8'h0;
  assign ram_1_MPORT_2_addr = 6'h2;
  assign ram_1_MPORT_2_mask = 1'h1;
  assign ram_1_MPORT_2_en = reset;
  assign ram_1_MPORT_3_data = 8'h0;
  assign ram_1_MPORT_3_addr = 6'h3;
  assign ram_1_MPORT_3_mask = 1'h1;
  assign ram_1_MPORT_3_en = reset;
  assign ram_1_MPORT_4_data = 8'h0;
  assign ram_1_MPORT_4_addr = 6'h4;
  assign ram_1_MPORT_4_mask = 1'h1;
  assign ram_1_MPORT_4_en = reset;
  assign ram_1_MPORT_5_data = 8'h0;
  assign ram_1_MPORT_5_addr = 6'h5;
  assign ram_1_MPORT_5_mask = 1'h1;
  assign ram_1_MPORT_5_en = reset;
  assign ram_1_MPORT_6_data = 8'h0;
  assign ram_1_MPORT_6_addr = 6'h6;
  assign ram_1_MPORT_6_mask = 1'h1;
  assign ram_1_MPORT_6_en = reset;
  assign ram_1_MPORT_7_data = 8'h0;
  assign ram_1_MPORT_7_addr = 6'h7;
  assign ram_1_MPORT_7_mask = 1'h1;
  assign ram_1_MPORT_7_en = reset;
  assign ram_1_MPORT_8_data = 8'h0;
  assign ram_1_MPORT_8_addr = 6'h8;
  assign ram_1_MPORT_8_mask = 1'h1;
  assign ram_1_MPORT_8_en = reset;
  assign ram_1_MPORT_9_data = 8'h0;
  assign ram_1_MPORT_9_addr = 6'h9;
  assign ram_1_MPORT_9_mask = 1'h1;
  assign ram_1_MPORT_9_en = reset;
  assign ram_1_MPORT_10_data = 8'h0;
  assign ram_1_MPORT_10_addr = 6'ha;
  assign ram_1_MPORT_10_mask = 1'h1;
  assign ram_1_MPORT_10_en = reset;
  assign ram_1_MPORT_11_data = 8'h0;
  assign ram_1_MPORT_11_addr = 6'hb;
  assign ram_1_MPORT_11_mask = 1'h1;
  assign ram_1_MPORT_11_en = reset;
  assign ram_1_MPORT_12_data = 8'h0;
  assign ram_1_MPORT_12_addr = 6'hc;
  assign ram_1_MPORT_12_mask = 1'h1;
  assign ram_1_MPORT_12_en = reset;
  assign ram_1_MPORT_13_data = 8'h0;
  assign ram_1_MPORT_13_addr = 6'hd;
  assign ram_1_MPORT_13_mask = 1'h1;
  assign ram_1_MPORT_13_en = reset;
  assign ram_1_MPORT_14_data = 8'h0;
  assign ram_1_MPORT_14_addr = 6'he;
  assign ram_1_MPORT_14_mask = 1'h1;
  assign ram_1_MPORT_14_en = reset;
  assign ram_1_MPORT_15_data = 8'h0;
  assign ram_1_MPORT_15_addr = 6'hf;
  assign ram_1_MPORT_15_mask = 1'h1;
  assign ram_1_MPORT_15_en = reset;
  assign ram_1_MPORT_16_data = 8'h0;
  assign ram_1_MPORT_16_addr = 6'h10;
  assign ram_1_MPORT_16_mask = 1'h1;
  assign ram_1_MPORT_16_en = reset;
  assign ram_1_MPORT_17_data = 8'h0;
  assign ram_1_MPORT_17_addr = 6'h11;
  assign ram_1_MPORT_17_mask = 1'h1;
  assign ram_1_MPORT_17_en = reset;
  assign ram_1_MPORT_18_data = 8'h0;
  assign ram_1_MPORT_18_addr = 6'h12;
  assign ram_1_MPORT_18_mask = 1'h1;
  assign ram_1_MPORT_18_en = reset;
  assign ram_1_MPORT_19_data = 8'h0;
  assign ram_1_MPORT_19_addr = 6'h13;
  assign ram_1_MPORT_19_mask = 1'h1;
  assign ram_1_MPORT_19_en = reset;
  assign ram_1_MPORT_20_data = 8'h0;
  assign ram_1_MPORT_20_addr = 6'h14;
  assign ram_1_MPORT_20_mask = 1'h1;
  assign ram_1_MPORT_20_en = reset;
  assign ram_1_MPORT_21_data = 8'h0;
  assign ram_1_MPORT_21_addr = 6'h15;
  assign ram_1_MPORT_21_mask = 1'h1;
  assign ram_1_MPORT_21_en = reset;
  assign ram_1_MPORT_22_data = 8'h0;
  assign ram_1_MPORT_22_addr = 6'h16;
  assign ram_1_MPORT_22_mask = 1'h1;
  assign ram_1_MPORT_22_en = reset;
  assign ram_1_MPORT_23_data = 8'h0;
  assign ram_1_MPORT_23_addr = 6'h17;
  assign ram_1_MPORT_23_mask = 1'h1;
  assign ram_1_MPORT_23_en = reset;
  assign ram_1_MPORT_24_data = 8'h0;
  assign ram_1_MPORT_24_addr = 6'h18;
  assign ram_1_MPORT_24_mask = 1'h1;
  assign ram_1_MPORT_24_en = reset;
  assign ram_1_MPORT_25_data = 8'h0;
  assign ram_1_MPORT_25_addr = 6'h19;
  assign ram_1_MPORT_25_mask = 1'h1;
  assign ram_1_MPORT_25_en = reset;
  assign ram_1_MPORT_26_data = 8'h0;
  assign ram_1_MPORT_26_addr = 6'h1a;
  assign ram_1_MPORT_26_mask = 1'h1;
  assign ram_1_MPORT_26_en = reset;
  assign ram_1_MPORT_27_data = 8'h0;
  assign ram_1_MPORT_27_addr = 6'h1b;
  assign ram_1_MPORT_27_mask = 1'h1;
  assign ram_1_MPORT_27_en = reset;
  assign ram_1_MPORT_28_data = 8'h0;
  assign ram_1_MPORT_28_addr = 6'h1c;
  assign ram_1_MPORT_28_mask = 1'h1;
  assign ram_1_MPORT_28_en = reset;
  assign ram_1_MPORT_29_data = 8'h0;
  assign ram_1_MPORT_29_addr = 6'h1d;
  assign ram_1_MPORT_29_mask = 1'h1;
  assign ram_1_MPORT_29_en = reset;
  assign ram_1_MPORT_30_data = 8'h0;
  assign ram_1_MPORT_30_addr = 6'h1e;
  assign ram_1_MPORT_30_mask = 1'h1;
  assign ram_1_MPORT_30_en = reset;
  assign ram_1_MPORT_31_data = 8'h0;
  assign ram_1_MPORT_31_addr = 6'h1f;
  assign ram_1_MPORT_31_mask = 1'h1;
  assign ram_1_MPORT_31_en = reset;
  assign ram_1_MPORT_32_data = 8'h0;
  assign ram_1_MPORT_32_addr = 6'h20;
  assign ram_1_MPORT_32_mask = 1'h1;
  assign ram_1_MPORT_32_en = reset;
  assign ram_1_MPORT_33_data = 8'h0;
  assign ram_1_MPORT_33_addr = 6'h21;
  assign ram_1_MPORT_33_mask = 1'h1;
  assign ram_1_MPORT_33_en = reset;
  assign ram_1_MPORT_34_data = 8'h0;
  assign ram_1_MPORT_34_addr = 6'h22;
  assign ram_1_MPORT_34_mask = 1'h1;
  assign ram_1_MPORT_34_en = reset;
  assign ram_1_MPORT_35_data = 8'h0;
  assign ram_1_MPORT_35_addr = 6'h23;
  assign ram_1_MPORT_35_mask = 1'h1;
  assign ram_1_MPORT_35_en = reset;
  assign ram_1_MPORT_36_data = 8'h0;
  assign ram_1_MPORT_36_addr = 6'h24;
  assign ram_1_MPORT_36_mask = 1'h1;
  assign ram_1_MPORT_36_en = reset;
  assign ram_1_MPORT_37_data = 8'h0;
  assign ram_1_MPORT_37_addr = 6'h25;
  assign ram_1_MPORT_37_mask = 1'h1;
  assign ram_1_MPORT_37_en = reset;
  assign ram_1_MPORT_38_data = 8'h0;
  assign ram_1_MPORT_38_addr = 6'h26;
  assign ram_1_MPORT_38_mask = 1'h1;
  assign ram_1_MPORT_38_en = reset;
  assign ram_1_MPORT_39_data = 8'h0;
  assign ram_1_MPORT_39_addr = 6'h27;
  assign ram_1_MPORT_39_mask = 1'h1;
  assign ram_1_MPORT_39_en = reset;
  assign ram_1_MPORT_40_data = 8'h0;
  assign ram_1_MPORT_40_addr = 6'h28;
  assign ram_1_MPORT_40_mask = 1'h1;
  assign ram_1_MPORT_40_en = reset;
  assign ram_1_MPORT_41_data = 8'h0;
  assign ram_1_MPORT_41_addr = 6'h29;
  assign ram_1_MPORT_41_mask = 1'h1;
  assign ram_1_MPORT_41_en = reset;
  assign ram_1_MPORT_42_data = 8'h0;
  assign ram_1_MPORT_42_addr = 6'h2a;
  assign ram_1_MPORT_42_mask = 1'h1;
  assign ram_1_MPORT_42_en = reset;
  assign ram_1_MPORT_43_data = 8'h0;
  assign ram_1_MPORT_43_addr = 6'h2b;
  assign ram_1_MPORT_43_mask = 1'h1;
  assign ram_1_MPORT_43_en = reset;
  assign ram_1_MPORT_44_data = 8'h0;
  assign ram_1_MPORT_44_addr = 6'h2c;
  assign ram_1_MPORT_44_mask = 1'h1;
  assign ram_1_MPORT_44_en = reset;
  assign ram_1_MPORT_45_data = 8'h0;
  assign ram_1_MPORT_45_addr = 6'h2d;
  assign ram_1_MPORT_45_mask = 1'h1;
  assign ram_1_MPORT_45_en = reset;
  assign ram_1_MPORT_46_data = 8'h0;
  assign ram_1_MPORT_46_addr = 6'h2e;
  assign ram_1_MPORT_46_mask = 1'h1;
  assign ram_1_MPORT_46_en = reset;
  assign ram_1_MPORT_47_data = 8'h0;
  assign ram_1_MPORT_47_addr = 6'h2f;
  assign ram_1_MPORT_47_mask = 1'h1;
  assign ram_1_MPORT_47_en = reset;
  assign ram_1_MPORT_48_data = 8'h0;
  assign ram_1_MPORT_48_addr = 6'h30;
  assign ram_1_MPORT_48_mask = 1'h1;
  assign ram_1_MPORT_48_en = reset;
  assign ram_1_MPORT_49_data = 8'h0;
  assign ram_1_MPORT_49_addr = 6'h31;
  assign ram_1_MPORT_49_mask = 1'h1;
  assign ram_1_MPORT_49_en = reset;
  assign ram_1_MPORT_50_data = 8'h0;
  assign ram_1_MPORT_50_addr = 6'h32;
  assign ram_1_MPORT_50_mask = 1'h1;
  assign ram_1_MPORT_50_en = reset;
  assign ram_1_MPORT_51_data = 8'h0;
  assign ram_1_MPORT_51_addr = 6'h33;
  assign ram_1_MPORT_51_mask = 1'h1;
  assign ram_1_MPORT_51_en = reset;
  assign ram_1_MPORT_52_data = 8'h0;
  assign ram_1_MPORT_52_addr = 6'h34;
  assign ram_1_MPORT_52_mask = 1'h1;
  assign ram_1_MPORT_52_en = reset;
  assign ram_1_MPORT_53_data = 8'h0;
  assign ram_1_MPORT_53_addr = 6'h35;
  assign ram_1_MPORT_53_mask = 1'h1;
  assign ram_1_MPORT_53_en = reset;
  assign ram_1_MPORT_54_data = 8'h0;
  assign ram_1_MPORT_54_addr = 6'h36;
  assign ram_1_MPORT_54_mask = 1'h1;
  assign ram_1_MPORT_54_en = reset;
  assign ram_1_MPORT_55_data = 8'h0;
  assign ram_1_MPORT_55_addr = 6'h37;
  assign ram_1_MPORT_55_mask = 1'h1;
  assign ram_1_MPORT_55_en = reset;
  assign ram_1_MPORT_56_data = 8'h0;
  assign ram_1_MPORT_56_addr = 6'h38;
  assign ram_1_MPORT_56_mask = 1'h1;
  assign ram_1_MPORT_56_en = reset;
  assign ram_1_MPORT_57_data = 8'h0;
  assign ram_1_MPORT_57_addr = 6'h39;
  assign ram_1_MPORT_57_mask = 1'h1;
  assign ram_1_MPORT_57_en = reset;
  assign ram_1_MPORT_58_data = 8'h0;
  assign ram_1_MPORT_58_addr = 6'h3a;
  assign ram_1_MPORT_58_mask = 1'h1;
  assign ram_1_MPORT_58_en = reset;
  assign ram_1_MPORT_59_data = 8'h0;
  assign ram_1_MPORT_59_addr = 6'h3b;
  assign ram_1_MPORT_59_mask = 1'h1;
  assign ram_1_MPORT_59_en = reset;
  assign ram_1_MPORT_60_data = 8'h0;
  assign ram_1_MPORT_60_addr = 6'h3c;
  assign ram_1_MPORT_60_mask = 1'h1;
  assign ram_1_MPORT_60_en = reset;
  assign ram_1_MPORT_61_data = 8'h0;
  assign ram_1_MPORT_61_addr = 6'h3d;
  assign ram_1_MPORT_61_mask = 1'h1;
  assign ram_1_MPORT_61_en = reset;
  assign ram_1_MPORT_62_data = 8'h0;
  assign ram_1_MPORT_62_addr = 6'h3e;
  assign ram_1_MPORT_62_mask = 1'h1;
  assign ram_1_MPORT_62_en = reset;
  assign ram_1_MPORT_63_data = 8'h0;
  assign ram_1_MPORT_63_addr = 6'h3f;
  assign ram_1_MPORT_63_mask = 1'h1;
  assign ram_1_MPORT_63_en = reset;
  assign ram_1_MPORT_64_data = io_wdata[15:8];
  assign ram_1_MPORT_64_addr = io_addr;
  assign ram_1_MPORT_64_mask = io_wmask[1];
  assign ram_1_MPORT_64_en = io_rw;
  assign ram_2_io_rdata_MPORT_en = ram_2_io_rdata_MPORT_en_pipe_0;
  assign ram_2_io_rdata_MPORT_addr = ram_2_io_rdata_MPORT_addr_pipe_0;
  assign ram_2_io_rdata_MPORT_data = ram_2[ram_2_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_2_MPORT_data = 8'h0;
  assign ram_2_MPORT_addr = 6'h0;
  assign ram_2_MPORT_mask = 1'h1;
  assign ram_2_MPORT_en = reset;
  assign ram_2_MPORT_1_data = 8'h0;
  assign ram_2_MPORT_1_addr = 6'h1;
  assign ram_2_MPORT_1_mask = 1'h1;
  assign ram_2_MPORT_1_en = reset;
  assign ram_2_MPORT_2_data = 8'h0;
  assign ram_2_MPORT_2_addr = 6'h2;
  assign ram_2_MPORT_2_mask = 1'h1;
  assign ram_2_MPORT_2_en = reset;
  assign ram_2_MPORT_3_data = 8'h0;
  assign ram_2_MPORT_3_addr = 6'h3;
  assign ram_2_MPORT_3_mask = 1'h1;
  assign ram_2_MPORT_3_en = reset;
  assign ram_2_MPORT_4_data = 8'h0;
  assign ram_2_MPORT_4_addr = 6'h4;
  assign ram_2_MPORT_4_mask = 1'h1;
  assign ram_2_MPORT_4_en = reset;
  assign ram_2_MPORT_5_data = 8'h0;
  assign ram_2_MPORT_5_addr = 6'h5;
  assign ram_2_MPORT_5_mask = 1'h1;
  assign ram_2_MPORT_5_en = reset;
  assign ram_2_MPORT_6_data = 8'h0;
  assign ram_2_MPORT_6_addr = 6'h6;
  assign ram_2_MPORT_6_mask = 1'h1;
  assign ram_2_MPORT_6_en = reset;
  assign ram_2_MPORT_7_data = 8'h0;
  assign ram_2_MPORT_7_addr = 6'h7;
  assign ram_2_MPORT_7_mask = 1'h1;
  assign ram_2_MPORT_7_en = reset;
  assign ram_2_MPORT_8_data = 8'h0;
  assign ram_2_MPORT_8_addr = 6'h8;
  assign ram_2_MPORT_8_mask = 1'h1;
  assign ram_2_MPORT_8_en = reset;
  assign ram_2_MPORT_9_data = 8'h0;
  assign ram_2_MPORT_9_addr = 6'h9;
  assign ram_2_MPORT_9_mask = 1'h1;
  assign ram_2_MPORT_9_en = reset;
  assign ram_2_MPORT_10_data = 8'h0;
  assign ram_2_MPORT_10_addr = 6'ha;
  assign ram_2_MPORT_10_mask = 1'h1;
  assign ram_2_MPORT_10_en = reset;
  assign ram_2_MPORT_11_data = 8'h0;
  assign ram_2_MPORT_11_addr = 6'hb;
  assign ram_2_MPORT_11_mask = 1'h1;
  assign ram_2_MPORT_11_en = reset;
  assign ram_2_MPORT_12_data = 8'h0;
  assign ram_2_MPORT_12_addr = 6'hc;
  assign ram_2_MPORT_12_mask = 1'h1;
  assign ram_2_MPORT_12_en = reset;
  assign ram_2_MPORT_13_data = 8'h0;
  assign ram_2_MPORT_13_addr = 6'hd;
  assign ram_2_MPORT_13_mask = 1'h1;
  assign ram_2_MPORT_13_en = reset;
  assign ram_2_MPORT_14_data = 8'h0;
  assign ram_2_MPORT_14_addr = 6'he;
  assign ram_2_MPORT_14_mask = 1'h1;
  assign ram_2_MPORT_14_en = reset;
  assign ram_2_MPORT_15_data = 8'h0;
  assign ram_2_MPORT_15_addr = 6'hf;
  assign ram_2_MPORT_15_mask = 1'h1;
  assign ram_2_MPORT_15_en = reset;
  assign ram_2_MPORT_16_data = 8'h0;
  assign ram_2_MPORT_16_addr = 6'h10;
  assign ram_2_MPORT_16_mask = 1'h1;
  assign ram_2_MPORT_16_en = reset;
  assign ram_2_MPORT_17_data = 8'h0;
  assign ram_2_MPORT_17_addr = 6'h11;
  assign ram_2_MPORT_17_mask = 1'h1;
  assign ram_2_MPORT_17_en = reset;
  assign ram_2_MPORT_18_data = 8'h0;
  assign ram_2_MPORT_18_addr = 6'h12;
  assign ram_2_MPORT_18_mask = 1'h1;
  assign ram_2_MPORT_18_en = reset;
  assign ram_2_MPORT_19_data = 8'h0;
  assign ram_2_MPORT_19_addr = 6'h13;
  assign ram_2_MPORT_19_mask = 1'h1;
  assign ram_2_MPORT_19_en = reset;
  assign ram_2_MPORT_20_data = 8'h0;
  assign ram_2_MPORT_20_addr = 6'h14;
  assign ram_2_MPORT_20_mask = 1'h1;
  assign ram_2_MPORT_20_en = reset;
  assign ram_2_MPORT_21_data = 8'h0;
  assign ram_2_MPORT_21_addr = 6'h15;
  assign ram_2_MPORT_21_mask = 1'h1;
  assign ram_2_MPORT_21_en = reset;
  assign ram_2_MPORT_22_data = 8'h0;
  assign ram_2_MPORT_22_addr = 6'h16;
  assign ram_2_MPORT_22_mask = 1'h1;
  assign ram_2_MPORT_22_en = reset;
  assign ram_2_MPORT_23_data = 8'h0;
  assign ram_2_MPORT_23_addr = 6'h17;
  assign ram_2_MPORT_23_mask = 1'h1;
  assign ram_2_MPORT_23_en = reset;
  assign ram_2_MPORT_24_data = 8'h0;
  assign ram_2_MPORT_24_addr = 6'h18;
  assign ram_2_MPORT_24_mask = 1'h1;
  assign ram_2_MPORT_24_en = reset;
  assign ram_2_MPORT_25_data = 8'h0;
  assign ram_2_MPORT_25_addr = 6'h19;
  assign ram_2_MPORT_25_mask = 1'h1;
  assign ram_2_MPORT_25_en = reset;
  assign ram_2_MPORT_26_data = 8'h0;
  assign ram_2_MPORT_26_addr = 6'h1a;
  assign ram_2_MPORT_26_mask = 1'h1;
  assign ram_2_MPORT_26_en = reset;
  assign ram_2_MPORT_27_data = 8'h0;
  assign ram_2_MPORT_27_addr = 6'h1b;
  assign ram_2_MPORT_27_mask = 1'h1;
  assign ram_2_MPORT_27_en = reset;
  assign ram_2_MPORT_28_data = 8'h0;
  assign ram_2_MPORT_28_addr = 6'h1c;
  assign ram_2_MPORT_28_mask = 1'h1;
  assign ram_2_MPORT_28_en = reset;
  assign ram_2_MPORT_29_data = 8'h0;
  assign ram_2_MPORT_29_addr = 6'h1d;
  assign ram_2_MPORT_29_mask = 1'h1;
  assign ram_2_MPORT_29_en = reset;
  assign ram_2_MPORT_30_data = 8'h0;
  assign ram_2_MPORT_30_addr = 6'h1e;
  assign ram_2_MPORT_30_mask = 1'h1;
  assign ram_2_MPORT_30_en = reset;
  assign ram_2_MPORT_31_data = 8'h0;
  assign ram_2_MPORT_31_addr = 6'h1f;
  assign ram_2_MPORT_31_mask = 1'h1;
  assign ram_2_MPORT_31_en = reset;
  assign ram_2_MPORT_32_data = 8'h0;
  assign ram_2_MPORT_32_addr = 6'h20;
  assign ram_2_MPORT_32_mask = 1'h1;
  assign ram_2_MPORT_32_en = reset;
  assign ram_2_MPORT_33_data = 8'h0;
  assign ram_2_MPORT_33_addr = 6'h21;
  assign ram_2_MPORT_33_mask = 1'h1;
  assign ram_2_MPORT_33_en = reset;
  assign ram_2_MPORT_34_data = 8'h0;
  assign ram_2_MPORT_34_addr = 6'h22;
  assign ram_2_MPORT_34_mask = 1'h1;
  assign ram_2_MPORT_34_en = reset;
  assign ram_2_MPORT_35_data = 8'h0;
  assign ram_2_MPORT_35_addr = 6'h23;
  assign ram_2_MPORT_35_mask = 1'h1;
  assign ram_2_MPORT_35_en = reset;
  assign ram_2_MPORT_36_data = 8'h0;
  assign ram_2_MPORT_36_addr = 6'h24;
  assign ram_2_MPORT_36_mask = 1'h1;
  assign ram_2_MPORT_36_en = reset;
  assign ram_2_MPORT_37_data = 8'h0;
  assign ram_2_MPORT_37_addr = 6'h25;
  assign ram_2_MPORT_37_mask = 1'h1;
  assign ram_2_MPORT_37_en = reset;
  assign ram_2_MPORT_38_data = 8'h0;
  assign ram_2_MPORT_38_addr = 6'h26;
  assign ram_2_MPORT_38_mask = 1'h1;
  assign ram_2_MPORT_38_en = reset;
  assign ram_2_MPORT_39_data = 8'h0;
  assign ram_2_MPORT_39_addr = 6'h27;
  assign ram_2_MPORT_39_mask = 1'h1;
  assign ram_2_MPORT_39_en = reset;
  assign ram_2_MPORT_40_data = 8'h0;
  assign ram_2_MPORT_40_addr = 6'h28;
  assign ram_2_MPORT_40_mask = 1'h1;
  assign ram_2_MPORT_40_en = reset;
  assign ram_2_MPORT_41_data = 8'h0;
  assign ram_2_MPORT_41_addr = 6'h29;
  assign ram_2_MPORT_41_mask = 1'h1;
  assign ram_2_MPORT_41_en = reset;
  assign ram_2_MPORT_42_data = 8'h0;
  assign ram_2_MPORT_42_addr = 6'h2a;
  assign ram_2_MPORT_42_mask = 1'h1;
  assign ram_2_MPORT_42_en = reset;
  assign ram_2_MPORT_43_data = 8'h0;
  assign ram_2_MPORT_43_addr = 6'h2b;
  assign ram_2_MPORT_43_mask = 1'h1;
  assign ram_2_MPORT_43_en = reset;
  assign ram_2_MPORT_44_data = 8'h0;
  assign ram_2_MPORT_44_addr = 6'h2c;
  assign ram_2_MPORT_44_mask = 1'h1;
  assign ram_2_MPORT_44_en = reset;
  assign ram_2_MPORT_45_data = 8'h0;
  assign ram_2_MPORT_45_addr = 6'h2d;
  assign ram_2_MPORT_45_mask = 1'h1;
  assign ram_2_MPORT_45_en = reset;
  assign ram_2_MPORT_46_data = 8'h0;
  assign ram_2_MPORT_46_addr = 6'h2e;
  assign ram_2_MPORT_46_mask = 1'h1;
  assign ram_2_MPORT_46_en = reset;
  assign ram_2_MPORT_47_data = 8'h0;
  assign ram_2_MPORT_47_addr = 6'h2f;
  assign ram_2_MPORT_47_mask = 1'h1;
  assign ram_2_MPORT_47_en = reset;
  assign ram_2_MPORT_48_data = 8'h0;
  assign ram_2_MPORT_48_addr = 6'h30;
  assign ram_2_MPORT_48_mask = 1'h1;
  assign ram_2_MPORT_48_en = reset;
  assign ram_2_MPORT_49_data = 8'h0;
  assign ram_2_MPORT_49_addr = 6'h31;
  assign ram_2_MPORT_49_mask = 1'h1;
  assign ram_2_MPORT_49_en = reset;
  assign ram_2_MPORT_50_data = 8'h0;
  assign ram_2_MPORT_50_addr = 6'h32;
  assign ram_2_MPORT_50_mask = 1'h1;
  assign ram_2_MPORT_50_en = reset;
  assign ram_2_MPORT_51_data = 8'h0;
  assign ram_2_MPORT_51_addr = 6'h33;
  assign ram_2_MPORT_51_mask = 1'h1;
  assign ram_2_MPORT_51_en = reset;
  assign ram_2_MPORT_52_data = 8'h0;
  assign ram_2_MPORT_52_addr = 6'h34;
  assign ram_2_MPORT_52_mask = 1'h1;
  assign ram_2_MPORT_52_en = reset;
  assign ram_2_MPORT_53_data = 8'h0;
  assign ram_2_MPORT_53_addr = 6'h35;
  assign ram_2_MPORT_53_mask = 1'h1;
  assign ram_2_MPORT_53_en = reset;
  assign ram_2_MPORT_54_data = 8'h0;
  assign ram_2_MPORT_54_addr = 6'h36;
  assign ram_2_MPORT_54_mask = 1'h1;
  assign ram_2_MPORT_54_en = reset;
  assign ram_2_MPORT_55_data = 8'h0;
  assign ram_2_MPORT_55_addr = 6'h37;
  assign ram_2_MPORT_55_mask = 1'h1;
  assign ram_2_MPORT_55_en = reset;
  assign ram_2_MPORT_56_data = 8'h0;
  assign ram_2_MPORT_56_addr = 6'h38;
  assign ram_2_MPORT_56_mask = 1'h1;
  assign ram_2_MPORT_56_en = reset;
  assign ram_2_MPORT_57_data = 8'h0;
  assign ram_2_MPORT_57_addr = 6'h39;
  assign ram_2_MPORT_57_mask = 1'h1;
  assign ram_2_MPORT_57_en = reset;
  assign ram_2_MPORT_58_data = 8'h0;
  assign ram_2_MPORT_58_addr = 6'h3a;
  assign ram_2_MPORT_58_mask = 1'h1;
  assign ram_2_MPORT_58_en = reset;
  assign ram_2_MPORT_59_data = 8'h0;
  assign ram_2_MPORT_59_addr = 6'h3b;
  assign ram_2_MPORT_59_mask = 1'h1;
  assign ram_2_MPORT_59_en = reset;
  assign ram_2_MPORT_60_data = 8'h0;
  assign ram_2_MPORT_60_addr = 6'h3c;
  assign ram_2_MPORT_60_mask = 1'h1;
  assign ram_2_MPORT_60_en = reset;
  assign ram_2_MPORT_61_data = 8'h0;
  assign ram_2_MPORT_61_addr = 6'h3d;
  assign ram_2_MPORT_61_mask = 1'h1;
  assign ram_2_MPORT_61_en = reset;
  assign ram_2_MPORT_62_data = 8'h0;
  assign ram_2_MPORT_62_addr = 6'h3e;
  assign ram_2_MPORT_62_mask = 1'h1;
  assign ram_2_MPORT_62_en = reset;
  assign ram_2_MPORT_63_data = 8'h0;
  assign ram_2_MPORT_63_addr = 6'h3f;
  assign ram_2_MPORT_63_mask = 1'h1;
  assign ram_2_MPORT_63_en = reset;
  assign ram_2_MPORT_64_data = io_wdata[23:16];
  assign ram_2_MPORT_64_addr = io_addr;
  assign ram_2_MPORT_64_mask = io_wmask[2];
  assign ram_2_MPORT_64_en = io_rw;
  assign ram_3_io_rdata_MPORT_en = ram_3_io_rdata_MPORT_en_pipe_0;
  assign ram_3_io_rdata_MPORT_addr = ram_3_io_rdata_MPORT_addr_pipe_0;
  assign ram_3_io_rdata_MPORT_data = ram_3[ram_3_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_3_MPORT_data = 8'h0;
  assign ram_3_MPORT_addr = 6'h0;
  assign ram_3_MPORT_mask = 1'h1;
  assign ram_3_MPORT_en = reset;
  assign ram_3_MPORT_1_data = 8'h0;
  assign ram_3_MPORT_1_addr = 6'h1;
  assign ram_3_MPORT_1_mask = 1'h1;
  assign ram_3_MPORT_1_en = reset;
  assign ram_3_MPORT_2_data = 8'h0;
  assign ram_3_MPORT_2_addr = 6'h2;
  assign ram_3_MPORT_2_mask = 1'h1;
  assign ram_3_MPORT_2_en = reset;
  assign ram_3_MPORT_3_data = 8'h0;
  assign ram_3_MPORT_3_addr = 6'h3;
  assign ram_3_MPORT_3_mask = 1'h1;
  assign ram_3_MPORT_3_en = reset;
  assign ram_3_MPORT_4_data = 8'h0;
  assign ram_3_MPORT_4_addr = 6'h4;
  assign ram_3_MPORT_4_mask = 1'h1;
  assign ram_3_MPORT_4_en = reset;
  assign ram_3_MPORT_5_data = 8'h0;
  assign ram_3_MPORT_5_addr = 6'h5;
  assign ram_3_MPORT_5_mask = 1'h1;
  assign ram_3_MPORT_5_en = reset;
  assign ram_3_MPORT_6_data = 8'h0;
  assign ram_3_MPORT_6_addr = 6'h6;
  assign ram_3_MPORT_6_mask = 1'h1;
  assign ram_3_MPORT_6_en = reset;
  assign ram_3_MPORT_7_data = 8'h0;
  assign ram_3_MPORT_7_addr = 6'h7;
  assign ram_3_MPORT_7_mask = 1'h1;
  assign ram_3_MPORT_7_en = reset;
  assign ram_3_MPORT_8_data = 8'h0;
  assign ram_3_MPORT_8_addr = 6'h8;
  assign ram_3_MPORT_8_mask = 1'h1;
  assign ram_3_MPORT_8_en = reset;
  assign ram_3_MPORT_9_data = 8'h0;
  assign ram_3_MPORT_9_addr = 6'h9;
  assign ram_3_MPORT_9_mask = 1'h1;
  assign ram_3_MPORT_9_en = reset;
  assign ram_3_MPORT_10_data = 8'h0;
  assign ram_3_MPORT_10_addr = 6'ha;
  assign ram_3_MPORT_10_mask = 1'h1;
  assign ram_3_MPORT_10_en = reset;
  assign ram_3_MPORT_11_data = 8'h0;
  assign ram_3_MPORT_11_addr = 6'hb;
  assign ram_3_MPORT_11_mask = 1'h1;
  assign ram_3_MPORT_11_en = reset;
  assign ram_3_MPORT_12_data = 8'h0;
  assign ram_3_MPORT_12_addr = 6'hc;
  assign ram_3_MPORT_12_mask = 1'h1;
  assign ram_3_MPORT_12_en = reset;
  assign ram_3_MPORT_13_data = 8'h0;
  assign ram_3_MPORT_13_addr = 6'hd;
  assign ram_3_MPORT_13_mask = 1'h1;
  assign ram_3_MPORT_13_en = reset;
  assign ram_3_MPORT_14_data = 8'h0;
  assign ram_3_MPORT_14_addr = 6'he;
  assign ram_3_MPORT_14_mask = 1'h1;
  assign ram_3_MPORT_14_en = reset;
  assign ram_3_MPORT_15_data = 8'h0;
  assign ram_3_MPORT_15_addr = 6'hf;
  assign ram_3_MPORT_15_mask = 1'h1;
  assign ram_3_MPORT_15_en = reset;
  assign ram_3_MPORT_16_data = 8'h0;
  assign ram_3_MPORT_16_addr = 6'h10;
  assign ram_3_MPORT_16_mask = 1'h1;
  assign ram_3_MPORT_16_en = reset;
  assign ram_3_MPORT_17_data = 8'h0;
  assign ram_3_MPORT_17_addr = 6'h11;
  assign ram_3_MPORT_17_mask = 1'h1;
  assign ram_3_MPORT_17_en = reset;
  assign ram_3_MPORT_18_data = 8'h0;
  assign ram_3_MPORT_18_addr = 6'h12;
  assign ram_3_MPORT_18_mask = 1'h1;
  assign ram_3_MPORT_18_en = reset;
  assign ram_3_MPORT_19_data = 8'h0;
  assign ram_3_MPORT_19_addr = 6'h13;
  assign ram_3_MPORT_19_mask = 1'h1;
  assign ram_3_MPORT_19_en = reset;
  assign ram_3_MPORT_20_data = 8'h0;
  assign ram_3_MPORT_20_addr = 6'h14;
  assign ram_3_MPORT_20_mask = 1'h1;
  assign ram_3_MPORT_20_en = reset;
  assign ram_3_MPORT_21_data = 8'h0;
  assign ram_3_MPORT_21_addr = 6'h15;
  assign ram_3_MPORT_21_mask = 1'h1;
  assign ram_3_MPORT_21_en = reset;
  assign ram_3_MPORT_22_data = 8'h0;
  assign ram_3_MPORT_22_addr = 6'h16;
  assign ram_3_MPORT_22_mask = 1'h1;
  assign ram_3_MPORT_22_en = reset;
  assign ram_3_MPORT_23_data = 8'h0;
  assign ram_3_MPORT_23_addr = 6'h17;
  assign ram_3_MPORT_23_mask = 1'h1;
  assign ram_3_MPORT_23_en = reset;
  assign ram_3_MPORT_24_data = 8'h0;
  assign ram_3_MPORT_24_addr = 6'h18;
  assign ram_3_MPORT_24_mask = 1'h1;
  assign ram_3_MPORT_24_en = reset;
  assign ram_3_MPORT_25_data = 8'h0;
  assign ram_3_MPORT_25_addr = 6'h19;
  assign ram_3_MPORT_25_mask = 1'h1;
  assign ram_3_MPORT_25_en = reset;
  assign ram_3_MPORT_26_data = 8'h0;
  assign ram_3_MPORT_26_addr = 6'h1a;
  assign ram_3_MPORT_26_mask = 1'h1;
  assign ram_3_MPORT_26_en = reset;
  assign ram_3_MPORT_27_data = 8'h0;
  assign ram_3_MPORT_27_addr = 6'h1b;
  assign ram_3_MPORT_27_mask = 1'h1;
  assign ram_3_MPORT_27_en = reset;
  assign ram_3_MPORT_28_data = 8'h0;
  assign ram_3_MPORT_28_addr = 6'h1c;
  assign ram_3_MPORT_28_mask = 1'h1;
  assign ram_3_MPORT_28_en = reset;
  assign ram_3_MPORT_29_data = 8'h0;
  assign ram_3_MPORT_29_addr = 6'h1d;
  assign ram_3_MPORT_29_mask = 1'h1;
  assign ram_3_MPORT_29_en = reset;
  assign ram_3_MPORT_30_data = 8'h0;
  assign ram_3_MPORT_30_addr = 6'h1e;
  assign ram_3_MPORT_30_mask = 1'h1;
  assign ram_3_MPORT_30_en = reset;
  assign ram_3_MPORT_31_data = 8'h0;
  assign ram_3_MPORT_31_addr = 6'h1f;
  assign ram_3_MPORT_31_mask = 1'h1;
  assign ram_3_MPORT_31_en = reset;
  assign ram_3_MPORT_32_data = 8'h0;
  assign ram_3_MPORT_32_addr = 6'h20;
  assign ram_3_MPORT_32_mask = 1'h1;
  assign ram_3_MPORT_32_en = reset;
  assign ram_3_MPORT_33_data = 8'h0;
  assign ram_3_MPORT_33_addr = 6'h21;
  assign ram_3_MPORT_33_mask = 1'h1;
  assign ram_3_MPORT_33_en = reset;
  assign ram_3_MPORT_34_data = 8'h0;
  assign ram_3_MPORT_34_addr = 6'h22;
  assign ram_3_MPORT_34_mask = 1'h1;
  assign ram_3_MPORT_34_en = reset;
  assign ram_3_MPORT_35_data = 8'h0;
  assign ram_3_MPORT_35_addr = 6'h23;
  assign ram_3_MPORT_35_mask = 1'h1;
  assign ram_3_MPORT_35_en = reset;
  assign ram_3_MPORT_36_data = 8'h0;
  assign ram_3_MPORT_36_addr = 6'h24;
  assign ram_3_MPORT_36_mask = 1'h1;
  assign ram_3_MPORT_36_en = reset;
  assign ram_3_MPORT_37_data = 8'h0;
  assign ram_3_MPORT_37_addr = 6'h25;
  assign ram_3_MPORT_37_mask = 1'h1;
  assign ram_3_MPORT_37_en = reset;
  assign ram_3_MPORT_38_data = 8'h0;
  assign ram_3_MPORT_38_addr = 6'h26;
  assign ram_3_MPORT_38_mask = 1'h1;
  assign ram_3_MPORT_38_en = reset;
  assign ram_3_MPORT_39_data = 8'h0;
  assign ram_3_MPORT_39_addr = 6'h27;
  assign ram_3_MPORT_39_mask = 1'h1;
  assign ram_3_MPORT_39_en = reset;
  assign ram_3_MPORT_40_data = 8'h0;
  assign ram_3_MPORT_40_addr = 6'h28;
  assign ram_3_MPORT_40_mask = 1'h1;
  assign ram_3_MPORT_40_en = reset;
  assign ram_3_MPORT_41_data = 8'h0;
  assign ram_3_MPORT_41_addr = 6'h29;
  assign ram_3_MPORT_41_mask = 1'h1;
  assign ram_3_MPORT_41_en = reset;
  assign ram_3_MPORT_42_data = 8'h0;
  assign ram_3_MPORT_42_addr = 6'h2a;
  assign ram_3_MPORT_42_mask = 1'h1;
  assign ram_3_MPORT_42_en = reset;
  assign ram_3_MPORT_43_data = 8'h0;
  assign ram_3_MPORT_43_addr = 6'h2b;
  assign ram_3_MPORT_43_mask = 1'h1;
  assign ram_3_MPORT_43_en = reset;
  assign ram_3_MPORT_44_data = 8'h0;
  assign ram_3_MPORT_44_addr = 6'h2c;
  assign ram_3_MPORT_44_mask = 1'h1;
  assign ram_3_MPORT_44_en = reset;
  assign ram_3_MPORT_45_data = 8'h0;
  assign ram_3_MPORT_45_addr = 6'h2d;
  assign ram_3_MPORT_45_mask = 1'h1;
  assign ram_3_MPORT_45_en = reset;
  assign ram_3_MPORT_46_data = 8'h0;
  assign ram_3_MPORT_46_addr = 6'h2e;
  assign ram_3_MPORT_46_mask = 1'h1;
  assign ram_3_MPORT_46_en = reset;
  assign ram_3_MPORT_47_data = 8'h0;
  assign ram_3_MPORT_47_addr = 6'h2f;
  assign ram_3_MPORT_47_mask = 1'h1;
  assign ram_3_MPORT_47_en = reset;
  assign ram_3_MPORT_48_data = 8'h0;
  assign ram_3_MPORT_48_addr = 6'h30;
  assign ram_3_MPORT_48_mask = 1'h1;
  assign ram_3_MPORT_48_en = reset;
  assign ram_3_MPORT_49_data = 8'h0;
  assign ram_3_MPORT_49_addr = 6'h31;
  assign ram_3_MPORT_49_mask = 1'h1;
  assign ram_3_MPORT_49_en = reset;
  assign ram_3_MPORT_50_data = 8'h0;
  assign ram_3_MPORT_50_addr = 6'h32;
  assign ram_3_MPORT_50_mask = 1'h1;
  assign ram_3_MPORT_50_en = reset;
  assign ram_3_MPORT_51_data = 8'h0;
  assign ram_3_MPORT_51_addr = 6'h33;
  assign ram_3_MPORT_51_mask = 1'h1;
  assign ram_3_MPORT_51_en = reset;
  assign ram_3_MPORT_52_data = 8'h0;
  assign ram_3_MPORT_52_addr = 6'h34;
  assign ram_3_MPORT_52_mask = 1'h1;
  assign ram_3_MPORT_52_en = reset;
  assign ram_3_MPORT_53_data = 8'h0;
  assign ram_3_MPORT_53_addr = 6'h35;
  assign ram_3_MPORT_53_mask = 1'h1;
  assign ram_3_MPORT_53_en = reset;
  assign ram_3_MPORT_54_data = 8'h0;
  assign ram_3_MPORT_54_addr = 6'h36;
  assign ram_3_MPORT_54_mask = 1'h1;
  assign ram_3_MPORT_54_en = reset;
  assign ram_3_MPORT_55_data = 8'h0;
  assign ram_3_MPORT_55_addr = 6'h37;
  assign ram_3_MPORT_55_mask = 1'h1;
  assign ram_3_MPORT_55_en = reset;
  assign ram_3_MPORT_56_data = 8'h0;
  assign ram_3_MPORT_56_addr = 6'h38;
  assign ram_3_MPORT_56_mask = 1'h1;
  assign ram_3_MPORT_56_en = reset;
  assign ram_3_MPORT_57_data = 8'h0;
  assign ram_3_MPORT_57_addr = 6'h39;
  assign ram_3_MPORT_57_mask = 1'h1;
  assign ram_3_MPORT_57_en = reset;
  assign ram_3_MPORT_58_data = 8'h0;
  assign ram_3_MPORT_58_addr = 6'h3a;
  assign ram_3_MPORT_58_mask = 1'h1;
  assign ram_3_MPORT_58_en = reset;
  assign ram_3_MPORT_59_data = 8'h0;
  assign ram_3_MPORT_59_addr = 6'h3b;
  assign ram_3_MPORT_59_mask = 1'h1;
  assign ram_3_MPORT_59_en = reset;
  assign ram_3_MPORT_60_data = 8'h0;
  assign ram_3_MPORT_60_addr = 6'h3c;
  assign ram_3_MPORT_60_mask = 1'h1;
  assign ram_3_MPORT_60_en = reset;
  assign ram_3_MPORT_61_data = 8'h0;
  assign ram_3_MPORT_61_addr = 6'h3d;
  assign ram_3_MPORT_61_mask = 1'h1;
  assign ram_3_MPORT_61_en = reset;
  assign ram_3_MPORT_62_data = 8'h0;
  assign ram_3_MPORT_62_addr = 6'h3e;
  assign ram_3_MPORT_62_mask = 1'h1;
  assign ram_3_MPORT_62_en = reset;
  assign ram_3_MPORT_63_data = 8'h0;
  assign ram_3_MPORT_63_addr = 6'h3f;
  assign ram_3_MPORT_63_mask = 1'h1;
  assign ram_3_MPORT_63_en = reset;
  assign ram_3_MPORT_64_data = io_wdata[31:24];
  assign ram_3_MPORT_64_addr = io_addr;
  assign ram_3_MPORT_64_mask = io_wmask[3];
  assign ram_3_MPORT_64_en = io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 75:39]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_1_en & ram_0_MPORT_1_mask) begin
      ram_0[ram_0_MPORT_1_addr] <= ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_2_en & ram_0_MPORT_2_mask) begin
      ram_0[ram_0_MPORT_2_addr] <= ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_3_en & ram_0_MPORT_3_mask) begin
      ram_0[ram_0_MPORT_3_addr] <= ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_4_en & ram_0_MPORT_4_mask) begin
      ram_0[ram_0_MPORT_4_addr] <= ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_5_en & ram_0_MPORT_5_mask) begin
      ram_0[ram_0_MPORT_5_addr] <= ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_6_en & ram_0_MPORT_6_mask) begin
      ram_0[ram_0_MPORT_6_addr] <= ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_7_en & ram_0_MPORT_7_mask) begin
      ram_0[ram_0_MPORT_7_addr] <= ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_8_en & ram_0_MPORT_8_mask) begin
      ram_0[ram_0_MPORT_8_addr] <= ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_9_en & ram_0_MPORT_9_mask) begin
      ram_0[ram_0_MPORT_9_addr] <= ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_10_en & ram_0_MPORT_10_mask) begin
      ram_0[ram_0_MPORT_10_addr] <= ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_11_en & ram_0_MPORT_11_mask) begin
      ram_0[ram_0_MPORT_11_addr] <= ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_12_en & ram_0_MPORT_12_mask) begin
      ram_0[ram_0_MPORT_12_addr] <= ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_13_en & ram_0_MPORT_13_mask) begin
      ram_0[ram_0_MPORT_13_addr] <= ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_14_en & ram_0_MPORT_14_mask) begin
      ram_0[ram_0_MPORT_14_addr] <= ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_15_en & ram_0_MPORT_15_mask) begin
      ram_0[ram_0_MPORT_15_addr] <= ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_16_en & ram_0_MPORT_16_mask) begin
      ram_0[ram_0_MPORT_16_addr] <= ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_17_en & ram_0_MPORT_17_mask) begin
      ram_0[ram_0_MPORT_17_addr] <= ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_18_en & ram_0_MPORT_18_mask) begin
      ram_0[ram_0_MPORT_18_addr] <= ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_19_en & ram_0_MPORT_19_mask) begin
      ram_0[ram_0_MPORT_19_addr] <= ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_20_en & ram_0_MPORT_20_mask) begin
      ram_0[ram_0_MPORT_20_addr] <= ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_21_en & ram_0_MPORT_21_mask) begin
      ram_0[ram_0_MPORT_21_addr] <= ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_22_en & ram_0_MPORT_22_mask) begin
      ram_0[ram_0_MPORT_22_addr] <= ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_23_en & ram_0_MPORT_23_mask) begin
      ram_0[ram_0_MPORT_23_addr] <= ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_24_en & ram_0_MPORT_24_mask) begin
      ram_0[ram_0_MPORT_24_addr] <= ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_25_en & ram_0_MPORT_25_mask) begin
      ram_0[ram_0_MPORT_25_addr] <= ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_26_en & ram_0_MPORT_26_mask) begin
      ram_0[ram_0_MPORT_26_addr] <= ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_27_en & ram_0_MPORT_27_mask) begin
      ram_0[ram_0_MPORT_27_addr] <= ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_28_en & ram_0_MPORT_28_mask) begin
      ram_0[ram_0_MPORT_28_addr] <= ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_29_en & ram_0_MPORT_29_mask) begin
      ram_0[ram_0_MPORT_29_addr] <= ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_30_en & ram_0_MPORT_30_mask) begin
      ram_0[ram_0_MPORT_30_addr] <= ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_31_en & ram_0_MPORT_31_mask) begin
      ram_0[ram_0_MPORT_31_addr] <= ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_32_en & ram_0_MPORT_32_mask) begin
      ram_0[ram_0_MPORT_32_addr] <= ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_33_en & ram_0_MPORT_33_mask) begin
      ram_0[ram_0_MPORT_33_addr] <= ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_34_en & ram_0_MPORT_34_mask) begin
      ram_0[ram_0_MPORT_34_addr] <= ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_35_en & ram_0_MPORT_35_mask) begin
      ram_0[ram_0_MPORT_35_addr] <= ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_36_en & ram_0_MPORT_36_mask) begin
      ram_0[ram_0_MPORT_36_addr] <= ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_37_en & ram_0_MPORT_37_mask) begin
      ram_0[ram_0_MPORT_37_addr] <= ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_38_en & ram_0_MPORT_38_mask) begin
      ram_0[ram_0_MPORT_38_addr] <= ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_39_en & ram_0_MPORT_39_mask) begin
      ram_0[ram_0_MPORT_39_addr] <= ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_40_en & ram_0_MPORT_40_mask) begin
      ram_0[ram_0_MPORT_40_addr] <= ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_41_en & ram_0_MPORT_41_mask) begin
      ram_0[ram_0_MPORT_41_addr] <= ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_42_en & ram_0_MPORT_42_mask) begin
      ram_0[ram_0_MPORT_42_addr] <= ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_43_en & ram_0_MPORT_43_mask) begin
      ram_0[ram_0_MPORT_43_addr] <= ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_44_en & ram_0_MPORT_44_mask) begin
      ram_0[ram_0_MPORT_44_addr] <= ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_45_en & ram_0_MPORT_45_mask) begin
      ram_0[ram_0_MPORT_45_addr] <= ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_46_en & ram_0_MPORT_46_mask) begin
      ram_0[ram_0_MPORT_46_addr] <= ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_47_en & ram_0_MPORT_47_mask) begin
      ram_0[ram_0_MPORT_47_addr] <= ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_48_en & ram_0_MPORT_48_mask) begin
      ram_0[ram_0_MPORT_48_addr] <= ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_49_en & ram_0_MPORT_49_mask) begin
      ram_0[ram_0_MPORT_49_addr] <= ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_50_en & ram_0_MPORT_50_mask) begin
      ram_0[ram_0_MPORT_50_addr] <= ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_51_en & ram_0_MPORT_51_mask) begin
      ram_0[ram_0_MPORT_51_addr] <= ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_52_en & ram_0_MPORT_52_mask) begin
      ram_0[ram_0_MPORT_52_addr] <= ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_53_en & ram_0_MPORT_53_mask) begin
      ram_0[ram_0_MPORT_53_addr] <= ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_54_en & ram_0_MPORT_54_mask) begin
      ram_0[ram_0_MPORT_54_addr] <= ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_55_en & ram_0_MPORT_55_mask) begin
      ram_0[ram_0_MPORT_55_addr] <= ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_56_en & ram_0_MPORT_56_mask) begin
      ram_0[ram_0_MPORT_56_addr] <= ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_57_en & ram_0_MPORT_57_mask) begin
      ram_0[ram_0_MPORT_57_addr] <= ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_58_en & ram_0_MPORT_58_mask) begin
      ram_0[ram_0_MPORT_58_addr] <= ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_59_en & ram_0_MPORT_59_mask) begin
      ram_0[ram_0_MPORT_59_addr] <= ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_60_en & ram_0_MPORT_60_mask) begin
      ram_0[ram_0_MPORT_60_addr] <= ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_61_en & ram_0_MPORT_61_mask) begin
      ram_0[ram_0_MPORT_61_addr] <= ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_62_en & ram_0_MPORT_62_mask) begin
      ram_0[ram_0_MPORT_62_addr] <= ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_63_en & ram_0_MPORT_63_mask) begin
      ram_0[ram_0_MPORT_63_addr] <= ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_64_en & ram_0_MPORT_64_mask) begin
      ram_0[ram_0_MPORT_64_addr] <= ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_0_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_1_en & ram_1_MPORT_1_mask) begin
      ram_1[ram_1_MPORT_1_addr] <= ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_2_en & ram_1_MPORT_2_mask) begin
      ram_1[ram_1_MPORT_2_addr] <= ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_3_en & ram_1_MPORT_3_mask) begin
      ram_1[ram_1_MPORT_3_addr] <= ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_4_en & ram_1_MPORT_4_mask) begin
      ram_1[ram_1_MPORT_4_addr] <= ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_5_en & ram_1_MPORT_5_mask) begin
      ram_1[ram_1_MPORT_5_addr] <= ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_6_en & ram_1_MPORT_6_mask) begin
      ram_1[ram_1_MPORT_6_addr] <= ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_7_en & ram_1_MPORT_7_mask) begin
      ram_1[ram_1_MPORT_7_addr] <= ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_8_en & ram_1_MPORT_8_mask) begin
      ram_1[ram_1_MPORT_8_addr] <= ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_9_en & ram_1_MPORT_9_mask) begin
      ram_1[ram_1_MPORT_9_addr] <= ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_10_en & ram_1_MPORT_10_mask) begin
      ram_1[ram_1_MPORT_10_addr] <= ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_11_en & ram_1_MPORT_11_mask) begin
      ram_1[ram_1_MPORT_11_addr] <= ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_12_en & ram_1_MPORT_12_mask) begin
      ram_1[ram_1_MPORT_12_addr] <= ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_13_en & ram_1_MPORT_13_mask) begin
      ram_1[ram_1_MPORT_13_addr] <= ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_14_en & ram_1_MPORT_14_mask) begin
      ram_1[ram_1_MPORT_14_addr] <= ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_15_en & ram_1_MPORT_15_mask) begin
      ram_1[ram_1_MPORT_15_addr] <= ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_16_en & ram_1_MPORT_16_mask) begin
      ram_1[ram_1_MPORT_16_addr] <= ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_17_en & ram_1_MPORT_17_mask) begin
      ram_1[ram_1_MPORT_17_addr] <= ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_18_en & ram_1_MPORT_18_mask) begin
      ram_1[ram_1_MPORT_18_addr] <= ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_19_en & ram_1_MPORT_19_mask) begin
      ram_1[ram_1_MPORT_19_addr] <= ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_20_en & ram_1_MPORT_20_mask) begin
      ram_1[ram_1_MPORT_20_addr] <= ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_21_en & ram_1_MPORT_21_mask) begin
      ram_1[ram_1_MPORT_21_addr] <= ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_22_en & ram_1_MPORT_22_mask) begin
      ram_1[ram_1_MPORT_22_addr] <= ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_23_en & ram_1_MPORT_23_mask) begin
      ram_1[ram_1_MPORT_23_addr] <= ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_24_en & ram_1_MPORT_24_mask) begin
      ram_1[ram_1_MPORT_24_addr] <= ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_25_en & ram_1_MPORT_25_mask) begin
      ram_1[ram_1_MPORT_25_addr] <= ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_26_en & ram_1_MPORT_26_mask) begin
      ram_1[ram_1_MPORT_26_addr] <= ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_27_en & ram_1_MPORT_27_mask) begin
      ram_1[ram_1_MPORT_27_addr] <= ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_28_en & ram_1_MPORT_28_mask) begin
      ram_1[ram_1_MPORT_28_addr] <= ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_29_en & ram_1_MPORT_29_mask) begin
      ram_1[ram_1_MPORT_29_addr] <= ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_30_en & ram_1_MPORT_30_mask) begin
      ram_1[ram_1_MPORT_30_addr] <= ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_31_en & ram_1_MPORT_31_mask) begin
      ram_1[ram_1_MPORT_31_addr] <= ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_32_en & ram_1_MPORT_32_mask) begin
      ram_1[ram_1_MPORT_32_addr] <= ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_33_en & ram_1_MPORT_33_mask) begin
      ram_1[ram_1_MPORT_33_addr] <= ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_34_en & ram_1_MPORT_34_mask) begin
      ram_1[ram_1_MPORT_34_addr] <= ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_35_en & ram_1_MPORT_35_mask) begin
      ram_1[ram_1_MPORT_35_addr] <= ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_36_en & ram_1_MPORT_36_mask) begin
      ram_1[ram_1_MPORT_36_addr] <= ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_37_en & ram_1_MPORT_37_mask) begin
      ram_1[ram_1_MPORT_37_addr] <= ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_38_en & ram_1_MPORT_38_mask) begin
      ram_1[ram_1_MPORT_38_addr] <= ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_39_en & ram_1_MPORT_39_mask) begin
      ram_1[ram_1_MPORT_39_addr] <= ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_40_en & ram_1_MPORT_40_mask) begin
      ram_1[ram_1_MPORT_40_addr] <= ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_41_en & ram_1_MPORT_41_mask) begin
      ram_1[ram_1_MPORT_41_addr] <= ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_42_en & ram_1_MPORT_42_mask) begin
      ram_1[ram_1_MPORT_42_addr] <= ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_43_en & ram_1_MPORT_43_mask) begin
      ram_1[ram_1_MPORT_43_addr] <= ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_44_en & ram_1_MPORT_44_mask) begin
      ram_1[ram_1_MPORT_44_addr] <= ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_45_en & ram_1_MPORT_45_mask) begin
      ram_1[ram_1_MPORT_45_addr] <= ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_46_en & ram_1_MPORT_46_mask) begin
      ram_1[ram_1_MPORT_46_addr] <= ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_47_en & ram_1_MPORT_47_mask) begin
      ram_1[ram_1_MPORT_47_addr] <= ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_48_en & ram_1_MPORT_48_mask) begin
      ram_1[ram_1_MPORT_48_addr] <= ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_49_en & ram_1_MPORT_49_mask) begin
      ram_1[ram_1_MPORT_49_addr] <= ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_50_en & ram_1_MPORT_50_mask) begin
      ram_1[ram_1_MPORT_50_addr] <= ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_51_en & ram_1_MPORT_51_mask) begin
      ram_1[ram_1_MPORT_51_addr] <= ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_52_en & ram_1_MPORT_52_mask) begin
      ram_1[ram_1_MPORT_52_addr] <= ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_53_en & ram_1_MPORT_53_mask) begin
      ram_1[ram_1_MPORT_53_addr] <= ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_54_en & ram_1_MPORT_54_mask) begin
      ram_1[ram_1_MPORT_54_addr] <= ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_55_en & ram_1_MPORT_55_mask) begin
      ram_1[ram_1_MPORT_55_addr] <= ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_56_en & ram_1_MPORT_56_mask) begin
      ram_1[ram_1_MPORT_56_addr] <= ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_57_en & ram_1_MPORT_57_mask) begin
      ram_1[ram_1_MPORT_57_addr] <= ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_58_en & ram_1_MPORT_58_mask) begin
      ram_1[ram_1_MPORT_58_addr] <= ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_59_en & ram_1_MPORT_59_mask) begin
      ram_1[ram_1_MPORT_59_addr] <= ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_60_en & ram_1_MPORT_60_mask) begin
      ram_1[ram_1_MPORT_60_addr] <= ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_61_en & ram_1_MPORT_61_mask) begin
      ram_1[ram_1_MPORT_61_addr] <= ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_62_en & ram_1_MPORT_62_mask) begin
      ram_1[ram_1_MPORT_62_addr] <= ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_63_en & ram_1_MPORT_63_mask) begin
      ram_1[ram_1_MPORT_63_addr] <= ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_64_en & ram_1_MPORT_64_mask) begin
      ram_1[ram_1_MPORT_64_addr] <= ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_1_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_1_en & ram_2_MPORT_1_mask) begin
      ram_2[ram_2_MPORT_1_addr] <= ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_2_en & ram_2_MPORT_2_mask) begin
      ram_2[ram_2_MPORT_2_addr] <= ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_3_en & ram_2_MPORT_3_mask) begin
      ram_2[ram_2_MPORT_3_addr] <= ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_4_en & ram_2_MPORT_4_mask) begin
      ram_2[ram_2_MPORT_4_addr] <= ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_5_en & ram_2_MPORT_5_mask) begin
      ram_2[ram_2_MPORT_5_addr] <= ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_6_en & ram_2_MPORT_6_mask) begin
      ram_2[ram_2_MPORT_6_addr] <= ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_7_en & ram_2_MPORT_7_mask) begin
      ram_2[ram_2_MPORT_7_addr] <= ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_8_en & ram_2_MPORT_8_mask) begin
      ram_2[ram_2_MPORT_8_addr] <= ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_9_en & ram_2_MPORT_9_mask) begin
      ram_2[ram_2_MPORT_9_addr] <= ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_10_en & ram_2_MPORT_10_mask) begin
      ram_2[ram_2_MPORT_10_addr] <= ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_11_en & ram_2_MPORT_11_mask) begin
      ram_2[ram_2_MPORT_11_addr] <= ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_12_en & ram_2_MPORT_12_mask) begin
      ram_2[ram_2_MPORT_12_addr] <= ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_13_en & ram_2_MPORT_13_mask) begin
      ram_2[ram_2_MPORT_13_addr] <= ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_14_en & ram_2_MPORT_14_mask) begin
      ram_2[ram_2_MPORT_14_addr] <= ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_15_en & ram_2_MPORT_15_mask) begin
      ram_2[ram_2_MPORT_15_addr] <= ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_16_en & ram_2_MPORT_16_mask) begin
      ram_2[ram_2_MPORT_16_addr] <= ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_17_en & ram_2_MPORT_17_mask) begin
      ram_2[ram_2_MPORT_17_addr] <= ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_18_en & ram_2_MPORT_18_mask) begin
      ram_2[ram_2_MPORT_18_addr] <= ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_19_en & ram_2_MPORT_19_mask) begin
      ram_2[ram_2_MPORT_19_addr] <= ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_20_en & ram_2_MPORT_20_mask) begin
      ram_2[ram_2_MPORT_20_addr] <= ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_21_en & ram_2_MPORT_21_mask) begin
      ram_2[ram_2_MPORT_21_addr] <= ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_22_en & ram_2_MPORT_22_mask) begin
      ram_2[ram_2_MPORT_22_addr] <= ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_23_en & ram_2_MPORT_23_mask) begin
      ram_2[ram_2_MPORT_23_addr] <= ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_24_en & ram_2_MPORT_24_mask) begin
      ram_2[ram_2_MPORT_24_addr] <= ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_25_en & ram_2_MPORT_25_mask) begin
      ram_2[ram_2_MPORT_25_addr] <= ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_26_en & ram_2_MPORT_26_mask) begin
      ram_2[ram_2_MPORT_26_addr] <= ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_27_en & ram_2_MPORT_27_mask) begin
      ram_2[ram_2_MPORT_27_addr] <= ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_28_en & ram_2_MPORT_28_mask) begin
      ram_2[ram_2_MPORT_28_addr] <= ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_29_en & ram_2_MPORT_29_mask) begin
      ram_2[ram_2_MPORT_29_addr] <= ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_30_en & ram_2_MPORT_30_mask) begin
      ram_2[ram_2_MPORT_30_addr] <= ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_31_en & ram_2_MPORT_31_mask) begin
      ram_2[ram_2_MPORT_31_addr] <= ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_32_en & ram_2_MPORT_32_mask) begin
      ram_2[ram_2_MPORT_32_addr] <= ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_33_en & ram_2_MPORT_33_mask) begin
      ram_2[ram_2_MPORT_33_addr] <= ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_34_en & ram_2_MPORT_34_mask) begin
      ram_2[ram_2_MPORT_34_addr] <= ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_35_en & ram_2_MPORT_35_mask) begin
      ram_2[ram_2_MPORT_35_addr] <= ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_36_en & ram_2_MPORT_36_mask) begin
      ram_2[ram_2_MPORT_36_addr] <= ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_37_en & ram_2_MPORT_37_mask) begin
      ram_2[ram_2_MPORT_37_addr] <= ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_38_en & ram_2_MPORT_38_mask) begin
      ram_2[ram_2_MPORT_38_addr] <= ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_39_en & ram_2_MPORT_39_mask) begin
      ram_2[ram_2_MPORT_39_addr] <= ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_40_en & ram_2_MPORT_40_mask) begin
      ram_2[ram_2_MPORT_40_addr] <= ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_41_en & ram_2_MPORT_41_mask) begin
      ram_2[ram_2_MPORT_41_addr] <= ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_42_en & ram_2_MPORT_42_mask) begin
      ram_2[ram_2_MPORT_42_addr] <= ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_43_en & ram_2_MPORT_43_mask) begin
      ram_2[ram_2_MPORT_43_addr] <= ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_44_en & ram_2_MPORT_44_mask) begin
      ram_2[ram_2_MPORT_44_addr] <= ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_45_en & ram_2_MPORT_45_mask) begin
      ram_2[ram_2_MPORT_45_addr] <= ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_46_en & ram_2_MPORT_46_mask) begin
      ram_2[ram_2_MPORT_46_addr] <= ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_47_en & ram_2_MPORT_47_mask) begin
      ram_2[ram_2_MPORT_47_addr] <= ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_48_en & ram_2_MPORT_48_mask) begin
      ram_2[ram_2_MPORT_48_addr] <= ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_49_en & ram_2_MPORT_49_mask) begin
      ram_2[ram_2_MPORT_49_addr] <= ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_50_en & ram_2_MPORT_50_mask) begin
      ram_2[ram_2_MPORT_50_addr] <= ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_51_en & ram_2_MPORT_51_mask) begin
      ram_2[ram_2_MPORT_51_addr] <= ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_52_en & ram_2_MPORT_52_mask) begin
      ram_2[ram_2_MPORT_52_addr] <= ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_53_en & ram_2_MPORT_53_mask) begin
      ram_2[ram_2_MPORT_53_addr] <= ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_54_en & ram_2_MPORT_54_mask) begin
      ram_2[ram_2_MPORT_54_addr] <= ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_55_en & ram_2_MPORT_55_mask) begin
      ram_2[ram_2_MPORT_55_addr] <= ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_56_en & ram_2_MPORT_56_mask) begin
      ram_2[ram_2_MPORT_56_addr] <= ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_57_en & ram_2_MPORT_57_mask) begin
      ram_2[ram_2_MPORT_57_addr] <= ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_58_en & ram_2_MPORT_58_mask) begin
      ram_2[ram_2_MPORT_58_addr] <= ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_59_en & ram_2_MPORT_59_mask) begin
      ram_2[ram_2_MPORT_59_addr] <= ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_60_en & ram_2_MPORT_60_mask) begin
      ram_2[ram_2_MPORT_60_addr] <= ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_61_en & ram_2_MPORT_61_mask) begin
      ram_2[ram_2_MPORT_61_addr] <= ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_62_en & ram_2_MPORT_62_mask) begin
      ram_2[ram_2_MPORT_62_addr] <= ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_63_en & ram_2_MPORT_63_mask) begin
      ram_2[ram_2_MPORT_63_addr] <= ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_64_en & ram_2_MPORT_64_mask) begin
      ram_2[ram_2_MPORT_64_addr] <= ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_2_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_1_en & ram_3_MPORT_1_mask) begin
      ram_3[ram_3_MPORT_1_addr] <= ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_2_en & ram_3_MPORT_2_mask) begin
      ram_3[ram_3_MPORT_2_addr] <= ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_3_en & ram_3_MPORT_3_mask) begin
      ram_3[ram_3_MPORT_3_addr] <= ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_4_en & ram_3_MPORT_4_mask) begin
      ram_3[ram_3_MPORT_4_addr] <= ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_5_en & ram_3_MPORT_5_mask) begin
      ram_3[ram_3_MPORT_5_addr] <= ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_6_en & ram_3_MPORT_6_mask) begin
      ram_3[ram_3_MPORT_6_addr] <= ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_7_en & ram_3_MPORT_7_mask) begin
      ram_3[ram_3_MPORT_7_addr] <= ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_8_en & ram_3_MPORT_8_mask) begin
      ram_3[ram_3_MPORT_8_addr] <= ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_9_en & ram_3_MPORT_9_mask) begin
      ram_3[ram_3_MPORT_9_addr] <= ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_10_en & ram_3_MPORT_10_mask) begin
      ram_3[ram_3_MPORT_10_addr] <= ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_11_en & ram_3_MPORT_11_mask) begin
      ram_3[ram_3_MPORT_11_addr] <= ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_12_en & ram_3_MPORT_12_mask) begin
      ram_3[ram_3_MPORT_12_addr] <= ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_13_en & ram_3_MPORT_13_mask) begin
      ram_3[ram_3_MPORT_13_addr] <= ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_14_en & ram_3_MPORT_14_mask) begin
      ram_3[ram_3_MPORT_14_addr] <= ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_15_en & ram_3_MPORT_15_mask) begin
      ram_3[ram_3_MPORT_15_addr] <= ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_16_en & ram_3_MPORT_16_mask) begin
      ram_3[ram_3_MPORT_16_addr] <= ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_17_en & ram_3_MPORT_17_mask) begin
      ram_3[ram_3_MPORT_17_addr] <= ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_18_en & ram_3_MPORT_18_mask) begin
      ram_3[ram_3_MPORT_18_addr] <= ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_19_en & ram_3_MPORT_19_mask) begin
      ram_3[ram_3_MPORT_19_addr] <= ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_20_en & ram_3_MPORT_20_mask) begin
      ram_3[ram_3_MPORT_20_addr] <= ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_21_en & ram_3_MPORT_21_mask) begin
      ram_3[ram_3_MPORT_21_addr] <= ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_22_en & ram_3_MPORT_22_mask) begin
      ram_3[ram_3_MPORT_22_addr] <= ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_23_en & ram_3_MPORT_23_mask) begin
      ram_3[ram_3_MPORT_23_addr] <= ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_24_en & ram_3_MPORT_24_mask) begin
      ram_3[ram_3_MPORT_24_addr] <= ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_25_en & ram_3_MPORT_25_mask) begin
      ram_3[ram_3_MPORT_25_addr] <= ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_26_en & ram_3_MPORT_26_mask) begin
      ram_3[ram_3_MPORT_26_addr] <= ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_27_en & ram_3_MPORT_27_mask) begin
      ram_3[ram_3_MPORT_27_addr] <= ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_28_en & ram_3_MPORT_28_mask) begin
      ram_3[ram_3_MPORT_28_addr] <= ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_29_en & ram_3_MPORT_29_mask) begin
      ram_3[ram_3_MPORT_29_addr] <= ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_30_en & ram_3_MPORT_30_mask) begin
      ram_3[ram_3_MPORT_30_addr] <= ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_31_en & ram_3_MPORT_31_mask) begin
      ram_3[ram_3_MPORT_31_addr] <= ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_32_en & ram_3_MPORT_32_mask) begin
      ram_3[ram_3_MPORT_32_addr] <= ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_33_en & ram_3_MPORT_33_mask) begin
      ram_3[ram_3_MPORT_33_addr] <= ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_34_en & ram_3_MPORT_34_mask) begin
      ram_3[ram_3_MPORT_34_addr] <= ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_35_en & ram_3_MPORT_35_mask) begin
      ram_3[ram_3_MPORT_35_addr] <= ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_36_en & ram_3_MPORT_36_mask) begin
      ram_3[ram_3_MPORT_36_addr] <= ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_37_en & ram_3_MPORT_37_mask) begin
      ram_3[ram_3_MPORT_37_addr] <= ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_38_en & ram_3_MPORT_38_mask) begin
      ram_3[ram_3_MPORT_38_addr] <= ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_39_en & ram_3_MPORT_39_mask) begin
      ram_3[ram_3_MPORT_39_addr] <= ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_40_en & ram_3_MPORT_40_mask) begin
      ram_3[ram_3_MPORT_40_addr] <= ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_41_en & ram_3_MPORT_41_mask) begin
      ram_3[ram_3_MPORT_41_addr] <= ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_42_en & ram_3_MPORT_42_mask) begin
      ram_3[ram_3_MPORT_42_addr] <= ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_43_en & ram_3_MPORT_43_mask) begin
      ram_3[ram_3_MPORT_43_addr] <= ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_44_en & ram_3_MPORT_44_mask) begin
      ram_3[ram_3_MPORT_44_addr] <= ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_45_en & ram_3_MPORT_45_mask) begin
      ram_3[ram_3_MPORT_45_addr] <= ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_46_en & ram_3_MPORT_46_mask) begin
      ram_3[ram_3_MPORT_46_addr] <= ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_47_en & ram_3_MPORT_47_mask) begin
      ram_3[ram_3_MPORT_47_addr] <= ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_48_en & ram_3_MPORT_48_mask) begin
      ram_3[ram_3_MPORT_48_addr] <= ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_49_en & ram_3_MPORT_49_mask) begin
      ram_3[ram_3_MPORT_49_addr] <= ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_50_en & ram_3_MPORT_50_mask) begin
      ram_3[ram_3_MPORT_50_addr] <= ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_51_en & ram_3_MPORT_51_mask) begin
      ram_3[ram_3_MPORT_51_addr] <= ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_52_en & ram_3_MPORT_52_mask) begin
      ram_3[ram_3_MPORT_52_addr] <= ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_53_en & ram_3_MPORT_53_mask) begin
      ram_3[ram_3_MPORT_53_addr] <= ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_54_en & ram_3_MPORT_54_mask) begin
      ram_3[ram_3_MPORT_54_addr] <= ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_55_en & ram_3_MPORT_55_mask) begin
      ram_3[ram_3_MPORT_55_addr] <= ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_56_en & ram_3_MPORT_56_mask) begin
      ram_3[ram_3_MPORT_56_addr] <= ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_57_en & ram_3_MPORT_57_mask) begin
      ram_3[ram_3_MPORT_57_addr] <= ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_58_en & ram_3_MPORT_58_mask) begin
      ram_3[ram_3_MPORT_58_addr] <= ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_59_en & ram_3_MPORT_59_mask) begin
      ram_3[ram_3_MPORT_59_addr] <= ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_60_en & ram_3_MPORT_60_mask) begin
      ram_3[ram_3_MPORT_60_addr] <= ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_61_en & ram_3_MPORT_61_mask) begin
      ram_3[ram_3_MPORT_61_addr] <= ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_62_en & ram_3_MPORT_62_mask) begin
      ram_3[ram_3_MPORT_62_addr] <= ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_63_en & ram_3_MPORT_63_mask) begin
      ram_3[ram_3_MPORT_63_addr] <= ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_64_en & ram_3_MPORT_64_mask) begin
      ram_3[ram_3_MPORT_64_addr] <= ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_3_io_rdata_MPORT_addr_pipe_0 <= io_addr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SRAMTemplate(
  input         clock,
  input         reset,
  input  [5:0]  io_r_addr,
  output [31:0] io_r_data,
  input         io_w_en,
  input  [5:0]  io_w_addr,
  input  [31:0] io_w_data,
  input  [3:0]  io_w_mask
);
  wire  sram_clock; // @[SRAM.scala 188:31]
  wire  sram_reset; // @[SRAM.scala 188:31]
  wire [5:0] sram_io_addr; // @[SRAM.scala 188:31]
  wire  sram_io_rw; // @[SRAM.scala 188:31]
  wire [31:0] sram_io_wdata; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_wmask; // @[SRAM.scala 188:31]
  wire [31:0] sram_io_rdata; // @[SRAM.scala 188:31]
  BankRam1P_1 sram ( // @[SRAM.scala 188:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_addr(sram_io_addr),
    .io_rw(sram_io_rw),
    .io_wdata(sram_io_wdata),
    .io_wmask(sram_io_wmask),
    .io_rdata(sram_io_rdata)
  );
  assign io_r_data = sram_io_rdata; // @[SRAM.scala 214:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_addr = io_w_en ? io_w_addr : io_r_addr; // @[SRAM.scala 102:17 219:19 90:17]
  assign sram_io_rw = io_w_en; // @[SRAM.scala 101:15 219:19 88:15]
  assign sram_io_wdata = io_w_data; // @[SRAM.scala 219:19 89:18]
  assign sram_io_wmask = io_w_mask; // @[SRAM.scala 219:19 91:45]
endmodule
module DataBank(
  input         clock,
  input         reset,
  input         io_w_en,
  input  [5:0]  io_w_set,
  input  [3:0]  io_w_way,
  input  [31:0] io_w_data,
  input  [3:0]  io_w_mask,
  input  [5:0]  io_r_set,
  output [31:0] io_r_data_0,
  output [31:0] io_r_data_1,
  output [31:0] io_r_data_2,
  output [31:0] io_r_data_3
);
  wire  bankRam_0_clock; // @[DataBank.scala 34:41]
  wire  bankRam_0_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_0_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_0_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_0_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_0_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_0_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_0_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_1_clock; // @[DataBank.scala 34:41]
  wire  bankRam_1_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_1_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_1_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_1_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_1_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_1_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_1_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_2_clock; // @[DataBank.scala 34:41]
  wire  bankRam_2_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_2_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_2_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_2_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_2_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_2_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_2_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_3_clock; // @[DataBank.scala 34:41]
  wire  bankRam_3_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_3_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_3_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_3_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_3_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_3_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_3_io_w_mask; // @[DataBank.scala 34:41]
  SRAMTemplate bankRam_0 ( // @[DataBank.scala 34:41]
    .clock(bankRam_0_clock),
    .reset(bankRam_0_reset),
    .io_r_addr(bankRam_0_io_r_addr),
    .io_r_data(bankRam_0_io_r_data),
    .io_w_en(bankRam_0_io_w_en),
    .io_w_addr(bankRam_0_io_w_addr),
    .io_w_data(bankRam_0_io_w_data),
    .io_w_mask(bankRam_0_io_w_mask)
  );
  SRAMTemplate bankRam_1 ( // @[DataBank.scala 34:41]
    .clock(bankRam_1_clock),
    .reset(bankRam_1_reset),
    .io_r_addr(bankRam_1_io_r_addr),
    .io_r_data(bankRam_1_io_r_data),
    .io_w_en(bankRam_1_io_w_en),
    .io_w_addr(bankRam_1_io_w_addr),
    .io_w_data(bankRam_1_io_w_data),
    .io_w_mask(bankRam_1_io_w_mask)
  );
  SRAMTemplate bankRam_2 ( // @[DataBank.scala 34:41]
    .clock(bankRam_2_clock),
    .reset(bankRam_2_reset),
    .io_r_addr(bankRam_2_io_r_addr),
    .io_r_data(bankRam_2_io_r_data),
    .io_w_en(bankRam_2_io_w_en),
    .io_w_addr(bankRam_2_io_w_addr),
    .io_w_data(bankRam_2_io_w_data),
    .io_w_mask(bankRam_2_io_w_mask)
  );
  SRAMTemplate bankRam_3 ( // @[DataBank.scala 34:41]
    .clock(bankRam_3_clock),
    .reset(bankRam_3_reset),
    .io_r_addr(bankRam_3_io_r_addr),
    .io_r_data(bankRam_3_io_r_data),
    .io_w_en(bankRam_3_io_w_en),
    .io_w_addr(bankRam_3_io_w_addr),
    .io_w_data(bankRam_3_io_w_data),
    .io_w_mask(bankRam_3_io_w_mask)
  );
  assign io_r_data_0 = bankRam_0_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_1 = bankRam_1_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_2 = bankRam_2_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_3 = bankRam_3_io_r_data; // @[DataBank.scala 57:22]
  assign bankRam_0_clock = clock;
  assign bankRam_0_reset = reset;
  assign bankRam_0_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_0_io_w_en = io_w_way[0] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_0_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_0_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_0_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_1_clock = clock;
  assign bankRam_1_reset = reset;
  assign bankRam_1_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_1_io_w_en = io_w_way[1] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_1_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_1_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_1_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_2_clock = clock;
  assign bankRam_2_reset = reset;
  assign bankRam_2_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_2_io_w_en = io_w_way[2] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_2_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_2_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_2_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_3_clock = clock;
  assign bankRam_3_reset = reset;
  assign bankRam_3_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_3_io_w_en = io_w_way[3] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_3_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_3_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_3_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
endmodule
module DataBankArray(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [5:0]   io_read_req_bits_set,
  input  [1:0]   io_read_req_bits_blockSelOH,
  output [31:0]  io_read_resp_bits_data_0,
  output [31:0]  io_read_resp_bits_data_1,
  output [31:0]  io_read_resp_bits_data_2,
  output [31:0]  io_read_resp_bits_data_3,
  output [127:0] io_read_resp_bits_blockData_0,
  output [127:0] io_read_resp_bits_blockData_1,
  output         io_write_req_ready,
  input          io_write_req_valid,
  input  [31:0]  io_write_req_bits_data,
  input  [5:0]   io_write_req_bits_set,
  input  [1:0]   io_write_req_bits_blockSelOH,
  input  [3:0]   io_write_req_bits_way,
  input  [3:0]   io_write_req_bits_mask
);
  wire  dataBanks_0_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_0_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_0_io_w_en; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_0_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_0_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_w_data; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_0_io_w_mask; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_0_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_1_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_1_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_1_io_w_en; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_1_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_1_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_w_data; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_1_io_w_mask; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_1_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_3; // @[DataBank.scala 90:53]
  wire  _dataBanks_0_io_w_en_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [31:0] blockData_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_2 = io_read_req_bits_blockSelOH[0] ? blockData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_3 = io_read_req_bits_blockSelOH[1] ? blockData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_5 = io_read_req_bits_blockSelOH[0] ? blockData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_6 = io_read_req_bits_blockSelOH[1] ? blockData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_8 = io_read_req_bits_blockSelOH[0] ? blockData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_9 = io_read_req_bits_blockSelOH[1] ? blockData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_11 = io_read_req_bits_blockSelOH[0] ? blockData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_12 = io_read_req_bits_blockSelOH[1] ? blockData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [63:0] lo = {blockData_0_1,blockData_0_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi = {blockData_0_3,blockData_0_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_1 = {blockData_1_1,blockData_1_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_1 = {blockData_1_3,blockData_1_2}; // @[DataBank.scala 109:57]
  DataBank dataBanks_0 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_0_clock),
    .reset(dataBanks_0_reset),
    .io_w_en(dataBanks_0_io_w_en),
    .io_w_set(dataBanks_0_io_w_set),
    .io_w_way(dataBanks_0_io_w_way),
    .io_w_data(dataBanks_0_io_w_data),
    .io_w_mask(dataBanks_0_io_w_mask),
    .io_r_set(dataBanks_0_io_r_set),
    .io_r_data_0(dataBanks_0_io_r_data_0),
    .io_r_data_1(dataBanks_0_io_r_data_1),
    .io_r_data_2(dataBanks_0_io_r_data_2),
    .io_r_data_3(dataBanks_0_io_r_data_3)
  );
  DataBank dataBanks_1 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_1_clock),
    .reset(dataBanks_1_reset),
    .io_w_en(dataBanks_1_io_w_en),
    .io_w_set(dataBanks_1_io_w_set),
    .io_w_way(dataBanks_1_io_w_way),
    .io_w_data(dataBanks_1_io_w_data),
    .io_w_mask(dataBanks_1_io_w_mask),
    .io_r_set(dataBanks_1_io_r_set),
    .io_r_data_0(dataBanks_1_io_r_data_0),
    .io_r_data_1(dataBanks_1_io_r_data_1),
    .io_r_data_2(dataBanks_1_io_r_data_2),
    .io_r_data_3(dataBanks_1_io_r_data_3)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 87:23]
  assign io_read_resp_bits_data_0 = _T_2 | _T_3; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_1 = _T_5 | _T_6; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_2 = _T_8 | _T_9; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_3 = _T_11 | _T_12; // @[Mux.scala 27:73]
  assign io_read_resp_bits_blockData_0 = {hi,lo}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_1 = {hi_1,lo_1}; // @[DataBank.scala 109:57]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 88:24]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[0]; // @[DataBank.scala 100:51]
  assign dataBanks_0_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_0_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_0_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_0_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 104:32]
  assign dataBanks_0_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[1]; // @[DataBank.scala 100:51]
  assign dataBanks_1_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_1_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_1_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_1_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 104:32]
  assign dataBanks_1_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
endmodule
module BankRam1P_1_8(
  input         clock,
  input         reset,
  input  [5:0]  io_addr,
  input         io_rw,
  input  [91:0] io_wdata,
  input  [3:0]  io_wmask,
  output [91:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [22:0] ram_0 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_0_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_0_io_rdata_MPORT_addr_pipe_0;
  reg [22:0] ram_1 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_1_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_1_io_rdata_MPORT_addr_pipe_0;
  reg [22:0] ram_2 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_2_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_2_io_rdata_MPORT_addr_pipe_0;
  reg [22:0] ram_3 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [22:0] ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_3_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_3_io_rdata_MPORT_addr_pipe_0;
  wire [45:0] io_rdata_lo = {ram_1_io_rdata_MPORT_data,ram_0_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  wire [45:0] io_rdata_hi = {ram_3_io_rdata_MPORT_data,ram_2_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  assign ram_0_io_rdata_MPORT_en = ram_0_io_rdata_MPORT_en_pipe_0;
  assign ram_0_io_rdata_MPORT_addr = ram_0_io_rdata_MPORT_addr_pipe_0;
  assign ram_0_io_rdata_MPORT_data = ram_0[ram_0_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_0_MPORT_data = 23'h0;
  assign ram_0_MPORT_addr = 6'h0;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = reset;
  assign ram_0_MPORT_1_data = 23'h0;
  assign ram_0_MPORT_1_addr = 6'h1;
  assign ram_0_MPORT_1_mask = 1'h1;
  assign ram_0_MPORT_1_en = reset;
  assign ram_0_MPORT_2_data = 23'h0;
  assign ram_0_MPORT_2_addr = 6'h2;
  assign ram_0_MPORT_2_mask = 1'h1;
  assign ram_0_MPORT_2_en = reset;
  assign ram_0_MPORT_3_data = 23'h0;
  assign ram_0_MPORT_3_addr = 6'h3;
  assign ram_0_MPORT_3_mask = 1'h1;
  assign ram_0_MPORT_3_en = reset;
  assign ram_0_MPORT_4_data = 23'h0;
  assign ram_0_MPORT_4_addr = 6'h4;
  assign ram_0_MPORT_4_mask = 1'h1;
  assign ram_0_MPORT_4_en = reset;
  assign ram_0_MPORT_5_data = 23'h0;
  assign ram_0_MPORT_5_addr = 6'h5;
  assign ram_0_MPORT_5_mask = 1'h1;
  assign ram_0_MPORT_5_en = reset;
  assign ram_0_MPORT_6_data = 23'h0;
  assign ram_0_MPORT_6_addr = 6'h6;
  assign ram_0_MPORT_6_mask = 1'h1;
  assign ram_0_MPORT_6_en = reset;
  assign ram_0_MPORT_7_data = 23'h0;
  assign ram_0_MPORT_7_addr = 6'h7;
  assign ram_0_MPORT_7_mask = 1'h1;
  assign ram_0_MPORT_7_en = reset;
  assign ram_0_MPORT_8_data = 23'h0;
  assign ram_0_MPORT_8_addr = 6'h8;
  assign ram_0_MPORT_8_mask = 1'h1;
  assign ram_0_MPORT_8_en = reset;
  assign ram_0_MPORT_9_data = 23'h0;
  assign ram_0_MPORT_9_addr = 6'h9;
  assign ram_0_MPORT_9_mask = 1'h1;
  assign ram_0_MPORT_9_en = reset;
  assign ram_0_MPORT_10_data = 23'h0;
  assign ram_0_MPORT_10_addr = 6'ha;
  assign ram_0_MPORT_10_mask = 1'h1;
  assign ram_0_MPORT_10_en = reset;
  assign ram_0_MPORT_11_data = 23'h0;
  assign ram_0_MPORT_11_addr = 6'hb;
  assign ram_0_MPORT_11_mask = 1'h1;
  assign ram_0_MPORT_11_en = reset;
  assign ram_0_MPORT_12_data = 23'h0;
  assign ram_0_MPORT_12_addr = 6'hc;
  assign ram_0_MPORT_12_mask = 1'h1;
  assign ram_0_MPORT_12_en = reset;
  assign ram_0_MPORT_13_data = 23'h0;
  assign ram_0_MPORT_13_addr = 6'hd;
  assign ram_0_MPORT_13_mask = 1'h1;
  assign ram_0_MPORT_13_en = reset;
  assign ram_0_MPORT_14_data = 23'h0;
  assign ram_0_MPORT_14_addr = 6'he;
  assign ram_0_MPORT_14_mask = 1'h1;
  assign ram_0_MPORT_14_en = reset;
  assign ram_0_MPORT_15_data = 23'h0;
  assign ram_0_MPORT_15_addr = 6'hf;
  assign ram_0_MPORT_15_mask = 1'h1;
  assign ram_0_MPORT_15_en = reset;
  assign ram_0_MPORT_16_data = 23'h0;
  assign ram_0_MPORT_16_addr = 6'h10;
  assign ram_0_MPORT_16_mask = 1'h1;
  assign ram_0_MPORT_16_en = reset;
  assign ram_0_MPORT_17_data = 23'h0;
  assign ram_0_MPORT_17_addr = 6'h11;
  assign ram_0_MPORT_17_mask = 1'h1;
  assign ram_0_MPORT_17_en = reset;
  assign ram_0_MPORT_18_data = 23'h0;
  assign ram_0_MPORT_18_addr = 6'h12;
  assign ram_0_MPORT_18_mask = 1'h1;
  assign ram_0_MPORT_18_en = reset;
  assign ram_0_MPORT_19_data = 23'h0;
  assign ram_0_MPORT_19_addr = 6'h13;
  assign ram_0_MPORT_19_mask = 1'h1;
  assign ram_0_MPORT_19_en = reset;
  assign ram_0_MPORT_20_data = 23'h0;
  assign ram_0_MPORT_20_addr = 6'h14;
  assign ram_0_MPORT_20_mask = 1'h1;
  assign ram_0_MPORT_20_en = reset;
  assign ram_0_MPORT_21_data = 23'h0;
  assign ram_0_MPORT_21_addr = 6'h15;
  assign ram_0_MPORT_21_mask = 1'h1;
  assign ram_0_MPORT_21_en = reset;
  assign ram_0_MPORT_22_data = 23'h0;
  assign ram_0_MPORT_22_addr = 6'h16;
  assign ram_0_MPORT_22_mask = 1'h1;
  assign ram_0_MPORT_22_en = reset;
  assign ram_0_MPORT_23_data = 23'h0;
  assign ram_0_MPORT_23_addr = 6'h17;
  assign ram_0_MPORT_23_mask = 1'h1;
  assign ram_0_MPORT_23_en = reset;
  assign ram_0_MPORT_24_data = 23'h0;
  assign ram_0_MPORT_24_addr = 6'h18;
  assign ram_0_MPORT_24_mask = 1'h1;
  assign ram_0_MPORT_24_en = reset;
  assign ram_0_MPORT_25_data = 23'h0;
  assign ram_0_MPORT_25_addr = 6'h19;
  assign ram_0_MPORT_25_mask = 1'h1;
  assign ram_0_MPORT_25_en = reset;
  assign ram_0_MPORT_26_data = 23'h0;
  assign ram_0_MPORT_26_addr = 6'h1a;
  assign ram_0_MPORT_26_mask = 1'h1;
  assign ram_0_MPORT_26_en = reset;
  assign ram_0_MPORT_27_data = 23'h0;
  assign ram_0_MPORT_27_addr = 6'h1b;
  assign ram_0_MPORT_27_mask = 1'h1;
  assign ram_0_MPORT_27_en = reset;
  assign ram_0_MPORT_28_data = 23'h0;
  assign ram_0_MPORT_28_addr = 6'h1c;
  assign ram_0_MPORT_28_mask = 1'h1;
  assign ram_0_MPORT_28_en = reset;
  assign ram_0_MPORT_29_data = 23'h0;
  assign ram_0_MPORT_29_addr = 6'h1d;
  assign ram_0_MPORT_29_mask = 1'h1;
  assign ram_0_MPORT_29_en = reset;
  assign ram_0_MPORT_30_data = 23'h0;
  assign ram_0_MPORT_30_addr = 6'h1e;
  assign ram_0_MPORT_30_mask = 1'h1;
  assign ram_0_MPORT_30_en = reset;
  assign ram_0_MPORT_31_data = 23'h0;
  assign ram_0_MPORT_31_addr = 6'h1f;
  assign ram_0_MPORT_31_mask = 1'h1;
  assign ram_0_MPORT_31_en = reset;
  assign ram_0_MPORT_32_data = 23'h0;
  assign ram_0_MPORT_32_addr = 6'h20;
  assign ram_0_MPORT_32_mask = 1'h1;
  assign ram_0_MPORT_32_en = reset;
  assign ram_0_MPORT_33_data = 23'h0;
  assign ram_0_MPORT_33_addr = 6'h21;
  assign ram_0_MPORT_33_mask = 1'h1;
  assign ram_0_MPORT_33_en = reset;
  assign ram_0_MPORT_34_data = 23'h0;
  assign ram_0_MPORT_34_addr = 6'h22;
  assign ram_0_MPORT_34_mask = 1'h1;
  assign ram_0_MPORT_34_en = reset;
  assign ram_0_MPORT_35_data = 23'h0;
  assign ram_0_MPORT_35_addr = 6'h23;
  assign ram_0_MPORT_35_mask = 1'h1;
  assign ram_0_MPORT_35_en = reset;
  assign ram_0_MPORT_36_data = 23'h0;
  assign ram_0_MPORT_36_addr = 6'h24;
  assign ram_0_MPORT_36_mask = 1'h1;
  assign ram_0_MPORT_36_en = reset;
  assign ram_0_MPORT_37_data = 23'h0;
  assign ram_0_MPORT_37_addr = 6'h25;
  assign ram_0_MPORT_37_mask = 1'h1;
  assign ram_0_MPORT_37_en = reset;
  assign ram_0_MPORT_38_data = 23'h0;
  assign ram_0_MPORT_38_addr = 6'h26;
  assign ram_0_MPORT_38_mask = 1'h1;
  assign ram_0_MPORT_38_en = reset;
  assign ram_0_MPORT_39_data = 23'h0;
  assign ram_0_MPORT_39_addr = 6'h27;
  assign ram_0_MPORT_39_mask = 1'h1;
  assign ram_0_MPORT_39_en = reset;
  assign ram_0_MPORT_40_data = 23'h0;
  assign ram_0_MPORT_40_addr = 6'h28;
  assign ram_0_MPORT_40_mask = 1'h1;
  assign ram_0_MPORT_40_en = reset;
  assign ram_0_MPORT_41_data = 23'h0;
  assign ram_0_MPORT_41_addr = 6'h29;
  assign ram_0_MPORT_41_mask = 1'h1;
  assign ram_0_MPORT_41_en = reset;
  assign ram_0_MPORT_42_data = 23'h0;
  assign ram_0_MPORT_42_addr = 6'h2a;
  assign ram_0_MPORT_42_mask = 1'h1;
  assign ram_0_MPORT_42_en = reset;
  assign ram_0_MPORT_43_data = 23'h0;
  assign ram_0_MPORT_43_addr = 6'h2b;
  assign ram_0_MPORT_43_mask = 1'h1;
  assign ram_0_MPORT_43_en = reset;
  assign ram_0_MPORT_44_data = 23'h0;
  assign ram_0_MPORT_44_addr = 6'h2c;
  assign ram_0_MPORT_44_mask = 1'h1;
  assign ram_0_MPORT_44_en = reset;
  assign ram_0_MPORT_45_data = 23'h0;
  assign ram_0_MPORT_45_addr = 6'h2d;
  assign ram_0_MPORT_45_mask = 1'h1;
  assign ram_0_MPORT_45_en = reset;
  assign ram_0_MPORT_46_data = 23'h0;
  assign ram_0_MPORT_46_addr = 6'h2e;
  assign ram_0_MPORT_46_mask = 1'h1;
  assign ram_0_MPORT_46_en = reset;
  assign ram_0_MPORT_47_data = 23'h0;
  assign ram_0_MPORT_47_addr = 6'h2f;
  assign ram_0_MPORT_47_mask = 1'h1;
  assign ram_0_MPORT_47_en = reset;
  assign ram_0_MPORT_48_data = 23'h0;
  assign ram_0_MPORT_48_addr = 6'h30;
  assign ram_0_MPORT_48_mask = 1'h1;
  assign ram_0_MPORT_48_en = reset;
  assign ram_0_MPORT_49_data = 23'h0;
  assign ram_0_MPORT_49_addr = 6'h31;
  assign ram_0_MPORT_49_mask = 1'h1;
  assign ram_0_MPORT_49_en = reset;
  assign ram_0_MPORT_50_data = 23'h0;
  assign ram_0_MPORT_50_addr = 6'h32;
  assign ram_0_MPORT_50_mask = 1'h1;
  assign ram_0_MPORT_50_en = reset;
  assign ram_0_MPORT_51_data = 23'h0;
  assign ram_0_MPORT_51_addr = 6'h33;
  assign ram_0_MPORT_51_mask = 1'h1;
  assign ram_0_MPORT_51_en = reset;
  assign ram_0_MPORT_52_data = 23'h0;
  assign ram_0_MPORT_52_addr = 6'h34;
  assign ram_0_MPORT_52_mask = 1'h1;
  assign ram_0_MPORT_52_en = reset;
  assign ram_0_MPORT_53_data = 23'h0;
  assign ram_0_MPORT_53_addr = 6'h35;
  assign ram_0_MPORT_53_mask = 1'h1;
  assign ram_0_MPORT_53_en = reset;
  assign ram_0_MPORT_54_data = 23'h0;
  assign ram_0_MPORT_54_addr = 6'h36;
  assign ram_0_MPORT_54_mask = 1'h1;
  assign ram_0_MPORT_54_en = reset;
  assign ram_0_MPORT_55_data = 23'h0;
  assign ram_0_MPORT_55_addr = 6'h37;
  assign ram_0_MPORT_55_mask = 1'h1;
  assign ram_0_MPORT_55_en = reset;
  assign ram_0_MPORT_56_data = 23'h0;
  assign ram_0_MPORT_56_addr = 6'h38;
  assign ram_0_MPORT_56_mask = 1'h1;
  assign ram_0_MPORT_56_en = reset;
  assign ram_0_MPORT_57_data = 23'h0;
  assign ram_0_MPORT_57_addr = 6'h39;
  assign ram_0_MPORT_57_mask = 1'h1;
  assign ram_0_MPORT_57_en = reset;
  assign ram_0_MPORT_58_data = 23'h0;
  assign ram_0_MPORT_58_addr = 6'h3a;
  assign ram_0_MPORT_58_mask = 1'h1;
  assign ram_0_MPORT_58_en = reset;
  assign ram_0_MPORT_59_data = 23'h0;
  assign ram_0_MPORT_59_addr = 6'h3b;
  assign ram_0_MPORT_59_mask = 1'h1;
  assign ram_0_MPORT_59_en = reset;
  assign ram_0_MPORT_60_data = 23'h0;
  assign ram_0_MPORT_60_addr = 6'h3c;
  assign ram_0_MPORT_60_mask = 1'h1;
  assign ram_0_MPORT_60_en = reset;
  assign ram_0_MPORT_61_data = 23'h0;
  assign ram_0_MPORT_61_addr = 6'h3d;
  assign ram_0_MPORT_61_mask = 1'h1;
  assign ram_0_MPORT_61_en = reset;
  assign ram_0_MPORT_62_data = 23'h0;
  assign ram_0_MPORT_62_addr = 6'h3e;
  assign ram_0_MPORT_62_mask = 1'h1;
  assign ram_0_MPORT_62_en = reset;
  assign ram_0_MPORT_63_data = 23'h0;
  assign ram_0_MPORT_63_addr = 6'h3f;
  assign ram_0_MPORT_63_mask = 1'h1;
  assign ram_0_MPORT_63_en = reset;
  assign ram_0_MPORT_64_data = io_wdata[22:0];
  assign ram_0_MPORT_64_addr = io_addr;
  assign ram_0_MPORT_64_mask = io_wmask[0];
  assign ram_0_MPORT_64_en = io_rw;
  assign ram_1_io_rdata_MPORT_en = ram_1_io_rdata_MPORT_en_pipe_0;
  assign ram_1_io_rdata_MPORT_addr = ram_1_io_rdata_MPORT_addr_pipe_0;
  assign ram_1_io_rdata_MPORT_data = ram_1[ram_1_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_1_MPORT_data = 23'h0;
  assign ram_1_MPORT_addr = 6'h0;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = reset;
  assign ram_1_MPORT_1_data = 23'h0;
  assign ram_1_MPORT_1_addr = 6'h1;
  assign ram_1_MPORT_1_mask = 1'h1;
  assign ram_1_MPORT_1_en = reset;
  assign ram_1_MPORT_2_data = 23'h0;
  assign ram_1_MPORT_2_addr = 6'h2;
  assign ram_1_MPORT_2_mask = 1'h1;
  assign ram_1_MPORT_2_en = reset;
  assign ram_1_MPORT_3_data = 23'h0;
  assign ram_1_MPORT_3_addr = 6'h3;
  assign ram_1_MPORT_3_mask = 1'h1;
  assign ram_1_MPORT_3_en = reset;
  assign ram_1_MPORT_4_data = 23'h0;
  assign ram_1_MPORT_4_addr = 6'h4;
  assign ram_1_MPORT_4_mask = 1'h1;
  assign ram_1_MPORT_4_en = reset;
  assign ram_1_MPORT_5_data = 23'h0;
  assign ram_1_MPORT_5_addr = 6'h5;
  assign ram_1_MPORT_5_mask = 1'h1;
  assign ram_1_MPORT_5_en = reset;
  assign ram_1_MPORT_6_data = 23'h0;
  assign ram_1_MPORT_6_addr = 6'h6;
  assign ram_1_MPORT_6_mask = 1'h1;
  assign ram_1_MPORT_6_en = reset;
  assign ram_1_MPORT_7_data = 23'h0;
  assign ram_1_MPORT_7_addr = 6'h7;
  assign ram_1_MPORT_7_mask = 1'h1;
  assign ram_1_MPORT_7_en = reset;
  assign ram_1_MPORT_8_data = 23'h0;
  assign ram_1_MPORT_8_addr = 6'h8;
  assign ram_1_MPORT_8_mask = 1'h1;
  assign ram_1_MPORT_8_en = reset;
  assign ram_1_MPORT_9_data = 23'h0;
  assign ram_1_MPORT_9_addr = 6'h9;
  assign ram_1_MPORT_9_mask = 1'h1;
  assign ram_1_MPORT_9_en = reset;
  assign ram_1_MPORT_10_data = 23'h0;
  assign ram_1_MPORT_10_addr = 6'ha;
  assign ram_1_MPORT_10_mask = 1'h1;
  assign ram_1_MPORT_10_en = reset;
  assign ram_1_MPORT_11_data = 23'h0;
  assign ram_1_MPORT_11_addr = 6'hb;
  assign ram_1_MPORT_11_mask = 1'h1;
  assign ram_1_MPORT_11_en = reset;
  assign ram_1_MPORT_12_data = 23'h0;
  assign ram_1_MPORT_12_addr = 6'hc;
  assign ram_1_MPORT_12_mask = 1'h1;
  assign ram_1_MPORT_12_en = reset;
  assign ram_1_MPORT_13_data = 23'h0;
  assign ram_1_MPORT_13_addr = 6'hd;
  assign ram_1_MPORT_13_mask = 1'h1;
  assign ram_1_MPORT_13_en = reset;
  assign ram_1_MPORT_14_data = 23'h0;
  assign ram_1_MPORT_14_addr = 6'he;
  assign ram_1_MPORT_14_mask = 1'h1;
  assign ram_1_MPORT_14_en = reset;
  assign ram_1_MPORT_15_data = 23'h0;
  assign ram_1_MPORT_15_addr = 6'hf;
  assign ram_1_MPORT_15_mask = 1'h1;
  assign ram_1_MPORT_15_en = reset;
  assign ram_1_MPORT_16_data = 23'h0;
  assign ram_1_MPORT_16_addr = 6'h10;
  assign ram_1_MPORT_16_mask = 1'h1;
  assign ram_1_MPORT_16_en = reset;
  assign ram_1_MPORT_17_data = 23'h0;
  assign ram_1_MPORT_17_addr = 6'h11;
  assign ram_1_MPORT_17_mask = 1'h1;
  assign ram_1_MPORT_17_en = reset;
  assign ram_1_MPORT_18_data = 23'h0;
  assign ram_1_MPORT_18_addr = 6'h12;
  assign ram_1_MPORT_18_mask = 1'h1;
  assign ram_1_MPORT_18_en = reset;
  assign ram_1_MPORT_19_data = 23'h0;
  assign ram_1_MPORT_19_addr = 6'h13;
  assign ram_1_MPORT_19_mask = 1'h1;
  assign ram_1_MPORT_19_en = reset;
  assign ram_1_MPORT_20_data = 23'h0;
  assign ram_1_MPORT_20_addr = 6'h14;
  assign ram_1_MPORT_20_mask = 1'h1;
  assign ram_1_MPORT_20_en = reset;
  assign ram_1_MPORT_21_data = 23'h0;
  assign ram_1_MPORT_21_addr = 6'h15;
  assign ram_1_MPORT_21_mask = 1'h1;
  assign ram_1_MPORT_21_en = reset;
  assign ram_1_MPORT_22_data = 23'h0;
  assign ram_1_MPORT_22_addr = 6'h16;
  assign ram_1_MPORT_22_mask = 1'h1;
  assign ram_1_MPORT_22_en = reset;
  assign ram_1_MPORT_23_data = 23'h0;
  assign ram_1_MPORT_23_addr = 6'h17;
  assign ram_1_MPORT_23_mask = 1'h1;
  assign ram_1_MPORT_23_en = reset;
  assign ram_1_MPORT_24_data = 23'h0;
  assign ram_1_MPORT_24_addr = 6'h18;
  assign ram_1_MPORT_24_mask = 1'h1;
  assign ram_1_MPORT_24_en = reset;
  assign ram_1_MPORT_25_data = 23'h0;
  assign ram_1_MPORT_25_addr = 6'h19;
  assign ram_1_MPORT_25_mask = 1'h1;
  assign ram_1_MPORT_25_en = reset;
  assign ram_1_MPORT_26_data = 23'h0;
  assign ram_1_MPORT_26_addr = 6'h1a;
  assign ram_1_MPORT_26_mask = 1'h1;
  assign ram_1_MPORT_26_en = reset;
  assign ram_1_MPORT_27_data = 23'h0;
  assign ram_1_MPORT_27_addr = 6'h1b;
  assign ram_1_MPORT_27_mask = 1'h1;
  assign ram_1_MPORT_27_en = reset;
  assign ram_1_MPORT_28_data = 23'h0;
  assign ram_1_MPORT_28_addr = 6'h1c;
  assign ram_1_MPORT_28_mask = 1'h1;
  assign ram_1_MPORT_28_en = reset;
  assign ram_1_MPORT_29_data = 23'h0;
  assign ram_1_MPORT_29_addr = 6'h1d;
  assign ram_1_MPORT_29_mask = 1'h1;
  assign ram_1_MPORT_29_en = reset;
  assign ram_1_MPORT_30_data = 23'h0;
  assign ram_1_MPORT_30_addr = 6'h1e;
  assign ram_1_MPORT_30_mask = 1'h1;
  assign ram_1_MPORT_30_en = reset;
  assign ram_1_MPORT_31_data = 23'h0;
  assign ram_1_MPORT_31_addr = 6'h1f;
  assign ram_1_MPORT_31_mask = 1'h1;
  assign ram_1_MPORT_31_en = reset;
  assign ram_1_MPORT_32_data = 23'h0;
  assign ram_1_MPORT_32_addr = 6'h20;
  assign ram_1_MPORT_32_mask = 1'h1;
  assign ram_1_MPORT_32_en = reset;
  assign ram_1_MPORT_33_data = 23'h0;
  assign ram_1_MPORT_33_addr = 6'h21;
  assign ram_1_MPORT_33_mask = 1'h1;
  assign ram_1_MPORT_33_en = reset;
  assign ram_1_MPORT_34_data = 23'h0;
  assign ram_1_MPORT_34_addr = 6'h22;
  assign ram_1_MPORT_34_mask = 1'h1;
  assign ram_1_MPORT_34_en = reset;
  assign ram_1_MPORT_35_data = 23'h0;
  assign ram_1_MPORT_35_addr = 6'h23;
  assign ram_1_MPORT_35_mask = 1'h1;
  assign ram_1_MPORT_35_en = reset;
  assign ram_1_MPORT_36_data = 23'h0;
  assign ram_1_MPORT_36_addr = 6'h24;
  assign ram_1_MPORT_36_mask = 1'h1;
  assign ram_1_MPORT_36_en = reset;
  assign ram_1_MPORT_37_data = 23'h0;
  assign ram_1_MPORT_37_addr = 6'h25;
  assign ram_1_MPORT_37_mask = 1'h1;
  assign ram_1_MPORT_37_en = reset;
  assign ram_1_MPORT_38_data = 23'h0;
  assign ram_1_MPORT_38_addr = 6'h26;
  assign ram_1_MPORT_38_mask = 1'h1;
  assign ram_1_MPORT_38_en = reset;
  assign ram_1_MPORT_39_data = 23'h0;
  assign ram_1_MPORT_39_addr = 6'h27;
  assign ram_1_MPORT_39_mask = 1'h1;
  assign ram_1_MPORT_39_en = reset;
  assign ram_1_MPORT_40_data = 23'h0;
  assign ram_1_MPORT_40_addr = 6'h28;
  assign ram_1_MPORT_40_mask = 1'h1;
  assign ram_1_MPORT_40_en = reset;
  assign ram_1_MPORT_41_data = 23'h0;
  assign ram_1_MPORT_41_addr = 6'h29;
  assign ram_1_MPORT_41_mask = 1'h1;
  assign ram_1_MPORT_41_en = reset;
  assign ram_1_MPORT_42_data = 23'h0;
  assign ram_1_MPORT_42_addr = 6'h2a;
  assign ram_1_MPORT_42_mask = 1'h1;
  assign ram_1_MPORT_42_en = reset;
  assign ram_1_MPORT_43_data = 23'h0;
  assign ram_1_MPORT_43_addr = 6'h2b;
  assign ram_1_MPORT_43_mask = 1'h1;
  assign ram_1_MPORT_43_en = reset;
  assign ram_1_MPORT_44_data = 23'h0;
  assign ram_1_MPORT_44_addr = 6'h2c;
  assign ram_1_MPORT_44_mask = 1'h1;
  assign ram_1_MPORT_44_en = reset;
  assign ram_1_MPORT_45_data = 23'h0;
  assign ram_1_MPORT_45_addr = 6'h2d;
  assign ram_1_MPORT_45_mask = 1'h1;
  assign ram_1_MPORT_45_en = reset;
  assign ram_1_MPORT_46_data = 23'h0;
  assign ram_1_MPORT_46_addr = 6'h2e;
  assign ram_1_MPORT_46_mask = 1'h1;
  assign ram_1_MPORT_46_en = reset;
  assign ram_1_MPORT_47_data = 23'h0;
  assign ram_1_MPORT_47_addr = 6'h2f;
  assign ram_1_MPORT_47_mask = 1'h1;
  assign ram_1_MPORT_47_en = reset;
  assign ram_1_MPORT_48_data = 23'h0;
  assign ram_1_MPORT_48_addr = 6'h30;
  assign ram_1_MPORT_48_mask = 1'h1;
  assign ram_1_MPORT_48_en = reset;
  assign ram_1_MPORT_49_data = 23'h0;
  assign ram_1_MPORT_49_addr = 6'h31;
  assign ram_1_MPORT_49_mask = 1'h1;
  assign ram_1_MPORT_49_en = reset;
  assign ram_1_MPORT_50_data = 23'h0;
  assign ram_1_MPORT_50_addr = 6'h32;
  assign ram_1_MPORT_50_mask = 1'h1;
  assign ram_1_MPORT_50_en = reset;
  assign ram_1_MPORT_51_data = 23'h0;
  assign ram_1_MPORT_51_addr = 6'h33;
  assign ram_1_MPORT_51_mask = 1'h1;
  assign ram_1_MPORT_51_en = reset;
  assign ram_1_MPORT_52_data = 23'h0;
  assign ram_1_MPORT_52_addr = 6'h34;
  assign ram_1_MPORT_52_mask = 1'h1;
  assign ram_1_MPORT_52_en = reset;
  assign ram_1_MPORT_53_data = 23'h0;
  assign ram_1_MPORT_53_addr = 6'h35;
  assign ram_1_MPORT_53_mask = 1'h1;
  assign ram_1_MPORT_53_en = reset;
  assign ram_1_MPORT_54_data = 23'h0;
  assign ram_1_MPORT_54_addr = 6'h36;
  assign ram_1_MPORT_54_mask = 1'h1;
  assign ram_1_MPORT_54_en = reset;
  assign ram_1_MPORT_55_data = 23'h0;
  assign ram_1_MPORT_55_addr = 6'h37;
  assign ram_1_MPORT_55_mask = 1'h1;
  assign ram_1_MPORT_55_en = reset;
  assign ram_1_MPORT_56_data = 23'h0;
  assign ram_1_MPORT_56_addr = 6'h38;
  assign ram_1_MPORT_56_mask = 1'h1;
  assign ram_1_MPORT_56_en = reset;
  assign ram_1_MPORT_57_data = 23'h0;
  assign ram_1_MPORT_57_addr = 6'h39;
  assign ram_1_MPORT_57_mask = 1'h1;
  assign ram_1_MPORT_57_en = reset;
  assign ram_1_MPORT_58_data = 23'h0;
  assign ram_1_MPORT_58_addr = 6'h3a;
  assign ram_1_MPORT_58_mask = 1'h1;
  assign ram_1_MPORT_58_en = reset;
  assign ram_1_MPORT_59_data = 23'h0;
  assign ram_1_MPORT_59_addr = 6'h3b;
  assign ram_1_MPORT_59_mask = 1'h1;
  assign ram_1_MPORT_59_en = reset;
  assign ram_1_MPORT_60_data = 23'h0;
  assign ram_1_MPORT_60_addr = 6'h3c;
  assign ram_1_MPORT_60_mask = 1'h1;
  assign ram_1_MPORT_60_en = reset;
  assign ram_1_MPORT_61_data = 23'h0;
  assign ram_1_MPORT_61_addr = 6'h3d;
  assign ram_1_MPORT_61_mask = 1'h1;
  assign ram_1_MPORT_61_en = reset;
  assign ram_1_MPORT_62_data = 23'h0;
  assign ram_1_MPORT_62_addr = 6'h3e;
  assign ram_1_MPORT_62_mask = 1'h1;
  assign ram_1_MPORT_62_en = reset;
  assign ram_1_MPORT_63_data = 23'h0;
  assign ram_1_MPORT_63_addr = 6'h3f;
  assign ram_1_MPORT_63_mask = 1'h1;
  assign ram_1_MPORT_63_en = reset;
  assign ram_1_MPORT_64_data = io_wdata[45:23];
  assign ram_1_MPORT_64_addr = io_addr;
  assign ram_1_MPORT_64_mask = io_wmask[1];
  assign ram_1_MPORT_64_en = io_rw;
  assign ram_2_io_rdata_MPORT_en = ram_2_io_rdata_MPORT_en_pipe_0;
  assign ram_2_io_rdata_MPORT_addr = ram_2_io_rdata_MPORT_addr_pipe_0;
  assign ram_2_io_rdata_MPORT_data = ram_2[ram_2_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_2_MPORT_data = 23'h0;
  assign ram_2_MPORT_addr = 6'h0;
  assign ram_2_MPORT_mask = 1'h1;
  assign ram_2_MPORT_en = reset;
  assign ram_2_MPORT_1_data = 23'h0;
  assign ram_2_MPORT_1_addr = 6'h1;
  assign ram_2_MPORT_1_mask = 1'h1;
  assign ram_2_MPORT_1_en = reset;
  assign ram_2_MPORT_2_data = 23'h0;
  assign ram_2_MPORT_2_addr = 6'h2;
  assign ram_2_MPORT_2_mask = 1'h1;
  assign ram_2_MPORT_2_en = reset;
  assign ram_2_MPORT_3_data = 23'h0;
  assign ram_2_MPORT_3_addr = 6'h3;
  assign ram_2_MPORT_3_mask = 1'h1;
  assign ram_2_MPORT_3_en = reset;
  assign ram_2_MPORT_4_data = 23'h0;
  assign ram_2_MPORT_4_addr = 6'h4;
  assign ram_2_MPORT_4_mask = 1'h1;
  assign ram_2_MPORT_4_en = reset;
  assign ram_2_MPORT_5_data = 23'h0;
  assign ram_2_MPORT_5_addr = 6'h5;
  assign ram_2_MPORT_5_mask = 1'h1;
  assign ram_2_MPORT_5_en = reset;
  assign ram_2_MPORT_6_data = 23'h0;
  assign ram_2_MPORT_6_addr = 6'h6;
  assign ram_2_MPORT_6_mask = 1'h1;
  assign ram_2_MPORT_6_en = reset;
  assign ram_2_MPORT_7_data = 23'h0;
  assign ram_2_MPORT_7_addr = 6'h7;
  assign ram_2_MPORT_7_mask = 1'h1;
  assign ram_2_MPORT_7_en = reset;
  assign ram_2_MPORT_8_data = 23'h0;
  assign ram_2_MPORT_8_addr = 6'h8;
  assign ram_2_MPORT_8_mask = 1'h1;
  assign ram_2_MPORT_8_en = reset;
  assign ram_2_MPORT_9_data = 23'h0;
  assign ram_2_MPORT_9_addr = 6'h9;
  assign ram_2_MPORT_9_mask = 1'h1;
  assign ram_2_MPORT_9_en = reset;
  assign ram_2_MPORT_10_data = 23'h0;
  assign ram_2_MPORT_10_addr = 6'ha;
  assign ram_2_MPORT_10_mask = 1'h1;
  assign ram_2_MPORT_10_en = reset;
  assign ram_2_MPORT_11_data = 23'h0;
  assign ram_2_MPORT_11_addr = 6'hb;
  assign ram_2_MPORT_11_mask = 1'h1;
  assign ram_2_MPORT_11_en = reset;
  assign ram_2_MPORT_12_data = 23'h0;
  assign ram_2_MPORT_12_addr = 6'hc;
  assign ram_2_MPORT_12_mask = 1'h1;
  assign ram_2_MPORT_12_en = reset;
  assign ram_2_MPORT_13_data = 23'h0;
  assign ram_2_MPORT_13_addr = 6'hd;
  assign ram_2_MPORT_13_mask = 1'h1;
  assign ram_2_MPORT_13_en = reset;
  assign ram_2_MPORT_14_data = 23'h0;
  assign ram_2_MPORT_14_addr = 6'he;
  assign ram_2_MPORT_14_mask = 1'h1;
  assign ram_2_MPORT_14_en = reset;
  assign ram_2_MPORT_15_data = 23'h0;
  assign ram_2_MPORT_15_addr = 6'hf;
  assign ram_2_MPORT_15_mask = 1'h1;
  assign ram_2_MPORT_15_en = reset;
  assign ram_2_MPORT_16_data = 23'h0;
  assign ram_2_MPORT_16_addr = 6'h10;
  assign ram_2_MPORT_16_mask = 1'h1;
  assign ram_2_MPORT_16_en = reset;
  assign ram_2_MPORT_17_data = 23'h0;
  assign ram_2_MPORT_17_addr = 6'h11;
  assign ram_2_MPORT_17_mask = 1'h1;
  assign ram_2_MPORT_17_en = reset;
  assign ram_2_MPORT_18_data = 23'h0;
  assign ram_2_MPORT_18_addr = 6'h12;
  assign ram_2_MPORT_18_mask = 1'h1;
  assign ram_2_MPORT_18_en = reset;
  assign ram_2_MPORT_19_data = 23'h0;
  assign ram_2_MPORT_19_addr = 6'h13;
  assign ram_2_MPORT_19_mask = 1'h1;
  assign ram_2_MPORT_19_en = reset;
  assign ram_2_MPORT_20_data = 23'h0;
  assign ram_2_MPORT_20_addr = 6'h14;
  assign ram_2_MPORT_20_mask = 1'h1;
  assign ram_2_MPORT_20_en = reset;
  assign ram_2_MPORT_21_data = 23'h0;
  assign ram_2_MPORT_21_addr = 6'h15;
  assign ram_2_MPORT_21_mask = 1'h1;
  assign ram_2_MPORT_21_en = reset;
  assign ram_2_MPORT_22_data = 23'h0;
  assign ram_2_MPORT_22_addr = 6'h16;
  assign ram_2_MPORT_22_mask = 1'h1;
  assign ram_2_MPORT_22_en = reset;
  assign ram_2_MPORT_23_data = 23'h0;
  assign ram_2_MPORT_23_addr = 6'h17;
  assign ram_2_MPORT_23_mask = 1'h1;
  assign ram_2_MPORT_23_en = reset;
  assign ram_2_MPORT_24_data = 23'h0;
  assign ram_2_MPORT_24_addr = 6'h18;
  assign ram_2_MPORT_24_mask = 1'h1;
  assign ram_2_MPORT_24_en = reset;
  assign ram_2_MPORT_25_data = 23'h0;
  assign ram_2_MPORT_25_addr = 6'h19;
  assign ram_2_MPORT_25_mask = 1'h1;
  assign ram_2_MPORT_25_en = reset;
  assign ram_2_MPORT_26_data = 23'h0;
  assign ram_2_MPORT_26_addr = 6'h1a;
  assign ram_2_MPORT_26_mask = 1'h1;
  assign ram_2_MPORT_26_en = reset;
  assign ram_2_MPORT_27_data = 23'h0;
  assign ram_2_MPORT_27_addr = 6'h1b;
  assign ram_2_MPORT_27_mask = 1'h1;
  assign ram_2_MPORT_27_en = reset;
  assign ram_2_MPORT_28_data = 23'h0;
  assign ram_2_MPORT_28_addr = 6'h1c;
  assign ram_2_MPORT_28_mask = 1'h1;
  assign ram_2_MPORT_28_en = reset;
  assign ram_2_MPORT_29_data = 23'h0;
  assign ram_2_MPORT_29_addr = 6'h1d;
  assign ram_2_MPORT_29_mask = 1'h1;
  assign ram_2_MPORT_29_en = reset;
  assign ram_2_MPORT_30_data = 23'h0;
  assign ram_2_MPORT_30_addr = 6'h1e;
  assign ram_2_MPORT_30_mask = 1'h1;
  assign ram_2_MPORT_30_en = reset;
  assign ram_2_MPORT_31_data = 23'h0;
  assign ram_2_MPORT_31_addr = 6'h1f;
  assign ram_2_MPORT_31_mask = 1'h1;
  assign ram_2_MPORT_31_en = reset;
  assign ram_2_MPORT_32_data = 23'h0;
  assign ram_2_MPORT_32_addr = 6'h20;
  assign ram_2_MPORT_32_mask = 1'h1;
  assign ram_2_MPORT_32_en = reset;
  assign ram_2_MPORT_33_data = 23'h0;
  assign ram_2_MPORT_33_addr = 6'h21;
  assign ram_2_MPORT_33_mask = 1'h1;
  assign ram_2_MPORT_33_en = reset;
  assign ram_2_MPORT_34_data = 23'h0;
  assign ram_2_MPORT_34_addr = 6'h22;
  assign ram_2_MPORT_34_mask = 1'h1;
  assign ram_2_MPORT_34_en = reset;
  assign ram_2_MPORT_35_data = 23'h0;
  assign ram_2_MPORT_35_addr = 6'h23;
  assign ram_2_MPORT_35_mask = 1'h1;
  assign ram_2_MPORT_35_en = reset;
  assign ram_2_MPORT_36_data = 23'h0;
  assign ram_2_MPORT_36_addr = 6'h24;
  assign ram_2_MPORT_36_mask = 1'h1;
  assign ram_2_MPORT_36_en = reset;
  assign ram_2_MPORT_37_data = 23'h0;
  assign ram_2_MPORT_37_addr = 6'h25;
  assign ram_2_MPORT_37_mask = 1'h1;
  assign ram_2_MPORT_37_en = reset;
  assign ram_2_MPORT_38_data = 23'h0;
  assign ram_2_MPORT_38_addr = 6'h26;
  assign ram_2_MPORT_38_mask = 1'h1;
  assign ram_2_MPORT_38_en = reset;
  assign ram_2_MPORT_39_data = 23'h0;
  assign ram_2_MPORT_39_addr = 6'h27;
  assign ram_2_MPORT_39_mask = 1'h1;
  assign ram_2_MPORT_39_en = reset;
  assign ram_2_MPORT_40_data = 23'h0;
  assign ram_2_MPORT_40_addr = 6'h28;
  assign ram_2_MPORT_40_mask = 1'h1;
  assign ram_2_MPORT_40_en = reset;
  assign ram_2_MPORT_41_data = 23'h0;
  assign ram_2_MPORT_41_addr = 6'h29;
  assign ram_2_MPORT_41_mask = 1'h1;
  assign ram_2_MPORT_41_en = reset;
  assign ram_2_MPORT_42_data = 23'h0;
  assign ram_2_MPORT_42_addr = 6'h2a;
  assign ram_2_MPORT_42_mask = 1'h1;
  assign ram_2_MPORT_42_en = reset;
  assign ram_2_MPORT_43_data = 23'h0;
  assign ram_2_MPORT_43_addr = 6'h2b;
  assign ram_2_MPORT_43_mask = 1'h1;
  assign ram_2_MPORT_43_en = reset;
  assign ram_2_MPORT_44_data = 23'h0;
  assign ram_2_MPORT_44_addr = 6'h2c;
  assign ram_2_MPORT_44_mask = 1'h1;
  assign ram_2_MPORT_44_en = reset;
  assign ram_2_MPORT_45_data = 23'h0;
  assign ram_2_MPORT_45_addr = 6'h2d;
  assign ram_2_MPORT_45_mask = 1'h1;
  assign ram_2_MPORT_45_en = reset;
  assign ram_2_MPORT_46_data = 23'h0;
  assign ram_2_MPORT_46_addr = 6'h2e;
  assign ram_2_MPORT_46_mask = 1'h1;
  assign ram_2_MPORT_46_en = reset;
  assign ram_2_MPORT_47_data = 23'h0;
  assign ram_2_MPORT_47_addr = 6'h2f;
  assign ram_2_MPORT_47_mask = 1'h1;
  assign ram_2_MPORT_47_en = reset;
  assign ram_2_MPORT_48_data = 23'h0;
  assign ram_2_MPORT_48_addr = 6'h30;
  assign ram_2_MPORT_48_mask = 1'h1;
  assign ram_2_MPORT_48_en = reset;
  assign ram_2_MPORT_49_data = 23'h0;
  assign ram_2_MPORT_49_addr = 6'h31;
  assign ram_2_MPORT_49_mask = 1'h1;
  assign ram_2_MPORT_49_en = reset;
  assign ram_2_MPORT_50_data = 23'h0;
  assign ram_2_MPORT_50_addr = 6'h32;
  assign ram_2_MPORT_50_mask = 1'h1;
  assign ram_2_MPORT_50_en = reset;
  assign ram_2_MPORT_51_data = 23'h0;
  assign ram_2_MPORT_51_addr = 6'h33;
  assign ram_2_MPORT_51_mask = 1'h1;
  assign ram_2_MPORT_51_en = reset;
  assign ram_2_MPORT_52_data = 23'h0;
  assign ram_2_MPORT_52_addr = 6'h34;
  assign ram_2_MPORT_52_mask = 1'h1;
  assign ram_2_MPORT_52_en = reset;
  assign ram_2_MPORT_53_data = 23'h0;
  assign ram_2_MPORT_53_addr = 6'h35;
  assign ram_2_MPORT_53_mask = 1'h1;
  assign ram_2_MPORT_53_en = reset;
  assign ram_2_MPORT_54_data = 23'h0;
  assign ram_2_MPORT_54_addr = 6'h36;
  assign ram_2_MPORT_54_mask = 1'h1;
  assign ram_2_MPORT_54_en = reset;
  assign ram_2_MPORT_55_data = 23'h0;
  assign ram_2_MPORT_55_addr = 6'h37;
  assign ram_2_MPORT_55_mask = 1'h1;
  assign ram_2_MPORT_55_en = reset;
  assign ram_2_MPORT_56_data = 23'h0;
  assign ram_2_MPORT_56_addr = 6'h38;
  assign ram_2_MPORT_56_mask = 1'h1;
  assign ram_2_MPORT_56_en = reset;
  assign ram_2_MPORT_57_data = 23'h0;
  assign ram_2_MPORT_57_addr = 6'h39;
  assign ram_2_MPORT_57_mask = 1'h1;
  assign ram_2_MPORT_57_en = reset;
  assign ram_2_MPORT_58_data = 23'h0;
  assign ram_2_MPORT_58_addr = 6'h3a;
  assign ram_2_MPORT_58_mask = 1'h1;
  assign ram_2_MPORT_58_en = reset;
  assign ram_2_MPORT_59_data = 23'h0;
  assign ram_2_MPORT_59_addr = 6'h3b;
  assign ram_2_MPORT_59_mask = 1'h1;
  assign ram_2_MPORT_59_en = reset;
  assign ram_2_MPORT_60_data = 23'h0;
  assign ram_2_MPORT_60_addr = 6'h3c;
  assign ram_2_MPORT_60_mask = 1'h1;
  assign ram_2_MPORT_60_en = reset;
  assign ram_2_MPORT_61_data = 23'h0;
  assign ram_2_MPORT_61_addr = 6'h3d;
  assign ram_2_MPORT_61_mask = 1'h1;
  assign ram_2_MPORT_61_en = reset;
  assign ram_2_MPORT_62_data = 23'h0;
  assign ram_2_MPORT_62_addr = 6'h3e;
  assign ram_2_MPORT_62_mask = 1'h1;
  assign ram_2_MPORT_62_en = reset;
  assign ram_2_MPORT_63_data = 23'h0;
  assign ram_2_MPORT_63_addr = 6'h3f;
  assign ram_2_MPORT_63_mask = 1'h1;
  assign ram_2_MPORT_63_en = reset;
  assign ram_2_MPORT_64_data = io_wdata[68:46];
  assign ram_2_MPORT_64_addr = io_addr;
  assign ram_2_MPORT_64_mask = io_wmask[2];
  assign ram_2_MPORT_64_en = io_rw;
  assign ram_3_io_rdata_MPORT_en = ram_3_io_rdata_MPORT_en_pipe_0;
  assign ram_3_io_rdata_MPORT_addr = ram_3_io_rdata_MPORT_addr_pipe_0;
  assign ram_3_io_rdata_MPORT_data = ram_3[ram_3_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_3_MPORT_data = 23'h0;
  assign ram_3_MPORT_addr = 6'h0;
  assign ram_3_MPORT_mask = 1'h1;
  assign ram_3_MPORT_en = reset;
  assign ram_3_MPORT_1_data = 23'h0;
  assign ram_3_MPORT_1_addr = 6'h1;
  assign ram_3_MPORT_1_mask = 1'h1;
  assign ram_3_MPORT_1_en = reset;
  assign ram_3_MPORT_2_data = 23'h0;
  assign ram_3_MPORT_2_addr = 6'h2;
  assign ram_3_MPORT_2_mask = 1'h1;
  assign ram_3_MPORT_2_en = reset;
  assign ram_3_MPORT_3_data = 23'h0;
  assign ram_3_MPORT_3_addr = 6'h3;
  assign ram_3_MPORT_3_mask = 1'h1;
  assign ram_3_MPORT_3_en = reset;
  assign ram_3_MPORT_4_data = 23'h0;
  assign ram_3_MPORT_4_addr = 6'h4;
  assign ram_3_MPORT_4_mask = 1'h1;
  assign ram_3_MPORT_4_en = reset;
  assign ram_3_MPORT_5_data = 23'h0;
  assign ram_3_MPORT_5_addr = 6'h5;
  assign ram_3_MPORT_5_mask = 1'h1;
  assign ram_3_MPORT_5_en = reset;
  assign ram_3_MPORT_6_data = 23'h0;
  assign ram_3_MPORT_6_addr = 6'h6;
  assign ram_3_MPORT_6_mask = 1'h1;
  assign ram_3_MPORT_6_en = reset;
  assign ram_3_MPORT_7_data = 23'h0;
  assign ram_3_MPORT_7_addr = 6'h7;
  assign ram_3_MPORT_7_mask = 1'h1;
  assign ram_3_MPORT_7_en = reset;
  assign ram_3_MPORT_8_data = 23'h0;
  assign ram_3_MPORT_8_addr = 6'h8;
  assign ram_3_MPORT_8_mask = 1'h1;
  assign ram_3_MPORT_8_en = reset;
  assign ram_3_MPORT_9_data = 23'h0;
  assign ram_3_MPORT_9_addr = 6'h9;
  assign ram_3_MPORT_9_mask = 1'h1;
  assign ram_3_MPORT_9_en = reset;
  assign ram_3_MPORT_10_data = 23'h0;
  assign ram_3_MPORT_10_addr = 6'ha;
  assign ram_3_MPORT_10_mask = 1'h1;
  assign ram_3_MPORT_10_en = reset;
  assign ram_3_MPORT_11_data = 23'h0;
  assign ram_3_MPORT_11_addr = 6'hb;
  assign ram_3_MPORT_11_mask = 1'h1;
  assign ram_3_MPORT_11_en = reset;
  assign ram_3_MPORT_12_data = 23'h0;
  assign ram_3_MPORT_12_addr = 6'hc;
  assign ram_3_MPORT_12_mask = 1'h1;
  assign ram_3_MPORT_12_en = reset;
  assign ram_3_MPORT_13_data = 23'h0;
  assign ram_3_MPORT_13_addr = 6'hd;
  assign ram_3_MPORT_13_mask = 1'h1;
  assign ram_3_MPORT_13_en = reset;
  assign ram_3_MPORT_14_data = 23'h0;
  assign ram_3_MPORT_14_addr = 6'he;
  assign ram_3_MPORT_14_mask = 1'h1;
  assign ram_3_MPORT_14_en = reset;
  assign ram_3_MPORT_15_data = 23'h0;
  assign ram_3_MPORT_15_addr = 6'hf;
  assign ram_3_MPORT_15_mask = 1'h1;
  assign ram_3_MPORT_15_en = reset;
  assign ram_3_MPORT_16_data = 23'h0;
  assign ram_3_MPORT_16_addr = 6'h10;
  assign ram_3_MPORT_16_mask = 1'h1;
  assign ram_3_MPORT_16_en = reset;
  assign ram_3_MPORT_17_data = 23'h0;
  assign ram_3_MPORT_17_addr = 6'h11;
  assign ram_3_MPORT_17_mask = 1'h1;
  assign ram_3_MPORT_17_en = reset;
  assign ram_3_MPORT_18_data = 23'h0;
  assign ram_3_MPORT_18_addr = 6'h12;
  assign ram_3_MPORT_18_mask = 1'h1;
  assign ram_3_MPORT_18_en = reset;
  assign ram_3_MPORT_19_data = 23'h0;
  assign ram_3_MPORT_19_addr = 6'h13;
  assign ram_3_MPORT_19_mask = 1'h1;
  assign ram_3_MPORT_19_en = reset;
  assign ram_3_MPORT_20_data = 23'h0;
  assign ram_3_MPORT_20_addr = 6'h14;
  assign ram_3_MPORT_20_mask = 1'h1;
  assign ram_3_MPORT_20_en = reset;
  assign ram_3_MPORT_21_data = 23'h0;
  assign ram_3_MPORT_21_addr = 6'h15;
  assign ram_3_MPORT_21_mask = 1'h1;
  assign ram_3_MPORT_21_en = reset;
  assign ram_3_MPORT_22_data = 23'h0;
  assign ram_3_MPORT_22_addr = 6'h16;
  assign ram_3_MPORT_22_mask = 1'h1;
  assign ram_3_MPORT_22_en = reset;
  assign ram_3_MPORT_23_data = 23'h0;
  assign ram_3_MPORT_23_addr = 6'h17;
  assign ram_3_MPORT_23_mask = 1'h1;
  assign ram_3_MPORT_23_en = reset;
  assign ram_3_MPORT_24_data = 23'h0;
  assign ram_3_MPORT_24_addr = 6'h18;
  assign ram_3_MPORT_24_mask = 1'h1;
  assign ram_3_MPORT_24_en = reset;
  assign ram_3_MPORT_25_data = 23'h0;
  assign ram_3_MPORT_25_addr = 6'h19;
  assign ram_3_MPORT_25_mask = 1'h1;
  assign ram_3_MPORT_25_en = reset;
  assign ram_3_MPORT_26_data = 23'h0;
  assign ram_3_MPORT_26_addr = 6'h1a;
  assign ram_3_MPORT_26_mask = 1'h1;
  assign ram_3_MPORT_26_en = reset;
  assign ram_3_MPORT_27_data = 23'h0;
  assign ram_3_MPORT_27_addr = 6'h1b;
  assign ram_3_MPORT_27_mask = 1'h1;
  assign ram_3_MPORT_27_en = reset;
  assign ram_3_MPORT_28_data = 23'h0;
  assign ram_3_MPORT_28_addr = 6'h1c;
  assign ram_3_MPORT_28_mask = 1'h1;
  assign ram_3_MPORT_28_en = reset;
  assign ram_3_MPORT_29_data = 23'h0;
  assign ram_3_MPORT_29_addr = 6'h1d;
  assign ram_3_MPORT_29_mask = 1'h1;
  assign ram_3_MPORT_29_en = reset;
  assign ram_3_MPORT_30_data = 23'h0;
  assign ram_3_MPORT_30_addr = 6'h1e;
  assign ram_3_MPORT_30_mask = 1'h1;
  assign ram_3_MPORT_30_en = reset;
  assign ram_3_MPORT_31_data = 23'h0;
  assign ram_3_MPORT_31_addr = 6'h1f;
  assign ram_3_MPORT_31_mask = 1'h1;
  assign ram_3_MPORT_31_en = reset;
  assign ram_3_MPORT_32_data = 23'h0;
  assign ram_3_MPORT_32_addr = 6'h20;
  assign ram_3_MPORT_32_mask = 1'h1;
  assign ram_3_MPORT_32_en = reset;
  assign ram_3_MPORT_33_data = 23'h0;
  assign ram_3_MPORT_33_addr = 6'h21;
  assign ram_3_MPORT_33_mask = 1'h1;
  assign ram_3_MPORT_33_en = reset;
  assign ram_3_MPORT_34_data = 23'h0;
  assign ram_3_MPORT_34_addr = 6'h22;
  assign ram_3_MPORT_34_mask = 1'h1;
  assign ram_3_MPORT_34_en = reset;
  assign ram_3_MPORT_35_data = 23'h0;
  assign ram_3_MPORT_35_addr = 6'h23;
  assign ram_3_MPORT_35_mask = 1'h1;
  assign ram_3_MPORT_35_en = reset;
  assign ram_3_MPORT_36_data = 23'h0;
  assign ram_3_MPORT_36_addr = 6'h24;
  assign ram_3_MPORT_36_mask = 1'h1;
  assign ram_3_MPORT_36_en = reset;
  assign ram_3_MPORT_37_data = 23'h0;
  assign ram_3_MPORT_37_addr = 6'h25;
  assign ram_3_MPORT_37_mask = 1'h1;
  assign ram_3_MPORT_37_en = reset;
  assign ram_3_MPORT_38_data = 23'h0;
  assign ram_3_MPORT_38_addr = 6'h26;
  assign ram_3_MPORT_38_mask = 1'h1;
  assign ram_3_MPORT_38_en = reset;
  assign ram_3_MPORT_39_data = 23'h0;
  assign ram_3_MPORT_39_addr = 6'h27;
  assign ram_3_MPORT_39_mask = 1'h1;
  assign ram_3_MPORT_39_en = reset;
  assign ram_3_MPORT_40_data = 23'h0;
  assign ram_3_MPORT_40_addr = 6'h28;
  assign ram_3_MPORT_40_mask = 1'h1;
  assign ram_3_MPORT_40_en = reset;
  assign ram_3_MPORT_41_data = 23'h0;
  assign ram_3_MPORT_41_addr = 6'h29;
  assign ram_3_MPORT_41_mask = 1'h1;
  assign ram_3_MPORT_41_en = reset;
  assign ram_3_MPORT_42_data = 23'h0;
  assign ram_3_MPORT_42_addr = 6'h2a;
  assign ram_3_MPORT_42_mask = 1'h1;
  assign ram_3_MPORT_42_en = reset;
  assign ram_3_MPORT_43_data = 23'h0;
  assign ram_3_MPORT_43_addr = 6'h2b;
  assign ram_3_MPORT_43_mask = 1'h1;
  assign ram_3_MPORT_43_en = reset;
  assign ram_3_MPORT_44_data = 23'h0;
  assign ram_3_MPORT_44_addr = 6'h2c;
  assign ram_3_MPORT_44_mask = 1'h1;
  assign ram_3_MPORT_44_en = reset;
  assign ram_3_MPORT_45_data = 23'h0;
  assign ram_3_MPORT_45_addr = 6'h2d;
  assign ram_3_MPORT_45_mask = 1'h1;
  assign ram_3_MPORT_45_en = reset;
  assign ram_3_MPORT_46_data = 23'h0;
  assign ram_3_MPORT_46_addr = 6'h2e;
  assign ram_3_MPORT_46_mask = 1'h1;
  assign ram_3_MPORT_46_en = reset;
  assign ram_3_MPORT_47_data = 23'h0;
  assign ram_3_MPORT_47_addr = 6'h2f;
  assign ram_3_MPORT_47_mask = 1'h1;
  assign ram_3_MPORT_47_en = reset;
  assign ram_3_MPORT_48_data = 23'h0;
  assign ram_3_MPORT_48_addr = 6'h30;
  assign ram_3_MPORT_48_mask = 1'h1;
  assign ram_3_MPORT_48_en = reset;
  assign ram_3_MPORT_49_data = 23'h0;
  assign ram_3_MPORT_49_addr = 6'h31;
  assign ram_3_MPORT_49_mask = 1'h1;
  assign ram_3_MPORT_49_en = reset;
  assign ram_3_MPORT_50_data = 23'h0;
  assign ram_3_MPORT_50_addr = 6'h32;
  assign ram_3_MPORT_50_mask = 1'h1;
  assign ram_3_MPORT_50_en = reset;
  assign ram_3_MPORT_51_data = 23'h0;
  assign ram_3_MPORT_51_addr = 6'h33;
  assign ram_3_MPORT_51_mask = 1'h1;
  assign ram_3_MPORT_51_en = reset;
  assign ram_3_MPORT_52_data = 23'h0;
  assign ram_3_MPORT_52_addr = 6'h34;
  assign ram_3_MPORT_52_mask = 1'h1;
  assign ram_3_MPORT_52_en = reset;
  assign ram_3_MPORT_53_data = 23'h0;
  assign ram_3_MPORT_53_addr = 6'h35;
  assign ram_3_MPORT_53_mask = 1'h1;
  assign ram_3_MPORT_53_en = reset;
  assign ram_3_MPORT_54_data = 23'h0;
  assign ram_3_MPORT_54_addr = 6'h36;
  assign ram_3_MPORT_54_mask = 1'h1;
  assign ram_3_MPORT_54_en = reset;
  assign ram_3_MPORT_55_data = 23'h0;
  assign ram_3_MPORT_55_addr = 6'h37;
  assign ram_3_MPORT_55_mask = 1'h1;
  assign ram_3_MPORT_55_en = reset;
  assign ram_3_MPORT_56_data = 23'h0;
  assign ram_3_MPORT_56_addr = 6'h38;
  assign ram_3_MPORT_56_mask = 1'h1;
  assign ram_3_MPORT_56_en = reset;
  assign ram_3_MPORT_57_data = 23'h0;
  assign ram_3_MPORT_57_addr = 6'h39;
  assign ram_3_MPORT_57_mask = 1'h1;
  assign ram_3_MPORT_57_en = reset;
  assign ram_3_MPORT_58_data = 23'h0;
  assign ram_3_MPORT_58_addr = 6'h3a;
  assign ram_3_MPORT_58_mask = 1'h1;
  assign ram_3_MPORT_58_en = reset;
  assign ram_3_MPORT_59_data = 23'h0;
  assign ram_3_MPORT_59_addr = 6'h3b;
  assign ram_3_MPORT_59_mask = 1'h1;
  assign ram_3_MPORT_59_en = reset;
  assign ram_3_MPORT_60_data = 23'h0;
  assign ram_3_MPORT_60_addr = 6'h3c;
  assign ram_3_MPORT_60_mask = 1'h1;
  assign ram_3_MPORT_60_en = reset;
  assign ram_3_MPORT_61_data = 23'h0;
  assign ram_3_MPORT_61_addr = 6'h3d;
  assign ram_3_MPORT_61_mask = 1'h1;
  assign ram_3_MPORT_61_en = reset;
  assign ram_3_MPORT_62_data = 23'h0;
  assign ram_3_MPORT_62_addr = 6'h3e;
  assign ram_3_MPORT_62_mask = 1'h1;
  assign ram_3_MPORT_62_en = reset;
  assign ram_3_MPORT_63_data = 23'h0;
  assign ram_3_MPORT_63_addr = 6'h3f;
  assign ram_3_MPORT_63_mask = 1'h1;
  assign ram_3_MPORT_63_en = reset;
  assign ram_3_MPORT_64_data = io_wdata[91:69];
  assign ram_3_MPORT_64_addr = io_addr;
  assign ram_3_MPORT_64_mask = io_wmask[3];
  assign ram_3_MPORT_64_en = io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 75:39]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_1_en & ram_0_MPORT_1_mask) begin
      ram_0[ram_0_MPORT_1_addr] <= ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_2_en & ram_0_MPORT_2_mask) begin
      ram_0[ram_0_MPORT_2_addr] <= ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_3_en & ram_0_MPORT_3_mask) begin
      ram_0[ram_0_MPORT_3_addr] <= ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_4_en & ram_0_MPORT_4_mask) begin
      ram_0[ram_0_MPORT_4_addr] <= ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_5_en & ram_0_MPORT_5_mask) begin
      ram_0[ram_0_MPORT_5_addr] <= ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_6_en & ram_0_MPORT_6_mask) begin
      ram_0[ram_0_MPORT_6_addr] <= ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_7_en & ram_0_MPORT_7_mask) begin
      ram_0[ram_0_MPORT_7_addr] <= ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_8_en & ram_0_MPORT_8_mask) begin
      ram_0[ram_0_MPORT_8_addr] <= ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_9_en & ram_0_MPORT_9_mask) begin
      ram_0[ram_0_MPORT_9_addr] <= ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_10_en & ram_0_MPORT_10_mask) begin
      ram_0[ram_0_MPORT_10_addr] <= ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_11_en & ram_0_MPORT_11_mask) begin
      ram_0[ram_0_MPORT_11_addr] <= ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_12_en & ram_0_MPORT_12_mask) begin
      ram_0[ram_0_MPORT_12_addr] <= ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_13_en & ram_0_MPORT_13_mask) begin
      ram_0[ram_0_MPORT_13_addr] <= ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_14_en & ram_0_MPORT_14_mask) begin
      ram_0[ram_0_MPORT_14_addr] <= ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_15_en & ram_0_MPORT_15_mask) begin
      ram_0[ram_0_MPORT_15_addr] <= ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_16_en & ram_0_MPORT_16_mask) begin
      ram_0[ram_0_MPORT_16_addr] <= ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_17_en & ram_0_MPORT_17_mask) begin
      ram_0[ram_0_MPORT_17_addr] <= ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_18_en & ram_0_MPORT_18_mask) begin
      ram_0[ram_0_MPORT_18_addr] <= ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_19_en & ram_0_MPORT_19_mask) begin
      ram_0[ram_0_MPORT_19_addr] <= ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_20_en & ram_0_MPORT_20_mask) begin
      ram_0[ram_0_MPORT_20_addr] <= ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_21_en & ram_0_MPORT_21_mask) begin
      ram_0[ram_0_MPORT_21_addr] <= ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_22_en & ram_0_MPORT_22_mask) begin
      ram_0[ram_0_MPORT_22_addr] <= ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_23_en & ram_0_MPORT_23_mask) begin
      ram_0[ram_0_MPORT_23_addr] <= ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_24_en & ram_0_MPORT_24_mask) begin
      ram_0[ram_0_MPORT_24_addr] <= ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_25_en & ram_0_MPORT_25_mask) begin
      ram_0[ram_0_MPORT_25_addr] <= ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_26_en & ram_0_MPORT_26_mask) begin
      ram_0[ram_0_MPORT_26_addr] <= ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_27_en & ram_0_MPORT_27_mask) begin
      ram_0[ram_0_MPORT_27_addr] <= ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_28_en & ram_0_MPORT_28_mask) begin
      ram_0[ram_0_MPORT_28_addr] <= ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_29_en & ram_0_MPORT_29_mask) begin
      ram_0[ram_0_MPORT_29_addr] <= ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_30_en & ram_0_MPORT_30_mask) begin
      ram_0[ram_0_MPORT_30_addr] <= ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_31_en & ram_0_MPORT_31_mask) begin
      ram_0[ram_0_MPORT_31_addr] <= ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_32_en & ram_0_MPORT_32_mask) begin
      ram_0[ram_0_MPORT_32_addr] <= ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_33_en & ram_0_MPORT_33_mask) begin
      ram_0[ram_0_MPORT_33_addr] <= ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_34_en & ram_0_MPORT_34_mask) begin
      ram_0[ram_0_MPORT_34_addr] <= ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_35_en & ram_0_MPORT_35_mask) begin
      ram_0[ram_0_MPORT_35_addr] <= ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_36_en & ram_0_MPORT_36_mask) begin
      ram_0[ram_0_MPORT_36_addr] <= ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_37_en & ram_0_MPORT_37_mask) begin
      ram_0[ram_0_MPORT_37_addr] <= ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_38_en & ram_0_MPORT_38_mask) begin
      ram_0[ram_0_MPORT_38_addr] <= ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_39_en & ram_0_MPORT_39_mask) begin
      ram_0[ram_0_MPORT_39_addr] <= ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_40_en & ram_0_MPORT_40_mask) begin
      ram_0[ram_0_MPORT_40_addr] <= ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_41_en & ram_0_MPORT_41_mask) begin
      ram_0[ram_0_MPORT_41_addr] <= ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_42_en & ram_0_MPORT_42_mask) begin
      ram_0[ram_0_MPORT_42_addr] <= ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_43_en & ram_0_MPORT_43_mask) begin
      ram_0[ram_0_MPORT_43_addr] <= ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_44_en & ram_0_MPORT_44_mask) begin
      ram_0[ram_0_MPORT_44_addr] <= ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_45_en & ram_0_MPORT_45_mask) begin
      ram_0[ram_0_MPORT_45_addr] <= ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_46_en & ram_0_MPORT_46_mask) begin
      ram_0[ram_0_MPORT_46_addr] <= ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_47_en & ram_0_MPORT_47_mask) begin
      ram_0[ram_0_MPORT_47_addr] <= ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_48_en & ram_0_MPORT_48_mask) begin
      ram_0[ram_0_MPORT_48_addr] <= ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_49_en & ram_0_MPORT_49_mask) begin
      ram_0[ram_0_MPORT_49_addr] <= ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_50_en & ram_0_MPORT_50_mask) begin
      ram_0[ram_0_MPORT_50_addr] <= ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_51_en & ram_0_MPORT_51_mask) begin
      ram_0[ram_0_MPORT_51_addr] <= ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_52_en & ram_0_MPORT_52_mask) begin
      ram_0[ram_0_MPORT_52_addr] <= ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_53_en & ram_0_MPORT_53_mask) begin
      ram_0[ram_0_MPORT_53_addr] <= ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_54_en & ram_0_MPORT_54_mask) begin
      ram_0[ram_0_MPORT_54_addr] <= ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_55_en & ram_0_MPORT_55_mask) begin
      ram_0[ram_0_MPORT_55_addr] <= ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_56_en & ram_0_MPORT_56_mask) begin
      ram_0[ram_0_MPORT_56_addr] <= ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_57_en & ram_0_MPORT_57_mask) begin
      ram_0[ram_0_MPORT_57_addr] <= ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_58_en & ram_0_MPORT_58_mask) begin
      ram_0[ram_0_MPORT_58_addr] <= ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_59_en & ram_0_MPORT_59_mask) begin
      ram_0[ram_0_MPORT_59_addr] <= ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_60_en & ram_0_MPORT_60_mask) begin
      ram_0[ram_0_MPORT_60_addr] <= ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_61_en & ram_0_MPORT_61_mask) begin
      ram_0[ram_0_MPORT_61_addr] <= ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_62_en & ram_0_MPORT_62_mask) begin
      ram_0[ram_0_MPORT_62_addr] <= ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_63_en & ram_0_MPORT_63_mask) begin
      ram_0[ram_0_MPORT_63_addr] <= ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_64_en & ram_0_MPORT_64_mask) begin
      ram_0[ram_0_MPORT_64_addr] <= ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_0_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_1_en & ram_1_MPORT_1_mask) begin
      ram_1[ram_1_MPORT_1_addr] <= ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_2_en & ram_1_MPORT_2_mask) begin
      ram_1[ram_1_MPORT_2_addr] <= ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_3_en & ram_1_MPORT_3_mask) begin
      ram_1[ram_1_MPORT_3_addr] <= ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_4_en & ram_1_MPORT_4_mask) begin
      ram_1[ram_1_MPORT_4_addr] <= ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_5_en & ram_1_MPORT_5_mask) begin
      ram_1[ram_1_MPORT_5_addr] <= ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_6_en & ram_1_MPORT_6_mask) begin
      ram_1[ram_1_MPORT_6_addr] <= ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_7_en & ram_1_MPORT_7_mask) begin
      ram_1[ram_1_MPORT_7_addr] <= ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_8_en & ram_1_MPORT_8_mask) begin
      ram_1[ram_1_MPORT_8_addr] <= ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_9_en & ram_1_MPORT_9_mask) begin
      ram_1[ram_1_MPORT_9_addr] <= ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_10_en & ram_1_MPORT_10_mask) begin
      ram_1[ram_1_MPORT_10_addr] <= ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_11_en & ram_1_MPORT_11_mask) begin
      ram_1[ram_1_MPORT_11_addr] <= ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_12_en & ram_1_MPORT_12_mask) begin
      ram_1[ram_1_MPORT_12_addr] <= ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_13_en & ram_1_MPORT_13_mask) begin
      ram_1[ram_1_MPORT_13_addr] <= ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_14_en & ram_1_MPORT_14_mask) begin
      ram_1[ram_1_MPORT_14_addr] <= ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_15_en & ram_1_MPORT_15_mask) begin
      ram_1[ram_1_MPORT_15_addr] <= ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_16_en & ram_1_MPORT_16_mask) begin
      ram_1[ram_1_MPORT_16_addr] <= ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_17_en & ram_1_MPORT_17_mask) begin
      ram_1[ram_1_MPORT_17_addr] <= ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_18_en & ram_1_MPORT_18_mask) begin
      ram_1[ram_1_MPORT_18_addr] <= ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_19_en & ram_1_MPORT_19_mask) begin
      ram_1[ram_1_MPORT_19_addr] <= ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_20_en & ram_1_MPORT_20_mask) begin
      ram_1[ram_1_MPORT_20_addr] <= ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_21_en & ram_1_MPORT_21_mask) begin
      ram_1[ram_1_MPORT_21_addr] <= ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_22_en & ram_1_MPORT_22_mask) begin
      ram_1[ram_1_MPORT_22_addr] <= ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_23_en & ram_1_MPORT_23_mask) begin
      ram_1[ram_1_MPORT_23_addr] <= ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_24_en & ram_1_MPORT_24_mask) begin
      ram_1[ram_1_MPORT_24_addr] <= ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_25_en & ram_1_MPORT_25_mask) begin
      ram_1[ram_1_MPORT_25_addr] <= ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_26_en & ram_1_MPORT_26_mask) begin
      ram_1[ram_1_MPORT_26_addr] <= ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_27_en & ram_1_MPORT_27_mask) begin
      ram_1[ram_1_MPORT_27_addr] <= ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_28_en & ram_1_MPORT_28_mask) begin
      ram_1[ram_1_MPORT_28_addr] <= ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_29_en & ram_1_MPORT_29_mask) begin
      ram_1[ram_1_MPORT_29_addr] <= ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_30_en & ram_1_MPORT_30_mask) begin
      ram_1[ram_1_MPORT_30_addr] <= ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_31_en & ram_1_MPORT_31_mask) begin
      ram_1[ram_1_MPORT_31_addr] <= ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_32_en & ram_1_MPORT_32_mask) begin
      ram_1[ram_1_MPORT_32_addr] <= ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_33_en & ram_1_MPORT_33_mask) begin
      ram_1[ram_1_MPORT_33_addr] <= ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_34_en & ram_1_MPORT_34_mask) begin
      ram_1[ram_1_MPORT_34_addr] <= ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_35_en & ram_1_MPORT_35_mask) begin
      ram_1[ram_1_MPORT_35_addr] <= ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_36_en & ram_1_MPORT_36_mask) begin
      ram_1[ram_1_MPORT_36_addr] <= ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_37_en & ram_1_MPORT_37_mask) begin
      ram_1[ram_1_MPORT_37_addr] <= ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_38_en & ram_1_MPORT_38_mask) begin
      ram_1[ram_1_MPORT_38_addr] <= ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_39_en & ram_1_MPORT_39_mask) begin
      ram_1[ram_1_MPORT_39_addr] <= ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_40_en & ram_1_MPORT_40_mask) begin
      ram_1[ram_1_MPORT_40_addr] <= ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_41_en & ram_1_MPORT_41_mask) begin
      ram_1[ram_1_MPORT_41_addr] <= ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_42_en & ram_1_MPORT_42_mask) begin
      ram_1[ram_1_MPORT_42_addr] <= ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_43_en & ram_1_MPORT_43_mask) begin
      ram_1[ram_1_MPORT_43_addr] <= ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_44_en & ram_1_MPORT_44_mask) begin
      ram_1[ram_1_MPORT_44_addr] <= ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_45_en & ram_1_MPORT_45_mask) begin
      ram_1[ram_1_MPORT_45_addr] <= ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_46_en & ram_1_MPORT_46_mask) begin
      ram_1[ram_1_MPORT_46_addr] <= ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_47_en & ram_1_MPORT_47_mask) begin
      ram_1[ram_1_MPORT_47_addr] <= ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_48_en & ram_1_MPORT_48_mask) begin
      ram_1[ram_1_MPORT_48_addr] <= ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_49_en & ram_1_MPORT_49_mask) begin
      ram_1[ram_1_MPORT_49_addr] <= ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_50_en & ram_1_MPORT_50_mask) begin
      ram_1[ram_1_MPORT_50_addr] <= ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_51_en & ram_1_MPORT_51_mask) begin
      ram_1[ram_1_MPORT_51_addr] <= ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_52_en & ram_1_MPORT_52_mask) begin
      ram_1[ram_1_MPORT_52_addr] <= ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_53_en & ram_1_MPORT_53_mask) begin
      ram_1[ram_1_MPORT_53_addr] <= ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_54_en & ram_1_MPORT_54_mask) begin
      ram_1[ram_1_MPORT_54_addr] <= ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_55_en & ram_1_MPORT_55_mask) begin
      ram_1[ram_1_MPORT_55_addr] <= ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_56_en & ram_1_MPORT_56_mask) begin
      ram_1[ram_1_MPORT_56_addr] <= ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_57_en & ram_1_MPORT_57_mask) begin
      ram_1[ram_1_MPORT_57_addr] <= ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_58_en & ram_1_MPORT_58_mask) begin
      ram_1[ram_1_MPORT_58_addr] <= ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_59_en & ram_1_MPORT_59_mask) begin
      ram_1[ram_1_MPORT_59_addr] <= ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_60_en & ram_1_MPORT_60_mask) begin
      ram_1[ram_1_MPORT_60_addr] <= ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_61_en & ram_1_MPORT_61_mask) begin
      ram_1[ram_1_MPORT_61_addr] <= ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_62_en & ram_1_MPORT_62_mask) begin
      ram_1[ram_1_MPORT_62_addr] <= ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_63_en & ram_1_MPORT_63_mask) begin
      ram_1[ram_1_MPORT_63_addr] <= ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_64_en & ram_1_MPORT_64_mask) begin
      ram_1[ram_1_MPORT_64_addr] <= ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_1_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_1_en & ram_2_MPORT_1_mask) begin
      ram_2[ram_2_MPORT_1_addr] <= ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_2_en & ram_2_MPORT_2_mask) begin
      ram_2[ram_2_MPORT_2_addr] <= ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_3_en & ram_2_MPORT_3_mask) begin
      ram_2[ram_2_MPORT_3_addr] <= ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_4_en & ram_2_MPORT_4_mask) begin
      ram_2[ram_2_MPORT_4_addr] <= ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_5_en & ram_2_MPORT_5_mask) begin
      ram_2[ram_2_MPORT_5_addr] <= ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_6_en & ram_2_MPORT_6_mask) begin
      ram_2[ram_2_MPORT_6_addr] <= ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_7_en & ram_2_MPORT_7_mask) begin
      ram_2[ram_2_MPORT_7_addr] <= ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_8_en & ram_2_MPORT_8_mask) begin
      ram_2[ram_2_MPORT_8_addr] <= ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_9_en & ram_2_MPORT_9_mask) begin
      ram_2[ram_2_MPORT_9_addr] <= ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_10_en & ram_2_MPORT_10_mask) begin
      ram_2[ram_2_MPORT_10_addr] <= ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_11_en & ram_2_MPORT_11_mask) begin
      ram_2[ram_2_MPORT_11_addr] <= ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_12_en & ram_2_MPORT_12_mask) begin
      ram_2[ram_2_MPORT_12_addr] <= ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_13_en & ram_2_MPORT_13_mask) begin
      ram_2[ram_2_MPORT_13_addr] <= ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_14_en & ram_2_MPORT_14_mask) begin
      ram_2[ram_2_MPORT_14_addr] <= ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_15_en & ram_2_MPORT_15_mask) begin
      ram_2[ram_2_MPORT_15_addr] <= ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_16_en & ram_2_MPORT_16_mask) begin
      ram_2[ram_2_MPORT_16_addr] <= ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_17_en & ram_2_MPORT_17_mask) begin
      ram_2[ram_2_MPORT_17_addr] <= ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_18_en & ram_2_MPORT_18_mask) begin
      ram_2[ram_2_MPORT_18_addr] <= ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_19_en & ram_2_MPORT_19_mask) begin
      ram_2[ram_2_MPORT_19_addr] <= ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_20_en & ram_2_MPORT_20_mask) begin
      ram_2[ram_2_MPORT_20_addr] <= ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_21_en & ram_2_MPORT_21_mask) begin
      ram_2[ram_2_MPORT_21_addr] <= ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_22_en & ram_2_MPORT_22_mask) begin
      ram_2[ram_2_MPORT_22_addr] <= ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_23_en & ram_2_MPORT_23_mask) begin
      ram_2[ram_2_MPORT_23_addr] <= ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_24_en & ram_2_MPORT_24_mask) begin
      ram_2[ram_2_MPORT_24_addr] <= ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_25_en & ram_2_MPORT_25_mask) begin
      ram_2[ram_2_MPORT_25_addr] <= ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_26_en & ram_2_MPORT_26_mask) begin
      ram_2[ram_2_MPORT_26_addr] <= ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_27_en & ram_2_MPORT_27_mask) begin
      ram_2[ram_2_MPORT_27_addr] <= ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_28_en & ram_2_MPORT_28_mask) begin
      ram_2[ram_2_MPORT_28_addr] <= ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_29_en & ram_2_MPORT_29_mask) begin
      ram_2[ram_2_MPORT_29_addr] <= ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_30_en & ram_2_MPORT_30_mask) begin
      ram_2[ram_2_MPORT_30_addr] <= ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_31_en & ram_2_MPORT_31_mask) begin
      ram_2[ram_2_MPORT_31_addr] <= ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_32_en & ram_2_MPORT_32_mask) begin
      ram_2[ram_2_MPORT_32_addr] <= ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_33_en & ram_2_MPORT_33_mask) begin
      ram_2[ram_2_MPORT_33_addr] <= ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_34_en & ram_2_MPORT_34_mask) begin
      ram_2[ram_2_MPORT_34_addr] <= ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_35_en & ram_2_MPORT_35_mask) begin
      ram_2[ram_2_MPORT_35_addr] <= ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_36_en & ram_2_MPORT_36_mask) begin
      ram_2[ram_2_MPORT_36_addr] <= ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_37_en & ram_2_MPORT_37_mask) begin
      ram_2[ram_2_MPORT_37_addr] <= ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_38_en & ram_2_MPORT_38_mask) begin
      ram_2[ram_2_MPORT_38_addr] <= ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_39_en & ram_2_MPORT_39_mask) begin
      ram_2[ram_2_MPORT_39_addr] <= ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_40_en & ram_2_MPORT_40_mask) begin
      ram_2[ram_2_MPORT_40_addr] <= ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_41_en & ram_2_MPORT_41_mask) begin
      ram_2[ram_2_MPORT_41_addr] <= ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_42_en & ram_2_MPORT_42_mask) begin
      ram_2[ram_2_MPORT_42_addr] <= ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_43_en & ram_2_MPORT_43_mask) begin
      ram_2[ram_2_MPORT_43_addr] <= ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_44_en & ram_2_MPORT_44_mask) begin
      ram_2[ram_2_MPORT_44_addr] <= ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_45_en & ram_2_MPORT_45_mask) begin
      ram_2[ram_2_MPORT_45_addr] <= ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_46_en & ram_2_MPORT_46_mask) begin
      ram_2[ram_2_MPORT_46_addr] <= ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_47_en & ram_2_MPORT_47_mask) begin
      ram_2[ram_2_MPORT_47_addr] <= ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_48_en & ram_2_MPORT_48_mask) begin
      ram_2[ram_2_MPORT_48_addr] <= ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_49_en & ram_2_MPORT_49_mask) begin
      ram_2[ram_2_MPORT_49_addr] <= ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_50_en & ram_2_MPORT_50_mask) begin
      ram_2[ram_2_MPORT_50_addr] <= ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_51_en & ram_2_MPORT_51_mask) begin
      ram_2[ram_2_MPORT_51_addr] <= ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_52_en & ram_2_MPORT_52_mask) begin
      ram_2[ram_2_MPORT_52_addr] <= ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_53_en & ram_2_MPORT_53_mask) begin
      ram_2[ram_2_MPORT_53_addr] <= ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_54_en & ram_2_MPORT_54_mask) begin
      ram_2[ram_2_MPORT_54_addr] <= ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_55_en & ram_2_MPORT_55_mask) begin
      ram_2[ram_2_MPORT_55_addr] <= ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_56_en & ram_2_MPORT_56_mask) begin
      ram_2[ram_2_MPORT_56_addr] <= ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_57_en & ram_2_MPORT_57_mask) begin
      ram_2[ram_2_MPORT_57_addr] <= ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_58_en & ram_2_MPORT_58_mask) begin
      ram_2[ram_2_MPORT_58_addr] <= ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_59_en & ram_2_MPORT_59_mask) begin
      ram_2[ram_2_MPORT_59_addr] <= ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_60_en & ram_2_MPORT_60_mask) begin
      ram_2[ram_2_MPORT_60_addr] <= ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_61_en & ram_2_MPORT_61_mask) begin
      ram_2[ram_2_MPORT_61_addr] <= ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_62_en & ram_2_MPORT_62_mask) begin
      ram_2[ram_2_MPORT_62_addr] <= ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_63_en & ram_2_MPORT_63_mask) begin
      ram_2[ram_2_MPORT_63_addr] <= ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_64_en & ram_2_MPORT_64_mask) begin
      ram_2[ram_2_MPORT_64_addr] <= ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_2_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_1_en & ram_3_MPORT_1_mask) begin
      ram_3[ram_3_MPORT_1_addr] <= ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_2_en & ram_3_MPORT_2_mask) begin
      ram_3[ram_3_MPORT_2_addr] <= ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_3_en & ram_3_MPORT_3_mask) begin
      ram_3[ram_3_MPORT_3_addr] <= ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_4_en & ram_3_MPORT_4_mask) begin
      ram_3[ram_3_MPORT_4_addr] <= ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_5_en & ram_3_MPORT_5_mask) begin
      ram_3[ram_3_MPORT_5_addr] <= ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_6_en & ram_3_MPORT_6_mask) begin
      ram_3[ram_3_MPORT_6_addr] <= ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_7_en & ram_3_MPORT_7_mask) begin
      ram_3[ram_3_MPORT_7_addr] <= ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_8_en & ram_3_MPORT_8_mask) begin
      ram_3[ram_3_MPORT_8_addr] <= ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_9_en & ram_3_MPORT_9_mask) begin
      ram_3[ram_3_MPORT_9_addr] <= ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_10_en & ram_3_MPORT_10_mask) begin
      ram_3[ram_3_MPORT_10_addr] <= ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_11_en & ram_3_MPORT_11_mask) begin
      ram_3[ram_3_MPORT_11_addr] <= ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_12_en & ram_3_MPORT_12_mask) begin
      ram_3[ram_3_MPORT_12_addr] <= ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_13_en & ram_3_MPORT_13_mask) begin
      ram_3[ram_3_MPORT_13_addr] <= ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_14_en & ram_3_MPORT_14_mask) begin
      ram_3[ram_3_MPORT_14_addr] <= ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_15_en & ram_3_MPORT_15_mask) begin
      ram_3[ram_3_MPORT_15_addr] <= ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_16_en & ram_3_MPORT_16_mask) begin
      ram_3[ram_3_MPORT_16_addr] <= ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_17_en & ram_3_MPORT_17_mask) begin
      ram_3[ram_3_MPORT_17_addr] <= ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_18_en & ram_3_MPORT_18_mask) begin
      ram_3[ram_3_MPORT_18_addr] <= ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_19_en & ram_3_MPORT_19_mask) begin
      ram_3[ram_3_MPORT_19_addr] <= ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_20_en & ram_3_MPORT_20_mask) begin
      ram_3[ram_3_MPORT_20_addr] <= ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_21_en & ram_3_MPORT_21_mask) begin
      ram_3[ram_3_MPORT_21_addr] <= ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_22_en & ram_3_MPORT_22_mask) begin
      ram_3[ram_3_MPORT_22_addr] <= ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_23_en & ram_3_MPORT_23_mask) begin
      ram_3[ram_3_MPORT_23_addr] <= ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_24_en & ram_3_MPORT_24_mask) begin
      ram_3[ram_3_MPORT_24_addr] <= ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_25_en & ram_3_MPORT_25_mask) begin
      ram_3[ram_3_MPORT_25_addr] <= ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_26_en & ram_3_MPORT_26_mask) begin
      ram_3[ram_3_MPORT_26_addr] <= ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_27_en & ram_3_MPORT_27_mask) begin
      ram_3[ram_3_MPORT_27_addr] <= ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_28_en & ram_3_MPORT_28_mask) begin
      ram_3[ram_3_MPORT_28_addr] <= ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_29_en & ram_3_MPORT_29_mask) begin
      ram_3[ram_3_MPORT_29_addr] <= ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_30_en & ram_3_MPORT_30_mask) begin
      ram_3[ram_3_MPORT_30_addr] <= ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_31_en & ram_3_MPORT_31_mask) begin
      ram_3[ram_3_MPORT_31_addr] <= ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_32_en & ram_3_MPORT_32_mask) begin
      ram_3[ram_3_MPORT_32_addr] <= ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_33_en & ram_3_MPORT_33_mask) begin
      ram_3[ram_3_MPORT_33_addr] <= ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_34_en & ram_3_MPORT_34_mask) begin
      ram_3[ram_3_MPORT_34_addr] <= ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_35_en & ram_3_MPORT_35_mask) begin
      ram_3[ram_3_MPORT_35_addr] <= ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_36_en & ram_3_MPORT_36_mask) begin
      ram_3[ram_3_MPORT_36_addr] <= ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_37_en & ram_3_MPORT_37_mask) begin
      ram_3[ram_3_MPORT_37_addr] <= ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_38_en & ram_3_MPORT_38_mask) begin
      ram_3[ram_3_MPORT_38_addr] <= ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_39_en & ram_3_MPORT_39_mask) begin
      ram_3[ram_3_MPORT_39_addr] <= ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_40_en & ram_3_MPORT_40_mask) begin
      ram_3[ram_3_MPORT_40_addr] <= ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_41_en & ram_3_MPORT_41_mask) begin
      ram_3[ram_3_MPORT_41_addr] <= ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_42_en & ram_3_MPORT_42_mask) begin
      ram_3[ram_3_MPORT_42_addr] <= ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_43_en & ram_3_MPORT_43_mask) begin
      ram_3[ram_3_MPORT_43_addr] <= ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_44_en & ram_3_MPORT_44_mask) begin
      ram_3[ram_3_MPORT_44_addr] <= ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_45_en & ram_3_MPORT_45_mask) begin
      ram_3[ram_3_MPORT_45_addr] <= ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_46_en & ram_3_MPORT_46_mask) begin
      ram_3[ram_3_MPORT_46_addr] <= ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_47_en & ram_3_MPORT_47_mask) begin
      ram_3[ram_3_MPORT_47_addr] <= ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_48_en & ram_3_MPORT_48_mask) begin
      ram_3[ram_3_MPORT_48_addr] <= ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_49_en & ram_3_MPORT_49_mask) begin
      ram_3[ram_3_MPORT_49_addr] <= ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_50_en & ram_3_MPORT_50_mask) begin
      ram_3[ram_3_MPORT_50_addr] <= ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_51_en & ram_3_MPORT_51_mask) begin
      ram_3[ram_3_MPORT_51_addr] <= ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_52_en & ram_3_MPORT_52_mask) begin
      ram_3[ram_3_MPORT_52_addr] <= ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_53_en & ram_3_MPORT_53_mask) begin
      ram_3[ram_3_MPORT_53_addr] <= ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_54_en & ram_3_MPORT_54_mask) begin
      ram_3[ram_3_MPORT_54_addr] <= ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_55_en & ram_3_MPORT_55_mask) begin
      ram_3[ram_3_MPORT_55_addr] <= ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_56_en & ram_3_MPORT_56_mask) begin
      ram_3[ram_3_MPORT_56_addr] <= ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_57_en & ram_3_MPORT_57_mask) begin
      ram_3[ram_3_MPORT_57_addr] <= ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_58_en & ram_3_MPORT_58_mask) begin
      ram_3[ram_3_MPORT_58_addr] <= ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_59_en & ram_3_MPORT_59_mask) begin
      ram_3[ram_3_MPORT_59_addr] <= ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_60_en & ram_3_MPORT_60_mask) begin
      ram_3[ram_3_MPORT_60_addr] <= ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_61_en & ram_3_MPORT_61_mask) begin
      ram_3[ram_3_MPORT_61_addr] <= ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_62_en & ram_3_MPORT_62_mask) begin
      ram_3[ram_3_MPORT_62_addr] <= ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_63_en & ram_3_MPORT_63_mask) begin
      ram_3[ram_3_MPORT_63_addr] <= ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_64_en & ram_3_MPORT_64_mask) begin
      ram_3[ram_3_MPORT_64_addr] <= ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_3_io_rdata_MPORT_addr_pipe_0 <= io_addr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[22:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[22:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[22:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[22:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SRAMTemplate_8(
  input         clock,
  input         reset,
  input  [5:0]  io_r_addr,
  output [91:0] io_r_data,
  input         io_w_en,
  input  [5:0]  io_w_addr,
  input  [91:0] io_w_data,
  input  [3:0]  io_w_mask
);
  wire  sram_clock; // @[SRAM.scala 188:31]
  wire  sram_reset; // @[SRAM.scala 188:31]
  wire [5:0] sram_io_addr; // @[SRAM.scala 188:31]
  wire  sram_io_rw; // @[SRAM.scala 188:31]
  wire [91:0] sram_io_wdata; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_wmask; // @[SRAM.scala 188:31]
  wire [91:0] sram_io_rdata; // @[SRAM.scala 188:31]
  BankRam1P_1_8 sram ( // @[SRAM.scala 188:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_addr(sram_io_addr),
    .io_rw(sram_io_rw),
    .io_wdata(sram_io_wdata),
    .io_wmask(sram_io_wmask),
    .io_rdata(sram_io_rdata)
  );
  assign io_r_data = sram_io_rdata; // @[SRAM.scala 214:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_addr = io_w_en ? io_w_addr : io_r_addr; // @[SRAM.scala 102:17 219:19 90:17]
  assign sram_io_rw = io_w_en; // @[SRAM.scala 101:15 219:19 88:15]
  assign sram_io_wdata = io_w_data; // @[SRAM.scala 219:19 89:18]
  assign sram_io_wmask = io_w_mask; // @[SRAM.scala 219:19 91:45]
endmodule
module BankRam1P_1_9(
  input        clock,
  input        reset,
  input  [5:0] io_addr,
  input        io_rw,
  input  [3:0] io_wmask,
  output [3:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  ram_0 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_en; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_0_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_0_io_rdata_MPORT_addr_pipe_0;
  reg  ram_1 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_en; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_1_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_1_io_rdata_MPORT_addr_pipe_0;
  reg  ram_2 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_en; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_2_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_2_io_rdata_MPORT_addr_pipe_0;
  reg  ram_3 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_en; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_3_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_3_io_rdata_MPORT_addr_pipe_0;
  wire [1:0] io_rdata_lo = {ram_1_io_rdata_MPORT_data,ram_0_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  wire [1:0] io_rdata_hi = {ram_3_io_rdata_MPORT_data,ram_2_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  assign ram_0_io_rdata_MPORT_en = ram_0_io_rdata_MPORT_en_pipe_0;
  assign ram_0_io_rdata_MPORT_addr = ram_0_io_rdata_MPORT_addr_pipe_0;
  assign ram_0_io_rdata_MPORT_data = ram_0[ram_0_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_0_MPORT_data = 1'h0;
  assign ram_0_MPORT_addr = 6'h0;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = reset;
  assign ram_0_MPORT_1_data = 1'h0;
  assign ram_0_MPORT_1_addr = 6'h1;
  assign ram_0_MPORT_1_mask = 1'h1;
  assign ram_0_MPORT_1_en = reset;
  assign ram_0_MPORT_2_data = 1'h0;
  assign ram_0_MPORT_2_addr = 6'h2;
  assign ram_0_MPORT_2_mask = 1'h1;
  assign ram_0_MPORT_2_en = reset;
  assign ram_0_MPORT_3_data = 1'h0;
  assign ram_0_MPORT_3_addr = 6'h3;
  assign ram_0_MPORT_3_mask = 1'h1;
  assign ram_0_MPORT_3_en = reset;
  assign ram_0_MPORT_4_data = 1'h0;
  assign ram_0_MPORT_4_addr = 6'h4;
  assign ram_0_MPORT_4_mask = 1'h1;
  assign ram_0_MPORT_4_en = reset;
  assign ram_0_MPORT_5_data = 1'h0;
  assign ram_0_MPORT_5_addr = 6'h5;
  assign ram_0_MPORT_5_mask = 1'h1;
  assign ram_0_MPORT_5_en = reset;
  assign ram_0_MPORT_6_data = 1'h0;
  assign ram_0_MPORT_6_addr = 6'h6;
  assign ram_0_MPORT_6_mask = 1'h1;
  assign ram_0_MPORT_6_en = reset;
  assign ram_0_MPORT_7_data = 1'h0;
  assign ram_0_MPORT_7_addr = 6'h7;
  assign ram_0_MPORT_7_mask = 1'h1;
  assign ram_0_MPORT_7_en = reset;
  assign ram_0_MPORT_8_data = 1'h0;
  assign ram_0_MPORT_8_addr = 6'h8;
  assign ram_0_MPORT_8_mask = 1'h1;
  assign ram_0_MPORT_8_en = reset;
  assign ram_0_MPORT_9_data = 1'h0;
  assign ram_0_MPORT_9_addr = 6'h9;
  assign ram_0_MPORT_9_mask = 1'h1;
  assign ram_0_MPORT_9_en = reset;
  assign ram_0_MPORT_10_data = 1'h0;
  assign ram_0_MPORT_10_addr = 6'ha;
  assign ram_0_MPORT_10_mask = 1'h1;
  assign ram_0_MPORT_10_en = reset;
  assign ram_0_MPORT_11_data = 1'h0;
  assign ram_0_MPORT_11_addr = 6'hb;
  assign ram_0_MPORT_11_mask = 1'h1;
  assign ram_0_MPORT_11_en = reset;
  assign ram_0_MPORT_12_data = 1'h0;
  assign ram_0_MPORT_12_addr = 6'hc;
  assign ram_0_MPORT_12_mask = 1'h1;
  assign ram_0_MPORT_12_en = reset;
  assign ram_0_MPORT_13_data = 1'h0;
  assign ram_0_MPORT_13_addr = 6'hd;
  assign ram_0_MPORT_13_mask = 1'h1;
  assign ram_0_MPORT_13_en = reset;
  assign ram_0_MPORT_14_data = 1'h0;
  assign ram_0_MPORT_14_addr = 6'he;
  assign ram_0_MPORT_14_mask = 1'h1;
  assign ram_0_MPORT_14_en = reset;
  assign ram_0_MPORT_15_data = 1'h0;
  assign ram_0_MPORT_15_addr = 6'hf;
  assign ram_0_MPORT_15_mask = 1'h1;
  assign ram_0_MPORT_15_en = reset;
  assign ram_0_MPORT_16_data = 1'h0;
  assign ram_0_MPORT_16_addr = 6'h10;
  assign ram_0_MPORT_16_mask = 1'h1;
  assign ram_0_MPORT_16_en = reset;
  assign ram_0_MPORT_17_data = 1'h0;
  assign ram_0_MPORT_17_addr = 6'h11;
  assign ram_0_MPORT_17_mask = 1'h1;
  assign ram_0_MPORT_17_en = reset;
  assign ram_0_MPORT_18_data = 1'h0;
  assign ram_0_MPORT_18_addr = 6'h12;
  assign ram_0_MPORT_18_mask = 1'h1;
  assign ram_0_MPORT_18_en = reset;
  assign ram_0_MPORT_19_data = 1'h0;
  assign ram_0_MPORT_19_addr = 6'h13;
  assign ram_0_MPORT_19_mask = 1'h1;
  assign ram_0_MPORT_19_en = reset;
  assign ram_0_MPORT_20_data = 1'h0;
  assign ram_0_MPORT_20_addr = 6'h14;
  assign ram_0_MPORT_20_mask = 1'h1;
  assign ram_0_MPORT_20_en = reset;
  assign ram_0_MPORT_21_data = 1'h0;
  assign ram_0_MPORT_21_addr = 6'h15;
  assign ram_0_MPORT_21_mask = 1'h1;
  assign ram_0_MPORT_21_en = reset;
  assign ram_0_MPORT_22_data = 1'h0;
  assign ram_0_MPORT_22_addr = 6'h16;
  assign ram_0_MPORT_22_mask = 1'h1;
  assign ram_0_MPORT_22_en = reset;
  assign ram_0_MPORT_23_data = 1'h0;
  assign ram_0_MPORT_23_addr = 6'h17;
  assign ram_0_MPORT_23_mask = 1'h1;
  assign ram_0_MPORT_23_en = reset;
  assign ram_0_MPORT_24_data = 1'h0;
  assign ram_0_MPORT_24_addr = 6'h18;
  assign ram_0_MPORT_24_mask = 1'h1;
  assign ram_0_MPORT_24_en = reset;
  assign ram_0_MPORT_25_data = 1'h0;
  assign ram_0_MPORT_25_addr = 6'h19;
  assign ram_0_MPORT_25_mask = 1'h1;
  assign ram_0_MPORT_25_en = reset;
  assign ram_0_MPORT_26_data = 1'h0;
  assign ram_0_MPORT_26_addr = 6'h1a;
  assign ram_0_MPORT_26_mask = 1'h1;
  assign ram_0_MPORT_26_en = reset;
  assign ram_0_MPORT_27_data = 1'h0;
  assign ram_0_MPORT_27_addr = 6'h1b;
  assign ram_0_MPORT_27_mask = 1'h1;
  assign ram_0_MPORT_27_en = reset;
  assign ram_0_MPORT_28_data = 1'h0;
  assign ram_0_MPORT_28_addr = 6'h1c;
  assign ram_0_MPORT_28_mask = 1'h1;
  assign ram_0_MPORT_28_en = reset;
  assign ram_0_MPORT_29_data = 1'h0;
  assign ram_0_MPORT_29_addr = 6'h1d;
  assign ram_0_MPORT_29_mask = 1'h1;
  assign ram_0_MPORT_29_en = reset;
  assign ram_0_MPORT_30_data = 1'h0;
  assign ram_0_MPORT_30_addr = 6'h1e;
  assign ram_0_MPORT_30_mask = 1'h1;
  assign ram_0_MPORT_30_en = reset;
  assign ram_0_MPORT_31_data = 1'h0;
  assign ram_0_MPORT_31_addr = 6'h1f;
  assign ram_0_MPORT_31_mask = 1'h1;
  assign ram_0_MPORT_31_en = reset;
  assign ram_0_MPORT_32_data = 1'h0;
  assign ram_0_MPORT_32_addr = 6'h20;
  assign ram_0_MPORT_32_mask = 1'h1;
  assign ram_0_MPORT_32_en = reset;
  assign ram_0_MPORT_33_data = 1'h0;
  assign ram_0_MPORT_33_addr = 6'h21;
  assign ram_0_MPORT_33_mask = 1'h1;
  assign ram_0_MPORT_33_en = reset;
  assign ram_0_MPORT_34_data = 1'h0;
  assign ram_0_MPORT_34_addr = 6'h22;
  assign ram_0_MPORT_34_mask = 1'h1;
  assign ram_0_MPORT_34_en = reset;
  assign ram_0_MPORT_35_data = 1'h0;
  assign ram_0_MPORT_35_addr = 6'h23;
  assign ram_0_MPORT_35_mask = 1'h1;
  assign ram_0_MPORT_35_en = reset;
  assign ram_0_MPORT_36_data = 1'h0;
  assign ram_0_MPORT_36_addr = 6'h24;
  assign ram_0_MPORT_36_mask = 1'h1;
  assign ram_0_MPORT_36_en = reset;
  assign ram_0_MPORT_37_data = 1'h0;
  assign ram_0_MPORT_37_addr = 6'h25;
  assign ram_0_MPORT_37_mask = 1'h1;
  assign ram_0_MPORT_37_en = reset;
  assign ram_0_MPORT_38_data = 1'h0;
  assign ram_0_MPORT_38_addr = 6'h26;
  assign ram_0_MPORT_38_mask = 1'h1;
  assign ram_0_MPORT_38_en = reset;
  assign ram_0_MPORT_39_data = 1'h0;
  assign ram_0_MPORT_39_addr = 6'h27;
  assign ram_0_MPORT_39_mask = 1'h1;
  assign ram_0_MPORT_39_en = reset;
  assign ram_0_MPORT_40_data = 1'h0;
  assign ram_0_MPORT_40_addr = 6'h28;
  assign ram_0_MPORT_40_mask = 1'h1;
  assign ram_0_MPORT_40_en = reset;
  assign ram_0_MPORT_41_data = 1'h0;
  assign ram_0_MPORT_41_addr = 6'h29;
  assign ram_0_MPORT_41_mask = 1'h1;
  assign ram_0_MPORT_41_en = reset;
  assign ram_0_MPORT_42_data = 1'h0;
  assign ram_0_MPORT_42_addr = 6'h2a;
  assign ram_0_MPORT_42_mask = 1'h1;
  assign ram_0_MPORT_42_en = reset;
  assign ram_0_MPORT_43_data = 1'h0;
  assign ram_0_MPORT_43_addr = 6'h2b;
  assign ram_0_MPORT_43_mask = 1'h1;
  assign ram_0_MPORT_43_en = reset;
  assign ram_0_MPORT_44_data = 1'h0;
  assign ram_0_MPORT_44_addr = 6'h2c;
  assign ram_0_MPORT_44_mask = 1'h1;
  assign ram_0_MPORT_44_en = reset;
  assign ram_0_MPORT_45_data = 1'h0;
  assign ram_0_MPORT_45_addr = 6'h2d;
  assign ram_0_MPORT_45_mask = 1'h1;
  assign ram_0_MPORT_45_en = reset;
  assign ram_0_MPORT_46_data = 1'h0;
  assign ram_0_MPORT_46_addr = 6'h2e;
  assign ram_0_MPORT_46_mask = 1'h1;
  assign ram_0_MPORT_46_en = reset;
  assign ram_0_MPORT_47_data = 1'h0;
  assign ram_0_MPORT_47_addr = 6'h2f;
  assign ram_0_MPORT_47_mask = 1'h1;
  assign ram_0_MPORT_47_en = reset;
  assign ram_0_MPORT_48_data = 1'h0;
  assign ram_0_MPORT_48_addr = 6'h30;
  assign ram_0_MPORT_48_mask = 1'h1;
  assign ram_0_MPORT_48_en = reset;
  assign ram_0_MPORT_49_data = 1'h0;
  assign ram_0_MPORT_49_addr = 6'h31;
  assign ram_0_MPORT_49_mask = 1'h1;
  assign ram_0_MPORT_49_en = reset;
  assign ram_0_MPORT_50_data = 1'h0;
  assign ram_0_MPORT_50_addr = 6'h32;
  assign ram_0_MPORT_50_mask = 1'h1;
  assign ram_0_MPORT_50_en = reset;
  assign ram_0_MPORT_51_data = 1'h0;
  assign ram_0_MPORT_51_addr = 6'h33;
  assign ram_0_MPORT_51_mask = 1'h1;
  assign ram_0_MPORT_51_en = reset;
  assign ram_0_MPORT_52_data = 1'h0;
  assign ram_0_MPORT_52_addr = 6'h34;
  assign ram_0_MPORT_52_mask = 1'h1;
  assign ram_0_MPORT_52_en = reset;
  assign ram_0_MPORT_53_data = 1'h0;
  assign ram_0_MPORT_53_addr = 6'h35;
  assign ram_0_MPORT_53_mask = 1'h1;
  assign ram_0_MPORT_53_en = reset;
  assign ram_0_MPORT_54_data = 1'h0;
  assign ram_0_MPORT_54_addr = 6'h36;
  assign ram_0_MPORT_54_mask = 1'h1;
  assign ram_0_MPORT_54_en = reset;
  assign ram_0_MPORT_55_data = 1'h0;
  assign ram_0_MPORT_55_addr = 6'h37;
  assign ram_0_MPORT_55_mask = 1'h1;
  assign ram_0_MPORT_55_en = reset;
  assign ram_0_MPORT_56_data = 1'h0;
  assign ram_0_MPORT_56_addr = 6'h38;
  assign ram_0_MPORT_56_mask = 1'h1;
  assign ram_0_MPORT_56_en = reset;
  assign ram_0_MPORT_57_data = 1'h0;
  assign ram_0_MPORT_57_addr = 6'h39;
  assign ram_0_MPORT_57_mask = 1'h1;
  assign ram_0_MPORT_57_en = reset;
  assign ram_0_MPORT_58_data = 1'h0;
  assign ram_0_MPORT_58_addr = 6'h3a;
  assign ram_0_MPORT_58_mask = 1'h1;
  assign ram_0_MPORT_58_en = reset;
  assign ram_0_MPORT_59_data = 1'h0;
  assign ram_0_MPORT_59_addr = 6'h3b;
  assign ram_0_MPORT_59_mask = 1'h1;
  assign ram_0_MPORT_59_en = reset;
  assign ram_0_MPORT_60_data = 1'h0;
  assign ram_0_MPORT_60_addr = 6'h3c;
  assign ram_0_MPORT_60_mask = 1'h1;
  assign ram_0_MPORT_60_en = reset;
  assign ram_0_MPORT_61_data = 1'h0;
  assign ram_0_MPORT_61_addr = 6'h3d;
  assign ram_0_MPORT_61_mask = 1'h1;
  assign ram_0_MPORT_61_en = reset;
  assign ram_0_MPORT_62_data = 1'h0;
  assign ram_0_MPORT_62_addr = 6'h3e;
  assign ram_0_MPORT_62_mask = 1'h1;
  assign ram_0_MPORT_62_en = reset;
  assign ram_0_MPORT_63_data = 1'h0;
  assign ram_0_MPORT_63_addr = 6'h3f;
  assign ram_0_MPORT_63_mask = 1'h1;
  assign ram_0_MPORT_63_en = reset;
  assign ram_0_MPORT_64_data = 1'h1;
  assign ram_0_MPORT_64_addr = io_addr;
  assign ram_0_MPORT_64_mask = io_wmask[0];
  assign ram_0_MPORT_64_en = io_rw;
  assign ram_1_io_rdata_MPORT_en = ram_1_io_rdata_MPORT_en_pipe_0;
  assign ram_1_io_rdata_MPORT_addr = ram_1_io_rdata_MPORT_addr_pipe_0;
  assign ram_1_io_rdata_MPORT_data = ram_1[ram_1_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_1_MPORT_data = 1'h0;
  assign ram_1_MPORT_addr = 6'h0;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = reset;
  assign ram_1_MPORT_1_data = 1'h0;
  assign ram_1_MPORT_1_addr = 6'h1;
  assign ram_1_MPORT_1_mask = 1'h1;
  assign ram_1_MPORT_1_en = reset;
  assign ram_1_MPORT_2_data = 1'h0;
  assign ram_1_MPORT_2_addr = 6'h2;
  assign ram_1_MPORT_2_mask = 1'h1;
  assign ram_1_MPORT_2_en = reset;
  assign ram_1_MPORT_3_data = 1'h0;
  assign ram_1_MPORT_3_addr = 6'h3;
  assign ram_1_MPORT_3_mask = 1'h1;
  assign ram_1_MPORT_3_en = reset;
  assign ram_1_MPORT_4_data = 1'h0;
  assign ram_1_MPORT_4_addr = 6'h4;
  assign ram_1_MPORT_4_mask = 1'h1;
  assign ram_1_MPORT_4_en = reset;
  assign ram_1_MPORT_5_data = 1'h0;
  assign ram_1_MPORT_5_addr = 6'h5;
  assign ram_1_MPORT_5_mask = 1'h1;
  assign ram_1_MPORT_5_en = reset;
  assign ram_1_MPORT_6_data = 1'h0;
  assign ram_1_MPORT_6_addr = 6'h6;
  assign ram_1_MPORT_6_mask = 1'h1;
  assign ram_1_MPORT_6_en = reset;
  assign ram_1_MPORT_7_data = 1'h0;
  assign ram_1_MPORT_7_addr = 6'h7;
  assign ram_1_MPORT_7_mask = 1'h1;
  assign ram_1_MPORT_7_en = reset;
  assign ram_1_MPORT_8_data = 1'h0;
  assign ram_1_MPORT_8_addr = 6'h8;
  assign ram_1_MPORT_8_mask = 1'h1;
  assign ram_1_MPORT_8_en = reset;
  assign ram_1_MPORT_9_data = 1'h0;
  assign ram_1_MPORT_9_addr = 6'h9;
  assign ram_1_MPORT_9_mask = 1'h1;
  assign ram_1_MPORT_9_en = reset;
  assign ram_1_MPORT_10_data = 1'h0;
  assign ram_1_MPORT_10_addr = 6'ha;
  assign ram_1_MPORT_10_mask = 1'h1;
  assign ram_1_MPORT_10_en = reset;
  assign ram_1_MPORT_11_data = 1'h0;
  assign ram_1_MPORT_11_addr = 6'hb;
  assign ram_1_MPORT_11_mask = 1'h1;
  assign ram_1_MPORT_11_en = reset;
  assign ram_1_MPORT_12_data = 1'h0;
  assign ram_1_MPORT_12_addr = 6'hc;
  assign ram_1_MPORT_12_mask = 1'h1;
  assign ram_1_MPORT_12_en = reset;
  assign ram_1_MPORT_13_data = 1'h0;
  assign ram_1_MPORT_13_addr = 6'hd;
  assign ram_1_MPORT_13_mask = 1'h1;
  assign ram_1_MPORT_13_en = reset;
  assign ram_1_MPORT_14_data = 1'h0;
  assign ram_1_MPORT_14_addr = 6'he;
  assign ram_1_MPORT_14_mask = 1'h1;
  assign ram_1_MPORT_14_en = reset;
  assign ram_1_MPORT_15_data = 1'h0;
  assign ram_1_MPORT_15_addr = 6'hf;
  assign ram_1_MPORT_15_mask = 1'h1;
  assign ram_1_MPORT_15_en = reset;
  assign ram_1_MPORT_16_data = 1'h0;
  assign ram_1_MPORT_16_addr = 6'h10;
  assign ram_1_MPORT_16_mask = 1'h1;
  assign ram_1_MPORT_16_en = reset;
  assign ram_1_MPORT_17_data = 1'h0;
  assign ram_1_MPORT_17_addr = 6'h11;
  assign ram_1_MPORT_17_mask = 1'h1;
  assign ram_1_MPORT_17_en = reset;
  assign ram_1_MPORT_18_data = 1'h0;
  assign ram_1_MPORT_18_addr = 6'h12;
  assign ram_1_MPORT_18_mask = 1'h1;
  assign ram_1_MPORT_18_en = reset;
  assign ram_1_MPORT_19_data = 1'h0;
  assign ram_1_MPORT_19_addr = 6'h13;
  assign ram_1_MPORT_19_mask = 1'h1;
  assign ram_1_MPORT_19_en = reset;
  assign ram_1_MPORT_20_data = 1'h0;
  assign ram_1_MPORT_20_addr = 6'h14;
  assign ram_1_MPORT_20_mask = 1'h1;
  assign ram_1_MPORT_20_en = reset;
  assign ram_1_MPORT_21_data = 1'h0;
  assign ram_1_MPORT_21_addr = 6'h15;
  assign ram_1_MPORT_21_mask = 1'h1;
  assign ram_1_MPORT_21_en = reset;
  assign ram_1_MPORT_22_data = 1'h0;
  assign ram_1_MPORT_22_addr = 6'h16;
  assign ram_1_MPORT_22_mask = 1'h1;
  assign ram_1_MPORT_22_en = reset;
  assign ram_1_MPORT_23_data = 1'h0;
  assign ram_1_MPORT_23_addr = 6'h17;
  assign ram_1_MPORT_23_mask = 1'h1;
  assign ram_1_MPORT_23_en = reset;
  assign ram_1_MPORT_24_data = 1'h0;
  assign ram_1_MPORT_24_addr = 6'h18;
  assign ram_1_MPORT_24_mask = 1'h1;
  assign ram_1_MPORT_24_en = reset;
  assign ram_1_MPORT_25_data = 1'h0;
  assign ram_1_MPORT_25_addr = 6'h19;
  assign ram_1_MPORT_25_mask = 1'h1;
  assign ram_1_MPORT_25_en = reset;
  assign ram_1_MPORT_26_data = 1'h0;
  assign ram_1_MPORT_26_addr = 6'h1a;
  assign ram_1_MPORT_26_mask = 1'h1;
  assign ram_1_MPORT_26_en = reset;
  assign ram_1_MPORT_27_data = 1'h0;
  assign ram_1_MPORT_27_addr = 6'h1b;
  assign ram_1_MPORT_27_mask = 1'h1;
  assign ram_1_MPORT_27_en = reset;
  assign ram_1_MPORT_28_data = 1'h0;
  assign ram_1_MPORT_28_addr = 6'h1c;
  assign ram_1_MPORT_28_mask = 1'h1;
  assign ram_1_MPORT_28_en = reset;
  assign ram_1_MPORT_29_data = 1'h0;
  assign ram_1_MPORT_29_addr = 6'h1d;
  assign ram_1_MPORT_29_mask = 1'h1;
  assign ram_1_MPORT_29_en = reset;
  assign ram_1_MPORT_30_data = 1'h0;
  assign ram_1_MPORT_30_addr = 6'h1e;
  assign ram_1_MPORT_30_mask = 1'h1;
  assign ram_1_MPORT_30_en = reset;
  assign ram_1_MPORT_31_data = 1'h0;
  assign ram_1_MPORT_31_addr = 6'h1f;
  assign ram_1_MPORT_31_mask = 1'h1;
  assign ram_1_MPORT_31_en = reset;
  assign ram_1_MPORT_32_data = 1'h0;
  assign ram_1_MPORT_32_addr = 6'h20;
  assign ram_1_MPORT_32_mask = 1'h1;
  assign ram_1_MPORT_32_en = reset;
  assign ram_1_MPORT_33_data = 1'h0;
  assign ram_1_MPORT_33_addr = 6'h21;
  assign ram_1_MPORT_33_mask = 1'h1;
  assign ram_1_MPORT_33_en = reset;
  assign ram_1_MPORT_34_data = 1'h0;
  assign ram_1_MPORT_34_addr = 6'h22;
  assign ram_1_MPORT_34_mask = 1'h1;
  assign ram_1_MPORT_34_en = reset;
  assign ram_1_MPORT_35_data = 1'h0;
  assign ram_1_MPORT_35_addr = 6'h23;
  assign ram_1_MPORT_35_mask = 1'h1;
  assign ram_1_MPORT_35_en = reset;
  assign ram_1_MPORT_36_data = 1'h0;
  assign ram_1_MPORT_36_addr = 6'h24;
  assign ram_1_MPORT_36_mask = 1'h1;
  assign ram_1_MPORT_36_en = reset;
  assign ram_1_MPORT_37_data = 1'h0;
  assign ram_1_MPORT_37_addr = 6'h25;
  assign ram_1_MPORT_37_mask = 1'h1;
  assign ram_1_MPORT_37_en = reset;
  assign ram_1_MPORT_38_data = 1'h0;
  assign ram_1_MPORT_38_addr = 6'h26;
  assign ram_1_MPORT_38_mask = 1'h1;
  assign ram_1_MPORT_38_en = reset;
  assign ram_1_MPORT_39_data = 1'h0;
  assign ram_1_MPORT_39_addr = 6'h27;
  assign ram_1_MPORT_39_mask = 1'h1;
  assign ram_1_MPORT_39_en = reset;
  assign ram_1_MPORT_40_data = 1'h0;
  assign ram_1_MPORT_40_addr = 6'h28;
  assign ram_1_MPORT_40_mask = 1'h1;
  assign ram_1_MPORT_40_en = reset;
  assign ram_1_MPORT_41_data = 1'h0;
  assign ram_1_MPORT_41_addr = 6'h29;
  assign ram_1_MPORT_41_mask = 1'h1;
  assign ram_1_MPORT_41_en = reset;
  assign ram_1_MPORT_42_data = 1'h0;
  assign ram_1_MPORT_42_addr = 6'h2a;
  assign ram_1_MPORT_42_mask = 1'h1;
  assign ram_1_MPORT_42_en = reset;
  assign ram_1_MPORT_43_data = 1'h0;
  assign ram_1_MPORT_43_addr = 6'h2b;
  assign ram_1_MPORT_43_mask = 1'h1;
  assign ram_1_MPORT_43_en = reset;
  assign ram_1_MPORT_44_data = 1'h0;
  assign ram_1_MPORT_44_addr = 6'h2c;
  assign ram_1_MPORT_44_mask = 1'h1;
  assign ram_1_MPORT_44_en = reset;
  assign ram_1_MPORT_45_data = 1'h0;
  assign ram_1_MPORT_45_addr = 6'h2d;
  assign ram_1_MPORT_45_mask = 1'h1;
  assign ram_1_MPORT_45_en = reset;
  assign ram_1_MPORT_46_data = 1'h0;
  assign ram_1_MPORT_46_addr = 6'h2e;
  assign ram_1_MPORT_46_mask = 1'h1;
  assign ram_1_MPORT_46_en = reset;
  assign ram_1_MPORT_47_data = 1'h0;
  assign ram_1_MPORT_47_addr = 6'h2f;
  assign ram_1_MPORT_47_mask = 1'h1;
  assign ram_1_MPORT_47_en = reset;
  assign ram_1_MPORT_48_data = 1'h0;
  assign ram_1_MPORT_48_addr = 6'h30;
  assign ram_1_MPORT_48_mask = 1'h1;
  assign ram_1_MPORT_48_en = reset;
  assign ram_1_MPORT_49_data = 1'h0;
  assign ram_1_MPORT_49_addr = 6'h31;
  assign ram_1_MPORT_49_mask = 1'h1;
  assign ram_1_MPORT_49_en = reset;
  assign ram_1_MPORT_50_data = 1'h0;
  assign ram_1_MPORT_50_addr = 6'h32;
  assign ram_1_MPORT_50_mask = 1'h1;
  assign ram_1_MPORT_50_en = reset;
  assign ram_1_MPORT_51_data = 1'h0;
  assign ram_1_MPORT_51_addr = 6'h33;
  assign ram_1_MPORT_51_mask = 1'h1;
  assign ram_1_MPORT_51_en = reset;
  assign ram_1_MPORT_52_data = 1'h0;
  assign ram_1_MPORT_52_addr = 6'h34;
  assign ram_1_MPORT_52_mask = 1'h1;
  assign ram_1_MPORT_52_en = reset;
  assign ram_1_MPORT_53_data = 1'h0;
  assign ram_1_MPORT_53_addr = 6'h35;
  assign ram_1_MPORT_53_mask = 1'h1;
  assign ram_1_MPORT_53_en = reset;
  assign ram_1_MPORT_54_data = 1'h0;
  assign ram_1_MPORT_54_addr = 6'h36;
  assign ram_1_MPORT_54_mask = 1'h1;
  assign ram_1_MPORT_54_en = reset;
  assign ram_1_MPORT_55_data = 1'h0;
  assign ram_1_MPORT_55_addr = 6'h37;
  assign ram_1_MPORT_55_mask = 1'h1;
  assign ram_1_MPORT_55_en = reset;
  assign ram_1_MPORT_56_data = 1'h0;
  assign ram_1_MPORT_56_addr = 6'h38;
  assign ram_1_MPORT_56_mask = 1'h1;
  assign ram_1_MPORT_56_en = reset;
  assign ram_1_MPORT_57_data = 1'h0;
  assign ram_1_MPORT_57_addr = 6'h39;
  assign ram_1_MPORT_57_mask = 1'h1;
  assign ram_1_MPORT_57_en = reset;
  assign ram_1_MPORT_58_data = 1'h0;
  assign ram_1_MPORT_58_addr = 6'h3a;
  assign ram_1_MPORT_58_mask = 1'h1;
  assign ram_1_MPORT_58_en = reset;
  assign ram_1_MPORT_59_data = 1'h0;
  assign ram_1_MPORT_59_addr = 6'h3b;
  assign ram_1_MPORT_59_mask = 1'h1;
  assign ram_1_MPORT_59_en = reset;
  assign ram_1_MPORT_60_data = 1'h0;
  assign ram_1_MPORT_60_addr = 6'h3c;
  assign ram_1_MPORT_60_mask = 1'h1;
  assign ram_1_MPORT_60_en = reset;
  assign ram_1_MPORT_61_data = 1'h0;
  assign ram_1_MPORT_61_addr = 6'h3d;
  assign ram_1_MPORT_61_mask = 1'h1;
  assign ram_1_MPORT_61_en = reset;
  assign ram_1_MPORT_62_data = 1'h0;
  assign ram_1_MPORT_62_addr = 6'h3e;
  assign ram_1_MPORT_62_mask = 1'h1;
  assign ram_1_MPORT_62_en = reset;
  assign ram_1_MPORT_63_data = 1'h0;
  assign ram_1_MPORT_63_addr = 6'h3f;
  assign ram_1_MPORT_63_mask = 1'h1;
  assign ram_1_MPORT_63_en = reset;
  assign ram_1_MPORT_64_data = 1'h1;
  assign ram_1_MPORT_64_addr = io_addr;
  assign ram_1_MPORT_64_mask = io_wmask[1];
  assign ram_1_MPORT_64_en = io_rw;
  assign ram_2_io_rdata_MPORT_en = ram_2_io_rdata_MPORT_en_pipe_0;
  assign ram_2_io_rdata_MPORT_addr = ram_2_io_rdata_MPORT_addr_pipe_0;
  assign ram_2_io_rdata_MPORT_data = ram_2[ram_2_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_2_MPORT_data = 1'h0;
  assign ram_2_MPORT_addr = 6'h0;
  assign ram_2_MPORT_mask = 1'h1;
  assign ram_2_MPORT_en = reset;
  assign ram_2_MPORT_1_data = 1'h0;
  assign ram_2_MPORT_1_addr = 6'h1;
  assign ram_2_MPORT_1_mask = 1'h1;
  assign ram_2_MPORT_1_en = reset;
  assign ram_2_MPORT_2_data = 1'h0;
  assign ram_2_MPORT_2_addr = 6'h2;
  assign ram_2_MPORT_2_mask = 1'h1;
  assign ram_2_MPORT_2_en = reset;
  assign ram_2_MPORT_3_data = 1'h0;
  assign ram_2_MPORT_3_addr = 6'h3;
  assign ram_2_MPORT_3_mask = 1'h1;
  assign ram_2_MPORT_3_en = reset;
  assign ram_2_MPORT_4_data = 1'h0;
  assign ram_2_MPORT_4_addr = 6'h4;
  assign ram_2_MPORT_4_mask = 1'h1;
  assign ram_2_MPORT_4_en = reset;
  assign ram_2_MPORT_5_data = 1'h0;
  assign ram_2_MPORT_5_addr = 6'h5;
  assign ram_2_MPORT_5_mask = 1'h1;
  assign ram_2_MPORT_5_en = reset;
  assign ram_2_MPORT_6_data = 1'h0;
  assign ram_2_MPORT_6_addr = 6'h6;
  assign ram_2_MPORT_6_mask = 1'h1;
  assign ram_2_MPORT_6_en = reset;
  assign ram_2_MPORT_7_data = 1'h0;
  assign ram_2_MPORT_7_addr = 6'h7;
  assign ram_2_MPORT_7_mask = 1'h1;
  assign ram_2_MPORT_7_en = reset;
  assign ram_2_MPORT_8_data = 1'h0;
  assign ram_2_MPORT_8_addr = 6'h8;
  assign ram_2_MPORT_8_mask = 1'h1;
  assign ram_2_MPORT_8_en = reset;
  assign ram_2_MPORT_9_data = 1'h0;
  assign ram_2_MPORT_9_addr = 6'h9;
  assign ram_2_MPORT_9_mask = 1'h1;
  assign ram_2_MPORT_9_en = reset;
  assign ram_2_MPORT_10_data = 1'h0;
  assign ram_2_MPORT_10_addr = 6'ha;
  assign ram_2_MPORT_10_mask = 1'h1;
  assign ram_2_MPORT_10_en = reset;
  assign ram_2_MPORT_11_data = 1'h0;
  assign ram_2_MPORT_11_addr = 6'hb;
  assign ram_2_MPORT_11_mask = 1'h1;
  assign ram_2_MPORT_11_en = reset;
  assign ram_2_MPORT_12_data = 1'h0;
  assign ram_2_MPORT_12_addr = 6'hc;
  assign ram_2_MPORT_12_mask = 1'h1;
  assign ram_2_MPORT_12_en = reset;
  assign ram_2_MPORT_13_data = 1'h0;
  assign ram_2_MPORT_13_addr = 6'hd;
  assign ram_2_MPORT_13_mask = 1'h1;
  assign ram_2_MPORT_13_en = reset;
  assign ram_2_MPORT_14_data = 1'h0;
  assign ram_2_MPORT_14_addr = 6'he;
  assign ram_2_MPORT_14_mask = 1'h1;
  assign ram_2_MPORT_14_en = reset;
  assign ram_2_MPORT_15_data = 1'h0;
  assign ram_2_MPORT_15_addr = 6'hf;
  assign ram_2_MPORT_15_mask = 1'h1;
  assign ram_2_MPORT_15_en = reset;
  assign ram_2_MPORT_16_data = 1'h0;
  assign ram_2_MPORT_16_addr = 6'h10;
  assign ram_2_MPORT_16_mask = 1'h1;
  assign ram_2_MPORT_16_en = reset;
  assign ram_2_MPORT_17_data = 1'h0;
  assign ram_2_MPORT_17_addr = 6'h11;
  assign ram_2_MPORT_17_mask = 1'h1;
  assign ram_2_MPORT_17_en = reset;
  assign ram_2_MPORT_18_data = 1'h0;
  assign ram_2_MPORT_18_addr = 6'h12;
  assign ram_2_MPORT_18_mask = 1'h1;
  assign ram_2_MPORT_18_en = reset;
  assign ram_2_MPORT_19_data = 1'h0;
  assign ram_2_MPORT_19_addr = 6'h13;
  assign ram_2_MPORT_19_mask = 1'h1;
  assign ram_2_MPORT_19_en = reset;
  assign ram_2_MPORT_20_data = 1'h0;
  assign ram_2_MPORT_20_addr = 6'h14;
  assign ram_2_MPORT_20_mask = 1'h1;
  assign ram_2_MPORT_20_en = reset;
  assign ram_2_MPORT_21_data = 1'h0;
  assign ram_2_MPORT_21_addr = 6'h15;
  assign ram_2_MPORT_21_mask = 1'h1;
  assign ram_2_MPORT_21_en = reset;
  assign ram_2_MPORT_22_data = 1'h0;
  assign ram_2_MPORT_22_addr = 6'h16;
  assign ram_2_MPORT_22_mask = 1'h1;
  assign ram_2_MPORT_22_en = reset;
  assign ram_2_MPORT_23_data = 1'h0;
  assign ram_2_MPORT_23_addr = 6'h17;
  assign ram_2_MPORT_23_mask = 1'h1;
  assign ram_2_MPORT_23_en = reset;
  assign ram_2_MPORT_24_data = 1'h0;
  assign ram_2_MPORT_24_addr = 6'h18;
  assign ram_2_MPORT_24_mask = 1'h1;
  assign ram_2_MPORT_24_en = reset;
  assign ram_2_MPORT_25_data = 1'h0;
  assign ram_2_MPORT_25_addr = 6'h19;
  assign ram_2_MPORT_25_mask = 1'h1;
  assign ram_2_MPORT_25_en = reset;
  assign ram_2_MPORT_26_data = 1'h0;
  assign ram_2_MPORT_26_addr = 6'h1a;
  assign ram_2_MPORT_26_mask = 1'h1;
  assign ram_2_MPORT_26_en = reset;
  assign ram_2_MPORT_27_data = 1'h0;
  assign ram_2_MPORT_27_addr = 6'h1b;
  assign ram_2_MPORT_27_mask = 1'h1;
  assign ram_2_MPORT_27_en = reset;
  assign ram_2_MPORT_28_data = 1'h0;
  assign ram_2_MPORT_28_addr = 6'h1c;
  assign ram_2_MPORT_28_mask = 1'h1;
  assign ram_2_MPORT_28_en = reset;
  assign ram_2_MPORT_29_data = 1'h0;
  assign ram_2_MPORT_29_addr = 6'h1d;
  assign ram_2_MPORT_29_mask = 1'h1;
  assign ram_2_MPORT_29_en = reset;
  assign ram_2_MPORT_30_data = 1'h0;
  assign ram_2_MPORT_30_addr = 6'h1e;
  assign ram_2_MPORT_30_mask = 1'h1;
  assign ram_2_MPORT_30_en = reset;
  assign ram_2_MPORT_31_data = 1'h0;
  assign ram_2_MPORT_31_addr = 6'h1f;
  assign ram_2_MPORT_31_mask = 1'h1;
  assign ram_2_MPORT_31_en = reset;
  assign ram_2_MPORT_32_data = 1'h0;
  assign ram_2_MPORT_32_addr = 6'h20;
  assign ram_2_MPORT_32_mask = 1'h1;
  assign ram_2_MPORT_32_en = reset;
  assign ram_2_MPORT_33_data = 1'h0;
  assign ram_2_MPORT_33_addr = 6'h21;
  assign ram_2_MPORT_33_mask = 1'h1;
  assign ram_2_MPORT_33_en = reset;
  assign ram_2_MPORT_34_data = 1'h0;
  assign ram_2_MPORT_34_addr = 6'h22;
  assign ram_2_MPORT_34_mask = 1'h1;
  assign ram_2_MPORT_34_en = reset;
  assign ram_2_MPORT_35_data = 1'h0;
  assign ram_2_MPORT_35_addr = 6'h23;
  assign ram_2_MPORT_35_mask = 1'h1;
  assign ram_2_MPORT_35_en = reset;
  assign ram_2_MPORT_36_data = 1'h0;
  assign ram_2_MPORT_36_addr = 6'h24;
  assign ram_2_MPORT_36_mask = 1'h1;
  assign ram_2_MPORT_36_en = reset;
  assign ram_2_MPORT_37_data = 1'h0;
  assign ram_2_MPORT_37_addr = 6'h25;
  assign ram_2_MPORT_37_mask = 1'h1;
  assign ram_2_MPORT_37_en = reset;
  assign ram_2_MPORT_38_data = 1'h0;
  assign ram_2_MPORT_38_addr = 6'h26;
  assign ram_2_MPORT_38_mask = 1'h1;
  assign ram_2_MPORT_38_en = reset;
  assign ram_2_MPORT_39_data = 1'h0;
  assign ram_2_MPORT_39_addr = 6'h27;
  assign ram_2_MPORT_39_mask = 1'h1;
  assign ram_2_MPORT_39_en = reset;
  assign ram_2_MPORT_40_data = 1'h0;
  assign ram_2_MPORT_40_addr = 6'h28;
  assign ram_2_MPORT_40_mask = 1'h1;
  assign ram_2_MPORT_40_en = reset;
  assign ram_2_MPORT_41_data = 1'h0;
  assign ram_2_MPORT_41_addr = 6'h29;
  assign ram_2_MPORT_41_mask = 1'h1;
  assign ram_2_MPORT_41_en = reset;
  assign ram_2_MPORT_42_data = 1'h0;
  assign ram_2_MPORT_42_addr = 6'h2a;
  assign ram_2_MPORT_42_mask = 1'h1;
  assign ram_2_MPORT_42_en = reset;
  assign ram_2_MPORT_43_data = 1'h0;
  assign ram_2_MPORT_43_addr = 6'h2b;
  assign ram_2_MPORT_43_mask = 1'h1;
  assign ram_2_MPORT_43_en = reset;
  assign ram_2_MPORT_44_data = 1'h0;
  assign ram_2_MPORT_44_addr = 6'h2c;
  assign ram_2_MPORT_44_mask = 1'h1;
  assign ram_2_MPORT_44_en = reset;
  assign ram_2_MPORT_45_data = 1'h0;
  assign ram_2_MPORT_45_addr = 6'h2d;
  assign ram_2_MPORT_45_mask = 1'h1;
  assign ram_2_MPORT_45_en = reset;
  assign ram_2_MPORT_46_data = 1'h0;
  assign ram_2_MPORT_46_addr = 6'h2e;
  assign ram_2_MPORT_46_mask = 1'h1;
  assign ram_2_MPORT_46_en = reset;
  assign ram_2_MPORT_47_data = 1'h0;
  assign ram_2_MPORT_47_addr = 6'h2f;
  assign ram_2_MPORT_47_mask = 1'h1;
  assign ram_2_MPORT_47_en = reset;
  assign ram_2_MPORT_48_data = 1'h0;
  assign ram_2_MPORT_48_addr = 6'h30;
  assign ram_2_MPORT_48_mask = 1'h1;
  assign ram_2_MPORT_48_en = reset;
  assign ram_2_MPORT_49_data = 1'h0;
  assign ram_2_MPORT_49_addr = 6'h31;
  assign ram_2_MPORT_49_mask = 1'h1;
  assign ram_2_MPORT_49_en = reset;
  assign ram_2_MPORT_50_data = 1'h0;
  assign ram_2_MPORT_50_addr = 6'h32;
  assign ram_2_MPORT_50_mask = 1'h1;
  assign ram_2_MPORT_50_en = reset;
  assign ram_2_MPORT_51_data = 1'h0;
  assign ram_2_MPORT_51_addr = 6'h33;
  assign ram_2_MPORT_51_mask = 1'h1;
  assign ram_2_MPORT_51_en = reset;
  assign ram_2_MPORT_52_data = 1'h0;
  assign ram_2_MPORT_52_addr = 6'h34;
  assign ram_2_MPORT_52_mask = 1'h1;
  assign ram_2_MPORT_52_en = reset;
  assign ram_2_MPORT_53_data = 1'h0;
  assign ram_2_MPORT_53_addr = 6'h35;
  assign ram_2_MPORT_53_mask = 1'h1;
  assign ram_2_MPORT_53_en = reset;
  assign ram_2_MPORT_54_data = 1'h0;
  assign ram_2_MPORT_54_addr = 6'h36;
  assign ram_2_MPORT_54_mask = 1'h1;
  assign ram_2_MPORT_54_en = reset;
  assign ram_2_MPORT_55_data = 1'h0;
  assign ram_2_MPORT_55_addr = 6'h37;
  assign ram_2_MPORT_55_mask = 1'h1;
  assign ram_2_MPORT_55_en = reset;
  assign ram_2_MPORT_56_data = 1'h0;
  assign ram_2_MPORT_56_addr = 6'h38;
  assign ram_2_MPORT_56_mask = 1'h1;
  assign ram_2_MPORT_56_en = reset;
  assign ram_2_MPORT_57_data = 1'h0;
  assign ram_2_MPORT_57_addr = 6'h39;
  assign ram_2_MPORT_57_mask = 1'h1;
  assign ram_2_MPORT_57_en = reset;
  assign ram_2_MPORT_58_data = 1'h0;
  assign ram_2_MPORT_58_addr = 6'h3a;
  assign ram_2_MPORT_58_mask = 1'h1;
  assign ram_2_MPORT_58_en = reset;
  assign ram_2_MPORT_59_data = 1'h0;
  assign ram_2_MPORT_59_addr = 6'h3b;
  assign ram_2_MPORT_59_mask = 1'h1;
  assign ram_2_MPORT_59_en = reset;
  assign ram_2_MPORT_60_data = 1'h0;
  assign ram_2_MPORT_60_addr = 6'h3c;
  assign ram_2_MPORT_60_mask = 1'h1;
  assign ram_2_MPORT_60_en = reset;
  assign ram_2_MPORT_61_data = 1'h0;
  assign ram_2_MPORT_61_addr = 6'h3d;
  assign ram_2_MPORT_61_mask = 1'h1;
  assign ram_2_MPORT_61_en = reset;
  assign ram_2_MPORT_62_data = 1'h0;
  assign ram_2_MPORT_62_addr = 6'h3e;
  assign ram_2_MPORT_62_mask = 1'h1;
  assign ram_2_MPORT_62_en = reset;
  assign ram_2_MPORT_63_data = 1'h0;
  assign ram_2_MPORT_63_addr = 6'h3f;
  assign ram_2_MPORT_63_mask = 1'h1;
  assign ram_2_MPORT_63_en = reset;
  assign ram_2_MPORT_64_data = 1'h1;
  assign ram_2_MPORT_64_addr = io_addr;
  assign ram_2_MPORT_64_mask = io_wmask[2];
  assign ram_2_MPORT_64_en = io_rw;
  assign ram_3_io_rdata_MPORT_en = ram_3_io_rdata_MPORT_en_pipe_0;
  assign ram_3_io_rdata_MPORT_addr = ram_3_io_rdata_MPORT_addr_pipe_0;
  assign ram_3_io_rdata_MPORT_data = ram_3[ram_3_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_3_MPORT_data = 1'h0;
  assign ram_3_MPORT_addr = 6'h0;
  assign ram_3_MPORT_mask = 1'h1;
  assign ram_3_MPORT_en = reset;
  assign ram_3_MPORT_1_data = 1'h0;
  assign ram_3_MPORT_1_addr = 6'h1;
  assign ram_3_MPORT_1_mask = 1'h1;
  assign ram_3_MPORT_1_en = reset;
  assign ram_3_MPORT_2_data = 1'h0;
  assign ram_3_MPORT_2_addr = 6'h2;
  assign ram_3_MPORT_2_mask = 1'h1;
  assign ram_3_MPORT_2_en = reset;
  assign ram_3_MPORT_3_data = 1'h0;
  assign ram_3_MPORT_3_addr = 6'h3;
  assign ram_3_MPORT_3_mask = 1'h1;
  assign ram_3_MPORT_3_en = reset;
  assign ram_3_MPORT_4_data = 1'h0;
  assign ram_3_MPORT_4_addr = 6'h4;
  assign ram_3_MPORT_4_mask = 1'h1;
  assign ram_3_MPORT_4_en = reset;
  assign ram_3_MPORT_5_data = 1'h0;
  assign ram_3_MPORT_5_addr = 6'h5;
  assign ram_3_MPORT_5_mask = 1'h1;
  assign ram_3_MPORT_5_en = reset;
  assign ram_3_MPORT_6_data = 1'h0;
  assign ram_3_MPORT_6_addr = 6'h6;
  assign ram_3_MPORT_6_mask = 1'h1;
  assign ram_3_MPORT_6_en = reset;
  assign ram_3_MPORT_7_data = 1'h0;
  assign ram_3_MPORT_7_addr = 6'h7;
  assign ram_3_MPORT_7_mask = 1'h1;
  assign ram_3_MPORT_7_en = reset;
  assign ram_3_MPORT_8_data = 1'h0;
  assign ram_3_MPORT_8_addr = 6'h8;
  assign ram_3_MPORT_8_mask = 1'h1;
  assign ram_3_MPORT_8_en = reset;
  assign ram_3_MPORT_9_data = 1'h0;
  assign ram_3_MPORT_9_addr = 6'h9;
  assign ram_3_MPORT_9_mask = 1'h1;
  assign ram_3_MPORT_9_en = reset;
  assign ram_3_MPORT_10_data = 1'h0;
  assign ram_3_MPORT_10_addr = 6'ha;
  assign ram_3_MPORT_10_mask = 1'h1;
  assign ram_3_MPORT_10_en = reset;
  assign ram_3_MPORT_11_data = 1'h0;
  assign ram_3_MPORT_11_addr = 6'hb;
  assign ram_3_MPORT_11_mask = 1'h1;
  assign ram_3_MPORT_11_en = reset;
  assign ram_3_MPORT_12_data = 1'h0;
  assign ram_3_MPORT_12_addr = 6'hc;
  assign ram_3_MPORT_12_mask = 1'h1;
  assign ram_3_MPORT_12_en = reset;
  assign ram_3_MPORT_13_data = 1'h0;
  assign ram_3_MPORT_13_addr = 6'hd;
  assign ram_3_MPORT_13_mask = 1'h1;
  assign ram_3_MPORT_13_en = reset;
  assign ram_3_MPORT_14_data = 1'h0;
  assign ram_3_MPORT_14_addr = 6'he;
  assign ram_3_MPORT_14_mask = 1'h1;
  assign ram_3_MPORT_14_en = reset;
  assign ram_3_MPORT_15_data = 1'h0;
  assign ram_3_MPORT_15_addr = 6'hf;
  assign ram_3_MPORT_15_mask = 1'h1;
  assign ram_3_MPORT_15_en = reset;
  assign ram_3_MPORT_16_data = 1'h0;
  assign ram_3_MPORT_16_addr = 6'h10;
  assign ram_3_MPORT_16_mask = 1'h1;
  assign ram_3_MPORT_16_en = reset;
  assign ram_3_MPORT_17_data = 1'h0;
  assign ram_3_MPORT_17_addr = 6'h11;
  assign ram_3_MPORT_17_mask = 1'h1;
  assign ram_3_MPORT_17_en = reset;
  assign ram_3_MPORT_18_data = 1'h0;
  assign ram_3_MPORT_18_addr = 6'h12;
  assign ram_3_MPORT_18_mask = 1'h1;
  assign ram_3_MPORT_18_en = reset;
  assign ram_3_MPORT_19_data = 1'h0;
  assign ram_3_MPORT_19_addr = 6'h13;
  assign ram_3_MPORT_19_mask = 1'h1;
  assign ram_3_MPORT_19_en = reset;
  assign ram_3_MPORT_20_data = 1'h0;
  assign ram_3_MPORT_20_addr = 6'h14;
  assign ram_3_MPORT_20_mask = 1'h1;
  assign ram_3_MPORT_20_en = reset;
  assign ram_3_MPORT_21_data = 1'h0;
  assign ram_3_MPORT_21_addr = 6'h15;
  assign ram_3_MPORT_21_mask = 1'h1;
  assign ram_3_MPORT_21_en = reset;
  assign ram_3_MPORT_22_data = 1'h0;
  assign ram_3_MPORT_22_addr = 6'h16;
  assign ram_3_MPORT_22_mask = 1'h1;
  assign ram_3_MPORT_22_en = reset;
  assign ram_3_MPORT_23_data = 1'h0;
  assign ram_3_MPORT_23_addr = 6'h17;
  assign ram_3_MPORT_23_mask = 1'h1;
  assign ram_3_MPORT_23_en = reset;
  assign ram_3_MPORT_24_data = 1'h0;
  assign ram_3_MPORT_24_addr = 6'h18;
  assign ram_3_MPORT_24_mask = 1'h1;
  assign ram_3_MPORT_24_en = reset;
  assign ram_3_MPORT_25_data = 1'h0;
  assign ram_3_MPORT_25_addr = 6'h19;
  assign ram_3_MPORT_25_mask = 1'h1;
  assign ram_3_MPORT_25_en = reset;
  assign ram_3_MPORT_26_data = 1'h0;
  assign ram_3_MPORT_26_addr = 6'h1a;
  assign ram_3_MPORT_26_mask = 1'h1;
  assign ram_3_MPORT_26_en = reset;
  assign ram_3_MPORT_27_data = 1'h0;
  assign ram_3_MPORT_27_addr = 6'h1b;
  assign ram_3_MPORT_27_mask = 1'h1;
  assign ram_3_MPORT_27_en = reset;
  assign ram_3_MPORT_28_data = 1'h0;
  assign ram_3_MPORT_28_addr = 6'h1c;
  assign ram_3_MPORT_28_mask = 1'h1;
  assign ram_3_MPORT_28_en = reset;
  assign ram_3_MPORT_29_data = 1'h0;
  assign ram_3_MPORT_29_addr = 6'h1d;
  assign ram_3_MPORT_29_mask = 1'h1;
  assign ram_3_MPORT_29_en = reset;
  assign ram_3_MPORT_30_data = 1'h0;
  assign ram_3_MPORT_30_addr = 6'h1e;
  assign ram_3_MPORT_30_mask = 1'h1;
  assign ram_3_MPORT_30_en = reset;
  assign ram_3_MPORT_31_data = 1'h0;
  assign ram_3_MPORT_31_addr = 6'h1f;
  assign ram_3_MPORT_31_mask = 1'h1;
  assign ram_3_MPORT_31_en = reset;
  assign ram_3_MPORT_32_data = 1'h0;
  assign ram_3_MPORT_32_addr = 6'h20;
  assign ram_3_MPORT_32_mask = 1'h1;
  assign ram_3_MPORT_32_en = reset;
  assign ram_3_MPORT_33_data = 1'h0;
  assign ram_3_MPORT_33_addr = 6'h21;
  assign ram_3_MPORT_33_mask = 1'h1;
  assign ram_3_MPORT_33_en = reset;
  assign ram_3_MPORT_34_data = 1'h0;
  assign ram_3_MPORT_34_addr = 6'h22;
  assign ram_3_MPORT_34_mask = 1'h1;
  assign ram_3_MPORT_34_en = reset;
  assign ram_3_MPORT_35_data = 1'h0;
  assign ram_3_MPORT_35_addr = 6'h23;
  assign ram_3_MPORT_35_mask = 1'h1;
  assign ram_3_MPORT_35_en = reset;
  assign ram_3_MPORT_36_data = 1'h0;
  assign ram_3_MPORT_36_addr = 6'h24;
  assign ram_3_MPORT_36_mask = 1'h1;
  assign ram_3_MPORT_36_en = reset;
  assign ram_3_MPORT_37_data = 1'h0;
  assign ram_3_MPORT_37_addr = 6'h25;
  assign ram_3_MPORT_37_mask = 1'h1;
  assign ram_3_MPORT_37_en = reset;
  assign ram_3_MPORT_38_data = 1'h0;
  assign ram_3_MPORT_38_addr = 6'h26;
  assign ram_3_MPORT_38_mask = 1'h1;
  assign ram_3_MPORT_38_en = reset;
  assign ram_3_MPORT_39_data = 1'h0;
  assign ram_3_MPORT_39_addr = 6'h27;
  assign ram_3_MPORT_39_mask = 1'h1;
  assign ram_3_MPORT_39_en = reset;
  assign ram_3_MPORT_40_data = 1'h0;
  assign ram_3_MPORT_40_addr = 6'h28;
  assign ram_3_MPORT_40_mask = 1'h1;
  assign ram_3_MPORT_40_en = reset;
  assign ram_3_MPORT_41_data = 1'h0;
  assign ram_3_MPORT_41_addr = 6'h29;
  assign ram_3_MPORT_41_mask = 1'h1;
  assign ram_3_MPORT_41_en = reset;
  assign ram_3_MPORT_42_data = 1'h0;
  assign ram_3_MPORT_42_addr = 6'h2a;
  assign ram_3_MPORT_42_mask = 1'h1;
  assign ram_3_MPORT_42_en = reset;
  assign ram_3_MPORT_43_data = 1'h0;
  assign ram_3_MPORT_43_addr = 6'h2b;
  assign ram_3_MPORT_43_mask = 1'h1;
  assign ram_3_MPORT_43_en = reset;
  assign ram_3_MPORT_44_data = 1'h0;
  assign ram_3_MPORT_44_addr = 6'h2c;
  assign ram_3_MPORT_44_mask = 1'h1;
  assign ram_3_MPORT_44_en = reset;
  assign ram_3_MPORT_45_data = 1'h0;
  assign ram_3_MPORT_45_addr = 6'h2d;
  assign ram_3_MPORT_45_mask = 1'h1;
  assign ram_3_MPORT_45_en = reset;
  assign ram_3_MPORT_46_data = 1'h0;
  assign ram_3_MPORT_46_addr = 6'h2e;
  assign ram_3_MPORT_46_mask = 1'h1;
  assign ram_3_MPORT_46_en = reset;
  assign ram_3_MPORT_47_data = 1'h0;
  assign ram_3_MPORT_47_addr = 6'h2f;
  assign ram_3_MPORT_47_mask = 1'h1;
  assign ram_3_MPORT_47_en = reset;
  assign ram_3_MPORT_48_data = 1'h0;
  assign ram_3_MPORT_48_addr = 6'h30;
  assign ram_3_MPORT_48_mask = 1'h1;
  assign ram_3_MPORT_48_en = reset;
  assign ram_3_MPORT_49_data = 1'h0;
  assign ram_3_MPORT_49_addr = 6'h31;
  assign ram_3_MPORT_49_mask = 1'h1;
  assign ram_3_MPORT_49_en = reset;
  assign ram_3_MPORT_50_data = 1'h0;
  assign ram_3_MPORT_50_addr = 6'h32;
  assign ram_3_MPORT_50_mask = 1'h1;
  assign ram_3_MPORT_50_en = reset;
  assign ram_3_MPORT_51_data = 1'h0;
  assign ram_3_MPORT_51_addr = 6'h33;
  assign ram_3_MPORT_51_mask = 1'h1;
  assign ram_3_MPORT_51_en = reset;
  assign ram_3_MPORT_52_data = 1'h0;
  assign ram_3_MPORT_52_addr = 6'h34;
  assign ram_3_MPORT_52_mask = 1'h1;
  assign ram_3_MPORT_52_en = reset;
  assign ram_3_MPORT_53_data = 1'h0;
  assign ram_3_MPORT_53_addr = 6'h35;
  assign ram_3_MPORT_53_mask = 1'h1;
  assign ram_3_MPORT_53_en = reset;
  assign ram_3_MPORT_54_data = 1'h0;
  assign ram_3_MPORT_54_addr = 6'h36;
  assign ram_3_MPORT_54_mask = 1'h1;
  assign ram_3_MPORT_54_en = reset;
  assign ram_3_MPORT_55_data = 1'h0;
  assign ram_3_MPORT_55_addr = 6'h37;
  assign ram_3_MPORT_55_mask = 1'h1;
  assign ram_3_MPORT_55_en = reset;
  assign ram_3_MPORT_56_data = 1'h0;
  assign ram_3_MPORT_56_addr = 6'h38;
  assign ram_3_MPORT_56_mask = 1'h1;
  assign ram_3_MPORT_56_en = reset;
  assign ram_3_MPORT_57_data = 1'h0;
  assign ram_3_MPORT_57_addr = 6'h39;
  assign ram_3_MPORT_57_mask = 1'h1;
  assign ram_3_MPORT_57_en = reset;
  assign ram_3_MPORT_58_data = 1'h0;
  assign ram_3_MPORT_58_addr = 6'h3a;
  assign ram_3_MPORT_58_mask = 1'h1;
  assign ram_3_MPORT_58_en = reset;
  assign ram_3_MPORT_59_data = 1'h0;
  assign ram_3_MPORT_59_addr = 6'h3b;
  assign ram_3_MPORT_59_mask = 1'h1;
  assign ram_3_MPORT_59_en = reset;
  assign ram_3_MPORT_60_data = 1'h0;
  assign ram_3_MPORT_60_addr = 6'h3c;
  assign ram_3_MPORT_60_mask = 1'h1;
  assign ram_3_MPORT_60_en = reset;
  assign ram_3_MPORT_61_data = 1'h0;
  assign ram_3_MPORT_61_addr = 6'h3d;
  assign ram_3_MPORT_61_mask = 1'h1;
  assign ram_3_MPORT_61_en = reset;
  assign ram_3_MPORT_62_data = 1'h0;
  assign ram_3_MPORT_62_addr = 6'h3e;
  assign ram_3_MPORT_62_mask = 1'h1;
  assign ram_3_MPORT_62_en = reset;
  assign ram_3_MPORT_63_data = 1'h0;
  assign ram_3_MPORT_63_addr = 6'h3f;
  assign ram_3_MPORT_63_mask = 1'h1;
  assign ram_3_MPORT_63_en = reset;
  assign ram_3_MPORT_64_data = 1'h1;
  assign ram_3_MPORT_64_addr = io_addr;
  assign ram_3_MPORT_64_mask = io_wmask[3];
  assign ram_3_MPORT_64_en = io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 75:39]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_1_en & ram_0_MPORT_1_mask) begin
      ram_0[ram_0_MPORT_1_addr] <= ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_2_en & ram_0_MPORT_2_mask) begin
      ram_0[ram_0_MPORT_2_addr] <= ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_3_en & ram_0_MPORT_3_mask) begin
      ram_0[ram_0_MPORT_3_addr] <= ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_4_en & ram_0_MPORT_4_mask) begin
      ram_0[ram_0_MPORT_4_addr] <= ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_5_en & ram_0_MPORT_5_mask) begin
      ram_0[ram_0_MPORT_5_addr] <= ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_6_en & ram_0_MPORT_6_mask) begin
      ram_0[ram_0_MPORT_6_addr] <= ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_7_en & ram_0_MPORT_7_mask) begin
      ram_0[ram_0_MPORT_7_addr] <= ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_8_en & ram_0_MPORT_8_mask) begin
      ram_0[ram_0_MPORT_8_addr] <= ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_9_en & ram_0_MPORT_9_mask) begin
      ram_0[ram_0_MPORT_9_addr] <= ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_10_en & ram_0_MPORT_10_mask) begin
      ram_0[ram_0_MPORT_10_addr] <= ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_11_en & ram_0_MPORT_11_mask) begin
      ram_0[ram_0_MPORT_11_addr] <= ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_12_en & ram_0_MPORT_12_mask) begin
      ram_0[ram_0_MPORT_12_addr] <= ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_13_en & ram_0_MPORT_13_mask) begin
      ram_0[ram_0_MPORT_13_addr] <= ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_14_en & ram_0_MPORT_14_mask) begin
      ram_0[ram_0_MPORT_14_addr] <= ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_15_en & ram_0_MPORT_15_mask) begin
      ram_0[ram_0_MPORT_15_addr] <= ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_16_en & ram_0_MPORT_16_mask) begin
      ram_0[ram_0_MPORT_16_addr] <= ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_17_en & ram_0_MPORT_17_mask) begin
      ram_0[ram_0_MPORT_17_addr] <= ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_18_en & ram_0_MPORT_18_mask) begin
      ram_0[ram_0_MPORT_18_addr] <= ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_19_en & ram_0_MPORT_19_mask) begin
      ram_0[ram_0_MPORT_19_addr] <= ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_20_en & ram_0_MPORT_20_mask) begin
      ram_0[ram_0_MPORT_20_addr] <= ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_21_en & ram_0_MPORT_21_mask) begin
      ram_0[ram_0_MPORT_21_addr] <= ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_22_en & ram_0_MPORT_22_mask) begin
      ram_0[ram_0_MPORT_22_addr] <= ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_23_en & ram_0_MPORT_23_mask) begin
      ram_0[ram_0_MPORT_23_addr] <= ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_24_en & ram_0_MPORT_24_mask) begin
      ram_0[ram_0_MPORT_24_addr] <= ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_25_en & ram_0_MPORT_25_mask) begin
      ram_0[ram_0_MPORT_25_addr] <= ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_26_en & ram_0_MPORT_26_mask) begin
      ram_0[ram_0_MPORT_26_addr] <= ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_27_en & ram_0_MPORT_27_mask) begin
      ram_0[ram_0_MPORT_27_addr] <= ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_28_en & ram_0_MPORT_28_mask) begin
      ram_0[ram_0_MPORT_28_addr] <= ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_29_en & ram_0_MPORT_29_mask) begin
      ram_0[ram_0_MPORT_29_addr] <= ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_30_en & ram_0_MPORT_30_mask) begin
      ram_0[ram_0_MPORT_30_addr] <= ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_31_en & ram_0_MPORT_31_mask) begin
      ram_0[ram_0_MPORT_31_addr] <= ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_32_en & ram_0_MPORT_32_mask) begin
      ram_0[ram_0_MPORT_32_addr] <= ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_33_en & ram_0_MPORT_33_mask) begin
      ram_0[ram_0_MPORT_33_addr] <= ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_34_en & ram_0_MPORT_34_mask) begin
      ram_0[ram_0_MPORT_34_addr] <= ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_35_en & ram_0_MPORT_35_mask) begin
      ram_0[ram_0_MPORT_35_addr] <= ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_36_en & ram_0_MPORT_36_mask) begin
      ram_0[ram_0_MPORT_36_addr] <= ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_37_en & ram_0_MPORT_37_mask) begin
      ram_0[ram_0_MPORT_37_addr] <= ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_38_en & ram_0_MPORT_38_mask) begin
      ram_0[ram_0_MPORT_38_addr] <= ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_39_en & ram_0_MPORT_39_mask) begin
      ram_0[ram_0_MPORT_39_addr] <= ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_40_en & ram_0_MPORT_40_mask) begin
      ram_0[ram_0_MPORT_40_addr] <= ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_41_en & ram_0_MPORT_41_mask) begin
      ram_0[ram_0_MPORT_41_addr] <= ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_42_en & ram_0_MPORT_42_mask) begin
      ram_0[ram_0_MPORT_42_addr] <= ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_43_en & ram_0_MPORT_43_mask) begin
      ram_0[ram_0_MPORT_43_addr] <= ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_44_en & ram_0_MPORT_44_mask) begin
      ram_0[ram_0_MPORT_44_addr] <= ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_45_en & ram_0_MPORT_45_mask) begin
      ram_0[ram_0_MPORT_45_addr] <= ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_46_en & ram_0_MPORT_46_mask) begin
      ram_0[ram_0_MPORT_46_addr] <= ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_47_en & ram_0_MPORT_47_mask) begin
      ram_0[ram_0_MPORT_47_addr] <= ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_48_en & ram_0_MPORT_48_mask) begin
      ram_0[ram_0_MPORT_48_addr] <= ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_49_en & ram_0_MPORT_49_mask) begin
      ram_0[ram_0_MPORT_49_addr] <= ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_50_en & ram_0_MPORT_50_mask) begin
      ram_0[ram_0_MPORT_50_addr] <= ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_51_en & ram_0_MPORT_51_mask) begin
      ram_0[ram_0_MPORT_51_addr] <= ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_52_en & ram_0_MPORT_52_mask) begin
      ram_0[ram_0_MPORT_52_addr] <= ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_53_en & ram_0_MPORT_53_mask) begin
      ram_0[ram_0_MPORT_53_addr] <= ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_54_en & ram_0_MPORT_54_mask) begin
      ram_0[ram_0_MPORT_54_addr] <= ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_55_en & ram_0_MPORT_55_mask) begin
      ram_0[ram_0_MPORT_55_addr] <= ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_56_en & ram_0_MPORT_56_mask) begin
      ram_0[ram_0_MPORT_56_addr] <= ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_57_en & ram_0_MPORT_57_mask) begin
      ram_0[ram_0_MPORT_57_addr] <= ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_58_en & ram_0_MPORT_58_mask) begin
      ram_0[ram_0_MPORT_58_addr] <= ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_59_en & ram_0_MPORT_59_mask) begin
      ram_0[ram_0_MPORT_59_addr] <= ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_60_en & ram_0_MPORT_60_mask) begin
      ram_0[ram_0_MPORT_60_addr] <= ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_61_en & ram_0_MPORT_61_mask) begin
      ram_0[ram_0_MPORT_61_addr] <= ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_62_en & ram_0_MPORT_62_mask) begin
      ram_0[ram_0_MPORT_62_addr] <= ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_63_en & ram_0_MPORT_63_mask) begin
      ram_0[ram_0_MPORT_63_addr] <= ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_64_en & ram_0_MPORT_64_mask) begin
      ram_0[ram_0_MPORT_64_addr] <= ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_0_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_1_en & ram_1_MPORT_1_mask) begin
      ram_1[ram_1_MPORT_1_addr] <= ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_2_en & ram_1_MPORT_2_mask) begin
      ram_1[ram_1_MPORT_2_addr] <= ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_3_en & ram_1_MPORT_3_mask) begin
      ram_1[ram_1_MPORT_3_addr] <= ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_4_en & ram_1_MPORT_4_mask) begin
      ram_1[ram_1_MPORT_4_addr] <= ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_5_en & ram_1_MPORT_5_mask) begin
      ram_1[ram_1_MPORT_5_addr] <= ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_6_en & ram_1_MPORT_6_mask) begin
      ram_1[ram_1_MPORT_6_addr] <= ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_7_en & ram_1_MPORT_7_mask) begin
      ram_1[ram_1_MPORT_7_addr] <= ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_8_en & ram_1_MPORT_8_mask) begin
      ram_1[ram_1_MPORT_8_addr] <= ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_9_en & ram_1_MPORT_9_mask) begin
      ram_1[ram_1_MPORT_9_addr] <= ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_10_en & ram_1_MPORT_10_mask) begin
      ram_1[ram_1_MPORT_10_addr] <= ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_11_en & ram_1_MPORT_11_mask) begin
      ram_1[ram_1_MPORT_11_addr] <= ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_12_en & ram_1_MPORT_12_mask) begin
      ram_1[ram_1_MPORT_12_addr] <= ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_13_en & ram_1_MPORT_13_mask) begin
      ram_1[ram_1_MPORT_13_addr] <= ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_14_en & ram_1_MPORT_14_mask) begin
      ram_1[ram_1_MPORT_14_addr] <= ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_15_en & ram_1_MPORT_15_mask) begin
      ram_1[ram_1_MPORT_15_addr] <= ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_16_en & ram_1_MPORT_16_mask) begin
      ram_1[ram_1_MPORT_16_addr] <= ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_17_en & ram_1_MPORT_17_mask) begin
      ram_1[ram_1_MPORT_17_addr] <= ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_18_en & ram_1_MPORT_18_mask) begin
      ram_1[ram_1_MPORT_18_addr] <= ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_19_en & ram_1_MPORT_19_mask) begin
      ram_1[ram_1_MPORT_19_addr] <= ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_20_en & ram_1_MPORT_20_mask) begin
      ram_1[ram_1_MPORT_20_addr] <= ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_21_en & ram_1_MPORT_21_mask) begin
      ram_1[ram_1_MPORT_21_addr] <= ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_22_en & ram_1_MPORT_22_mask) begin
      ram_1[ram_1_MPORT_22_addr] <= ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_23_en & ram_1_MPORT_23_mask) begin
      ram_1[ram_1_MPORT_23_addr] <= ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_24_en & ram_1_MPORT_24_mask) begin
      ram_1[ram_1_MPORT_24_addr] <= ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_25_en & ram_1_MPORT_25_mask) begin
      ram_1[ram_1_MPORT_25_addr] <= ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_26_en & ram_1_MPORT_26_mask) begin
      ram_1[ram_1_MPORT_26_addr] <= ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_27_en & ram_1_MPORT_27_mask) begin
      ram_1[ram_1_MPORT_27_addr] <= ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_28_en & ram_1_MPORT_28_mask) begin
      ram_1[ram_1_MPORT_28_addr] <= ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_29_en & ram_1_MPORT_29_mask) begin
      ram_1[ram_1_MPORT_29_addr] <= ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_30_en & ram_1_MPORT_30_mask) begin
      ram_1[ram_1_MPORT_30_addr] <= ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_31_en & ram_1_MPORT_31_mask) begin
      ram_1[ram_1_MPORT_31_addr] <= ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_32_en & ram_1_MPORT_32_mask) begin
      ram_1[ram_1_MPORT_32_addr] <= ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_33_en & ram_1_MPORT_33_mask) begin
      ram_1[ram_1_MPORT_33_addr] <= ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_34_en & ram_1_MPORT_34_mask) begin
      ram_1[ram_1_MPORT_34_addr] <= ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_35_en & ram_1_MPORT_35_mask) begin
      ram_1[ram_1_MPORT_35_addr] <= ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_36_en & ram_1_MPORT_36_mask) begin
      ram_1[ram_1_MPORT_36_addr] <= ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_37_en & ram_1_MPORT_37_mask) begin
      ram_1[ram_1_MPORT_37_addr] <= ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_38_en & ram_1_MPORT_38_mask) begin
      ram_1[ram_1_MPORT_38_addr] <= ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_39_en & ram_1_MPORT_39_mask) begin
      ram_1[ram_1_MPORT_39_addr] <= ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_40_en & ram_1_MPORT_40_mask) begin
      ram_1[ram_1_MPORT_40_addr] <= ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_41_en & ram_1_MPORT_41_mask) begin
      ram_1[ram_1_MPORT_41_addr] <= ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_42_en & ram_1_MPORT_42_mask) begin
      ram_1[ram_1_MPORT_42_addr] <= ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_43_en & ram_1_MPORT_43_mask) begin
      ram_1[ram_1_MPORT_43_addr] <= ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_44_en & ram_1_MPORT_44_mask) begin
      ram_1[ram_1_MPORT_44_addr] <= ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_45_en & ram_1_MPORT_45_mask) begin
      ram_1[ram_1_MPORT_45_addr] <= ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_46_en & ram_1_MPORT_46_mask) begin
      ram_1[ram_1_MPORT_46_addr] <= ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_47_en & ram_1_MPORT_47_mask) begin
      ram_1[ram_1_MPORT_47_addr] <= ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_48_en & ram_1_MPORT_48_mask) begin
      ram_1[ram_1_MPORT_48_addr] <= ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_49_en & ram_1_MPORT_49_mask) begin
      ram_1[ram_1_MPORT_49_addr] <= ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_50_en & ram_1_MPORT_50_mask) begin
      ram_1[ram_1_MPORT_50_addr] <= ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_51_en & ram_1_MPORT_51_mask) begin
      ram_1[ram_1_MPORT_51_addr] <= ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_52_en & ram_1_MPORT_52_mask) begin
      ram_1[ram_1_MPORT_52_addr] <= ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_53_en & ram_1_MPORT_53_mask) begin
      ram_1[ram_1_MPORT_53_addr] <= ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_54_en & ram_1_MPORT_54_mask) begin
      ram_1[ram_1_MPORT_54_addr] <= ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_55_en & ram_1_MPORT_55_mask) begin
      ram_1[ram_1_MPORT_55_addr] <= ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_56_en & ram_1_MPORT_56_mask) begin
      ram_1[ram_1_MPORT_56_addr] <= ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_57_en & ram_1_MPORT_57_mask) begin
      ram_1[ram_1_MPORT_57_addr] <= ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_58_en & ram_1_MPORT_58_mask) begin
      ram_1[ram_1_MPORT_58_addr] <= ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_59_en & ram_1_MPORT_59_mask) begin
      ram_1[ram_1_MPORT_59_addr] <= ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_60_en & ram_1_MPORT_60_mask) begin
      ram_1[ram_1_MPORT_60_addr] <= ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_61_en & ram_1_MPORT_61_mask) begin
      ram_1[ram_1_MPORT_61_addr] <= ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_62_en & ram_1_MPORT_62_mask) begin
      ram_1[ram_1_MPORT_62_addr] <= ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_63_en & ram_1_MPORT_63_mask) begin
      ram_1[ram_1_MPORT_63_addr] <= ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_64_en & ram_1_MPORT_64_mask) begin
      ram_1[ram_1_MPORT_64_addr] <= ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_1_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_1_en & ram_2_MPORT_1_mask) begin
      ram_2[ram_2_MPORT_1_addr] <= ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_2_en & ram_2_MPORT_2_mask) begin
      ram_2[ram_2_MPORT_2_addr] <= ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_3_en & ram_2_MPORT_3_mask) begin
      ram_2[ram_2_MPORT_3_addr] <= ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_4_en & ram_2_MPORT_4_mask) begin
      ram_2[ram_2_MPORT_4_addr] <= ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_5_en & ram_2_MPORT_5_mask) begin
      ram_2[ram_2_MPORT_5_addr] <= ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_6_en & ram_2_MPORT_6_mask) begin
      ram_2[ram_2_MPORT_6_addr] <= ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_7_en & ram_2_MPORT_7_mask) begin
      ram_2[ram_2_MPORT_7_addr] <= ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_8_en & ram_2_MPORT_8_mask) begin
      ram_2[ram_2_MPORT_8_addr] <= ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_9_en & ram_2_MPORT_9_mask) begin
      ram_2[ram_2_MPORT_9_addr] <= ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_10_en & ram_2_MPORT_10_mask) begin
      ram_2[ram_2_MPORT_10_addr] <= ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_11_en & ram_2_MPORT_11_mask) begin
      ram_2[ram_2_MPORT_11_addr] <= ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_12_en & ram_2_MPORT_12_mask) begin
      ram_2[ram_2_MPORT_12_addr] <= ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_13_en & ram_2_MPORT_13_mask) begin
      ram_2[ram_2_MPORT_13_addr] <= ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_14_en & ram_2_MPORT_14_mask) begin
      ram_2[ram_2_MPORT_14_addr] <= ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_15_en & ram_2_MPORT_15_mask) begin
      ram_2[ram_2_MPORT_15_addr] <= ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_16_en & ram_2_MPORT_16_mask) begin
      ram_2[ram_2_MPORT_16_addr] <= ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_17_en & ram_2_MPORT_17_mask) begin
      ram_2[ram_2_MPORT_17_addr] <= ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_18_en & ram_2_MPORT_18_mask) begin
      ram_2[ram_2_MPORT_18_addr] <= ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_19_en & ram_2_MPORT_19_mask) begin
      ram_2[ram_2_MPORT_19_addr] <= ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_20_en & ram_2_MPORT_20_mask) begin
      ram_2[ram_2_MPORT_20_addr] <= ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_21_en & ram_2_MPORT_21_mask) begin
      ram_2[ram_2_MPORT_21_addr] <= ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_22_en & ram_2_MPORT_22_mask) begin
      ram_2[ram_2_MPORT_22_addr] <= ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_23_en & ram_2_MPORT_23_mask) begin
      ram_2[ram_2_MPORT_23_addr] <= ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_24_en & ram_2_MPORT_24_mask) begin
      ram_2[ram_2_MPORT_24_addr] <= ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_25_en & ram_2_MPORT_25_mask) begin
      ram_2[ram_2_MPORT_25_addr] <= ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_26_en & ram_2_MPORT_26_mask) begin
      ram_2[ram_2_MPORT_26_addr] <= ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_27_en & ram_2_MPORT_27_mask) begin
      ram_2[ram_2_MPORT_27_addr] <= ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_28_en & ram_2_MPORT_28_mask) begin
      ram_2[ram_2_MPORT_28_addr] <= ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_29_en & ram_2_MPORT_29_mask) begin
      ram_2[ram_2_MPORT_29_addr] <= ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_30_en & ram_2_MPORT_30_mask) begin
      ram_2[ram_2_MPORT_30_addr] <= ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_31_en & ram_2_MPORT_31_mask) begin
      ram_2[ram_2_MPORT_31_addr] <= ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_32_en & ram_2_MPORT_32_mask) begin
      ram_2[ram_2_MPORT_32_addr] <= ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_33_en & ram_2_MPORT_33_mask) begin
      ram_2[ram_2_MPORT_33_addr] <= ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_34_en & ram_2_MPORT_34_mask) begin
      ram_2[ram_2_MPORT_34_addr] <= ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_35_en & ram_2_MPORT_35_mask) begin
      ram_2[ram_2_MPORT_35_addr] <= ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_36_en & ram_2_MPORT_36_mask) begin
      ram_2[ram_2_MPORT_36_addr] <= ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_37_en & ram_2_MPORT_37_mask) begin
      ram_2[ram_2_MPORT_37_addr] <= ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_38_en & ram_2_MPORT_38_mask) begin
      ram_2[ram_2_MPORT_38_addr] <= ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_39_en & ram_2_MPORT_39_mask) begin
      ram_2[ram_2_MPORT_39_addr] <= ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_40_en & ram_2_MPORT_40_mask) begin
      ram_2[ram_2_MPORT_40_addr] <= ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_41_en & ram_2_MPORT_41_mask) begin
      ram_2[ram_2_MPORT_41_addr] <= ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_42_en & ram_2_MPORT_42_mask) begin
      ram_2[ram_2_MPORT_42_addr] <= ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_43_en & ram_2_MPORT_43_mask) begin
      ram_2[ram_2_MPORT_43_addr] <= ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_44_en & ram_2_MPORT_44_mask) begin
      ram_2[ram_2_MPORT_44_addr] <= ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_45_en & ram_2_MPORT_45_mask) begin
      ram_2[ram_2_MPORT_45_addr] <= ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_46_en & ram_2_MPORT_46_mask) begin
      ram_2[ram_2_MPORT_46_addr] <= ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_47_en & ram_2_MPORT_47_mask) begin
      ram_2[ram_2_MPORT_47_addr] <= ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_48_en & ram_2_MPORT_48_mask) begin
      ram_2[ram_2_MPORT_48_addr] <= ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_49_en & ram_2_MPORT_49_mask) begin
      ram_2[ram_2_MPORT_49_addr] <= ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_50_en & ram_2_MPORT_50_mask) begin
      ram_2[ram_2_MPORT_50_addr] <= ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_51_en & ram_2_MPORT_51_mask) begin
      ram_2[ram_2_MPORT_51_addr] <= ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_52_en & ram_2_MPORT_52_mask) begin
      ram_2[ram_2_MPORT_52_addr] <= ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_53_en & ram_2_MPORT_53_mask) begin
      ram_2[ram_2_MPORT_53_addr] <= ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_54_en & ram_2_MPORT_54_mask) begin
      ram_2[ram_2_MPORT_54_addr] <= ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_55_en & ram_2_MPORT_55_mask) begin
      ram_2[ram_2_MPORT_55_addr] <= ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_56_en & ram_2_MPORT_56_mask) begin
      ram_2[ram_2_MPORT_56_addr] <= ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_57_en & ram_2_MPORT_57_mask) begin
      ram_2[ram_2_MPORT_57_addr] <= ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_58_en & ram_2_MPORT_58_mask) begin
      ram_2[ram_2_MPORT_58_addr] <= ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_59_en & ram_2_MPORT_59_mask) begin
      ram_2[ram_2_MPORT_59_addr] <= ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_60_en & ram_2_MPORT_60_mask) begin
      ram_2[ram_2_MPORT_60_addr] <= ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_61_en & ram_2_MPORT_61_mask) begin
      ram_2[ram_2_MPORT_61_addr] <= ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_62_en & ram_2_MPORT_62_mask) begin
      ram_2[ram_2_MPORT_62_addr] <= ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_63_en & ram_2_MPORT_63_mask) begin
      ram_2[ram_2_MPORT_63_addr] <= ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_64_en & ram_2_MPORT_64_mask) begin
      ram_2[ram_2_MPORT_64_addr] <= ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_2_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_1_en & ram_3_MPORT_1_mask) begin
      ram_3[ram_3_MPORT_1_addr] <= ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_2_en & ram_3_MPORT_2_mask) begin
      ram_3[ram_3_MPORT_2_addr] <= ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_3_en & ram_3_MPORT_3_mask) begin
      ram_3[ram_3_MPORT_3_addr] <= ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_4_en & ram_3_MPORT_4_mask) begin
      ram_3[ram_3_MPORT_4_addr] <= ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_5_en & ram_3_MPORT_5_mask) begin
      ram_3[ram_3_MPORT_5_addr] <= ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_6_en & ram_3_MPORT_6_mask) begin
      ram_3[ram_3_MPORT_6_addr] <= ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_7_en & ram_3_MPORT_7_mask) begin
      ram_3[ram_3_MPORT_7_addr] <= ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_8_en & ram_3_MPORT_8_mask) begin
      ram_3[ram_3_MPORT_8_addr] <= ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_9_en & ram_3_MPORT_9_mask) begin
      ram_3[ram_3_MPORT_9_addr] <= ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_10_en & ram_3_MPORT_10_mask) begin
      ram_3[ram_3_MPORT_10_addr] <= ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_11_en & ram_3_MPORT_11_mask) begin
      ram_3[ram_3_MPORT_11_addr] <= ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_12_en & ram_3_MPORT_12_mask) begin
      ram_3[ram_3_MPORT_12_addr] <= ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_13_en & ram_3_MPORT_13_mask) begin
      ram_3[ram_3_MPORT_13_addr] <= ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_14_en & ram_3_MPORT_14_mask) begin
      ram_3[ram_3_MPORT_14_addr] <= ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_15_en & ram_3_MPORT_15_mask) begin
      ram_3[ram_3_MPORT_15_addr] <= ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_16_en & ram_3_MPORT_16_mask) begin
      ram_3[ram_3_MPORT_16_addr] <= ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_17_en & ram_3_MPORT_17_mask) begin
      ram_3[ram_3_MPORT_17_addr] <= ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_18_en & ram_3_MPORT_18_mask) begin
      ram_3[ram_3_MPORT_18_addr] <= ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_19_en & ram_3_MPORT_19_mask) begin
      ram_3[ram_3_MPORT_19_addr] <= ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_20_en & ram_3_MPORT_20_mask) begin
      ram_3[ram_3_MPORT_20_addr] <= ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_21_en & ram_3_MPORT_21_mask) begin
      ram_3[ram_3_MPORT_21_addr] <= ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_22_en & ram_3_MPORT_22_mask) begin
      ram_3[ram_3_MPORT_22_addr] <= ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_23_en & ram_3_MPORT_23_mask) begin
      ram_3[ram_3_MPORT_23_addr] <= ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_24_en & ram_3_MPORT_24_mask) begin
      ram_3[ram_3_MPORT_24_addr] <= ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_25_en & ram_3_MPORT_25_mask) begin
      ram_3[ram_3_MPORT_25_addr] <= ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_26_en & ram_3_MPORT_26_mask) begin
      ram_3[ram_3_MPORT_26_addr] <= ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_27_en & ram_3_MPORT_27_mask) begin
      ram_3[ram_3_MPORT_27_addr] <= ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_28_en & ram_3_MPORT_28_mask) begin
      ram_3[ram_3_MPORT_28_addr] <= ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_29_en & ram_3_MPORT_29_mask) begin
      ram_3[ram_3_MPORT_29_addr] <= ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_30_en & ram_3_MPORT_30_mask) begin
      ram_3[ram_3_MPORT_30_addr] <= ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_31_en & ram_3_MPORT_31_mask) begin
      ram_3[ram_3_MPORT_31_addr] <= ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_32_en & ram_3_MPORT_32_mask) begin
      ram_3[ram_3_MPORT_32_addr] <= ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_33_en & ram_3_MPORT_33_mask) begin
      ram_3[ram_3_MPORT_33_addr] <= ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_34_en & ram_3_MPORT_34_mask) begin
      ram_3[ram_3_MPORT_34_addr] <= ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_35_en & ram_3_MPORT_35_mask) begin
      ram_3[ram_3_MPORT_35_addr] <= ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_36_en & ram_3_MPORT_36_mask) begin
      ram_3[ram_3_MPORT_36_addr] <= ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_37_en & ram_3_MPORT_37_mask) begin
      ram_3[ram_3_MPORT_37_addr] <= ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_38_en & ram_3_MPORT_38_mask) begin
      ram_3[ram_3_MPORT_38_addr] <= ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_39_en & ram_3_MPORT_39_mask) begin
      ram_3[ram_3_MPORT_39_addr] <= ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_40_en & ram_3_MPORT_40_mask) begin
      ram_3[ram_3_MPORT_40_addr] <= ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_41_en & ram_3_MPORT_41_mask) begin
      ram_3[ram_3_MPORT_41_addr] <= ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_42_en & ram_3_MPORT_42_mask) begin
      ram_3[ram_3_MPORT_42_addr] <= ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_43_en & ram_3_MPORT_43_mask) begin
      ram_3[ram_3_MPORT_43_addr] <= ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_44_en & ram_3_MPORT_44_mask) begin
      ram_3[ram_3_MPORT_44_addr] <= ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_45_en & ram_3_MPORT_45_mask) begin
      ram_3[ram_3_MPORT_45_addr] <= ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_46_en & ram_3_MPORT_46_mask) begin
      ram_3[ram_3_MPORT_46_addr] <= ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_47_en & ram_3_MPORT_47_mask) begin
      ram_3[ram_3_MPORT_47_addr] <= ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_48_en & ram_3_MPORT_48_mask) begin
      ram_3[ram_3_MPORT_48_addr] <= ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_49_en & ram_3_MPORT_49_mask) begin
      ram_3[ram_3_MPORT_49_addr] <= ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_50_en & ram_3_MPORT_50_mask) begin
      ram_3[ram_3_MPORT_50_addr] <= ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_51_en & ram_3_MPORT_51_mask) begin
      ram_3[ram_3_MPORT_51_addr] <= ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_52_en & ram_3_MPORT_52_mask) begin
      ram_3[ram_3_MPORT_52_addr] <= ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_53_en & ram_3_MPORT_53_mask) begin
      ram_3[ram_3_MPORT_53_addr] <= ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_54_en & ram_3_MPORT_54_mask) begin
      ram_3[ram_3_MPORT_54_addr] <= ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_55_en & ram_3_MPORT_55_mask) begin
      ram_3[ram_3_MPORT_55_addr] <= ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_56_en & ram_3_MPORT_56_mask) begin
      ram_3[ram_3_MPORT_56_addr] <= ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_57_en & ram_3_MPORT_57_mask) begin
      ram_3[ram_3_MPORT_57_addr] <= ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_58_en & ram_3_MPORT_58_mask) begin
      ram_3[ram_3_MPORT_58_addr] <= ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_59_en & ram_3_MPORT_59_mask) begin
      ram_3[ram_3_MPORT_59_addr] <= ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_60_en & ram_3_MPORT_60_mask) begin
      ram_3[ram_3_MPORT_60_addr] <= ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_61_en & ram_3_MPORT_61_mask) begin
      ram_3[ram_3_MPORT_61_addr] <= ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_62_en & ram_3_MPORT_62_mask) begin
      ram_3[ram_3_MPORT_62_addr] <= ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_63_en & ram_3_MPORT_63_mask) begin
      ram_3[ram_3_MPORT_63_addr] <= ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_64_en & ram_3_MPORT_64_mask) begin
      ram_3[ram_3_MPORT_64_addr] <= ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_3_io_rdata_MPORT_addr_pipe_0 <= io_addr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SRAMTemplate_9(
  input        clock,
  input        reset,
  input  [5:0] io_r_addr,
  output [3:0] io_r_data,
  input        io_w_en,
  input  [5:0] io_w_addr,
  input  [3:0] io_w_mask
);
  wire  sram_clock; // @[SRAM.scala 188:31]
  wire  sram_reset; // @[SRAM.scala 188:31]
  wire [5:0] sram_io_addr; // @[SRAM.scala 188:31]
  wire  sram_io_rw; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_wmask; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_rdata; // @[SRAM.scala 188:31]
  BankRam1P_1_9 sram ( // @[SRAM.scala 188:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_addr(sram_io_addr),
    .io_rw(sram_io_rw),
    .io_wmask(sram_io_wmask),
    .io_rdata(sram_io_rdata)
  );
  assign io_r_data = sram_io_rdata; // @[SRAM.scala 214:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_addr = io_w_en ? io_w_addr : io_r_addr; // @[SRAM.scala 102:17 219:19 90:17]
  assign sram_io_rw = io_w_en; // @[SRAM.scala 101:15 219:19 88:15]
  assign sram_io_wmask = io_w_mask; // @[SRAM.scala 219:19 91:45]
endmodule
module BankRam1P_1_10(
  input        clock,
  input        reset,
  input  [5:0] io_addr,
  input        io_rw,
  input  [7:0] io_wdata,
  input  [3:0] io_wmask,
  output [7:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] ram_0 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_0_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_0_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_1 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_1_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_1_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_2 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_2_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_2_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_3 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_3_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_3_io_rdata_MPORT_addr_pipe_0;
  wire [3:0] io_rdata_lo = {ram_1_io_rdata_MPORT_data,ram_0_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  wire [3:0] io_rdata_hi = {ram_3_io_rdata_MPORT_data,ram_2_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  assign ram_0_io_rdata_MPORT_en = ram_0_io_rdata_MPORT_en_pipe_0;
  assign ram_0_io_rdata_MPORT_addr = ram_0_io_rdata_MPORT_addr_pipe_0;
  assign ram_0_io_rdata_MPORT_data = ram_0[ram_0_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_0_MPORT_data = 2'h0;
  assign ram_0_MPORT_addr = 6'h0;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = reset;
  assign ram_0_MPORT_1_data = 2'h0;
  assign ram_0_MPORT_1_addr = 6'h1;
  assign ram_0_MPORT_1_mask = 1'h1;
  assign ram_0_MPORT_1_en = reset;
  assign ram_0_MPORT_2_data = 2'h0;
  assign ram_0_MPORT_2_addr = 6'h2;
  assign ram_0_MPORT_2_mask = 1'h1;
  assign ram_0_MPORT_2_en = reset;
  assign ram_0_MPORT_3_data = 2'h0;
  assign ram_0_MPORT_3_addr = 6'h3;
  assign ram_0_MPORT_3_mask = 1'h1;
  assign ram_0_MPORT_3_en = reset;
  assign ram_0_MPORT_4_data = 2'h0;
  assign ram_0_MPORT_4_addr = 6'h4;
  assign ram_0_MPORT_4_mask = 1'h1;
  assign ram_0_MPORT_4_en = reset;
  assign ram_0_MPORT_5_data = 2'h0;
  assign ram_0_MPORT_5_addr = 6'h5;
  assign ram_0_MPORT_5_mask = 1'h1;
  assign ram_0_MPORT_5_en = reset;
  assign ram_0_MPORT_6_data = 2'h0;
  assign ram_0_MPORT_6_addr = 6'h6;
  assign ram_0_MPORT_6_mask = 1'h1;
  assign ram_0_MPORT_6_en = reset;
  assign ram_0_MPORT_7_data = 2'h0;
  assign ram_0_MPORT_7_addr = 6'h7;
  assign ram_0_MPORT_7_mask = 1'h1;
  assign ram_0_MPORT_7_en = reset;
  assign ram_0_MPORT_8_data = 2'h0;
  assign ram_0_MPORT_8_addr = 6'h8;
  assign ram_0_MPORT_8_mask = 1'h1;
  assign ram_0_MPORT_8_en = reset;
  assign ram_0_MPORT_9_data = 2'h0;
  assign ram_0_MPORT_9_addr = 6'h9;
  assign ram_0_MPORT_9_mask = 1'h1;
  assign ram_0_MPORT_9_en = reset;
  assign ram_0_MPORT_10_data = 2'h0;
  assign ram_0_MPORT_10_addr = 6'ha;
  assign ram_0_MPORT_10_mask = 1'h1;
  assign ram_0_MPORT_10_en = reset;
  assign ram_0_MPORT_11_data = 2'h0;
  assign ram_0_MPORT_11_addr = 6'hb;
  assign ram_0_MPORT_11_mask = 1'h1;
  assign ram_0_MPORT_11_en = reset;
  assign ram_0_MPORT_12_data = 2'h0;
  assign ram_0_MPORT_12_addr = 6'hc;
  assign ram_0_MPORT_12_mask = 1'h1;
  assign ram_0_MPORT_12_en = reset;
  assign ram_0_MPORT_13_data = 2'h0;
  assign ram_0_MPORT_13_addr = 6'hd;
  assign ram_0_MPORT_13_mask = 1'h1;
  assign ram_0_MPORT_13_en = reset;
  assign ram_0_MPORT_14_data = 2'h0;
  assign ram_0_MPORT_14_addr = 6'he;
  assign ram_0_MPORT_14_mask = 1'h1;
  assign ram_0_MPORT_14_en = reset;
  assign ram_0_MPORT_15_data = 2'h0;
  assign ram_0_MPORT_15_addr = 6'hf;
  assign ram_0_MPORT_15_mask = 1'h1;
  assign ram_0_MPORT_15_en = reset;
  assign ram_0_MPORT_16_data = 2'h0;
  assign ram_0_MPORT_16_addr = 6'h10;
  assign ram_0_MPORT_16_mask = 1'h1;
  assign ram_0_MPORT_16_en = reset;
  assign ram_0_MPORT_17_data = 2'h0;
  assign ram_0_MPORT_17_addr = 6'h11;
  assign ram_0_MPORT_17_mask = 1'h1;
  assign ram_0_MPORT_17_en = reset;
  assign ram_0_MPORT_18_data = 2'h0;
  assign ram_0_MPORT_18_addr = 6'h12;
  assign ram_0_MPORT_18_mask = 1'h1;
  assign ram_0_MPORT_18_en = reset;
  assign ram_0_MPORT_19_data = 2'h0;
  assign ram_0_MPORT_19_addr = 6'h13;
  assign ram_0_MPORT_19_mask = 1'h1;
  assign ram_0_MPORT_19_en = reset;
  assign ram_0_MPORT_20_data = 2'h0;
  assign ram_0_MPORT_20_addr = 6'h14;
  assign ram_0_MPORT_20_mask = 1'h1;
  assign ram_0_MPORT_20_en = reset;
  assign ram_0_MPORT_21_data = 2'h0;
  assign ram_0_MPORT_21_addr = 6'h15;
  assign ram_0_MPORT_21_mask = 1'h1;
  assign ram_0_MPORT_21_en = reset;
  assign ram_0_MPORT_22_data = 2'h0;
  assign ram_0_MPORT_22_addr = 6'h16;
  assign ram_0_MPORT_22_mask = 1'h1;
  assign ram_0_MPORT_22_en = reset;
  assign ram_0_MPORT_23_data = 2'h0;
  assign ram_0_MPORT_23_addr = 6'h17;
  assign ram_0_MPORT_23_mask = 1'h1;
  assign ram_0_MPORT_23_en = reset;
  assign ram_0_MPORT_24_data = 2'h0;
  assign ram_0_MPORT_24_addr = 6'h18;
  assign ram_0_MPORT_24_mask = 1'h1;
  assign ram_0_MPORT_24_en = reset;
  assign ram_0_MPORT_25_data = 2'h0;
  assign ram_0_MPORT_25_addr = 6'h19;
  assign ram_0_MPORT_25_mask = 1'h1;
  assign ram_0_MPORT_25_en = reset;
  assign ram_0_MPORT_26_data = 2'h0;
  assign ram_0_MPORT_26_addr = 6'h1a;
  assign ram_0_MPORT_26_mask = 1'h1;
  assign ram_0_MPORT_26_en = reset;
  assign ram_0_MPORT_27_data = 2'h0;
  assign ram_0_MPORT_27_addr = 6'h1b;
  assign ram_0_MPORT_27_mask = 1'h1;
  assign ram_0_MPORT_27_en = reset;
  assign ram_0_MPORT_28_data = 2'h0;
  assign ram_0_MPORT_28_addr = 6'h1c;
  assign ram_0_MPORT_28_mask = 1'h1;
  assign ram_0_MPORT_28_en = reset;
  assign ram_0_MPORT_29_data = 2'h0;
  assign ram_0_MPORT_29_addr = 6'h1d;
  assign ram_0_MPORT_29_mask = 1'h1;
  assign ram_0_MPORT_29_en = reset;
  assign ram_0_MPORT_30_data = 2'h0;
  assign ram_0_MPORT_30_addr = 6'h1e;
  assign ram_0_MPORT_30_mask = 1'h1;
  assign ram_0_MPORT_30_en = reset;
  assign ram_0_MPORT_31_data = 2'h0;
  assign ram_0_MPORT_31_addr = 6'h1f;
  assign ram_0_MPORT_31_mask = 1'h1;
  assign ram_0_MPORT_31_en = reset;
  assign ram_0_MPORT_32_data = 2'h0;
  assign ram_0_MPORT_32_addr = 6'h20;
  assign ram_0_MPORT_32_mask = 1'h1;
  assign ram_0_MPORT_32_en = reset;
  assign ram_0_MPORT_33_data = 2'h0;
  assign ram_0_MPORT_33_addr = 6'h21;
  assign ram_0_MPORT_33_mask = 1'h1;
  assign ram_0_MPORT_33_en = reset;
  assign ram_0_MPORT_34_data = 2'h0;
  assign ram_0_MPORT_34_addr = 6'h22;
  assign ram_0_MPORT_34_mask = 1'h1;
  assign ram_0_MPORT_34_en = reset;
  assign ram_0_MPORT_35_data = 2'h0;
  assign ram_0_MPORT_35_addr = 6'h23;
  assign ram_0_MPORT_35_mask = 1'h1;
  assign ram_0_MPORT_35_en = reset;
  assign ram_0_MPORT_36_data = 2'h0;
  assign ram_0_MPORT_36_addr = 6'h24;
  assign ram_0_MPORT_36_mask = 1'h1;
  assign ram_0_MPORT_36_en = reset;
  assign ram_0_MPORT_37_data = 2'h0;
  assign ram_0_MPORT_37_addr = 6'h25;
  assign ram_0_MPORT_37_mask = 1'h1;
  assign ram_0_MPORT_37_en = reset;
  assign ram_0_MPORT_38_data = 2'h0;
  assign ram_0_MPORT_38_addr = 6'h26;
  assign ram_0_MPORT_38_mask = 1'h1;
  assign ram_0_MPORT_38_en = reset;
  assign ram_0_MPORT_39_data = 2'h0;
  assign ram_0_MPORT_39_addr = 6'h27;
  assign ram_0_MPORT_39_mask = 1'h1;
  assign ram_0_MPORT_39_en = reset;
  assign ram_0_MPORT_40_data = 2'h0;
  assign ram_0_MPORT_40_addr = 6'h28;
  assign ram_0_MPORT_40_mask = 1'h1;
  assign ram_0_MPORT_40_en = reset;
  assign ram_0_MPORT_41_data = 2'h0;
  assign ram_0_MPORT_41_addr = 6'h29;
  assign ram_0_MPORT_41_mask = 1'h1;
  assign ram_0_MPORT_41_en = reset;
  assign ram_0_MPORT_42_data = 2'h0;
  assign ram_0_MPORT_42_addr = 6'h2a;
  assign ram_0_MPORT_42_mask = 1'h1;
  assign ram_0_MPORT_42_en = reset;
  assign ram_0_MPORT_43_data = 2'h0;
  assign ram_0_MPORT_43_addr = 6'h2b;
  assign ram_0_MPORT_43_mask = 1'h1;
  assign ram_0_MPORT_43_en = reset;
  assign ram_0_MPORT_44_data = 2'h0;
  assign ram_0_MPORT_44_addr = 6'h2c;
  assign ram_0_MPORT_44_mask = 1'h1;
  assign ram_0_MPORT_44_en = reset;
  assign ram_0_MPORT_45_data = 2'h0;
  assign ram_0_MPORT_45_addr = 6'h2d;
  assign ram_0_MPORT_45_mask = 1'h1;
  assign ram_0_MPORT_45_en = reset;
  assign ram_0_MPORT_46_data = 2'h0;
  assign ram_0_MPORT_46_addr = 6'h2e;
  assign ram_0_MPORT_46_mask = 1'h1;
  assign ram_0_MPORT_46_en = reset;
  assign ram_0_MPORT_47_data = 2'h0;
  assign ram_0_MPORT_47_addr = 6'h2f;
  assign ram_0_MPORT_47_mask = 1'h1;
  assign ram_0_MPORT_47_en = reset;
  assign ram_0_MPORT_48_data = 2'h0;
  assign ram_0_MPORT_48_addr = 6'h30;
  assign ram_0_MPORT_48_mask = 1'h1;
  assign ram_0_MPORT_48_en = reset;
  assign ram_0_MPORT_49_data = 2'h0;
  assign ram_0_MPORT_49_addr = 6'h31;
  assign ram_0_MPORT_49_mask = 1'h1;
  assign ram_0_MPORT_49_en = reset;
  assign ram_0_MPORT_50_data = 2'h0;
  assign ram_0_MPORT_50_addr = 6'h32;
  assign ram_0_MPORT_50_mask = 1'h1;
  assign ram_0_MPORT_50_en = reset;
  assign ram_0_MPORT_51_data = 2'h0;
  assign ram_0_MPORT_51_addr = 6'h33;
  assign ram_0_MPORT_51_mask = 1'h1;
  assign ram_0_MPORT_51_en = reset;
  assign ram_0_MPORT_52_data = 2'h0;
  assign ram_0_MPORT_52_addr = 6'h34;
  assign ram_0_MPORT_52_mask = 1'h1;
  assign ram_0_MPORT_52_en = reset;
  assign ram_0_MPORT_53_data = 2'h0;
  assign ram_0_MPORT_53_addr = 6'h35;
  assign ram_0_MPORT_53_mask = 1'h1;
  assign ram_0_MPORT_53_en = reset;
  assign ram_0_MPORT_54_data = 2'h0;
  assign ram_0_MPORT_54_addr = 6'h36;
  assign ram_0_MPORT_54_mask = 1'h1;
  assign ram_0_MPORT_54_en = reset;
  assign ram_0_MPORT_55_data = 2'h0;
  assign ram_0_MPORT_55_addr = 6'h37;
  assign ram_0_MPORT_55_mask = 1'h1;
  assign ram_0_MPORT_55_en = reset;
  assign ram_0_MPORT_56_data = 2'h0;
  assign ram_0_MPORT_56_addr = 6'h38;
  assign ram_0_MPORT_56_mask = 1'h1;
  assign ram_0_MPORT_56_en = reset;
  assign ram_0_MPORT_57_data = 2'h0;
  assign ram_0_MPORT_57_addr = 6'h39;
  assign ram_0_MPORT_57_mask = 1'h1;
  assign ram_0_MPORT_57_en = reset;
  assign ram_0_MPORT_58_data = 2'h0;
  assign ram_0_MPORT_58_addr = 6'h3a;
  assign ram_0_MPORT_58_mask = 1'h1;
  assign ram_0_MPORT_58_en = reset;
  assign ram_0_MPORT_59_data = 2'h0;
  assign ram_0_MPORT_59_addr = 6'h3b;
  assign ram_0_MPORT_59_mask = 1'h1;
  assign ram_0_MPORT_59_en = reset;
  assign ram_0_MPORT_60_data = 2'h0;
  assign ram_0_MPORT_60_addr = 6'h3c;
  assign ram_0_MPORT_60_mask = 1'h1;
  assign ram_0_MPORT_60_en = reset;
  assign ram_0_MPORT_61_data = 2'h0;
  assign ram_0_MPORT_61_addr = 6'h3d;
  assign ram_0_MPORT_61_mask = 1'h1;
  assign ram_0_MPORT_61_en = reset;
  assign ram_0_MPORT_62_data = 2'h0;
  assign ram_0_MPORT_62_addr = 6'h3e;
  assign ram_0_MPORT_62_mask = 1'h1;
  assign ram_0_MPORT_62_en = reset;
  assign ram_0_MPORT_63_data = 2'h0;
  assign ram_0_MPORT_63_addr = 6'h3f;
  assign ram_0_MPORT_63_mask = 1'h1;
  assign ram_0_MPORT_63_en = reset;
  assign ram_0_MPORT_64_data = io_wdata[1:0];
  assign ram_0_MPORT_64_addr = io_addr;
  assign ram_0_MPORT_64_mask = io_wmask[0];
  assign ram_0_MPORT_64_en = io_rw;
  assign ram_1_io_rdata_MPORT_en = ram_1_io_rdata_MPORT_en_pipe_0;
  assign ram_1_io_rdata_MPORT_addr = ram_1_io_rdata_MPORT_addr_pipe_0;
  assign ram_1_io_rdata_MPORT_data = ram_1[ram_1_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_1_MPORT_data = 2'h0;
  assign ram_1_MPORT_addr = 6'h0;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = reset;
  assign ram_1_MPORT_1_data = 2'h0;
  assign ram_1_MPORT_1_addr = 6'h1;
  assign ram_1_MPORT_1_mask = 1'h1;
  assign ram_1_MPORT_1_en = reset;
  assign ram_1_MPORT_2_data = 2'h0;
  assign ram_1_MPORT_2_addr = 6'h2;
  assign ram_1_MPORT_2_mask = 1'h1;
  assign ram_1_MPORT_2_en = reset;
  assign ram_1_MPORT_3_data = 2'h0;
  assign ram_1_MPORT_3_addr = 6'h3;
  assign ram_1_MPORT_3_mask = 1'h1;
  assign ram_1_MPORT_3_en = reset;
  assign ram_1_MPORT_4_data = 2'h0;
  assign ram_1_MPORT_4_addr = 6'h4;
  assign ram_1_MPORT_4_mask = 1'h1;
  assign ram_1_MPORT_4_en = reset;
  assign ram_1_MPORT_5_data = 2'h0;
  assign ram_1_MPORT_5_addr = 6'h5;
  assign ram_1_MPORT_5_mask = 1'h1;
  assign ram_1_MPORT_5_en = reset;
  assign ram_1_MPORT_6_data = 2'h0;
  assign ram_1_MPORT_6_addr = 6'h6;
  assign ram_1_MPORT_6_mask = 1'h1;
  assign ram_1_MPORT_6_en = reset;
  assign ram_1_MPORT_7_data = 2'h0;
  assign ram_1_MPORT_7_addr = 6'h7;
  assign ram_1_MPORT_7_mask = 1'h1;
  assign ram_1_MPORT_7_en = reset;
  assign ram_1_MPORT_8_data = 2'h0;
  assign ram_1_MPORT_8_addr = 6'h8;
  assign ram_1_MPORT_8_mask = 1'h1;
  assign ram_1_MPORT_8_en = reset;
  assign ram_1_MPORT_9_data = 2'h0;
  assign ram_1_MPORT_9_addr = 6'h9;
  assign ram_1_MPORT_9_mask = 1'h1;
  assign ram_1_MPORT_9_en = reset;
  assign ram_1_MPORT_10_data = 2'h0;
  assign ram_1_MPORT_10_addr = 6'ha;
  assign ram_1_MPORT_10_mask = 1'h1;
  assign ram_1_MPORT_10_en = reset;
  assign ram_1_MPORT_11_data = 2'h0;
  assign ram_1_MPORT_11_addr = 6'hb;
  assign ram_1_MPORT_11_mask = 1'h1;
  assign ram_1_MPORT_11_en = reset;
  assign ram_1_MPORT_12_data = 2'h0;
  assign ram_1_MPORT_12_addr = 6'hc;
  assign ram_1_MPORT_12_mask = 1'h1;
  assign ram_1_MPORT_12_en = reset;
  assign ram_1_MPORT_13_data = 2'h0;
  assign ram_1_MPORT_13_addr = 6'hd;
  assign ram_1_MPORT_13_mask = 1'h1;
  assign ram_1_MPORT_13_en = reset;
  assign ram_1_MPORT_14_data = 2'h0;
  assign ram_1_MPORT_14_addr = 6'he;
  assign ram_1_MPORT_14_mask = 1'h1;
  assign ram_1_MPORT_14_en = reset;
  assign ram_1_MPORT_15_data = 2'h0;
  assign ram_1_MPORT_15_addr = 6'hf;
  assign ram_1_MPORT_15_mask = 1'h1;
  assign ram_1_MPORT_15_en = reset;
  assign ram_1_MPORT_16_data = 2'h0;
  assign ram_1_MPORT_16_addr = 6'h10;
  assign ram_1_MPORT_16_mask = 1'h1;
  assign ram_1_MPORT_16_en = reset;
  assign ram_1_MPORT_17_data = 2'h0;
  assign ram_1_MPORT_17_addr = 6'h11;
  assign ram_1_MPORT_17_mask = 1'h1;
  assign ram_1_MPORT_17_en = reset;
  assign ram_1_MPORT_18_data = 2'h0;
  assign ram_1_MPORT_18_addr = 6'h12;
  assign ram_1_MPORT_18_mask = 1'h1;
  assign ram_1_MPORT_18_en = reset;
  assign ram_1_MPORT_19_data = 2'h0;
  assign ram_1_MPORT_19_addr = 6'h13;
  assign ram_1_MPORT_19_mask = 1'h1;
  assign ram_1_MPORT_19_en = reset;
  assign ram_1_MPORT_20_data = 2'h0;
  assign ram_1_MPORT_20_addr = 6'h14;
  assign ram_1_MPORT_20_mask = 1'h1;
  assign ram_1_MPORT_20_en = reset;
  assign ram_1_MPORT_21_data = 2'h0;
  assign ram_1_MPORT_21_addr = 6'h15;
  assign ram_1_MPORT_21_mask = 1'h1;
  assign ram_1_MPORT_21_en = reset;
  assign ram_1_MPORT_22_data = 2'h0;
  assign ram_1_MPORT_22_addr = 6'h16;
  assign ram_1_MPORT_22_mask = 1'h1;
  assign ram_1_MPORT_22_en = reset;
  assign ram_1_MPORT_23_data = 2'h0;
  assign ram_1_MPORT_23_addr = 6'h17;
  assign ram_1_MPORT_23_mask = 1'h1;
  assign ram_1_MPORT_23_en = reset;
  assign ram_1_MPORT_24_data = 2'h0;
  assign ram_1_MPORT_24_addr = 6'h18;
  assign ram_1_MPORT_24_mask = 1'h1;
  assign ram_1_MPORT_24_en = reset;
  assign ram_1_MPORT_25_data = 2'h0;
  assign ram_1_MPORT_25_addr = 6'h19;
  assign ram_1_MPORT_25_mask = 1'h1;
  assign ram_1_MPORT_25_en = reset;
  assign ram_1_MPORT_26_data = 2'h0;
  assign ram_1_MPORT_26_addr = 6'h1a;
  assign ram_1_MPORT_26_mask = 1'h1;
  assign ram_1_MPORT_26_en = reset;
  assign ram_1_MPORT_27_data = 2'h0;
  assign ram_1_MPORT_27_addr = 6'h1b;
  assign ram_1_MPORT_27_mask = 1'h1;
  assign ram_1_MPORT_27_en = reset;
  assign ram_1_MPORT_28_data = 2'h0;
  assign ram_1_MPORT_28_addr = 6'h1c;
  assign ram_1_MPORT_28_mask = 1'h1;
  assign ram_1_MPORT_28_en = reset;
  assign ram_1_MPORT_29_data = 2'h0;
  assign ram_1_MPORT_29_addr = 6'h1d;
  assign ram_1_MPORT_29_mask = 1'h1;
  assign ram_1_MPORT_29_en = reset;
  assign ram_1_MPORT_30_data = 2'h0;
  assign ram_1_MPORT_30_addr = 6'h1e;
  assign ram_1_MPORT_30_mask = 1'h1;
  assign ram_1_MPORT_30_en = reset;
  assign ram_1_MPORT_31_data = 2'h0;
  assign ram_1_MPORT_31_addr = 6'h1f;
  assign ram_1_MPORT_31_mask = 1'h1;
  assign ram_1_MPORT_31_en = reset;
  assign ram_1_MPORT_32_data = 2'h0;
  assign ram_1_MPORT_32_addr = 6'h20;
  assign ram_1_MPORT_32_mask = 1'h1;
  assign ram_1_MPORT_32_en = reset;
  assign ram_1_MPORT_33_data = 2'h0;
  assign ram_1_MPORT_33_addr = 6'h21;
  assign ram_1_MPORT_33_mask = 1'h1;
  assign ram_1_MPORT_33_en = reset;
  assign ram_1_MPORT_34_data = 2'h0;
  assign ram_1_MPORT_34_addr = 6'h22;
  assign ram_1_MPORT_34_mask = 1'h1;
  assign ram_1_MPORT_34_en = reset;
  assign ram_1_MPORT_35_data = 2'h0;
  assign ram_1_MPORT_35_addr = 6'h23;
  assign ram_1_MPORT_35_mask = 1'h1;
  assign ram_1_MPORT_35_en = reset;
  assign ram_1_MPORT_36_data = 2'h0;
  assign ram_1_MPORT_36_addr = 6'h24;
  assign ram_1_MPORT_36_mask = 1'h1;
  assign ram_1_MPORT_36_en = reset;
  assign ram_1_MPORT_37_data = 2'h0;
  assign ram_1_MPORT_37_addr = 6'h25;
  assign ram_1_MPORT_37_mask = 1'h1;
  assign ram_1_MPORT_37_en = reset;
  assign ram_1_MPORT_38_data = 2'h0;
  assign ram_1_MPORT_38_addr = 6'h26;
  assign ram_1_MPORT_38_mask = 1'h1;
  assign ram_1_MPORT_38_en = reset;
  assign ram_1_MPORT_39_data = 2'h0;
  assign ram_1_MPORT_39_addr = 6'h27;
  assign ram_1_MPORT_39_mask = 1'h1;
  assign ram_1_MPORT_39_en = reset;
  assign ram_1_MPORT_40_data = 2'h0;
  assign ram_1_MPORT_40_addr = 6'h28;
  assign ram_1_MPORT_40_mask = 1'h1;
  assign ram_1_MPORT_40_en = reset;
  assign ram_1_MPORT_41_data = 2'h0;
  assign ram_1_MPORT_41_addr = 6'h29;
  assign ram_1_MPORT_41_mask = 1'h1;
  assign ram_1_MPORT_41_en = reset;
  assign ram_1_MPORT_42_data = 2'h0;
  assign ram_1_MPORT_42_addr = 6'h2a;
  assign ram_1_MPORT_42_mask = 1'h1;
  assign ram_1_MPORT_42_en = reset;
  assign ram_1_MPORT_43_data = 2'h0;
  assign ram_1_MPORT_43_addr = 6'h2b;
  assign ram_1_MPORT_43_mask = 1'h1;
  assign ram_1_MPORT_43_en = reset;
  assign ram_1_MPORT_44_data = 2'h0;
  assign ram_1_MPORT_44_addr = 6'h2c;
  assign ram_1_MPORT_44_mask = 1'h1;
  assign ram_1_MPORT_44_en = reset;
  assign ram_1_MPORT_45_data = 2'h0;
  assign ram_1_MPORT_45_addr = 6'h2d;
  assign ram_1_MPORT_45_mask = 1'h1;
  assign ram_1_MPORT_45_en = reset;
  assign ram_1_MPORT_46_data = 2'h0;
  assign ram_1_MPORT_46_addr = 6'h2e;
  assign ram_1_MPORT_46_mask = 1'h1;
  assign ram_1_MPORT_46_en = reset;
  assign ram_1_MPORT_47_data = 2'h0;
  assign ram_1_MPORT_47_addr = 6'h2f;
  assign ram_1_MPORT_47_mask = 1'h1;
  assign ram_1_MPORT_47_en = reset;
  assign ram_1_MPORT_48_data = 2'h0;
  assign ram_1_MPORT_48_addr = 6'h30;
  assign ram_1_MPORT_48_mask = 1'h1;
  assign ram_1_MPORT_48_en = reset;
  assign ram_1_MPORT_49_data = 2'h0;
  assign ram_1_MPORT_49_addr = 6'h31;
  assign ram_1_MPORT_49_mask = 1'h1;
  assign ram_1_MPORT_49_en = reset;
  assign ram_1_MPORT_50_data = 2'h0;
  assign ram_1_MPORT_50_addr = 6'h32;
  assign ram_1_MPORT_50_mask = 1'h1;
  assign ram_1_MPORT_50_en = reset;
  assign ram_1_MPORT_51_data = 2'h0;
  assign ram_1_MPORT_51_addr = 6'h33;
  assign ram_1_MPORT_51_mask = 1'h1;
  assign ram_1_MPORT_51_en = reset;
  assign ram_1_MPORT_52_data = 2'h0;
  assign ram_1_MPORT_52_addr = 6'h34;
  assign ram_1_MPORT_52_mask = 1'h1;
  assign ram_1_MPORT_52_en = reset;
  assign ram_1_MPORT_53_data = 2'h0;
  assign ram_1_MPORT_53_addr = 6'h35;
  assign ram_1_MPORT_53_mask = 1'h1;
  assign ram_1_MPORT_53_en = reset;
  assign ram_1_MPORT_54_data = 2'h0;
  assign ram_1_MPORT_54_addr = 6'h36;
  assign ram_1_MPORT_54_mask = 1'h1;
  assign ram_1_MPORT_54_en = reset;
  assign ram_1_MPORT_55_data = 2'h0;
  assign ram_1_MPORT_55_addr = 6'h37;
  assign ram_1_MPORT_55_mask = 1'h1;
  assign ram_1_MPORT_55_en = reset;
  assign ram_1_MPORT_56_data = 2'h0;
  assign ram_1_MPORT_56_addr = 6'h38;
  assign ram_1_MPORT_56_mask = 1'h1;
  assign ram_1_MPORT_56_en = reset;
  assign ram_1_MPORT_57_data = 2'h0;
  assign ram_1_MPORT_57_addr = 6'h39;
  assign ram_1_MPORT_57_mask = 1'h1;
  assign ram_1_MPORT_57_en = reset;
  assign ram_1_MPORT_58_data = 2'h0;
  assign ram_1_MPORT_58_addr = 6'h3a;
  assign ram_1_MPORT_58_mask = 1'h1;
  assign ram_1_MPORT_58_en = reset;
  assign ram_1_MPORT_59_data = 2'h0;
  assign ram_1_MPORT_59_addr = 6'h3b;
  assign ram_1_MPORT_59_mask = 1'h1;
  assign ram_1_MPORT_59_en = reset;
  assign ram_1_MPORT_60_data = 2'h0;
  assign ram_1_MPORT_60_addr = 6'h3c;
  assign ram_1_MPORT_60_mask = 1'h1;
  assign ram_1_MPORT_60_en = reset;
  assign ram_1_MPORT_61_data = 2'h0;
  assign ram_1_MPORT_61_addr = 6'h3d;
  assign ram_1_MPORT_61_mask = 1'h1;
  assign ram_1_MPORT_61_en = reset;
  assign ram_1_MPORT_62_data = 2'h0;
  assign ram_1_MPORT_62_addr = 6'h3e;
  assign ram_1_MPORT_62_mask = 1'h1;
  assign ram_1_MPORT_62_en = reset;
  assign ram_1_MPORT_63_data = 2'h0;
  assign ram_1_MPORT_63_addr = 6'h3f;
  assign ram_1_MPORT_63_mask = 1'h1;
  assign ram_1_MPORT_63_en = reset;
  assign ram_1_MPORT_64_data = io_wdata[3:2];
  assign ram_1_MPORT_64_addr = io_addr;
  assign ram_1_MPORT_64_mask = io_wmask[1];
  assign ram_1_MPORT_64_en = io_rw;
  assign ram_2_io_rdata_MPORT_en = ram_2_io_rdata_MPORT_en_pipe_0;
  assign ram_2_io_rdata_MPORT_addr = ram_2_io_rdata_MPORT_addr_pipe_0;
  assign ram_2_io_rdata_MPORT_data = ram_2[ram_2_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_2_MPORT_data = 2'h0;
  assign ram_2_MPORT_addr = 6'h0;
  assign ram_2_MPORT_mask = 1'h1;
  assign ram_2_MPORT_en = reset;
  assign ram_2_MPORT_1_data = 2'h0;
  assign ram_2_MPORT_1_addr = 6'h1;
  assign ram_2_MPORT_1_mask = 1'h1;
  assign ram_2_MPORT_1_en = reset;
  assign ram_2_MPORT_2_data = 2'h0;
  assign ram_2_MPORT_2_addr = 6'h2;
  assign ram_2_MPORT_2_mask = 1'h1;
  assign ram_2_MPORT_2_en = reset;
  assign ram_2_MPORT_3_data = 2'h0;
  assign ram_2_MPORT_3_addr = 6'h3;
  assign ram_2_MPORT_3_mask = 1'h1;
  assign ram_2_MPORT_3_en = reset;
  assign ram_2_MPORT_4_data = 2'h0;
  assign ram_2_MPORT_4_addr = 6'h4;
  assign ram_2_MPORT_4_mask = 1'h1;
  assign ram_2_MPORT_4_en = reset;
  assign ram_2_MPORT_5_data = 2'h0;
  assign ram_2_MPORT_5_addr = 6'h5;
  assign ram_2_MPORT_5_mask = 1'h1;
  assign ram_2_MPORT_5_en = reset;
  assign ram_2_MPORT_6_data = 2'h0;
  assign ram_2_MPORT_6_addr = 6'h6;
  assign ram_2_MPORT_6_mask = 1'h1;
  assign ram_2_MPORT_6_en = reset;
  assign ram_2_MPORT_7_data = 2'h0;
  assign ram_2_MPORT_7_addr = 6'h7;
  assign ram_2_MPORT_7_mask = 1'h1;
  assign ram_2_MPORT_7_en = reset;
  assign ram_2_MPORT_8_data = 2'h0;
  assign ram_2_MPORT_8_addr = 6'h8;
  assign ram_2_MPORT_8_mask = 1'h1;
  assign ram_2_MPORT_8_en = reset;
  assign ram_2_MPORT_9_data = 2'h0;
  assign ram_2_MPORT_9_addr = 6'h9;
  assign ram_2_MPORT_9_mask = 1'h1;
  assign ram_2_MPORT_9_en = reset;
  assign ram_2_MPORT_10_data = 2'h0;
  assign ram_2_MPORT_10_addr = 6'ha;
  assign ram_2_MPORT_10_mask = 1'h1;
  assign ram_2_MPORT_10_en = reset;
  assign ram_2_MPORT_11_data = 2'h0;
  assign ram_2_MPORT_11_addr = 6'hb;
  assign ram_2_MPORT_11_mask = 1'h1;
  assign ram_2_MPORT_11_en = reset;
  assign ram_2_MPORT_12_data = 2'h0;
  assign ram_2_MPORT_12_addr = 6'hc;
  assign ram_2_MPORT_12_mask = 1'h1;
  assign ram_2_MPORT_12_en = reset;
  assign ram_2_MPORT_13_data = 2'h0;
  assign ram_2_MPORT_13_addr = 6'hd;
  assign ram_2_MPORT_13_mask = 1'h1;
  assign ram_2_MPORT_13_en = reset;
  assign ram_2_MPORT_14_data = 2'h0;
  assign ram_2_MPORT_14_addr = 6'he;
  assign ram_2_MPORT_14_mask = 1'h1;
  assign ram_2_MPORT_14_en = reset;
  assign ram_2_MPORT_15_data = 2'h0;
  assign ram_2_MPORT_15_addr = 6'hf;
  assign ram_2_MPORT_15_mask = 1'h1;
  assign ram_2_MPORT_15_en = reset;
  assign ram_2_MPORT_16_data = 2'h0;
  assign ram_2_MPORT_16_addr = 6'h10;
  assign ram_2_MPORT_16_mask = 1'h1;
  assign ram_2_MPORT_16_en = reset;
  assign ram_2_MPORT_17_data = 2'h0;
  assign ram_2_MPORT_17_addr = 6'h11;
  assign ram_2_MPORT_17_mask = 1'h1;
  assign ram_2_MPORT_17_en = reset;
  assign ram_2_MPORT_18_data = 2'h0;
  assign ram_2_MPORT_18_addr = 6'h12;
  assign ram_2_MPORT_18_mask = 1'h1;
  assign ram_2_MPORT_18_en = reset;
  assign ram_2_MPORT_19_data = 2'h0;
  assign ram_2_MPORT_19_addr = 6'h13;
  assign ram_2_MPORT_19_mask = 1'h1;
  assign ram_2_MPORT_19_en = reset;
  assign ram_2_MPORT_20_data = 2'h0;
  assign ram_2_MPORT_20_addr = 6'h14;
  assign ram_2_MPORT_20_mask = 1'h1;
  assign ram_2_MPORT_20_en = reset;
  assign ram_2_MPORT_21_data = 2'h0;
  assign ram_2_MPORT_21_addr = 6'h15;
  assign ram_2_MPORT_21_mask = 1'h1;
  assign ram_2_MPORT_21_en = reset;
  assign ram_2_MPORT_22_data = 2'h0;
  assign ram_2_MPORT_22_addr = 6'h16;
  assign ram_2_MPORT_22_mask = 1'h1;
  assign ram_2_MPORT_22_en = reset;
  assign ram_2_MPORT_23_data = 2'h0;
  assign ram_2_MPORT_23_addr = 6'h17;
  assign ram_2_MPORT_23_mask = 1'h1;
  assign ram_2_MPORT_23_en = reset;
  assign ram_2_MPORT_24_data = 2'h0;
  assign ram_2_MPORT_24_addr = 6'h18;
  assign ram_2_MPORT_24_mask = 1'h1;
  assign ram_2_MPORT_24_en = reset;
  assign ram_2_MPORT_25_data = 2'h0;
  assign ram_2_MPORT_25_addr = 6'h19;
  assign ram_2_MPORT_25_mask = 1'h1;
  assign ram_2_MPORT_25_en = reset;
  assign ram_2_MPORT_26_data = 2'h0;
  assign ram_2_MPORT_26_addr = 6'h1a;
  assign ram_2_MPORT_26_mask = 1'h1;
  assign ram_2_MPORT_26_en = reset;
  assign ram_2_MPORT_27_data = 2'h0;
  assign ram_2_MPORT_27_addr = 6'h1b;
  assign ram_2_MPORT_27_mask = 1'h1;
  assign ram_2_MPORT_27_en = reset;
  assign ram_2_MPORT_28_data = 2'h0;
  assign ram_2_MPORT_28_addr = 6'h1c;
  assign ram_2_MPORT_28_mask = 1'h1;
  assign ram_2_MPORT_28_en = reset;
  assign ram_2_MPORT_29_data = 2'h0;
  assign ram_2_MPORT_29_addr = 6'h1d;
  assign ram_2_MPORT_29_mask = 1'h1;
  assign ram_2_MPORT_29_en = reset;
  assign ram_2_MPORT_30_data = 2'h0;
  assign ram_2_MPORT_30_addr = 6'h1e;
  assign ram_2_MPORT_30_mask = 1'h1;
  assign ram_2_MPORT_30_en = reset;
  assign ram_2_MPORT_31_data = 2'h0;
  assign ram_2_MPORT_31_addr = 6'h1f;
  assign ram_2_MPORT_31_mask = 1'h1;
  assign ram_2_MPORT_31_en = reset;
  assign ram_2_MPORT_32_data = 2'h0;
  assign ram_2_MPORT_32_addr = 6'h20;
  assign ram_2_MPORT_32_mask = 1'h1;
  assign ram_2_MPORT_32_en = reset;
  assign ram_2_MPORT_33_data = 2'h0;
  assign ram_2_MPORT_33_addr = 6'h21;
  assign ram_2_MPORT_33_mask = 1'h1;
  assign ram_2_MPORT_33_en = reset;
  assign ram_2_MPORT_34_data = 2'h0;
  assign ram_2_MPORT_34_addr = 6'h22;
  assign ram_2_MPORT_34_mask = 1'h1;
  assign ram_2_MPORT_34_en = reset;
  assign ram_2_MPORT_35_data = 2'h0;
  assign ram_2_MPORT_35_addr = 6'h23;
  assign ram_2_MPORT_35_mask = 1'h1;
  assign ram_2_MPORT_35_en = reset;
  assign ram_2_MPORT_36_data = 2'h0;
  assign ram_2_MPORT_36_addr = 6'h24;
  assign ram_2_MPORT_36_mask = 1'h1;
  assign ram_2_MPORT_36_en = reset;
  assign ram_2_MPORT_37_data = 2'h0;
  assign ram_2_MPORT_37_addr = 6'h25;
  assign ram_2_MPORT_37_mask = 1'h1;
  assign ram_2_MPORT_37_en = reset;
  assign ram_2_MPORT_38_data = 2'h0;
  assign ram_2_MPORT_38_addr = 6'h26;
  assign ram_2_MPORT_38_mask = 1'h1;
  assign ram_2_MPORT_38_en = reset;
  assign ram_2_MPORT_39_data = 2'h0;
  assign ram_2_MPORT_39_addr = 6'h27;
  assign ram_2_MPORT_39_mask = 1'h1;
  assign ram_2_MPORT_39_en = reset;
  assign ram_2_MPORT_40_data = 2'h0;
  assign ram_2_MPORT_40_addr = 6'h28;
  assign ram_2_MPORT_40_mask = 1'h1;
  assign ram_2_MPORT_40_en = reset;
  assign ram_2_MPORT_41_data = 2'h0;
  assign ram_2_MPORT_41_addr = 6'h29;
  assign ram_2_MPORT_41_mask = 1'h1;
  assign ram_2_MPORT_41_en = reset;
  assign ram_2_MPORT_42_data = 2'h0;
  assign ram_2_MPORT_42_addr = 6'h2a;
  assign ram_2_MPORT_42_mask = 1'h1;
  assign ram_2_MPORT_42_en = reset;
  assign ram_2_MPORT_43_data = 2'h0;
  assign ram_2_MPORT_43_addr = 6'h2b;
  assign ram_2_MPORT_43_mask = 1'h1;
  assign ram_2_MPORT_43_en = reset;
  assign ram_2_MPORT_44_data = 2'h0;
  assign ram_2_MPORT_44_addr = 6'h2c;
  assign ram_2_MPORT_44_mask = 1'h1;
  assign ram_2_MPORT_44_en = reset;
  assign ram_2_MPORT_45_data = 2'h0;
  assign ram_2_MPORT_45_addr = 6'h2d;
  assign ram_2_MPORT_45_mask = 1'h1;
  assign ram_2_MPORT_45_en = reset;
  assign ram_2_MPORT_46_data = 2'h0;
  assign ram_2_MPORT_46_addr = 6'h2e;
  assign ram_2_MPORT_46_mask = 1'h1;
  assign ram_2_MPORT_46_en = reset;
  assign ram_2_MPORT_47_data = 2'h0;
  assign ram_2_MPORT_47_addr = 6'h2f;
  assign ram_2_MPORT_47_mask = 1'h1;
  assign ram_2_MPORT_47_en = reset;
  assign ram_2_MPORT_48_data = 2'h0;
  assign ram_2_MPORT_48_addr = 6'h30;
  assign ram_2_MPORT_48_mask = 1'h1;
  assign ram_2_MPORT_48_en = reset;
  assign ram_2_MPORT_49_data = 2'h0;
  assign ram_2_MPORT_49_addr = 6'h31;
  assign ram_2_MPORT_49_mask = 1'h1;
  assign ram_2_MPORT_49_en = reset;
  assign ram_2_MPORT_50_data = 2'h0;
  assign ram_2_MPORT_50_addr = 6'h32;
  assign ram_2_MPORT_50_mask = 1'h1;
  assign ram_2_MPORT_50_en = reset;
  assign ram_2_MPORT_51_data = 2'h0;
  assign ram_2_MPORT_51_addr = 6'h33;
  assign ram_2_MPORT_51_mask = 1'h1;
  assign ram_2_MPORT_51_en = reset;
  assign ram_2_MPORT_52_data = 2'h0;
  assign ram_2_MPORT_52_addr = 6'h34;
  assign ram_2_MPORT_52_mask = 1'h1;
  assign ram_2_MPORT_52_en = reset;
  assign ram_2_MPORT_53_data = 2'h0;
  assign ram_2_MPORT_53_addr = 6'h35;
  assign ram_2_MPORT_53_mask = 1'h1;
  assign ram_2_MPORT_53_en = reset;
  assign ram_2_MPORT_54_data = 2'h0;
  assign ram_2_MPORT_54_addr = 6'h36;
  assign ram_2_MPORT_54_mask = 1'h1;
  assign ram_2_MPORT_54_en = reset;
  assign ram_2_MPORT_55_data = 2'h0;
  assign ram_2_MPORT_55_addr = 6'h37;
  assign ram_2_MPORT_55_mask = 1'h1;
  assign ram_2_MPORT_55_en = reset;
  assign ram_2_MPORT_56_data = 2'h0;
  assign ram_2_MPORT_56_addr = 6'h38;
  assign ram_2_MPORT_56_mask = 1'h1;
  assign ram_2_MPORT_56_en = reset;
  assign ram_2_MPORT_57_data = 2'h0;
  assign ram_2_MPORT_57_addr = 6'h39;
  assign ram_2_MPORT_57_mask = 1'h1;
  assign ram_2_MPORT_57_en = reset;
  assign ram_2_MPORT_58_data = 2'h0;
  assign ram_2_MPORT_58_addr = 6'h3a;
  assign ram_2_MPORT_58_mask = 1'h1;
  assign ram_2_MPORT_58_en = reset;
  assign ram_2_MPORT_59_data = 2'h0;
  assign ram_2_MPORT_59_addr = 6'h3b;
  assign ram_2_MPORT_59_mask = 1'h1;
  assign ram_2_MPORT_59_en = reset;
  assign ram_2_MPORT_60_data = 2'h0;
  assign ram_2_MPORT_60_addr = 6'h3c;
  assign ram_2_MPORT_60_mask = 1'h1;
  assign ram_2_MPORT_60_en = reset;
  assign ram_2_MPORT_61_data = 2'h0;
  assign ram_2_MPORT_61_addr = 6'h3d;
  assign ram_2_MPORT_61_mask = 1'h1;
  assign ram_2_MPORT_61_en = reset;
  assign ram_2_MPORT_62_data = 2'h0;
  assign ram_2_MPORT_62_addr = 6'h3e;
  assign ram_2_MPORT_62_mask = 1'h1;
  assign ram_2_MPORT_62_en = reset;
  assign ram_2_MPORT_63_data = 2'h0;
  assign ram_2_MPORT_63_addr = 6'h3f;
  assign ram_2_MPORT_63_mask = 1'h1;
  assign ram_2_MPORT_63_en = reset;
  assign ram_2_MPORT_64_data = io_wdata[5:4];
  assign ram_2_MPORT_64_addr = io_addr;
  assign ram_2_MPORT_64_mask = io_wmask[2];
  assign ram_2_MPORT_64_en = io_rw;
  assign ram_3_io_rdata_MPORT_en = ram_3_io_rdata_MPORT_en_pipe_0;
  assign ram_3_io_rdata_MPORT_addr = ram_3_io_rdata_MPORT_addr_pipe_0;
  assign ram_3_io_rdata_MPORT_data = ram_3[ram_3_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_3_MPORT_data = 2'h0;
  assign ram_3_MPORT_addr = 6'h0;
  assign ram_3_MPORT_mask = 1'h1;
  assign ram_3_MPORT_en = reset;
  assign ram_3_MPORT_1_data = 2'h0;
  assign ram_3_MPORT_1_addr = 6'h1;
  assign ram_3_MPORT_1_mask = 1'h1;
  assign ram_3_MPORT_1_en = reset;
  assign ram_3_MPORT_2_data = 2'h0;
  assign ram_3_MPORT_2_addr = 6'h2;
  assign ram_3_MPORT_2_mask = 1'h1;
  assign ram_3_MPORT_2_en = reset;
  assign ram_3_MPORT_3_data = 2'h0;
  assign ram_3_MPORT_3_addr = 6'h3;
  assign ram_3_MPORT_3_mask = 1'h1;
  assign ram_3_MPORT_3_en = reset;
  assign ram_3_MPORT_4_data = 2'h0;
  assign ram_3_MPORT_4_addr = 6'h4;
  assign ram_3_MPORT_4_mask = 1'h1;
  assign ram_3_MPORT_4_en = reset;
  assign ram_3_MPORT_5_data = 2'h0;
  assign ram_3_MPORT_5_addr = 6'h5;
  assign ram_3_MPORT_5_mask = 1'h1;
  assign ram_3_MPORT_5_en = reset;
  assign ram_3_MPORT_6_data = 2'h0;
  assign ram_3_MPORT_6_addr = 6'h6;
  assign ram_3_MPORT_6_mask = 1'h1;
  assign ram_3_MPORT_6_en = reset;
  assign ram_3_MPORT_7_data = 2'h0;
  assign ram_3_MPORT_7_addr = 6'h7;
  assign ram_3_MPORT_7_mask = 1'h1;
  assign ram_3_MPORT_7_en = reset;
  assign ram_3_MPORT_8_data = 2'h0;
  assign ram_3_MPORT_8_addr = 6'h8;
  assign ram_3_MPORT_8_mask = 1'h1;
  assign ram_3_MPORT_8_en = reset;
  assign ram_3_MPORT_9_data = 2'h0;
  assign ram_3_MPORT_9_addr = 6'h9;
  assign ram_3_MPORT_9_mask = 1'h1;
  assign ram_3_MPORT_9_en = reset;
  assign ram_3_MPORT_10_data = 2'h0;
  assign ram_3_MPORT_10_addr = 6'ha;
  assign ram_3_MPORT_10_mask = 1'h1;
  assign ram_3_MPORT_10_en = reset;
  assign ram_3_MPORT_11_data = 2'h0;
  assign ram_3_MPORT_11_addr = 6'hb;
  assign ram_3_MPORT_11_mask = 1'h1;
  assign ram_3_MPORT_11_en = reset;
  assign ram_3_MPORT_12_data = 2'h0;
  assign ram_3_MPORT_12_addr = 6'hc;
  assign ram_3_MPORT_12_mask = 1'h1;
  assign ram_3_MPORT_12_en = reset;
  assign ram_3_MPORT_13_data = 2'h0;
  assign ram_3_MPORT_13_addr = 6'hd;
  assign ram_3_MPORT_13_mask = 1'h1;
  assign ram_3_MPORT_13_en = reset;
  assign ram_3_MPORT_14_data = 2'h0;
  assign ram_3_MPORT_14_addr = 6'he;
  assign ram_3_MPORT_14_mask = 1'h1;
  assign ram_3_MPORT_14_en = reset;
  assign ram_3_MPORT_15_data = 2'h0;
  assign ram_3_MPORT_15_addr = 6'hf;
  assign ram_3_MPORT_15_mask = 1'h1;
  assign ram_3_MPORT_15_en = reset;
  assign ram_3_MPORT_16_data = 2'h0;
  assign ram_3_MPORT_16_addr = 6'h10;
  assign ram_3_MPORT_16_mask = 1'h1;
  assign ram_3_MPORT_16_en = reset;
  assign ram_3_MPORT_17_data = 2'h0;
  assign ram_3_MPORT_17_addr = 6'h11;
  assign ram_3_MPORT_17_mask = 1'h1;
  assign ram_3_MPORT_17_en = reset;
  assign ram_3_MPORT_18_data = 2'h0;
  assign ram_3_MPORT_18_addr = 6'h12;
  assign ram_3_MPORT_18_mask = 1'h1;
  assign ram_3_MPORT_18_en = reset;
  assign ram_3_MPORT_19_data = 2'h0;
  assign ram_3_MPORT_19_addr = 6'h13;
  assign ram_3_MPORT_19_mask = 1'h1;
  assign ram_3_MPORT_19_en = reset;
  assign ram_3_MPORT_20_data = 2'h0;
  assign ram_3_MPORT_20_addr = 6'h14;
  assign ram_3_MPORT_20_mask = 1'h1;
  assign ram_3_MPORT_20_en = reset;
  assign ram_3_MPORT_21_data = 2'h0;
  assign ram_3_MPORT_21_addr = 6'h15;
  assign ram_3_MPORT_21_mask = 1'h1;
  assign ram_3_MPORT_21_en = reset;
  assign ram_3_MPORT_22_data = 2'h0;
  assign ram_3_MPORT_22_addr = 6'h16;
  assign ram_3_MPORT_22_mask = 1'h1;
  assign ram_3_MPORT_22_en = reset;
  assign ram_3_MPORT_23_data = 2'h0;
  assign ram_3_MPORT_23_addr = 6'h17;
  assign ram_3_MPORT_23_mask = 1'h1;
  assign ram_3_MPORT_23_en = reset;
  assign ram_3_MPORT_24_data = 2'h0;
  assign ram_3_MPORT_24_addr = 6'h18;
  assign ram_3_MPORT_24_mask = 1'h1;
  assign ram_3_MPORT_24_en = reset;
  assign ram_3_MPORT_25_data = 2'h0;
  assign ram_3_MPORT_25_addr = 6'h19;
  assign ram_3_MPORT_25_mask = 1'h1;
  assign ram_3_MPORT_25_en = reset;
  assign ram_3_MPORT_26_data = 2'h0;
  assign ram_3_MPORT_26_addr = 6'h1a;
  assign ram_3_MPORT_26_mask = 1'h1;
  assign ram_3_MPORT_26_en = reset;
  assign ram_3_MPORT_27_data = 2'h0;
  assign ram_3_MPORT_27_addr = 6'h1b;
  assign ram_3_MPORT_27_mask = 1'h1;
  assign ram_3_MPORT_27_en = reset;
  assign ram_3_MPORT_28_data = 2'h0;
  assign ram_3_MPORT_28_addr = 6'h1c;
  assign ram_3_MPORT_28_mask = 1'h1;
  assign ram_3_MPORT_28_en = reset;
  assign ram_3_MPORT_29_data = 2'h0;
  assign ram_3_MPORT_29_addr = 6'h1d;
  assign ram_3_MPORT_29_mask = 1'h1;
  assign ram_3_MPORT_29_en = reset;
  assign ram_3_MPORT_30_data = 2'h0;
  assign ram_3_MPORT_30_addr = 6'h1e;
  assign ram_3_MPORT_30_mask = 1'h1;
  assign ram_3_MPORT_30_en = reset;
  assign ram_3_MPORT_31_data = 2'h0;
  assign ram_3_MPORT_31_addr = 6'h1f;
  assign ram_3_MPORT_31_mask = 1'h1;
  assign ram_3_MPORT_31_en = reset;
  assign ram_3_MPORT_32_data = 2'h0;
  assign ram_3_MPORT_32_addr = 6'h20;
  assign ram_3_MPORT_32_mask = 1'h1;
  assign ram_3_MPORT_32_en = reset;
  assign ram_3_MPORT_33_data = 2'h0;
  assign ram_3_MPORT_33_addr = 6'h21;
  assign ram_3_MPORT_33_mask = 1'h1;
  assign ram_3_MPORT_33_en = reset;
  assign ram_3_MPORT_34_data = 2'h0;
  assign ram_3_MPORT_34_addr = 6'h22;
  assign ram_3_MPORT_34_mask = 1'h1;
  assign ram_3_MPORT_34_en = reset;
  assign ram_3_MPORT_35_data = 2'h0;
  assign ram_3_MPORT_35_addr = 6'h23;
  assign ram_3_MPORT_35_mask = 1'h1;
  assign ram_3_MPORT_35_en = reset;
  assign ram_3_MPORT_36_data = 2'h0;
  assign ram_3_MPORT_36_addr = 6'h24;
  assign ram_3_MPORT_36_mask = 1'h1;
  assign ram_3_MPORT_36_en = reset;
  assign ram_3_MPORT_37_data = 2'h0;
  assign ram_3_MPORT_37_addr = 6'h25;
  assign ram_3_MPORT_37_mask = 1'h1;
  assign ram_3_MPORT_37_en = reset;
  assign ram_3_MPORT_38_data = 2'h0;
  assign ram_3_MPORT_38_addr = 6'h26;
  assign ram_3_MPORT_38_mask = 1'h1;
  assign ram_3_MPORT_38_en = reset;
  assign ram_3_MPORT_39_data = 2'h0;
  assign ram_3_MPORT_39_addr = 6'h27;
  assign ram_3_MPORT_39_mask = 1'h1;
  assign ram_3_MPORT_39_en = reset;
  assign ram_3_MPORT_40_data = 2'h0;
  assign ram_3_MPORT_40_addr = 6'h28;
  assign ram_3_MPORT_40_mask = 1'h1;
  assign ram_3_MPORT_40_en = reset;
  assign ram_3_MPORT_41_data = 2'h0;
  assign ram_3_MPORT_41_addr = 6'h29;
  assign ram_3_MPORT_41_mask = 1'h1;
  assign ram_3_MPORT_41_en = reset;
  assign ram_3_MPORT_42_data = 2'h0;
  assign ram_3_MPORT_42_addr = 6'h2a;
  assign ram_3_MPORT_42_mask = 1'h1;
  assign ram_3_MPORT_42_en = reset;
  assign ram_3_MPORT_43_data = 2'h0;
  assign ram_3_MPORT_43_addr = 6'h2b;
  assign ram_3_MPORT_43_mask = 1'h1;
  assign ram_3_MPORT_43_en = reset;
  assign ram_3_MPORT_44_data = 2'h0;
  assign ram_3_MPORT_44_addr = 6'h2c;
  assign ram_3_MPORT_44_mask = 1'h1;
  assign ram_3_MPORT_44_en = reset;
  assign ram_3_MPORT_45_data = 2'h0;
  assign ram_3_MPORT_45_addr = 6'h2d;
  assign ram_3_MPORT_45_mask = 1'h1;
  assign ram_3_MPORT_45_en = reset;
  assign ram_3_MPORT_46_data = 2'h0;
  assign ram_3_MPORT_46_addr = 6'h2e;
  assign ram_3_MPORT_46_mask = 1'h1;
  assign ram_3_MPORT_46_en = reset;
  assign ram_3_MPORT_47_data = 2'h0;
  assign ram_3_MPORT_47_addr = 6'h2f;
  assign ram_3_MPORT_47_mask = 1'h1;
  assign ram_3_MPORT_47_en = reset;
  assign ram_3_MPORT_48_data = 2'h0;
  assign ram_3_MPORT_48_addr = 6'h30;
  assign ram_3_MPORT_48_mask = 1'h1;
  assign ram_3_MPORT_48_en = reset;
  assign ram_3_MPORT_49_data = 2'h0;
  assign ram_3_MPORT_49_addr = 6'h31;
  assign ram_3_MPORT_49_mask = 1'h1;
  assign ram_3_MPORT_49_en = reset;
  assign ram_3_MPORT_50_data = 2'h0;
  assign ram_3_MPORT_50_addr = 6'h32;
  assign ram_3_MPORT_50_mask = 1'h1;
  assign ram_3_MPORT_50_en = reset;
  assign ram_3_MPORT_51_data = 2'h0;
  assign ram_3_MPORT_51_addr = 6'h33;
  assign ram_3_MPORT_51_mask = 1'h1;
  assign ram_3_MPORT_51_en = reset;
  assign ram_3_MPORT_52_data = 2'h0;
  assign ram_3_MPORT_52_addr = 6'h34;
  assign ram_3_MPORT_52_mask = 1'h1;
  assign ram_3_MPORT_52_en = reset;
  assign ram_3_MPORT_53_data = 2'h0;
  assign ram_3_MPORT_53_addr = 6'h35;
  assign ram_3_MPORT_53_mask = 1'h1;
  assign ram_3_MPORT_53_en = reset;
  assign ram_3_MPORT_54_data = 2'h0;
  assign ram_3_MPORT_54_addr = 6'h36;
  assign ram_3_MPORT_54_mask = 1'h1;
  assign ram_3_MPORT_54_en = reset;
  assign ram_3_MPORT_55_data = 2'h0;
  assign ram_3_MPORT_55_addr = 6'h37;
  assign ram_3_MPORT_55_mask = 1'h1;
  assign ram_3_MPORT_55_en = reset;
  assign ram_3_MPORT_56_data = 2'h0;
  assign ram_3_MPORT_56_addr = 6'h38;
  assign ram_3_MPORT_56_mask = 1'h1;
  assign ram_3_MPORT_56_en = reset;
  assign ram_3_MPORT_57_data = 2'h0;
  assign ram_3_MPORT_57_addr = 6'h39;
  assign ram_3_MPORT_57_mask = 1'h1;
  assign ram_3_MPORT_57_en = reset;
  assign ram_3_MPORT_58_data = 2'h0;
  assign ram_3_MPORT_58_addr = 6'h3a;
  assign ram_3_MPORT_58_mask = 1'h1;
  assign ram_3_MPORT_58_en = reset;
  assign ram_3_MPORT_59_data = 2'h0;
  assign ram_3_MPORT_59_addr = 6'h3b;
  assign ram_3_MPORT_59_mask = 1'h1;
  assign ram_3_MPORT_59_en = reset;
  assign ram_3_MPORT_60_data = 2'h0;
  assign ram_3_MPORT_60_addr = 6'h3c;
  assign ram_3_MPORT_60_mask = 1'h1;
  assign ram_3_MPORT_60_en = reset;
  assign ram_3_MPORT_61_data = 2'h0;
  assign ram_3_MPORT_61_addr = 6'h3d;
  assign ram_3_MPORT_61_mask = 1'h1;
  assign ram_3_MPORT_61_en = reset;
  assign ram_3_MPORT_62_data = 2'h0;
  assign ram_3_MPORT_62_addr = 6'h3e;
  assign ram_3_MPORT_62_mask = 1'h1;
  assign ram_3_MPORT_62_en = reset;
  assign ram_3_MPORT_63_data = 2'h0;
  assign ram_3_MPORT_63_addr = 6'h3f;
  assign ram_3_MPORT_63_mask = 1'h1;
  assign ram_3_MPORT_63_en = reset;
  assign ram_3_MPORT_64_data = io_wdata[7:6];
  assign ram_3_MPORT_64_addr = io_addr;
  assign ram_3_MPORT_64_mask = io_wmask[3];
  assign ram_3_MPORT_64_en = io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 75:39]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_1_en & ram_0_MPORT_1_mask) begin
      ram_0[ram_0_MPORT_1_addr] <= ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_2_en & ram_0_MPORT_2_mask) begin
      ram_0[ram_0_MPORT_2_addr] <= ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_3_en & ram_0_MPORT_3_mask) begin
      ram_0[ram_0_MPORT_3_addr] <= ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_4_en & ram_0_MPORT_4_mask) begin
      ram_0[ram_0_MPORT_4_addr] <= ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_5_en & ram_0_MPORT_5_mask) begin
      ram_0[ram_0_MPORT_5_addr] <= ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_6_en & ram_0_MPORT_6_mask) begin
      ram_0[ram_0_MPORT_6_addr] <= ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_7_en & ram_0_MPORT_7_mask) begin
      ram_0[ram_0_MPORT_7_addr] <= ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_8_en & ram_0_MPORT_8_mask) begin
      ram_0[ram_0_MPORT_8_addr] <= ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_9_en & ram_0_MPORT_9_mask) begin
      ram_0[ram_0_MPORT_9_addr] <= ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_10_en & ram_0_MPORT_10_mask) begin
      ram_0[ram_0_MPORT_10_addr] <= ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_11_en & ram_0_MPORT_11_mask) begin
      ram_0[ram_0_MPORT_11_addr] <= ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_12_en & ram_0_MPORT_12_mask) begin
      ram_0[ram_0_MPORT_12_addr] <= ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_13_en & ram_0_MPORT_13_mask) begin
      ram_0[ram_0_MPORT_13_addr] <= ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_14_en & ram_0_MPORT_14_mask) begin
      ram_0[ram_0_MPORT_14_addr] <= ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_15_en & ram_0_MPORT_15_mask) begin
      ram_0[ram_0_MPORT_15_addr] <= ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_16_en & ram_0_MPORT_16_mask) begin
      ram_0[ram_0_MPORT_16_addr] <= ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_17_en & ram_0_MPORT_17_mask) begin
      ram_0[ram_0_MPORT_17_addr] <= ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_18_en & ram_0_MPORT_18_mask) begin
      ram_0[ram_0_MPORT_18_addr] <= ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_19_en & ram_0_MPORT_19_mask) begin
      ram_0[ram_0_MPORT_19_addr] <= ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_20_en & ram_0_MPORT_20_mask) begin
      ram_0[ram_0_MPORT_20_addr] <= ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_21_en & ram_0_MPORT_21_mask) begin
      ram_0[ram_0_MPORT_21_addr] <= ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_22_en & ram_0_MPORT_22_mask) begin
      ram_0[ram_0_MPORT_22_addr] <= ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_23_en & ram_0_MPORT_23_mask) begin
      ram_0[ram_0_MPORT_23_addr] <= ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_24_en & ram_0_MPORT_24_mask) begin
      ram_0[ram_0_MPORT_24_addr] <= ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_25_en & ram_0_MPORT_25_mask) begin
      ram_0[ram_0_MPORT_25_addr] <= ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_26_en & ram_0_MPORT_26_mask) begin
      ram_0[ram_0_MPORT_26_addr] <= ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_27_en & ram_0_MPORT_27_mask) begin
      ram_0[ram_0_MPORT_27_addr] <= ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_28_en & ram_0_MPORT_28_mask) begin
      ram_0[ram_0_MPORT_28_addr] <= ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_29_en & ram_0_MPORT_29_mask) begin
      ram_0[ram_0_MPORT_29_addr] <= ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_30_en & ram_0_MPORT_30_mask) begin
      ram_0[ram_0_MPORT_30_addr] <= ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_31_en & ram_0_MPORT_31_mask) begin
      ram_0[ram_0_MPORT_31_addr] <= ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_32_en & ram_0_MPORT_32_mask) begin
      ram_0[ram_0_MPORT_32_addr] <= ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_33_en & ram_0_MPORT_33_mask) begin
      ram_0[ram_0_MPORT_33_addr] <= ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_34_en & ram_0_MPORT_34_mask) begin
      ram_0[ram_0_MPORT_34_addr] <= ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_35_en & ram_0_MPORT_35_mask) begin
      ram_0[ram_0_MPORT_35_addr] <= ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_36_en & ram_0_MPORT_36_mask) begin
      ram_0[ram_0_MPORT_36_addr] <= ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_37_en & ram_0_MPORT_37_mask) begin
      ram_0[ram_0_MPORT_37_addr] <= ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_38_en & ram_0_MPORT_38_mask) begin
      ram_0[ram_0_MPORT_38_addr] <= ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_39_en & ram_0_MPORT_39_mask) begin
      ram_0[ram_0_MPORT_39_addr] <= ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_40_en & ram_0_MPORT_40_mask) begin
      ram_0[ram_0_MPORT_40_addr] <= ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_41_en & ram_0_MPORT_41_mask) begin
      ram_0[ram_0_MPORT_41_addr] <= ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_42_en & ram_0_MPORT_42_mask) begin
      ram_0[ram_0_MPORT_42_addr] <= ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_43_en & ram_0_MPORT_43_mask) begin
      ram_0[ram_0_MPORT_43_addr] <= ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_44_en & ram_0_MPORT_44_mask) begin
      ram_0[ram_0_MPORT_44_addr] <= ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_45_en & ram_0_MPORT_45_mask) begin
      ram_0[ram_0_MPORT_45_addr] <= ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_46_en & ram_0_MPORT_46_mask) begin
      ram_0[ram_0_MPORT_46_addr] <= ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_47_en & ram_0_MPORT_47_mask) begin
      ram_0[ram_0_MPORT_47_addr] <= ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_48_en & ram_0_MPORT_48_mask) begin
      ram_0[ram_0_MPORT_48_addr] <= ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_49_en & ram_0_MPORT_49_mask) begin
      ram_0[ram_0_MPORT_49_addr] <= ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_50_en & ram_0_MPORT_50_mask) begin
      ram_0[ram_0_MPORT_50_addr] <= ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_51_en & ram_0_MPORT_51_mask) begin
      ram_0[ram_0_MPORT_51_addr] <= ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_52_en & ram_0_MPORT_52_mask) begin
      ram_0[ram_0_MPORT_52_addr] <= ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_53_en & ram_0_MPORT_53_mask) begin
      ram_0[ram_0_MPORT_53_addr] <= ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_54_en & ram_0_MPORT_54_mask) begin
      ram_0[ram_0_MPORT_54_addr] <= ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_55_en & ram_0_MPORT_55_mask) begin
      ram_0[ram_0_MPORT_55_addr] <= ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_56_en & ram_0_MPORT_56_mask) begin
      ram_0[ram_0_MPORT_56_addr] <= ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_57_en & ram_0_MPORT_57_mask) begin
      ram_0[ram_0_MPORT_57_addr] <= ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_58_en & ram_0_MPORT_58_mask) begin
      ram_0[ram_0_MPORT_58_addr] <= ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_59_en & ram_0_MPORT_59_mask) begin
      ram_0[ram_0_MPORT_59_addr] <= ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_60_en & ram_0_MPORT_60_mask) begin
      ram_0[ram_0_MPORT_60_addr] <= ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_61_en & ram_0_MPORT_61_mask) begin
      ram_0[ram_0_MPORT_61_addr] <= ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_62_en & ram_0_MPORT_62_mask) begin
      ram_0[ram_0_MPORT_62_addr] <= ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_63_en & ram_0_MPORT_63_mask) begin
      ram_0[ram_0_MPORT_63_addr] <= ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_64_en & ram_0_MPORT_64_mask) begin
      ram_0[ram_0_MPORT_64_addr] <= ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_0_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_1_en & ram_1_MPORT_1_mask) begin
      ram_1[ram_1_MPORT_1_addr] <= ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_2_en & ram_1_MPORT_2_mask) begin
      ram_1[ram_1_MPORT_2_addr] <= ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_3_en & ram_1_MPORT_3_mask) begin
      ram_1[ram_1_MPORT_3_addr] <= ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_4_en & ram_1_MPORT_4_mask) begin
      ram_1[ram_1_MPORT_4_addr] <= ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_5_en & ram_1_MPORT_5_mask) begin
      ram_1[ram_1_MPORT_5_addr] <= ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_6_en & ram_1_MPORT_6_mask) begin
      ram_1[ram_1_MPORT_6_addr] <= ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_7_en & ram_1_MPORT_7_mask) begin
      ram_1[ram_1_MPORT_7_addr] <= ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_8_en & ram_1_MPORT_8_mask) begin
      ram_1[ram_1_MPORT_8_addr] <= ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_9_en & ram_1_MPORT_9_mask) begin
      ram_1[ram_1_MPORT_9_addr] <= ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_10_en & ram_1_MPORT_10_mask) begin
      ram_1[ram_1_MPORT_10_addr] <= ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_11_en & ram_1_MPORT_11_mask) begin
      ram_1[ram_1_MPORT_11_addr] <= ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_12_en & ram_1_MPORT_12_mask) begin
      ram_1[ram_1_MPORT_12_addr] <= ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_13_en & ram_1_MPORT_13_mask) begin
      ram_1[ram_1_MPORT_13_addr] <= ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_14_en & ram_1_MPORT_14_mask) begin
      ram_1[ram_1_MPORT_14_addr] <= ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_15_en & ram_1_MPORT_15_mask) begin
      ram_1[ram_1_MPORT_15_addr] <= ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_16_en & ram_1_MPORT_16_mask) begin
      ram_1[ram_1_MPORT_16_addr] <= ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_17_en & ram_1_MPORT_17_mask) begin
      ram_1[ram_1_MPORT_17_addr] <= ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_18_en & ram_1_MPORT_18_mask) begin
      ram_1[ram_1_MPORT_18_addr] <= ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_19_en & ram_1_MPORT_19_mask) begin
      ram_1[ram_1_MPORT_19_addr] <= ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_20_en & ram_1_MPORT_20_mask) begin
      ram_1[ram_1_MPORT_20_addr] <= ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_21_en & ram_1_MPORT_21_mask) begin
      ram_1[ram_1_MPORT_21_addr] <= ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_22_en & ram_1_MPORT_22_mask) begin
      ram_1[ram_1_MPORT_22_addr] <= ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_23_en & ram_1_MPORT_23_mask) begin
      ram_1[ram_1_MPORT_23_addr] <= ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_24_en & ram_1_MPORT_24_mask) begin
      ram_1[ram_1_MPORT_24_addr] <= ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_25_en & ram_1_MPORT_25_mask) begin
      ram_1[ram_1_MPORT_25_addr] <= ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_26_en & ram_1_MPORT_26_mask) begin
      ram_1[ram_1_MPORT_26_addr] <= ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_27_en & ram_1_MPORT_27_mask) begin
      ram_1[ram_1_MPORT_27_addr] <= ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_28_en & ram_1_MPORT_28_mask) begin
      ram_1[ram_1_MPORT_28_addr] <= ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_29_en & ram_1_MPORT_29_mask) begin
      ram_1[ram_1_MPORT_29_addr] <= ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_30_en & ram_1_MPORT_30_mask) begin
      ram_1[ram_1_MPORT_30_addr] <= ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_31_en & ram_1_MPORT_31_mask) begin
      ram_1[ram_1_MPORT_31_addr] <= ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_32_en & ram_1_MPORT_32_mask) begin
      ram_1[ram_1_MPORT_32_addr] <= ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_33_en & ram_1_MPORT_33_mask) begin
      ram_1[ram_1_MPORT_33_addr] <= ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_34_en & ram_1_MPORT_34_mask) begin
      ram_1[ram_1_MPORT_34_addr] <= ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_35_en & ram_1_MPORT_35_mask) begin
      ram_1[ram_1_MPORT_35_addr] <= ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_36_en & ram_1_MPORT_36_mask) begin
      ram_1[ram_1_MPORT_36_addr] <= ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_37_en & ram_1_MPORT_37_mask) begin
      ram_1[ram_1_MPORT_37_addr] <= ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_38_en & ram_1_MPORT_38_mask) begin
      ram_1[ram_1_MPORT_38_addr] <= ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_39_en & ram_1_MPORT_39_mask) begin
      ram_1[ram_1_MPORT_39_addr] <= ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_40_en & ram_1_MPORT_40_mask) begin
      ram_1[ram_1_MPORT_40_addr] <= ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_41_en & ram_1_MPORT_41_mask) begin
      ram_1[ram_1_MPORT_41_addr] <= ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_42_en & ram_1_MPORT_42_mask) begin
      ram_1[ram_1_MPORT_42_addr] <= ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_43_en & ram_1_MPORT_43_mask) begin
      ram_1[ram_1_MPORT_43_addr] <= ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_44_en & ram_1_MPORT_44_mask) begin
      ram_1[ram_1_MPORT_44_addr] <= ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_45_en & ram_1_MPORT_45_mask) begin
      ram_1[ram_1_MPORT_45_addr] <= ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_46_en & ram_1_MPORT_46_mask) begin
      ram_1[ram_1_MPORT_46_addr] <= ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_47_en & ram_1_MPORT_47_mask) begin
      ram_1[ram_1_MPORT_47_addr] <= ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_48_en & ram_1_MPORT_48_mask) begin
      ram_1[ram_1_MPORT_48_addr] <= ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_49_en & ram_1_MPORT_49_mask) begin
      ram_1[ram_1_MPORT_49_addr] <= ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_50_en & ram_1_MPORT_50_mask) begin
      ram_1[ram_1_MPORT_50_addr] <= ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_51_en & ram_1_MPORT_51_mask) begin
      ram_1[ram_1_MPORT_51_addr] <= ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_52_en & ram_1_MPORT_52_mask) begin
      ram_1[ram_1_MPORT_52_addr] <= ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_53_en & ram_1_MPORT_53_mask) begin
      ram_1[ram_1_MPORT_53_addr] <= ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_54_en & ram_1_MPORT_54_mask) begin
      ram_1[ram_1_MPORT_54_addr] <= ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_55_en & ram_1_MPORT_55_mask) begin
      ram_1[ram_1_MPORT_55_addr] <= ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_56_en & ram_1_MPORT_56_mask) begin
      ram_1[ram_1_MPORT_56_addr] <= ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_57_en & ram_1_MPORT_57_mask) begin
      ram_1[ram_1_MPORT_57_addr] <= ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_58_en & ram_1_MPORT_58_mask) begin
      ram_1[ram_1_MPORT_58_addr] <= ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_59_en & ram_1_MPORT_59_mask) begin
      ram_1[ram_1_MPORT_59_addr] <= ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_60_en & ram_1_MPORT_60_mask) begin
      ram_1[ram_1_MPORT_60_addr] <= ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_61_en & ram_1_MPORT_61_mask) begin
      ram_1[ram_1_MPORT_61_addr] <= ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_62_en & ram_1_MPORT_62_mask) begin
      ram_1[ram_1_MPORT_62_addr] <= ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_63_en & ram_1_MPORT_63_mask) begin
      ram_1[ram_1_MPORT_63_addr] <= ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_64_en & ram_1_MPORT_64_mask) begin
      ram_1[ram_1_MPORT_64_addr] <= ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_1_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_1_en & ram_2_MPORT_1_mask) begin
      ram_2[ram_2_MPORT_1_addr] <= ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_2_en & ram_2_MPORT_2_mask) begin
      ram_2[ram_2_MPORT_2_addr] <= ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_3_en & ram_2_MPORT_3_mask) begin
      ram_2[ram_2_MPORT_3_addr] <= ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_4_en & ram_2_MPORT_4_mask) begin
      ram_2[ram_2_MPORT_4_addr] <= ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_5_en & ram_2_MPORT_5_mask) begin
      ram_2[ram_2_MPORT_5_addr] <= ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_6_en & ram_2_MPORT_6_mask) begin
      ram_2[ram_2_MPORT_6_addr] <= ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_7_en & ram_2_MPORT_7_mask) begin
      ram_2[ram_2_MPORT_7_addr] <= ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_8_en & ram_2_MPORT_8_mask) begin
      ram_2[ram_2_MPORT_8_addr] <= ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_9_en & ram_2_MPORT_9_mask) begin
      ram_2[ram_2_MPORT_9_addr] <= ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_10_en & ram_2_MPORT_10_mask) begin
      ram_2[ram_2_MPORT_10_addr] <= ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_11_en & ram_2_MPORT_11_mask) begin
      ram_2[ram_2_MPORT_11_addr] <= ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_12_en & ram_2_MPORT_12_mask) begin
      ram_2[ram_2_MPORT_12_addr] <= ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_13_en & ram_2_MPORT_13_mask) begin
      ram_2[ram_2_MPORT_13_addr] <= ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_14_en & ram_2_MPORT_14_mask) begin
      ram_2[ram_2_MPORT_14_addr] <= ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_15_en & ram_2_MPORT_15_mask) begin
      ram_2[ram_2_MPORT_15_addr] <= ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_16_en & ram_2_MPORT_16_mask) begin
      ram_2[ram_2_MPORT_16_addr] <= ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_17_en & ram_2_MPORT_17_mask) begin
      ram_2[ram_2_MPORT_17_addr] <= ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_18_en & ram_2_MPORT_18_mask) begin
      ram_2[ram_2_MPORT_18_addr] <= ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_19_en & ram_2_MPORT_19_mask) begin
      ram_2[ram_2_MPORT_19_addr] <= ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_20_en & ram_2_MPORT_20_mask) begin
      ram_2[ram_2_MPORT_20_addr] <= ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_21_en & ram_2_MPORT_21_mask) begin
      ram_2[ram_2_MPORT_21_addr] <= ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_22_en & ram_2_MPORT_22_mask) begin
      ram_2[ram_2_MPORT_22_addr] <= ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_23_en & ram_2_MPORT_23_mask) begin
      ram_2[ram_2_MPORT_23_addr] <= ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_24_en & ram_2_MPORT_24_mask) begin
      ram_2[ram_2_MPORT_24_addr] <= ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_25_en & ram_2_MPORT_25_mask) begin
      ram_2[ram_2_MPORT_25_addr] <= ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_26_en & ram_2_MPORT_26_mask) begin
      ram_2[ram_2_MPORT_26_addr] <= ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_27_en & ram_2_MPORT_27_mask) begin
      ram_2[ram_2_MPORT_27_addr] <= ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_28_en & ram_2_MPORT_28_mask) begin
      ram_2[ram_2_MPORT_28_addr] <= ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_29_en & ram_2_MPORT_29_mask) begin
      ram_2[ram_2_MPORT_29_addr] <= ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_30_en & ram_2_MPORT_30_mask) begin
      ram_2[ram_2_MPORT_30_addr] <= ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_31_en & ram_2_MPORT_31_mask) begin
      ram_2[ram_2_MPORT_31_addr] <= ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_32_en & ram_2_MPORT_32_mask) begin
      ram_2[ram_2_MPORT_32_addr] <= ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_33_en & ram_2_MPORT_33_mask) begin
      ram_2[ram_2_MPORT_33_addr] <= ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_34_en & ram_2_MPORT_34_mask) begin
      ram_2[ram_2_MPORT_34_addr] <= ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_35_en & ram_2_MPORT_35_mask) begin
      ram_2[ram_2_MPORT_35_addr] <= ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_36_en & ram_2_MPORT_36_mask) begin
      ram_2[ram_2_MPORT_36_addr] <= ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_37_en & ram_2_MPORT_37_mask) begin
      ram_2[ram_2_MPORT_37_addr] <= ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_38_en & ram_2_MPORT_38_mask) begin
      ram_2[ram_2_MPORT_38_addr] <= ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_39_en & ram_2_MPORT_39_mask) begin
      ram_2[ram_2_MPORT_39_addr] <= ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_40_en & ram_2_MPORT_40_mask) begin
      ram_2[ram_2_MPORT_40_addr] <= ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_41_en & ram_2_MPORT_41_mask) begin
      ram_2[ram_2_MPORT_41_addr] <= ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_42_en & ram_2_MPORT_42_mask) begin
      ram_2[ram_2_MPORT_42_addr] <= ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_43_en & ram_2_MPORT_43_mask) begin
      ram_2[ram_2_MPORT_43_addr] <= ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_44_en & ram_2_MPORT_44_mask) begin
      ram_2[ram_2_MPORT_44_addr] <= ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_45_en & ram_2_MPORT_45_mask) begin
      ram_2[ram_2_MPORT_45_addr] <= ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_46_en & ram_2_MPORT_46_mask) begin
      ram_2[ram_2_MPORT_46_addr] <= ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_47_en & ram_2_MPORT_47_mask) begin
      ram_2[ram_2_MPORT_47_addr] <= ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_48_en & ram_2_MPORT_48_mask) begin
      ram_2[ram_2_MPORT_48_addr] <= ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_49_en & ram_2_MPORT_49_mask) begin
      ram_2[ram_2_MPORT_49_addr] <= ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_50_en & ram_2_MPORT_50_mask) begin
      ram_2[ram_2_MPORT_50_addr] <= ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_51_en & ram_2_MPORT_51_mask) begin
      ram_2[ram_2_MPORT_51_addr] <= ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_52_en & ram_2_MPORT_52_mask) begin
      ram_2[ram_2_MPORT_52_addr] <= ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_53_en & ram_2_MPORT_53_mask) begin
      ram_2[ram_2_MPORT_53_addr] <= ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_54_en & ram_2_MPORT_54_mask) begin
      ram_2[ram_2_MPORT_54_addr] <= ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_55_en & ram_2_MPORT_55_mask) begin
      ram_2[ram_2_MPORT_55_addr] <= ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_56_en & ram_2_MPORT_56_mask) begin
      ram_2[ram_2_MPORT_56_addr] <= ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_57_en & ram_2_MPORT_57_mask) begin
      ram_2[ram_2_MPORT_57_addr] <= ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_58_en & ram_2_MPORT_58_mask) begin
      ram_2[ram_2_MPORT_58_addr] <= ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_59_en & ram_2_MPORT_59_mask) begin
      ram_2[ram_2_MPORT_59_addr] <= ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_60_en & ram_2_MPORT_60_mask) begin
      ram_2[ram_2_MPORT_60_addr] <= ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_61_en & ram_2_MPORT_61_mask) begin
      ram_2[ram_2_MPORT_61_addr] <= ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_62_en & ram_2_MPORT_62_mask) begin
      ram_2[ram_2_MPORT_62_addr] <= ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_63_en & ram_2_MPORT_63_mask) begin
      ram_2[ram_2_MPORT_63_addr] <= ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_64_en & ram_2_MPORT_64_mask) begin
      ram_2[ram_2_MPORT_64_addr] <= ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_2_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_1_en & ram_3_MPORT_1_mask) begin
      ram_3[ram_3_MPORT_1_addr] <= ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_2_en & ram_3_MPORT_2_mask) begin
      ram_3[ram_3_MPORT_2_addr] <= ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_3_en & ram_3_MPORT_3_mask) begin
      ram_3[ram_3_MPORT_3_addr] <= ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_4_en & ram_3_MPORT_4_mask) begin
      ram_3[ram_3_MPORT_4_addr] <= ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_5_en & ram_3_MPORT_5_mask) begin
      ram_3[ram_3_MPORT_5_addr] <= ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_6_en & ram_3_MPORT_6_mask) begin
      ram_3[ram_3_MPORT_6_addr] <= ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_7_en & ram_3_MPORT_7_mask) begin
      ram_3[ram_3_MPORT_7_addr] <= ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_8_en & ram_3_MPORT_8_mask) begin
      ram_3[ram_3_MPORT_8_addr] <= ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_9_en & ram_3_MPORT_9_mask) begin
      ram_3[ram_3_MPORT_9_addr] <= ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_10_en & ram_3_MPORT_10_mask) begin
      ram_3[ram_3_MPORT_10_addr] <= ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_11_en & ram_3_MPORT_11_mask) begin
      ram_3[ram_3_MPORT_11_addr] <= ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_12_en & ram_3_MPORT_12_mask) begin
      ram_3[ram_3_MPORT_12_addr] <= ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_13_en & ram_3_MPORT_13_mask) begin
      ram_3[ram_3_MPORT_13_addr] <= ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_14_en & ram_3_MPORT_14_mask) begin
      ram_3[ram_3_MPORT_14_addr] <= ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_15_en & ram_3_MPORT_15_mask) begin
      ram_3[ram_3_MPORT_15_addr] <= ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_16_en & ram_3_MPORT_16_mask) begin
      ram_3[ram_3_MPORT_16_addr] <= ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_17_en & ram_3_MPORT_17_mask) begin
      ram_3[ram_3_MPORT_17_addr] <= ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_18_en & ram_3_MPORT_18_mask) begin
      ram_3[ram_3_MPORT_18_addr] <= ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_19_en & ram_3_MPORT_19_mask) begin
      ram_3[ram_3_MPORT_19_addr] <= ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_20_en & ram_3_MPORT_20_mask) begin
      ram_3[ram_3_MPORT_20_addr] <= ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_21_en & ram_3_MPORT_21_mask) begin
      ram_3[ram_3_MPORT_21_addr] <= ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_22_en & ram_3_MPORT_22_mask) begin
      ram_3[ram_3_MPORT_22_addr] <= ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_23_en & ram_3_MPORT_23_mask) begin
      ram_3[ram_3_MPORT_23_addr] <= ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_24_en & ram_3_MPORT_24_mask) begin
      ram_3[ram_3_MPORT_24_addr] <= ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_25_en & ram_3_MPORT_25_mask) begin
      ram_3[ram_3_MPORT_25_addr] <= ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_26_en & ram_3_MPORT_26_mask) begin
      ram_3[ram_3_MPORT_26_addr] <= ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_27_en & ram_3_MPORT_27_mask) begin
      ram_3[ram_3_MPORT_27_addr] <= ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_28_en & ram_3_MPORT_28_mask) begin
      ram_3[ram_3_MPORT_28_addr] <= ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_29_en & ram_3_MPORT_29_mask) begin
      ram_3[ram_3_MPORT_29_addr] <= ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_30_en & ram_3_MPORT_30_mask) begin
      ram_3[ram_3_MPORT_30_addr] <= ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_31_en & ram_3_MPORT_31_mask) begin
      ram_3[ram_3_MPORT_31_addr] <= ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_32_en & ram_3_MPORT_32_mask) begin
      ram_3[ram_3_MPORT_32_addr] <= ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_33_en & ram_3_MPORT_33_mask) begin
      ram_3[ram_3_MPORT_33_addr] <= ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_34_en & ram_3_MPORT_34_mask) begin
      ram_3[ram_3_MPORT_34_addr] <= ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_35_en & ram_3_MPORT_35_mask) begin
      ram_3[ram_3_MPORT_35_addr] <= ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_36_en & ram_3_MPORT_36_mask) begin
      ram_3[ram_3_MPORT_36_addr] <= ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_37_en & ram_3_MPORT_37_mask) begin
      ram_3[ram_3_MPORT_37_addr] <= ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_38_en & ram_3_MPORT_38_mask) begin
      ram_3[ram_3_MPORT_38_addr] <= ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_39_en & ram_3_MPORT_39_mask) begin
      ram_3[ram_3_MPORT_39_addr] <= ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_40_en & ram_3_MPORT_40_mask) begin
      ram_3[ram_3_MPORT_40_addr] <= ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_41_en & ram_3_MPORT_41_mask) begin
      ram_3[ram_3_MPORT_41_addr] <= ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_42_en & ram_3_MPORT_42_mask) begin
      ram_3[ram_3_MPORT_42_addr] <= ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_43_en & ram_3_MPORT_43_mask) begin
      ram_3[ram_3_MPORT_43_addr] <= ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_44_en & ram_3_MPORT_44_mask) begin
      ram_3[ram_3_MPORT_44_addr] <= ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_45_en & ram_3_MPORT_45_mask) begin
      ram_3[ram_3_MPORT_45_addr] <= ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_46_en & ram_3_MPORT_46_mask) begin
      ram_3[ram_3_MPORT_46_addr] <= ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_47_en & ram_3_MPORT_47_mask) begin
      ram_3[ram_3_MPORT_47_addr] <= ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_48_en & ram_3_MPORT_48_mask) begin
      ram_3[ram_3_MPORT_48_addr] <= ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_49_en & ram_3_MPORT_49_mask) begin
      ram_3[ram_3_MPORT_49_addr] <= ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_50_en & ram_3_MPORT_50_mask) begin
      ram_3[ram_3_MPORT_50_addr] <= ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_51_en & ram_3_MPORT_51_mask) begin
      ram_3[ram_3_MPORT_51_addr] <= ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_52_en & ram_3_MPORT_52_mask) begin
      ram_3[ram_3_MPORT_52_addr] <= ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_53_en & ram_3_MPORT_53_mask) begin
      ram_3[ram_3_MPORT_53_addr] <= ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_54_en & ram_3_MPORT_54_mask) begin
      ram_3[ram_3_MPORT_54_addr] <= ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_55_en & ram_3_MPORT_55_mask) begin
      ram_3[ram_3_MPORT_55_addr] <= ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_56_en & ram_3_MPORT_56_mask) begin
      ram_3[ram_3_MPORT_56_addr] <= ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_57_en & ram_3_MPORT_57_mask) begin
      ram_3[ram_3_MPORT_57_addr] <= ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_58_en & ram_3_MPORT_58_mask) begin
      ram_3[ram_3_MPORT_58_addr] <= ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_59_en & ram_3_MPORT_59_mask) begin
      ram_3[ram_3_MPORT_59_addr] <= ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_60_en & ram_3_MPORT_60_mask) begin
      ram_3[ram_3_MPORT_60_addr] <= ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_61_en & ram_3_MPORT_61_mask) begin
      ram_3[ram_3_MPORT_61_addr] <= ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_62_en & ram_3_MPORT_62_mask) begin
      ram_3[ram_3_MPORT_62_addr] <= ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_63_en & ram_3_MPORT_63_mask) begin
      ram_3[ram_3_MPORT_63_addr] <= ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_64_en & ram_3_MPORT_64_mask) begin
      ram_3[ram_3_MPORT_64_addr] <= ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_3_io_rdata_MPORT_addr_pipe_0 <= io_addr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[1:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[1:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SRAMTemplate_10(
  input        clock,
  input        reset,
  input  [5:0] io_r_addr,
  output [7:0] io_r_data,
  input        io_w_en,
  input  [5:0] io_w_addr,
  input  [7:0] io_w_data,
  input  [3:0] io_w_mask
);
  wire  sram_clock; // @[SRAM.scala 188:31]
  wire  sram_reset; // @[SRAM.scala 188:31]
  wire [5:0] sram_io_addr; // @[SRAM.scala 188:31]
  wire  sram_io_rw; // @[SRAM.scala 188:31]
  wire [7:0] sram_io_wdata; // @[SRAM.scala 188:31]
  wire [3:0] sram_io_wmask; // @[SRAM.scala 188:31]
  wire [7:0] sram_io_rdata; // @[SRAM.scala 188:31]
  BankRam1P_1_10 sram ( // @[SRAM.scala 188:31]
    .clock(sram_clock),
    .reset(sram_reset),
    .io_addr(sram_io_addr),
    .io_rw(sram_io_rw),
    .io_wdata(sram_io_wdata),
    .io_wmask(sram_io_wmask),
    .io_rdata(sram_io_rdata)
  );
  assign io_r_data = sram_io_rdata; // @[SRAM.scala 214:15]
  assign sram_clock = clock;
  assign sram_reset = reset;
  assign sram_io_addr = io_w_en ? io_w_addr : io_r_addr; // @[SRAM.scala 102:17 219:19 90:17]
  assign sram_io_rw = io_w_en; // @[SRAM.scala 101:15 219:19 88:15]
  assign sram_io_wdata = io_w_data; // @[SRAM.scala 219:19 89:18]
  assign sram_io_wmask = io_w_mask; // @[SRAM.scala 219:19 91:45]
endmodule
module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3,
  output  io_out_4,
  output  io_out_5,
  output  io_out_6,
  output  io_out_7
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
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 55:49]
  reg  state_1; // @[PRNG.scala 55:49]
  reg  state_2; // @[PRNG.scala 55:49]
  reg  state_3; // @[PRNG.scala 55:49]
  reg  state_4; // @[PRNG.scala 55:49]
  reg  state_5; // @[PRNG.scala 55:49]
  reg  state_6; // @[PRNG.scala 55:49]
  reg  state_7; // @[PRNG.scala 55:49]
  wire  _T_2 = state_7 ^ state_5 ^ state_4 ^ state_3; // @[LFSR.scala 15:41]
  assign io_out_0 = state_0; // @[PRNG.scala 78:10]
  assign io_out_1 = state_1; // @[PRNG.scala 78:10]
  assign io_out_2 = state_2; // @[PRNG.scala 78:10]
  assign io_out_3 = state_3; // @[PRNG.scala 78:10]
  assign io_out_4 = state_4; // @[PRNG.scala 78:10]
  assign io_out_5 = state_5; // @[PRNG.scala 78:10]
  assign io_out_6 = state_6; // @[PRNG.scala 78:10]
  assign io_out_7 = state_7; // @[PRNG.scala 78:10]
  always @(posedge clock) begin
    state_0 <= reset | _T_2; // @[PRNG.scala 55:{49,49}]
    if (reset) begin // @[PRNG.scala 55:49]
      state_1 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_1 <= state_0;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_2 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_2 <= state_1;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_3 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_3 <= state_2;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_4 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_4 <= state_3;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_5 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_5 <= state_4;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_6 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_6 <= state_5;
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_7 <= 1'h0; // @[PRNG.scala 55:49]
    end else begin
      state_7 <= state_6;
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
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  state_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  state_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_7 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DCacheDirectory(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_valid,
  output        io_read_resp_bits_hit,
  output [3:0]  io_read_resp_bits_chosenWay,
  output        io_read_resp_bits_isDirtyWay,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [3:0]  io_write_req_bits_way,
  input  [1:0]  io_write_req_bits_meta
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
  wire  tagArray_clock; // @[Directory.scala 60:26]
  wire  tagArray_reset; // @[Directory.scala 60:26]
  wire [5:0] tagArray_io_r_addr; // @[Directory.scala 60:26]
  wire [91:0] tagArray_io_r_data; // @[Directory.scala 60:26]
  wire  tagArray_io_w_en; // @[Directory.scala 60:26]
  wire [5:0] tagArray_io_w_addr; // @[Directory.scala 60:26]
  wire [91:0] tagArray_io_w_data; // @[Directory.scala 60:26]
  wire [3:0] tagArray_io_w_mask; // @[Directory.scala 60:26]
  wire  tagValidArray_clock; // @[Directory.scala 61:31]
  wire  tagValidArray_reset; // @[Directory.scala 61:31]
  wire [5:0] tagValidArray_io_r_addr; // @[Directory.scala 61:31]
  wire [3:0] tagValidArray_io_r_data; // @[Directory.scala 61:31]
  wire  tagValidArray_io_w_en; // @[Directory.scala 61:31]
  wire [5:0] tagValidArray_io_w_addr; // @[Directory.scala 61:31]
  wire [3:0] tagValidArray_io_w_mask; // @[Directory.scala 61:31]
  wire  metaArray_clock; // @[Directory.scala 62:27]
  wire  metaArray_reset; // @[Directory.scala 62:27]
  wire [5:0] metaArray_io_r_addr; // @[Directory.scala 62:27]
  wire [7:0] metaArray_io_r_data; // @[Directory.scala 62:27]
  wire  metaArray_io_w_en; // @[Directory.scala 62:27]
  wire [5:0] metaArray_io_w_addr; // @[Directory.scala 62:27]
  wire [7:0] metaArray_io_w_data; // @[Directory.scala 62:27]
  wire [3:0] metaArray_io_w_mask; // @[Directory.scala 62:27]
  wire  replaceWay_lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  _rAddr_T = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] rAddr_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _rAddr_T ? io_read_req_bits_addr : rAddr_r; // @[Reg.scala 19:16 20:{18,22}]
  wire [22:0] rTag = _GEN_0[31:9]; // @[Parameters.scala 46:11]
  wire  _wAddr_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] wAddr_r; // @[Reg.scala 19:16]
  wire [31:0] wAddr = _wAddr_T ? io_write_req_bits_addr : wAddr_r; // @[Directory.scala 52:20]
  wire [22:0] wTag = wAddr[31:9]; // @[Parameters.scala 46:11]
  wire [1:0] _T_4 = io_write_req_bits_way[0] + io_write_req_bits_way[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_6 = io_write_req_bits_way[2] + io_write_req_bits_way[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_8 = _T_4 + _T_6; // @[Bitwise.scala 51:90]
  wire  _T_22 = ~reset; // @[Directory.scala 58:11]
  wire [91:0] _WIRE_1 = tagArray_io_r_data; // @[Directory.scala 70:{44,44}]
  wire [22:0] tagRdVec_0 = _WIRE_1[22:0]; // @[Directory.scala 70:44]
  wire [22:0] tagRdVec_1 = _WIRE_1[45:23]; // @[Directory.scala 70:44]
  wire [22:0] tagRdVec_2 = _WIRE_1[68:46]; // @[Directory.scala 70:44]
  wire [22:0] tagRdVec_3 = _WIRE_1[91:69]; // @[Directory.scala 70:44]
  wire [3:0] _WIRE_3 = tagValidArray_io_r_data; // @[Directory.scala 75:{54,54}]
  wire  tagValidRdVec_0 = _WIRE_3[0]; // @[Directory.scala 75:54]
  wire  tagValidRdVec_1 = _WIRE_3[1]; // @[Directory.scala 75:54]
  wire  tagValidRdVec_2 = _WIRE_3[2]; // @[Directory.scala 75:54]
  wire  tagValidRdVec_3 = _WIRE_3[3]; // @[Directory.scala 75:54]
  wire [7:0] _WIRE_5 = metaArray_io_r_data; // @[Directory.scala 81:{46,46}]
  wire  metaRdVec_0_valid = _WIRE_5[0]; // @[Directory.scala 81:46]
  wire  metaRdVec_0_dirty = _WIRE_5[1]; // @[Directory.scala 81:46]
  wire  metaRdVec_1_valid = _WIRE_5[2]; // @[Directory.scala 81:46]
  wire  metaRdVec_1_dirty = _WIRE_5[3]; // @[Directory.scala 81:46]
  wire  metaRdVec_2_valid = _WIRE_5[4]; // @[Directory.scala 81:46]
  wire  metaRdVec_2_dirty = _WIRE_5[5]; // @[Directory.scala 81:46]
  wire  metaRdVec_3_valid = _WIRE_5[6]; // @[Directory.scala 81:46]
  wire  metaRdVec_3_dirty = _WIRE_5[7]; // @[Directory.scala 81:46]
  wire  tagMatchVec_0 = tagRdVec_0 == rTag & tagValidRdVec_0; // @[Directory.scala 85:79]
  wire  tagMatchVec_1 = tagRdVec_1 == rTag & tagValidRdVec_1; // @[Directory.scala 85:79]
  wire  tagMatchVec_2 = tagRdVec_2 == rTag & tagValidRdVec_2; // @[Directory.scala 85:79]
  wire  tagMatchVec_3 = tagRdVec_3 == rTag & tagValidRdVec_3; // @[Directory.scala 85:79]
  wire  _matchWayOH_T = tagMatchVec_0 & metaRdVec_0_valid; // @[Directory.scala 88:77]
  wire  _matchWayOH_T_1 = tagMatchVec_1 & metaRdVec_1_valid; // @[Directory.scala 88:77]
  wire  _matchWayOH_T_2 = tagMatchVec_2 & metaRdVec_2_valid; // @[Directory.scala 88:77]
  wire  _matchWayOH_T_3 = tagMatchVec_3 & metaRdVec_3_valid; // @[Directory.scala 88:77]
  wire [3:0] matchWayOH = {_matchWayOH_T_3,_matchWayOH_T_2,_matchWayOH_T_1,_matchWayOH_T}; // @[Cat.scala 33:92]
  wire  invalidWayVec_0 = ~metaRdVec_0_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_1 = ~metaRdVec_1_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_2 = ~metaRdVec_2_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_3 = ~metaRdVec_3_valid; // @[Directory.scala 89:53]
  wire [3:0] _invalidWayOH_T_8 = invalidWayVec_2 ? 4'h4 : 4'h8; // @[Mux.scala 47:70]
  wire [3:0] _invalidWayOH_T_9 = invalidWayVec_1 ? 4'h2 : _invalidWayOH_T_8; // @[Mux.scala 47:70]
  wire [3:0] invalidWayOH = invalidWayVec_0 ? 4'h1 : _invalidWayOH_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hasInvalidWay_T = {invalidWayVec_0,invalidWayVec_1,invalidWayVec_2,invalidWayVec_3}; // @[Cat.scala 33:92]
  wire  hasInvalidWay = |_hasInvalidWay_T; // @[Directory.scala 91:44]
  wire [7:0] replaceWay_lfsr = {replaceWay_lfsr_prng_io_out_7,replaceWay_lfsr_prng_io_out_6,
    replaceWay_lfsr_prng_io_out_5,replaceWay_lfsr_prng_io_out_4,replaceWay_lfsr_prng_io_out_3,
    replaceWay_lfsr_prng_io_out_2,replaceWay_lfsr_prng_io_out_1,replaceWay_lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [1:0] replaceWay_outputWay_shiftAmount = replaceWay_lfsr[1:0]; // @[DCache.scala 61:39]
  wire [3:0] replaceWay = 4'h1 << replaceWay_outputWay_shiftAmount; // @[OneHot.scala 64:12]
  wire  _replaceWayReg_T = ~io_read_req_valid; // @[Directory.scala 93:65]
  reg [3:0] replaceWayReg; // @[Reg.scala 19:16]
  wire  isHit = |matchWayOH; // @[Directory.scala 95:33]
  wire [3:0] _choseWayOH_T = hasInvalidWay ? invalidWayOH : replaceWayReg; // @[Directory.scala 97:48]
  wire [3:0] choseWayOH = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 97:25]
  wire [3:0] _isDirtyWay_T = {metaRdVec_3_dirty,metaRdVec_2_dirty,metaRdVec_1_dirty,metaRdVec_0_dirty}; // @[Cat.scala 33:92]
  wire [3:0] _isDirtyWay_T_1 = choseWayOH & _isDirtyWay_T; // @[Directory.scala 98:35]
  wire [3:0] _isDirtyWay_T_2 = {metaRdVec_3_valid,metaRdVec_2_valid,metaRdVec_1_valid,metaRdVec_0_valid}; // @[Cat.scala 33:92]
  wire [3:0] _isDirtyWay_T_3 = _isDirtyWay_T_1 & _isDirtyWay_T_2; // @[Directory.scala 98:63]
  wire  isDirtyWay = |_isDirtyWay_T_3; // @[Directory.scala 98:93]
  wire [1:0] _T_44 = choseWayOH[0] + choseWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_46 = choseWayOH[2] + choseWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_48 = _T_44 + _T_46; // @[Bitwise.scala 51:90]
  reg  io_read_resp_valid_REG; // @[Directory.scala 103:34]
  reg  io_read_resp_bits_isDirtyWay_REG; // @[Directory.scala 105:100]
  reg  io_read_resp_bits_isDirtyWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_chosenWay_REG; // @[Directory.scala 106:99]
  reg [3:0] io_read_resp_bits_chosenWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_hit_REG; // @[Directory.scala 107:83]
  reg  io_read_resp_bits_hit_r; // @[Reg.scala 19:16]
  wire [45:0] _tagArray_io_w_data_T = {wTag,wTag}; // @[Cat.scala 33:92]
  wire [3:0] _metaArray_io_w_data_T = {io_write_req_bits_meta,io_write_req_bits_meta}; // @[Cat.scala 33:92]
  SRAMTemplate_8 tagArray ( // @[Directory.scala 60:26]
    .clock(tagArray_clock),
    .reset(tagArray_reset),
    .io_r_addr(tagArray_io_r_addr),
    .io_r_data(tagArray_io_r_data),
    .io_w_en(tagArray_io_w_en),
    .io_w_addr(tagArray_io_w_addr),
    .io_w_data(tagArray_io_w_data),
    .io_w_mask(tagArray_io_w_mask)
  );
  SRAMTemplate_9 tagValidArray ( // @[Directory.scala 61:31]
    .clock(tagValidArray_clock),
    .reset(tagValidArray_reset),
    .io_r_addr(tagValidArray_io_r_addr),
    .io_r_data(tagValidArray_io_r_data),
    .io_w_en(tagValidArray_io_w_en),
    .io_w_addr(tagValidArray_io_w_addr),
    .io_w_mask(tagValidArray_io_w_mask)
  );
  SRAMTemplate_10 metaArray ( // @[Directory.scala 62:27]
    .clock(metaArray_clock),
    .reset(metaArray_reset),
    .io_r_addr(metaArray_io_r_addr),
    .io_r_data(metaArray_io_r_data),
    .io_w_en(metaArray_io_w_en),
    .io_w_addr(metaArray_io_w_addr),
    .io_w_data(metaArray_io_w_data),
    .io_w_mask(metaArray_io_w_mask)
  );
  MaxPeriodFibonacciLFSR replaceWay_lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(replaceWay_lfsr_prng_clock),
    .reset(replaceWay_lfsr_prng_reset),
    .io_out_0(replaceWay_lfsr_prng_io_out_0),
    .io_out_1(replaceWay_lfsr_prng_io_out_1),
    .io_out_2(replaceWay_lfsr_prng_io_out_2),
    .io_out_3(replaceWay_lfsr_prng_io_out_3),
    .io_out_4(replaceWay_lfsr_prng_io_out_4),
    .io_out_5(replaceWay_lfsr_prng_io_out_5),
    .io_out_6(replaceWay_lfsr_prng_io_out_6),
    .io_out_7(replaceWay_lfsr_prng_io_out_7)
  );
  assign io_read_req_ready = 1'h1; // @[Directory.scala 64:23]
  assign io_read_resp_valid = io_read_resp_valid_REG; // @[Directory.scala 103:24]
  assign io_read_resp_bits_hit = _rAddr_T ? isHit : io_read_resp_bits_hit_r; // @[Directory.scala 107:33]
  assign io_read_resp_bits_chosenWay = _rAddr_T ? choseWayOH : io_read_resp_bits_chosenWay_r; // @[Directory.scala 106:39]
  assign io_read_resp_bits_isDirtyWay = _rAddr_T ? isDirtyWay : io_read_resp_bits_isDirtyWay_r; // @[Directory.scala 105:40]
  assign io_write_req_ready = 1'h1; // @[Directory.scala 65:24]
  assign tagArray_clock = clock;
  assign tagArray_reset = reset;
  assign tagArray_io_r_addr = _GEN_0[8:3]; // @[Parameters.scala 50:11]
  assign tagArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagArray_io_w_addr = wAddr[8:3]; // @[Parameters.scala 50:11]
  assign tagArray_io_w_data = {_tagArray_io_w_data_T,_tagArray_io_w_data_T}; // @[Cat.scala 33:92]
  assign tagArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 116:28]
  assign tagValidArray_clock = clock;
  assign tagValidArray_reset = reset;
  assign tagValidArray_io_r_addr = _GEN_0[8:3]; // @[Parameters.scala 50:11]
  assign tagValidArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagValidArray_io_w_addr = wAddr[8:3]; // @[Parameters.scala 50:11]
  assign tagValidArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 121:33]
  assign metaArray_clock = clock;
  assign metaArray_reset = reset;
  assign metaArray_io_r_addr = _GEN_0[8:3]; // @[Parameters.scala 50:11]
  assign metaArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign metaArray_io_w_addr = wAddr[8:3]; // @[Parameters.scala 50:11]
  assign metaArray_io_w_data = {_metaArray_io_w_data_T,_metaArray_io_w_data_T}; // @[Cat.scala 33:92]
  assign metaArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 126:29]
  assign replaceWay_lfsr_prng_clock = clock;
  assign replaceWay_lfsr_prng_reset = reset;
  always @(posedge clock) begin
    if (_rAddr_T) begin // @[Reg.scala 20:18]
      rAddr_r <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_rAddr_T) begin // @[Reg.scala 20:18]
      wAddr_r <= io_write_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_replaceWayReg_T) begin // @[Reg.scala 20:18]
      replaceWayReg <= replaceWay; // @[Reg.scala 20:22]
    end
    io_read_resp_valid_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    io_read_resp_bits_isDirtyWay_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_isDirtyWay_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_isDirtyWay_r <= isDirtyWay; // @[Reg.scala 20:22]
    end
    io_read_resp_bits_chosenWay_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_chosenWay_REG) begin // @[Reg.scala 20:18]
      if (isHit) begin // @[Directory.scala 97:25]
        io_read_resp_bits_chosenWay_r <= matchWayOH;
      end else if (hasInvalidWay) begin // @[Directory.scala 97:48]
        if (invalidWayVec_0) begin // @[Mux.scala 47:70]
          io_read_resp_bits_chosenWay_r <= 4'h1;
        end else begin
          io_read_resp_bits_chosenWay_r <= _invalidWayOH_T_9;
        end
      end else begin
        io_read_resp_bits_chosenWay_r <= replaceWayReg;
      end
    end
    io_read_resp_bits_hit_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_hit_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_hit_r <= isHit; // @[Reg.scala 20:22]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_8 < 3'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error directory write way has multiple valid bit! ==>%d\n    at Directory.scala:58 assert(PopCount(wWay) < 2.U, cf\"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}\")\n"
            ,_T_8); // @[Directory.scala 58:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_8 < 3'h2) & ~reset) begin
          $fatal; // @[Directory.scala 58:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_22 & ~(_T_48 == 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error chosenWay has multiple valid bit!\n    at Directory.scala:100 assert(PopCount(choseWayOH) === 1.U, \"Error chosenWay has multiple valid bit!\")\n"
            ); // @[Directory.scala 100:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_48 == 3'h1) & _T_22) begin
          $fatal; // @[Directory.scala 100:11]
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
  rAddr_r = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  wAddr_r = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  replaceWayReg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  io_read_resp_valid_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_r = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  io_read_resp_bits_hit_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_read_resp_bits_hit_r = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  output [2:0]  io_tlbus_req_bits_opcode,
  output [31:0] io_tlbus_req_bits_address,
  output [31:0] io_tlbus_req_bits_data,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data
);
  wire  loadPipe_clock; // @[ICache.scala 32:26]
  wire  loadPipe_reset; // @[ICache.scala 32:26]
  wire  loadPipe_io_load_req_ready; // @[ICache.scala 32:26]
  wire  loadPipe_io_load_req_valid; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_load_req_bits_addr; // @[ICache.scala 32:26]
  wire  loadPipe_io_load_resp_valid; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_load_resp_bits_data; // @[ICache.scala 32:26]
  wire [1:0] loadPipe_io_load_resp_bits_stageID; // @[ICache.scala 32:26]
  wire  loadPipe_io_dir_read_req_valid; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dir_read_req_bits_addr; // @[ICache.scala 32:26]
  wire  loadPipe_io_dir_read_resp_valid; // @[ICache.scala 32:26]
  wire  loadPipe_io_dir_read_resp_bits_hit; // @[ICache.scala 32:26]
  wire [3:0] loadPipe_io_dir_read_resp_bits_chosenWay; // @[ICache.scala 32:26]
  wire  loadPipe_io_dir_read_resp_bits_isDirtyWay; // @[ICache.scala 32:26]
  wire  loadPipe_io_dir_write_req_valid; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dir_write_req_bits_addr; // @[ICache.scala 32:26]
  wire [3:0] loadPipe_io_dir_write_req_bits_way; // @[ICache.scala 32:26]
  wire [1:0] loadPipe_io_dir_write_req_bits_meta; // @[ICache.scala 32:26]
  wire  loadPipe_io_dataBank_read_req_valid; // @[ICache.scala 32:26]
  wire [5:0] loadPipe_io_dataBank_read_req_bits_set; // @[ICache.scala 32:26]
  wire [1:0] loadPipe_io_dataBank_read_req_bits_blockSelOH; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_0; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_1; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_2; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_3; // @[ICache.scala 32:26]
  wire [127:0] loadPipe_io_dataBank_read_resp_bits_blockData_0; // @[ICache.scala 32:26]
  wire [127:0] loadPipe_io_dataBank_read_resp_bits_blockData_1; // @[ICache.scala 32:26]
  wire  loadPipe_io_dataBank_write_req_valid; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_dataBank_write_req_bits_data; // @[ICache.scala 32:26]
  wire [5:0] loadPipe_io_dataBank_write_req_bits_set; // @[ICache.scala 32:26]
  wire [1:0] loadPipe_io_dataBank_write_req_bits_blockSelOH; // @[ICache.scala 32:26]
  wire [3:0] loadPipe_io_dataBank_write_req_bits_way; // @[ICache.scala 32:26]
  wire  loadPipe_io_tlbus_req_ready; // @[ICache.scala 32:26]
  wire  loadPipe_io_tlbus_req_valid; // @[ICache.scala 32:26]
  wire [2:0] loadPipe_io_tlbus_req_bits_opcode; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_tlbus_req_bits_address; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_tlbus_req_bits_data; // @[ICache.scala 32:26]
  wire  loadPipe_io_tlbus_resp_ready; // @[ICache.scala 32:26]
  wire  loadPipe_io_tlbus_resp_valid; // @[ICache.scala 32:26]
  wire [2:0] loadPipe_io_tlbus_resp_bits_opcode; // @[ICache.scala 32:26]
  wire [31:0] loadPipe_io_tlbus_resp_bits_data; // @[ICache.scala 32:26]
  wire  dataBankArray_clock; // @[ICache.scala 34:31]
  wire  dataBankArray_reset; // @[ICache.scala 34:31]
  wire  dataBankArray_io_read_req_ready; // @[ICache.scala 34:31]
  wire  dataBankArray_io_read_req_valid; // @[ICache.scala 34:31]
  wire [5:0] dataBankArray_io_read_req_bits_set; // @[ICache.scala 34:31]
  wire [1:0] dataBankArray_io_read_req_bits_blockSelOH; // @[ICache.scala 34:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_0; // @[ICache.scala 34:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_1; // @[ICache.scala 34:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_2; // @[ICache.scala 34:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_3; // @[ICache.scala 34:31]
  wire [127:0] dataBankArray_io_read_resp_bits_blockData_0; // @[ICache.scala 34:31]
  wire [127:0] dataBankArray_io_read_resp_bits_blockData_1; // @[ICache.scala 34:31]
  wire  dataBankArray_io_write_req_ready; // @[ICache.scala 34:31]
  wire  dataBankArray_io_write_req_valid; // @[ICache.scala 34:31]
  wire [31:0] dataBankArray_io_write_req_bits_data; // @[ICache.scala 34:31]
  wire [5:0] dataBankArray_io_write_req_bits_set; // @[ICache.scala 34:31]
  wire [1:0] dataBankArray_io_write_req_bits_blockSelOH; // @[ICache.scala 34:31]
  wire [3:0] dataBankArray_io_write_req_bits_way; // @[ICache.scala 34:31]
  wire [3:0] dataBankArray_io_write_req_bits_mask; // @[ICache.scala 34:31]
  wire  directory_clock; // @[ICache.scala 35:27]
  wire  directory_reset; // @[ICache.scala 35:27]
  wire  directory_io_read_req_ready; // @[ICache.scala 35:27]
  wire  directory_io_read_req_valid; // @[ICache.scala 35:27]
  wire [31:0] directory_io_read_req_bits_addr; // @[ICache.scala 35:27]
  wire  directory_io_read_resp_valid; // @[ICache.scala 35:27]
  wire  directory_io_read_resp_bits_hit; // @[ICache.scala 35:27]
  wire [3:0] directory_io_read_resp_bits_chosenWay; // @[ICache.scala 35:27]
  wire  directory_io_read_resp_bits_isDirtyWay; // @[ICache.scala 35:27]
  wire  directory_io_write_req_ready; // @[ICache.scala 35:27]
  wire  directory_io_write_req_valid; // @[ICache.scala 35:27]
  wire [31:0] directory_io_write_req_bits_addr; // @[ICache.scala 35:27]
  wire [3:0] directory_io_write_req_bits_way; // @[ICache.scala 35:27]
  wire [1:0] directory_io_write_req_bits_meta; // @[ICache.scala 35:27]
  LoadPipe loadPipe ( // @[ICache.scala 32:26]
    .clock(loadPipe_clock),
    .reset(loadPipe_reset),
    .io_load_req_ready(loadPipe_io_load_req_ready),
    .io_load_req_valid(loadPipe_io_load_req_valid),
    .io_load_req_bits_addr(loadPipe_io_load_req_bits_addr),
    .io_load_resp_valid(loadPipe_io_load_resp_valid),
    .io_load_resp_bits_data(loadPipe_io_load_resp_bits_data),
    .io_load_resp_bits_stageID(loadPipe_io_load_resp_bits_stageID),
    .io_dir_read_req_valid(loadPipe_io_dir_read_req_valid),
    .io_dir_read_req_bits_addr(loadPipe_io_dir_read_req_bits_addr),
    .io_dir_read_resp_valid(loadPipe_io_dir_read_resp_valid),
    .io_dir_read_resp_bits_hit(loadPipe_io_dir_read_resp_bits_hit),
    .io_dir_read_resp_bits_chosenWay(loadPipe_io_dir_read_resp_bits_chosenWay),
    .io_dir_read_resp_bits_isDirtyWay(loadPipe_io_dir_read_resp_bits_isDirtyWay),
    .io_dir_write_req_valid(loadPipe_io_dir_write_req_valid),
    .io_dir_write_req_bits_addr(loadPipe_io_dir_write_req_bits_addr),
    .io_dir_write_req_bits_way(loadPipe_io_dir_write_req_bits_way),
    .io_dir_write_req_bits_meta(loadPipe_io_dir_write_req_bits_meta),
    .io_dataBank_read_req_valid(loadPipe_io_dataBank_read_req_valid),
    .io_dataBank_read_req_bits_set(loadPipe_io_dataBank_read_req_bits_set),
    .io_dataBank_read_req_bits_blockSelOH(loadPipe_io_dataBank_read_req_bits_blockSelOH),
    .io_dataBank_read_resp_bits_data_0(loadPipe_io_dataBank_read_resp_bits_data_0),
    .io_dataBank_read_resp_bits_data_1(loadPipe_io_dataBank_read_resp_bits_data_1),
    .io_dataBank_read_resp_bits_data_2(loadPipe_io_dataBank_read_resp_bits_data_2),
    .io_dataBank_read_resp_bits_data_3(loadPipe_io_dataBank_read_resp_bits_data_3),
    .io_dataBank_read_resp_bits_blockData_0(loadPipe_io_dataBank_read_resp_bits_blockData_0),
    .io_dataBank_read_resp_bits_blockData_1(loadPipe_io_dataBank_read_resp_bits_blockData_1),
    .io_dataBank_write_req_valid(loadPipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(loadPipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(loadPipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(loadPipe_io_dataBank_write_req_bits_blockSelOH),
    .io_dataBank_write_req_bits_way(loadPipe_io_dataBank_write_req_bits_way),
    .io_tlbus_req_ready(loadPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(loadPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(loadPipe_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(loadPipe_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(loadPipe_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(loadPipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(loadPipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(loadPipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(loadPipe_io_tlbus_resp_bits_data)
  );
  DataBankArray dataBankArray ( // @[ICache.scala 34:31]
    .clock(dataBankArray_clock),
    .reset(dataBankArray_reset),
    .io_read_req_ready(dataBankArray_io_read_req_ready),
    .io_read_req_valid(dataBankArray_io_read_req_valid),
    .io_read_req_bits_set(dataBankArray_io_read_req_bits_set),
    .io_read_req_bits_blockSelOH(dataBankArray_io_read_req_bits_blockSelOH),
    .io_read_resp_bits_data_0(dataBankArray_io_read_resp_bits_data_0),
    .io_read_resp_bits_data_1(dataBankArray_io_read_resp_bits_data_1),
    .io_read_resp_bits_data_2(dataBankArray_io_read_resp_bits_data_2),
    .io_read_resp_bits_data_3(dataBankArray_io_read_resp_bits_data_3),
    .io_read_resp_bits_blockData_0(dataBankArray_io_read_resp_bits_blockData_0),
    .io_read_resp_bits_blockData_1(dataBankArray_io_read_resp_bits_blockData_1),
    .io_write_req_ready(dataBankArray_io_write_req_ready),
    .io_write_req_valid(dataBankArray_io_write_req_valid),
    .io_write_req_bits_data(dataBankArray_io_write_req_bits_data),
    .io_write_req_bits_set(dataBankArray_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(dataBankArray_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(dataBankArray_io_write_req_bits_way),
    .io_write_req_bits_mask(dataBankArray_io_write_req_bits_mask)
  );
  DCacheDirectory directory ( // @[ICache.scala 35:27]
    .clock(directory_clock),
    .reset(directory_reset),
    .io_read_req_ready(directory_io_read_req_ready),
    .io_read_req_valid(directory_io_read_req_valid),
    .io_read_req_bits_addr(directory_io_read_req_bits_addr),
    .io_read_resp_valid(directory_io_read_resp_valid),
    .io_read_resp_bits_hit(directory_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(directory_io_read_resp_bits_chosenWay),
    .io_read_resp_bits_isDirtyWay(directory_io_read_resp_bits_isDirtyWay),
    .io_write_req_ready(directory_io_write_req_ready),
    .io_write_req_valid(directory_io_write_req_valid),
    .io_write_req_bits_addr(directory_io_write_req_bits_addr),
    .io_write_req_bits_way(directory_io_write_req_bits_way),
    .io_write_req_bits_meta(directory_io_write_req_bits_meta)
  );
  assign io_read_req_ready = loadPipe_io_load_req_ready; // @[ICache.scala 37:22]
  assign io_read_resp_valid = loadPipe_io_load_resp_valid; // @[ICache.scala 37:22]
  assign io_read_resp_bits_data = loadPipe_io_load_resp_bits_data; // @[ICache.scala 37:22]
  assign io_tlbus_req_valid = loadPipe_io_tlbus_req_valid; // @[ICache.scala 40:14]
  assign io_tlbus_req_bits_opcode = loadPipe_io_tlbus_req_bits_opcode; // @[ICache.scala 40:14]
  assign io_tlbus_req_bits_address = loadPipe_io_tlbus_req_bits_address; // @[ICache.scala 40:14]
  assign io_tlbus_req_bits_data = loadPipe_io_tlbus_req_bits_data; // @[ICache.scala 40:14]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[ICache.scala 37:22]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[ICache.scala 37:22]
  assign loadPipe_io_dir_read_resp_valid = directory_io_read_resp_valid; // @[ICache.scala 39:21]
  assign loadPipe_io_dir_read_resp_bits_hit = directory_io_read_resp_bits_hit; // @[ICache.scala 39:21]
  assign loadPipe_io_dir_read_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[ICache.scala 39:21]
  assign loadPipe_io_dir_read_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[ICache.scala 39:21]
  assign loadPipe_io_dataBank_read_resp_bits_data_0 = dataBankArray_io_read_resp_bits_data_0; // @[ICache.scala 38:26]
  assign loadPipe_io_dataBank_read_resp_bits_data_1 = dataBankArray_io_read_resp_bits_data_1; // @[ICache.scala 38:26]
  assign loadPipe_io_dataBank_read_resp_bits_data_2 = dataBankArray_io_read_resp_bits_data_2; // @[ICache.scala 38:26]
  assign loadPipe_io_dataBank_read_resp_bits_data_3 = dataBankArray_io_read_resp_bits_data_3; // @[ICache.scala 38:26]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[ICache.scala 38:26]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[ICache.scala 38:26]
  assign loadPipe_io_tlbus_req_ready = io_tlbus_req_ready; // @[ICache.scala 40:14]
  assign loadPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[ICache.scala 40:14]
  assign loadPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[ICache.scala 40:14]
  assign loadPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[ICache.scala 40:14]
  assign dataBankArray_clock = clock;
  assign dataBankArray_reset = reset;
  assign dataBankArray_io_read_req_valid = loadPipe_io_dataBank_read_req_valid; // @[ICache.scala 38:26]
  assign dataBankArray_io_read_req_bits_set = loadPipe_io_dataBank_read_req_bits_set; // @[ICache.scala 38:26]
  assign dataBankArray_io_read_req_bits_blockSelOH = loadPipe_io_dataBank_read_req_bits_blockSelOH; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_valid = loadPipe_io_dataBank_write_req_valid; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_bits_data = loadPipe_io_dataBank_write_req_bits_data; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_bits_set = loadPipe_io_dataBank_write_req_bits_set; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_bits_blockSelOH = loadPipe_io_dataBank_write_req_bits_blockSelOH; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_bits_way = loadPipe_io_dataBank_write_req_bits_way; // @[ICache.scala 38:26]
  assign dataBankArray_io_write_req_bits_mask = 4'hf; // @[ICache.scala 38:26]
  assign directory_clock = clock;
  assign directory_reset = reset;
  assign directory_io_read_req_valid = loadPipe_io_dir_read_req_valid; // @[ICache.scala 39:21]
  assign directory_io_read_req_bits_addr = loadPipe_io_dir_read_req_bits_addr; // @[ICache.scala 39:21]
  assign directory_io_write_req_valid = loadPipe_io_dir_write_req_valid; // @[ICache.scala 39:21]
  assign directory_io_write_req_bits_addr = loadPipe_io_dir_write_req_bits_addr; // @[ICache.scala 39:21]
  assign directory_io_write_req_bits_way = loadPipe_io_dir_write_req_bits_way; // @[ICache.scala 39:21]
  assign directory_io_write_req_bits_meta = loadPipe_io_dir_write_req_bits_meta; // @[ICache.scala 39:21]
endmodule
module Fetch_1(
  input         clock,
  input         reset,
  input         io_in_start,
  input         io_in_execute_bits_brTaken,
  input  [31:0] io_in_execute_bits_targetAddr,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [2:0]  io_tlbus_req_bits_opcode,
  output [31:0] io_tlbus_req_bits_address,
  output [31:0] io_tlbus_req_bits_data,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data,
  input  [31:0] io_trapVec,
  input  [31:0] io_mepc,
  input         io_excp_valid,
  input         io_excp_bits_isMret
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
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[1_Fetch.scala 151:24]
  wire  icache_reset; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_req_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_req_valid; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_read_req_bits_addr; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_resp_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_resp_valid; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_read_resp_bits_data; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_req_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_req_valid; // @[1_Fetch.scala 151:24]
  wire [2:0] icache_io_tlbus_req_bits_opcode; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_req_bits_data; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_resp_valid; // @[1_Fetch.scala 151:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_resp_bits_data; // @[1_Fetch.scala 151:24]
  reg [31:0] pcReg; // @[1_Fetch.scala 136:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  wire [31:0] _branchAddr_1_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 142:24]
  wire [31:0] _branchAddr_1_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcReg; // @[1_Fetch.scala 146:24]
  wire [31:0] branchAddr_1 = io_excp_valid ? _branchAddr_1_T : _branchAddr_1_T_1; // @[1_Fetch.scala 141:27]
  wire  hasBranch_1 = io_excp_valid | io_in_execute_bits_brTaken; // @[1_Fetch.scala 156:37]
  wire  _hasBranch_T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg  hasBranch_rs; // @[Reg.scala 35:20]
  wire  _GEN_0 = hasBranch_1 | hasBranch_rs; // @[Reg.scala 36:18 35:20 36:22]
  wire  hasBranch = hasBranch_1 | hasBranch_rs; // @[1_Fetch.scala 157:24]
  reg [31:0] branchAddr_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_2 = hasBranch_1 ? branchAddr_1 : branchAddr_r; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] pcNext = _GEN_0 ? _GEN_2 : pcNext4; // @[1_Fetch.scala 161:18]
  wire  _instValid_T = icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  instValid_rs; // @[Reg.scala 35:20]
  wire  instValid = _instValid_T | instValid_rs; // @[1_Fetch.scala 174:21]
  reg  stall_REG; // @[1_Fetch.scala 163:86]
  reg  stall_REG_1; // @[1_Fetch.scala 163:110]
  wire  stall = ~io_in_start | ~icache_io_read_req_ready | stall_REG | ~stall_REG_1; // @[1_Fetch.scala 163:99]
  wire  _io_in_execute_ready_T = ~stall; // @[1_Fetch.scala 168:28]
  wire  commit = _io_in_execute_ready_T & io_out_ready & ~_GEN_0; // @[1_Fetch.scala 172:50]
  wire  _firstFire_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_5 = _firstFire_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | ~firstFire & _hasBranch_T; // @[1_Fetch.scala 180:59]
  reg [31:0] inst_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_6 = _instValid_T ? icache_io_read_resp_bits_data : inst_r; // @[Reg.scala 19:16 20:{18,22}]
  wire  updatePC = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  ICache icache ( // @[1_Fetch.scala 151:24]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_read_req_ready(icache_io_read_req_ready),
    .io_read_req_valid(icache_io_read_req_valid),
    .io_read_req_bits_addr(icache_io_read_req_bits_addr),
    .io_read_resp_ready(icache_io_read_resp_ready),
    .io_read_resp_valid(icache_io_read_resp_valid),
    .io_read_resp_bits_data(icache_io_read_resp_bits_data),
    .io_tlbus_req_ready(icache_io_tlbus_req_ready),
    .io_tlbus_req_valid(icache_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(icache_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(icache_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(icache_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(icache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(icache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(icache_io_tlbus_resp_bits_data)
  );
  assign io_out_valid = ~stall; // @[1_Fetch.scala 207:21]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  assign io_out_bits_instState_commit = _io_in_execute_ready_T & io_out_ready & ~_GEN_0; // @[1_Fetch.scala 172:50]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 202:19 199:34]
  assign io_out_bits_instState_inst = commit ? _GEN_6 : 32'h13; // @[1_Fetch.scala 200:40]
  assign io_tlbus_req_valid = icache_io_tlbus_req_valid; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_opcode = icache_io_tlbus_req_bits_opcode; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_address = icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_data = icache_io_tlbus_req_bits_data; // @[1_Fetch.scala 186:21]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = io_in_start & preFetchInst; // @[1_Fetch.scala 187:55]
  assign icache_io_read_req_bits_addr = _hasBranch_T ? pcNext : pcReg; // @[1_Fetch.scala 193:18]
  assign icache_io_read_resp_ready = 1'h1; // @[1_Fetch.scala 189:31]
  assign icache_io_tlbus_req_ready = io_tlbus_req_ready; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[1_Fetch.scala 186:21]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 136:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 136:34]
    end else if (_hasBranch_T) begin // @[1_Fetch.scala 193:18]
      if (_GEN_0) begin // @[1_Fetch.scala 161:18]
        if (hasBranch_1) begin // @[Reg.scala 20:18]
          pcReg <= branchAddr_1; // @[Reg.scala 20:22]
        end else begin
          pcReg <= branchAddr_r; // @[Reg.scala 19:16]
        end
      end else begin
        pcReg <= pcNext4;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      hasBranch_rs <= 1'h0; // @[Reg.scala 35:20]
    end else if (_hasBranch_T) begin // @[util.scala 19:21]
      hasBranch_rs <= 1'h0; // @[util.scala 19:26]
    end else begin
      hasBranch_rs <= _GEN_0;
    end
    if (hasBranch_1) begin // @[Reg.scala 20:18]
      if (io_excp_valid) begin // @[1_Fetch.scala 141:27]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 142:24]
          branchAddr_r <= io_mepc;
        end else begin
          branchAddr_r <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 146:24]
        branchAddr_r <= io_in_execute_bits_targetAddr;
      end else begin
        branchAddr_r <= pcReg;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      instValid_rs <= 1'h0; // @[Reg.scala 35:20]
    end else if (_hasBranch_T) begin // @[util.scala 19:21]
      instValid_rs <= 1'h0; // @[util.scala 19:26]
    end else begin
      instValid_rs <= instValid;
    end
    stall_REG <= ~instValid; // @[1_Fetch.scala 163:87]
    stall_REG_1 <= io_in_start; // @[1_Fetch.scala 163:110]
    firstFire <= reset | _GEN_5; // @[Reg.scala 35:{20,20}]
    if (_instValid_T) begin // @[Reg.scala 20:18]
      inst_r <= icache_io_read_resp_bits_data; // @[Reg.scala 20:22]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  hasBranch_rs = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  branchAddr_r = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  instValid_rs = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stall_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stall_REG_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  firstFire = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  inst_r = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Decoder(
  input  [31:0] io_inst,
  output        io_out_isBranch,
  output [1:0]  io_out_resultSrc,
  output [3:0]  io_out_aluOpSel,
  output [4:0]  io_out_lsuOp,
  output [3:0]  io_out_aluSrc1,
  output [3:0]  io_out_aluSrc2,
  output [1:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn,
  output [2:0]  io_out_csrOp,
  output [3:0]  io_out_excType
);
  wire [31:0] _decodeSigs_T = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_1 = 32'h3 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_3 = 32'h1003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_5 = 32'h2003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_7 = 32'h4003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_9 = 32'h5003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_11 = 32'h13 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_12 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_13 = 32'h1013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_15 = 32'h2013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_17 = 32'h3013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_19 = 32'h4013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_21 = 32'h5013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_23 = 32'h40005013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_25 = 32'h6013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_27 = 32'h7013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_28 = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_29 = 32'h17 == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_31 = 32'h23 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_33 = 32'h1023 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_35 = 32'h2023 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_36 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_37 = 32'h33 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_39 = 32'h40000033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_41 = 32'h1033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_43 = 32'h2033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_45 = 32'h3033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_47 = 32'h4033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_49 = 32'h5033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_51 = 32'h40005033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_53 = 32'h6033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_55 = 32'h7033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_57 = 32'h37 == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_59 = 32'h63 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_61 = 32'h1063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_63 = 32'h4063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_65 = 32'h5063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_67 = 32'h6063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_69 = 32'h7063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_71 = 32'h67 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_73 = 32'h6f == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_75 = 32'hf == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_77 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_79 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_81 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_83 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_85 = 32'h1073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_87 = 32'h2073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_89 = 32'h3073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_91 = 32'h5073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_93 = 32'h6073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_95 = 32'h7073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_115 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_59 | (_decodeSigs_T_61 | (_decodeSigs_T_63 | (
    _decodeSigs_T_65 | (_decodeSigs_T_67 | _decodeSigs_T_69)))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_116 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_115; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_117 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_116; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_118 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_117; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_119 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_118; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_120 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_119; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_121 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_120; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_122 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_121; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_123 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_122; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_124 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_123; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_125 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_124; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_126 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_125; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_127 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_126; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_128 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_127; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_129 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_128; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_130 = _decodeSigs_T_27 ? 1'h0 : _decodeSigs_T_129; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_131 = _decodeSigs_T_25 ? 1'h0 : _decodeSigs_T_130; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_132 = _decodeSigs_T_23 ? 1'h0 : _decodeSigs_T_131; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_133 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_132; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_134 = _decodeSigs_T_19 ? 1'h0 : _decodeSigs_T_133; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_135 = _decodeSigs_T_17 ? 1'h0 : _decodeSigs_T_134; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_136 = _decodeSigs_T_15 ? 1'h0 : _decodeSigs_T_135; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_137 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_136; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_138 = _decodeSigs_T_11 ? 1'h0 : _decodeSigs_T_137; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_139 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_138; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_140 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_139; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_141 = _decodeSigs_T_5 ? 1'h0 : _decodeSigs_T_140; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_142 = _decodeSigs_T_3 ? 1'h0 : _decodeSigs_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_143 = _decodeSigs_T_95 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_144 = _decodeSigs_T_93 ? 2'h3 : _decodeSigs_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_145 = _decodeSigs_T_91 ? 2'h3 : _decodeSigs_T_144; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_146 = _decodeSigs_T_89 ? 2'h3 : _decodeSigs_T_145; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_147 = _decodeSigs_T_87 ? 2'h3 : _decodeSigs_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_148 = _decodeSigs_T_85 ? 2'h3 : _decodeSigs_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_149 = _decodeSigs_T_83 ? 2'h0 : _decodeSigs_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_150 = _decodeSigs_T_81 ? 2'h0 : _decodeSigs_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_151 = _decodeSigs_T_79 ? 2'h0 : _decodeSigs_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_152 = _decodeSigs_T_77 ? 2'h0 : _decodeSigs_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_153 = _decodeSigs_T_75 ? 2'h0 : _decodeSigs_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_154 = _decodeSigs_T_73 ? 2'h2 : _decodeSigs_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_155 = _decodeSigs_T_71 ? 2'h2 : _decodeSigs_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_156 = _decodeSigs_T_69 ? 2'h0 : _decodeSigs_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_157 = _decodeSigs_T_67 ? 2'h0 : _decodeSigs_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_158 = _decodeSigs_T_65 ? 2'h0 : _decodeSigs_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_159 = _decodeSigs_T_63 ? 2'h0 : _decodeSigs_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_160 = _decodeSigs_T_61 ? 2'h0 : _decodeSigs_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_161 = _decodeSigs_T_59 ? 2'h0 : _decodeSigs_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_162 = _decodeSigs_T_57 ? 2'h0 : _decodeSigs_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_163 = _decodeSigs_T_55 ? 2'h0 : _decodeSigs_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_164 = _decodeSigs_T_53 ? 2'h0 : _decodeSigs_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_165 = _decodeSigs_T_51 ? 2'h0 : _decodeSigs_T_164; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_166 = _decodeSigs_T_49 ? 2'h0 : _decodeSigs_T_165; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_167 = _decodeSigs_T_47 ? 2'h0 : _decodeSigs_T_166; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_168 = _decodeSigs_T_45 ? 2'h0 : _decodeSigs_T_167; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_169 = _decodeSigs_T_43 ? 2'h0 : _decodeSigs_T_168; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_170 = _decodeSigs_T_41 ? 2'h0 : _decodeSigs_T_169; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_171 = _decodeSigs_T_39 ? 2'h0 : _decodeSigs_T_170; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_172 = _decodeSigs_T_37 ? 2'h0 : _decodeSigs_T_171; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_173 = _decodeSigs_T_35 ? 2'h0 : _decodeSigs_T_172; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_174 = _decodeSigs_T_33 ? 2'h0 : _decodeSigs_T_173; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_175 = _decodeSigs_T_31 ? 2'h0 : _decodeSigs_T_174; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_176 = _decodeSigs_T_29 ? 2'h0 : _decodeSigs_T_175; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_177 = _decodeSigs_T_27 ? 2'h0 : _decodeSigs_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_178 = _decodeSigs_T_25 ? 2'h0 : _decodeSigs_T_177; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_179 = _decodeSigs_T_23 ? 2'h0 : _decodeSigs_T_178; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_180 = _decodeSigs_T_21 ? 2'h0 : _decodeSigs_T_179; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_181 = _decodeSigs_T_19 ? 2'h0 : _decodeSigs_T_180; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_182 = _decodeSigs_T_17 ? 2'h0 : _decodeSigs_T_181; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_183 = _decodeSigs_T_15 ? 2'h0 : _decodeSigs_T_182; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_184 = _decodeSigs_T_13 ? 2'h0 : _decodeSigs_T_183; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_185 = _decodeSigs_T_11 ? 2'h0 : _decodeSigs_T_184; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_186 = _decodeSigs_T_9 ? 2'h1 : _decodeSigs_T_185; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_187 = _decodeSigs_T_7 ? 2'h1 : _decodeSigs_T_186; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_188 = _decodeSigs_T_5 ? 2'h1 : _decodeSigs_T_187; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_189 = _decodeSigs_T_3 ? 2'h1 : _decodeSigs_T_188; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_200 = _decodeSigs_T_75 ? 5'h14 : 5'h0; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_201 = _decodeSigs_T_73 ? 5'h0 : _decodeSigs_T_200; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_202 = _decodeSigs_T_71 ? 5'h0 : _decodeSigs_T_201; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_203 = _decodeSigs_T_69 ? 5'h0 : _decodeSigs_T_202; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_204 = _decodeSigs_T_67 ? 5'h0 : _decodeSigs_T_203; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_205 = _decodeSigs_T_65 ? 5'h0 : _decodeSigs_T_204; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_206 = _decodeSigs_T_63 ? 5'h0 : _decodeSigs_T_205; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_207 = _decodeSigs_T_61 ? 5'h0 : _decodeSigs_T_206; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_208 = _decodeSigs_T_59 ? 5'h0 : _decodeSigs_T_207; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_209 = _decodeSigs_T_57 ? 5'h0 : _decodeSigs_T_208; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_210 = _decodeSigs_T_55 ? 5'h0 : _decodeSigs_T_209; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_211 = _decodeSigs_T_53 ? 5'h0 : _decodeSigs_T_210; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_212 = _decodeSigs_T_51 ? 5'h0 : _decodeSigs_T_211; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_213 = _decodeSigs_T_49 ? 5'h0 : _decodeSigs_T_212; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_214 = _decodeSigs_T_47 ? 5'h0 : _decodeSigs_T_213; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_215 = _decodeSigs_T_45 ? 5'h0 : _decodeSigs_T_214; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_216 = _decodeSigs_T_43 ? 5'h0 : _decodeSigs_T_215; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_217 = _decodeSigs_T_41 ? 5'h0 : _decodeSigs_T_216; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_218 = _decodeSigs_T_39 ? 5'h0 : _decodeSigs_T_217; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_219 = _decodeSigs_T_37 ? 5'h0 : _decodeSigs_T_218; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_220 = _decodeSigs_T_35 ? 5'h8 : _decodeSigs_T_219; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_221 = _decodeSigs_T_33 ? 5'h7 : _decodeSigs_T_220; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_222 = _decodeSigs_T_31 ? 5'h6 : _decodeSigs_T_221; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_223 = _decodeSigs_T_29 ? 5'h0 : _decodeSigs_T_222; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_224 = _decodeSigs_T_27 ? 5'h0 : _decodeSigs_T_223; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_225 = _decodeSigs_T_25 ? 5'h0 : _decodeSigs_T_224; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_226 = _decodeSigs_T_23 ? 5'h0 : _decodeSigs_T_225; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_227 = _decodeSigs_T_21 ? 5'h0 : _decodeSigs_T_226; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_228 = _decodeSigs_T_19 ? 5'h0 : _decodeSigs_T_227; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_229 = _decodeSigs_T_17 ? 5'h0 : _decodeSigs_T_228; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_230 = _decodeSigs_T_15 ? 5'h0 : _decodeSigs_T_229; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_231 = _decodeSigs_T_13 ? 5'h0 : _decodeSigs_T_230; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_232 = _decodeSigs_T_11 ? 5'h0 : _decodeSigs_T_231; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_233 = _decodeSigs_T_9 ? 5'h5 : _decodeSigs_T_232; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_234 = _decodeSigs_T_7 ? 5'h4 : _decodeSigs_T_233; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_235 = _decodeSigs_T_5 ? 5'h3 : _decodeSigs_T_234; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_236 = _decodeSigs_T_3 ? 5'h2 : _decodeSigs_T_235; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_250 = _decodeSigs_T_69 ? 4'hf : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_251 = _decodeSigs_T_67 ? 4'h9 : _decodeSigs_T_250; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_252 = _decodeSigs_T_65 ? 4'h7 : _decodeSigs_T_251; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_253 = _decodeSigs_T_63 ? 4'h8 : _decodeSigs_T_252; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_254 = _decodeSigs_T_61 ? 4'h6 : _decodeSigs_T_253; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_255 = _decodeSigs_T_59 ? 4'h5 : _decodeSigs_T_254; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_256 = _decodeSigs_T_57 ? 4'he : _decodeSigs_T_255; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_257 = _decodeSigs_T_55 ? 4'h2 : _decodeSigs_T_256; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_258 = _decodeSigs_T_53 ? 4'h3 : _decodeSigs_T_257; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_259 = _decodeSigs_T_51 ? 4'hc : _decodeSigs_T_258; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_260 = _decodeSigs_T_49 ? 4'hb : _decodeSigs_T_259; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_261 = _decodeSigs_T_47 ? 4'h4 : _decodeSigs_T_260; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_262 = _decodeSigs_T_45 ? 4'h9 : _decodeSigs_T_261; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_263 = _decodeSigs_T_43 ? 4'h8 : _decodeSigs_T_262; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_264 = _decodeSigs_T_41 ? 4'ha : _decodeSigs_T_263; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_265 = _decodeSigs_T_39 ? 4'h1 : _decodeSigs_T_264; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_266 = _decodeSigs_T_37 ? 4'h0 : _decodeSigs_T_265; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_267 = _decodeSigs_T_35 ? 4'h0 : _decodeSigs_T_266; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_268 = _decodeSigs_T_33 ? 4'h0 : _decodeSigs_T_267; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_269 = _decodeSigs_T_31 ? 4'h0 : _decodeSigs_T_268; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_270 = _decodeSigs_T_29 ? 4'h0 : _decodeSigs_T_269; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_271 = _decodeSigs_T_27 ? 4'h2 : _decodeSigs_T_270; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_272 = _decodeSigs_T_25 ? 4'h3 : _decodeSigs_T_271; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_273 = _decodeSigs_T_23 ? 4'hc : _decodeSigs_T_272; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_274 = _decodeSigs_T_21 ? 4'hb : _decodeSigs_T_273; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_275 = _decodeSigs_T_19 ? 4'h4 : _decodeSigs_T_274; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_276 = _decodeSigs_T_17 ? 4'h9 : _decodeSigs_T_275; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_277 = _decodeSigs_T_15 ? 4'h8 : _decodeSigs_T_276; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_278 = _decodeSigs_T_13 ? 4'ha : _decodeSigs_T_277; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_279 = _decodeSigs_T_11 ? 4'h0 : _decodeSigs_T_278; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_280 = _decodeSigs_T_9 ? 4'h0 : _decodeSigs_T_279; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_281 = _decodeSigs_T_7 ? 4'h0 : _decodeSigs_T_280; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_282 = _decodeSigs_T_5 ? 4'h0 : _decodeSigs_T_281; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_283 = _decodeSigs_T_3 ? 4'h0 : _decodeSigs_T_282; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_284 = _decodeSigs_T_95 ? 4'h6 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_285 = _decodeSigs_T_93 ? 4'h6 : _decodeSigs_T_284; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_286 = _decodeSigs_T_91 ? 4'h6 : _decodeSigs_T_285; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_287 = _decodeSigs_T_89 ? 4'h1 : _decodeSigs_T_286; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_288 = _decodeSigs_T_87 ? 4'h1 : _decodeSigs_T_287; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_289 = _decodeSigs_T_85 ? 4'h1 : _decodeSigs_T_288; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_290 = _decodeSigs_T_83 ? 4'h0 : _decodeSigs_T_289; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_291 = _decodeSigs_T_81 ? 4'h0 : _decodeSigs_T_290; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_292 = _decodeSigs_T_79 ? 4'h0 : _decodeSigs_T_291; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_293 = _decodeSigs_T_77 ? 4'h0 : _decodeSigs_T_292; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_294 = _decodeSigs_T_75 ? 4'h0 : _decodeSigs_T_293; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_295 = _decodeSigs_T_73 ? 4'h7 : _decodeSigs_T_294; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_296 = _decodeSigs_T_71 ? 4'h1 : _decodeSigs_T_295; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_297 = _decodeSigs_T_69 ? 4'h1 : _decodeSigs_T_296; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_298 = _decodeSigs_T_67 ? 4'h1 : _decodeSigs_T_297; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_299 = _decodeSigs_T_65 ? 4'h1 : _decodeSigs_T_298; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_300 = _decodeSigs_T_63 ? 4'h1 : _decodeSigs_T_299; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_301 = _decodeSigs_T_61 ? 4'h1 : _decodeSigs_T_300; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_302 = _decodeSigs_T_59 ? 4'h1 : _decodeSigs_T_301; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_303 = _decodeSigs_T_57 ? 4'h0 : _decodeSigs_T_302; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_304 = _decodeSigs_T_55 ? 4'h1 : _decodeSigs_T_303; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_305 = _decodeSigs_T_53 ? 4'h1 : _decodeSigs_T_304; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_306 = _decodeSigs_T_51 ? 4'h1 : _decodeSigs_T_305; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_307 = _decodeSigs_T_49 ? 4'h1 : _decodeSigs_T_306; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_308 = _decodeSigs_T_47 ? 4'h1 : _decodeSigs_T_307; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_309 = _decodeSigs_T_45 ? 4'h1 : _decodeSigs_T_308; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_310 = _decodeSigs_T_43 ? 4'h1 : _decodeSigs_T_309; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_311 = _decodeSigs_T_41 ? 4'h1 : _decodeSigs_T_310; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_312 = _decodeSigs_T_39 ? 4'h1 : _decodeSigs_T_311; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_313 = _decodeSigs_T_37 ? 4'h1 : _decodeSigs_T_312; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_314 = _decodeSigs_T_35 ? 4'h1 : _decodeSigs_T_313; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_315 = _decodeSigs_T_33 ? 4'h1 : _decodeSigs_T_314; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_316 = _decodeSigs_T_31 ? 4'h1 : _decodeSigs_T_315; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_317 = _decodeSigs_T_29 ? 4'h7 : _decodeSigs_T_316; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_318 = _decodeSigs_T_27 ? 4'h1 : _decodeSigs_T_317; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_319 = _decodeSigs_T_25 ? 4'h1 : _decodeSigs_T_318; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_320 = _decodeSigs_T_23 ? 4'h1 : _decodeSigs_T_319; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_321 = _decodeSigs_T_21 ? 4'h1 : _decodeSigs_T_320; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_322 = _decodeSigs_T_19 ? 4'h1 : _decodeSigs_T_321; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_323 = _decodeSigs_T_17 ? 4'h1 : _decodeSigs_T_322; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_324 = _decodeSigs_T_15 ? 4'h1 : _decodeSigs_T_323; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_325 = _decodeSigs_T_13 ? 4'h1 : _decodeSigs_T_324; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_326 = _decodeSigs_T_11 ? 4'h1 : _decodeSigs_T_325; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_327 = _decodeSigs_T_9 ? 4'h1 : _decodeSigs_T_326; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_328 = _decodeSigs_T_7 ? 4'h1 : _decodeSigs_T_327; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_329 = _decodeSigs_T_5 ? 4'h1 : _decodeSigs_T_328; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_330 = _decodeSigs_T_3 ? 4'h1 : _decodeSigs_T_329; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_342 = _decodeSigs_T_73 ? 4'h3 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_343 = _decodeSigs_T_71 ? 4'h3 : _decodeSigs_T_342; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_344 = _decodeSigs_T_69 ? 4'h2 : _decodeSigs_T_343; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_345 = _decodeSigs_T_67 ? 4'h2 : _decodeSigs_T_344; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_346 = _decodeSigs_T_65 ? 4'h2 : _decodeSigs_T_345; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_347 = _decodeSigs_T_63 ? 4'h2 : _decodeSigs_T_346; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_348 = _decodeSigs_T_61 ? 4'h2 : _decodeSigs_T_347; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_349 = _decodeSigs_T_59 ? 4'h2 : _decodeSigs_T_348; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_350 = _decodeSigs_T_57 ? 4'h3 : _decodeSigs_T_349; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_351 = _decodeSigs_T_55 ? 4'h2 : _decodeSigs_T_350; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_352 = _decodeSigs_T_53 ? 4'h2 : _decodeSigs_T_351; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_353 = _decodeSigs_T_51 ? 4'h2 : _decodeSigs_T_352; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_354 = _decodeSigs_T_49 ? 4'h2 : _decodeSigs_T_353; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_355 = _decodeSigs_T_47 ? 4'h2 : _decodeSigs_T_354; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_356 = _decodeSigs_T_45 ? 4'h2 : _decodeSigs_T_355; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_357 = _decodeSigs_T_43 ? 4'h2 : _decodeSigs_T_356; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_358 = _decodeSigs_T_41 ? 4'h2 : _decodeSigs_T_357; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_359 = _decodeSigs_T_39 ? 4'h2 : _decodeSigs_T_358; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_360 = _decodeSigs_T_37 ? 4'h2 : _decodeSigs_T_359; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_361 = _decodeSigs_T_35 ? 4'h3 : _decodeSigs_T_360; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_362 = _decodeSigs_T_33 ? 4'h3 : _decodeSigs_T_361; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_363 = _decodeSigs_T_31 ? 4'h3 : _decodeSigs_T_362; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_364 = _decodeSigs_T_29 ? 4'h3 : _decodeSigs_T_363; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_365 = _decodeSigs_T_27 ? 4'h3 : _decodeSigs_T_364; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_366 = _decodeSigs_T_25 ? 4'h3 : _decodeSigs_T_365; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_367 = _decodeSigs_T_23 ? 4'h3 : _decodeSigs_T_366; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_368 = _decodeSigs_T_21 ? 4'h3 : _decodeSigs_T_367; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_369 = _decodeSigs_T_19 ? 4'h3 : _decodeSigs_T_368; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_370 = _decodeSigs_T_17 ? 4'h3 : _decodeSigs_T_369; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_371 = _decodeSigs_T_15 ? 4'h3 : _decodeSigs_T_370; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_372 = _decodeSigs_T_13 ? 4'h3 : _decodeSigs_T_371; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_373 = _decodeSigs_T_11 ? 4'h3 : _decodeSigs_T_372; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_374 = _decodeSigs_T_9 ? 4'h3 : _decodeSigs_T_373; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_375 = _decodeSigs_T_7 ? 4'h3 : _decodeSigs_T_374; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_376 = _decodeSigs_T_5 ? 4'h3 : _decodeSigs_T_375; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_377 = _decodeSigs_T_3 ? 4'h3 : _decodeSigs_T_376; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_378 = _decodeSigs_T_95 ? 3'h5 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_379 = _decodeSigs_T_93 ? 3'h5 : _decodeSigs_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_380 = _decodeSigs_T_91 ? 3'h5 : _decodeSigs_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_381 = _decodeSigs_T_89 ? 3'h0 : _decodeSigs_T_380; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_382 = _decodeSigs_T_87 ? 3'h0 : _decodeSigs_T_381; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_383 = _decodeSigs_T_85 ? 3'h0 : _decodeSigs_T_382; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_384 = _decodeSigs_T_83 ? 3'h0 : _decodeSigs_T_383; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_385 = _decodeSigs_T_81 ? 3'h0 : _decodeSigs_T_384; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_386 = _decodeSigs_T_79 ? 3'h0 : _decodeSigs_T_385; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_387 = _decodeSigs_T_77 ? 3'h0 : _decodeSigs_T_386; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_388 = _decodeSigs_T_75 ? 3'h0 : _decodeSigs_T_387; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_389 = _decodeSigs_T_73 ? 3'h4 : _decodeSigs_T_388; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_390 = _decodeSigs_T_71 ? 3'h0 : _decodeSigs_T_389; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_391 = _decodeSigs_T_69 ? 3'h2 : _decodeSigs_T_390; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_392 = _decodeSigs_T_67 ? 3'h2 : _decodeSigs_T_391; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_393 = _decodeSigs_T_65 ? 3'h2 : _decodeSigs_T_392; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_394 = _decodeSigs_T_63 ? 3'h2 : _decodeSigs_T_393; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_395 = _decodeSigs_T_61 ? 3'h2 : _decodeSigs_T_394; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_396 = _decodeSigs_T_59 ? 3'h2 : _decodeSigs_T_395; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_397 = _decodeSigs_T_57 ? 3'h3 : _decodeSigs_T_396; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_398 = _decodeSigs_T_55 ? 3'h0 : _decodeSigs_T_397; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_399 = _decodeSigs_T_53 ? 3'h0 : _decodeSigs_T_398; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_400 = _decodeSigs_T_51 ? 3'h0 : _decodeSigs_T_399; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_401 = _decodeSigs_T_49 ? 3'h0 : _decodeSigs_T_400; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_402 = _decodeSigs_T_47 ? 3'h0 : _decodeSigs_T_401; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_403 = _decodeSigs_T_45 ? 3'h0 : _decodeSigs_T_402; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_404 = _decodeSigs_T_43 ? 3'h0 : _decodeSigs_T_403; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_405 = _decodeSigs_T_41 ? 3'h0 : _decodeSigs_T_404; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_406 = _decodeSigs_T_39 ? 3'h0 : _decodeSigs_T_405; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_407 = _decodeSigs_T_37 ? 3'h0 : _decodeSigs_T_406; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_408 = _decodeSigs_T_35 ? 3'h1 : _decodeSigs_T_407; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_409 = _decodeSigs_T_33 ? 3'h1 : _decodeSigs_T_408; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_410 = _decodeSigs_T_31 ? 3'h1 : _decodeSigs_T_409; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_411 = _decodeSigs_T_29 ? 3'h3 : _decodeSigs_T_410; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_412 = _decodeSigs_T_27 ? 3'h0 : _decodeSigs_T_411; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_413 = _decodeSigs_T_25 ? 3'h0 : _decodeSigs_T_412; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_414 = _decodeSigs_T_23 ? 3'h0 : _decodeSigs_T_413; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_415 = _decodeSigs_T_21 ? 3'h0 : _decodeSigs_T_414; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_416 = _decodeSigs_T_19 ? 3'h0 : _decodeSigs_T_415; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_417 = _decodeSigs_T_17 ? 3'h0 : _decodeSigs_T_416; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_418 = _decodeSigs_T_15 ? 3'h0 : _decodeSigs_T_417; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_419 = _decodeSigs_T_13 ? 3'h0 : _decodeSigs_T_418; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_420 = _decodeSigs_T_11 ? 3'h0 : _decodeSigs_T_419; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_421 = _decodeSigs_T_9 ? 3'h0 : _decodeSigs_T_420; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_422 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_421; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_423 = _decodeSigs_T_5 ? 3'h0 : _decodeSigs_T_422; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_424 = _decodeSigs_T_3 ? 3'h0 : _decodeSigs_T_423; // @[Lookup.scala 34:39]
  wire [2:0] decodeSigs_6 = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_424; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_425 = _decodeSigs_T_95 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_426 = _decodeSigs_T_93 ? 1'h0 : _decodeSigs_T_425; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_427 = _decodeSigs_T_91 ? 1'h0 : _decodeSigs_T_426; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_428 = _decodeSigs_T_89 ? 1'h0 : _decodeSigs_T_427; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_429 = _decodeSigs_T_87 ? 1'h0 : _decodeSigs_T_428; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_430 = _decodeSigs_T_85 ? 1'h0 : _decodeSigs_T_429; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_431 = _decodeSigs_T_83 ? 1'h0 : _decodeSigs_T_430; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_432 = _decodeSigs_T_81 ? 1'h0 : _decodeSigs_T_431; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_433 = _decodeSigs_T_79 ? 1'h0 : _decodeSigs_T_432; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_434 = _decodeSigs_T_77 ? 1'h0 : _decodeSigs_T_433; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_436 = _decodeSigs_T_73 ? 1'h0 : _decodeSigs_T_75 | _decodeSigs_T_434; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_444 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_59 | (_decodeSigs_T_61 | (_decodeSigs_T_63 | (
    _decodeSigs_T_65 | (_decodeSigs_T_67 | (_decodeSigs_T_69 | (_decodeSigs_T_71 | _decodeSigs_T_436)))))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_445 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_444; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_446 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_445; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_447 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_446; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_448 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_447; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_449 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_448; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_450 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_449; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_451 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_450; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_452 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_451; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_453 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_452; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_454 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_453; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_458 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_31 | (_decodeSigs_T_33 | (_decodeSigs_T_35 |
    _decodeSigs_T_454)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_462 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 |
    _decodeSigs_T_458)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_466 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 |
    _decodeSigs_T_462)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_478 = _decodeSigs_T_83 ? 1'h0 : _decodeSigs_T_85 | (_decodeSigs_T_87 | (_decodeSigs_T_89 | (
    _decodeSigs_T_91 | (_decodeSigs_T_93 | _decodeSigs_T_95)))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_479 = _decodeSigs_T_81 ? 1'h0 : _decodeSigs_T_478; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_480 = _decodeSigs_T_79 ? 1'h0 : _decodeSigs_T_479; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_481 = _decodeSigs_T_77 ? 1'h0 : _decodeSigs_T_480; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_482 = _decodeSigs_T_75 ? 1'h0 : _decodeSigs_T_481; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_485 = _decodeSigs_T_69 ? 1'h0 : _decodeSigs_T_71 | (_decodeSigs_T_73 | _decodeSigs_T_482); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_486 = _decodeSigs_T_67 ? 1'h0 : _decodeSigs_T_485; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_487 = _decodeSigs_T_65 ? 1'h0 : _decodeSigs_T_486; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_488 = _decodeSigs_T_63 ? 1'h0 : _decodeSigs_T_487; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_489 = _decodeSigs_T_61 ? 1'h0 : _decodeSigs_T_488; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_490 = _decodeSigs_T_59 ? 1'h0 : _decodeSigs_T_489; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_502 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_37 | (_decodeSigs_T_39 | (_decodeSigs_T_41 | (
    _decodeSigs_T_43 | (_decodeSigs_T_45 | (_decodeSigs_T_47 | (_decodeSigs_T_49 | (_decodeSigs_T_51 | (_decodeSigs_T_53
     | (_decodeSigs_T_55 | (_decodeSigs_T_57 | _decodeSigs_T_490)))))))))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_503 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_502; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_504 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_503; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_520 = _decodeSigs_T_93 ? 3'h4 : _decodeSigs_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_521 = _decodeSigs_T_91 ? 3'h3 : _decodeSigs_T_520; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_522 = _decodeSigs_T_89 ? 3'h5 : _decodeSigs_T_521; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_523 = _decodeSigs_T_87 ? 3'h4 : _decodeSigs_T_522; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_524 = _decodeSigs_T_85 ? 3'h3 : _decodeSigs_T_523; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_525 = _decodeSigs_T_83 ? 3'h0 : _decodeSigs_T_524; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_526 = _decodeSigs_T_81 ? 3'h0 : _decodeSigs_T_525; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_527 = _decodeSigs_T_79 ? 3'h0 : _decodeSigs_T_526; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_528 = _decodeSigs_T_77 ? 3'h0 : _decodeSigs_T_527; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_529 = _decodeSigs_T_75 ? 3'h0 : _decodeSigs_T_528; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_530 = _decodeSigs_T_73 ? 3'h0 : _decodeSigs_T_529; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_531 = _decodeSigs_T_71 ? 3'h0 : _decodeSigs_T_530; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_532 = _decodeSigs_T_69 ? 3'h0 : _decodeSigs_T_531; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_533 = _decodeSigs_T_67 ? 3'h0 : _decodeSigs_T_532; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_534 = _decodeSigs_T_65 ? 3'h0 : _decodeSigs_T_533; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_535 = _decodeSigs_T_63 ? 3'h0 : _decodeSigs_T_534; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_536 = _decodeSigs_T_61 ? 3'h0 : _decodeSigs_T_535; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_537 = _decodeSigs_T_59 ? 3'h0 : _decodeSigs_T_536; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_538 = _decodeSigs_T_57 ? 3'h0 : _decodeSigs_T_537; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_539 = _decodeSigs_T_55 ? 3'h0 : _decodeSigs_T_538; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_540 = _decodeSigs_T_53 ? 3'h0 : _decodeSigs_T_539; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_541 = _decodeSigs_T_51 ? 3'h0 : _decodeSigs_T_540; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_542 = _decodeSigs_T_49 ? 3'h0 : _decodeSigs_T_541; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_543 = _decodeSigs_T_47 ? 3'h0 : _decodeSigs_T_542; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_544 = _decodeSigs_T_45 ? 3'h0 : _decodeSigs_T_543; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_545 = _decodeSigs_T_43 ? 3'h0 : _decodeSigs_T_544; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_546 = _decodeSigs_T_41 ? 3'h0 : _decodeSigs_T_545; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_547 = _decodeSigs_T_39 ? 3'h0 : _decodeSigs_T_546; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_548 = _decodeSigs_T_37 ? 3'h0 : _decodeSigs_T_547; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_549 = _decodeSigs_T_35 ? 3'h0 : _decodeSigs_T_548; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_550 = _decodeSigs_T_33 ? 3'h0 : _decodeSigs_T_549; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_551 = _decodeSigs_T_31 ? 3'h0 : _decodeSigs_T_550; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_552 = _decodeSigs_T_29 ? 3'h0 : _decodeSigs_T_551; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_553 = _decodeSigs_T_27 ? 3'h0 : _decodeSigs_T_552; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_554 = _decodeSigs_T_25 ? 3'h0 : _decodeSigs_T_553; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_555 = _decodeSigs_T_23 ? 3'h0 : _decodeSigs_T_554; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_556 = _decodeSigs_T_21 ? 3'h0 : _decodeSigs_T_555; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_557 = _decodeSigs_T_19 ? 3'h0 : _decodeSigs_T_556; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_558 = _decodeSigs_T_17 ? 3'h0 : _decodeSigs_T_557; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_559 = _decodeSigs_T_15 ? 3'h0 : _decodeSigs_T_558; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_560 = _decodeSigs_T_13 ? 3'h0 : _decodeSigs_T_559; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_561 = _decodeSigs_T_11 ? 3'h0 : _decodeSigs_T_560; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_562 = _decodeSigs_T_9 ? 3'h0 : _decodeSigs_T_561; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_563 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_562; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_564 = _decodeSigs_T_5 ? 3'h0 : _decodeSigs_T_563; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_565 = _decodeSigs_T_3 ? 3'h0 : _decodeSigs_T_564; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_566 = _decodeSigs_T_95 ? 4'h0 : 4'h5; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_567 = _decodeSigs_T_93 ? 4'h0 : _decodeSigs_T_566; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_568 = _decodeSigs_T_91 ? 4'h0 : _decodeSigs_T_567; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_569 = _decodeSigs_T_89 ? 4'h0 : _decodeSigs_T_568; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_570 = _decodeSigs_T_87 ? 4'h0 : _decodeSigs_T_569; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_571 = _decodeSigs_T_85 ? 4'h0 : _decodeSigs_T_570; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_572 = _decodeSigs_T_83 ? 4'h3 : _decodeSigs_T_571; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_573 = _decodeSigs_T_81 ? 4'h4 : _decodeSigs_T_572; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_574 = _decodeSigs_T_79 ? 4'h2 : _decodeSigs_T_573; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_575 = _decodeSigs_T_77 ? 4'h1 : _decodeSigs_T_574; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_576 = _decodeSigs_T_75 ? 4'h0 : _decodeSigs_T_575; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_577 = _decodeSigs_T_73 ? 4'h0 : _decodeSigs_T_576; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_578 = _decodeSigs_T_71 ? 4'h0 : _decodeSigs_T_577; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_579 = _decodeSigs_T_69 ? 4'h0 : _decodeSigs_T_578; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_580 = _decodeSigs_T_67 ? 4'h0 : _decodeSigs_T_579; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_581 = _decodeSigs_T_65 ? 4'h0 : _decodeSigs_T_580; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_582 = _decodeSigs_T_63 ? 4'h0 : _decodeSigs_T_581; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_583 = _decodeSigs_T_61 ? 4'h0 : _decodeSigs_T_582; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_584 = _decodeSigs_T_59 ? 4'h0 : _decodeSigs_T_583; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_585 = _decodeSigs_T_57 ? 4'h0 : _decodeSigs_T_584; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_586 = _decodeSigs_T_55 ? 4'h0 : _decodeSigs_T_585; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_587 = _decodeSigs_T_53 ? 4'h0 : _decodeSigs_T_586; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_588 = _decodeSigs_T_51 ? 4'h0 : _decodeSigs_T_587; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_589 = _decodeSigs_T_49 ? 4'h0 : _decodeSigs_T_588; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_590 = _decodeSigs_T_47 ? 4'h0 : _decodeSigs_T_589; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_591 = _decodeSigs_T_45 ? 4'h0 : _decodeSigs_T_590; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_592 = _decodeSigs_T_43 ? 4'h0 : _decodeSigs_T_591; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_593 = _decodeSigs_T_41 ? 4'h0 : _decodeSigs_T_592; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_594 = _decodeSigs_T_39 ? 4'h0 : _decodeSigs_T_593; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_595 = _decodeSigs_T_37 ? 4'h0 : _decodeSigs_T_594; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_596 = _decodeSigs_T_35 ? 4'h0 : _decodeSigs_T_595; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_597 = _decodeSigs_T_33 ? 4'h0 : _decodeSigs_T_596; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_598 = _decodeSigs_T_31 ? 4'h0 : _decodeSigs_T_597; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_599 = _decodeSigs_T_29 ? 4'h0 : _decodeSigs_T_598; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_600 = _decodeSigs_T_27 ? 4'h0 : _decodeSigs_T_599; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_601 = _decodeSigs_T_25 ? 4'h0 : _decodeSigs_T_600; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_602 = _decodeSigs_T_23 ? 4'h0 : _decodeSigs_T_601; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_603 = _decodeSigs_T_21 ? 4'h0 : _decodeSigs_T_602; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_604 = _decodeSigs_T_19 ? 4'h0 : _decodeSigs_T_603; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_605 = _decodeSigs_T_17 ? 4'h0 : _decodeSigs_T_604; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_606 = _decodeSigs_T_15 ? 4'h0 : _decodeSigs_T_605; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_607 = _decodeSigs_T_13 ? 4'h0 : _decodeSigs_T_606; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_608 = _decodeSigs_T_11 ? 4'h0 : _decodeSigs_T_607; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_609 = _decodeSigs_T_9 ? 4'h0 : _decodeSigs_T_608; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_610 = _decodeSigs_T_7 ? 4'h0 : _decodeSigs_T_609; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_611 = _decodeSigs_T_5 ? 4'h0 : _decodeSigs_T_610; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_612 = _decodeSigs_T_3 ? 4'h0 : _decodeSigs_T_611; // @[Lookup.scala 34:39]
  assign io_out_isBranch = _decodeSigs_T_1 ? 1'h0 : _decodeSigs_T_142; // @[Lookup.scala 34:39]
  assign io_out_resultSrc = _decodeSigs_T_1 ? 2'h1 : _decodeSigs_T_189; // @[Lookup.scala 34:39]
  assign io_out_aluOpSel = _decodeSigs_T_1 ? 4'h0 : _decodeSigs_T_283; // @[Lookup.scala 34:39]
  assign io_out_lsuOp = _decodeSigs_T_1 ? 5'h1 : _decodeSigs_T_236; // @[Lookup.scala 34:39]
  assign io_out_aluSrc1 = _decodeSigs_T_1 ? 4'h1 : _decodeSigs_T_330; // @[Lookup.scala 34:39]
  assign io_out_aluSrc2 = _decodeSigs_T_1 ? 4'h3 : _decodeSigs_T_377; // @[Lookup.scala 34:39]
  assign io_out_immSrc = decodeSigs_6[1:0]; // @[Decoder.scala 225:19]
  assign io_out_immSign = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | (_decodeSigs_T_7 | (_decodeSigs_T_9 |
    (_decodeSigs_T_11 | _decodeSigs_T_466))))); // @[Lookup.scala 34:39]
  assign io_out_regWrEn = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | (_decodeSigs_T_7 | (_decodeSigs_T_9 |
    (_decodeSigs_T_11 | (_decodeSigs_T_13 | (_decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 | (
    _decodeSigs_T_21 | (_decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 | (_decodeSigs_T_29 | _decodeSigs_T_504
    )))))))))))))); // @[Lookup.scala 34:39]
  assign io_out_csrOp = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_565; // @[Lookup.scala 34:39]
  assign io_out_excType = _decodeSigs_T_1 ? 4'h0 : _decodeSigs_T_612; // @[Lookup.scala 34:39]
endmodule
module CtrlUnit(
  output        io_out_isBranch,
  output        io_out_isJump,
  output [1:0]  io_out_resultSrc,
  output [3:0]  io_out_aluOpSel,
  output [4:0]  io_out_lsuOp,
  output [3:0]  io_out_aluSrc1,
  output [3:0]  io_out_aluSrc2,
  output [1:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn,
  output        io_out_pcAddReg,
  output [2:0]  io_out_csrOp,
  output [3:0]  io_out_excType,
  input  [31:0] io_in_inst
);
  wire [31:0] decoder_io_inst; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_isBranch; // @[CtrlUnit.scala 59:25]
  wire [1:0] decoder_io_out_resultSrc; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluOpSel; // @[CtrlUnit.scala 59:25]
  wire [4:0] decoder_io_out_lsuOp; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluSrc1; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluSrc2; // @[CtrlUnit.scala 59:25]
  wire [1:0] decoder_io_out_immSrc; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_immSign; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_regWrEn; // @[CtrlUnit.scala 59:25]
  wire [2:0] decoder_io_out_csrOp; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_excType; // @[CtrlUnit.scala 59:25]
  wire [6:0] opcode = io_in_inst[6:0]; // @[util.scala 60:34]
  wire  _io_out_pcAddReg_T_1 = 7'h67 == opcode; // @[CtrlUnit.scala 81:31]
  Decoder decoder ( // @[CtrlUnit.scala 59:25]
    .io_inst(decoder_io_inst),
    .io_out_isBranch(decoder_io_out_isBranch),
    .io_out_resultSrc(decoder_io_out_resultSrc),
    .io_out_aluOpSel(decoder_io_out_aluOpSel),
    .io_out_lsuOp(decoder_io_out_lsuOp),
    .io_out_aluSrc1(decoder_io_out_aluSrc1),
    .io_out_aluSrc2(decoder_io_out_aluSrc2),
    .io_out_immSrc(decoder_io_out_immSrc),
    .io_out_immSign(decoder_io_out_immSign),
    .io_out_regWrEn(decoder_io_out_regWrEn),
    .io_out_csrOp(decoder_io_out_csrOp),
    .io_out_excType(decoder_io_out_excType)
  );
  assign io_out_isBranch = decoder_io_out_isBranch; // @[CtrlUnit.scala 63:21]
  assign io_out_isJump = _io_out_pcAddReg_T_1 | 7'h6f == opcode; // @[CtrlUnit.scala 82:45]
  assign io_out_resultSrc = decoder_io_out_resultSrc; // @[CtrlUnit.scala 64:21]
  assign io_out_aluOpSel = decoder_io_out_aluOpSel; // @[CtrlUnit.scala 67:21]
  assign io_out_lsuOp = decoder_io_out_lsuOp; // @[CtrlUnit.scala 68:21]
  assign io_out_aluSrc1 = decoder_io_out_aluSrc1; // @[CtrlUnit.scala 70:21]
  assign io_out_aluSrc2 = decoder_io_out_aluSrc2; // @[CtrlUnit.scala 71:21]
  assign io_out_immSrc = decoder_io_out_immSrc; // @[CtrlUnit.scala 72:21]
  assign io_out_immSign = decoder_io_out_immSign; // @[CtrlUnit.scala 73:21]
  assign io_out_regWrEn = decoder_io_out_regWrEn; // @[CtrlUnit.scala 74:21]
  assign io_out_pcAddReg = 7'h67 == opcode; // @[CtrlUnit.scala 81:31]
  assign io_out_csrOp = decoder_io_out_csrOp; // @[CtrlUnit.scala 76:21]
  assign io_out_excType = decoder_io_out_excType; // @[CtrlUnit.scala 77:21]
  assign decoder_io_inst = io_in_inst; // @[CtrlUnit.scala 61:27]
endmodule
module ImmGen(
  input  [31:0] io_inst,
  input  [2:0]  io_immSrc,
  input         io_immSign,
  output [31:0] io_imm
);
  wire [31:0] immI = {{20'd0}, io_inst[31:20]}; // @[util.scala 48:36]
  wire [11:0] _immS_T_2 = {io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 33:92]
  wire [31:0] immS = {{20'd0}, _immS_T_2}; // @[util.scala 48:36]
  wire [12:0] _immB_T_4 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] immB = {{19'd0}, _immB_T_4}; // @[util.scala 48:36]
  wire [31:0] immU = {io_inst[31:12], 12'h0}; // @[ImmGen.scala 26:36]
  wire [19:0] _immJ_T_4 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[Cat.scala 33:92]
  wire [31:0] immJ = {{12'd0}, _immJ_T_4}; // @[util.scala 48:36]
  wire [11:0] _immI_S_T_1 = io_inst[31:20]; // @[util.scala 37:20]
  wire  immI_S_signBit = _immI_S_T_1[11]; // @[util.scala 28:27]
  wire [9:0] immI_S_out_lo = {immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,
    immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immI_S_out_T_1 = io_inst[31:20]; // @[util.scala 32:75]
  wire [31:0] immI_S = {immI_S_out_lo,immI_S_out_lo,_immI_S_out_T_1}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_T_3 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 37:20]
  wire  immS_S_signBit = _immS_S_T_3[11]; // @[util.scala 28:27]
  wire [9:0] immS_S_out_lo = {immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,
    immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_out_T_1 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 32:75]
  wire [31:0] immS_S = {immS_S_out_lo,immS_S_out_lo,_immS_S_out_T_1}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_T_5 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 37:20]
  wire  immB_S_signBit = _immB_S_T_5[12]; // @[util.scala 28:27]
  wire [9:0] immB_S_out_hi = {immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [18:0] _immB_S_out_T = {immB_S_out_hi,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_out_T_1 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 32:75]
  wire [31:0] immB_S = {_immB_S_out_T,_immB_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] immU_S = {io_inst[31:12], 12'h0}; // @[util.scala 30:18]
  wire [19:0] _immJ_S_T_5 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[util.scala 37:20]
  wire  immJ_S_signBit = _immJ_S_T_5[19]; // @[util.scala 28:27]
  wire [5:0] immJ_S_out_lo = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit}
    ; // @[Cat.scala 33:92]
  wire [19:0] _immJ_S_out_T_1 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[util.scala 32:75]
  wire [31:0] immJ_S = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,
    immJ_S_out_lo,_immJ_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] _out_T_3 = 3'h1 == io_immSrc ? immS_S : immI_S; // @[Mux.scala 81:58]
  wire [31:0] _out_T_5 = 3'h2 == io_immSrc ? immB_S : _out_T_3; // @[Mux.scala 81:58]
  wire [31:0] _out_T_7 = 3'h3 == io_immSrc ? immU_S : _out_T_5; // @[Mux.scala 81:58]
  wire [31:0] _out_T_9 = 3'h4 == io_immSrc ? immJ_S : _out_T_7; // @[Mux.scala 81:58]
  wire [31:0] _out_T_13 = 3'h1 == io_immSrc ? immS : immI; // @[Mux.scala 81:58]
  wire [31:0] _out_T_15 = 3'h2 == io_immSrc ? immB : _out_T_13; // @[Mux.scala 81:58]
  wire [31:0] _out_T_17 = 3'h3 == io_immSrc ? immU : _out_T_15; // @[Mux.scala 81:58]
  wire [31:0] _out_T_19 = 3'h4 == io_immSrc ? immJ : _out_T_17; // @[Mux.scala 81:58]
  wire [31:0] _GEN_0 = io_immSign ? _out_T_9 : _out_T_19; // @[ImmGen.scala 37:19 38:13 46:13]
  wire [31:0] out_out = {{27'd0}, io_inst[19:15]}; // @[util.scala 48:36]
  assign io_imm = io_immSrc == 3'h5 ? out_out : _GEN_0; // @[ImmGen.scala 55:30 56:13]
endmodule
module Decode(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_isBranch,
  output        io_out_bits_isJump,
  output [1:0]  io_out_bits_resultSrc,
  output [4:0]  io_out_bits_lsuOp,
  output [3:0]  io_out_bits_aluOpSel,
  output        io_out_bits_immSign,
  output        io_out_bits_regWrEn,
  output        io_out_bits_pcAddReg,
  output [31:0] io_out_bits_pcNext4,
  output [31:0] io_out_bits_aluIn1,
  output [31:0] io_out_bits_aluIn2,
  output        io_out_bits_aluIn1IsReg,
  output        io_out_bits_aluIn2IsReg,
  output [31:0] io_out_bits_imm,
  output [31:0] io_out_bits_data2,
  output [3:0]  io_out_bits_excType,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  input         io_hazard_in_stall,
  output [4:0]  io_regfile_rs1,
  output [4:0]  io_regfile_rs2,
  input  [31:0] io_regfile_rdata1,
  input  [31:0] io_regfile_rdata2,
  input         io_ctrl_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlUnit_io_out_isBranch; // @[2_Decode.scala 119:29]
  wire  ctrlUnit_io_out_isJump; // @[2_Decode.scala 119:29]
  wire [1:0] ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 119:29]
  wire [3:0] ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 119:29]
  wire [4:0] ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 119:29]
  wire [3:0] ctrlUnit_io_out_aluSrc1; // @[2_Decode.scala 119:29]
  wire [3:0] ctrlUnit_io_out_aluSrc2; // @[2_Decode.scala 119:29]
  wire [1:0] ctrlUnit_io_out_immSrc; // @[2_Decode.scala 119:29]
  wire  ctrlUnit_io_out_immSign; // @[2_Decode.scala 119:29]
  wire  ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 119:29]
  wire  ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 119:29]
  wire [2:0] ctrlUnit_io_out_csrOp; // @[2_Decode.scala 119:29]
  wire [3:0] ctrlUnit_io_out_excType; // @[2_Decode.scala 119:29]
  wire [31:0] ctrlUnit_io_in_inst; // @[2_Decode.scala 119:29]
  wire [31:0] immGen_io_inst; // @[2_Decode.scala 142:24]
  wire [2:0] immGen_io_immSrc; // @[2_Decode.scala 142:24]
  wire  immGen_io_immSign; // @[2_Decode.scala 142:24]
  wire [31:0] immGen_io_imm; // @[2_Decode.scala 142:24]
  wire  _io_in_ready_T = ~io_hazard_in_stall; // @[2_Decode.scala 79:20]
  wire  _io_in_ready_T_2 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  decodeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg [31:0] stageReg_pcNext4; // @[2_Decode.scala 82:27]
  reg  stageReg_instState_commit; // @[2_Decode.scala 82:27]
  reg [31:0] stageReg_instState_pc; // @[2_Decode.scala 82:27]
  reg [31:0] stageReg_instState_inst; // @[2_Decode.scala 82:27]
  wire [4:0] rs1 = stageReg_instState_inst[19:15]; // @[util.scala 58:31]
  wire [31:0] io_out_bits_aluIn1_out = {{27'd0}, rs1}; // @[util.scala 48:36]
  wire [31:0] _io_out_bits_aluIn1_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata2 : _io_out_bits_aluIn1_T_1; // @[Mux.scala 81:58]
  wire [31:0] imm = immGen_io_imm; // @[2_Decode.scala 146:25 96:25]
  wire [31:0] _io_out_bits_aluIn1_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc1 ? imm : _io_out_bits_aluIn1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc1 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn1_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc1 ? stageReg_instState_pc :
    _io_out_bits_aluIn1_T_7; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata2 : _io_out_bits_aluIn2_T_1; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc2 ? imm : _io_out_bits_aluIn2_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc2 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn2_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc2 ? stageReg_instState_pc :
    _io_out_bits_aluIn2_T_7; // @[Mux.scala 81:58]
  CtrlUnit ctrlUnit ( // @[2_Decode.scala 119:29]
    .io_out_isBranch(ctrlUnit_io_out_isBranch),
    .io_out_isJump(ctrlUnit_io_out_isJump),
    .io_out_resultSrc(ctrlUnit_io_out_resultSrc),
    .io_out_aluOpSel(ctrlUnit_io_out_aluOpSel),
    .io_out_lsuOp(ctrlUnit_io_out_lsuOp),
    .io_out_aluSrc1(ctrlUnit_io_out_aluSrc1),
    .io_out_aluSrc2(ctrlUnit_io_out_aluSrc2),
    .io_out_immSrc(ctrlUnit_io_out_immSrc),
    .io_out_immSign(ctrlUnit_io_out_immSign),
    .io_out_regWrEn(ctrlUnit_io_out_regWrEn),
    .io_out_pcAddReg(ctrlUnit_io_out_pcAddReg),
    .io_out_csrOp(ctrlUnit_io_out_csrOp),
    .io_out_excType(ctrlUnit_io_out_excType),
    .io_in_inst(ctrlUnit_io_in_inst)
  );
  ImmGen immGen ( // @[2_Decode.scala 142:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = ~io_hazard_in_stall & io_in_valid & _io_in_ready_T_2; // @[2_Decode.scala 79:42]
  assign io_out_valid = ~io_hazard_in_stall; // @[2_Decode.scala 181:21]
  assign io_out_bits_isBranch = ctrlUnit_io_out_isBranch; // @[2_Decode.scala 150:29]
  assign io_out_bits_isJump = ctrlUnit_io_out_isJump; // @[2_Decode.scala 151:29]
  assign io_out_bits_resultSrc = ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 152:29]
  assign io_out_bits_lsuOp = ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 153:29]
  assign io_out_bits_aluOpSel = ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 154:29]
  assign io_out_bits_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 157:29]
  assign io_out_bits_regWrEn = ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 156:29]
  assign io_out_bits_pcAddReg = ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 155:29]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[2_Decode.scala 173:29]
  assign io_out_bits_aluIn1 = 4'h8 == ctrlUnit_io_out_aluSrc1 ? 32'h4 : _io_out_bits_aluIn1_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn2 = 4'h8 == ctrlUnit_io_out_aluSrc2 ? 32'h4 : _io_out_bits_aluIn2_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn1IsReg = ctrlUnit_io_out_aluSrc1 == 4'h1 | ctrlUnit_io_out_aluSrc1 == 4'h2; // @[2_Decode.scala 168:54]
  assign io_out_bits_aluIn2IsReg = ctrlUnit_io_out_aluSrc2 == 4'h1 | ctrlUnit_io_out_aluSrc2 == 4'h2; // @[2_Decode.scala 169:54]
  assign io_out_bits_imm = immGen_io_imm; // @[2_Decode.scala 146:25 96:25]
  assign io_out_bits_data2 = io_regfile_rdata2; // @[2_Decode.scala 140:21 98:29]
  assign io_out_bits_excType = ctrlUnit_io_out_excType; // @[2_Decode.scala 162:29]
  assign io_out_bits_csrOp = ctrlUnit_io_out_csrOp; // @[2_Decode.scala 161:29]
  assign io_out_bits_instState_commit = io_ctrl_flush ? 1'h0 : stageReg_instState_commit; // @[2_Decode.scala 175:40]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[2_Decode.scala 174:29]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[2_Decode.scala 174:29]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 58:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 59:31]
  assign io_regfile_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 58:31]
  assign io_regfile_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 59:31]
  assign ctrlUnit_io_in_inst = stageReg_instState_inst; // @[2_Decode.scala 134:25]
  assign immGen_io_inst = stageReg_instState_inst; // @[2_Decode.scala 143:25]
  assign immGen_io_immSrc = {{1'd0}, ctrlUnit_io_out_immSrc}; // @[2_Decode.scala 144:25]
  assign immGen_io_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 145:25]
  always @(posedge clock) begin
    if (reset) begin // @[2_Decode.scala 82:27]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 82:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[2_Decode.scala 90:27]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 90:38]
    end else if (decodeLatch) begin // @[2_Decode.scala 83:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[2_Decode.scala 84:18]
    end else if (_io_in_ready_T_2) begin // @[2_Decode.scala 85:28]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 86:18]
    end
    if (reset) begin // @[2_Decode.scala 82:27]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 82:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[2_Decode.scala 90:27]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 90:38]
    end else if (decodeLatch) begin // @[2_Decode.scala 83:23]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[2_Decode.scala 84:18]
    end else if (_io_in_ready_T_2) begin // @[2_Decode.scala 85:28]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 86:18]
    end
    if (reset) begin // @[2_Decode.scala 82:27]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 82:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[2_Decode.scala 90:27]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 90:38]
    end else if (decodeLatch) begin // @[2_Decode.scala 83:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[2_Decode.scala 84:18]
    end else if (_io_in_ready_T_2) begin // @[2_Decode.scala 85:28]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 86:18]
    end
    if (reset) begin // @[2_Decode.scala 82:27]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 82:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[2_Decode.scala 90:27]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 90:38]
    end else if (decodeLatch) begin // @[2_Decode.scala 83:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[2_Decode.scala 84:18]
    end else if (_io_in_ready_T_2) begin // @[2_Decode.scala 85:28]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 86:18]
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
  stageReg_pcNext4 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [3:0]  io_opSel,
  output [31:0] io_out,
  output        io_zero
);
  wire [31:0] _sum_T_2 = 32'h0 - io_in2; // @[Alu.scala 25:41]
  wire [31:0] _sum_T_3 = io_opSel[0] ? _sum_T_2 : io_in2; // @[Alu.scala 25:27]
  wire [31:0] sum = io_in1 + _sum_T_3; // @[Alu.scala 25:22]
  wire [4:0] shamt = io_in2[4:0]; // @[Alu.scala 28:23]
  wire [31:0] _shiftr_T_1 = io_in1 >> shamt; // @[Alu.scala 30:32]
  wire [31:0] _shiftr_T_4 = $signed(io_in1) >>> shamt; // @[Alu.scala 31:49]
  wire [31:0] shiftr = io_opSel[1] ? _shiftr_T_1 : _shiftr_T_4; // @[Alu.scala 29:21]
  wire [62:0] _GEN_5 = {{31'd0}, io_in1}; // @[Alu.scala 33:25]
  wire [62:0] shiftl = _GEN_5 << shamt; // @[Alu.scala 33:25]
  wire [31:0] _shout_T_3 = io_opSel == 4'hb | io_opSel == 4'hc ? shiftr : 32'h0; // @[Alu.scala 34:20]
  wire [62:0] _shout_T_5 = io_opSel == 4'ha ? shiftl : 63'h0; // @[Alu.scala 35:20]
  wire [62:0] _GEN_2 = {{31'd0}, _shout_T_3}; // @[Alu.scala 34:80]
  wire [62:0] shout = _GEN_2 | _shout_T_5; // @[Alu.scala 34:80]
  wire [31:0] _logic_T = io_in1 & io_in2; // @[Alu.scala 40:40]
  wire [31:0] _logic_T_1 = io_in1 | io_in2; // @[Alu.scala 41:40]
  wire [31:0] _logic_T_2 = io_in1 ^ io_in2; // @[Alu.scala 42:40]
  wire [31:0] _logic_T_4 = 4'h2 == io_opSel ? _logic_T : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _logic_T_6 = 4'h3 == io_opSel ? _logic_T_1 : _logic_T_4; // @[Mux.scala 81:58]
  wire [31:0] logic_ = 4'h4 == io_opSel ? _logic_T_2 : _logic_T_6; // @[Mux.scala 81:58]
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[Alu.scala 48:48]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[Alu.scala 49:41]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[Alu.scala 50:41]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[Alu.scala 51:41]
  wire  _cmp_T_8 = $signed(io_in1) >= $signed(io_in2); // @[Alu.scala 52:48]
  wire  _cmp_T_9 = io_in1 >= io_in2; // @[Alu.scala 53:42]
  wire  _cmp_T_13 = 4'h9 == io_opSel ? _cmp_T_3 : 4'h8 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_15 = 4'h5 == io_opSel ? _cmp_T_4 : _cmp_T_13; // @[Mux.scala 81:58]
  wire  _cmp_T_17 = 4'h6 == io_opSel ? _cmp_T_5 : _cmp_T_15; // @[Mux.scala 81:58]
  wire  _cmp_T_19 = 4'h7 == io_opSel ? _cmp_T_8 : _cmp_T_17; // @[Mux.scala 81:58]
  wire  cmp = 4'hf == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
  wire [31:0] _GEN_3 = {{31'd0}, cmp}; // @[Alu.scala 62:66]
  wire [31:0] _io_out_T_3 = _GEN_3 | logic_; // @[Alu.scala 62:66]
  wire [62:0] _GEN_4 = {{31'd0}, _io_out_T_3}; // @[Alu.scala 62:74]
  wire [62:0] _io_out_T_4 = _GEN_4 | shout; // @[Alu.scala 62:74]
  wire [62:0] _io_out_T_5 = io_opSel == 4'h0 | io_opSel == 4'h1 ? {{31'd0}, sum} : _io_out_T_4; // @[Alu.scala 62:22]
  wire [62:0] _GEN_0 = io_opSel == 4'he ? {{31'd0}, io_in2} : _io_out_T_5; // @[Alu.scala 59:33 60:16 62:16]
  wire [62:0] _GEN_1 = io_opSel == 4'hd ? {{31'd0}, io_in1} : _GEN_0; // @[Alu.scala 57:27 58:16]
  assign io_out = _GEN_1[31:0];
  assign io_zero = 4'hf == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
endmodule
module Execute(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input         io_in_bits_isBranch,
  input         io_in_bits_isJump,
  input  [1:0]  io_in_bits_resultSrc,
  input  [4:0]  io_in_bits_lsuOp,
  input  [3:0]  io_in_bits_aluOpSel,
  input         io_in_bits_immSign,
  input         io_in_bits_regWrEn,
  input         io_in_bits_pcAddReg,
  input  [31:0] io_in_bits_pcNext4,
  input  [31:0] io_in_bits_aluIn1,
  input  [31:0] io_in_bits_aluIn2,
  input         io_in_bits_aluIn1IsReg,
  input         io_in_bits_aluIn2IsReg,
  input  [31:0] io_in_bits_imm,
  input  [31:0] io_in_bits_data2,
  input  [3:0]  io_in_bits_excType,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_memory_ready,
  output        io_out_memory_valid,
  output [1:0]  io_out_memory_bits_resultSrc,
  output [4:0]  io_out_memory_bits_lsuOp,
  output        io_out_memory_bits_regWrEn,
  output [31:0] io_out_memory_bits_aluOut,
  output [31:0] io_out_memory_bits_data2,
  output [31:0] io_out_memory_bits_pcNext4,
  output [2:0]  io_out_memory_bits_csrOp,
  output        io_out_memory_bits_csrWrEn,
  output        io_out_memory_bits_csrValid,
  output [31:0] io_out_memory_bits_csrWrData,
  output [31:0] io_out_memory_bits_csrAddr,
  output [3:0]  io_out_memory_bits_excType,
  output        io_out_memory_bits_instState_commit,
  output [31:0] io_out_memory_bits_instState_pc,
  output [31:0] io_out_memory_bits_instState_inst,
  output        io_out_fetch_bits_brTaken,
  output [31:0] io_out_fetch_bits_targetAddr,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  output [1:0]  io_hazard_out_resultSrc,
  output [4:0]  io_hazard_out_rd,
  input  [1:0]  io_hazard_in_aluSrc1,
  input  [1:0]  io_hazard_in_aluSrc2,
  input  [31:0] io_hazard_in_rdValM,
  input  [31:0] io_hazard_in_rdValW,
  input         io_ctrl_flush,
  output [2:0]  io_csrRead_op,
  input         io_csrRead_valid,
  output [11:0] io_csrRead_addr
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_in1; // @[3_Execute.scala 102:29]
  wire [31:0] alu_io_in2; // @[3_Execute.scala 102:29]
  wire [3:0] alu_io_opSel; // @[3_Execute.scala 102:29]
  wire [31:0] alu_io_out; // @[3_Execute.scala 102:29]
  wire  alu_io_zero; // @[3_Execute.scala 102:29]
  wire  _io_in_ready_T_2 = io_out_memory_ready & io_out_memory_valid; // @[Decoupled.scala 51:35]
  wire  executeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg  stageReg_isBranch; // @[3_Execute.scala 89:27]
  reg  stageReg_isJump; // @[3_Execute.scala 89:27]
  reg [1:0] stageReg_resultSrc; // @[3_Execute.scala 89:27]
  reg [4:0] stageReg_lsuOp; // @[3_Execute.scala 89:27]
  reg [3:0] stageReg_aluOpSel; // @[3_Execute.scala 89:27]
  reg  stageReg_immSign; // @[3_Execute.scala 89:27]
  reg  stageReg_regWrEn; // @[3_Execute.scala 89:27]
  reg  stageReg_pcAddReg; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_pcNext4; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_aluIn1; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_aluIn2; // @[3_Execute.scala 89:27]
  reg  stageReg_aluIn1IsReg; // @[3_Execute.scala 89:27]
  reg  stageReg_aluIn2IsReg; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_imm; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_data2; // @[3_Execute.scala 89:27]
  reg [3:0] stageReg_excType; // @[3_Execute.scala 89:27]
  reg [2:0] stageReg_csrOp; // @[3_Execute.scala 89:27]
  reg  stageReg_instState_commit; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_instState_pc; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_instState_inst; // @[3_Execute.scala 89:27]
  wire [31:0] _hazardData1_T_3 = 2'h1 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValM : stageReg_aluIn1; // @[Mux.scala 81:58]
  wire [31:0] hazardData1 = 2'h2 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValW : _hazardData1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _hazardData2_T_3 = 2'h1 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValM : stageReg_aluIn2; // @[Mux.scala 81:58]
  wire [31:0] hazardData2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _hazardData2_T_3; // @[Mux.scala 81:58]
  wire  aluZero = alu_io_zero; // @[3_Execute.scala 134:18 98:23]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_5 = $signed(stageReg_imm) + $signed(stageReg_instState_pc); // @[3_Execute.scala 140:102]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_7 = stageReg_imm + stageReg_instState_pc; // @[3_Execute.scala 141:62]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_8 = stageReg_immSign ? _io_out_fetch_bits_targetAddr_T_5 :
    _io_out_fetch_bits_targetAddr_T_7; // @[3_Execute.scala 139:48]
  wire [31:0] _io_out_memory_bits_data2_T_3 = io_hazard_in_aluSrc2 == 2'h2 ? io_hazard_in_rdValW : stageReg_data2; // @[3_Execute.scala 155:52]
  wire [31:0] _io_out_memory_bits_data2_T_4 = io_hazard_in_aluSrc2 == 2'h1 ? io_hazard_in_rdValM :
    _io_out_memory_bits_data2_T_3; // @[3_Execute.scala 153:48]
  wire [11:0] csrAddr = stageReg_instState_inst[31:20]; // @[util.scala 64:36]
  ALU alu ( // @[3_Execute.scala 102:29]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out),
    .io_zero(alu_io_zero)
  );
  assign io_in_ready = io_in_valid & _io_in_ready_T_2; // @[3_Execute.scala 87:43]
  assign io_out_memory_valid = 1'h1; // @[3_Execute.scala 190:39]
  assign io_out_memory_bits_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 148:37]
  assign io_out_memory_bits_lsuOp = stageReg_lsuOp; // @[3_Execute.scala 149:37]
  assign io_out_memory_bits_regWrEn = stageReg_regWrEn; // @[3_Execute.scala 150:37]
  assign io_out_memory_bits_aluOut = alu_io_out; // @[3_Execute.scala 147:37]
  assign io_out_memory_bits_data2 = io_hazard_in_aluSrc2 == 2'h0 ? stageReg_data2 : _io_out_memory_bits_data2_T_4; // @[3_Execute.scala 151:43]
  assign io_out_memory_bits_pcNext4 = stageReg_pcNext4; // @[3_Execute.scala 161:37]
  assign io_out_memory_bits_csrOp = stageReg_csrOp; // @[3_Execute.scala 168:35]
  assign io_out_memory_bits_csrWrEn = stageReg_csrOp != 3'h0 & io_csrRead_valid; // @[3_Execute.scala 169:65]
  assign io_out_memory_bits_csrValid = io_csrRead_valid; // @[3_Execute.scala 170:35]
  assign io_out_memory_bits_csrWrData = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 118:27]
  assign io_out_memory_bits_csrAddr = {{20'd0}, csrAddr}; // @[3_Execute.scala 173:35]
  assign io_out_memory_bits_excType = stageReg_excType; // @[3_Execute.scala 174:35]
  assign io_out_memory_bits_instState_commit = io_ctrl_flush ? 1'h0 : stageReg_instState_commit; // @[3_Execute.scala 187:47]
  assign io_out_memory_bits_instState_pc = stageReg_instState_pc; // @[3_Execute.scala 186:35]
  assign io_out_memory_bits_instState_inst = stageReg_instState_inst; // @[3_Execute.scala 186:35]
  assign io_out_fetch_bits_brTaken = stageReg_isBranch & aluZero | stageReg_isJump; // @[3_Execute.scala 137:71]
  assign io_out_fetch_bits_targetAddr = stageReg_pcAddReg ? alu_io_out : _io_out_fetch_bits_targetAddr_T_8; // @[3_Execute.scala 138:43]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 58:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 59:31]
  assign io_hazard_out_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 182:35]
  assign io_hazard_out_rd = stageReg_instState_inst[11:7]; // @[util.scala 57:31]
  assign io_csrRead_op = stageReg_csrOp; // @[3_Execute.scala 167:35]
  assign io_csrRead_addr = stageReg_instState_inst[31:20]; // @[util.scala 64:36]
  assign alu_io_in1 = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 118:27]
  assign alu_io_in2 = stageReg_aluIn2IsReg ? hazardData2 : stageReg_aluIn2; // @[3_Execute.scala 120:27]
  assign alu_io_opSel = stageReg_aluOpSel; // @[3_Execute.scala 133:18]
  always @(posedge clock) begin
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_isBranch <= io_in_bits_isBranch; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_isJump <= io_in_bits_isJump; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluOpSel <= io_in_bits_aluOpSel; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_immSign <= io_in_bits_immSign; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_regWrEn <= io_in_bits_regWrEn; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_pcAddReg <= io_in_bits_pcAddReg; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn1 <= io_in_bits_aluIn1; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn2 <= io_in_bits_aluIn2; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn1IsReg <= io_in_bits_aluIn1IsReg; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn2IsReg <= io_in_bits_aluIn2IsReg; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_imm <= io_in_bits_imm; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_data2 <= io_in_bits_data2; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_excType <= io_in_bits_excType; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_csrOp <= io_in_bits_csrOp; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 93:18]
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:27]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 96:38]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[3_Execute.scala 91:18]
    end else if (_io_in_ready_T_2) begin // @[3_Execute.scala 92:35]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 93:18]
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
  stageReg_isBranch = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_isJump = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_resultSrc = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_lsuOp = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_aluOpSel = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_immSign = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_pcAddReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_aluIn1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_aluIn2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_aluIn1IsReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_aluIn2IsReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_imm = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_data2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stageReg_excType = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LSU_1(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_wdata,
  input  [4:0]  io_req_bits_lsuOp,
  output        io_resp_valid,
  output [31:0] io_resp_bits_rdata,
  input         io_cache_read_req_ready,
  output        io_cache_read_req_valid,
  output [31:0] io_cache_read_req_bits_addr,
  output        io_cache_read_resp_ready,
  input         io_cache_read_resp_valid,
  input  [31:0] io_cache_read_resp_bits_data,
  input         io_cache_write_req_ready,
  output        io_cache_write_req_valid,
  output [31:0] io_cache_write_req_bits_addr,
  output [31:0] io_cache_write_req_bits_data,
  output [3:0]  io_cache_write_req_bits_mask,
  output        io_cache_write_resp_ready,
  input         io_cache_write_resp_valid
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
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[LSU.scala 206:26]
  wire  s0_latch = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T = io_cache_read_req_ready & io_cache_read_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_holdReg; // @[Reg.scala 19:16]
  wire  _s0_valid_T_1 = _s0_valid_T | s0_valid_holdReg; // @[util.scala 12:12]
  reg [4:0] s0_reqReg_lsuOp; // @[Reg.scala 19:16]
  wire [4:0] s0_req_lsuOp = s0_latch ? io_req_bits_lsuOp : s0_reqReg_lsuOp; // @[LSU.scala 211:21]
  wire  _T_7 = 5'h1 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_9 = 5'h2 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_11 = 5'h3 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h4 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h5 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_17 = 5'h6 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_19 = 5'h7 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_21 = 5'h8 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  load = _T_7 | (_T_9 | (_T_11 | (_T_13 | _T_15))); // @[Lookup.scala 34:39]
  wire  _s0_valid_T_3 = io_cache_write_req_ready & io_cache_write_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_holdReg_1; // @[Reg.scala 19:16]
  wire  _s0_valid_T_4 = _s0_valid_T_3 | s0_valid_holdReg_1; // @[util.scala 12:12]
  wire  _T_36 = _T_15 ? 1'h0 : _T_17 | (_T_19 | _T_21); // @[Lookup.scala 34:39]
  wire  _T_37 = _T_13 ? 1'h0 : _T_36; // @[Lookup.scala 34:39]
  wire  _T_38 = _T_11 ? 1'h0 : _T_37; // @[Lookup.scala 34:39]
  wire  _T_39 = _T_9 ? 1'h0 : _T_38; // @[Lookup.scala 34:39]
  wire  wen = _T_7 ? 1'h0 : _T_39; // @[Lookup.scala 34:39]
  wire  s0_valid = _s0_valid_T_1 & load | _s0_valid_T_4 & wen; // @[LSU.scala 272:73]
  reg  s1_full; // @[LSU.scala 278:26]
  wire  s1_ready = ~s1_full; // @[LSU.scala 285:17]
  wire  s0_fire = s0_valid & s1_ready; // @[LSU.scala 208:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_wdata; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_1 = s0_latch ? io_req_bits_wdata : s0_reqReg_wdata; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] s0_offset = _GEN_0[1:0]; // @[LSU.scala 212:32]
  wire  _GEN_4 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LSU.scala 206:26 220:{35,45}]
  wire  _GEN_5 = s0_latch & ~(s0_req_lsuOp == 5'h0 | s0_req_lsuOp == 5'h14) | _GEN_4; // @[LSU.scala 219:{80,90}]
  wire  en = _T_7 | (_T_9 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | _T_21)))))); // @[Lookup.scala 34:39]
  wire [1:0] _T_49 = _T_21 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_50 = _T_19 ? 2'h1 : _T_49; // @[Lookup.scala 34:39]
  wire [1:0] _T_51 = _T_17 ? 2'h0 : _T_50; // @[Lookup.scala 34:39]
  wire [1:0] _T_52 = _T_15 ? 2'h1 : _T_51; // @[Lookup.scala 34:39]
  wire [1:0] _T_53 = _T_13 ? 2'h0 : _T_52; // @[Lookup.scala 34:39]
  wire [1:0] _T_54 = _T_11 ? 2'h2 : _T_53; // @[Lookup.scala 34:39]
  wire [1:0] _T_55 = _T_9 ? 2'h1 : _T_54; // @[Lookup.scala 34:39]
  wire [1:0] width = _T_7 ? 2'h0 : _T_55; // @[Lookup.scala 34:39]
  wire  signed_ = _T_7 | (_T_9 | (_T_11 | _T_37)); // @[Lookup.scala 34:39]
  wire  _s0_reqSend_T_2 = _s0_valid_T | _s0_valid_T_3; // @[LSU.scala 250:72]
  reg  s0_reqSend; // @[Reg.scala 35:20]
  wire  _GEN_8 = _s0_reqSend_T_2 | s0_reqSend; // @[Reg.scala 36:18 35:20 36:22]
  wire  _io_cache_read_req_valid_T_1 = ~s0_reqSend; // @[LSU.scala 252:51]
  wire [4:0] _io_cache_write_req_bits_data_T = {s0_offset, 3'h0}; // @[LSU.scala 257:64]
  wire [62:0] _GEN_2 = {{31'd0}, _GEN_1}; // @[LSU.scala 257:50]
  wire [62:0] _io_cache_write_req_bits_data_T_1 = _GEN_2 << _io_cache_write_req_bits_data_T; // @[LSU.scala 257:50]
  wire [3:0] _s0_storeMask_T_1 = 4'h1 << s0_offset; // @[OneHot.scala 57:35]
  wire [2:0] _s0_storeMask_T_6 = 2'h1 == s0_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_8 = 2'h2 == s0_offset ? 4'hc : {{1'd0}, _s0_storeMask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_10 = 2'h0 == width ? _s0_storeMask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_12 = 2'h1 == width ? _s0_storeMask_T_8 : _s0_storeMask_T_10; // @[Mux.scala 81:58]
  reg  s1_signed; // @[Reg.scala 19:16]
  reg [1:0] s1_width; // @[Reg.scala 19:16]
  reg [1:0] s1_offset; // @[Reg.scala 19:16]
  wire  _s1_loadRespValid_T = io_cache_read_resp_ready & io_cache_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  s1_loadRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s1_loadRespValid = _s1_loadRespValid_T ? io_cache_read_resp_valid : s1_loadRespValid_holdReg; // @[util.scala 12:12]
  wire  _s1_storeRespValid_T = io_cache_write_resp_ready & io_cache_write_resp_valid; // @[Decoupled.scala 51:35]
  reg  s1_storeRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s1_storeRespValid = _s1_storeRespValid_T ? io_cache_write_resp_valid : s1_storeRespValid_holdReg; // @[util.scala 12:12]
  wire  s1_fire = s1_full & (s1_loadRespValid | s1_storeRespValid); // @[LSU.scala 318:25]
  wire  _GEN_17 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LSU.scala 278:26 287:{35,45}]
  wire  _GEN_18 = s0_fire | _GEN_17; // @[LSU.scala 286:{20,30}]
  reg [31:0] s1_loadResp_holdReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_21 = _s1_loadRespValid_T ? io_cache_read_resp_bits_data : s1_loadResp_holdReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s1_loadData_T_2 = {8'h0,_GEN_21[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_5 = {16'h0,_GEN_21[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_8 = {24'h0,_GEN_21[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_10 = 2'h1 == s1_offset ? _s1_loadData_T_2 : _GEN_21; // @[Mux.scala 81:58]
  wire [31:0] _s1_loadData_T_12 = 2'h2 == s1_offset ? _s1_loadData_T_5 : _s1_loadData_T_10; // @[Mux.scala 81:58]
  wire [31:0] s1_loadData = 2'h3 == s1_offset ? _s1_loadData_T_8 : _s1_loadData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_resp_bits_rdata_T_1 = s1_loadData[7:0]; // @[LSU.scala 311:85]
  wire  io_resp_bits_rdata_signBit = _io_resp_bits_rdata_T_1[7]; // @[util.scala 28:27]
  wire [5:0] io_resp_bits_rdata_out_lo_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_resp_bits_rdata_out_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_resp_bits_rdata_out_T_1 = s1_loadData[7:0]; // @[util.scala 32:75]
  wire [31:0] io_resp_bits_rdata_out = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit
    ,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_out_lo_lo,
    io_resp_bits_rdata_out_lo,_io_resp_bits_rdata_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_1 = {{24'd0}, s1_loadData[7:0]}; // @[util.scala 48:36]
  wire [31:0] _io_resp_bits_rdata_T_3 = s1_signed ? io_resp_bits_rdata_out : io_resp_bits_rdata_out_1; // @[LSU.scala 311:48]
  wire [15:0] _io_resp_bits_rdata_T_5 = s1_loadData[15:0]; // @[LSU.scala 312:86]
  wire  io_resp_bits_rdata_signBit_1 = _io_resp_bits_rdata_T_5[15]; // @[util.scala 28:27]
  wire [7:0] io_resp_bits_rdata_out_lo_1 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_resp_bits_rdata_out_T_3 = s1_loadData[15:0]; // @[util.scala 32:75]
  wire [31:0] io_resp_bits_rdata_out_2 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_out_lo_1,_io_resp_bits_rdata_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_3 = {{16'd0}, s1_loadData[15:0]}; // @[util.scala 48:36]
  wire [31:0] _io_resp_bits_rdata_T_7 = s1_signed ? io_resp_bits_rdata_out_2 : io_resp_bits_rdata_out_3; // @[LSU.scala 312:48]
  wire [31:0] _io_resp_bits_rdata_T_10 = 2'h3 == s1_offset ? _s1_loadData_T_8 : _s1_loadData_T_12; // @[util.scala 30:18]
  wire [31:0] _io_resp_bits_rdata_T_12 = s1_signed ? _io_resp_bits_rdata_T_10 : s1_loadData; // @[LSU.scala 313:48]
  wire [31:0] _io_resp_bits_rdata_T_14 = 2'h0 == s1_width ? _io_resp_bits_rdata_T_3 : s1_loadData; // @[Mux.scala 81:58]
  wire [31:0] _io_resp_bits_rdata_T_16 = 2'h1 == s1_width ? _io_resp_bits_rdata_T_7 : _io_resp_bits_rdata_T_14; // @[Mux.scala 81:58]
  wire  s0_en = en; // @[Lookup.scala 34:39]
  assign io_req_ready = ~s0_full; // @[LSU.scala 217:21]
  assign io_resp_valid = s1_full & (s1_loadRespValid | s1_storeRespValid); // @[LSU.scala 318:25]
  assign io_resp_bits_rdata = 2'h2 == s1_width ? _io_resp_bits_rdata_T_12 : _io_resp_bits_rdata_T_16; // @[Mux.scala 81:58]
  assign io_cache_read_req_valid = load & s0_full & ~s0_reqSend; // @[LSU.scala 252:48]
  assign io_cache_read_req_bits_addr = {_GEN_0[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_read_resp_ready = 1'h1; // @[LSU.scala 294:30]
  assign io_cache_write_req_valid = wen & s0_full & _io_cache_read_req_valid_T_1; // @[LSU.scala 255:48]
  assign io_cache_write_req_bits_addr = {_GEN_0[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_write_req_bits_data = _io_cache_write_req_bits_data_T_1[31:0]; // @[LSU.scala 257:34]
  assign io_cache_write_req_bits_mask = 2'h2 == width ? 4'hf : _s0_storeMask_T_12; // @[Mux.scala 81:58]
  assign io_cache_write_resp_ready = 1'h1; // @[LSU.scala 295:31]
  always @(posedge clock) begin
    if (reset) begin // @[LSU.scala 206:26]
      s0_full <= 1'h0; // @[LSU.scala 206:26]
    end else begin
      s0_full <= _GEN_5;
    end
    if (s0_fire) begin // @[util.scala 11:21]
      s0_valid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      s0_valid_holdReg <= _s0_valid_T_1;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[util.scala 11:21]
      s0_valid_holdReg_1 <= 1'h0; // @[util.scala 11:31]
    end else begin
      s0_valid_holdReg_1 <= _s0_valid_T_4;
    end
    if (reset) begin // @[LSU.scala 278:26]
      s1_full <= 1'h0; // @[LSU.scala 278:26]
    end else begin
      s1_full <= _GEN_18;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_wdata <= io_req_bits_wdata; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s0_reqSend <= 1'h0; // @[Reg.scala 35:20]
    end else if (s0_fire) begin // @[LSU.scala 251:19]
      s0_reqSend <= 1'h0; // @[LSU.scala 251:32]
    end else begin
      s0_reqSend <= _GEN_8;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_signed <= signed_; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (_T_7) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h0;
      end else if (_T_9) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h1;
      end else if (_T_11) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h2;
      end else begin
        s1_width <= _T_53;
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_offset <= s0_offset; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[util.scala 11:21]
      s1_loadRespValid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (_s1_loadRespValid_T) begin // @[util.scala 12:12]
      s1_loadRespValid_holdReg <= io_cache_read_resp_valid;
    end
    if (s0_fire) begin // @[util.scala 11:21]
      s1_storeRespValid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (_s1_storeRespValid_T) begin // @[util.scala 12:12]
      s1_storeRespValid_holdReg <= io_cache_write_resp_valid;
    end
    if (s0_fire) begin // @[util.scala 11:21]
      s1_loadResp_holdReg_data <= 32'h0; // @[util.scala 11:31]
    end else if (_s1_loadRespValid_T) begin // @[Reg.scala 20:18]
      s1_loadResp_holdReg_data <= io_cache_read_resp_bits_data; // @[Reg.scala 20:22]
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
  s0_valid_holdReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_reqReg_lsuOp = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  s0_valid_holdReg_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_full = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s0_reqReg_wdata = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s0_reqSend = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_signed = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_width = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  s1_offset = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s1_loadRespValid_holdReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_storeRespValid_holdReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_loadResp_holdReg_data = _RAND_13[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Arbiter_5(
  input   io_in_0_valid,
  output  io_in_1_ready,
  input   io_in_1_valid,
  output  io_out_valid
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
endmodule
module Arbiter_6(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input  [5:0]  io_in_0_bits_set,
  input  [1:0]  io_in_0_bits_blockSelOH,
  input  [3:0]  io_in_0_bits_way,
  input  [3:0]  io_in_0_bits_mask,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input  [5:0]  io_in_1_bits_set,
  input  [1:0]  io_in_1_bits_blockSelOH,
  input  [3:0]  io_in_1_bits_way,
  input  [3:0]  io_in_1_bits_mask,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [5:0]  io_out_bits_set,
  output [1:0]  io_out_bits_blockSelOH,
  output [3:0]  io_out_bits_way,
  output [3:0]  io_out_bits_mask
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_blockSelOH = io_in_0_valid ? io_in_0_bits_blockSelOH : io_in_1_bits_blockSelOH; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : io_in_1_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_mask = io_in_0_valid ? io_in_0_bits_mask : io_in_1_bits_mask; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module Arbiter_7(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input  [3:0]  io_in_0_bits_way,
  input  [1:0]  io_in_0_bits_meta,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input  [3:0]  io_in_1_bits_way,
  input  [1:0]  io_in_1_bits_meta,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output [3:0]  io_out_bits_way,
  output [1:0]  io_out_bits_meta
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_way = io_in_0_valid ? io_in_0_bits_way : io_in_1_bits_way; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_meta = io_in_0_valid ? io_in_0_bits_meta : io_in_1_bits_meta; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module StorePipe(
  input          clock,
  input          reset,
  output         io_store_req_ready,
  input          io_store_req_valid,
  input  [31:0]  io_store_req_bits_addr,
  input  [31:0]  io_store_req_bits_data,
  input  [3:0]   io_store_req_bits_mask,
  output         io_store_resp_valid,
  output         io_dir_read_req_valid,
  output [31:0]  io_dir_read_req_bits_addr,
  input          io_dir_read_resp_valid,
  input          io_dir_read_resp_bits_hit,
  input  [3:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  input          io_dir_write_req_ready,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [3:0]   io_dir_write_req_bits_way,
  output [1:0]   io_dir_write_req_bits_meta,
  output         io_dataBank_read_req_valid,
  output [5:0]   io_dataBank_read_req_bits_set,
  output [1:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [127:0] io_dataBank_read_resp_bits_blockData_0,
  input  [127:0] io_dataBank_read_resp_bits_blockData_1,
  input          io_dataBank_write_req_ready,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [5:0]   io_dataBank_write_req_bits_set,
  output [1:0]   io_dataBank_write_req_bits_blockSelOH,
  output [3:0]   io_dataBank_write_req_bits_way,
  output [3:0]   io_dataBank_write_req_bits_mask,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [2:0]   io_tlbus_req_bits_opcode,
  output [31:0]  io_tlbus_req_bits_address,
  output [31:0]  io_tlbus_req_bits_data,
  output         io_tlbus_resp_ready,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [31:0]  io_tlbus_resp_bits_data
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
`endif // RANDOMIZE_REG_INIT
  wire  tlbusReqArb_io_in_0_ready; // @[StorePipe.scala 246:29]
  wire  tlbusReqArb_io_in_0_valid; // @[StorePipe.scala 246:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[StorePipe.scala 246:29]
  wire  tlbusReqArb_io_in_1_ready; // @[StorePipe.scala 246:29]
  wire  tlbusReqArb_io_in_1_valid; // @[StorePipe.scala 246:29]
  wire [2:0] tlbusReqArb_io_in_1_bits_opcode; // @[StorePipe.scala 246:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[StorePipe.scala 246:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_data; // @[StorePipe.scala 246:29]
  wire  tlbusReqArb_io_out_ready; // @[StorePipe.scala 246:29]
  wire  tlbusReqArb_io_out_valid; // @[StorePipe.scala 246:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[StorePipe.scala 246:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[StorePipe.scala 246:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[StorePipe.scala 246:29]
  wire  storeRespArb_io_in_0_valid; // @[StorePipe.scala 251:30]
  wire  storeRespArb_io_in_1_ready; // @[StorePipe.scala 251:30]
  wire  storeRespArb_io_in_1_valid; // @[StorePipe.scala 251:30]
  wire  storeRespArb_io_out_valid; // @[StorePipe.scala 251:30]
  wire  dataBankWrReqArb_io_in_0_ready; // @[StorePipe.scala 256:34]
  wire  dataBankWrReqArb_io_in_0_valid; // @[StorePipe.scala 256:34]
  wire [31:0] dataBankWrReqArb_io_in_0_bits_data; // @[StorePipe.scala 256:34]
  wire [5:0] dataBankWrReqArb_io_in_0_bits_set; // @[StorePipe.scala 256:34]
  wire [1:0] dataBankWrReqArb_io_in_0_bits_blockSelOH; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_in_0_bits_way; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_in_0_bits_mask; // @[StorePipe.scala 256:34]
  wire  dataBankWrReqArb_io_in_1_valid; // @[StorePipe.scala 256:34]
  wire [31:0] dataBankWrReqArb_io_in_1_bits_data; // @[StorePipe.scala 256:34]
  wire [5:0] dataBankWrReqArb_io_in_1_bits_set; // @[StorePipe.scala 256:34]
  wire [1:0] dataBankWrReqArb_io_in_1_bits_blockSelOH; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_in_1_bits_way; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_in_1_bits_mask; // @[StorePipe.scala 256:34]
  wire  dataBankWrReqArb_io_out_ready; // @[StorePipe.scala 256:34]
  wire  dataBankWrReqArb_io_out_valid; // @[StorePipe.scala 256:34]
  wire [31:0] dataBankWrReqArb_io_out_bits_data; // @[StorePipe.scala 256:34]
  wire [5:0] dataBankWrReqArb_io_out_bits_set; // @[StorePipe.scala 256:34]
  wire [1:0] dataBankWrReqArb_io_out_bits_blockSelOH; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_out_bits_way; // @[StorePipe.scala 256:34]
  wire [3:0] dataBankWrReqArb_io_out_bits_mask; // @[StorePipe.scala 256:34]
  wire  dirWrReqArb_io_in_0_ready; // @[StorePipe.scala 261:29]
  wire  dirWrReqArb_io_in_0_valid; // @[StorePipe.scala 261:29]
  wire [31:0] dirWrReqArb_io_in_0_bits_addr; // @[StorePipe.scala 261:29]
  wire [3:0] dirWrReqArb_io_in_0_bits_way; // @[StorePipe.scala 261:29]
  wire [1:0] dirWrReqArb_io_in_0_bits_meta; // @[StorePipe.scala 261:29]
  wire  dirWrReqArb_io_in_1_valid; // @[StorePipe.scala 261:29]
  wire [31:0] dirWrReqArb_io_in_1_bits_addr; // @[StorePipe.scala 261:29]
  wire [3:0] dirWrReqArb_io_in_1_bits_way; // @[StorePipe.scala 261:29]
  wire [1:0] dirWrReqArb_io_in_1_bits_meta; // @[StorePipe.scala 261:29]
  wire  dirWrReqArb_io_out_ready; // @[StorePipe.scala 261:29]
  wire  dirWrReqArb_io_out_valid; // @[StorePipe.scala 261:29]
  wire [31:0] dirWrReqArb_io_out_bits_addr; // @[StorePipe.scala 261:29]
  wire [3:0] dirWrReqArb_io_out_bits_way; // @[StorePipe.scala 261:29]
  wire [1:0] dirWrReqArb_io_out_bits_meta; // @[StorePipe.scala 261:29]
  reg  s0_full; // @[StorePipe.scala 34:26]
  wire  s0_latch = io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
  wire  _storeMissClean_T = ~io_dir_read_resp_bits_hit; // @[StorePipe.scala 62:26]
  wire  storeMissClean = ~io_dir_read_resp_bits_hit & ~io_dir_read_resp_bits_isDirtyWay; // @[StorePipe.scala 62:36]
  wire  s0_tlbusReq_ready = tlbusReqArb_io_in_1_ready; // @[StorePipe.scala 248:26 72:27]
  reg  s0_putAllBeat; // @[Reg.scala 35:20]
  wire  storeMissDirty = _storeMissClean_T & io_dir_read_resp_bits_isDirtyWay; // @[StorePipe.scala 63:36]
  wire  s0_tlbusReq_valid = s0_full & (storeMissClean & ~s0_putAllBeat | storeMissDirty & ~s0_putAllBeat); // @[StorePipe.scala 88:34]
  wire  _s0_valid_T_1 = s0_tlbusReq_ready & s0_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_2 = storeMissClean & _s0_valid_T_1; // @[StorePipe.scala 103:40]
  wire  _s0_valid_T_3 = io_dir_read_resp_bits_hit | _s0_valid_T_2; // @[StorePipe.scala 102:35]
  wire  _s0_valid_T_4 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_6 = io_tlbus_resp_bits_opcode == 3'h0; // @[StorePipe.scala 104:91]
  wire  _s0_valid_T_7 = storeMissDirty & _s0_valid_T_4 & io_tlbus_resp_bits_opcode == 3'h0; // @[StorePipe.scala 104:62]
  wire  _s0_valid_T_8 = _s0_valid_T_3 | _s0_valid_T_7; // @[StorePipe.scala 103:60]
  wire  s0_valid = s0_full & io_dir_read_resp_valid & _s0_valid_T_8; // @[StorePipe.scala 101:51]
  reg  s1_full; // @[StorePipe.scala 114:26]
  reg  s1_storeHit_r; // @[Reg.scala 19:16]
  wire  s1_storeHit = s1_storeHit_r & s1_full; // @[StorePipe.scala 122:53]
  wire  s1_storeResp_ready = storeRespArb_io_in_1_ready; // @[StorePipe.scala 131:28 253:27]
  wire  s1_storeResp_valid = s1_storeHit; // @[StorePipe.scala 122:53]
  wire  _s1_valid_T = s1_storeResp_ready & s1_storeResp_valid; // @[Decoupled.scala 51:35]
  reg  s1_storeMissClean_r; // @[Reg.scala 19:16]
  wire  s1_storeMissClean = s1_storeMissClean_r & s1_full; // @[StorePipe.scala 123:65]
  reg  s1_storeMissDirty_r; // @[Reg.scala 19:16]
  wire  s1_storeMissDirty = s1_storeMissDirty_r & s1_full; // @[StorePipe.scala 124:65]
  wire  s1_refillFire = io_tlbus_resp_bits_opcode == 3'h1 & _s0_valid_T_4; // @[StorePipe.scala 154:67]
  reg  s1_beatCounter_value; // @[Counter.scala 61:40]
  wire  _s1_valid_T_4 = (s1_storeMissClean | s1_storeMissDirty) & s1_refillFire & s1_beatCounter_value; // @[StorePipe.scala 192:79]
  wire  s1_valid = s1_storeHit & _s1_valid_T | _s1_valid_T_4; // @[StorePipe.scala 191:50]
  reg  s2_full; // @[StorePipe.scala 199:26]
  reg  s2_storeHit_r; // @[Reg.scala 19:16]
  wire  s2_storeHit = s2_storeHit_r & s2_full; // @[StorePipe.scala 207:56]
  reg  s2_storeMissClean_r; // @[Reg.scala 19:16]
  wire  s2_storeMissClean = s2_storeMissClean_r & s2_full; // @[StorePipe.scala 208:68]
  reg  s2_storeMissDirty_r; // @[Reg.scala 19:16]
  wire  s2_storeMissDirty = s2_storeMissDirty_r & s2_full; // @[StorePipe.scala 209:68]
  wire  _s2_valid_T = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 242:52]
  wire  s2_dataBankWrReq_ready = dataBankWrReqArb_io_in_0_ready; // @[StorePipe.scala 234:32 257:31]
  wire  _s2_dataBankWrReq_valid_T = _s2_valid_T; // @[StorePipe.scala 235:49]
  wire  _s2_valid_T_1 = s2_dataBankWrReq_ready & _s2_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_dirWrReq_ready = dirWrReqArb_io_in_0_ready; // @[StorePipe.scala 224:27 262:26]
  wire  _s2_valid_T_3 = s2_dirWrReq_ready & _s2_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_storeResp_ready = 1'h1; // @[StorePipe.scala 216:28 252:27]
  wire  s2_storeResp_valid = _s2_valid_T; // @[StorePipe.scala 219:45]
  wire  _s2_valid_T_5 = s2_storeResp_ready & _s2_dataBankWrReq_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_fire = s2_storeHit | (s2_storeMissClean | s2_storeMissDirty) & _s2_valid_T_1 & _s2_valid_T_3 & _s2_valid_T_5; // @[StorePipe.scala 242:29]
  wire  s2_ready = ~s2_full | s2_fire; // @[StorePipe.scala 211:26]
  wire  s1_fire = s1_valid & s2_ready; // @[StorePipe.scala 116:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[StorePipe.scala 126:26]
  wire  s0_fire = s0_valid & s1_ready; // @[StorePipe.scala 36:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s0_reqReg_mask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_3 = s0_full & s0_fire ? 1'h0 : s0_full; // @[StorePipe.scala 34:26 45:{35,45}]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[StorePipe.scala 44:{20,30}]
  reg  s0_beatCounter_value; // @[Counter.scala 61:40]
  wire [1:0] s0_beatOH = 2'h1 << s0_beatCounter_value; // @[OneHot.scala 57:35]
  wire  _s0_putAllBeat_T_1 = s0_beatCounter_value & _s0_valid_T_1; // @[StorePipe.scala 77:64]
  wire  _GEN_5 = _s0_putAllBeat_T_1 | s0_putAllBeat; // @[Reg.scala 36:18 35:20 36:22]
  wire [2:0] s0_tlbusReq_bits_opcode = storeMissClean ? 3'h4 : 3'h2; // @[StorePipe.scala 90:35]
  wire [31:0] blockAddr = {_GEN_0[31:3],3'h0}; // @[Cat.scala 33:92]
  wire [2:0] _s0_tlbusReq_bits_address_T = {s0_beatCounter_value, 2'h0}; // @[StorePipe.scala 93:71]
  wire [31:0] _GEN_34 = {{29'd0}, _s0_tlbusReq_bits_address_T}; // @[StorePipe.scala 93:47]
  wire [31:0] _s0_tlbusReq_bits_address_T_2 = blockAddr + _GEN_34; // @[StorePipe.scala 93:47]
  wire [127:0] _s0_tlbusReq_bits_data_T_2 = s0_beatOH[0] ? io_dataBank_read_resp_bits_blockData_0 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_3 = s0_beatOH[1] ? io_dataBank_read_resp_bits_blockData_1 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_4 = _s0_tlbusReq_bits_data_T_2 | _s0_tlbusReq_bits_data_T_3; // @[Mux.scala 27:73]
  wire [127:0] _s0_tlbusReq_bits_data_T_5 = storeMissDirty ? _s0_tlbusReq_bits_data_T_4 : 128'h0; // @[StorePipe.scala 96:33]
  reg [31:0] s1_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s1_reqReg_mask; // @[Reg.scala 19:16]
  wire [1:0] s1_dataBlockSelOH = 2'h1 << s1_reqReg_addr[2]; // @[OneHot.scala 57:35]
  reg [3:0] s1_chosenWayOH; // @[Reg.scala 19:16]
  wire  _GEN_16 = s1_full & s1_fire ? 1'h0 : s1_full; // @[StorePipe.scala 114:26 128:{35,45}]
  wire  _GEN_17 = s0_fire | _GEN_16; // @[StorePipe.scala 127:{20,30}]
  wire  s1_tlbusReq_ready = tlbusReqArb_io_in_0_ready; // @[StorePipe.scala 139:27 247:26]
  reg  s1_sendGet; // @[Reg.scala 35:20]
  wire  s1_tlbusReq_valid = s1_storeMissDirty & ~s1_sendGet; // @[StorePipe.scala 141:44]
  wire  _s1_sendGet_T = s1_tlbusReq_ready & s1_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_18 = _s1_sendGet_T | s1_sendGet; // @[Reg.scala 36:18 35:20 36:22]
  wire [1:0] s1_beatOH = 2'h1 << s1_beatCounter_value; // @[OneHot.scala 57:35]
  wire  s1_writeRefill = s1_refillFire & (s1_storeMissClean | s1_storeMissDirty & s1_sendGet); // @[StorePipe.scala 172:40]
  wire  s1_dirWrReq_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 174:38]
  reg [31:0] s2_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s2_reqReg_mask; // @[Reg.scala 19:16]
  reg [3:0] s2_chosenWayOH; // @[Reg.scala 19:16]
  wire  _GEN_32 = s2_full & s2_fire ? 1'h0 : s2_full; // @[StorePipe.scala 199:26 213:{35,45}]
  wire  _GEN_33 = s1_fire | _GEN_32; // @[StorePipe.scala 212:{20,30}]
  wire  s1_storeResp_bits_status = 1'h0; // @[StorePipe.scala 133:{33,33}]
  wire [1:0] s1_storeResp_bits_stageID = 2'h1; // @[StorePipe.scala 131:28 135:31]
  wire  s2_storeResp_bits_status = 1'h0; // @[StorePipe.scala 218:{33,33}]
  wire [1:0] s2_storeResp_bits_stageID = 2'h1; // @[StorePipe.scala 216:28 220:31]
  Arbiter_1 tlbusReqArb ( // @[StorePipe.scala 246:29]
    .io_in_0_ready(tlbusReqArb_io_in_0_ready),
    .io_in_0_valid(tlbusReqArb_io_in_0_valid),
    .io_in_0_bits_address(tlbusReqArb_io_in_0_bits_address),
    .io_in_1_ready(tlbusReqArb_io_in_1_ready),
    .io_in_1_valid(tlbusReqArb_io_in_1_valid),
    .io_in_1_bits_opcode(tlbusReqArb_io_in_1_bits_opcode),
    .io_in_1_bits_address(tlbusReqArb_io_in_1_bits_address),
    .io_in_1_bits_data(tlbusReqArb_io_in_1_bits_data),
    .io_out_ready(tlbusReqArb_io_out_ready),
    .io_out_valid(tlbusReqArb_io_out_valid),
    .io_out_bits_opcode(tlbusReqArb_io_out_bits_opcode),
    .io_out_bits_address(tlbusReqArb_io_out_bits_address),
    .io_out_bits_data(tlbusReqArb_io_out_bits_data)
  );
  Arbiter_5 storeRespArb ( // @[StorePipe.scala 251:30]
    .io_in_0_valid(storeRespArb_io_in_0_valid),
    .io_in_1_ready(storeRespArb_io_in_1_ready),
    .io_in_1_valid(storeRespArb_io_in_1_valid),
    .io_out_valid(storeRespArb_io_out_valid)
  );
  Arbiter_6 dataBankWrReqArb ( // @[StorePipe.scala 256:34]
    .io_in_0_ready(dataBankWrReqArb_io_in_0_ready),
    .io_in_0_valid(dataBankWrReqArb_io_in_0_valid),
    .io_in_0_bits_data(dataBankWrReqArb_io_in_0_bits_data),
    .io_in_0_bits_set(dataBankWrReqArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankWrReqArb_io_in_0_bits_blockSelOH),
    .io_in_0_bits_way(dataBankWrReqArb_io_in_0_bits_way),
    .io_in_0_bits_mask(dataBankWrReqArb_io_in_0_bits_mask),
    .io_in_1_valid(dataBankWrReqArb_io_in_1_valid),
    .io_in_1_bits_data(dataBankWrReqArb_io_in_1_bits_data),
    .io_in_1_bits_set(dataBankWrReqArb_io_in_1_bits_set),
    .io_in_1_bits_blockSelOH(dataBankWrReqArb_io_in_1_bits_blockSelOH),
    .io_in_1_bits_way(dataBankWrReqArb_io_in_1_bits_way),
    .io_in_1_bits_mask(dataBankWrReqArb_io_in_1_bits_mask),
    .io_out_ready(dataBankWrReqArb_io_out_ready),
    .io_out_valid(dataBankWrReqArb_io_out_valid),
    .io_out_bits_data(dataBankWrReqArb_io_out_bits_data),
    .io_out_bits_set(dataBankWrReqArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankWrReqArb_io_out_bits_blockSelOH),
    .io_out_bits_way(dataBankWrReqArb_io_out_bits_way),
    .io_out_bits_mask(dataBankWrReqArb_io_out_bits_mask)
  );
  Arbiter_7 dirWrReqArb ( // @[StorePipe.scala 261:29]
    .io_in_0_ready(dirWrReqArb_io_in_0_ready),
    .io_in_0_valid(dirWrReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirWrReqArb_io_in_0_bits_addr),
    .io_in_0_bits_way(dirWrReqArb_io_in_0_bits_way),
    .io_in_0_bits_meta(dirWrReqArb_io_in_0_bits_meta),
    .io_in_1_valid(dirWrReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirWrReqArb_io_in_1_bits_addr),
    .io_in_1_bits_way(dirWrReqArb_io_in_1_bits_way),
    .io_in_1_bits_meta(dirWrReqArb_io_in_1_bits_meta),
    .io_out_ready(dirWrReqArb_io_out_ready),
    .io_out_valid(dirWrReqArb_io_out_valid),
    .io_out_bits_addr(dirWrReqArb_io_out_bits_addr),
    .io_out_bits_way(dirWrReqArb_io_out_bits_way),
    .io_out_bits_meta(dirWrReqArb_io_out_bits_meta)
  );
  assign io_store_req_ready = ~s0_full; // @[StorePipe.scala 43:27]
  assign io_store_resp_valid = storeRespArb_io_out_valid; // @[StorePipe.scala 254:19]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 48:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[StorePipe.scala 38:23]
  assign io_dir_write_req_valid = dirWrReqArb_io_out_valid; // @[StorePipe.scala 264:22]
  assign io_dir_write_req_bits_addr = dirWrReqArb_io_out_bits_addr; // @[StorePipe.scala 264:22]
  assign io_dir_write_req_bits_way = dirWrReqArb_io_out_bits_way; // @[StorePipe.scala 264:22]
  assign io_dir_write_req_bits_meta = dirWrReqArb_io_out_bits_meta; // @[StorePipe.scala 264:22]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 51:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[8:3]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 2'h1 << _GEN_0[2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = dataBankWrReqArb_io_out_valid; // @[StorePipe.scala 259:27]
  assign io_dataBank_write_req_bits_data = dataBankWrReqArb_io_out_bits_data; // @[StorePipe.scala 259:27]
  assign io_dataBank_write_req_bits_set = dataBankWrReqArb_io_out_bits_set; // @[StorePipe.scala 259:27]
  assign io_dataBank_write_req_bits_blockSelOH = dataBankWrReqArb_io_out_bits_blockSelOH; // @[StorePipe.scala 259:27]
  assign io_dataBank_write_req_bits_way = dataBankWrReqArb_io_out_bits_way; // @[StorePipe.scala 259:27]
  assign io_dataBank_write_req_bits_mask = dataBankWrReqArb_io_out_bits_mask; // @[StorePipe.scala 259:27]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[StorePipe.scala 249:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[StorePipe.scala 249:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[StorePipe.scala 249:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[StorePipe.scala 249:18]
  assign io_tlbus_resp_ready = 1'h1; // @[StorePipe.scala 152:25]
  assign tlbusReqArb_io_in_0_valid = s1_storeMissDirty & ~s1_sendGet; // @[StorePipe.scala 141:44]
  assign tlbusReqArb_io_in_0_bits_address = {s1_reqReg_addr[31:3],3'h0}; // @[Cat.scala 33:92]
  assign tlbusReqArb_io_in_1_valid = s0_full & (storeMissClean & ~s0_putAllBeat | storeMissDirty & ~s0_putAllBeat); // @[StorePipe.scala 88:34]
  assign tlbusReqArb_io_in_1_bits_opcode = storeMissClean ? 3'h4 : 3'h2; // @[StorePipe.scala 90:35]
  assign tlbusReqArb_io_in_1_bits_address = storeMissDirty ? _s0_tlbusReq_bits_address_T_2 : blockAddr; // @[StorePipe.scala 92:36]
  assign tlbusReqArb_io_in_1_bits_data = _s0_tlbusReq_bits_data_T_5[31:0]; // @[StorePipe.scala 72:27 96:27]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[StorePipe.scala 249:18]
  assign storeRespArb_io_in_0_valid = _s2_dataBankWrReq_valid_T; // @[StorePipe.scala 252:27]
  assign storeRespArb_io_in_1_valid = s1_storeResp_valid; // @[StorePipe.scala 253:27]
  assign dataBankWrReqArb_io_in_0_valid = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 235:49]
  assign dataBankWrReqArb_io_in_0_bits_data = s2_reqReg_data; // @[StorePipe.scala 234:32 240:32]
  assign dataBankWrReqArb_io_in_0_bits_set = s1_reqReg_addr[8:3]; // @[Parameters.scala 50:11]
  assign dataBankWrReqArb_io_in_0_bits_blockSelOH = 2'h1 << s1_reqReg_addr[2]; // @[OneHot.scala 57:35]
  assign dataBankWrReqArb_io_in_0_bits_way = s2_chosenWayOH; // @[StorePipe.scala 234:32 238:31]
  assign dataBankWrReqArb_io_in_0_bits_mask = s2_reqReg_mask; // @[StorePipe.scala 234:32 239:32]
  assign dataBankWrReqArb_io_in_1_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 184:43]
  assign dataBankWrReqArb_io_in_1_bits_data = s1_writeRefill ? io_tlbus_resp_bits_data : s1_reqReg_data; // @[StorePipe.scala 189:38]
  assign dataBankWrReqArb_io_in_1_bits_set = s1_reqReg_addr[8:3]; // @[Parameters.scala 50:11]
  assign dataBankWrReqArb_io_in_1_bits_blockSelOH = s1_writeRefill ? s1_beatOH : s1_dataBlockSelOH; // @[StorePipe.scala 185:44]
  assign dataBankWrReqArb_io_in_1_bits_way = s1_chosenWayOH; // @[StorePipe.scala 183:32 187:31]
  assign dataBankWrReqArb_io_in_1_bits_mask = s1_writeRefill ? 4'hf : s1_reqReg_mask; // @[StorePipe.scala 188:38]
  assign dataBankWrReqArb_io_out_ready = io_dataBank_write_req_ready; // @[StorePipe.scala 259:27]
  assign dirWrReqArb_io_in_0_valid = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 225:44]
  assign dirWrReqArb_io_in_0_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 224:27 226:27]
  assign dirWrReqArb_io_in_0_bits_way = s2_chosenWayOH; // @[StorePipe.scala 224:27 227:26]
  assign dirWrReqArb_io_in_0_bits_meta = 2'h3; // @[StorePipe.scala 231:49]
  assign dirWrReqArb_io_in_1_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 174:38]
  assign dirWrReqArb_io_in_1_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 173:27 175:27]
  assign dirWrReqArb_io_in_1_bits_way = s1_chosenWayOH; // @[StorePipe.scala 173:27 176:26]
  assign dirWrReqArb_io_in_1_bits_meta = {s1_storeHit,s1_dirWrReq_valid}; // @[StorePipe.scala 180:49]
  assign dirWrReqArb_io_out_ready = io_dir_write_req_ready; // @[StorePipe.scala 264:22]
  always @(posedge clock) begin
    if (reset) begin // @[StorePipe.scala 34:26]
      s0_full <= 1'h0; // @[StorePipe.scala 34:26]
    end else begin
      s0_full <= _GEN_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      s0_putAllBeat <= 1'h0; // @[Reg.scala 35:20]
    end else if (s0_fire) begin // @[StorePipe.scala 84:19]
      s0_putAllBeat <= 1'h0; // @[StorePipe.scala 85:23]
    end else begin
      s0_putAllBeat <= _GEN_5;
    end
    if (reset) begin // @[StorePipe.scala 114:26]
      s1_full <= 1'h0; // @[StorePipe.scala 114:26]
    end else begin
      s1_full <= _GEN_17;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_storeHit_r <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_storeMissClean_r <= storeMissClean; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_storeMissDirty_r <= storeMissDirty; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (~s1_beatCounter_value & s1_refillFire) begin // @[StorePipe.scala 158:41]
      s1_beatCounter_value <= s1_beatCounter_value + 1'h1; // @[Counter.scala 77:15]
    end else if (s0_fire) begin // @[StorePipe.scala 160:26]
      s1_beatCounter_value <= 1'h0; // @[Counter.scala 98:11]
    end
    if (reset) begin // @[StorePipe.scala 199:26]
      s2_full <= 1'h0; // @[StorePipe.scala 199:26]
    end else begin
      s2_full <= _GEN_33;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_storeHit_r <= s1_storeHit; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_storeMissClean_r <= s1_storeMissClean; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_storeMissDirty_r <= s1_storeMissDirty; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_store_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_data <= io_store_req_bits_data; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_mask <= io_store_req_bits_mask; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Counter.scala 61:40]
      s0_beatCounter_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (_s0_valid_T_1 & s0_tlbusReq_bits_opcode == 3'h2) begin // @[StorePipe.scala 78:71]
      s0_beatCounter_value <= s0_beatCounter_value + 1'h1; // @[Counter.scala 77:15]
    end else if (_s0_valid_T_4 & _s0_valid_T_6) begin // @[StorePipe.scala 80:79]
      s0_beatCounter_value <= 1'h0; // @[Counter.scala 98:11]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_addr <= s0_reqReg_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_data <= s0_reqReg_data; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_mask <= s0_reqReg_mask; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_chosenWayOH <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_sendGet <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      s1_sendGet <= _GEN_18;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_reqReg_data <= s1_reqReg_data; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_reqReg_mask <= s1_reqReg_mask; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenWayOH <= s1_chosenWayOH; // @[Reg.scala 20:22]
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
  s0_putAllBeat = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_full = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_storeHit_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_storeMissClean_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_storeMissDirty_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_full = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_storeHit_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_storeMissClean_r = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_storeMissDirty_r = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s0_reqReg_data = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s0_reqReg_mask = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  s0_beatCounter_value = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_reqReg_addr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_reqReg_data = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_reqReg_mask = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  s1_chosenWayOH = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  s1_sendGet = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s2_reqReg_data = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s2_reqReg_mask = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  s2_chosenWayOH = _RAND_22[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Arbiter_8(
  input        io_in_0_valid,
  input  [5:0] io_in_0_bits_set,
  input  [1:0] io_in_0_bits_blockSelOH,
  input        io_in_1_valid,
  input  [5:0] io_in_1_bits_set,
  input  [1:0] io_in_1_bits_blockSelOH,
  output       io_out_valid,
  output [5:0] io_out_bits_set,
  output [1:0] io_out_bits_blockSelOH
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_set = io_in_0_valid ? io_in_0_bits_set : io_in_1_bits_set; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_blockSelOH = io_in_0_valid ? io_in_0_bits_blockSelOH : io_in_1_bits_blockSelOH; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module Arbiter_10(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  output        io_out_valid,
  output [31:0] io_out_bits_addr
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
module DCache(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_valid,
  output [31:0] io_read_resp_bits_data,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [31:0] io_write_req_bits_data,
  input  [3:0]  io_write_req_bits_mask,
  output        io_write_resp_valid,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [2:0]  io_tlbus_req_bits_opcode,
  output [31:0] io_tlbus_req_bits_address,
  output [31:0] io_tlbus_req_bits_data,
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
`endif // RANDOMIZE_REG_INIT
  wire  loadPipe_clock; // @[DCache.scala 83:26]
  wire  loadPipe_reset; // @[DCache.scala 83:26]
  wire  loadPipe_io_load_req_ready; // @[DCache.scala 83:26]
  wire  loadPipe_io_load_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_load_req_bits_addr; // @[DCache.scala 83:26]
  wire  loadPipe_io_load_resp_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_load_resp_bits_data; // @[DCache.scala 83:26]
  wire [1:0] loadPipe_io_load_resp_bits_stageID; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_read_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dir_read_req_bits_addr; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_read_resp_valid; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_read_resp_bits_hit; // @[DCache.scala 83:26]
  wire [3:0] loadPipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_write_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dir_write_req_bits_addr; // @[DCache.scala 83:26]
  wire [3:0] loadPipe_io_dir_write_req_bits_way; // @[DCache.scala 83:26]
  wire [1:0] loadPipe_io_dir_write_req_bits_meta; // @[DCache.scala 83:26]
  wire  loadPipe_io_dataBank_read_req_valid; // @[DCache.scala 83:26]
  wire [5:0] loadPipe_io_dataBank_read_req_bits_set; // @[DCache.scala 83:26]
  wire [1:0] loadPipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_0; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_1; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_2; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_3; // @[DCache.scala 83:26]
  wire [127:0] loadPipe_io_dataBank_read_resp_bits_blockData_0; // @[DCache.scala 83:26]
  wire [127:0] loadPipe_io_dataBank_read_resp_bits_blockData_1; // @[DCache.scala 83:26]
  wire  loadPipe_io_dataBank_write_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_write_req_bits_data; // @[DCache.scala 83:26]
  wire [5:0] loadPipe_io_dataBank_write_req_bits_set; // @[DCache.scala 83:26]
  wire [1:0] loadPipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 83:26]
  wire [3:0] loadPipe_io_dataBank_write_req_bits_way; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_req_ready; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_req_valid; // @[DCache.scala 83:26]
  wire [2:0] loadPipe_io_tlbus_req_bits_opcode; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_tlbus_req_bits_address; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_tlbus_req_bits_data; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_resp_ready; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_resp_valid; // @[DCache.scala 83:26]
  wire [2:0] loadPipe_io_tlbus_resp_bits_opcode; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_tlbus_resp_bits_data; // @[DCache.scala 83:26]
  wire  storePipe_clock; // @[DCache.scala 84:27]
  wire  storePipe_reset; // @[DCache.scala 84:27]
  wire  storePipe_io_store_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_store_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_store_req_bits_addr; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_store_req_bits_data; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_store_req_bits_mask; // @[DCache.scala 84:27]
  wire  storePipe_io_store_resp_valid; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_read_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_read_resp_valid; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_read_resp_bits_hit; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_write_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_write_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dir_write_req_bits_way; // @[DCache.scala 84:27]
  wire [1:0] storePipe_io_dir_write_req_bits_meta; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_read_req_valid; // @[DCache.scala 84:27]
  wire [5:0] storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 84:27]
  wire [1:0] storePipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 84:27]
  wire [127:0] storePipe_io_dataBank_read_resp_bits_blockData_0; // @[DCache.scala 84:27]
  wire [127:0] storePipe_io_dataBank_read_resp_bits_blockData_1; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_write_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_write_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data; // @[DCache.scala 84:27]
  wire [5:0] storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 84:27]
  wire [1:0] storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_mask; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_req_valid; // @[DCache.scala 84:27]
  wire [2:0] storePipe_io_tlbus_req_bits_opcode; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_tlbus_req_bits_address; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_tlbus_req_bits_data; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_resp_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_resp_valid; // @[DCache.scala 84:27]
  wire [2:0] storePipe_io_tlbus_resp_bits_opcode; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_tlbus_resp_bits_data; // @[DCache.scala 84:27]
  wire  dataBankArray_clock; // @[DCache.scala 87:31]
  wire  dataBankArray_reset; // @[DCache.scala 87:31]
  wire  dataBankArray_io_read_req_ready; // @[DCache.scala 87:31]
  wire  dataBankArray_io_read_req_valid; // @[DCache.scala 87:31]
  wire [5:0] dataBankArray_io_read_req_bits_set; // @[DCache.scala 87:31]
  wire [1:0] dataBankArray_io_read_req_bits_blockSelOH; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_0; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_1; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_2; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_3; // @[DCache.scala 87:31]
  wire [127:0] dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 87:31]
  wire [127:0] dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 87:31]
  wire  dataBankArray_io_write_req_ready; // @[DCache.scala 87:31]
  wire  dataBankArray_io_write_req_valid; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_write_req_bits_data; // @[DCache.scala 87:31]
  wire [5:0] dataBankArray_io_write_req_bits_set; // @[DCache.scala 87:31]
  wire [1:0] dataBankArray_io_write_req_bits_blockSelOH; // @[DCache.scala 87:31]
  wire [3:0] dataBankArray_io_write_req_bits_way; // @[DCache.scala 87:31]
  wire [3:0] dataBankArray_io_write_req_bits_mask; // @[DCache.scala 87:31]
  wire  directory_clock; // @[DCache.scala 88:27]
  wire  directory_reset; // @[DCache.scala 88:27]
  wire  directory_io_read_req_ready; // @[DCache.scala 88:27]
  wire  directory_io_read_req_valid; // @[DCache.scala 88:27]
  wire [31:0] directory_io_read_req_bits_addr; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_valid; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_bits_hit; // @[DCache.scala 88:27]
  wire [3:0] directory_io_read_resp_bits_chosenWay; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_bits_isDirtyWay; // @[DCache.scala 88:27]
  wire  directory_io_write_req_ready; // @[DCache.scala 88:27]
  wire  directory_io_write_req_valid; // @[DCache.scala 88:27]
  wire [31:0] directory_io_write_req_bits_addr; // @[DCache.scala 88:27]
  wire [3:0] directory_io_write_req_bits_way; // @[DCache.scala 88:27]
  wire [1:0] directory_io_write_req_bits_meta; // @[DCache.scala 88:27]
  wire  dataBankReadReqArb_io_in_0_valid; // @[DCache.scala 176:36]
  wire [5:0] dataBankReadReqArb_io_in_0_bits_set; // @[DCache.scala 176:36]
  wire [1:0] dataBankReadReqArb_io_in_0_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankReadReqArb_io_in_1_valid; // @[DCache.scala 176:36]
  wire [5:0] dataBankReadReqArb_io_in_1_bits_set; // @[DCache.scala 176:36]
  wire [1:0] dataBankReadReqArb_io_in_1_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankReadReqArb_io_out_valid; // @[DCache.scala 176:36]
  wire [5:0] dataBankReadReqArb_io_out_bits_set; // @[DCache.scala 176:36]
  wire [1:0] dataBankReadReqArb_io_out_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankWriteReqArb_io_in_0_ready; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_in_0_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_in_0_bits_data; // @[DCache.scala 181:37]
  wire [5:0] dataBankWriteReqArb_io_in_0_bits_set; // @[DCache.scala 181:37]
  wire [1:0] dataBankWriteReqArb_io_in_0_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_0_bits_way; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_0_bits_mask; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_in_1_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_in_1_bits_data; // @[DCache.scala 181:37]
  wire [5:0] dataBankWriteReqArb_io_in_1_bits_set; // @[DCache.scala 181:37]
  wire [1:0] dataBankWriteReqArb_io_in_1_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_1_bits_way; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_1_bits_mask; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_out_ready; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_out_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_out_bits_data; // @[DCache.scala 181:37]
  wire [5:0] dataBankWriteReqArb_io_out_bits_set; // @[DCache.scala 181:37]
  wire [1:0] dataBankWriteReqArb_io_out_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_out_bits_way; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_out_bits_mask; // @[DCache.scala 181:37]
  wire  dirReadReqArb_io_in_0_valid; // @[DCache.scala 186:31]
  wire [31:0] dirReadReqArb_io_in_0_bits_addr; // @[DCache.scala 186:31]
  wire  dirReadReqArb_io_in_1_valid; // @[DCache.scala 186:31]
  wire [31:0] dirReadReqArb_io_in_1_bits_addr; // @[DCache.scala 186:31]
  wire  dirReadReqArb_io_out_valid; // @[DCache.scala 186:31]
  wire [31:0] dirReadReqArb_io_out_bits_addr; // @[DCache.scala 186:31]
  wire  dirWriteReqArb_io_in_0_ready; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_in_0_valid; // @[DCache.scala 191:32]
  wire [31:0] dirWriteReqArb_io_in_0_bits_addr; // @[DCache.scala 191:32]
  wire [3:0] dirWriteReqArb_io_in_0_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_in_0_bits_meta; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_in_1_valid; // @[DCache.scala 191:32]
  wire [31:0] dirWriteReqArb_io_in_1_bits_addr; // @[DCache.scala 191:32]
  wire [3:0] dirWriteReqArb_io_in_1_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_in_1_bits_meta; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_out_ready; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_out_valid; // @[DCache.scala 191:32]
  wire [31:0] dirWriteReqArb_io_out_bits_addr; // @[DCache.scala 191:32]
  wire [3:0] dirWriteReqArb_io_out_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_out_bits_meta; // @[DCache.scala 191:32]
  reg [3:0] tlbusPendingOpcode; // @[DCache.scala 124:37]
  reg  tlbusPendingAck; // @[DCache.scala 125:34]
  reg  tlbusReqBeatCounter; // @[DCache.scala 126:38]
  reg  tlbusRespBeatCounter; // @[DCache.scala 127:39]
  wire  _T = io_tlbus_req_ready & io_tlbus_req_valid; // @[Decoupled.scala 51:35]
  wire  _T_1 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_31 = {{1'd0}, tlbusRespBeatCounter}; // @[DCache.scala 140:89]
  wire  _GEN_4 = _T_1 & tlbusPendingOpcode == 4'h4 & _GEN_31 != 2'h2 ? 1'h0 : tlbusPendingAck; // @[DCache.scala 140:112 141:25 125:34]
  wire  _GEN_5 = _T_1 & tlbusPendingOpcode == 4'h2 ? 1'h0 : _GEN_4; // @[DCache.scala 138:74 139:25]
  wire  _GEN_6 = _T | _GEN_5; // @[DCache.scala 136:29 137:25]
  wire  _T_12 = ~tlbusPendingAck; // @[DCache.scala 147:46]
  wire [1:0] _GEN_32 = {{1'd0}, tlbusReqBeatCounter}; // @[DCache.scala 148:74]
  wire  _T_15 = _GEN_32 != 2'h2; // @[DCache.scala 148:74]
  wire  _T_16 = storePipe_io_tlbus_req_bits_opcode == 3'h2 & _GEN_32 != 2'h2; // @[DCache.scala 148:51]
  wire  _T_17 = storePipe_io_tlbus_req_bits_opcode == 3'h4 & ~tlbusPendingAck | _T_16; // @[DCache.scala 147:64]
  wire  _T_18 = storePipe_io_tlbus_req_valid & _T_17; // @[DCache.scala 146:25]
  wire  _T_24 = loadPipe_io_tlbus_req_bits_opcode == 3'h2 & _T_15; // @[DCache.scala 159:50]
  wire  _T_25 = loadPipe_io_tlbus_req_bits_opcode == 3'h4 & _T_12 | _T_24; // @[DCache.scala 158:63]
  wire  _T_26 = loadPipe_io_tlbus_req_valid & _T_25; // @[DCache.scala 157:30]
  wire  _GEN_7 = loadPipe_io_tlbus_req_valid; // @[DCache.scala 161:7 162:28]
  wire [2:0] _GEN_8 = loadPipe_io_tlbus_req_bits_opcode; // @[DCache.scala 161:7 163:27]
  wire [31:0] _GEN_12 = loadPipe_io_tlbus_req_bits_address; // @[DCache.scala 161:7 163:27]
  wire [31:0] _GEN_15 = loadPipe_io_tlbus_req_bits_data; // @[DCache.scala 161:7 163:27]
  wire  _GEN_16 = _T_26 & io_tlbus_req_ready; // @[DCache.scala 161:7 164:23 171:23]
  LoadPipe loadPipe ( // @[DCache.scala 83:26]
    .clock(loadPipe_clock),
    .reset(loadPipe_reset),
    .io_load_req_ready(loadPipe_io_load_req_ready),
    .io_load_req_valid(loadPipe_io_load_req_valid),
    .io_load_req_bits_addr(loadPipe_io_load_req_bits_addr),
    .io_load_resp_valid(loadPipe_io_load_resp_valid),
    .io_load_resp_bits_data(loadPipe_io_load_resp_bits_data),
    .io_load_resp_bits_stageID(loadPipe_io_load_resp_bits_stageID),
    .io_dir_read_req_valid(loadPipe_io_dir_read_req_valid),
    .io_dir_read_req_bits_addr(loadPipe_io_dir_read_req_bits_addr),
    .io_dir_read_resp_valid(loadPipe_io_dir_read_resp_valid),
    .io_dir_read_resp_bits_hit(loadPipe_io_dir_read_resp_bits_hit),
    .io_dir_read_resp_bits_chosenWay(loadPipe_io_dir_read_resp_bits_chosenWay),
    .io_dir_read_resp_bits_isDirtyWay(loadPipe_io_dir_read_resp_bits_isDirtyWay),
    .io_dir_write_req_valid(loadPipe_io_dir_write_req_valid),
    .io_dir_write_req_bits_addr(loadPipe_io_dir_write_req_bits_addr),
    .io_dir_write_req_bits_way(loadPipe_io_dir_write_req_bits_way),
    .io_dir_write_req_bits_meta(loadPipe_io_dir_write_req_bits_meta),
    .io_dataBank_read_req_valid(loadPipe_io_dataBank_read_req_valid),
    .io_dataBank_read_req_bits_set(loadPipe_io_dataBank_read_req_bits_set),
    .io_dataBank_read_req_bits_blockSelOH(loadPipe_io_dataBank_read_req_bits_blockSelOH),
    .io_dataBank_read_resp_bits_data_0(loadPipe_io_dataBank_read_resp_bits_data_0),
    .io_dataBank_read_resp_bits_data_1(loadPipe_io_dataBank_read_resp_bits_data_1),
    .io_dataBank_read_resp_bits_data_2(loadPipe_io_dataBank_read_resp_bits_data_2),
    .io_dataBank_read_resp_bits_data_3(loadPipe_io_dataBank_read_resp_bits_data_3),
    .io_dataBank_read_resp_bits_blockData_0(loadPipe_io_dataBank_read_resp_bits_blockData_0),
    .io_dataBank_read_resp_bits_blockData_1(loadPipe_io_dataBank_read_resp_bits_blockData_1),
    .io_dataBank_write_req_valid(loadPipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(loadPipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(loadPipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(loadPipe_io_dataBank_write_req_bits_blockSelOH),
    .io_dataBank_write_req_bits_way(loadPipe_io_dataBank_write_req_bits_way),
    .io_tlbus_req_ready(loadPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(loadPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(loadPipe_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(loadPipe_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(loadPipe_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(loadPipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(loadPipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(loadPipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(loadPipe_io_tlbus_resp_bits_data)
  );
  StorePipe storePipe ( // @[DCache.scala 84:27]
    .clock(storePipe_clock),
    .reset(storePipe_reset),
    .io_store_req_ready(storePipe_io_store_req_ready),
    .io_store_req_valid(storePipe_io_store_req_valid),
    .io_store_req_bits_addr(storePipe_io_store_req_bits_addr),
    .io_store_req_bits_data(storePipe_io_store_req_bits_data),
    .io_store_req_bits_mask(storePipe_io_store_req_bits_mask),
    .io_store_resp_valid(storePipe_io_store_resp_valid),
    .io_dir_read_req_valid(storePipe_io_dir_read_req_valid),
    .io_dir_read_req_bits_addr(storePipe_io_dir_read_req_bits_addr),
    .io_dir_read_resp_valid(storePipe_io_dir_read_resp_valid),
    .io_dir_read_resp_bits_hit(storePipe_io_dir_read_resp_bits_hit),
    .io_dir_read_resp_bits_chosenWay(storePipe_io_dir_read_resp_bits_chosenWay),
    .io_dir_read_resp_bits_isDirtyWay(storePipe_io_dir_read_resp_bits_isDirtyWay),
    .io_dir_write_req_ready(storePipe_io_dir_write_req_ready),
    .io_dir_write_req_valid(storePipe_io_dir_write_req_valid),
    .io_dir_write_req_bits_addr(storePipe_io_dir_write_req_bits_addr),
    .io_dir_write_req_bits_way(storePipe_io_dir_write_req_bits_way),
    .io_dir_write_req_bits_meta(storePipe_io_dir_write_req_bits_meta),
    .io_dataBank_read_req_valid(storePipe_io_dataBank_read_req_valid),
    .io_dataBank_read_req_bits_set(storePipe_io_dataBank_read_req_bits_set),
    .io_dataBank_read_req_bits_blockSelOH(storePipe_io_dataBank_read_req_bits_blockSelOH),
    .io_dataBank_read_resp_bits_blockData_0(storePipe_io_dataBank_read_resp_bits_blockData_0),
    .io_dataBank_read_resp_bits_blockData_1(storePipe_io_dataBank_read_resp_bits_blockData_1),
    .io_dataBank_write_req_ready(storePipe_io_dataBank_write_req_ready),
    .io_dataBank_write_req_valid(storePipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(storePipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(storePipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(storePipe_io_dataBank_write_req_bits_blockSelOH),
    .io_dataBank_write_req_bits_way(storePipe_io_dataBank_write_req_bits_way),
    .io_dataBank_write_req_bits_mask(storePipe_io_dataBank_write_req_bits_mask),
    .io_tlbus_req_ready(storePipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(storePipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(storePipe_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(storePipe_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(storePipe_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(storePipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(storePipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(storePipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(storePipe_io_tlbus_resp_bits_data)
  );
  DataBankArray dataBankArray ( // @[DCache.scala 87:31]
    .clock(dataBankArray_clock),
    .reset(dataBankArray_reset),
    .io_read_req_ready(dataBankArray_io_read_req_ready),
    .io_read_req_valid(dataBankArray_io_read_req_valid),
    .io_read_req_bits_set(dataBankArray_io_read_req_bits_set),
    .io_read_req_bits_blockSelOH(dataBankArray_io_read_req_bits_blockSelOH),
    .io_read_resp_bits_data_0(dataBankArray_io_read_resp_bits_data_0),
    .io_read_resp_bits_data_1(dataBankArray_io_read_resp_bits_data_1),
    .io_read_resp_bits_data_2(dataBankArray_io_read_resp_bits_data_2),
    .io_read_resp_bits_data_3(dataBankArray_io_read_resp_bits_data_3),
    .io_read_resp_bits_blockData_0(dataBankArray_io_read_resp_bits_blockData_0),
    .io_read_resp_bits_blockData_1(dataBankArray_io_read_resp_bits_blockData_1),
    .io_write_req_ready(dataBankArray_io_write_req_ready),
    .io_write_req_valid(dataBankArray_io_write_req_valid),
    .io_write_req_bits_data(dataBankArray_io_write_req_bits_data),
    .io_write_req_bits_set(dataBankArray_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(dataBankArray_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(dataBankArray_io_write_req_bits_way),
    .io_write_req_bits_mask(dataBankArray_io_write_req_bits_mask)
  );
  DCacheDirectory directory ( // @[DCache.scala 88:27]
    .clock(directory_clock),
    .reset(directory_reset),
    .io_read_req_ready(directory_io_read_req_ready),
    .io_read_req_valid(directory_io_read_req_valid),
    .io_read_req_bits_addr(directory_io_read_req_bits_addr),
    .io_read_resp_valid(directory_io_read_resp_valid),
    .io_read_resp_bits_hit(directory_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(directory_io_read_resp_bits_chosenWay),
    .io_read_resp_bits_isDirtyWay(directory_io_read_resp_bits_isDirtyWay),
    .io_write_req_ready(directory_io_write_req_ready),
    .io_write_req_valid(directory_io_write_req_valid),
    .io_write_req_bits_addr(directory_io_write_req_bits_addr),
    .io_write_req_bits_way(directory_io_write_req_bits_way),
    .io_write_req_bits_meta(directory_io_write_req_bits_meta)
  );
  Arbiter_8 dataBankReadReqArb ( // @[DCache.scala 176:36]
    .io_in_0_valid(dataBankReadReqArb_io_in_0_valid),
    .io_in_0_bits_set(dataBankReadReqArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankReadReqArb_io_in_0_bits_blockSelOH),
    .io_in_1_valid(dataBankReadReqArb_io_in_1_valid),
    .io_in_1_bits_set(dataBankReadReqArb_io_in_1_bits_set),
    .io_in_1_bits_blockSelOH(dataBankReadReqArb_io_in_1_bits_blockSelOH),
    .io_out_valid(dataBankReadReqArb_io_out_valid),
    .io_out_bits_set(dataBankReadReqArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankReadReqArb_io_out_bits_blockSelOH)
  );
  Arbiter_6 dataBankWriteReqArb ( // @[DCache.scala 181:37]
    .io_in_0_ready(dataBankWriteReqArb_io_in_0_ready),
    .io_in_0_valid(dataBankWriteReqArb_io_in_0_valid),
    .io_in_0_bits_data(dataBankWriteReqArb_io_in_0_bits_data),
    .io_in_0_bits_set(dataBankWriteReqArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankWriteReqArb_io_in_0_bits_blockSelOH),
    .io_in_0_bits_way(dataBankWriteReqArb_io_in_0_bits_way),
    .io_in_0_bits_mask(dataBankWriteReqArb_io_in_0_bits_mask),
    .io_in_1_valid(dataBankWriteReqArb_io_in_1_valid),
    .io_in_1_bits_data(dataBankWriteReqArb_io_in_1_bits_data),
    .io_in_1_bits_set(dataBankWriteReqArb_io_in_1_bits_set),
    .io_in_1_bits_blockSelOH(dataBankWriteReqArb_io_in_1_bits_blockSelOH),
    .io_in_1_bits_way(dataBankWriteReqArb_io_in_1_bits_way),
    .io_in_1_bits_mask(dataBankWriteReqArb_io_in_1_bits_mask),
    .io_out_ready(dataBankWriteReqArb_io_out_ready),
    .io_out_valid(dataBankWriteReqArb_io_out_valid),
    .io_out_bits_data(dataBankWriteReqArb_io_out_bits_data),
    .io_out_bits_set(dataBankWriteReqArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankWriteReqArb_io_out_bits_blockSelOH),
    .io_out_bits_way(dataBankWriteReqArb_io_out_bits_way),
    .io_out_bits_mask(dataBankWriteReqArb_io_out_bits_mask)
  );
  Arbiter_10 dirReadReqArb ( // @[DCache.scala 186:31]
    .io_in_0_valid(dirReadReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirReadReqArb_io_in_0_bits_addr),
    .io_in_1_valid(dirReadReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirReadReqArb_io_in_1_bits_addr),
    .io_out_valid(dirReadReqArb_io_out_valid),
    .io_out_bits_addr(dirReadReqArb_io_out_bits_addr)
  );
  Arbiter_7 dirWriteReqArb ( // @[DCache.scala 191:32]
    .io_in_0_ready(dirWriteReqArb_io_in_0_ready),
    .io_in_0_valid(dirWriteReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirWriteReqArb_io_in_0_bits_addr),
    .io_in_0_bits_way(dirWriteReqArb_io_in_0_bits_way),
    .io_in_0_bits_meta(dirWriteReqArb_io_in_0_bits_meta),
    .io_in_1_valid(dirWriteReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirWriteReqArb_io_in_1_bits_addr),
    .io_in_1_bits_way(dirWriteReqArb_io_in_1_bits_way),
    .io_in_1_bits_meta(dirWriteReqArb_io_in_1_bits_meta),
    .io_out_ready(dirWriteReqArb_io_out_ready),
    .io_out_valid(dirWriteReqArb_io_out_valid),
    .io_out_bits_addr(dirWriteReqArb_io_out_bits_addr),
    .io_out_bits_way(dirWriteReqArb_io_out_bits_way),
    .io_out_bits_meta(dirWriteReqArb_io_out_bits_meta)
  );
  assign io_read_req_ready = loadPipe_io_load_req_ready; // @[DCache.scala 113:22]
  assign io_read_resp_valid = loadPipe_io_load_resp_valid; // @[DCache.scala 113:22]
  assign io_read_resp_bits_data = loadPipe_io_load_resp_bits_data; // @[DCache.scala 113:22]
  assign io_write_req_ready = storePipe_io_store_req_ready; // @[DCache.scala 118:24]
  assign io_write_resp_valid = storePipe_io_store_resp_valid; // @[DCache.scala 118:24]
  assign io_tlbus_req_valid = _T_18 ? storePipe_io_tlbus_req_valid : _GEN_7; // @[DCache.scala 150:7 151:28]
  assign io_tlbus_req_bits_opcode = _T_18 ? storePipe_io_tlbus_req_bits_opcode : _GEN_8; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_req_bits_address = _T_18 ? storePipe_io_tlbus_req_bits_address : _GEN_12; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_req_bits_data = _T_18 ? storePipe_io_tlbus_req_bits_data : _GEN_15; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_resp_ready = 1'h1; // @[DCache.scala 121:29]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[DCache.scala 113:22]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[DCache.scala 113:22]
  assign loadPipe_io_dir_read_resp_valid = directory_io_read_resp_valid; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_hit = directory_io_read_resp_bits_hit; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[DCache.scala 115:31]
  assign loadPipe_io_dataBank_read_resp_bits_data_0 = dataBankArray_io_read_resp_bits_data_0; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_1 = dataBankArray_io_read_resp_bits_data_1; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_2 = dataBankArray_io_read_resp_bits_data_2; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_3 = dataBankArray_io_read_resp_bits_data_3; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 114:36]
  assign loadPipe_io_tlbus_req_ready = _T_18 ? 1'h0 : _GEN_16; // @[DCache.scala 150:7 154:23]
  assign loadPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 116:28]
  assign loadPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[DCache.scala 116:28]
  assign loadPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[DCache.scala 116:28]
  assign storePipe_clock = clock;
  assign storePipe_reset = reset;
  assign storePipe_io_store_req_valid = io_write_req_valid; // @[DCache.scala 118:24]
  assign storePipe_io_store_req_bits_addr = io_write_req_bits_addr; // @[DCache.scala 118:24]
  assign storePipe_io_store_req_bits_data = io_write_req_bits_data; // @[DCache.scala 118:24]
  assign storePipe_io_store_req_bits_mask = io_write_req_bits_mask; // @[DCache.scala 118:24]
  assign storePipe_io_dir_read_resp_valid = directory_io_read_resp_valid; // @[DCache.scala 120:32]
  assign storePipe_io_dir_read_resp_bits_hit = directory_io_read_resp_bits_hit; // @[DCache.scala 120:32]
  assign storePipe_io_dir_read_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[DCache.scala 120:32]
  assign storePipe_io_dir_read_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[DCache.scala 120:32]
  assign storePipe_io_dir_write_req_ready = dirWriteReqArb_io_in_0_ready; // @[DCache.scala 192:29]
  assign storePipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 119:37]
  assign storePipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 119:37]
  assign storePipe_io_dataBank_write_req_ready = dataBankWriteReqArb_io_in_0_ready; // @[DCache.scala 182:34]
  assign storePipe_io_tlbus_req_ready = _T_18 & io_tlbus_req_ready; // @[DCache.scala 150:7 153:24]
  assign storePipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 121:29]
  assign storePipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[DCache.scala 121:29]
  assign storePipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[DCache.scala 121:29]
  assign dataBankArray_clock = clock;
  assign dataBankArray_reset = reset;
  assign dataBankArray_io_read_req_valid = dataBankReadReqArb_io_out_valid; // @[DCache.scala 179:31]
  assign dataBankArray_io_read_req_bits_set = dataBankReadReqArb_io_out_bits_set; // @[DCache.scala 179:31]
  assign dataBankArray_io_read_req_bits_blockSelOH = dataBankReadReqArb_io_out_bits_blockSelOH; // @[DCache.scala 179:31]
  assign dataBankArray_io_write_req_valid = dataBankWriteReqArb_io_out_valid; // @[DCache.scala 184:32]
  assign dataBankArray_io_write_req_bits_data = dataBankWriteReqArb_io_out_bits_data; // @[DCache.scala 184:32]
  assign dataBankArray_io_write_req_bits_set = dataBankWriteReqArb_io_out_bits_set; // @[DCache.scala 184:32]
  assign dataBankArray_io_write_req_bits_blockSelOH = dataBankWriteReqArb_io_out_bits_blockSelOH; // @[DCache.scala 184:32]
  assign dataBankArray_io_write_req_bits_way = dataBankWriteReqArb_io_out_bits_way; // @[DCache.scala 184:32]
  assign dataBankArray_io_write_req_bits_mask = dataBankWriteReqArb_io_out_bits_mask; // @[DCache.scala 184:32]
  assign directory_clock = clock;
  assign directory_reset = reset;
  assign directory_io_read_req_valid = dirReadReqArb_io_out_valid; // @[DCache.scala 189:27]
  assign directory_io_read_req_bits_addr = dirReadReqArb_io_out_bits_addr; // @[DCache.scala 189:27]
  assign directory_io_write_req_valid = dirWriteReqArb_io_out_valid; // @[DCache.scala 194:28]
  assign directory_io_write_req_bits_addr = dirWriteReqArb_io_out_bits_addr; // @[DCache.scala 194:28]
  assign directory_io_write_req_bits_way = dirWriteReqArb_io_out_bits_way; // @[DCache.scala 194:28]
  assign directory_io_write_req_bits_meta = dirWriteReqArb_io_out_bits_meta; // @[DCache.scala 194:28]
  assign dataBankReadReqArb_io_in_0_valid = storePipe_io_dataBank_read_req_valid; // @[DCache.scala 177:33]
  assign dataBankReadReqArb_io_in_0_bits_set = storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 177:33]
  assign dataBankReadReqArb_io_in_0_bits_blockSelOH = storePipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 177:33]
  assign dataBankReadReqArb_io_in_1_valid = loadPipe_io_dataBank_read_req_valid; // @[DCache.scala 178:33]
  assign dataBankReadReqArb_io_in_1_bits_set = loadPipe_io_dataBank_read_req_bits_set; // @[DCache.scala 178:33]
  assign dataBankReadReqArb_io_in_1_bits_blockSelOH = loadPipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 178:33]
  assign dataBankWriteReqArb_io_in_0_valid = storePipe_io_dataBank_write_req_valid; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_0_bits_data = storePipe_io_dataBank_write_req_bits_data; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_0_bits_set = storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_0_bits_blockSelOH = storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_0_bits_way = storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_0_bits_mask = storePipe_io_dataBank_write_req_bits_mask; // @[DCache.scala 182:34]
  assign dataBankWriteReqArb_io_in_1_valid = loadPipe_io_dataBank_write_req_valid; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_in_1_bits_data = loadPipe_io_dataBank_write_req_bits_data; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_in_1_bits_set = loadPipe_io_dataBank_write_req_bits_set; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_in_1_bits_blockSelOH = loadPipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_in_1_bits_way = loadPipe_io_dataBank_write_req_bits_way; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_in_1_bits_mask = 4'hf; // @[DCache.scala 183:34]
  assign dataBankWriteReqArb_io_out_ready = 1'h1; // @[DCache.scala 184:32]
  assign dirReadReqArb_io_in_0_valid = storePipe_io_dir_read_req_valid; // @[DCache.scala 187:28]
  assign dirReadReqArb_io_in_0_bits_addr = storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 187:28]
  assign dirReadReqArb_io_in_1_valid = loadPipe_io_dir_read_req_valid; // @[DCache.scala 188:28]
  assign dirReadReqArb_io_in_1_bits_addr = loadPipe_io_dir_read_req_bits_addr; // @[DCache.scala 188:28]
  assign dirWriteReqArb_io_in_0_valid = storePipe_io_dir_write_req_valid; // @[DCache.scala 192:29]
  assign dirWriteReqArb_io_in_0_bits_addr = storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 192:29]
  assign dirWriteReqArb_io_in_0_bits_way = storePipe_io_dir_write_req_bits_way; // @[DCache.scala 192:29]
  assign dirWriteReqArb_io_in_0_bits_meta = storePipe_io_dir_write_req_bits_meta; // @[DCache.scala 192:29]
  assign dirWriteReqArb_io_in_1_valid = loadPipe_io_dir_write_req_valid; // @[DCache.scala 193:29]
  assign dirWriteReqArb_io_in_1_bits_addr = loadPipe_io_dir_write_req_bits_addr; // @[DCache.scala 193:29]
  assign dirWriteReqArb_io_in_1_bits_way = loadPipe_io_dir_write_req_bits_way; // @[DCache.scala 193:29]
  assign dirWriteReqArb_io_in_1_bits_meta = loadPipe_io_dir_write_req_bits_meta; // @[DCache.scala 193:29]
  assign dirWriteReqArb_io_out_ready = 1'h1; // @[DCache.scala 194:28]
  always @(posedge clock) begin
    if (reset) begin // @[DCache.scala 124:37]
      tlbusPendingOpcode <= 4'h0; // @[DCache.scala 124:37]
    end else if (_T_18) begin // @[DCache.scala 150:7]
      tlbusPendingOpcode <= {{1'd0}, storePipe_io_tlbus_req_bits_opcode}; // @[DCache.scala 156:28]
    end else if (_T_26) begin // @[DCache.scala 161:7]
      tlbusPendingOpcode <= {{1'd0}, loadPipe_io_tlbus_req_bits_opcode}; // @[DCache.scala 167:28]
    end
    if (reset) begin // @[DCache.scala 125:34]
      tlbusPendingAck <= 1'h0; // @[DCache.scala 125:34]
    end else begin
      tlbusPendingAck <= _GEN_6;
    end
    if (reset) begin // @[DCache.scala 126:38]
      tlbusReqBeatCounter <= 1'h0; // @[DCache.scala 126:38]
    end else if (_T) begin // @[DCache.scala 128:29]
      tlbusReqBeatCounter <= tlbusReqBeatCounter + 1'h1; // @[DCache.scala 129:29]
    end else if (_T_1) begin // @[DCache.scala 131:36]
      tlbusReqBeatCounter <= 1'h0; // @[DCache.scala 132:29]
    end
    if (reset) begin // @[DCache.scala 127:39]
      tlbusRespBeatCounter <= 1'h0; // @[DCache.scala 127:39]
    end else if (_T) begin // @[DCache.scala 128:29]
      tlbusRespBeatCounter <= 1'h0; // @[DCache.scala 130:30]
    end else if (_T_1) begin // @[DCache.scala 131:36]
      tlbusRespBeatCounter <= tlbusRespBeatCounter + 1'h1; // @[DCache.scala 133:30]
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
  tlbusPendingOpcode = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  tlbusPendingAck = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tlbusReqBeatCounter = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  tlbusRespBeatCounter = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mem(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input  [4:0]  io_in_bits_lsuOp,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input         io_in_bits_csrValid,
  input  [31:0] io_in_bits_csrWrData,
  input  [31:0] io_in_bits_csrAddr,
  input  [3:0]  io_in_bits_excType,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_ready,
  output        io_out_valid,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_aluOut,
  output [31:0] io_out_bits_pcNext4,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_csrWrEn,
  output [31:0] io_out_bits_csrWrData,
  output [11:0] io_out_bits_csrAddr,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [31:0] io_lsuData,
  output        io_lsuOK,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [2:0]  io_tlbus_req_bits_opcode,
  output [31:0] io_tlbus_req_bits_address,
  output [31:0] io_tlbus_req_bits_data,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  input         io_ctrl_flush,
  output        io_excp_valid,
  output        io_excp_bits_isMret,
  output        io_excp_bits_isSret,
  output [30:0] io_excp_bits_excCause,
  output [31:0] io_excp_bits_excPc,
  input         io_csrBusy,
  input  [1:0]  io_csrMode
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
  wire  lsu_clock; // @[4_Mem.scala 146:21]
  wire  lsu_reset; // @[4_Mem.scala 146:21]
  wire  lsu_io_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_req_bits_addr; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_req_bits_wdata; // @[4_Mem.scala 146:21]
  wire [4:0] lsu_io_req_bits_lsuOp; // @[4_Mem.scala 146:21]
  wire  lsu_io_resp_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_resp_bits_rdata; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_read_req_bits_addr; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_resp_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_resp_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_read_resp_bits_data; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_write_req_bits_addr; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_write_req_bits_data; // @[4_Mem.scala 146:21]
  wire [3:0] lsu_io_cache_write_req_bits_mask; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_resp_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_resp_valid; // @[4_Mem.scala 146:21]
  wire  dcache_clock; // @[4_Mem.scala 165:24]
  wire  dcache_reset; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_req_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_read_req_bits_addr; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_resp_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_read_resp_bits_data; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_req_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_write_req_bits_addr; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_write_req_bits_data; // @[4_Mem.scala 165:24]
  wire [3:0] dcache_io_write_req_bits_mask; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_resp_valid; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_req_valid; // @[4_Mem.scala 165:24]
  wire [2:0] dcache_io_tlbus_req_bits_opcode; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_tlbus_req_bits_address; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_tlbus_req_bits_data; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_resp_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_resp_valid; // @[4_Mem.scala 165:24]
  wire [2:0] dcache_io_tlbus_resp_bits_opcode; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_tlbus_resp_bits_data; // @[4_Mem.scala 165:24]
  wire  lsuReady = lsu_io_req_ready; // @[4_Mem.scala 148:14 60:28]
  reg [4:0] stageReg_lsuOp; // @[4_Mem.scala 70:27]
  wire  validLsuOp = ~(stageReg_lsuOp == 5'h0 | stageReg_lsuOp == 5'h14); // @[4_Mem.scala 149:19]
  wire  stall = ~lsuReady | validLsuOp & ~io_lsuOK; // @[4_Mem.scala 64:44]
  wire  _io_in_ready_T = ~stall; // @[4_Mem.scala 68:20]
  wire  _io_in_ready_T_2 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg [1:0] stageReg_resultSrc; // @[4_Mem.scala 70:27]
  reg  stageReg_regWrEn; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_aluOut; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_data2; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_pcNext4; // @[4_Mem.scala 70:27]
  reg [2:0] stageReg_csrOp; // @[4_Mem.scala 70:27]
  reg  stageReg_csrWrEn; // @[4_Mem.scala 70:27]
  reg  stageReg_csrValid; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_csrWrData; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_csrAddr; // @[4_Mem.scala 70:27]
  reg [3:0] stageReg_excType; // @[4_Mem.scala 70:27]
  reg  stageReg_instState_commit; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_instState_pc; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_instState_inst; // @[4_Mem.scala 70:27]
  wire  _illgSret_T = stageReg_excType == 4'h3; // @[4_Mem.scala 82:38]
  wire  _illgSret_T_1 = io_csrMode == 2'h0; // @[4_Mem.scala 82:65]
  wire  illgSret = stageReg_excType == 4'h3 & io_csrMode == 2'h0; // @[4_Mem.scala 82:51]
  wire  _illgMret_T = stageReg_excType == 4'h4; // @[4_Mem.scala 83:38]
  wire  illgMret = stageReg_excType == 4'h4 & io_csrMode != 2'h3; // @[4_Mem.scala 83:51]
  wire  illgSpriv = stageReg_excType == 4'ha & _illgSret_T_1; // @[4_Mem.scala 84:52]
  wire  _instIllg_T_1 = stageReg_excType == 4'h5 | illgSret; // @[4_Mem.scala 87:52]
  wire  instIllg = _instIllg_T_1 | illgMret | illgSpriv; // @[4_Mem.scala 88:42]
  wire  _excOther_T_1 = stageReg_excType == 4'h2; // @[4_Mem.scala 90:38]
  wire  _excOther_T_2 = stageReg_excType == 4'h1 | _excOther_T_1; // @[4_Mem.scala 89:52]
  wire  _excOther_T_4 = _excOther_T_2 | _illgSret_T; // @[4_Mem.scala 90:51]
  wire  excOther = _excOther_T_4 | _illgMret_T; // @[4_Mem.scala 91:51]
  wire  hasTrap = (instIllg | excOther) & stageReg_instState_inst != 32'h0; // @[4_Mem.scala 93:44]
  wire [30:0] _cause_T_2 = io_csrMode == 2'h1 ? 31'h9 : 31'hb; // @[4_Mem.scala 98:32]
  wire [30:0] _cause_T_3 = _illgSret_T_1 ? 31'h8 : _cause_T_2; // @[4_Mem.scala 96:28]
  wire [30:0] _cause_T_5 = 4'h1 == stageReg_excType ? _cause_T_3 : 31'h0; // @[Mux.scala 81:58]
  wire [30:0] cause = 4'h2 == stageReg_excType ? 31'h3 : _cause_T_5; // @[Mux.scala 81:58]
  wire  _lsuSend_T = lsu_io_req_ready & lsu_io_req_valid; // @[Decoupled.scala 51:35]
  reg  lsuSend; // @[Reg.scala 35:20]
  wire  _GEN_48 = _lsuSend_T | lsuSend; // @[Reg.scala 36:18 35:20 36:22]
  LSU_1 lsu ( // @[4_Mem.scala 146:21]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_req_ready(lsu_io_req_ready),
    .io_req_valid(lsu_io_req_valid),
    .io_req_bits_addr(lsu_io_req_bits_addr),
    .io_req_bits_wdata(lsu_io_req_bits_wdata),
    .io_req_bits_lsuOp(lsu_io_req_bits_lsuOp),
    .io_resp_valid(lsu_io_resp_valid),
    .io_resp_bits_rdata(lsu_io_resp_bits_rdata),
    .io_cache_read_req_ready(lsu_io_cache_read_req_ready),
    .io_cache_read_req_valid(lsu_io_cache_read_req_valid),
    .io_cache_read_req_bits_addr(lsu_io_cache_read_req_bits_addr),
    .io_cache_read_resp_ready(lsu_io_cache_read_resp_ready),
    .io_cache_read_resp_valid(lsu_io_cache_read_resp_valid),
    .io_cache_read_resp_bits_data(lsu_io_cache_read_resp_bits_data),
    .io_cache_write_req_ready(lsu_io_cache_write_req_ready),
    .io_cache_write_req_valid(lsu_io_cache_write_req_valid),
    .io_cache_write_req_bits_addr(lsu_io_cache_write_req_bits_addr),
    .io_cache_write_req_bits_data(lsu_io_cache_write_req_bits_data),
    .io_cache_write_req_bits_mask(lsu_io_cache_write_req_bits_mask),
    .io_cache_write_resp_ready(lsu_io_cache_write_resp_ready),
    .io_cache_write_resp_valid(lsu_io_cache_write_resp_valid)
  );
  DCache dcache ( // @[4_Mem.scala 165:24]
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
    .io_tlbus_resp_ready(dcache_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(dcache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(dcache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(dcache_io_tlbus_resp_bits_data)
  );
  assign io_in_ready = ~stall & _io_in_ready_T_2; // @[4_Mem.scala 68:42]
  assign io_out_valid = ~stall; // @[4_Mem.scala 185:32]
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Mem.scala 172:29]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 173:29]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Mem.scala 174:29]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Mem.scala 175:29]
  assign io_out_bits_csrOp = stageReg_csrOp; // @[4_Mem.scala 115:29]
  assign io_out_bits_csrWrEn = stageReg_csrWrEn; // @[4_Mem.scala 116:29]
  assign io_out_bits_csrWrData = stageReg_csrWrData; // @[4_Mem.scala 118:29]
  assign io_out_bits_csrAddr = stageReg_csrAddr[11:0]; // @[4_Mem.scala 119:29]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Mem.scala 176:29]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Mem.scala 176:29]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Mem.scala 176:29]
  assign io_lsuData = lsu_io_resp_bits_rdata; // @[4_Mem.scala 163:29]
  assign io_lsuOK = lsu_io_resp_valid; // @[4_Mem.scala 162:29]
  assign io_tlbus_req_valid = dcache_io_tlbus_req_valid; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_opcode = dcache_io_tlbus_req_bits_opcode; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_address = dcache_io_tlbus_req_bits_address; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_data = dcache_io_tlbus_req_bits_data; // @[4_Mem.scala 168:21]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 57:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Mem.scala 183:29]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 182:29]
  assign io_excp_valid = ~io_csrBusy & hasTrap & _io_in_ready_T; // @[4_Mem.scala 109:55]
  assign io_excp_bits_isMret = stageReg_excType == 4'h4; // @[4_Mem.scala 112:49]
  assign io_excp_bits_isSret = stageReg_excType == 4'h3; // @[4_Mem.scala 113:49]
  assign io_excp_bits_excCause = stageReg_csrWrEn & ~stageReg_csrValid ? 31'h2 : cause; // @[4_Mem.scala 105:35]
  assign io_excp_bits_excPc = stageReg_instState_pc; // @[4_Mem.scala 110:29]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_req_valid = stageReg_instState_commit & validLsuOp & ~lsuSend; // @[4_Mem.scala 157:72]
  assign lsu_io_req_bits_addr = stageReg_aluOut; // @[4_Mem.scala 158:29]
  assign lsu_io_req_bits_wdata = stageReg_data2; // @[4_Mem.scala 159:29]
  assign lsu_io_req_bits_lsuOp = stageReg_lsuOp; // @[4_Mem.scala 161:29]
  assign lsu_io_cache_read_req_ready = dcache_io_read_req_ready; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_read_resp_valid = dcache_io_read_resp_valid; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_read_resp_bits_data = dcache_io_read_resp_bits_data; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_write_req_ready = dcache_io_write_req_ready; // @[4_Mem.scala 167:24]
  assign lsu_io_cache_write_resp_valid = dcache_io_write_resp_valid; // @[4_Mem.scala 167:24]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_read_req_valid = lsu_io_cache_read_req_valid; // @[4_Mem.scala 166:23]
  assign dcache_io_read_req_bits_addr = lsu_io_cache_read_req_bits_addr; // @[4_Mem.scala 166:23]
  assign dcache_io_write_req_valid = lsu_io_cache_write_req_valid; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_addr = lsu_io_cache_write_req_bits_addr; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_data = lsu_io_cache_write_req_bits_data; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_mask = lsu_io_cache_write_req_bits_mask; // @[4_Mem.scala 167:24]
  assign dcache_io_tlbus_req_ready = io_tlbus_req_ready; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[4_Mem.scala 168:21]
  always @(posedge clock) begin
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_regWrEn <= io_in_bits_regWrEn; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_aluOut <= io_in_bits_aluOut; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_data2 <= io_in_bits_data2; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrOp <= io_in_bits_csrOp; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrWrEn <= io_in_bits_csrWrEn; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrValid <= io_in_bits_csrValid; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_excType <= io_in_bits_excType; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[Reg.scala 35:20]
      lsuSend <= 1'h0; // @[Reg.scala 35:20]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 156:23]
      lsuSend <= 1'h0; // @[4_Mem.scala 156:33]
    end else begin
      lsuSend <= _GEN_48;
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
  stageReg_lsuOp = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_resultSrc = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_data2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_csrValid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_excType = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  lsuSend = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WriteBack(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input  [31:0] io_in_bits_csrWrData,
  input  [11:0] io_in_bits_csrAddr,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output        io_instState_commit,
  output [31:0] io_instState_pc,
  output [31:0] io_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  output [4:0]  io_regfile_rd,
  output        io_regfile_regWrEn,
  output [31:0] io_regfile_regWrData,
  output [2:0]  io_csrWrite_op,
  output [11:0] io_csrWrite_addr,
  output [31:0] io_csrWrite_data,
  output        io_csrWrite_retired,
  input  [31:0] io_lsuData
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
`endif // RANDOMIZE_REG_INIT
  wire  writebackLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg [1:0] stageReg_resultSrc; // @[5_WriteBack.scala 49:27]
  reg  stageReg_regWrEn; // @[5_WriteBack.scala 49:27]
  reg [31:0] stageReg_aluOut; // @[5_WriteBack.scala 49:27]
  reg [31:0] stageReg_pcNext4; // @[5_WriteBack.scala 49:27]
  reg [2:0] stageReg_csrOp; // @[5_WriteBack.scala 49:27]
  reg  stageReg_csrWrEn; // @[5_WriteBack.scala 49:27]
  reg [31:0] stageReg_csrWrData; // @[5_WriteBack.scala 49:27]
  reg [11:0] stageReg_csrAddr; // @[5_WriteBack.scala 49:27]
  reg  stageReg_instState_commit; // @[5_WriteBack.scala 49:27]
  reg [31:0] stageReg_instState_pc; // @[5_WriteBack.scala 49:27]
  reg [31:0] stageReg_instState_inst; // @[5_WriteBack.scala 49:27]
  wire  _GEN_13 = writebackLatch & io_in_bits_regWrEn; // @[5_WriteBack.scala 50:26 51:18]
  wire  _GEN_17 = writebackLatch & io_in_bits_csrWrEn; // @[5_WriteBack.scala 50:26 51:18]
  wire  _GEN_21 = writebackLatch & io_in_bits_instState_commit; // @[5_WriteBack.scala 50:26 51:18]
  wire [31:0] _rdVal_T_3 = 2'h1 == stageReg_resultSrc ? io_lsuData : stageReg_aluOut; // @[Mux.scala 81:58]
  assign io_in_ready = io_in_valid; // @[5_WriteBack.scala 47:27]
  assign io_instState_commit = stageReg_instState_commit; // @[5_WriteBack.scala 76:55]
  assign io_instState_pc = stageReg_instState_pc; // @[5_WriteBack.scala 75:26]
  assign io_instState_inst = stageReg_instState_inst; // @[5_WriteBack.scala 75:26]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 57:31]
  assign io_hazard_rdVal = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 81:26]
  assign io_regfile_rd = stageReg_instState_inst[11:7]; // @[util.scala 57:31]
  assign io_regfile_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 68:26]
  assign io_regfile_regWrData = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_csrWrite_op = stageReg_csrWrEn ? stageReg_csrOp : 3'h1; // @[5_WriteBack.scala 72:32]
  assign io_csrWrite_addr = stageReg_csrAddr; // @[5_WriteBack.scala 70:26]
  assign io_csrWrite_data = stageReg_csrWrData; // @[5_WriteBack.scala 71:26]
  assign io_csrWrite_retired = stageReg_instState_commit; // @[5_WriteBack.scala 73:55]
  always @(posedge clock) begin
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_resultSrc <= 2'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_regWrEn <= 1'h0; // @[5_WriteBack.scala 49:27]
    end else begin
      stageReg_regWrEn <= _GEN_13;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_aluOut <= 32'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_aluOut <= io_in_bits_aluOut; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_pcNext4 <= 32'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_csrOp <= 3'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_csrOp <= io_in_bits_csrOp; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_csrWrEn <= 1'h0; // @[5_WriteBack.scala 49:27]
    end else begin
      stageReg_csrWrEn <= _GEN_17;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_csrWrData <= 32'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_csrAddr <= 12'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_csrAddr <= 12'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_instState_commit <= 1'h0; // @[5_WriteBack.scala 49:27]
    end else begin
      stageReg_instState_commit <= _GEN_21;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_instState_pc <= 32'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 49:27]
      stageReg_instState_inst <= 32'h0; // @[5_WriteBack.scala 49:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 50:26]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[5_WriteBack.scala 51:18]
    end else begin
      stageReg_instState_inst <= 32'h0;
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
  stageReg_resultSrc = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineCtrl(
  input   io_in_brTaken,
  input   io_in_excpValid,
  output  io_out_decode_flush,
  output  io_out_execute_flush,
  output  io_out_memory_flush
);
  assign io_out_decode_flush = io_in_brTaken | io_in_excpValid; // @[PipelineCtrl.scala 35:38]
  assign io_out_execute_flush = io_in_excpValid; // @[PipelineCtrl.scala 36:26]
  assign io_out_memory_flush = io_in_excpValid; // @[PipelineCtrl.scala 37:25]
endmodule
module HazardUnit(
  input  [4:0]  io_in_decode_rs1,
  input  [4:0]  io_in_decode_rs2,
  input  [4:0]  io_in_execute_rs1,
  input  [4:0]  io_in_execute_rs2,
  input  [1:0]  io_in_execute_resultSrc,
  input  [4:0]  io_in_execute_rd,
  input  [4:0]  io_in_memory_rd,
  input  [31:0] io_in_memory_rdVal,
  input         io_in_memory_regWrEn,
  input  [4:0]  io_in_writeback_rd,
  input  [31:0] io_in_writeback_rdVal,
  input         io_in_writeback_regWrEn,
  output [1:0]  io_out_execute_aluSrc1,
  output [1:0]  io_out_execute_aluSrc2,
  output [31:0] io_out_execute_rdValM,
  output [31:0] io_out_execute_rdValW,
  output        io_out_decode_stall
);
  wire  _fwMem2ExeRs1_T_2 = io_in_memory_rd != 5'h0; // @[HazardUnit.scala 41:58]
  wire  fwMem2ExeRs1 = io_in_execute_rs1 == io_in_memory_rd & io_in_memory_regWrEn & io_in_memory_rd != 5'h0; // @[HazardUnit.scala 41:51]
  wire  fwMem2ExeRs2 = io_in_execute_rs2 == io_in_memory_rd & io_in_memory_regWrEn & _fwMem2ExeRs1_T_2; // @[HazardUnit.scala 43:51]
  wire  _fwWb2ExeRs1_T_2 = io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 46:57]
  wire  fwWb2ExeRs1 = io_in_execute_rs1 == io_in_writeback_rd & io_in_writeback_regWrEn & io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 46:50]
  wire  fwWb2ExeRs2 = io_in_execute_rs2 == io_in_writeback_rd & io_in_writeback_regWrEn & _fwWb2ExeRs1_T_2; // @[HazardUnit.scala 48:50]
  wire [1:0] _GEN_0 = fwWb2ExeRs1 ? 2'h2 : 2'h0; // @[HazardUnit.scala 54:25 51:28 55:32]
  wire [1:0] _GEN_1 = fwWb2ExeRs2 ? 2'h2 : 2'h0; // @[HazardUnit.scala 57:25 52:28 58:32]
  wire  _T_5 = io_in_execute_rd == io_in_decode_rs1 | io_in_execute_rd == io_in_decode_rs2; // @[HazardUnit.scala 79:27]
  assign io_out_execute_aluSrc1 = fwMem2ExeRs1 ? 2'h1 : _GEN_0; // @[HazardUnit.scala 62:26 63:32]
  assign io_out_execute_aluSrc2 = fwMem2ExeRs2 ? 2'h1 : _GEN_1; // @[HazardUnit.scala 65:26 66:32]
  assign io_out_execute_rdValM = io_in_memory_rdVal; // @[HazardUnit.scala 69:27]
  assign io_out_execute_rdValW = io_in_writeback_rdVal; // @[HazardUnit.scala 70:27]
  assign io_out_decode_stall = io_in_execute_resultSrc == 2'h1 & io_in_execute_rd != 5'h0 & _T_5; // @[HazardUnit.scala 77:25 78:51]
endmodule
module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_r_0_addr,
  output [31:0] io_r_0_data,
  input  [4:0]  io_r_1_addr,
  output [31:0] io_r_1_data,
  input  [4:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [31:0] io_w_0_data,
  output [31:0] io_state_regState_0,
  output [31:0] io_state_regState_1,
  output [31:0] io_state_regState_2,
  output [31:0] io_state_regState_3,
  output [31:0] io_state_regState_4,
  output [31:0] io_state_regState_5,
  output [31:0] io_state_regState_6,
  output [31:0] io_state_regState_7,
  output [31:0] io_state_regState_8,
  output [31:0] io_state_regState_9,
  output [31:0] io_state_regState_10,
  output [31:0] io_state_regState_11,
  output [31:0] io_state_regState_12,
  output [31:0] io_state_regState_13,
  output [31:0] io_state_regState_14,
  output [31:0] io_state_regState_15,
  output [31:0] io_state_regState_16,
  output [31:0] io_state_regState_17,
  output [31:0] io_state_regState_18,
  output [31:0] io_state_regState_19,
  output [31:0] io_state_regState_20,
  output [31:0] io_state_regState_21,
  output [31:0] io_state_regState_22,
  output [31:0] io_state_regState_23,
  output [31:0] io_state_regState_24,
  output [31:0] io_state_regState_25,
  output [31:0] io_state_regState_26,
  output [31:0] io_state_regState_27,
  output [31:0] io_state_regState_28,
  output [31:0] io_state_regState_29,
  output [31:0] io_state_regState_30,
  output [31:0] io_state_regState_31
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs_0; // @[RegFile.scala 40:17]
  reg [31:0] regs_1; // @[RegFile.scala 40:17]
  reg [31:0] regs_2; // @[RegFile.scala 40:17]
  reg [31:0] regs_3; // @[RegFile.scala 40:17]
  reg [31:0] regs_4; // @[RegFile.scala 40:17]
  reg [31:0] regs_5; // @[RegFile.scala 40:17]
  reg [31:0] regs_6; // @[RegFile.scala 40:17]
  reg [31:0] regs_7; // @[RegFile.scala 40:17]
  reg [31:0] regs_8; // @[RegFile.scala 40:17]
  reg [31:0] regs_9; // @[RegFile.scala 40:17]
  reg [31:0] regs_10; // @[RegFile.scala 40:17]
  reg [31:0] regs_11; // @[RegFile.scala 40:17]
  reg [31:0] regs_12; // @[RegFile.scala 40:17]
  reg [31:0] regs_13; // @[RegFile.scala 40:17]
  reg [31:0] regs_14; // @[RegFile.scala 40:17]
  reg [31:0] regs_15; // @[RegFile.scala 40:17]
  reg [31:0] regs_16; // @[RegFile.scala 40:17]
  reg [31:0] regs_17; // @[RegFile.scala 40:17]
  reg [31:0] regs_18; // @[RegFile.scala 40:17]
  reg [31:0] regs_19; // @[RegFile.scala 40:17]
  reg [31:0] regs_20; // @[RegFile.scala 40:17]
  reg [31:0] regs_21; // @[RegFile.scala 40:17]
  reg [31:0] regs_22; // @[RegFile.scala 40:17]
  reg [31:0] regs_23; // @[RegFile.scala 40:17]
  reg [31:0] regs_24; // @[RegFile.scala 40:17]
  reg [31:0] regs_25; // @[RegFile.scala 40:17]
  reg [31:0] regs_26; // @[RegFile.scala 40:17]
  reg [31:0] regs_27; // @[RegFile.scala 40:17]
  reg [31:0] regs_28; // @[RegFile.scala 40:17]
  reg [31:0] regs_29; // @[RegFile.scala 40:17]
  reg [31:0] regs_30; // @[RegFile.scala 40:17]
  reg [31:0] regs_31; // @[RegFile.scala 40:17]
  wire [31:0] _GEN_1 = reset ? 32'h0 : regs_1; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_2 = reset ? 32'h0 : regs_2; // @[RegFile.scala 41:22 46:11 40:17]
  wire [31:0] _GEN_3 = reset ? 32'h0 : regs_3; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_4 = reset ? 32'h0 : regs_4; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_5 = reset ? 32'h0 : regs_5; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_6 = reset ? 32'h0 : regs_6; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_7 = reset ? 32'h0 : regs_7; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_8 = reset ? 32'h0 : regs_8; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_9 = reset ? 32'h0 : regs_9; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_10 = reset ? 32'h0 : regs_10; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_11 = reset ? 32'h0 : regs_11; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_12 = reset ? 32'h0 : regs_12; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_13 = reset ? 32'h0 : regs_13; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_14 = reset ? 32'h0 : regs_14; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_15 = reset ? 32'h0 : regs_15; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_16 = reset ? 32'h0 : regs_16; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_17 = reset ? 32'h0 : regs_17; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_18 = reset ? 32'h0 : regs_18; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_19 = reset ? 32'h0 : regs_19; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_20 = reset ? 32'h0 : regs_20; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_21 = reset ? 32'h0 : regs_21; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_22 = reset ? 32'h0 : regs_22; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_23 = reset ? 32'h0 : regs_23; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_24 = reset ? 32'h0 : regs_24; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_25 = reset ? 32'h0 : regs_25; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_26 = reset ? 32'h0 : regs_26; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_27 = reset ? 32'h0 : regs_27; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_28 = reset ? 32'h0 : regs_28; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_29 = reset ? 32'h0 : regs_29; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_30 = reset ? 32'h0 : regs_30; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_31 = reset ? 32'h0 : regs_31; // @[RegFile.scala 40:17 41:22 43:9]
  wire  _writeBypassVec_T_2 = io_w_0_addr != 5'h0; // @[RegFile.scala 54:67]
  wire  writeBypassVec_0 = io_w_0_en & io_r_0_addr == io_w_0_addr & io_w_0_addr != 5'h0; // @[RegFile.scala 54:51]
  wire  writeBypassVec_1 = io_w_0_en & io_r_1_addr == io_w_0_addr & io_w_0_addr != 5'h0; // @[RegFile.scala 54:51]
  wire [31:0] _GEN_33 = 5'h1 == io_r_0_addr ? regs_1 : regs_0; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_34 = 5'h2 == io_r_0_addr ? regs_2 : _GEN_33; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_35 = 5'h3 == io_r_0_addr ? regs_3 : _GEN_34; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_36 = 5'h4 == io_r_0_addr ? regs_4 : _GEN_35; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_37 = 5'h5 == io_r_0_addr ? regs_5 : _GEN_36; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_38 = 5'h6 == io_r_0_addr ? regs_6 : _GEN_37; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_39 = 5'h7 == io_r_0_addr ? regs_7 : _GEN_38; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_40 = 5'h8 == io_r_0_addr ? regs_8 : _GEN_39; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_41 = 5'h9 == io_r_0_addr ? regs_9 : _GEN_40; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_42 = 5'ha == io_r_0_addr ? regs_10 : _GEN_41; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_43 = 5'hb == io_r_0_addr ? regs_11 : _GEN_42; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_44 = 5'hc == io_r_0_addr ? regs_12 : _GEN_43; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_45 = 5'hd == io_r_0_addr ? regs_13 : _GEN_44; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_46 = 5'he == io_r_0_addr ? regs_14 : _GEN_45; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_47 = 5'hf == io_r_0_addr ? regs_15 : _GEN_46; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_48 = 5'h10 == io_r_0_addr ? regs_16 : _GEN_47; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_49 = 5'h11 == io_r_0_addr ? regs_17 : _GEN_48; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_50 = 5'h12 == io_r_0_addr ? regs_18 : _GEN_49; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_51 = 5'h13 == io_r_0_addr ? regs_19 : _GEN_50; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_52 = 5'h14 == io_r_0_addr ? regs_20 : _GEN_51; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_53 = 5'h15 == io_r_0_addr ? regs_21 : _GEN_52; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_54 = 5'h16 == io_r_0_addr ? regs_22 : _GEN_53; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_55 = 5'h17 == io_r_0_addr ? regs_23 : _GEN_54; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_56 = 5'h18 == io_r_0_addr ? regs_24 : _GEN_55; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_57 = 5'h19 == io_r_0_addr ? regs_25 : _GEN_56; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_58 = 5'h1a == io_r_0_addr ? regs_26 : _GEN_57; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_59 = 5'h1b == io_r_0_addr ? regs_27 : _GEN_58; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_60 = 5'h1c == io_r_0_addr ? regs_28 : _GEN_59; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_61 = 5'h1d == io_r_0_addr ? regs_29 : _GEN_60; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_62 = 5'h1e == io_r_0_addr ? regs_30 : _GEN_61; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_63 = 5'h1f == io_r_0_addr ? regs_31 : _GEN_62; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_67 = 5'h1 == io_r_1_addr ? regs_1 : regs_0; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_68 = 5'h2 == io_r_1_addr ? regs_2 : _GEN_67; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_69 = 5'h3 == io_r_1_addr ? regs_3 : _GEN_68; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_70 = 5'h4 == io_r_1_addr ? regs_4 : _GEN_69; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_71 = 5'h5 == io_r_1_addr ? regs_5 : _GEN_70; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_72 = 5'h6 == io_r_1_addr ? regs_6 : _GEN_71; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_73 = 5'h7 == io_r_1_addr ? regs_7 : _GEN_72; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_74 = 5'h8 == io_r_1_addr ? regs_8 : _GEN_73; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_75 = 5'h9 == io_r_1_addr ? regs_9 : _GEN_74; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_76 = 5'ha == io_r_1_addr ? regs_10 : _GEN_75; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_77 = 5'hb == io_r_1_addr ? regs_11 : _GEN_76; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_78 = 5'hc == io_r_1_addr ? regs_12 : _GEN_77; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_79 = 5'hd == io_r_1_addr ? regs_13 : _GEN_78; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_80 = 5'he == io_r_1_addr ? regs_14 : _GEN_79; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_81 = 5'hf == io_r_1_addr ? regs_15 : _GEN_80; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_82 = 5'h10 == io_r_1_addr ? regs_16 : _GEN_81; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_83 = 5'h11 == io_r_1_addr ? regs_17 : _GEN_82; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_84 = 5'h12 == io_r_1_addr ? regs_18 : _GEN_83; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_85 = 5'h13 == io_r_1_addr ? regs_19 : _GEN_84; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_86 = 5'h14 == io_r_1_addr ? regs_20 : _GEN_85; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_87 = 5'h15 == io_r_1_addr ? regs_21 : _GEN_86; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_88 = 5'h16 == io_r_1_addr ? regs_22 : _GEN_87; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_89 = 5'h17 == io_r_1_addr ? regs_23 : _GEN_88; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_90 = 5'h18 == io_r_1_addr ? regs_24 : _GEN_89; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_91 = 5'h19 == io_r_1_addr ? regs_25 : _GEN_90; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_92 = 5'h1a == io_r_1_addr ? regs_26 : _GEN_91; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_93 = 5'h1b == io_r_1_addr ? regs_27 : _GEN_92; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_94 = 5'h1c == io_r_1_addr ? regs_28 : _GEN_93; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_95 = 5'h1d == io_r_1_addr ? regs_29 : _GEN_94; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_96 = 5'h1e == io_r_1_addr ? regs_30 : _GEN_95; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_97 = 5'h1f == io_r_1_addr ? regs_31 : _GEN_96; // @[RegFile.scala 62:{22,22}]
  assign io_r_0_data = writeBypassVec_0 ? io_w_0_data : _GEN_63; // @[RegFile.scala 59:31 60:22 62:22]
  assign io_r_1_data = writeBypassVec_1 ? io_w_0_data : _GEN_97; // @[RegFile.scala 59:31 60:22 62:22]
  assign io_state_regState_0 = regs_0; // @[RegFile.scala 81:61]
  assign io_state_regState_1 = regs_1; // @[RegFile.scala 81:61]
  assign io_state_regState_2 = regs_2; // @[RegFile.scala 81:61]
  assign io_state_regState_3 = regs_3; // @[RegFile.scala 81:61]
  assign io_state_regState_4 = regs_4; // @[RegFile.scala 81:61]
  assign io_state_regState_5 = regs_5; // @[RegFile.scala 81:61]
  assign io_state_regState_6 = regs_6; // @[RegFile.scala 81:61]
  assign io_state_regState_7 = regs_7; // @[RegFile.scala 81:61]
  assign io_state_regState_8 = regs_8; // @[RegFile.scala 81:61]
  assign io_state_regState_9 = regs_9; // @[RegFile.scala 81:61]
  assign io_state_regState_10 = regs_10; // @[RegFile.scala 81:61]
  assign io_state_regState_11 = regs_11; // @[RegFile.scala 81:61]
  assign io_state_regState_12 = regs_12; // @[RegFile.scala 81:61]
  assign io_state_regState_13 = regs_13; // @[RegFile.scala 81:61]
  assign io_state_regState_14 = regs_14; // @[RegFile.scala 81:61]
  assign io_state_regState_15 = regs_15; // @[RegFile.scala 81:61]
  assign io_state_regState_16 = regs_16; // @[RegFile.scala 81:61]
  assign io_state_regState_17 = regs_17; // @[RegFile.scala 81:61]
  assign io_state_regState_18 = regs_18; // @[RegFile.scala 81:61]
  assign io_state_regState_19 = regs_19; // @[RegFile.scala 81:61]
  assign io_state_regState_20 = regs_20; // @[RegFile.scala 81:61]
  assign io_state_regState_21 = regs_21; // @[RegFile.scala 81:61]
  assign io_state_regState_22 = regs_22; // @[RegFile.scala 81:61]
  assign io_state_regState_23 = regs_23; // @[RegFile.scala 81:61]
  assign io_state_regState_24 = regs_24; // @[RegFile.scala 81:61]
  assign io_state_regState_25 = regs_25; // @[RegFile.scala 81:61]
  assign io_state_regState_26 = regs_26; // @[RegFile.scala 81:61]
  assign io_state_regState_27 = regs_27; // @[RegFile.scala 81:61]
  assign io_state_regState_28 = regs_28; // @[RegFile.scala 81:61]
  assign io_state_regState_29 = regs_29; // @[RegFile.scala 81:61]
  assign io_state_regState_30 = regs_30; // @[RegFile.scala 81:61]
  assign io_state_regState_31 = regs_31; // @[RegFile.scala 81:61]
  always @(posedge clock) begin
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h0 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_0 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_0 <= 32'h0; // @[RegFile.scala 49:11]
      end
    end else begin
      regs_0 <= 32'h0; // @[RegFile.scala 49:11]
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_1 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_1 <= _GEN_1;
      end
    end else begin
      regs_1 <= _GEN_1;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h2 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_2 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_2 <= _GEN_2;
      end
    end else begin
      regs_2 <= _GEN_2;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h3 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_3 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_3 <= _GEN_3;
      end
    end else begin
      regs_3 <= _GEN_3;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h4 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_4 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_4 <= _GEN_4;
      end
    end else begin
      regs_4 <= _GEN_4;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h5 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_5 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_5 <= _GEN_5;
      end
    end else begin
      regs_5 <= _GEN_5;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h6 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_6 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_6 <= _GEN_6;
      end
    end else begin
      regs_6 <= _GEN_6;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h7 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_7 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_7 <= _GEN_7;
      end
    end else begin
      regs_7 <= _GEN_7;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h8 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_8 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_8 <= _GEN_8;
      end
    end else begin
      regs_8 <= _GEN_8;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h9 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_9 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_9 <= _GEN_9;
      end
    end else begin
      regs_9 <= _GEN_9;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'ha == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_10 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_10 <= _GEN_10;
      end
    end else begin
      regs_10 <= _GEN_10;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hb == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_11 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_11 <= _GEN_11;
      end
    end else begin
      regs_11 <= _GEN_11;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hc == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_12 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_12 <= _GEN_12;
      end
    end else begin
      regs_12 <= _GEN_12;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hd == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_13 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_13 <= _GEN_13;
      end
    end else begin
      regs_13 <= _GEN_13;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'he == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_14 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_14 <= _GEN_14;
      end
    end else begin
      regs_14 <= _GEN_14;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hf == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_15 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_15 <= _GEN_15;
      end
    end else begin
      regs_15 <= _GEN_15;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h10 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_16 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_16 <= _GEN_16;
      end
    end else begin
      regs_16 <= _GEN_16;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h11 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_17 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_17 <= _GEN_17;
      end
    end else begin
      regs_17 <= _GEN_17;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h12 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_18 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_18 <= _GEN_18;
      end
    end else begin
      regs_18 <= _GEN_18;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h13 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_19 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_19 <= _GEN_19;
      end
    end else begin
      regs_19 <= _GEN_19;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h14 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_20 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_20 <= _GEN_20;
      end
    end else begin
      regs_20 <= _GEN_20;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h15 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_21 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_21 <= _GEN_21;
      end
    end else begin
      regs_21 <= _GEN_21;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h16 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_22 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_22 <= _GEN_22;
      end
    end else begin
      regs_22 <= _GEN_22;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h17 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_23 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_23 <= _GEN_23;
      end
    end else begin
      regs_23 <= _GEN_23;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h18 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_24 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_24 <= _GEN_24;
      end
    end else begin
      regs_24 <= _GEN_24;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h19 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_25 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_25 <= _GEN_25;
      end
    end else begin
      regs_25 <= _GEN_25;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1a == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_26 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_26 <= _GEN_26;
      end
    end else begin
      regs_26 <= _GEN_26;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1b == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_27 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_27 <= _GEN_27;
      end
    end else begin
      regs_27 <= _GEN_27;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1c == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_28 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_28 <= _GEN_28;
      end
    end else begin
      regs_28 <= _GEN_28;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1d == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_29 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_29 <= _GEN_29;
      end
    end else begin
      regs_29 <= _GEN_29;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1e == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_30 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_30 <= _GEN_30;
      end
    end else begin
      regs_30 <= _GEN_30;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1f == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_31 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_31 <= _GEN_31;
      end
    end else begin
      regs_31 <= _GEN_31;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(regs_0 == 32'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: zero reg must be 0 !\n    at RegFile.scala:50 assert(regs(0).asUInt === 0.U, \"zero reg must be 0 !\")\n"
            ); // @[RegFile.scala 50:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(regs_0 == 32'h0) & ~reset) begin
          $fatal; // @[RegFile.scala 50:9]
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
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CsrFile(
  input         clock,
  input         reset,
  input  [2:0]  io_read_op,
  output        io_read_valid,
  input  [11:0] io_read_addr,
  output [31:0] io_read_data,
  input  [2:0]  io_write_op,
  input  [11:0] io_write_addr,
  input  [31:0] io_write_data,
  input         io_write_retired,
  input         io_except_valid,
  input         io_except_bits_isMret,
  input         io_except_bits_isSret,
  input  [30:0] io_except_bits_excCause,
  input  [31:0] io_except_bits_excPc,
  input  [31:0] io_except_bits_excValue,
  output [1:0]  io_mode,
  output        io_busy,
  output [31:0] io_mepc,
  output [31:0] io_trapVec
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
`endif // RANDOMIZE_REG_INIT
  reg  mcause_int; // @[CsrFile.scala 66:28]
  reg [30:0] mcause_code; // @[CsrFile.scala 66:28]
  reg  mstatus_sum; // @[CsrFile.scala 67:28]
  reg [1:0] mstatus_mpp; // @[CsrFile.scala 67:28]
  reg  mstatus_spp; // @[CsrFile.scala 67:28]
  reg  mstatus_mpie; // @[CsrFile.scala 67:28]
  reg  mstatus_spie; // @[CsrFile.scala 67:28]
  reg  mstatus_mie; // @[CsrFile.scala 67:28]
  reg  mstatus_sie; // @[CsrFile.scala 67:28]
  reg [29:0] mtvec_base; // @[CsrFile.scala 68:28]
  reg [1:0] mtvec_mode; // @[CsrFile.scala 68:28]
  reg [31:0] medeleg_data; // @[CsrFile.scala 69:28]
  reg [31:0] mideleg_data; // @[CsrFile.scala 70:28]
  reg [31:0] mepc_data; // @[CsrFile.scala 71:28]
  reg  satp_mode; // @[CsrFile.scala 72:28]
  reg [21:0] satp_ppn; // @[CsrFile.scala 72:28]
  reg [31:0] mtval_data; // @[CsrFile.scala 73:28]
  wire [31:0] _T = {mcause_int,mcause_code}; // @[CsrFile.scala 83:49]
  wire [10:0] lo = {2'h0,mstatus_spp,mstatus_mpie,1'h0,mstatus_spie,1'h0,mstatus_mie,1'h0,mstatus_sie,1'h0}; // @[CsrFile.scala 84:50]
  wire [31:0] _T_1 = {13'h0,mstatus_sum,1'h0,2'h0,2'h0,mstatus_mpp,lo}; // @[CsrFile.scala 84:50]
  wire [31:0] _T_2 = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 85:48]
  wire [31:0] _T_3 = {satp_mode,9'h0,satp_ppn}; // @[CsrFile.scala 89:47]
  wire  _T_5 = 12'hf14 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_7 = 12'h342 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_11 = 12'h305 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_13 = 12'h302 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_15 = 12'h303 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_17 = 12'h341 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_19 = 12'h180 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_21 = 12'h343 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_23 = 12'h3a0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_25 = 12'h3a1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_27 = 12'h3a2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_29 = 12'h3a3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_31 = 12'h3b0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_33 = 12'h3b1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_35 = 12'h3b2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_37 = 12'h3b3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_39 = 12'h3b4 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_41 = 12'h3b5 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_43 = 12'h3b6 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_45 = 12'h3b7 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_47 = 12'h3b8 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_49 = 12'h3b9 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_51 = 12'h3ba == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_53 = 12'h3bb == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_55 = 12'h3bc == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_57 = 12'h3bd == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_59 = 12'h3be == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_61 = 12'h3bf == io_read_addr; // @[Lookup.scala 31:38]
  wire [31:0] _T_82 = _T_21 ? mtval_data : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _T_83 = _T_19 ? _T_3 : _T_82; // @[Lookup.scala 34:39]
  wire [31:0] _T_84 = _T_17 ? mepc_data : _T_83; // @[Lookup.scala 34:39]
  wire [31:0] _T_85 = _T_15 ? mideleg_data : _T_84; // @[Lookup.scala 34:39]
  wire [31:0] _T_86 = _T_13 ? medeleg_data : _T_85; // @[Lookup.scala 34:39]
  wire [31:0] _T_87 = _T_11 ? _T_2 : _T_86; // @[Lookup.scala 34:39]
  wire [31:0] _T_88 = _T_7 ? _T_1 : _T_87; // @[Lookup.scala 34:39]
  wire [31:0] _T_89 = _T_7 ? _T : _T_88; // @[Lookup.scala 34:39]
  wire  readable = _T_5 | (_T_7 | (_T_7 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27
     | (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (
    _T_53 | (_T_55 | (_T_57 | (_T_59 | _T_61))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  writable = _T_5 ? 1'h0 : _T_7 | (_T_7 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 |
    (_T_27 | (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51
     | (_T_53 | (_T_55 | (_T_57 | (_T_59 | _T_61)))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _readValid_T = readable & writable; // @[CsrFile.scala 123:30]
  wire  _readValid_T_6 = 3'h2 == io_read_op ? writable : 3'h1 == io_read_op & readable; // @[Mux.scala 81:58]
  wire  _readValid_T_8 = 3'h3 == io_read_op ? _readValid_T : _readValid_T_6; // @[Mux.scala 81:58]
  wire  _readValid_T_10 = 3'h4 == io_read_op ? _readValid_T : _readValid_T_8; // @[Mux.scala 81:58]
  wire  _csrData_T_1 = 12'hf14 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_3 = 12'h342 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_7 = 12'h305 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_9 = 12'h302 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_11 = 12'h303 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_13 = 12'h341 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_15 = 12'h180 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_17 = 12'h343 == io_write_addr; // @[Lookup.scala 31:38]
  wire [31:0] _csrData_T_78 = _csrData_T_17 ? mtval_data : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_79 = _csrData_T_15 ? _T_3 : _csrData_T_78; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_80 = _csrData_T_13 ? mepc_data : _csrData_T_79; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_81 = _csrData_T_11 ? mideleg_data : _csrData_T_80; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_82 = _csrData_T_9 ? medeleg_data : _csrData_T_81; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_83 = _csrData_T_7 ? _T_2 : _csrData_T_82; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_84 = _csrData_T_3 ? _T_1 : _csrData_T_83; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_85 = _csrData_T_3 ? _T : _csrData_T_84; // @[Lookup.scala 34:39]
  wire [31:0] csrData = _csrData_T_1 ? 32'h0 : _csrData_T_85; // @[Lookup.scala 34:39]
  wire  writeEn = io_write_op != 3'h0 & io_write_op != 3'h1; // @[CsrFile.scala 133:43]
  wire [31:0] _writeData_T = csrData | io_write_data; // @[CsrFile.scala 137:29]
  wire [31:0] _writeData_T_1 = ~io_write_data; // @[CsrFile.scala 138:31]
  wire [31:0] _writeData_T_2 = csrData & _writeData_T_1; // @[CsrFile.scala 138:29]
  wire [31:0] _writeData_T_4 = 3'h2 == io_write_op ? io_write_data : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_6 = 3'h3 == io_write_op ? io_write_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_8 = 3'h4 == io_write_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [31:0] writeData = 3'h5 == io_write_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [6:0] medeleg_data_lo = {writeData[6],1'h0,writeData[4:2],1'h0,writeData[0]}; // @[Cat.scala 33:92]
  wire [15:0] _medeleg_data_T_6 = {writeData[15],1'h0,writeData[13:12],2'h0,writeData[9:8],1'h0,medeleg_data_lo}; // @[Cat.scala 33:92]
  wire [11:0] _mideleg_data_T_3 = {2'h0,writeData[9],3'h0,writeData[5],3'h0,writeData[1],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _mepc_data_T_1 = {writeData[31:2],2'h0}; // @[Cat.scala 33:92]
  wire  _GEN_0 = _csrData_T_15 ? writeData[31] : satp_mode; // @[CsrFile.scala 143:31 CSR.scala 187:11 CsrFile.scala 72:28]
  wire [21:0] _GEN_1 = _csrData_T_15 ? writeData[21:0] : satp_ppn; // @[CsrFile.scala 143:31 CSR.scala 188:11 CsrFile.scala 72:28]
  wire [31:0] _GEN_2 = _csrData_T_13 ? _mepc_data_T_1 : mepc_data; // @[CsrFile.scala 143:31 CSR.scala 369:11 CsrFile.scala 71:28]
  wire  _GEN_3 = _csrData_T_13 ? satp_mode : _GEN_0; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_4 = _csrData_T_13 ? satp_ppn : _GEN_1; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _GEN_5 = _csrData_T_11 ? {{20'd0}, _mideleg_data_T_3} : mideleg_data; // @[CsrFile.scala 143:31 CSR.scala 271:11 CsrFile.scala 70:28]
  wire [31:0] _GEN_6 = _csrData_T_11 ? mepc_data : _GEN_2; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_7 = _csrData_T_11 ? satp_mode : _GEN_3; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_8 = _csrData_T_11 ? satp_ppn : _GEN_4; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _GEN_9 = _csrData_T_9 ? {{16'd0}, _medeleg_data_T_6} : medeleg_data; // @[CsrFile.scala 143:31 CSR.scala 256:11 CsrFile.scala 69:28]
  wire [31:0] _GEN_10 = _csrData_T_9 ? mideleg_data : _GEN_5; // @[CsrFile.scala 143:31 70:28]
  wire [31:0] _GEN_11 = _csrData_T_9 ? mepc_data : _GEN_6; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_12 = _csrData_T_9 ? satp_mode : _GEN_7; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_13 = _csrData_T_9 ? satp_ppn : _GEN_8; // @[CsrFile.scala 143:31 72:28]
  wire [29:0] _GEN_14 = _csrData_T_7 ? writeData[31:2] : mtvec_base; // @[CsrFile.scala 143:31 CSR.scala 345:11 CsrFile.scala 68:28]
  wire [1:0] _GEN_15 = _csrData_T_7 ? {{1'd0}, writeData[0]} : mtvec_mode; // @[CsrFile.scala 143:31 CSR.scala 346:11 CsrFile.scala 68:28]
  wire [31:0] _GEN_16 = _csrData_T_7 ? medeleg_data : _GEN_9; // @[CsrFile.scala 143:31 69:28]
  wire [31:0] _GEN_17 = _csrData_T_7 ? mideleg_data : _GEN_10; // @[CsrFile.scala 143:31 70:28]
  wire [31:0] _GEN_18 = _csrData_T_7 ? mepc_data : _GEN_11; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_19 = _csrData_T_7 ? satp_mode : _GEN_12; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_20 = _csrData_T_7 ? satp_ppn : _GEN_13; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _T_153 = {1'h0,io_except_bits_excCause}; // @[Cat.scala 33:92]
  wire [31:0] _mepc_data_T_3 = {io_except_bits_excPc[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_read_valid = 3'h5 == io_read_op ? _readValid_T : _readValid_T_10; // @[Mux.scala 81:58]
  assign io_read_data = _T_5 ? 32'h0 : _T_89; // @[Lookup.scala 34:39]
  assign io_mode = 2'h3; // @[CsrFile.scala 161:13]
  assign io_busy = io_write_op != 3'h0 & io_write_op != 3'h1; // @[CsrFile.scala 133:43]
  assign io_mepc = mepc_data; // @[CsrFile.scala 163:13]
  assign io_trapVec = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 164:25]
  always @(posedge clock) begin
    if (reset) begin // @[CsrFile.scala 66:28]
      mcause_int <= 1'h0; // @[CsrFile.scala 66:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 143:31]
        mcause_int <= writeData[31]; // @[CSR.scala 384:11]
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mcause_int <= _T_153[31]; // @[CSR.scala 384:11]
    end
    if (reset) begin // @[CsrFile.scala 66:28]
      mcause_code <= 31'h0; // @[CsrFile.scala 66:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 143:31]
        mcause_code <= {{27'd0}, writeData[3:0]}; // @[CSR.scala 385:11]
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mcause_code <= {{27'd0}, _T_153[3:0]}; // @[CSR.scala 385:11]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_sum <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_sum <= writeData[18]; // @[CSR.scala 222:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mpp <= 2'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mpp <= writeData[12:11]; // @[CSR.scala 223:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mpp <= 2'h3; // @[CsrFile.scala 158:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_spp <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_spp <= writeData[8]; // @[CSR.scala 224:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mpie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mpie <= writeData[7]; // @[CSR.scala 225:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mpie <= mstatus_mie; // @[CsrFile.scala 156:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_spie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_spie <= writeData[5]; // @[CSR.scala 226:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mie <= writeData[3]; // @[CSR.scala 227:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mie <= 1'h0; // @[CsrFile.scala 157:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_sie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_sie <= writeData[1]; // @[CSR.scala 228:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 68:28]
      mtvec_base <= 30'h0; // @[CsrFile.scala 68:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mtvec_base <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 68:28]
      mtvec_mode <= 2'h0; // @[CsrFile.scala 68:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mtvec_mode <= _GEN_15;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 69:28]
      medeleg_data <= 32'h0; // @[CsrFile.scala 69:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          medeleg_data <= _GEN_16;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mideleg_data <= 32'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mideleg_data <= _GEN_17;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 71:28]
      mepc_data <= 32'h0; // @[CsrFile.scala 71:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mepc_data <= _GEN_18;
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mepc_data <= _mepc_data_T_3; // @[CSR.scala 369:11]
    end
    if (reset) begin // @[CsrFile.scala 72:28]
      satp_mode <= 1'h0; // @[CsrFile.scala 72:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          satp_mode <= _GEN_19;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 72:28]
      satp_ppn <= 22'h0; // @[CsrFile.scala 72:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          satp_ppn <= _GEN_20;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 73:28]
      mtval_data <= 32'h0; // @[CsrFile.scala 73:28]
    end else if (!(writeEn)) begin // @[CsrFile.scala 142:19]
      if (io_except_valid) begin // @[CsrFile.scala 152:33]
        mtval_data <= io_except_bits_excValue; // @[CSR.scala 17:10]
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
  mcause_int = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mcause_code = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  mstatus_sum = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mstatus_mpp = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  mstatus_spp = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mstatus_mpie = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mstatus_spie = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mstatus_mie = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mstatus_sie = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mtvec_base = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  mtvec_mode = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  medeleg_data = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mideleg_data = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mepc_data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  satp_mode = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  satp_ppn = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  mtval_data = _RAND_16[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TLBusArbiter(
  input        clock,
  input        reset,
  input        io_reqs_1,
  output [1:0] io_grantOH
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] owner; // @[Bus.scala 120:24]
  wire [3:0] _io_grantOH_T = 4'h1 << owner; // @[OneHot.scala 57:35]
  assign io_grantOH = _io_grantOH_T[1:0]; // @[Bus.scala 148:16]
  always @(posedge clock) begin
    if (reset) begin // @[Bus.scala 120:24]
      owner <= 2'h0; // @[Bus.scala 120:24]
    end else if (io_reqs_1) begin // @[Mux.scala 27:73]
      owner <= 2'h1;
    end else begin
      owner <= 2'h0;
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
  owner = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TLBusMux(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [2:0]  io_in_0_bits_opcode,
  input  [31:0] io_in_0_bits_address,
  input  [31:0] io_in_0_bits_data,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
  input  [31:0] io_in_1_bits_address,
  input  [31:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [3:0]  io_out_bits_size,
  output        io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [31:0] io_out_bits_data,
  input         io_choseOH_0,
  input         io_choseOH_1
);
  wire [31:0] _io_out_bits_T = io_choseOH_0 ? io_in_0_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_1 = io_choseOH_1 ? io_in_1_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_9 = io_choseOH_0 ? io_in_0_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_10 = io_choseOH_1 ? io_in_1_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_15 = io_choseOH_0 ? 4'h8 : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _io_out_bits_T_16 = io_choseOH_1 ? 4'h8 : 4'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_21 = io_choseOH_0 ? io_in_0_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_out_bits_T_22 = io_choseOH_1 ? io_in_1_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  assign io_in_0_ready = io_out_ready & io_choseOH_0; // @[Bus.scala 90:80]
  assign io_in_1_ready = io_out_ready & io_choseOH_1; // @[Bus.scala 90:80]
  assign io_out_valid = io_choseOH_0 & io_in_0_valid | io_choseOH_1 & io_in_1_valid; // @[Mux.scala 27:73]
  assign io_out_bits_opcode = _io_out_bits_T_21 | _io_out_bits_T_22; // @[Mux.scala 27:73]
  assign io_out_bits_size = _io_out_bits_T_15 | _io_out_bits_T_16; // @[Mux.scala 27:73]
  assign io_out_bits_source = io_choseOH_1; // @[Mux.scala 27:73]
  assign io_out_bits_address = _io_out_bits_T_9 | _io_out_bits_T_10; // @[Mux.scala 27:73]
  assign io_out_bits_data = _io_out_bits_T | _io_out_bits_T_1; // @[Mux.scala 27:73]
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [3:0]  io_enq_bits_size,
  input         io_enq_bits_source,
  input  [31:0] io_enq_bits_address,
  input  [31:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [3:0]  io_deq_bits_size,
  output        io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output [31:0] io_deq_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_opcode_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_opcode_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_opcode_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_opcode_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_opcode_MPORT_en; // @[Decoupled.scala 273:95]
  reg [3:0] ram_size [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [3:0] ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [3:0] ram_size_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_size_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_size_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_size_MPORT_en; // @[Decoupled.scala 273:95]
  reg  ram_source [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_source_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_source_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_source_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_address [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_address_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_address_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_address_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_address_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_address_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_address_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_address_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_data [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_data_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_data_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 273:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire  _GEN_19 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 318:26 280:27 318:35]
  wire  do_enq = empty ? _GEN_19 : _do_enq_T; // @[Decoupled.scala 315:17 280:27]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 315:17 317:14 281:27]
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = enq_ptr_value;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = enq_ptr_value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = enq_ptr_value;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_address_io_deq_bits_MPORT_en = 1'h1;
  assign ram_address_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_address_io_deq_bits_MPORT_data = ram_address[ram_address_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_address_MPORT_data = io_enq_bits_address;
  assign ram_address_MPORT_addr = enq_ptr_value;
  assign ram_address_MPORT_mask = 1'h1;
  assign ram_address_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = enq_ptr_value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 302:16 314:{24,39}]
  assign io_deq_bits_opcode = empty ? io_enq_bits_opcode : ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_size = empty ? io_enq_bits_size : ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_source = empty ? io_enq_bits_source : ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_address = empty ? io_enq_bits_address : ram_address_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_data = empty ? io_enq_bits_data : ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_address_MPORT_en & ram_address_MPORT_mask) begin
      ram_address[ram_address_MPORT_addr] <= ram_address_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      if (empty) begin // @[Decoupled.scala 315:17]
        if (io_deq_ready) begin // @[Decoupled.scala 318:26]
          maybe_full <= 1'h0; // @[Decoupled.scala 318:35]
        end else begin
          maybe_full <= _do_enq_T; // @[Decoupled.scala 280:27]
        end
      end else begin
        maybe_full <= _do_enq_T; // @[Decoupled.scala 280:27]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_size[initvar] = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_source[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_address[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_data[initvar] = _RAND_4[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  enq_ptr_value = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  deq_ptr_value = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  maybe_full = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TLAddrDecode(
  input  [31:0] io_addr,
  output        io_choseOH_0,
  output        io_choseOH_1
);
  wire  valid = io_addr < 32'h20000; // @[Bus.scala 159:42]
  wire  valid_1 = io_addr >= 32'h20000 & io_addr < 32'h40000; // @[Bus.scala 159:31]
  wire  _GEN_2 = valid_1 ? 1'h0 : 1'h1; // @[Bus.scala 169:68 170:20 172:20]
  assign io_choseOH_0 = valid | _GEN_2; // @[Bus.scala 167:62 168:20]
  assign io_choseOH_1 = valid ? 1'h0 : valid_1; // @[Bus.scala 167:62 168:20]
endmodule
module TLBusMux_1(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [2:0]  io_in_0_bits_opcode,
  input  [31:0] io_in_0_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [31:0] io_out_bits_data,
  input         io_choseOH_0
);
  assign io_in_0_ready = io_out_ready & io_choseOH_0; // @[Bus.scala 90:80]
  assign io_out_valid = io_choseOH_0 & io_in_0_valid; // @[Mux.scala 27:73]
  assign io_out_bits_opcode = io_choseOH_0 ? io_in_0_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  assign io_out_bits_data = io_choseOH_0 ? io_in_0_bits_data : 32'h0; // @[Mux.scala 27:73]
endmodule
module TLXbar(
  input         clock,
  input         reset,
  output        io_masterFace_in_0_ready,
  input         io_masterFace_in_0_valid,
  input  [2:0]  io_masterFace_in_0_bits_opcode,
  input  [31:0] io_masterFace_in_0_bits_address,
  input  [31:0] io_masterFace_in_0_bits_data,
  output        io_masterFace_in_1_ready,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [31:0] io_masterFace_in_1_bits_data,
  output        io_masterFace_out_0_valid,
  output [2:0]  io_masterFace_out_0_bits_opcode,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [2:0]  io_masterFace_out_1_bits_opcode,
  output [31:0] io_masterFace_out_1_bits_data,
  input         io_slaveFace_in_0_ready,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output [3:0]  io_slaveFace_in_0_bits_size,
  output [31:0] io_slaveFace_in_0_bits_address,
  output [31:0] io_slaveFace_in_0_bits_data,
  output        io_slaveFace_out_0_ready,
  input         io_slaveFace_out_0_valid,
  input  [2:0]  io_slaveFace_out_0_bits_opcode,
  input  [31:0] io_slaveFace_out_0_bits_data
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
  wire  reqArb_clock; // @[Bus.scala 191:24]
  wire  reqArb_reset; // @[Bus.scala 191:24]
  wire  reqArb_io_reqs_1; // @[Bus.scala 191:24]
  wire [1:0] reqArb_io_grantOH; // @[Bus.scala 191:24]
  wire  reqMux_io_in_0_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_in_0_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_in_0_bits_opcode; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_0_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_0_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_in_1_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_in_1_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_in_1_bits_opcode; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_1_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_1_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_out_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_out_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_out_bits_opcode; // @[Bus.scala 194:24]
  wire [3:0] reqMux_io_out_bits_size; // @[Bus.scala 194:24]
  wire  reqMux_io_out_bits_source; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_out_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_out_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_choseOH_0; // @[Bus.scala 194:24]
  wire  reqMux_io_choseOH_1; // @[Bus.scala 194:24]
  wire  buf__clock; // @[Bus.scala 200:21]
  wire  buf__reset; // @[Bus.scala 200:21]
  wire  buf__io_enq_ready; // @[Bus.scala 200:21]
  wire  buf__io_enq_valid; // @[Bus.scala 200:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[Bus.scala 200:21]
  wire [3:0] buf__io_enq_bits_size; // @[Bus.scala 200:21]
  wire  buf__io_enq_bits_source; // @[Bus.scala 200:21]
  wire [31:0] buf__io_enq_bits_address; // @[Bus.scala 200:21]
  wire [31:0] buf__io_enq_bits_data; // @[Bus.scala 200:21]
  wire  buf__io_deq_ready; // @[Bus.scala 200:21]
  wire  buf__io_deq_valid; // @[Bus.scala 200:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[Bus.scala 200:21]
  wire [3:0] buf__io_deq_bits_size; // @[Bus.scala 200:21]
  wire  buf__io_deq_bits_source; // @[Bus.scala 200:21]
  wire [31:0] buf__io_deq_bits_address; // @[Bus.scala 200:21]
  wire [31:0] buf__io_deq_bits_data; // @[Bus.scala 200:21]
  wire [31:0] addrDec_io_addr; // @[Bus.scala 221:25]
  wire  addrDec_io_choseOH_0; // @[Bus.scala 221:25]
  wire  addrDec_io_choseOH_1; // @[Bus.scala 221:25]
  wire  slaveMux_io_in_0_ready; // @[Bus.scala 262:26]
  wire  slaveMux_io_in_0_valid; // @[Bus.scala 262:26]
  wire [2:0] slaveMux_io_in_0_bits_opcode; // @[Bus.scala 262:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[Bus.scala 262:26]
  wire  slaveMux_io_out_ready; // @[Bus.scala 262:26]
  wire  slaveMux_io_out_valid; // @[Bus.scala 262:26]
  wire [2:0] slaveMux_io_out_bits_opcode; // @[Bus.scala 262:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[Bus.scala 262:26]
  wire  slaveMux_io_choseOH_0; // @[Bus.scala 262:26]
  wire [1:0] _WIRE_1 = reqArb_io_grantOH; // @[Bus.scala 196:{52,52}]
  reg  s1_full; // @[Bus.scala 207:26]
  wire  s1_latch = buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
  reg [2:0] s1_req_opcode; // @[Reg.scala 19:16]
  reg [3:0] s1_req_size; // @[Reg.scala 19:16]
  reg  s1_req_source; // @[Reg.scala 19:16]
  reg [31:0] s1_req_address; // @[Reg.scala 19:16]
  reg [31:0] s1_req_data; // @[Reg.scala 19:16]
  wire [1:0] s1_beatSize = s1_req_size[3:2]; // @[Bus.scala 213:35]
  reg  s2_full; // @[Bus.scala 250:26]
  reg [2:0] s2_opcode; // @[Reg.scala 19:16]
  wire [1:0] s2_masterRecvVec = {io_masterFace_out_1_valid,io_masterFace_out_0_valid}; // @[Cat.scala 33:92]
  reg [1:0] s2_chosenMasterOH; // @[Reg.scala 19:16]
  wire [1:0] _s2_masterRecv_T = s2_masterRecvVec & s2_chosenMasterOH; // @[Bus.scala 274:43]
  wire  s2_masterRecv = |_s2_masterRecv_T; // @[Bus.scala 274:64]
  reg  s2_masterRecvHold_holdReg; // @[Reg.scala 19:16]
  wire  s2_masterRecvHold = s2_masterRecv ? s2_masterRecv : s2_masterRecvHold_holdReg; // @[util.scala 12:12]
  reg [3:0] s2_beatCounter_value; // @[Counter.scala 61:40]
  reg [1:0] s2_beatSize; // @[Reg.scala 19:16]
  wire [1:0] _s2_lastBeat_T_1 = s2_beatSize - 2'h1; // @[Bus.scala 276:60]
  wire [3:0] _GEN_29 = {{2'd0}, _s2_lastBeat_T_1}; // @[Bus.scala 276:44]
  wire  s2_lastBeat = s2_beatCounter_value == _GEN_29; // @[Bus.scala 276:44]
  wire  _s2_valid_T_4 = s2_opcode == 3'h4 & s2_masterRecvHold & s2_lastBeat; // @[Bus.scala 285:56]
  wire  s2_fire = s2_opcode == 3'h2 & s2_masterRecvHold | _s2_valid_T_4; // @[Bus.scala 284:65]
  wire  s2_ready = ~s2_full | s2_fire; // @[Bus.scala 258:26]
  wire  _s1_slaveRecVec_T = io_slaveFace_in_0_ready & io_slaveFace_in_0_valid; // @[Decoupled.scala 51:35]
  wire [1:0] s1_slaveRecVec = {1'h0,_s1_slaveRecVec_T}; // @[Cat.scala 33:92]
  wire [1:0] _s1_slaveRecv_T = {addrDec_io_choseOH_1,addrDec_io_choseOH_0}; // @[Bus.scala 232:59]
  wire [1:0] _s1_slaveRecv_T_1 = s1_slaveRecVec & _s1_slaveRecv_T; // @[Bus.scala 232:40]
  wire  s1_slaveRecv = |_s1_slaveRecv_T_1; // @[Bus.scala 232:67]
  reg  s1_slaveRecvHold_holdReg; // @[Reg.scala 19:16]
  wire  s1_slaveRecvHold = s1_slaveRecv ? s1_slaveRecv : s1_slaveRecvHold_holdReg; // @[util.scala 12:12]
  reg [3:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire [1:0] _s1_lastBeat_T_1 = s1_beatSize - 2'h1; // @[Bus.scala 234:60]
  wire [3:0] _GEN_30 = {{2'd0}, _s1_lastBeat_T_1}; // @[Bus.scala 234:44]
  wire  s1_lastBeat = s1_beatCounter_value == _GEN_30; // @[Bus.scala 234:44]
  wire  _s1_valid_T_4 = s1_slaveRecvHold & s1_req_opcode == 3'h4; // @[Bus.scala 243:54]
  wire  s1_valid = s1_slaveRecvHold & s1_lastBeat & s1_req_opcode == 3'h2 | _s1_valid_T_4; // @[Bus.scala 242:78]
  wire  s1_fire = s2_ready & s1_valid; // @[Bus.scala 245:25]
  wire  _GEN_8 = s1_full & s1_fire ? 1'h0 : s1_full; // @[Bus.scala 207:26 219:{35,45}]
  wire  _GEN_9 = s1_latch | _GEN_8; // @[Bus.scala 218:{20,30}]
  wire  wrap = s1_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_1 = s1_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  reg  s2_chosenSlaveOH_0; // @[Reg.scala 19:16]
  wire [1:0] _s2_chosenMasterOH_T = 2'h1 << s1_req_source; // @[OneHot.scala 57:35]
  wire  _GEN_20 = s2_full & s2_fire ? 1'h0 : s2_full; // @[Bus.scala 250:26 260:{35,45}]
  wire  _GEN_21 = s1_fire | _GEN_20; // @[Bus.scala 259:{20,30}]
  wire  wrap_1 = s2_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_3 = s2_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  reg  idle; // @[Bus.scala 290:23]
  wire  _GEN_27 = s2_fire | idle; // @[Bus.scala 294:26 295:14 290:23]
  wire  _GEN_28 = s1_latch | s1_fire ? 1'h0 : _GEN_27; // @[Bus.scala 292:32 293:14]
  TLBusArbiter reqArb ( // @[Bus.scala 191:24]
    .clock(reqArb_clock),
    .reset(reqArb_reset),
    .io_reqs_1(reqArb_io_reqs_1),
    .io_grantOH(reqArb_io_grantOH)
  );
  TLBusMux reqMux ( // @[Bus.scala 194:24]
    .io_in_0_ready(reqMux_io_in_0_ready),
    .io_in_0_valid(reqMux_io_in_0_valid),
    .io_in_0_bits_opcode(reqMux_io_in_0_bits_opcode),
    .io_in_0_bits_address(reqMux_io_in_0_bits_address),
    .io_in_0_bits_data(reqMux_io_in_0_bits_data),
    .io_in_1_ready(reqMux_io_in_1_ready),
    .io_in_1_valid(reqMux_io_in_1_valid),
    .io_in_1_bits_opcode(reqMux_io_in_1_bits_opcode),
    .io_in_1_bits_address(reqMux_io_in_1_bits_address),
    .io_in_1_bits_data(reqMux_io_in_1_bits_data),
    .io_out_ready(reqMux_io_out_ready),
    .io_out_valid(reqMux_io_out_valid),
    .io_out_bits_opcode(reqMux_io_out_bits_opcode),
    .io_out_bits_size(reqMux_io_out_bits_size),
    .io_out_bits_source(reqMux_io_out_bits_source),
    .io_out_bits_address(reqMux_io_out_bits_address),
    .io_out_bits_data(reqMux_io_out_bits_data),
    .io_choseOH_0(reqMux_io_choseOH_0),
    .io_choseOH_1(reqMux_io_choseOH_1)
  );
  Queue buf_ ( // @[Bus.scala 200:21]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_enq_ready(buf__io_enq_ready),
    .io_enq_valid(buf__io_enq_valid),
    .io_enq_bits_opcode(buf__io_enq_bits_opcode),
    .io_enq_bits_size(buf__io_enq_bits_size),
    .io_enq_bits_source(buf__io_enq_bits_source),
    .io_enq_bits_address(buf__io_enq_bits_address),
    .io_enq_bits_data(buf__io_enq_bits_data),
    .io_deq_ready(buf__io_deq_ready),
    .io_deq_valid(buf__io_deq_valid),
    .io_deq_bits_opcode(buf__io_deq_bits_opcode),
    .io_deq_bits_size(buf__io_deq_bits_size),
    .io_deq_bits_source(buf__io_deq_bits_source),
    .io_deq_bits_address(buf__io_deq_bits_address),
    .io_deq_bits_data(buf__io_deq_bits_data)
  );
  TLAddrDecode addrDec ( // @[Bus.scala 221:25]
    .io_addr(addrDec_io_addr),
    .io_choseOH_0(addrDec_io_choseOH_0),
    .io_choseOH_1(addrDec_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[Bus.scala 262:26]
    .io_in_0_ready(slaveMux_io_in_0_ready),
    .io_in_0_valid(slaveMux_io_in_0_valid),
    .io_in_0_bits_opcode(slaveMux_io_in_0_bits_opcode),
    .io_in_0_bits_data(slaveMux_io_in_0_bits_data),
    .io_out_ready(slaveMux_io_out_ready),
    .io_out_valid(slaveMux_io_out_valid),
    .io_out_bits_opcode(slaveMux_io_out_bits_opcode),
    .io_out_bits_data(slaveMux_io_out_bits_data),
    .io_choseOH_0(slaveMux_io_choseOH_0)
  );
  assign io_masterFace_in_0_ready = reqMux_io_in_0_ready; // @[Bus.scala 195:58]
  assign io_masterFace_in_1_ready = reqMux_io_in_1_ready; // @[Bus.scala 195:58]
  assign io_masterFace_out_0_valid = slaveMux_io_out_valid & s2_chosenMasterOH[0] & s2_full; // @[Bus.scala 268:67]
  assign io_masterFace_out_0_bits_opcode = slaveMux_io_out_bits_opcode; // @[Bus.scala 267:17]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 267:17]
  assign io_masterFace_out_1_valid = slaveMux_io_out_valid & s2_chosenMasterOH[1] & s2_full; // @[Bus.scala 268:67]
  assign io_masterFace_out_1_bits_opcode = slaveMux_io_out_bits_opcode; // @[Bus.scala 267:17]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 267:17]
  assign io_slaveFace_in_0_valid = addrDec_io_choseOH_0 & s1_full; // @[Bus.scala 227:41]
  assign io_slaveFace_in_0_bits_opcode = s1_req_opcode; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_size = s1_req_size; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_address = s1_req_address; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_data = s1_req_data; // @[Bus.scala 226:18]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[Bus.scala 263:20]
  assign reqArb_clock = clock;
  assign reqArb_reset = reset;
  assign reqArb_io_reqs_1 = io_masterFace_in_1_valid; // @[Bus.scala 192:58]
  assign reqMux_io_in_0_valid = io_masterFace_in_0_valid; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_opcode = io_masterFace_in_0_bits_opcode; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_data = io_masterFace_in_0_bits_data; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_valid = io_masterFace_in_1_valid; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[Bus.scala 195:58]
  assign reqMux_io_out_ready = buf__io_enq_ready; // @[Bus.scala 201:16]
  assign reqMux_io_choseOH_0 = _WIRE_1[0]; // @[Bus.scala 196:52]
  assign reqMux_io_choseOH_1 = _WIRE_1[1]; // @[Bus.scala 196:52]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = reqMux_io_out_valid; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_opcode = reqMux_io_out_bits_opcode; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_size = reqMux_io_out_bits_size; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_source = reqMux_io_out_bits_source; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_address = reqMux_io_out_bits_address; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_data = reqMux_io_out_bits_data; // @[Bus.scala 201:16]
  assign buf__io_deq_ready = ~s1_full | s1_fire; // @[Bus.scala 217:26]
  assign addrDec_io_addr = s1_req_address; // @[Bus.scala 223:21]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[Bus.scala 263:20]
  assign slaveMux_io_in_0_bits_opcode = io_slaveFace_out_0_bits_opcode; // @[Bus.scala 263:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[Bus.scala 263:20]
  assign slaveMux_io_out_ready = s2_chosenMasterOH[0] | s2_chosenMasterOH[1]; // @[Mux.scala 27:73]
  assign slaveMux_io_choseOH_0 = s2_chosenSlaveOH_0; // @[Bus.scala 264:25]
  always @(posedge clock) begin
    if (reset) begin // @[Bus.scala 207:26]
      s1_full <= 1'h0; // @[Bus.scala 207:26]
    end else begin
      s1_full <= _GEN_9;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_opcode <= buf__io_deq_bits_opcode; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_size <= buf__io_deq_bits_size; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_source <= buf__io_deq_bits_source; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_address <= buf__io_deq_bits_address; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_data <= buf__io_deq_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Bus.scala 250:26]
      s2_full <= 1'h0; // @[Bus.scala 250:26]
    end else begin
      s2_full <= _GEN_21;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_opcode <= s1_req_opcode; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenMasterOH <= _s2_chosenMasterOH_T; // @[Reg.scala 20:22]
    end
    if (s2_fire) begin // @[util.scala 11:21]
      s2_masterRecvHold_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (s2_masterRecv) begin // @[util.scala 12:12]
      s2_masterRecvHold_holdReg <= s2_masterRecv;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s1_fire) begin // @[Bus.scala 280:20]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s2_masterRecv & ~s2_lastBeat) begin // @[Bus.scala 277:41]
      if (wrap_1) begin // @[Counter.scala 87:20]
        s2_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s2_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_beatSize <= s1_beatSize; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[util.scala 11:21]
      s1_slaveRecvHold_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (s1_slaveRecv) begin // @[util.scala 12:12]
      s1_slaveRecvHold_holdReg <= s1_slaveRecv;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s1_latch) begin // @[Bus.scala 238:20]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s1_slaveRecv & ~s1_lastBeat) begin // @[Bus.scala 235:40]
      if (wrap) begin // @[Counter.scala 87:20]
        s1_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s1_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenSlaveOH_0 <= addrDec_io_choseOH_0; // @[Reg.scala 20:22]
    end
    idle <= reset | _GEN_28; // @[Bus.scala 290:{23,23}]
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
  s1_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_req_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  s1_req_size = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_source = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_req_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s1_req_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s2_full = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_opcode = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  s2_chosenMasterOH = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  s2_masterRecvHold_holdReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_beatCounter_value = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  s2_beatSize = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  s1_slaveRecvHold_holdReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  s2_chosenSlaveOH_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  idle = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SingleROM(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_opcode,
  input  [3:0]  io_req_bits_size,
  input  [31:0] io_req_bits_address,
  input  [31:0] io_req_bits_data,
  input         io_resp_ready,
  output        io_resp_valid,
  output [2:0]  io_resp_bits_opcode,
  output [31:0] io_resp_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:131071]; // @[SingleROM.scala 24:26]
  wire  mem_rdata_1_en; // @[SingleROM.scala 24:26]
  wire [16:0] mem_rdata_1_addr; // @[SingleROM.scala 24:26]
  wire [31:0] mem_rdata_1_data; // @[SingleROM.scala 24:26]
  wire [31:0] mem_MPORT_data; // @[SingleROM.scala 24:26]
  wire [16:0] mem_MPORT_addr; // @[SingleROM.scala 24:26]
  wire  mem_MPORT_mask; // @[SingleROM.scala 24:26]
  wire  mem_MPORT_en; // @[SingleROM.scala 24:26]
  reg  mem_rdata_1_en_pipe_0;
  reg [16:0] mem_rdata_1_addr_pipe_0;
  wire  _req_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [2:0] req_r_opcode; // @[Reg.scala 19:16]
  reg [3:0] req_r_size; // @[Reg.scala 19:16]
  reg [31:0] req_r_address; // @[Reg.scala 19:16]
  reg [31:0] req_r_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_0 = _req_T ? io_req_bits_opcode : req_r_opcode; // @[Reg.scala 19:16 20:{18,22}]
  wire [3:0] _GEN_2 = _req_T ? io_req_bits_size : req_r_size; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_4 = _req_T ? io_req_bits_address : req_r_address; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] reqBeatSize = _GEN_2[3:2]; // @[SingleROM.scala 15:32]
  reg  busy; // @[SingleROM.scala 16:23]
  wire  _GEN_8 = _req_T | busy; // @[SingleROM.scala 20:23 21:14 16:23]
  wire  _ren_T = _GEN_0 == 3'h4; // @[SingleROM.scala 27:26]
  wire  ren = _GEN_0 == 3'h4 & _GEN_8; // @[SingleROM.scala 27:41]
  wire  _wen_T_1 = _GEN_0 == 3'h2; // @[SingleROM.scala 28:41]
  reg [3:0] beatCounter_value; // @[Counter.scala 61:40]
  wire [3:0] _GEN_24 = {{2'd0}, reqBeatSize}; // @[SingleROM.scala 31:38]
  wire  lastBeat = beatCounter_value == _GEN_24; // @[SingleROM.scala 31:38]
  wire  _T_6 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 51:35]
  wire  wrap = beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_1 = beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _GEN_9 = wrap ? 4'h0 : _value_T_1; // @[Counter.scala 77:15 87:{20,28}]
  wire [5:0] addrOff = {beatCounter_value, 2'h0}; // @[SingleROM.scala 38:37]
  wire [31:0] _GEN_25 = {{26'd0}, addrOff}; // @[SingleROM.scala 39:31]
  wire [31:0] _rdAddr_T_1 = _GEN_4 + _GEN_25; // @[SingleROM.scala 39:31]
  wire [29:0] rdAddr = _rdAddr_T_1[31:2]; // @[SingleROM.scala 39:42]
  reg  rdata_REG; // @[SingleROM.scala 41:61]
  reg [31:0] rdata_r; // @[Reg.scala 19:16]
  assign mem_rdata_1_en = mem_rdata_1_en_pipe_0;
  assign mem_rdata_1_addr = mem_rdata_1_addr_pipe_0;
  assign mem_rdata_1_data = mem[mem_rdata_1_addr]; // @[SingleROM.scala 24:26]
  assign mem_MPORT_data = _req_T ? io_req_bits_data : req_r_data;
  assign mem_MPORT_addr = _GEN_4[16:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _req_T & _wen_T_1;
  assign io_req_ready = ~busy; // @[SingleROM.scala 18:21]
  assign io_resp_valid = busy & (_ren_T | _wen_T_1); // @[SingleROM.scala 46:27]
  assign io_resp_bits_opcode = {{2'd0}, _ren_T}; // @[SingleROM.scala 49:25]
  assign io_resp_bits_data = ren ? mem_rdata_1_data : rdata_r; // @[SingleROM.scala 41:20]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SingleROM.scala 24:26]
    end
    mem_rdata_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_rdata_1_addr_pipe_0 <= rdAddr[16:0];
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_opcode <= io_req_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_size <= io_req_bits_size; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_address <= io_req_bits_address; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_data <= io_req_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[SingleROM.scala 16:23]
      busy <= 1'h0; // @[SingleROM.scala 16:23]
    end else if (_T_6 & (_wen_T_1 | _ren_T & lastBeat)) begin // @[SingleROM.scala 52:104]
      busy <= 1'h0; // @[SingleROM.scala 53:14]
    end else begin
      busy <= _GEN_8;
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (_T_6 & (_wen_T_1 | _ren_T & lastBeat)) begin // @[SingleROM.scala 52:104]
      beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (_req_T & lastBeat & _ren_T) begin // @[SingleROM.scala 32:64]
      beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if ((_req_T | _T_6) & _ren_T) begin // @[SingleROM.scala 34:76]
      beatCounter_value <= _GEN_9;
    end
    rdata_REG <= _GEN_0 == 3'h4 & _GEN_8; // @[SingleROM.scala 27:41]
    if (rdata_REG) begin // @[Reg.scala 20:18]
      rdata_r <= mem_rdata_1_data; // @[Reg.scala 20:22]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 131072; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdata_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdata_1_addr_pipe_0 = _RAND_2[16:0];
  _RAND_3 = {1{`RANDOM}};
  req_r_opcode = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  req_r_size = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  req_r_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  req_r_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  busy = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  beatCounter_value = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  rdata_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  rdata_r = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  output [31:0] io_out_state_instState_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ife_clock; // @[Core.scala 38:21]
  wire  ife_reset; // @[Core.scala 38:21]
  wire  ife_io_in_start; // @[Core.scala 38:21]
  wire  ife_io_in_execute_bits_brTaken; // @[Core.scala 38:21]
  wire [31:0] ife_io_in_execute_bits_targetAddr; // @[Core.scala 38:21]
  wire  ife_io_out_ready; // @[Core.scala 38:21]
  wire  ife_io_out_valid; // @[Core.scala 38:21]
  wire [31:0] ife_io_out_bits_pcNext4; // @[Core.scala 38:21]
  wire  ife_io_out_bits_instState_commit; // @[Core.scala 38:21]
  wire [31:0] ife_io_out_bits_instState_pc; // @[Core.scala 38:21]
  wire [31:0] ife_io_out_bits_instState_inst; // @[Core.scala 38:21]
  wire  ife_io_tlbus_req_ready; // @[Core.scala 38:21]
  wire  ife_io_tlbus_req_valid; // @[Core.scala 38:21]
  wire [2:0] ife_io_tlbus_req_bits_opcode; // @[Core.scala 38:21]
  wire [31:0] ife_io_tlbus_req_bits_address; // @[Core.scala 38:21]
  wire [31:0] ife_io_tlbus_req_bits_data; // @[Core.scala 38:21]
  wire  ife_io_tlbus_resp_valid; // @[Core.scala 38:21]
  wire [2:0] ife_io_tlbus_resp_bits_opcode; // @[Core.scala 38:21]
  wire [31:0] ife_io_tlbus_resp_bits_data; // @[Core.scala 38:21]
  wire [31:0] ife_io_trapVec; // @[Core.scala 38:21]
  wire [31:0] ife_io_mepc; // @[Core.scala 38:21]
  wire  ife_io_excp_valid; // @[Core.scala 38:21]
  wire  ife_io_excp_bits_isMret; // @[Core.scala 38:21]
  wire  dec_clock; // @[Core.scala 46:21]
  wire  dec_reset; // @[Core.scala 46:21]
  wire  dec_io_in_ready; // @[Core.scala 46:21]
  wire  dec_io_in_valid; // @[Core.scala 46:21]
  wire [31:0] dec_io_in_bits_pcNext4; // @[Core.scala 46:21]
  wire  dec_io_in_bits_instState_commit; // @[Core.scala 46:21]
  wire [31:0] dec_io_in_bits_instState_pc; // @[Core.scala 46:21]
  wire [31:0] dec_io_in_bits_instState_inst; // @[Core.scala 46:21]
  wire  dec_io_out_ready; // @[Core.scala 46:21]
  wire  dec_io_out_valid; // @[Core.scala 46:21]
  wire  dec_io_out_bits_isBranch; // @[Core.scala 46:21]
  wire  dec_io_out_bits_isJump; // @[Core.scala 46:21]
  wire [1:0] dec_io_out_bits_resultSrc; // @[Core.scala 46:21]
  wire [4:0] dec_io_out_bits_lsuOp; // @[Core.scala 46:21]
  wire [3:0] dec_io_out_bits_aluOpSel; // @[Core.scala 46:21]
  wire  dec_io_out_bits_immSign; // @[Core.scala 46:21]
  wire  dec_io_out_bits_regWrEn; // @[Core.scala 46:21]
  wire  dec_io_out_bits_pcAddReg; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_pcNext4; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_aluIn1; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_aluIn2; // @[Core.scala 46:21]
  wire  dec_io_out_bits_aluIn1IsReg; // @[Core.scala 46:21]
  wire  dec_io_out_bits_aluIn2IsReg; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_imm; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_data2; // @[Core.scala 46:21]
  wire [3:0] dec_io_out_bits_excType; // @[Core.scala 46:21]
  wire [2:0] dec_io_out_bits_csrOp; // @[Core.scala 46:21]
  wire  dec_io_out_bits_instState_commit; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_instState_pc; // @[Core.scala 46:21]
  wire [31:0] dec_io_out_bits_instState_inst; // @[Core.scala 46:21]
  wire [4:0] dec_io_hazard_out_rs1; // @[Core.scala 46:21]
  wire [4:0] dec_io_hazard_out_rs2; // @[Core.scala 46:21]
  wire  dec_io_hazard_in_stall; // @[Core.scala 46:21]
  wire [4:0] dec_io_regfile_rs1; // @[Core.scala 46:21]
  wire [4:0] dec_io_regfile_rs2; // @[Core.scala 46:21]
  wire [31:0] dec_io_regfile_rdata1; // @[Core.scala 46:21]
  wire [31:0] dec_io_regfile_rdata2; // @[Core.scala 46:21]
  wire  dec_io_ctrl_flush; // @[Core.scala 46:21]
  wire  exe_clock; // @[Core.scala 51:21]
  wire  exe_reset; // @[Core.scala 51:21]
  wire  exe_io_in_ready; // @[Core.scala 51:21]
  wire  exe_io_in_valid; // @[Core.scala 51:21]
  wire  exe_io_in_bits_isBranch; // @[Core.scala 51:21]
  wire  exe_io_in_bits_isJump; // @[Core.scala 51:21]
  wire [1:0] exe_io_in_bits_resultSrc; // @[Core.scala 51:21]
  wire [4:0] exe_io_in_bits_lsuOp; // @[Core.scala 51:21]
  wire [3:0] exe_io_in_bits_aluOpSel; // @[Core.scala 51:21]
  wire  exe_io_in_bits_immSign; // @[Core.scala 51:21]
  wire  exe_io_in_bits_regWrEn; // @[Core.scala 51:21]
  wire  exe_io_in_bits_pcAddReg; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_pcNext4; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_aluIn1; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_aluIn2; // @[Core.scala 51:21]
  wire  exe_io_in_bits_aluIn1IsReg; // @[Core.scala 51:21]
  wire  exe_io_in_bits_aluIn2IsReg; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_imm; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_data2; // @[Core.scala 51:21]
  wire [3:0] exe_io_in_bits_excType; // @[Core.scala 51:21]
  wire [2:0] exe_io_in_bits_csrOp; // @[Core.scala 51:21]
  wire  exe_io_in_bits_instState_commit; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_instState_pc; // @[Core.scala 51:21]
  wire [31:0] exe_io_in_bits_instState_inst; // @[Core.scala 51:21]
  wire  exe_io_out_memory_ready; // @[Core.scala 51:21]
  wire  exe_io_out_memory_valid; // @[Core.scala 51:21]
  wire [1:0] exe_io_out_memory_bits_resultSrc; // @[Core.scala 51:21]
  wire [4:0] exe_io_out_memory_bits_lsuOp; // @[Core.scala 51:21]
  wire  exe_io_out_memory_bits_regWrEn; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_aluOut; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_data2; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_pcNext4; // @[Core.scala 51:21]
  wire [2:0] exe_io_out_memory_bits_csrOp; // @[Core.scala 51:21]
  wire  exe_io_out_memory_bits_csrWrEn; // @[Core.scala 51:21]
  wire  exe_io_out_memory_bits_csrValid; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_csrWrData; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_csrAddr; // @[Core.scala 51:21]
  wire [3:0] exe_io_out_memory_bits_excType; // @[Core.scala 51:21]
  wire  exe_io_out_memory_bits_instState_commit; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_instState_pc; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_memory_bits_instState_inst; // @[Core.scala 51:21]
  wire  exe_io_out_fetch_bits_brTaken; // @[Core.scala 51:21]
  wire [31:0] exe_io_out_fetch_bits_targetAddr; // @[Core.scala 51:21]
  wire [4:0] exe_io_hazard_out_rs1; // @[Core.scala 51:21]
  wire [4:0] exe_io_hazard_out_rs2; // @[Core.scala 51:21]
  wire [1:0] exe_io_hazard_out_resultSrc; // @[Core.scala 51:21]
  wire [4:0] exe_io_hazard_out_rd; // @[Core.scala 51:21]
  wire [1:0] exe_io_hazard_in_aluSrc1; // @[Core.scala 51:21]
  wire [1:0] exe_io_hazard_in_aluSrc2; // @[Core.scala 51:21]
  wire [31:0] exe_io_hazard_in_rdValM; // @[Core.scala 51:21]
  wire [31:0] exe_io_hazard_in_rdValW; // @[Core.scala 51:21]
  wire  exe_io_ctrl_flush; // @[Core.scala 51:21]
  wire [2:0] exe_io_csrRead_op; // @[Core.scala 51:21]
  wire  exe_io_csrRead_valid; // @[Core.scala 51:21]
  wire [11:0] exe_io_csrRead_addr; // @[Core.scala 51:21]
  wire  mem_clock; // @[Core.scala 56:21]
  wire  mem_reset; // @[Core.scala 56:21]
  wire  mem_io_in_ready; // @[Core.scala 56:21]
  wire [1:0] mem_io_in_bits_resultSrc; // @[Core.scala 56:21]
  wire [4:0] mem_io_in_bits_lsuOp; // @[Core.scala 56:21]
  wire  mem_io_in_bits_regWrEn; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_aluOut; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_data2; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_pcNext4; // @[Core.scala 56:21]
  wire [2:0] mem_io_in_bits_csrOp; // @[Core.scala 56:21]
  wire  mem_io_in_bits_csrWrEn; // @[Core.scala 56:21]
  wire  mem_io_in_bits_csrValid; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_csrWrData; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_csrAddr; // @[Core.scala 56:21]
  wire [3:0] mem_io_in_bits_excType; // @[Core.scala 56:21]
  wire  mem_io_in_bits_instState_commit; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_instState_pc; // @[Core.scala 56:21]
  wire [31:0] mem_io_in_bits_instState_inst; // @[Core.scala 56:21]
  wire  mem_io_out_ready; // @[Core.scala 56:21]
  wire  mem_io_out_valid; // @[Core.scala 56:21]
  wire [1:0] mem_io_out_bits_resultSrc; // @[Core.scala 56:21]
  wire  mem_io_out_bits_regWrEn; // @[Core.scala 56:21]
  wire [31:0] mem_io_out_bits_aluOut; // @[Core.scala 56:21]
  wire [31:0] mem_io_out_bits_pcNext4; // @[Core.scala 56:21]
  wire [2:0] mem_io_out_bits_csrOp; // @[Core.scala 56:21]
  wire  mem_io_out_bits_csrWrEn; // @[Core.scala 56:21]
  wire [31:0] mem_io_out_bits_csrWrData; // @[Core.scala 56:21]
  wire [11:0] mem_io_out_bits_csrAddr; // @[Core.scala 56:21]
  wire  mem_io_out_bits_instState_commit; // @[Core.scala 56:21]
  wire [31:0] mem_io_out_bits_instState_pc; // @[Core.scala 56:21]
  wire [31:0] mem_io_out_bits_instState_inst; // @[Core.scala 56:21]
  wire [31:0] mem_io_lsuData; // @[Core.scala 56:21]
  wire  mem_io_lsuOK; // @[Core.scala 56:21]
  wire  mem_io_tlbus_req_ready; // @[Core.scala 56:21]
  wire  mem_io_tlbus_req_valid; // @[Core.scala 56:21]
  wire [2:0] mem_io_tlbus_req_bits_opcode; // @[Core.scala 56:21]
  wire [31:0] mem_io_tlbus_req_bits_address; // @[Core.scala 56:21]
  wire [31:0] mem_io_tlbus_req_bits_data; // @[Core.scala 56:21]
  wire  mem_io_tlbus_resp_valid; // @[Core.scala 56:21]
  wire [2:0] mem_io_tlbus_resp_bits_opcode; // @[Core.scala 56:21]
  wire [31:0] mem_io_tlbus_resp_bits_data; // @[Core.scala 56:21]
  wire [4:0] mem_io_hazard_rd; // @[Core.scala 56:21]
  wire [31:0] mem_io_hazard_rdVal; // @[Core.scala 56:21]
  wire  mem_io_hazard_regWrEn; // @[Core.scala 56:21]
  wire  mem_io_ctrl_flush; // @[Core.scala 56:21]
  wire  mem_io_excp_valid; // @[Core.scala 56:21]
  wire  mem_io_excp_bits_isMret; // @[Core.scala 56:21]
  wire  mem_io_excp_bits_isSret; // @[Core.scala 56:21]
  wire [30:0] mem_io_excp_bits_excCause; // @[Core.scala 56:21]
  wire [31:0] mem_io_excp_bits_excPc; // @[Core.scala 56:21]
  wire  mem_io_csrBusy; // @[Core.scala 56:21]
  wire [1:0] mem_io_csrMode; // @[Core.scala 56:21]
  wire  wb_clock; // @[Core.scala 62:20]
  wire  wb_reset; // @[Core.scala 62:20]
  wire  wb_io_in_ready; // @[Core.scala 62:20]
  wire  wb_io_in_valid; // @[Core.scala 62:20]
  wire [1:0] wb_io_in_bits_resultSrc; // @[Core.scala 62:20]
  wire  wb_io_in_bits_regWrEn; // @[Core.scala 62:20]
  wire [31:0] wb_io_in_bits_aluOut; // @[Core.scala 62:20]
  wire [31:0] wb_io_in_bits_pcNext4; // @[Core.scala 62:20]
  wire [2:0] wb_io_in_bits_csrOp; // @[Core.scala 62:20]
  wire  wb_io_in_bits_csrWrEn; // @[Core.scala 62:20]
  wire [31:0] wb_io_in_bits_csrWrData; // @[Core.scala 62:20]
  wire [11:0] wb_io_in_bits_csrAddr; // @[Core.scala 62:20]
  wire  wb_io_in_bits_instState_commit; // @[Core.scala 62:20]
  wire [31:0] wb_io_in_bits_instState_pc; // @[Core.scala 62:20]
  wire [31:0] wb_io_in_bits_instState_inst; // @[Core.scala 62:20]
  wire  wb_io_instState_commit; // @[Core.scala 62:20]
  wire [31:0] wb_io_instState_pc; // @[Core.scala 62:20]
  wire [31:0] wb_io_instState_inst; // @[Core.scala 62:20]
  wire [4:0] wb_io_hazard_rd; // @[Core.scala 62:20]
  wire [31:0] wb_io_hazard_rdVal; // @[Core.scala 62:20]
  wire  wb_io_hazard_regWrEn; // @[Core.scala 62:20]
  wire [4:0] wb_io_regfile_rd; // @[Core.scala 62:20]
  wire  wb_io_regfile_regWrEn; // @[Core.scala 62:20]
  wire [31:0] wb_io_regfile_regWrData; // @[Core.scala 62:20]
  wire [2:0] wb_io_csrWrite_op; // @[Core.scala 62:20]
  wire [11:0] wb_io_csrWrite_addr; // @[Core.scala 62:20]
  wire [31:0] wb_io_csrWrite_data; // @[Core.scala 62:20]
  wire  wb_io_csrWrite_retired; // @[Core.scala 62:20]
  wire [31:0] wb_io_lsuData; // @[Core.scala 62:20]
  wire  pipelineCtrl_io_in_brTaken; // @[Core.scala 69:30]
  wire  pipelineCtrl_io_in_excpValid; // @[Core.scala 69:30]
  wire  pipelineCtrl_io_out_decode_flush; // @[Core.scala 69:30]
  wire  pipelineCtrl_io_out_execute_flush; // @[Core.scala 69:30]
  wire  pipelineCtrl_io_out_memory_flush; // @[Core.scala 69:30]
  wire [4:0] hazardU_io_in_decode_rs1; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_decode_rs2; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_execute_rs1; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_execute_rs2; // @[Core.scala 79:25]
  wire [1:0] hazardU_io_in_execute_resultSrc; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_execute_rd; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_memory_rd; // @[Core.scala 79:25]
  wire [31:0] hazardU_io_in_memory_rdVal; // @[Core.scala 79:25]
  wire  hazardU_io_in_memory_regWrEn; // @[Core.scala 79:25]
  wire [4:0] hazardU_io_in_writeback_rd; // @[Core.scala 79:25]
  wire [31:0] hazardU_io_in_writeback_rdVal; // @[Core.scala 79:25]
  wire  hazardU_io_in_writeback_regWrEn; // @[Core.scala 79:25]
  wire [1:0] hazardU_io_out_execute_aluSrc1; // @[Core.scala 79:25]
  wire [1:0] hazardU_io_out_execute_aluSrc2; // @[Core.scala 79:25]
  wire [31:0] hazardU_io_out_execute_rdValM; // @[Core.scala 79:25]
  wire [31:0] hazardU_io_out_execute_rdValW; // @[Core.scala 79:25]
  wire  hazardU_io_out_decode_stall; // @[Core.scala 79:25]
  wire  regFile_clock; // @[Core.scala 88:25]
  wire  regFile_reset; // @[Core.scala 88:25]
  wire [4:0] regFile_io_r_0_addr; // @[Core.scala 88:25]
  wire [31:0] regFile_io_r_0_data; // @[Core.scala 88:25]
  wire [4:0] regFile_io_r_1_addr; // @[Core.scala 88:25]
  wire [31:0] regFile_io_r_1_data; // @[Core.scala 88:25]
  wire [4:0] regFile_io_w_0_addr; // @[Core.scala 88:25]
  wire  regFile_io_w_0_en; // @[Core.scala 88:25]
  wire [31:0] regFile_io_w_0_data; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_0; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_1; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_2; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_3; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_4; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_5; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_6; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_7; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_8; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_9; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_10; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_11; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_12; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_13; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_14; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_15; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_16; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_17; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_18; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_19; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_20; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_21; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_22; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_23; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_24; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_25; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_26; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_27; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_28; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_29; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_30; // @[Core.scala 88:25]
  wire [31:0] regFile_io_state_regState_31; // @[Core.scala 88:25]
  wire  csrFile_clock; // @[Core.scala 100:25]
  wire  csrFile_reset; // @[Core.scala 100:25]
  wire [2:0] csrFile_io_read_op; // @[Core.scala 100:25]
  wire  csrFile_io_read_valid; // @[Core.scala 100:25]
  wire [11:0] csrFile_io_read_addr; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_read_data; // @[Core.scala 100:25]
  wire [2:0] csrFile_io_write_op; // @[Core.scala 100:25]
  wire [11:0] csrFile_io_write_addr; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_write_data; // @[Core.scala 100:25]
  wire  csrFile_io_write_retired; // @[Core.scala 100:25]
  wire  csrFile_io_except_valid; // @[Core.scala 100:25]
  wire  csrFile_io_except_bits_isMret; // @[Core.scala 100:25]
  wire  csrFile_io_except_bits_isSret; // @[Core.scala 100:25]
  wire [30:0] csrFile_io_except_bits_excCause; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_except_bits_excPc; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_except_bits_excValue; // @[Core.scala 100:25]
  wire [1:0] csrFile_io_mode; // @[Core.scala 100:25]
  wire  csrFile_io_busy; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_mepc; // @[Core.scala 100:25]
  wire [31:0] csrFile_io_trapVec; // @[Core.scala 100:25]
  wire  xbar_clock; // @[Core.scala 299:22]
  wire  xbar_reset; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_in_0_ready; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_in_0_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_masterFace_in_0_bits_opcode; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_in_0_bits_address; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_in_0_bits_data; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_in_1_ready; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_in_1_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_masterFace_in_1_bits_opcode; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_in_1_bits_address; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_in_1_bits_data; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_out_0_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_masterFace_out_0_bits_opcode; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_out_0_bits_data; // @[Core.scala 299:22]
  wire  xbar_io_masterFace_out_1_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_masterFace_out_1_bits_opcode; // @[Core.scala 299:22]
  wire [31:0] xbar_io_masterFace_out_1_bits_data; // @[Core.scala 299:22]
  wire  xbar_io_slaveFace_in_0_ready; // @[Core.scala 299:22]
  wire  xbar_io_slaveFace_in_0_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_slaveFace_in_0_bits_opcode; // @[Core.scala 299:22]
  wire [3:0] xbar_io_slaveFace_in_0_bits_size; // @[Core.scala 299:22]
  wire [31:0] xbar_io_slaveFace_in_0_bits_address; // @[Core.scala 299:22]
  wire [31:0] xbar_io_slaveFace_in_0_bits_data; // @[Core.scala 299:22]
  wire  xbar_io_slaveFace_out_0_ready; // @[Core.scala 299:22]
  wire  xbar_io_slaveFace_out_0_valid; // @[Core.scala 299:22]
  wire [2:0] xbar_io_slaveFace_out_0_bits_opcode; // @[Core.scala 299:22]
  wire [31:0] xbar_io_slaveFace_out_0_bits_data; // @[Core.scala 299:22]
  wire  rom_clock; // @[Core.scala 300:21]
  wire  rom_reset; // @[Core.scala 300:21]
  wire  rom_io_req_ready; // @[Core.scala 300:21]
  wire  rom_io_req_valid; // @[Core.scala 300:21]
  wire [2:0] rom_io_req_bits_opcode; // @[Core.scala 300:21]
  wire [3:0] rom_io_req_bits_size; // @[Core.scala 300:21]
  wire [31:0] rom_io_req_bits_address; // @[Core.scala 300:21]
  wire [31:0] rom_io_req_bits_data; // @[Core.scala 300:21]
  wire  rom_io_resp_ready; // @[Core.scala 300:21]
  wire  rom_io_resp_valid; // @[Core.scala 300:21]
  wire [2:0] rom_io_resp_bits_opcode; // @[Core.scala 300:21]
  wire [31:0] rom_io_resp_bits_data; // @[Core.scala 300:21]
  reg  ife_io_in_start_REG; // @[Core.scala 39:31]
  reg  io_out_state_instState_REG_commit; // @[Core.scala 112:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core.scala 112:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core.scala 112:38]
  Fetch_1 ife ( // @[Core.scala 38:21]
    .clock(ife_clock),
    .reset(ife_reset),
    .io_in_start(ife_io_in_start),
    .io_in_execute_bits_brTaken(ife_io_in_execute_bits_brTaken),
    .io_in_execute_bits_targetAddr(ife_io_in_execute_bits_targetAddr),
    .io_out_ready(ife_io_out_ready),
    .io_out_valid(ife_io_out_valid),
    .io_out_bits_pcNext4(ife_io_out_bits_pcNext4),
    .io_out_bits_instState_commit(ife_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(ife_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(ife_io_out_bits_instState_inst),
    .io_tlbus_req_ready(ife_io_tlbus_req_ready),
    .io_tlbus_req_valid(ife_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(ife_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(ife_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(ife_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(ife_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(ife_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(ife_io_tlbus_resp_bits_data),
    .io_trapVec(ife_io_trapVec),
    .io_mepc(ife_io_mepc),
    .io_excp_valid(ife_io_excp_valid),
    .io_excp_bits_isMret(ife_io_excp_bits_isMret)
  );
  Decode dec ( // @[Core.scala 46:21]
    .clock(dec_clock),
    .reset(dec_reset),
    .io_in_ready(dec_io_in_ready),
    .io_in_valid(dec_io_in_valid),
    .io_in_bits_pcNext4(dec_io_in_bits_pcNext4),
    .io_in_bits_instState_commit(dec_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(dec_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(dec_io_in_bits_instState_inst),
    .io_out_ready(dec_io_out_ready),
    .io_out_valid(dec_io_out_valid),
    .io_out_bits_isBranch(dec_io_out_bits_isBranch),
    .io_out_bits_isJump(dec_io_out_bits_isJump),
    .io_out_bits_resultSrc(dec_io_out_bits_resultSrc),
    .io_out_bits_lsuOp(dec_io_out_bits_lsuOp),
    .io_out_bits_aluOpSel(dec_io_out_bits_aluOpSel),
    .io_out_bits_immSign(dec_io_out_bits_immSign),
    .io_out_bits_regWrEn(dec_io_out_bits_regWrEn),
    .io_out_bits_pcAddReg(dec_io_out_bits_pcAddReg),
    .io_out_bits_pcNext4(dec_io_out_bits_pcNext4),
    .io_out_bits_aluIn1(dec_io_out_bits_aluIn1),
    .io_out_bits_aluIn2(dec_io_out_bits_aluIn2),
    .io_out_bits_aluIn1IsReg(dec_io_out_bits_aluIn1IsReg),
    .io_out_bits_aluIn2IsReg(dec_io_out_bits_aluIn2IsReg),
    .io_out_bits_imm(dec_io_out_bits_imm),
    .io_out_bits_data2(dec_io_out_bits_data2),
    .io_out_bits_excType(dec_io_out_bits_excType),
    .io_out_bits_csrOp(dec_io_out_bits_csrOp),
    .io_out_bits_instState_commit(dec_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(dec_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(dec_io_out_bits_instState_inst),
    .io_hazard_out_rs1(dec_io_hazard_out_rs1),
    .io_hazard_out_rs2(dec_io_hazard_out_rs2),
    .io_hazard_in_stall(dec_io_hazard_in_stall),
    .io_regfile_rs1(dec_io_regfile_rs1),
    .io_regfile_rs2(dec_io_regfile_rs2),
    .io_regfile_rdata1(dec_io_regfile_rdata1),
    .io_regfile_rdata2(dec_io_regfile_rdata2),
    .io_ctrl_flush(dec_io_ctrl_flush)
  );
  Execute exe ( // @[Core.scala 51:21]
    .clock(exe_clock),
    .reset(exe_reset),
    .io_in_ready(exe_io_in_ready),
    .io_in_valid(exe_io_in_valid),
    .io_in_bits_isBranch(exe_io_in_bits_isBranch),
    .io_in_bits_isJump(exe_io_in_bits_isJump),
    .io_in_bits_resultSrc(exe_io_in_bits_resultSrc),
    .io_in_bits_lsuOp(exe_io_in_bits_lsuOp),
    .io_in_bits_aluOpSel(exe_io_in_bits_aluOpSel),
    .io_in_bits_immSign(exe_io_in_bits_immSign),
    .io_in_bits_regWrEn(exe_io_in_bits_regWrEn),
    .io_in_bits_pcAddReg(exe_io_in_bits_pcAddReg),
    .io_in_bits_pcNext4(exe_io_in_bits_pcNext4),
    .io_in_bits_aluIn1(exe_io_in_bits_aluIn1),
    .io_in_bits_aluIn2(exe_io_in_bits_aluIn2),
    .io_in_bits_aluIn1IsReg(exe_io_in_bits_aluIn1IsReg),
    .io_in_bits_aluIn2IsReg(exe_io_in_bits_aluIn2IsReg),
    .io_in_bits_imm(exe_io_in_bits_imm),
    .io_in_bits_data2(exe_io_in_bits_data2),
    .io_in_bits_excType(exe_io_in_bits_excType),
    .io_in_bits_csrOp(exe_io_in_bits_csrOp),
    .io_in_bits_instState_commit(exe_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(exe_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(exe_io_in_bits_instState_inst),
    .io_out_memory_ready(exe_io_out_memory_ready),
    .io_out_memory_valid(exe_io_out_memory_valid),
    .io_out_memory_bits_resultSrc(exe_io_out_memory_bits_resultSrc),
    .io_out_memory_bits_lsuOp(exe_io_out_memory_bits_lsuOp),
    .io_out_memory_bits_regWrEn(exe_io_out_memory_bits_regWrEn),
    .io_out_memory_bits_aluOut(exe_io_out_memory_bits_aluOut),
    .io_out_memory_bits_data2(exe_io_out_memory_bits_data2),
    .io_out_memory_bits_pcNext4(exe_io_out_memory_bits_pcNext4),
    .io_out_memory_bits_csrOp(exe_io_out_memory_bits_csrOp),
    .io_out_memory_bits_csrWrEn(exe_io_out_memory_bits_csrWrEn),
    .io_out_memory_bits_csrValid(exe_io_out_memory_bits_csrValid),
    .io_out_memory_bits_csrWrData(exe_io_out_memory_bits_csrWrData),
    .io_out_memory_bits_csrAddr(exe_io_out_memory_bits_csrAddr),
    .io_out_memory_bits_excType(exe_io_out_memory_bits_excType),
    .io_out_memory_bits_instState_commit(exe_io_out_memory_bits_instState_commit),
    .io_out_memory_bits_instState_pc(exe_io_out_memory_bits_instState_pc),
    .io_out_memory_bits_instState_inst(exe_io_out_memory_bits_instState_inst),
    .io_out_fetch_bits_brTaken(exe_io_out_fetch_bits_brTaken),
    .io_out_fetch_bits_targetAddr(exe_io_out_fetch_bits_targetAddr),
    .io_hazard_out_rs1(exe_io_hazard_out_rs1),
    .io_hazard_out_rs2(exe_io_hazard_out_rs2),
    .io_hazard_out_resultSrc(exe_io_hazard_out_resultSrc),
    .io_hazard_out_rd(exe_io_hazard_out_rd),
    .io_hazard_in_aluSrc1(exe_io_hazard_in_aluSrc1),
    .io_hazard_in_aluSrc2(exe_io_hazard_in_aluSrc2),
    .io_hazard_in_rdValM(exe_io_hazard_in_rdValM),
    .io_hazard_in_rdValW(exe_io_hazard_in_rdValW),
    .io_ctrl_flush(exe_io_ctrl_flush),
    .io_csrRead_op(exe_io_csrRead_op),
    .io_csrRead_valid(exe_io_csrRead_valid),
    .io_csrRead_addr(exe_io_csrRead_addr)
  );
  Mem mem ( // @[Core.scala 56:21]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_in_ready(mem_io_in_ready),
    .io_in_bits_resultSrc(mem_io_in_bits_resultSrc),
    .io_in_bits_lsuOp(mem_io_in_bits_lsuOp),
    .io_in_bits_regWrEn(mem_io_in_bits_regWrEn),
    .io_in_bits_aluOut(mem_io_in_bits_aluOut),
    .io_in_bits_data2(mem_io_in_bits_data2),
    .io_in_bits_pcNext4(mem_io_in_bits_pcNext4),
    .io_in_bits_csrOp(mem_io_in_bits_csrOp),
    .io_in_bits_csrWrEn(mem_io_in_bits_csrWrEn),
    .io_in_bits_csrValid(mem_io_in_bits_csrValid),
    .io_in_bits_csrWrData(mem_io_in_bits_csrWrData),
    .io_in_bits_csrAddr(mem_io_in_bits_csrAddr),
    .io_in_bits_excType(mem_io_in_bits_excType),
    .io_in_bits_instState_commit(mem_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(mem_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(mem_io_in_bits_instState_inst),
    .io_out_ready(mem_io_out_ready),
    .io_out_valid(mem_io_out_valid),
    .io_out_bits_resultSrc(mem_io_out_bits_resultSrc),
    .io_out_bits_regWrEn(mem_io_out_bits_regWrEn),
    .io_out_bits_aluOut(mem_io_out_bits_aluOut),
    .io_out_bits_pcNext4(mem_io_out_bits_pcNext4),
    .io_out_bits_csrOp(mem_io_out_bits_csrOp),
    .io_out_bits_csrWrEn(mem_io_out_bits_csrWrEn),
    .io_out_bits_csrWrData(mem_io_out_bits_csrWrData),
    .io_out_bits_csrAddr(mem_io_out_bits_csrAddr),
    .io_out_bits_instState_commit(mem_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(mem_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(mem_io_out_bits_instState_inst),
    .io_lsuData(mem_io_lsuData),
    .io_lsuOK(mem_io_lsuOK),
    .io_tlbus_req_ready(mem_io_tlbus_req_ready),
    .io_tlbus_req_valid(mem_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(mem_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(mem_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(mem_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(mem_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(mem_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(mem_io_tlbus_resp_bits_data),
    .io_hazard_rd(mem_io_hazard_rd),
    .io_hazard_rdVal(mem_io_hazard_rdVal),
    .io_hazard_regWrEn(mem_io_hazard_regWrEn),
    .io_ctrl_flush(mem_io_ctrl_flush),
    .io_excp_valid(mem_io_excp_valid),
    .io_excp_bits_isMret(mem_io_excp_bits_isMret),
    .io_excp_bits_isSret(mem_io_excp_bits_isSret),
    .io_excp_bits_excCause(mem_io_excp_bits_excCause),
    .io_excp_bits_excPc(mem_io_excp_bits_excPc),
    .io_csrBusy(mem_io_csrBusy),
    .io_csrMode(mem_io_csrMode)
  );
  WriteBack wb ( // @[Core.scala 62:20]
    .clock(wb_clock),
    .reset(wb_reset),
    .io_in_ready(wb_io_in_ready),
    .io_in_valid(wb_io_in_valid),
    .io_in_bits_resultSrc(wb_io_in_bits_resultSrc),
    .io_in_bits_regWrEn(wb_io_in_bits_regWrEn),
    .io_in_bits_aluOut(wb_io_in_bits_aluOut),
    .io_in_bits_pcNext4(wb_io_in_bits_pcNext4),
    .io_in_bits_csrOp(wb_io_in_bits_csrOp),
    .io_in_bits_csrWrEn(wb_io_in_bits_csrWrEn),
    .io_in_bits_csrWrData(wb_io_in_bits_csrWrData),
    .io_in_bits_csrAddr(wb_io_in_bits_csrAddr),
    .io_in_bits_instState_commit(wb_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(wb_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(wb_io_in_bits_instState_inst),
    .io_instState_commit(wb_io_instState_commit),
    .io_instState_pc(wb_io_instState_pc),
    .io_instState_inst(wb_io_instState_inst),
    .io_hazard_rd(wb_io_hazard_rd),
    .io_hazard_rdVal(wb_io_hazard_rdVal),
    .io_hazard_regWrEn(wb_io_hazard_regWrEn),
    .io_regfile_rd(wb_io_regfile_rd),
    .io_regfile_regWrEn(wb_io_regfile_regWrEn),
    .io_regfile_regWrData(wb_io_regfile_regWrData),
    .io_csrWrite_op(wb_io_csrWrite_op),
    .io_csrWrite_addr(wb_io_csrWrite_addr),
    .io_csrWrite_data(wb_io_csrWrite_data),
    .io_csrWrite_retired(wb_io_csrWrite_retired),
    .io_lsuData(wb_io_lsuData)
  );
  PipelineCtrl pipelineCtrl ( // @[Core.scala 69:30]
    .io_in_brTaken(pipelineCtrl_io_in_brTaken),
    .io_in_excpValid(pipelineCtrl_io_in_excpValid),
    .io_out_decode_flush(pipelineCtrl_io_out_decode_flush),
    .io_out_execute_flush(pipelineCtrl_io_out_execute_flush),
    .io_out_memory_flush(pipelineCtrl_io_out_memory_flush)
  );
  HazardUnit hazardU ( // @[Core.scala 79:25]
    .io_in_decode_rs1(hazardU_io_in_decode_rs1),
    .io_in_decode_rs2(hazardU_io_in_decode_rs2),
    .io_in_execute_rs1(hazardU_io_in_execute_rs1),
    .io_in_execute_rs2(hazardU_io_in_execute_rs2),
    .io_in_execute_resultSrc(hazardU_io_in_execute_resultSrc),
    .io_in_execute_rd(hazardU_io_in_execute_rd),
    .io_in_memory_rd(hazardU_io_in_memory_rd),
    .io_in_memory_rdVal(hazardU_io_in_memory_rdVal),
    .io_in_memory_regWrEn(hazardU_io_in_memory_regWrEn),
    .io_in_writeback_rd(hazardU_io_in_writeback_rd),
    .io_in_writeback_rdVal(hazardU_io_in_writeback_rdVal),
    .io_in_writeback_regWrEn(hazardU_io_in_writeback_regWrEn),
    .io_out_execute_aluSrc1(hazardU_io_out_execute_aluSrc1),
    .io_out_execute_aluSrc2(hazardU_io_out_execute_aluSrc2),
    .io_out_execute_rdValM(hazardU_io_out_execute_rdValM),
    .io_out_execute_rdValW(hazardU_io_out_execute_rdValW),
    .io_out_decode_stall(hazardU_io_out_decode_stall)
  );
  RegFile regFile ( // @[Core.scala 88:25]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_r_0_addr(regFile_io_r_0_addr),
    .io_r_0_data(regFile_io_r_0_data),
    .io_r_1_addr(regFile_io_r_1_addr),
    .io_r_1_data(regFile_io_r_1_data),
    .io_w_0_addr(regFile_io_w_0_addr),
    .io_w_0_en(regFile_io_w_0_en),
    .io_w_0_data(regFile_io_w_0_data),
    .io_state_regState_0(regFile_io_state_regState_0),
    .io_state_regState_1(regFile_io_state_regState_1),
    .io_state_regState_2(regFile_io_state_regState_2),
    .io_state_regState_3(regFile_io_state_regState_3),
    .io_state_regState_4(regFile_io_state_regState_4),
    .io_state_regState_5(regFile_io_state_regState_5),
    .io_state_regState_6(regFile_io_state_regState_6),
    .io_state_regState_7(regFile_io_state_regState_7),
    .io_state_regState_8(regFile_io_state_regState_8),
    .io_state_regState_9(regFile_io_state_regState_9),
    .io_state_regState_10(regFile_io_state_regState_10),
    .io_state_regState_11(regFile_io_state_regState_11),
    .io_state_regState_12(regFile_io_state_regState_12),
    .io_state_regState_13(regFile_io_state_regState_13),
    .io_state_regState_14(regFile_io_state_regState_14),
    .io_state_regState_15(regFile_io_state_regState_15),
    .io_state_regState_16(regFile_io_state_regState_16),
    .io_state_regState_17(regFile_io_state_regState_17),
    .io_state_regState_18(regFile_io_state_regState_18),
    .io_state_regState_19(regFile_io_state_regState_19),
    .io_state_regState_20(regFile_io_state_regState_20),
    .io_state_regState_21(regFile_io_state_regState_21),
    .io_state_regState_22(regFile_io_state_regState_22),
    .io_state_regState_23(regFile_io_state_regState_23),
    .io_state_regState_24(regFile_io_state_regState_24),
    .io_state_regState_25(regFile_io_state_regState_25),
    .io_state_regState_26(regFile_io_state_regState_26),
    .io_state_regState_27(regFile_io_state_regState_27),
    .io_state_regState_28(regFile_io_state_regState_28),
    .io_state_regState_29(regFile_io_state_regState_29),
    .io_state_regState_30(regFile_io_state_regState_30),
    .io_state_regState_31(regFile_io_state_regState_31)
  );
  CsrFile csrFile ( // @[Core.scala 100:25]
    .clock(csrFile_clock),
    .reset(csrFile_reset),
    .io_read_op(csrFile_io_read_op),
    .io_read_valid(csrFile_io_read_valid),
    .io_read_addr(csrFile_io_read_addr),
    .io_read_data(csrFile_io_read_data),
    .io_write_op(csrFile_io_write_op),
    .io_write_addr(csrFile_io_write_addr),
    .io_write_data(csrFile_io_write_data),
    .io_write_retired(csrFile_io_write_retired),
    .io_except_valid(csrFile_io_except_valid),
    .io_except_bits_isMret(csrFile_io_except_bits_isMret),
    .io_except_bits_isSret(csrFile_io_except_bits_isSret),
    .io_except_bits_excCause(csrFile_io_except_bits_excCause),
    .io_except_bits_excPc(csrFile_io_except_bits_excPc),
    .io_except_bits_excValue(csrFile_io_except_bits_excValue),
    .io_mode(csrFile_io_mode),
    .io_busy(csrFile_io_busy),
    .io_mepc(csrFile_io_mepc),
    .io_trapVec(csrFile_io_trapVec)
  );
  TLXbar xbar ( // @[Core.scala 299:22]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_masterFace_in_0_ready(xbar_io_masterFace_in_0_ready),
    .io_masterFace_in_0_valid(xbar_io_masterFace_in_0_valid),
    .io_masterFace_in_0_bits_opcode(xbar_io_masterFace_in_0_bits_opcode),
    .io_masterFace_in_0_bits_address(xbar_io_masterFace_in_0_bits_address),
    .io_masterFace_in_0_bits_data(xbar_io_masterFace_in_0_bits_data),
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
  SingleROM rom ( // @[Core.scala 300:21]
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
    .io_resp_bits_data(rom_io_resp_bits_data)
  );
  assign io_out_state_intRegState_regState_0 = regFile_io_state_regState_0; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_1 = regFile_io_state_regState_1; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_2 = regFile_io_state_regState_2; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_3 = regFile_io_state_regState_3; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_4 = regFile_io_state_regState_4; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_5 = regFile_io_state_regState_5; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_6 = regFile_io_state_regState_6; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_7 = regFile_io_state_regState_7; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_8 = regFile_io_state_regState_8; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_9 = regFile_io_state_regState_9; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_10 = regFile_io_state_regState_10; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_11 = regFile_io_state_regState_11; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_12 = regFile_io_state_regState_12; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_13 = regFile_io_state_regState_13; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_14 = regFile_io_state_regState_14; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_15 = regFile_io_state_regState_15; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_16 = regFile_io_state_regState_16; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_17 = regFile_io_state_regState_17; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_18 = regFile_io_state_regState_18; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_19 = regFile_io_state_regState_19; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_20 = regFile_io_state_regState_20; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_21 = regFile_io_state_regState_21; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_22 = regFile_io_state_regState_22; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_23 = regFile_io_state_regState_23; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_24 = regFile_io_state_regState_24; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_25 = regFile_io_state_regState_25; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_26 = regFile_io_state_regState_26; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_27 = regFile_io_state_regState_27; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_28 = regFile_io_state_regState_28; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_29 = regFile_io_state_regState_29; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_30 = regFile_io_state_regState_30; // @[Core.scala 113:30]
  assign io_out_state_intRegState_regState_31 = regFile_io_state_regState_31; // @[Core.scala 113:30]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core.scala 112:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core.scala 112:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core.scala 112:28]
  assign ife_clock = clock;
  assign ife_reset = reset;
  assign ife_io_in_start = ife_io_in_start_REG; // @[Core.scala 39:21]
  assign ife_io_in_execute_bits_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 53:23]
  assign ife_io_in_execute_bits_targetAddr = exe_io_out_fetch_bits_targetAddr; // @[Core.scala 53:23]
  assign ife_io_out_ready = dec_io_in_ready; // @[Core.scala 47:15]
  assign ife_io_tlbus_req_ready = xbar_io_masterFace_in_0_ready; // @[Core.scala 305:22]
  assign ife_io_tlbus_resp_valid = xbar_io_masterFace_out_0_valid; // @[Core.scala 306:23]
  assign ife_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_0_bits_opcode; // @[Core.scala 306:23]
  assign ife_io_tlbus_resp_bits_data = xbar_io_masterFace_out_0_bits_data; // @[Core.scala 306:23]
  assign ife_io_trapVec = csrFile_io_trapVec; // @[Core.scala 107:13 33:23]
  assign ife_io_mepc = csrFile_io_mepc; // @[Core.scala 108:10 34:20]
  assign ife_io_excp_valid = mem_io_excp_valid; // @[Core.scala 59:17]
  assign ife_io_excp_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 59:17]
  assign dec_clock = clock;
  assign dec_reset = reset;
  assign dec_io_in_valid = ife_io_out_valid; // @[Core.scala 47:15]
  assign dec_io_in_bits_pcNext4 = ife_io_out_bits_pcNext4; // @[Core.scala 47:15]
  assign dec_io_in_bits_instState_commit = ife_io_out_bits_instState_commit; // @[Core.scala 47:15]
  assign dec_io_in_bits_instState_pc = ife_io_out_bits_instState_pc; // @[Core.scala 47:15]
  assign dec_io_in_bits_instState_inst = ife_io_out_bits_instState_inst; // @[Core.scala 47:15]
  assign dec_io_out_ready = exe_io_in_ready; // @[Core.scala 52:15]
  assign dec_io_hazard_in_stall = hazardU_io_out_decode_stall; // @[Core.scala 31:24 85:14]
  assign dec_io_regfile_rdata1 = regFile_io_r_0_data; // @[Core.scala 93:27]
  assign dec_io_regfile_rdata2 = regFile_io_r_1_data; // @[Core.scala 94:27]
  assign dec_io_ctrl_flush = pipelineCtrl_io_out_decode_flush; // @[Core.scala 73:17]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_in_valid = dec_io_out_valid; // @[Core.scala 52:15]
  assign exe_io_in_bits_isBranch = dec_io_out_bits_isBranch; // @[Core.scala 52:15]
  assign exe_io_in_bits_isJump = dec_io_out_bits_isJump; // @[Core.scala 52:15]
  assign exe_io_in_bits_resultSrc = dec_io_out_bits_resultSrc; // @[Core.scala 52:15]
  assign exe_io_in_bits_lsuOp = dec_io_out_bits_lsuOp; // @[Core.scala 52:15]
  assign exe_io_in_bits_aluOpSel = dec_io_out_bits_aluOpSel; // @[Core.scala 52:15]
  assign exe_io_in_bits_immSign = dec_io_out_bits_immSign; // @[Core.scala 52:15]
  assign exe_io_in_bits_regWrEn = dec_io_out_bits_regWrEn; // @[Core.scala 52:15]
  assign exe_io_in_bits_pcAddReg = dec_io_out_bits_pcAddReg; // @[Core.scala 52:15]
  assign exe_io_in_bits_pcNext4 = dec_io_out_bits_pcNext4; // @[Core.scala 52:15]
  assign exe_io_in_bits_aluIn1 = dec_io_out_bits_aluIn1; // @[Core.scala 52:15]
  assign exe_io_in_bits_aluIn2 = dec_io_out_bits_aluIn2; // @[Core.scala 52:15]
  assign exe_io_in_bits_aluIn1IsReg = dec_io_out_bits_aluIn1IsReg; // @[Core.scala 52:15]
  assign exe_io_in_bits_aluIn2IsReg = dec_io_out_bits_aluIn2IsReg; // @[Core.scala 52:15]
  assign exe_io_in_bits_imm = dec_io_out_bits_imm; // @[Core.scala 52:15]
  assign exe_io_in_bits_data2 = dec_io_out_bits_data2; // @[Core.scala 52:15]
  assign exe_io_in_bits_excType = dec_io_out_bits_excType; // @[Core.scala 52:15]
  assign exe_io_in_bits_csrOp = dec_io_out_bits_csrOp; // @[Core.scala 52:15]
  assign exe_io_in_bits_instState_commit = dec_io_out_bits_instState_commit; // @[Core.scala 52:15]
  assign exe_io_in_bits_instState_pc = dec_io_out_bits_instState_pc; // @[Core.scala 52:15]
  assign exe_io_in_bits_instState_inst = dec_io_out_bits_instState_inst; // @[Core.scala 52:15]
  assign exe_io_out_memory_ready = mem_io_in_ready; // @[Core.scala 57:15]
  assign exe_io_hazard_in_aluSrc1 = hazardU_io_out_execute_aluSrc1; // @[Core.scala 84:29]
  assign exe_io_hazard_in_aluSrc2 = hazardU_io_out_execute_aluSrc2; // @[Core.scala 84:29]
  assign exe_io_hazard_in_rdValM = hazardU_io_out_execute_rdValM; // @[Core.scala 84:29]
  assign exe_io_hazard_in_rdValW = hazardU_io_out_execute_rdValW; // @[Core.scala 84:29]
  assign exe_io_ctrl_flush = pipelineCtrl_io_out_execute_flush; // @[Core.scala 74:17]
  assign exe_io_csrRead_valid = csrFile_io_read_valid; // @[Core.scala 103:21]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_in_bits_resultSrc = exe_io_out_memory_bits_resultSrc; // @[Core.scala 57:15]
  assign mem_io_in_bits_lsuOp = exe_io_out_memory_bits_lsuOp; // @[Core.scala 57:15]
  assign mem_io_in_bits_regWrEn = exe_io_out_memory_bits_regWrEn; // @[Core.scala 57:15]
  assign mem_io_in_bits_aluOut = exe_io_out_memory_bits_aluOut; // @[Core.scala 57:15]
  assign mem_io_in_bits_data2 = exe_io_out_memory_bits_data2; // @[Core.scala 57:15]
  assign mem_io_in_bits_pcNext4 = exe_io_out_memory_bits_pcNext4; // @[Core.scala 57:15]
  assign mem_io_in_bits_csrOp = exe_io_out_memory_bits_csrOp; // @[Core.scala 57:15]
  assign mem_io_in_bits_csrWrEn = exe_io_out_memory_bits_csrWrEn; // @[Core.scala 57:15]
  assign mem_io_in_bits_csrValid = exe_io_out_memory_bits_csrValid; // @[Core.scala 57:15]
  assign mem_io_in_bits_csrWrData = exe_io_out_memory_bits_csrWrData; // @[Core.scala 57:15]
  assign mem_io_in_bits_csrAddr = exe_io_out_memory_bits_csrAddr; // @[Core.scala 57:15]
  assign mem_io_in_bits_excType = exe_io_out_memory_bits_excType; // @[Core.scala 57:15]
  assign mem_io_in_bits_instState_commit = exe_io_out_memory_bits_instState_commit; // @[Core.scala 57:15]
  assign mem_io_in_bits_instState_pc = exe_io_out_memory_bits_instState_pc; // @[Core.scala 57:15]
  assign mem_io_in_bits_instState_inst = exe_io_out_memory_bits_instState_inst; // @[Core.scala 57:15]
  assign mem_io_out_ready = wb_io_in_ready; // @[Core.scala 63:14]
  assign mem_io_tlbus_req_ready = xbar_io_masterFace_in_1_ready; // @[Core.scala 308:22]
  assign mem_io_tlbus_resp_valid = xbar_io_masterFace_out_1_valid; // @[Core.scala 309:23]
  assign mem_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_1_bits_opcode; // @[Core.scala 309:23]
  assign mem_io_tlbus_resp_bits_data = xbar_io_masterFace_out_1_bits_data; // @[Core.scala 309:23]
  assign mem_io_ctrl_flush = pipelineCtrl_io_out_memory_flush; // @[Core.scala 75:17]
  assign mem_io_csrBusy = csrFile_io_busy; // @[Core.scala 105:20]
  assign mem_io_csrMode = csrFile_io_mode; // @[Core.scala 106:20]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_in_valid = mem_io_out_valid; // @[Core.scala 63:14]
  assign wb_io_in_bits_resultSrc = mem_io_out_bits_resultSrc; // @[Core.scala 63:14]
  assign wb_io_in_bits_regWrEn = mem_io_out_bits_regWrEn; // @[Core.scala 63:14]
  assign wb_io_in_bits_aluOut = mem_io_out_bits_aluOut; // @[Core.scala 63:14]
  assign wb_io_in_bits_pcNext4 = mem_io_out_bits_pcNext4; // @[Core.scala 63:14]
  assign wb_io_in_bits_csrOp = mem_io_out_bits_csrOp; // @[Core.scala 63:14]
  assign wb_io_in_bits_csrWrEn = mem_io_out_bits_csrWrEn; // @[Core.scala 63:14]
  assign wb_io_in_bits_csrWrData = mem_io_out_bits_csrWrData; // @[Core.scala 63:14]
  assign wb_io_in_bits_csrAddr = mem_io_out_bits_csrAddr; // @[Core.scala 63:14]
  assign wb_io_in_bits_instState_commit = mem_io_out_bits_instState_commit; // @[Core.scala 63:14]
  assign wb_io_in_bits_instState_pc = mem_io_out_bits_instState_pc; // @[Core.scala 63:14]
  assign wb_io_in_bits_instState_inst = mem_io_out_bits_instState_inst; // @[Core.scala 63:14]
  assign wb_io_lsuData = mem_io_lsuData; // @[Core.scala 64:19]
  assign pipelineCtrl_io_in_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 71:34]
  assign pipelineCtrl_io_in_excpValid = mem_io_excp_valid; // @[Core.scala 70:34]
  assign hazardU_io_in_decode_rs1 = dec_io_hazard_out_rs1; // @[Core.scala 80:29]
  assign hazardU_io_in_decode_rs2 = dec_io_hazard_out_rs2; // @[Core.scala 80:29]
  assign hazardU_io_in_execute_rs1 = exe_io_hazard_out_rs1; // @[Core.scala 81:29]
  assign hazardU_io_in_execute_rs2 = exe_io_hazard_out_rs2; // @[Core.scala 81:29]
  assign hazardU_io_in_execute_resultSrc = exe_io_hazard_out_resultSrc; // @[Core.scala 81:29]
  assign hazardU_io_in_execute_rd = exe_io_hazard_out_rd; // @[Core.scala 81:29]
  assign hazardU_io_in_memory_rd = mem_io_hazard_rd; // @[Core.scala 82:29]
  assign hazardU_io_in_memory_rdVal = mem_io_hazard_rdVal; // @[Core.scala 82:29]
  assign hazardU_io_in_memory_regWrEn = mem_io_hazard_regWrEn; // @[Core.scala 82:29]
  assign hazardU_io_in_writeback_rd = wb_io_hazard_rd; // @[Core.scala 83:29]
  assign hazardU_io_in_writeback_rdVal = wb_io_hazard_rdVal; // @[Core.scala 83:29]
  assign hazardU_io_in_writeback_regWrEn = wb_io_hazard_regWrEn; // @[Core.scala 83:29]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = dec_io_regfile_rs1; // @[Core.scala 91:26]
  assign regFile_io_r_1_addr = dec_io_regfile_rs2; // @[Core.scala 92:26]
  assign regFile_io_w_0_addr = wb_io_regfile_rd; // @[Core.scala 96:26]
  assign regFile_io_w_0_en = wb_io_regfile_regWrEn; // @[Core.scala 95:24]
  assign regFile_io_w_0_data = wb_io_regfile_regWrData; // @[Core.scala 97:26]
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = exe_io_csrRead_op; // @[Core.scala 103:21]
  assign csrFile_io_read_addr = exe_io_csrRead_addr; // @[Core.scala 103:21]
  assign csrFile_io_write_op = wb_io_csrWrite_op; // @[Core.scala 104:22]
  assign csrFile_io_write_addr = wb_io_csrWrite_addr; // @[Core.scala 104:22]
  assign csrFile_io_write_data = wb_io_csrWrite_data; // @[Core.scala 104:22]
  assign csrFile_io_write_retired = wb_io_csrWrite_retired; // @[Core.scala 104:22]
  assign csrFile_io_except_valid = mem_io_excp_valid; // @[Core.scala 102:23]
  assign csrFile_io_except_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 102:23]
  assign csrFile_io_except_bits_isSret = mem_io_excp_bits_isSret; // @[Core.scala 102:23]
  assign csrFile_io_except_bits_excCause = mem_io_excp_bits_excCause; // @[Core.scala 102:23]
  assign csrFile_io_except_bits_excPc = mem_io_excp_bits_excPc; // @[Core.scala 102:23]
  assign csrFile_io_except_bits_excValue = 32'h0; // @[Core.scala 102:23]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masterFace_in_0_valid = ife_io_tlbus_req_valid; // @[Core.scala 305:22]
  assign xbar_io_masterFace_in_0_bits_opcode = ife_io_tlbus_req_bits_opcode; // @[Core.scala 305:22]
  assign xbar_io_masterFace_in_0_bits_address = ife_io_tlbus_req_bits_address; // @[Core.scala 305:22]
  assign xbar_io_masterFace_in_0_bits_data = ife_io_tlbus_req_bits_data; // @[Core.scala 305:22]
  assign xbar_io_masterFace_in_1_valid = mem_io_tlbus_req_valid; // @[Core.scala 308:22]
  assign xbar_io_masterFace_in_1_bits_opcode = mem_io_tlbus_req_bits_opcode; // @[Core.scala 308:22]
  assign xbar_io_masterFace_in_1_bits_address = mem_io_tlbus_req_bits_address; // @[Core.scala 308:22]
  assign xbar_io_masterFace_in_1_bits_data = mem_io_tlbus_req_bits_data; // @[Core.scala 308:22]
  assign xbar_io_slaveFace_in_0_ready = rom_io_req_ready; // @[Core.scala 313:16]
  assign xbar_io_slaveFace_out_0_valid = rom_io_resp_valid; // @[Core.scala 314:17]
  assign xbar_io_slaveFace_out_0_bits_opcode = rom_io_resp_bits_opcode; // @[Core.scala 314:17]
  assign xbar_io_slaveFace_out_0_bits_data = rom_io_resp_bits_data; // @[Core.scala 314:17]
  assign rom_clock = clock;
  assign rom_reset = reset;
  assign rom_io_req_valid = xbar_io_slaveFace_in_0_valid; // @[Core.scala 313:16]
  assign rom_io_req_bits_opcode = xbar_io_slaveFace_in_0_bits_opcode; // @[Core.scala 313:16]
  assign rom_io_req_bits_size = xbar_io_slaveFace_in_0_bits_size; // @[Core.scala 313:16]
  assign rom_io_req_bits_address = xbar_io_slaveFace_in_0_bits_address; // @[Core.scala 313:16]
  assign rom_io_req_bits_data = xbar_io_slaveFace_in_0_bits_data; // @[Core.scala 313:16]
  assign rom_io_resp_ready = xbar_io_slaveFace_out_0_ready; // @[Core.scala 314:17]
  always @(posedge clock) begin
    ife_io_in_start_REG <= io_in_start; // @[Core.scala 39:31]
    io_out_state_instState_REG_commit <= wb_io_instState_commit; // @[Core.scala 112:38]
    io_out_state_instState_REG_pc <= wb_io_instState_pc; // @[Core.scala 112:38]
    io_out_state_instState_REG_inst <= wb_io_instState_inst; // @[Core.scala 112:38]
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
  ife_io_in_start_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_out_state_instState_REG_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_out_state_instState_REG_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_state_instState_REG_inst = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
