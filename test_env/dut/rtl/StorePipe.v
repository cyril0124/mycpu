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
