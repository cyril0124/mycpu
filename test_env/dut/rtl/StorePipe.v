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
  input  [7:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  input  [19:0]  io_dir_read_resp_bits_dirtyTag,
  input          io_dir_write_req_ready,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [7:0]   io_dir_write_req_bits_way,
  output [1:0]   io_dir_write_req_bits_meta,
  output         io_dataBank_read_req_valid,
  output [7:0]   io_dataBank_read_req_bits_set,
  output [3:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [255:0] io_dataBank_read_resp_bits_blockData_0,
  input  [255:0] io_dataBank_read_resp_bits_blockData_1,
  input  [255:0] io_dataBank_read_resp_bits_blockData_2,
  input  [255:0] io_dataBank_read_resp_bits_blockData_3,
  input          io_dataBank_write_req_ready,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [7:0]   io_dataBank_write_req_bits_set,
  output [3:0]   io_dataBank_write_req_bits_blockSelOH,
  output [7:0]   io_dataBank_write_req_bits_way,
  output [3:0]   io_dataBank_write_req_bits_mask,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [2:0]   io_tlbus_req_bits_opcode,
  output [31:0]  io_tlbus_req_bits_size,
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
  wire  tlbusReqArb_io_in_0_ready; // @[StorePipe.scala 252:29]
  wire  tlbusReqArb_io_in_0_valid; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_size; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[StorePipe.scala 252:29]
  wire  tlbusReqArb_io_in_1_ready; // @[StorePipe.scala 252:29]
  wire  tlbusReqArb_io_in_1_valid; // @[StorePipe.scala 252:29]
  wire [2:0] tlbusReqArb_io_in_1_bits_opcode; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_size; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_data; // @[StorePipe.scala 252:29]
  wire  tlbusReqArb_io_out_ready; // @[StorePipe.scala 252:29]
  wire  tlbusReqArb_io_out_valid; // @[StorePipe.scala 252:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_out_bits_size; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[StorePipe.scala 252:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[StorePipe.scala 252:29]
  wire  storeRespArb_io_in_0_valid; // @[StorePipe.scala 257:30]
  wire  storeRespArb_io_in_1_ready; // @[StorePipe.scala 257:30]
  wire  storeRespArb_io_in_1_valid; // @[StorePipe.scala 257:30]
  wire  storeRespArb_io_out_valid; // @[StorePipe.scala 257:30]
  wire  dataBankWrReqArb_io_in_0_ready; // @[StorePipe.scala 262:34]
  wire  dataBankWrReqArb_io_in_0_valid; // @[StorePipe.scala 262:34]
  wire [31:0] dataBankWrReqArb_io_in_0_bits_data; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_in_0_bits_set; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_in_0_bits_blockSelOH; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_in_0_bits_way; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_in_0_bits_mask; // @[StorePipe.scala 262:34]
  wire  dataBankWrReqArb_io_in_1_valid; // @[StorePipe.scala 262:34]
  wire [31:0] dataBankWrReqArb_io_in_1_bits_data; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_in_1_bits_set; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_in_1_bits_blockSelOH; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_in_1_bits_way; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_in_1_bits_mask; // @[StorePipe.scala 262:34]
  wire  dataBankWrReqArb_io_out_ready; // @[StorePipe.scala 262:34]
  wire  dataBankWrReqArb_io_out_valid; // @[StorePipe.scala 262:34]
  wire [31:0] dataBankWrReqArb_io_out_bits_data; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_out_bits_set; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_out_bits_blockSelOH; // @[StorePipe.scala 262:34]
  wire [7:0] dataBankWrReqArb_io_out_bits_way; // @[StorePipe.scala 262:34]
  wire [3:0] dataBankWrReqArb_io_out_bits_mask; // @[StorePipe.scala 262:34]
  wire  dirWrReqArb_io_in_0_ready; // @[StorePipe.scala 267:29]
  wire  dirWrReqArb_io_in_0_valid; // @[StorePipe.scala 267:29]
  wire [31:0] dirWrReqArb_io_in_0_bits_addr; // @[StorePipe.scala 267:29]
  wire [7:0] dirWrReqArb_io_in_0_bits_way; // @[StorePipe.scala 267:29]
  wire [1:0] dirWrReqArb_io_in_0_bits_meta; // @[StorePipe.scala 267:29]
  wire  dirWrReqArb_io_in_1_valid; // @[StorePipe.scala 267:29]
  wire [31:0] dirWrReqArb_io_in_1_bits_addr; // @[StorePipe.scala 267:29]
  wire [7:0] dirWrReqArb_io_in_1_bits_way; // @[StorePipe.scala 267:29]
  wire [1:0] dirWrReqArb_io_in_1_bits_meta; // @[StorePipe.scala 267:29]
  wire  dirWrReqArb_io_out_ready; // @[StorePipe.scala 267:29]
  wire  dirWrReqArb_io_out_valid; // @[StorePipe.scala 267:29]
  wire [31:0] dirWrReqArb_io_out_bits_addr; // @[StorePipe.scala 267:29]
  wire [7:0] dirWrReqArb_io_out_bits_way; // @[StorePipe.scala 267:29]
  wire [1:0] dirWrReqArb_io_out_bits_meta; // @[StorePipe.scala 267:29]
  reg  s0_full; // @[StorePipe.scala 34:26]
  wire  s0_latch = io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
  wire  _storeMissClean_T = ~io_dir_read_resp_bits_hit; // @[StorePipe.scala 63:26]
  wire  storeMissClean = ~io_dir_read_resp_bits_hit & ~io_dir_read_resp_bits_isDirtyWay; // @[StorePipe.scala 63:36]
  wire  s0_tlbusReq_ready = tlbusReqArb_io_in_1_ready; // @[StorePipe.scala 254:26 75:27]
  reg  s0_putAllBeat; // @[Reg.scala 35:20]
  wire  storeMissDirty = _storeMissClean_T & io_dir_read_resp_bits_isDirtyWay; // @[StorePipe.scala 64:36]
  wire  s0_tlbusReq_valid = s0_full & (storeMissClean & ~s0_putAllBeat | storeMissDirty & ~s0_putAllBeat); // @[StorePipe.scala 91:34]
  wire  _s0_valid_T_1 = s0_tlbusReq_ready & s0_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_2 = storeMissClean & _s0_valid_T_1; // @[StorePipe.scala 108:40]
  wire  _s0_valid_T_3 = io_dir_read_resp_bits_hit | _s0_valid_T_2; // @[StorePipe.scala 107:35]
  wire  _s0_valid_T_4 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_6 = io_tlbus_resp_bits_opcode == 3'h0; // @[StorePipe.scala 109:91]
  wire  _s0_valid_T_7 = storeMissDirty & _s0_valid_T_4 & io_tlbus_resp_bits_opcode == 3'h0; // @[StorePipe.scala 109:62]
  wire  _s0_valid_T_8 = _s0_valid_T_3 | _s0_valid_T_7; // @[StorePipe.scala 108:60]
  wire  s0_valid = s0_full & io_dir_read_resp_valid & _s0_valid_T_8; // @[StorePipe.scala 106:51]
  reg  s1_full; // @[StorePipe.scala 119:26]
  reg  s1_storeHit_r; // @[Reg.scala 19:16]
  wire  s1_storeHit = s1_storeHit_r & s1_full; // @[StorePipe.scala 127:53]
  wire  s1_storeResp_ready = storeRespArb_io_in_1_ready; // @[StorePipe.scala 136:28 259:27]
  wire  s1_storeResp_valid = s1_storeHit; // @[StorePipe.scala 127:53]
  wire  _s1_valid_T = s1_storeResp_ready & s1_storeResp_valid; // @[Decoupled.scala 51:35]
  reg  s1_storeMissClean_r; // @[Reg.scala 19:16]
  wire  s1_storeMissClean = s1_storeMissClean_r & s1_full; // @[StorePipe.scala 128:65]
  reg  s1_storeMissDirty_r; // @[Reg.scala 19:16]
  wire  s1_storeMissDirty = s1_storeMissDirty_r & s1_full; // @[StorePipe.scala 129:65]
  wire  s1_refillFire = io_tlbus_resp_bits_opcode == 3'h1 & _s0_valid_T_4; // @[StorePipe.scala 160:67]
  reg [1:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire  s1_lastBeat = s1_beatCounter_value == 2'h3; // @[StorePipe.scala 163:44]
  wire  _s1_valid_T_4 = (s1_storeMissClean | s1_storeMissDirty) & s1_refillFire & s1_lastBeat; // @[StorePipe.scala 198:79]
  wire  s1_valid = s1_storeHit & _s1_valid_T | _s1_valid_T_4; // @[StorePipe.scala 197:50]
  reg  s2_full; // @[StorePipe.scala 205:26]
  reg  s2_storeHit_r; // @[Reg.scala 19:16]
  wire  s2_storeHit = s2_storeHit_r & s2_full; // @[StorePipe.scala 213:56]
  reg  s2_storeMissClean_r; // @[Reg.scala 19:16]
  wire  s2_storeMissClean = s2_storeMissClean_r & s2_full; // @[StorePipe.scala 214:68]
  reg  s2_storeMissDirty_r; // @[Reg.scala 19:16]
  wire  s2_storeMissDirty = s2_storeMissDirty_r & s2_full; // @[StorePipe.scala 215:68]
  wire  _s2_valid_T = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 248:52]
  wire  s2_dataBankWrReq_ready = dataBankWrReqArb_io_in_0_ready; // @[StorePipe.scala 240:32 263:31]
  wire  _s2_dataBankWrReq_valid_T = _s2_valid_T; // @[StorePipe.scala 241:49]
  wire  _s2_valid_T_1 = s2_dataBankWrReq_ready & _s2_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_dirWrReq_ready = dirWrReqArb_io_in_0_ready; // @[StorePipe.scala 230:27 268:26]
  wire  _s2_valid_T_3 = s2_dirWrReq_ready & _s2_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_storeResp_ready = 1'h1; // @[StorePipe.scala 222:28 258:27]
  wire  s2_storeResp_valid = _s2_valid_T; // @[StorePipe.scala 225:45]
  wire  _s2_valid_T_5 = s2_storeResp_ready & _s2_dataBankWrReq_valid_T; // @[Decoupled.scala 51:35]
  wire  s2_fire = s2_storeHit | (s2_storeMissClean | s2_storeMissDirty) & _s2_valid_T_1 & _s2_valid_T_3 & _s2_valid_T_5; // @[StorePipe.scala 248:29]
  wire  s2_ready = ~s2_full | s2_fire; // @[StorePipe.scala 217:26]
  wire  s1_fire = s1_valid & s2_ready; // @[StorePipe.scala 121:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[StorePipe.scala 131:26]
  wire  s0_fire = s0_valid & s1_ready; // @[StorePipe.scala 36:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s0_reqReg_mask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_3 = s0_full & s0_fire ? 1'h0 : s0_full; // @[StorePipe.scala 34:26 45:{35,45}]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[StorePipe.scala 44:{20,30}]
  wire [31:0] temp_0_0 = io_dataBank_read_resp_bits_blockData_0[31:0]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_1 = io_dataBank_read_resp_bits_blockData_0[63:32]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_2 = io_dataBank_read_resp_bits_blockData_0[95:64]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_3 = io_dataBank_read_resp_bits_blockData_0[127:96]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_4 = io_dataBank_read_resp_bits_blockData_0[159:128]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_5 = io_dataBank_read_resp_bits_blockData_0[191:160]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_6 = io_dataBank_read_resp_bits_blockData_0[223:192]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_0_7 = io_dataBank_read_resp_bits_blockData_0[255:224]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_0 = io_dataBank_read_resp_bits_blockData_1[31:0]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_1 = io_dataBank_read_resp_bits_blockData_1[63:32]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_2 = io_dataBank_read_resp_bits_blockData_1[95:64]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_3 = io_dataBank_read_resp_bits_blockData_1[127:96]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_4 = io_dataBank_read_resp_bits_blockData_1[159:128]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_5 = io_dataBank_read_resp_bits_blockData_1[191:160]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_6 = io_dataBank_read_resp_bits_blockData_1[223:192]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_1_7 = io_dataBank_read_resp_bits_blockData_1[255:224]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_0 = io_dataBank_read_resp_bits_blockData_2[31:0]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_1 = io_dataBank_read_resp_bits_blockData_2[63:32]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_2 = io_dataBank_read_resp_bits_blockData_2[95:64]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_3 = io_dataBank_read_resp_bits_blockData_2[127:96]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_4 = io_dataBank_read_resp_bits_blockData_2[159:128]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_5 = io_dataBank_read_resp_bits_blockData_2[191:160]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_6 = io_dataBank_read_resp_bits_blockData_2[223:192]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_2_7 = io_dataBank_read_resp_bits_blockData_2[255:224]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_0 = io_dataBank_read_resp_bits_blockData_3[31:0]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_1 = io_dataBank_read_resp_bits_blockData_3[63:32]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_2 = io_dataBank_read_resp_bits_blockData_3[95:64]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_3 = io_dataBank_read_resp_bits_blockData_3[127:96]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_4 = io_dataBank_read_resp_bits_blockData_3[159:128]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_5 = io_dataBank_read_resp_bits_blockData_3[191:160]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_6 = io_dataBank_read_resp_bits_blockData_3[223:192]; // @[StorePipe.scala 69:51]
  wire [31:0] temp_3_7 = io_dataBank_read_resp_bits_blockData_3[255:224]; // @[StorePipe.scala 69:51]
  wire [31:0] _s0_chosenRdBlockData_T_8 = io_dir_read_resp_bits_chosenWay[0] ? temp_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_9 = io_dir_read_resp_bits_chosenWay[1] ? temp_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_10 = io_dir_read_resp_bits_chosenWay[2] ? temp_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_11 = io_dir_read_resp_bits_chosenWay[3] ? temp_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_12 = io_dir_read_resp_bits_chosenWay[4] ? temp_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_13 = io_dir_read_resp_bits_chosenWay[5] ? temp_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_14 = io_dir_read_resp_bits_chosenWay[6] ? temp_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_15 = io_dir_read_resp_bits_chosenWay[7] ? temp_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_16 = _s0_chosenRdBlockData_T_8 | _s0_chosenRdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_17 = _s0_chosenRdBlockData_T_16 | _s0_chosenRdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_18 = _s0_chosenRdBlockData_T_17 | _s0_chosenRdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_19 = _s0_chosenRdBlockData_T_18 | _s0_chosenRdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_20 = _s0_chosenRdBlockData_T_19 | _s0_chosenRdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_21 = _s0_chosenRdBlockData_T_20 | _s0_chosenRdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s0_chosenRdBlockData_0 = _s0_chosenRdBlockData_T_21 | _s0_chosenRdBlockData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_31 = io_dir_read_resp_bits_chosenWay[0] ? temp_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_32 = io_dir_read_resp_bits_chosenWay[1] ? temp_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_33 = io_dir_read_resp_bits_chosenWay[2] ? temp_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_34 = io_dir_read_resp_bits_chosenWay[3] ? temp_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_35 = io_dir_read_resp_bits_chosenWay[4] ? temp_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_36 = io_dir_read_resp_bits_chosenWay[5] ? temp_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_37 = io_dir_read_resp_bits_chosenWay[6] ? temp_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_38 = io_dir_read_resp_bits_chosenWay[7] ? temp_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_39 = _s0_chosenRdBlockData_T_31 | _s0_chosenRdBlockData_T_32; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_40 = _s0_chosenRdBlockData_T_39 | _s0_chosenRdBlockData_T_33; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_41 = _s0_chosenRdBlockData_T_40 | _s0_chosenRdBlockData_T_34; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_42 = _s0_chosenRdBlockData_T_41 | _s0_chosenRdBlockData_T_35; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_43 = _s0_chosenRdBlockData_T_42 | _s0_chosenRdBlockData_T_36; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_44 = _s0_chosenRdBlockData_T_43 | _s0_chosenRdBlockData_T_37; // @[Mux.scala 27:73]
  wire [31:0] s0_chosenRdBlockData_1 = _s0_chosenRdBlockData_T_44 | _s0_chosenRdBlockData_T_38; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_54 = io_dir_read_resp_bits_chosenWay[0] ? temp_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_55 = io_dir_read_resp_bits_chosenWay[1] ? temp_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_56 = io_dir_read_resp_bits_chosenWay[2] ? temp_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_57 = io_dir_read_resp_bits_chosenWay[3] ? temp_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_58 = io_dir_read_resp_bits_chosenWay[4] ? temp_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_59 = io_dir_read_resp_bits_chosenWay[5] ? temp_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_60 = io_dir_read_resp_bits_chosenWay[6] ? temp_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_61 = io_dir_read_resp_bits_chosenWay[7] ? temp_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_62 = _s0_chosenRdBlockData_T_54 | _s0_chosenRdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_63 = _s0_chosenRdBlockData_T_62 | _s0_chosenRdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_64 = _s0_chosenRdBlockData_T_63 | _s0_chosenRdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_65 = _s0_chosenRdBlockData_T_64 | _s0_chosenRdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_66 = _s0_chosenRdBlockData_T_65 | _s0_chosenRdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_67 = _s0_chosenRdBlockData_T_66 | _s0_chosenRdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] s0_chosenRdBlockData_2 = _s0_chosenRdBlockData_T_67 | _s0_chosenRdBlockData_T_61; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_77 = io_dir_read_resp_bits_chosenWay[0] ? temp_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_78 = io_dir_read_resp_bits_chosenWay[1] ? temp_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_79 = io_dir_read_resp_bits_chosenWay[2] ? temp_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_80 = io_dir_read_resp_bits_chosenWay[3] ? temp_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_81 = io_dir_read_resp_bits_chosenWay[4] ? temp_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_82 = io_dir_read_resp_bits_chosenWay[5] ? temp_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_83 = io_dir_read_resp_bits_chosenWay[6] ? temp_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_84 = io_dir_read_resp_bits_chosenWay[7] ? temp_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_85 = _s0_chosenRdBlockData_T_77 | _s0_chosenRdBlockData_T_78; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_86 = _s0_chosenRdBlockData_T_85 | _s0_chosenRdBlockData_T_79; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_87 = _s0_chosenRdBlockData_T_86 | _s0_chosenRdBlockData_T_80; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_88 = _s0_chosenRdBlockData_T_87 | _s0_chosenRdBlockData_T_81; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_89 = _s0_chosenRdBlockData_T_88 | _s0_chosenRdBlockData_T_82; // @[Mux.scala 27:73]
  wire [31:0] _s0_chosenRdBlockData_T_90 = _s0_chosenRdBlockData_T_89 | _s0_chosenRdBlockData_T_83; // @[Mux.scala 27:73]
  wire [31:0] s0_chosenRdBlockData_3 = _s0_chosenRdBlockData_T_90 | _s0_chosenRdBlockData_T_84; // @[Mux.scala 27:73]
  reg [1:0] s0_beatCounter_value; // @[Counter.scala 61:40]
  wire [3:0] s0_beatOH = 4'h1 << s0_beatCounter_value; // @[OneHot.scala 57:35]
  wire  s0_lastBeat = s0_beatCounter_value == 2'h3; // @[StorePipe.scala 79:44]
  wire  _s0_putAllBeat_T_1 = s0_lastBeat & _s0_valid_T_1; // @[StorePipe.scala 80:64]
  wire  _GEN_5 = _s0_putAllBeat_T_1 | s0_putAllBeat; // @[Reg.scala 36:18 35:20 36:22]
  wire [2:0] s0_tlbusReq_bits_opcode = storeMissClean ? 3'h4 : 3'h2; // @[StorePipe.scala 93:35]
  wire [1:0] _value_T_1 = s0_beatCounter_value + 2'h1; // @[Counter.scala 77:24]
  wire [31:0] blockAddr = {s0_reqReg_addr[31:4],4'h0}; // @[Cat.scala 33:92]
  wire [31:0] writebackAddr = {io_dir_read_resp_bits_dirtyTag,s0_reqReg_addr[11:4],4'h0}; // @[Cat.scala 33:92]
  wire [3:0] _s0_tlbusReq_bits_address_T = {s0_beatCounter_value, 2'h0}; // @[StorePipe.scala 97:75]
  wire [31:0] _GEN_39 = {{28'd0}, _s0_tlbusReq_bits_address_T}; // @[StorePipe.scala 97:51]
  wire [31:0] _s0_tlbusReq_bits_address_T_2 = writebackAddr + _GEN_39; // @[StorePipe.scala 97:51]
  wire [31:0] _s0_tlbusReq_bits_data_T_4 = s0_beatOH[0] ? s0_chosenRdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_5 = s0_beatOH[1] ? s0_chosenRdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_6 = s0_beatOH[2] ? s0_chosenRdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_7 = s0_beatOH[3] ? s0_chosenRdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_8 = _s0_tlbusReq_bits_data_T_4 | _s0_tlbusReq_bits_data_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_9 = _s0_tlbusReq_bits_data_T_8 | _s0_tlbusReq_bits_data_T_6; // @[Mux.scala 27:73]
  wire [31:0] _s0_tlbusReq_bits_data_T_10 = _s0_tlbusReq_bits_data_T_9 | _s0_tlbusReq_bits_data_T_7; // @[Mux.scala 27:73]
  reg [31:0] s1_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s1_reqReg_mask; // @[Reg.scala 19:16]
  wire [3:0] s1_dataBlockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  reg [7:0] s1_chosenWayOH; // @[Reg.scala 19:16]
  wire  _GEN_16 = s1_full & s1_fire ? 1'h0 : s1_full; // @[StorePipe.scala 119:26 133:{35,45}]
  wire  _GEN_17 = s0_fire | _GEN_16; // @[StorePipe.scala 132:{20,30}]
  wire  s1_tlbusReq_ready = tlbusReqArb_io_in_0_ready; // @[StorePipe.scala 144:27 253:26]
  reg  s1_sendGet; // @[Reg.scala 35:20]
  wire  s1_tlbusReq_valid = s1_storeMissDirty & ~s1_sendGet; // @[StorePipe.scala 147:44]
  wire  _s1_sendGet_T = s1_tlbusReq_ready & s1_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_18 = _s1_sendGet_T | s1_sendGet; // @[Reg.scala 36:18 35:20 36:22]
  wire [3:0] s1_beatOH = 4'h1 << s1_beatCounter_value; // @[OneHot.scala 57:35]
  wire [1:0] _value_T_3 = s1_beatCounter_value + 2'h1; // @[Counter.scala 77:24]
  wire  s1_writeRefill = s1_refillFire & (s1_storeMissClean | s1_storeMissDirty & s1_sendGet); // @[StorePipe.scala 178:40]
  wire  s1_dirWrReq_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 180:38]
  reg [31:0] s2_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s2_reqReg_mask; // @[Reg.scala 19:16]
  reg [7:0] s2_chosenWayOH; // @[Reg.scala 19:16]
  wire  _GEN_37 = s2_full & s2_fire ? 1'h0 : s2_full; // @[StorePipe.scala 205:26 219:{35,45}]
  wire  _GEN_38 = s1_fire | _GEN_37; // @[StorePipe.scala 218:{20,30}]
  wire  s1_storeResp_bits_status = 1'h0; // @[StorePipe.scala 138:{33,33}]
  wire [1:0] s1_storeResp_bits_stageID = 2'h1; // @[StorePipe.scala 136:28 140:31]
  wire  s2_storeResp_bits_status = 1'h0; // @[StorePipe.scala 224:{33,33}]
  wire [1:0] s2_storeResp_bits_stageID = 2'h1; // @[StorePipe.scala 222:28 226:31]
  Arbiter_1 tlbusReqArb ( // @[StorePipe.scala 252:29]
    .io_in_0_ready(tlbusReqArb_io_in_0_ready),
    .io_in_0_valid(tlbusReqArb_io_in_0_valid),
    .io_in_0_bits_size(tlbusReqArb_io_in_0_bits_size),
    .io_in_0_bits_address(tlbusReqArb_io_in_0_bits_address),
    .io_in_1_ready(tlbusReqArb_io_in_1_ready),
    .io_in_1_valid(tlbusReqArb_io_in_1_valid),
    .io_in_1_bits_opcode(tlbusReqArb_io_in_1_bits_opcode),
    .io_in_1_bits_size(tlbusReqArb_io_in_1_bits_size),
    .io_in_1_bits_address(tlbusReqArb_io_in_1_bits_address),
    .io_in_1_bits_data(tlbusReqArb_io_in_1_bits_data),
    .io_out_ready(tlbusReqArb_io_out_ready),
    .io_out_valid(tlbusReqArb_io_out_valid),
    .io_out_bits_opcode(tlbusReqArb_io_out_bits_opcode),
    .io_out_bits_size(tlbusReqArb_io_out_bits_size),
    .io_out_bits_address(tlbusReqArb_io_out_bits_address),
    .io_out_bits_data(tlbusReqArb_io_out_bits_data)
  );
  Arbiter_5 storeRespArb ( // @[StorePipe.scala 257:30]
    .io_in_0_valid(storeRespArb_io_in_0_valid),
    .io_in_1_ready(storeRespArb_io_in_1_ready),
    .io_in_1_valid(storeRespArb_io_in_1_valid),
    .io_out_valid(storeRespArb_io_out_valid)
  );
  Arbiter_6 dataBankWrReqArb ( // @[StorePipe.scala 262:34]
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
  Arbiter_7 dirWrReqArb ( // @[StorePipe.scala 267:29]
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
  assign io_store_resp_valid = storeRespArb_io_out_valid; // @[StorePipe.scala 260:19]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 48:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[StorePipe.scala 38:23]
  assign io_dir_write_req_valid = dirWrReqArb_io_out_valid; // @[StorePipe.scala 270:22]
  assign io_dir_write_req_bits_addr = dirWrReqArb_io_out_bits_addr; // @[StorePipe.scala 270:22]
  assign io_dir_write_req_bits_way = dirWrReqArb_io_out_bits_way; // @[StorePipe.scala 270:22]
  assign io_dir_write_req_bits_meta = dirWrReqArb_io_out_bits_meta; // @[StorePipe.scala 270:22]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 51:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 4'h1 << _GEN_0[3:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = dataBankWrReqArb_io_out_valid; // @[StorePipe.scala 265:27]
  assign io_dataBank_write_req_bits_data = dataBankWrReqArb_io_out_bits_data; // @[StorePipe.scala 265:27]
  assign io_dataBank_write_req_bits_set = dataBankWrReqArb_io_out_bits_set; // @[StorePipe.scala 265:27]
  assign io_dataBank_write_req_bits_blockSelOH = dataBankWrReqArb_io_out_bits_blockSelOH; // @[StorePipe.scala 265:27]
  assign io_dataBank_write_req_bits_way = dataBankWrReqArb_io_out_bits_way; // @[StorePipe.scala 265:27]
  assign io_dataBank_write_req_bits_mask = dataBankWrReqArb_io_out_bits_mask; // @[StorePipe.scala 265:27]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[StorePipe.scala 255:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[StorePipe.scala 255:18]
  assign io_tlbus_req_bits_size = tlbusReqArb_io_out_bits_size; // @[StorePipe.scala 255:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[StorePipe.scala 255:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[StorePipe.scala 255:18]
  assign io_tlbus_resp_ready = 1'h1; // @[StorePipe.scala 158:25]
  assign tlbusReqArb_io_in_0_valid = s1_storeMissDirty & ~s1_sendGet; // @[StorePipe.scala 147:44]
  assign tlbusReqArb_io_in_0_bits_size = 32'h10; // @[StorePipe.scala 144:27 152:27]
  assign tlbusReqArb_io_in_0_bits_address = {s1_reqReg_addr[31:4],4'h0}; // @[Cat.scala 33:92]
  assign tlbusReqArb_io_in_1_valid = s0_full & (storeMissClean & ~s0_putAllBeat | storeMissDirty & ~s0_putAllBeat); // @[StorePipe.scala 91:34]
  assign tlbusReqArb_io_in_1_bits_opcode = storeMissClean ? 3'h4 : 3'h2; // @[StorePipe.scala 93:35]
  assign tlbusReqArb_io_in_1_bits_size = 32'h10; // @[StorePipe.scala 102:27 75:27]
  assign tlbusReqArb_io_in_1_bits_address = storeMissDirty ? _s0_tlbusReq_bits_address_T_2 : blockAddr; // @[StorePipe.scala 96:36]
  assign tlbusReqArb_io_in_1_bits_data = storeMissDirty ? _s0_tlbusReq_bits_data_T_10 : 32'h0; // @[StorePipe.scala 100:33]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[StorePipe.scala 255:18]
  assign storeRespArb_io_in_0_valid = _s2_dataBankWrReq_valid_T; // @[StorePipe.scala 258:27]
  assign storeRespArb_io_in_1_valid = s1_storeResp_valid; // @[StorePipe.scala 259:27]
  assign dataBankWrReqArb_io_in_0_valid = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 241:49]
  assign dataBankWrReqArb_io_in_0_bits_data = s2_reqReg_data; // @[StorePipe.scala 240:32 246:32]
  assign dataBankWrReqArb_io_in_0_bits_set = s1_reqReg_addr[11:4]; // @[Parameters.scala 50:11]
  assign dataBankWrReqArb_io_in_0_bits_blockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  assign dataBankWrReqArb_io_in_0_bits_way = s2_chosenWayOH; // @[StorePipe.scala 240:32 244:31]
  assign dataBankWrReqArb_io_in_0_bits_mask = s2_reqReg_mask; // @[StorePipe.scala 240:32 245:32]
  assign dataBankWrReqArb_io_in_1_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 190:43]
  assign dataBankWrReqArb_io_in_1_bits_data = s1_writeRefill ? io_tlbus_resp_bits_data : s1_reqReg_data; // @[StorePipe.scala 195:38]
  assign dataBankWrReqArb_io_in_1_bits_set = s1_reqReg_addr[11:4]; // @[Parameters.scala 50:11]
  assign dataBankWrReqArb_io_in_1_bits_blockSelOH = s1_writeRefill ? s1_beatOH : s1_dataBlockSelOH; // @[StorePipe.scala 191:44]
  assign dataBankWrReqArb_io_in_1_bits_way = s1_chosenWayOH; // @[StorePipe.scala 189:32 193:31]
  assign dataBankWrReqArb_io_in_1_bits_mask = s1_writeRefill ? 4'hf : s1_reqReg_mask; // @[StorePipe.scala 194:38]
  assign dataBankWrReqArb_io_out_ready = io_dataBank_write_req_ready; // @[StorePipe.scala 265:27]
  assign dirWrReqArb_io_in_0_valid = s2_storeMissClean | s2_storeMissDirty; // @[StorePipe.scala 231:44]
  assign dirWrReqArb_io_in_0_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 230:27 232:27]
  assign dirWrReqArb_io_in_0_bits_way = s2_chosenWayOH; // @[StorePipe.scala 230:27 233:26]
  assign dirWrReqArb_io_in_0_bits_meta = 2'h3; // @[StorePipe.scala 237:49]
  assign dirWrReqArb_io_in_1_valid = s1_storeHit | s1_writeRefill; // @[StorePipe.scala 180:38]
  assign dirWrReqArb_io_in_1_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 179:27 181:27]
  assign dirWrReqArb_io_in_1_bits_way = s1_chosenWayOH; // @[StorePipe.scala 179:27 182:26]
  assign dirWrReqArb_io_in_1_bits_meta = {s1_storeHit,s1_dirWrReq_valid}; // @[StorePipe.scala 186:49]
  assign dirWrReqArb_io_out_ready = io_dir_write_req_ready; // @[StorePipe.scala 270:22]
  always @(posedge clock) begin
    if (reset) begin // @[StorePipe.scala 34:26]
      s0_full <= 1'h0; // @[StorePipe.scala 34:26]
    end else begin
      s0_full <= _GEN_4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      s0_putAllBeat <= 1'h0; // @[Reg.scala 35:20]
    end else if (s0_fire) begin // @[StorePipe.scala 87:19]
      s0_putAllBeat <= 1'h0; // @[StorePipe.scala 88:23]
    end else begin
      s0_putAllBeat <= _GEN_5;
    end
    if (reset) begin // @[StorePipe.scala 119:26]
      s1_full <= 1'h0; // @[StorePipe.scala 119:26]
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
      s1_beatCounter_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (~s1_lastBeat & s1_refillFire) begin // @[StorePipe.scala 164:41]
      s1_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
    end else if (s0_fire) begin // @[StorePipe.scala 166:26]
      s1_beatCounter_value <= 2'h0; // @[Counter.scala 98:11]
    end
    if (reset) begin // @[StorePipe.scala 205:26]
      s2_full <= 1'h0; // @[StorePipe.scala 205:26]
    end else begin
      s2_full <= _GEN_38;
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
      s0_beatCounter_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (_s0_valid_T_1 & s0_tlbusReq_bits_opcode == 3'h2) begin // @[StorePipe.scala 81:71]
      s0_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
    end else if (_s0_valid_T_4 & _s0_valid_T_6) begin // @[StorePipe.scala 83:79]
      s0_beatCounter_value <= 2'h0; // @[Counter.scala 98:11]
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
    end else if (s1_fire) begin // @[StorePipe.scala 146:19]
      s1_sendGet <= 1'h0; // @[StorePipe.scala 146:32]
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
  s1_beatCounter_value = _RAND_6[1:0];
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
  s0_beatCounter_value = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  s1_reqReg_addr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_reqReg_data = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_reqReg_mask = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  s1_chosenWayOH = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  s1_sendGet = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s2_reqReg_data = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s2_reqReg_mask = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  s2_chosenWayOH = _RAND_22[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
