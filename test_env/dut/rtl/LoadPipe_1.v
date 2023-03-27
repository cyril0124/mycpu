module LoadPipe_1(
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
  input          io_dir_read_resp_bits_hit,
  input  [3:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [3:0]   io_dir_write_req_bits_way,
  output [1:0]   io_dir_write_req_bits_meta,
  output         io_dataBank_read_req_valid,
  output [6:0]   io_dataBank_read_req_bits_set,
  output [7:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [31:0]  io_dataBank_read_resp_bits_data_0,
  input  [31:0]  io_dataBank_read_resp_bits_data_1,
  input  [31:0]  io_dataBank_read_resp_bits_data_2,
  input  [31:0]  io_dataBank_read_resp_bits_data_3,
  input  [127:0] io_dataBank_read_resp_bits_blockData_0,
  input  [127:0] io_dataBank_read_resp_bits_blockData_1,
  input  [127:0] io_dataBank_read_resp_bits_blockData_2,
  input  [127:0] io_dataBank_read_resp_bits_blockData_3,
  input  [127:0] io_dataBank_read_resp_bits_blockData_4,
  input  [127:0] io_dataBank_read_resp_bits_blockData_5,
  input  [127:0] io_dataBank_read_resp_bits_blockData_6,
  input  [127:0] io_dataBank_read_resp_bits_blockData_7,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [6:0]   io_dataBank_write_req_bits_set,
  output [7:0]   io_dataBank_write_req_bits_blockSelOH,
  output [3:0]   io_dataBank_write_req_bits_way,
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
  reg [127:0] _RAND_14;
  reg [127:0] _RAND_15;
  reg [127:0] _RAND_16;
  reg [127:0] _RAND_17;
  reg [127:0] _RAND_18;
  reg [127:0] _RAND_19;
  reg [127:0] _RAND_20;
  reg [127:0] _RAND_21;
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
`endif // RANDOMIZE_REG_INIT
  wire  loadRespArb_io_in_0_valid; // @[LoadPipe_1.scala 227:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[LoadPipe_1.scala 227:29]
  wire [1:0] loadRespArb_io_in_0_bits_stageID; // @[LoadPipe_1.scala 227:29]
  wire  loadRespArb_io_in_1_ready; // @[LoadPipe_1.scala 227:29]
  wire  loadRespArb_io_in_1_valid; // @[LoadPipe_1.scala 227:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[LoadPipe_1.scala 227:29]
  wire [1:0] loadRespArb_io_in_1_bits_stageID; // @[LoadPipe_1.scala 227:29]
  wire  loadRespArb_io_out_valid; // @[LoadPipe_1.scala 227:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[LoadPipe_1.scala 227:29]
  wire [1:0] loadRespArb_io_out_bits_stageID; // @[LoadPipe_1.scala 227:29]
  wire  tlbusReqArb_io_in_0_ready; // @[LoadPipe_1.scala 232:29]
  wire  tlbusReqArb_io_in_0_valid; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_size; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[LoadPipe_1.scala 232:29]
  wire  tlbusReqArb_io_in_1_ready; // @[LoadPipe_1.scala 232:29]
  wire  tlbusReqArb_io_in_1_valid; // @[LoadPipe_1.scala 232:29]
  wire [2:0] tlbusReqArb_io_in_1_bits_opcode; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_size; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_data; // @[LoadPipe_1.scala 232:29]
  wire  tlbusReqArb_io_out_ready; // @[LoadPipe_1.scala 232:29]
  wire  tlbusReqArb_io_out_valid; // @[LoadPipe_1.scala 232:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_out_bits_size; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[LoadPipe_1.scala 232:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[LoadPipe_1.scala 232:29]
  reg  s0_full; // @[LoadPipe_1.scala 34:26]
  wire  s0_latch = io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[LoadPipe_1.scala 67:24]
  reg  s0_validReg; // @[LoadPipe_1.scala 64:30]
  wire  s0_valid = s0_valid_REG | s0_validReg; // @[LoadPipe_1.scala 67:35]
  reg  s1_full; // @[LoadPipe_1.scala 74:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  s1_isHit = s1_dirInfo_hit & s1_full; // @[LoadPipe_1.scala 79:35]
  wire  _s1_loadMissClean_T = ~s1_isHit; // @[LoadPipe_1.scala 91:28]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  wire  s1_isDirtyWay = s1_dirInfo_isDirtyWay & s1_full; // @[LoadPipe_1.scala 80:47]
  wire  s1_loadMissClean = ~s1_isHit & ~s1_isDirtyWay; // @[LoadPipe_1.scala 91:38]
  wire  s1_tlbusReq_ready = tlbusReqArb_io_in_1_ready; // @[LoadPipe_1.scala 110:27 234:26]
  reg  s1_putAllBeat; // @[Reg.scala 35:20]
  wire  s1_loadMissDirty = _s1_loadMissClean_T & s1_isDirtyWay; // @[LoadPipe_1.scala 92:38]
  wire  s1_tlbusReq_valid = s1_full & (s1_loadMissClean & ~s1_putAllBeat | s1_loadMissDirty & ~s1_putAllBeat); // @[LoadPipe_1.scala 125:34]
  wire  _s1_valid_T_4 = s1_tlbusReq_ready & s1_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_5 = s1_loadMissClean & _s1_valid_T_4; // @[LoadPipe_1.scala 140:34]
  wire  _s1_valid_T_6 = s1_isHit & io_load_resp_valid & io_load_resp_bits_stageID == 2'h0 | _s1_valid_T_5; // @[LoadPipe_1.scala 139:87]
  wire  _s1_valid_T_7 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_9 = io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe_1.scala 141:85]
  wire  _s1_valid_T_10 = s1_loadMissDirty & _s1_valid_T_7 & io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe_1.scala 141:56]
  wire  _s1_valid_T_11 = _s1_valid_T_6 | _s1_valid_T_10; // @[LoadPipe_1.scala 140:54]
  wire  s1_valid = s1_full & _s1_valid_T_11; // @[LoadPipe_1.scala 138:26]
  reg  s2_full; // @[LoadPipe_1.scala 147:26]
  reg  s2_loadMissClean_r; // @[Reg.scala 19:16]
  wire  s2_loadMissClean = s2_loadMissClean_r & s2_full; // @[LoadPipe_1.scala 154:66]
  wire  _s2_valid_T_2 = io_load_resp_bits_stageID == 2'h1; // @[LoadPipe_1.scala 221:84]
  reg  s2_loadMissDirty_r; // @[Reg.scala 19:16]
  wire  s2_loadMissDirty = s2_loadMissDirty_r & s2_full; // @[LoadPipe_1.scala 155:66]
  wire  _s2_valid_T_7 = s2_loadMissDirty & io_load_resp_valid & _s2_valid_T_2; // @[LoadPipe_1.scala 222:55]
  wire  _s2_valid_T_8 = s2_loadMissClean & io_load_resp_valid & io_load_resp_bits_stageID == 2'h1 | _s2_valid_T_7; // @[LoadPipe_1.scala 221:93]
  reg  s2_loadHit_r; // @[Reg.scala 19:16]
  wire  s2_loadHit = s2_loadHit_r & s2_full; // @[LoadPipe_1.scala 153:54]
  wire  s2_fire = _s2_valid_T_8 | s2_loadHit; // @[LoadPipe_1.scala 222:92]
  wire  s2_ready = ~s2_full | s2_fire; // @[LoadPipe_1.scala 158:26]
  wire  s1_fire = s1_valid & s2_ready; // @[LoadPipe_1.scala 76:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[LoadPipe_1.scala 86:26]
  wire  s0_fire = s0_valid & s1_ready; // @[LoadPipe_1.scala 36:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [7:0] s0_dataBlockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LoadPipe_1.scala 34:26 44:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[LoadPipe_1.scala 43:{20,30}]
  wire  _GEN_3 = s0_fire ? 1'h0 : s0_validReg; // @[LoadPipe_1.scala 66:24 64:30 66:38]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[LoadPipe_1.scala 65:{20,34}]
  reg [31:0] s1_rAddr; // @[Reg.scala 19:16]
  reg [3:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_0; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_1; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_2; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_3; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_4; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_5; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_6; // @[Reg.scala 19:16]
  reg [127:0] s1_rdBlockData_7; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3; // @[Reg.scala 19:16]
  wire [31:0] _s1_rdData_T_4 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_5 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_6 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_7 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_8 = _s1_rdData_T_4 | _s1_rdData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = _s1_rdData_T_8 | _s1_rdData_T_6; // @[Mux.scala 27:73]
  wire [31:0] s1_rdData = _s1_rdData_T_9 | _s1_rdData_T_7; // @[Mux.scala 27:73]
  wire  _GEN_21 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LoadPipe_1.scala 74:26 88:{35,45}]
  wire  _GEN_22 = s0_fire | _GEN_21; // @[LoadPipe_1.scala 87:{20,30}]
  wire  s1_loadResp_ready = loadRespArb_io_in_1_ready; // @[LoadPipe_1.scala 229:26 99:27]
  reg  s1_sendLoadResp; // @[Reg.scala 35:20]
  wire  s1_loadResp_valid = s1_isHit & s1_full & ~s1_sendLoadResp; // @[LoadPipe_1.scala 104:48]
  wire  _s1_sendLoadResp_T = s1_loadResp_ready & s1_loadResp_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_23 = _s1_sendLoadResp_T | s1_sendLoadResp; // @[Reg.scala 36:18 35:20 36:22]
  reg [2:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire [7:0] s1_beatOH = 8'h1 << s1_beatCounter_value; // @[OneHot.scala 57:35]
  wire  s1_lastBeat = s1_beatCounter_value == 3'h7; // @[LoadPipe_1.scala 114:44]
  wire  _s1_putAllBeat_T_1 = s1_lastBeat & _s1_valid_T_4; // @[LoadPipe_1.scala 115:64]
  wire  _GEN_25 = _s1_putAllBeat_T_1 | s1_putAllBeat; // @[Reg.scala 36:18 35:20 36:22]
  wire [2:0] s1_tlbusReq_bits_opcode = s1_loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe_1.scala 127:35]
  wire [2:0] _value_T_1 = s1_beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  wire [31:0] blockAddr = {s1_rAddr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire [4:0] _s1_tlbusReq_bits_address_T = {s1_beatCounter_value, 2'h0}; // @[LoadPipe_1.scala 130:71]
  wire [31:0] _GEN_59 = {{27'd0}, _s1_tlbusReq_bits_address_T}; // @[LoadPipe_1.scala 130:47]
  wire [31:0] _s1_tlbusReq_bits_address_T_2 = blockAddr + _GEN_59; // @[LoadPipe_1.scala 130:47]
  wire [127:0] _s1_tlbusReq_bits_data_T_8 = s1_beatOH[0] ? s1_rdBlockData_0 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_9 = s1_beatOH[1] ? s1_rdBlockData_1 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_10 = s1_beatOH[2] ? s1_rdBlockData_2 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_11 = s1_beatOH[3] ? s1_rdBlockData_3 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_12 = s1_beatOH[4] ? s1_rdBlockData_4 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_13 = s1_beatOH[5] ? s1_rdBlockData_5 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_14 = s1_beatOH[6] ? s1_rdBlockData_6 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_15 = s1_beatOH[7] ? s1_rdBlockData_7 : 128'h0; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_16 = _s1_tlbusReq_bits_data_T_8 | _s1_tlbusReq_bits_data_T_9; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_17 = _s1_tlbusReq_bits_data_T_16 | _s1_tlbusReq_bits_data_T_10; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_18 = _s1_tlbusReq_bits_data_T_17 | _s1_tlbusReq_bits_data_T_11; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_19 = _s1_tlbusReq_bits_data_T_18 | _s1_tlbusReq_bits_data_T_12; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_20 = _s1_tlbusReq_bits_data_T_19 | _s1_tlbusReq_bits_data_T_13; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_21 = _s1_tlbusReq_bits_data_T_20 | _s1_tlbusReq_bits_data_T_14; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_22 = _s1_tlbusReq_bits_data_T_21 | _s1_tlbusReq_bits_data_T_15; // @[Mux.scala 27:73]
  wire [127:0] _s1_tlbusReq_bits_data_T_23 = s1_loadMissDirty ? _s1_tlbusReq_bits_data_T_22 : 128'h0; // @[LoadPipe_1.scala 133:33]
  reg [31:0] s2_rAddr; // @[Reg.scala 19:16]
  reg [3:0] s2_chosenWayOH; // @[Reg.scala 19:16]
  reg [7:0] s2_dataBlockSelOH; // @[Reg.scala 19:16]
  wire  _GEN_35 = s2_full & s2_fire ? 1'h0 : s2_full; // @[LoadPipe_1.scala 147:26 160:{35,45}]
  wire  _GEN_36 = s1_fire | _GEN_35; // @[LoadPipe_1.scala 159:{20,30}]
  wire  s2_tlbusReq_ready = tlbusReqArb_io_in_0_ready; // @[LoadPipe_1.scala 163:27 233:26]
  reg  s2_sendGet; // @[Reg.scala 35:20]
  wire  s2_tlbusReq_valid = s2_loadMissDirty & ~s2_sendGet; // @[LoadPipe_1.scala 166:43]
  wire  _s2_sendGet_T = s2_tlbusReq_ready & s2_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_37 = _s2_sendGet_T | s2_sendGet; // @[Reg.scala 36:18 35:20 36:22]
  wire  s2_refillFire = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 179:67]
  reg [2:0] s2_beatCounter_value; // @[Counter.scala 61:40]
  wire  s2_lastBeat = s2_beatCounter_value == 3'h7; // @[LoadPipe_1.scala 182:44]
  wire [2:0] _value_T_3 = s2_beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  reg [31:0] s2_refillBlockDataArray_0; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_1; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_2; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_3; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_4; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_5; // @[LoadPipe_1.scala 189:42]
  reg [31:0] s2_refillBlockDataArray_6; // @[LoadPipe_1.scala 189:42]
  wire [31:0] _s2_readRespData_T_8 = s2_dataBlockSelOH[0] ? s2_refillBlockDataArray_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_9 = s2_dataBlockSelOH[1] ? s2_refillBlockDataArray_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_10 = s2_dataBlockSelOH[2] ? s2_refillBlockDataArray_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_11 = s2_dataBlockSelOH[3] ? s2_refillBlockDataArray_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_12 = s2_dataBlockSelOH[4] ? s2_refillBlockDataArray_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_13 = s2_dataBlockSelOH[5] ? s2_refillBlockDataArray_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_14 = s2_dataBlockSelOH[6] ? s2_refillBlockDataArray_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_15 = s2_dataBlockSelOH[7] ? io_tlbus_resp_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_16 = _s2_readRespData_T_8 | _s2_readRespData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_17 = _s2_readRespData_T_16 | _s2_readRespData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_18 = _s2_readRespData_T_17 | _s2_readRespData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_19 = _s2_readRespData_T_18 | _s2_readRespData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_20 = _s2_readRespData_T_19 | _s2_readRespData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s2_readRespData_T_21 = _s2_readRespData_T_20 | _s2_readRespData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s2_readRespData = _s2_readRespData_T_21 | _s2_readRespData_T_15; // @[Mux.scala 27:73]
  wire  _s2_loadResp_valid_T = s2_refillFire & s2_lastBeat; // @[LoadPipe_1.scala 217:53]
  wire  _s2_loadResp_valid_T_1 = s1_fire | s2_fire; // @[LoadPipe_1.scala 217:78]
  reg  s2_loadResp_valid_holdReg; // @[Reg.scala 19:16]
  wire  _GEN_57 = _s2_loadResp_valid_T | s2_loadResp_valid_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s1_rdData_T_10 = s1_rdData; // @[Mux.scala 27:73]
  wire [31:0] s1_loadResp_bits_data = s1_rdData; // @[Mux.scala 27:73]
  wire [1:0] s1_loadResp_bits_stageID = 2'h0; // @[LoadPipe_1.scala 99:27 106:30]
  wire [31:0] _s2_readRespData_T_22 = s2_readRespData; // @[Mux.scala 27:73]
  wire  s2_loadResp_ready = 1'h1; // @[LoadPipe_1.scala 214:27 228:26]
  wire  s2_loadResp_valid = _GEN_57 & (s2_loadMissClean | s2_loadMissDirty); // @[LoadPipe_1.scala 217:91]
  wire [31:0] s2_loadResp_bits_data = s2_readRespData; // @[Mux.scala 27:73]
  wire [1:0] s2_loadResp_bits_stageID = 2'h1; // @[LoadPipe_1.scala 214:27 219:30]
  Arbiter loadRespArb ( // @[LoadPipe_1.scala 227:29]
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
  Arbiter_1 tlbusReqArb ( // @[LoadPipe_1.scala 232:29]
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
  assign io_load_req_ready = ~s0_full | s0_fire; // @[LoadPipe_1.scala 42:35]
  assign io_load_resp_valid = loadRespArb_io_out_valid; // @[LoadPipe_1.scala 230:18]
  assign io_load_resp_bits_data = loadRespArb_io_out_bits_data; // @[LoadPipe_1.scala 230:18]
  assign io_load_resp_bits_stageID = loadRespArb_io_out_bits_stageID; // @[LoadPipe_1.scala 230:18]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[LoadPipe_1.scala 47:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[LoadPipe_1.scala 38:23]
  assign io_dir_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 179:67]
  assign io_dir_write_req_bits_addr = s2_rAddr; // @[LoadPipe_1.scala 206:32]
  assign io_dir_write_req_bits_way = s2_chosenWayOH; // @[LoadPipe_1.scala 207:31]
  assign io_dir_write_req_bits_meta = {1'h0,s2_refillFire}; // @[LoadPipe_1.scala 211:51]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[LoadPipe_1.scala 50:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 179:67]
  assign io_dataBank_write_req_bits_data = io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 200:37]
  assign io_dataBank_write_req_bits_set = s2_rAddr[11:5]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_blockSelOH = 8'h1 << s2_beatCounter_value; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s2_chosenWayOH; // @[LoadPipe_1.scala 199:36]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[LoadPipe_1.scala 235:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[LoadPipe_1.scala 235:18]
  assign io_tlbus_req_bits_size = tlbusReqArb_io_out_bits_size; // @[LoadPipe_1.scala 235:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[LoadPipe_1.scala 235:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[LoadPipe_1.scala 235:18]
  assign io_tlbus_resp_ready = 1'h1; // @[LoadPipe_1.scala 177:25]
  assign loadRespArb_io_in_0_valid = s2_loadResp_valid; // @[LoadPipe_1.scala 228:26]
  assign loadRespArb_io_in_0_bits_data = _s2_readRespData_T_22; // @[LoadPipe_1.scala 228:26]
  assign loadRespArb_io_in_0_bits_stageID = s2_loadResp_bits_stageID; // @[LoadPipe_1.scala 228:26]
  assign loadRespArb_io_in_1_valid = s1_loadResp_valid; // @[LoadPipe_1.scala 229:26]
  assign loadRespArb_io_in_1_bits_data = _s1_rdData_T_10; // @[LoadPipe_1.scala 229:26]
  assign loadRespArb_io_in_1_bits_stageID = s1_loadResp_bits_stageID; // @[LoadPipe_1.scala 229:26]
  assign tlbusReqArb_io_in_0_valid = s2_loadMissDirty & ~s2_sendGet; // @[LoadPipe_1.scala 166:43]
  assign tlbusReqArb_io_in_0_bits_size = 32'h20; // @[LoadPipe_1.scala 163:27 171:27]
  assign tlbusReqArb_io_in_0_bits_address = {s2_rAddr[31:5],5'h0}; // @[Cat.scala 33:92]
  assign tlbusReqArb_io_in_1_valid = s1_full & (s1_loadMissClean & ~s1_putAllBeat | s1_loadMissDirty & ~s1_putAllBeat); // @[LoadPipe_1.scala 125:34]
  assign tlbusReqArb_io_in_1_bits_opcode = s1_loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe_1.scala 127:35]
  assign tlbusReqArb_io_in_1_bits_size = 32'h20; // @[LoadPipe_1.scala 110:27 134:27]
  assign tlbusReqArb_io_in_1_bits_address = s1_loadMissDirty ? _s1_tlbusReq_bits_address_T_2 : blockAddr; // @[LoadPipe_1.scala 129:36]
  assign tlbusReqArb_io_in_1_bits_data = _s1_tlbusReq_bits_data_T_23[31:0]; // @[LoadPipe_1.scala 110:27 133:27]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[LoadPipe_1.scala 235:18]
  always @(posedge clock) begin
    if (reset) begin // @[LoadPipe_1.scala 34:26]
      s0_full <= 1'h0; // @[LoadPipe_1.scala 34:26]
    end else begin
      s0_full <= _GEN_2;
    end
    s0_valid_REG <= io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[LoadPipe_1.scala 64:30]
      s0_validReg <= 1'h0; // @[LoadPipe_1.scala 64:30]
    end else begin
      s0_validReg <= _GEN_4;
    end
    if (reset) begin // @[LoadPipe_1.scala 74:26]
      s1_full <= 1'h0; // @[LoadPipe_1.scala 74:26]
    end else begin
      s1_full <= _GEN_22;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_read_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_putAllBeat <= 1'h0; // @[Reg.scala 35:20]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 121:19]
      s1_putAllBeat <= 1'h0; // @[LoadPipe_1.scala 122:23]
    end else begin
      s1_putAllBeat <= _GEN_25;
    end
    if (reset) begin // @[LoadPipe_1.scala 147:26]
      s2_full <= 1'h0; // @[LoadPipe_1.scala 147:26]
    end else begin
      s2_full <= _GEN_36;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_loadMissClean_r <= s1_loadMissClean; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_loadMissDirty_r <= s1_loadMissDirty; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_loadHit_r <= s1_isHit; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (s0_latch) begin // @[Reg.scala 20:18]
        s1_rAddr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
      end else begin
        s1_rAddr <= s0_reqReg_addr; // @[Reg.scala 19:16]
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_chosenWay <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_0 <= io_dataBank_read_resp_bits_blockData_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_1 <= io_dataBank_read_resp_bits_blockData_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_2 <= io_dataBank_read_resp_bits_blockData_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_3 <= io_dataBank_read_resp_bits_blockData_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_4 <= io_dataBank_read_resp_bits_blockData_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_5 <= io_dataBank_read_resp_bits_blockData_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_6 <= io_dataBank_read_resp_bits_blockData_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_7 <= io_dataBank_read_resp_bits_blockData_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0 <= io_dataBank_read_resp_bits_data_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1 <= io_dataBank_read_resp_bits_data_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2 <= io_dataBank_read_resp_bits_data_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3 <= io_dataBank_read_resp_bits_data_3; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_sendLoadResp <= 1'h0; // @[Reg.scala 35:20]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 101:19]
      s1_sendLoadResp <= 1'h0; // @[LoadPipe_1.scala 101:37]
    end else begin
      s1_sendLoadResp <= _GEN_23;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (_s1_valid_T_4 & s1_tlbusReq_bits_opcode == 3'h2) begin // @[LoadPipe_1.scala 116:71]
      s1_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
    end else if (_s1_valid_T_7 & _s1_valid_T_9) begin // @[LoadPipe_1.scala 118:79]
      s1_beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_rAddr <= s1_rAddr; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenWayOH <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dataBlockSelOH <= s0_dataBlockSelOH; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s2_sendGet <= 1'h0; // @[Reg.scala 35:20]
    end else if (s2_fire) begin // @[LoadPipe_1.scala 165:19]
      s2_sendGet <= 1'h0; // @[LoadPipe_1.scala 165:32]
    end else begin
      s2_sendGet <= _GEN_37;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s2_beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (~s2_lastBeat & s2_refillFire) begin // @[LoadPipe_1.scala 183:41]
      s2_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 185:26]
      s2_beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_0 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h0 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_0 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_1 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h1 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_1 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_2 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h2 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_2 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_3 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h3 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_3 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_4 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h4 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_4 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_5 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h5 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_5 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 189:42]
      s2_refillBlockDataArray_6 <= 32'h0; // @[LoadPipe_1.scala 189:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 190:25]
      if (3'h6 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 190:73]
        s2_refillBlockDataArray_6 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 190:73]
      end
    end
    if (_s2_loadResp_valid_T_1) begin // @[util.scala 11:21]
      s2_loadResp_valid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      s2_loadResp_valid_holdReg <= _GEN_57;
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
  s0_valid_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_validReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_full = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_dirInfo_hit = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_dirInfo_isDirtyWay = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_putAllBeat = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_full = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_loadMissClean_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s2_loadMissDirty_r = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_loadHit_r = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_rAddr = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_dirInfo_chosenWay = _RAND_13[3:0];
  _RAND_14 = {4{`RANDOM}};
  s1_rdBlockData_0 = _RAND_14[127:0];
  _RAND_15 = {4{`RANDOM}};
  s1_rdBlockData_1 = _RAND_15[127:0];
  _RAND_16 = {4{`RANDOM}};
  s1_rdBlockData_2 = _RAND_16[127:0];
  _RAND_17 = {4{`RANDOM}};
  s1_rdBlockData_3 = _RAND_17[127:0];
  _RAND_18 = {4{`RANDOM}};
  s1_rdBlockData_4 = _RAND_18[127:0];
  _RAND_19 = {4{`RANDOM}};
  s1_rdBlockData_5 = _RAND_19[127:0];
  _RAND_20 = {4{`RANDOM}};
  s1_rdBlockData_6 = _RAND_20[127:0];
  _RAND_21 = {4{`RANDOM}};
  s1_rdBlockData_7 = _RAND_21[127:0];
  _RAND_22 = {1{`RANDOM}};
  s1_rdDataAll_0 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s1_rdDataAll_1 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_rdDataAll_2 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_rdDataAll_3 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_sendLoadResp = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  s2_rAddr = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s2_chosenWayOH = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  s2_dataBlockSelOH = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  s2_sendGet = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s2_beatCounter_value = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  s2_refillBlockDataArray_0 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s2_refillBlockDataArray_1 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s2_refillBlockDataArray_2 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  s2_refillBlockDataArray_3 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s2_refillBlockDataArray_4 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s2_refillBlockDataArray_5 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s2_refillBlockDataArray_6 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s2_loadResp_valid_holdReg = _RAND_40[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
