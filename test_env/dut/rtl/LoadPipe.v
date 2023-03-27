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
