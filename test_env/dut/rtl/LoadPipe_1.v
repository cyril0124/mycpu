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
  input  [7:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  input  [19:0]  io_dir_read_resp_bits_dirtyTag,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [7:0]   io_dir_write_req_bits_way,
  output [1:0]   io_dir_write_req_bits_meta,
  output         io_dataBank_read_req_valid,
  output [6:0]   io_dataBank_read_req_bits_set,
  output [7:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [31:0]  io_dataBank_read_resp_bits_data_0,
  input  [31:0]  io_dataBank_read_resp_bits_data_1,
  input  [31:0]  io_dataBank_read_resp_bits_data_2,
  input  [31:0]  io_dataBank_read_resp_bits_data_3,
  input  [31:0]  io_dataBank_read_resp_bits_data_4,
  input  [31:0]  io_dataBank_read_resp_bits_data_5,
  input  [31:0]  io_dataBank_read_resp_bits_data_6,
  input  [31:0]  io_dataBank_read_resp_bits_data_7,
  input  [255:0] io_dataBank_read_resp_bits_blockData_0,
  input  [255:0] io_dataBank_read_resp_bits_blockData_1,
  input  [255:0] io_dataBank_read_resp_bits_blockData_2,
  input  [255:0] io_dataBank_read_resp_bits_blockData_3,
  input  [255:0] io_dataBank_read_resp_bits_blockData_4,
  input  [255:0] io_dataBank_read_resp_bits_blockData_5,
  input  [255:0] io_dataBank_read_resp_bits_blockData_6,
  input  [255:0] io_dataBank_read_resp_bits_blockData_7,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [6:0]   io_dataBank_write_req_bits_set,
  output [7:0]   io_dataBank_write_req_bits_blockSelOH,
  output [7:0]   io_dataBank_write_req_bits_way,
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
  reg [255:0] _RAND_15;
  reg [255:0] _RAND_16;
  reg [255:0] _RAND_17;
  reg [255:0] _RAND_18;
  reg [255:0] _RAND_19;
  reg [255:0] _RAND_20;
  reg [255:0] _RAND_21;
  reg [255:0] _RAND_22;
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
`endif // RANDOMIZE_REG_INIT
  wire  loadRespArb_io_in_0_valid; // @[LoadPipe_1.scala 234:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[LoadPipe_1.scala 234:29]
  wire [1:0] loadRespArb_io_in_0_bits_stageID; // @[LoadPipe_1.scala 234:29]
  wire  loadRespArb_io_in_1_ready; // @[LoadPipe_1.scala 234:29]
  wire  loadRespArb_io_in_1_valid; // @[LoadPipe_1.scala 234:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[LoadPipe_1.scala 234:29]
  wire [1:0] loadRespArb_io_in_1_bits_stageID; // @[LoadPipe_1.scala 234:29]
  wire  loadRespArb_io_out_valid; // @[LoadPipe_1.scala 234:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[LoadPipe_1.scala 234:29]
  wire [1:0] loadRespArb_io_out_bits_stageID; // @[LoadPipe_1.scala 234:29]
  wire  tlbusReqArb_io_in_0_ready; // @[LoadPipe_1.scala 239:29]
  wire  tlbusReqArb_io_in_0_valid; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_size; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[LoadPipe_1.scala 239:29]
  wire  tlbusReqArb_io_in_1_ready; // @[LoadPipe_1.scala 239:29]
  wire  tlbusReqArb_io_in_1_valid; // @[LoadPipe_1.scala 239:29]
  wire [2:0] tlbusReqArb_io_in_1_bits_opcode; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_size; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_data; // @[LoadPipe_1.scala 239:29]
  wire  tlbusReqArb_io_out_ready; // @[LoadPipe_1.scala 239:29]
  wire  tlbusReqArb_io_out_valid; // @[LoadPipe_1.scala 239:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_out_bits_size; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[LoadPipe_1.scala 239:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[LoadPipe_1.scala 239:29]
  reg  s0_full; // @[LoadPipe_1.scala 34:26]
  wire  s0_latch = io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[LoadPipe_1.scala 68:24]
  reg  s0_validReg; // @[LoadPipe_1.scala 65:30]
  wire  s0_valid = s0_valid_REG | s0_validReg; // @[LoadPipe_1.scala 68:35]
  reg  s1_full; // @[LoadPipe_1.scala 75:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  s1_isHit = s1_dirInfo_hit & s1_full; // @[LoadPipe_1.scala 80:35]
  wire  _s1_loadMissClean_T = ~s1_isHit; // @[LoadPipe_1.scala 94:28]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  wire  s1_isDirtyWay = s1_dirInfo_isDirtyWay & s1_full; // @[LoadPipe_1.scala 81:47]
  wire  s1_loadMissClean = ~s1_isHit & ~s1_isDirtyWay; // @[LoadPipe_1.scala 94:38]
  wire  s1_tlbusReq_ready = tlbusReqArb_io_in_1_ready; // @[LoadPipe_1.scala 113:27 241:26]
  reg  s1_putAllBeat; // @[Reg.scala 35:20]
  wire  s1_loadMissDirty = _s1_loadMissClean_T & s1_isDirtyWay; // @[LoadPipe_1.scala 95:38]
  wire  s1_tlbusReq_valid = s1_full & (s1_loadMissClean & ~s1_putAllBeat | s1_loadMissDirty & ~s1_putAllBeat); // @[LoadPipe_1.scala 128:34]
  wire  _s1_valid_T_4 = s1_tlbusReq_ready & s1_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_5 = s1_loadMissClean & _s1_valid_T_4; // @[LoadPipe_1.scala 147:34]
  wire  _s1_valid_T_6 = s1_isHit & io_load_resp_valid & io_load_resp_bits_stageID == 2'h0 | _s1_valid_T_5; // @[LoadPipe_1.scala 146:87]
  wire  _s1_valid_T_7 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_9 = io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe_1.scala 148:85]
  wire  _s1_valid_T_10 = s1_loadMissDirty & _s1_valid_T_7 & io_tlbus_resp_bits_opcode == 3'h0; // @[LoadPipe_1.scala 148:56]
  wire  _s1_valid_T_11 = _s1_valid_T_6 | _s1_valid_T_10; // @[LoadPipe_1.scala 147:54]
  wire  s1_valid = s1_full & _s1_valid_T_11; // @[LoadPipe_1.scala 145:26]
  reg  s2_full; // @[LoadPipe_1.scala 154:26]
  reg  s2_loadMissClean_r; // @[Reg.scala 19:16]
  wire  s2_loadMissClean = s2_loadMissClean_r & s2_full; // @[LoadPipe_1.scala 161:66]
  wire  _s2_valid_T_2 = io_load_resp_bits_stageID == 2'h1; // @[LoadPipe_1.scala 228:84]
  reg  s2_loadMissDirty_r; // @[Reg.scala 19:16]
  wire  s2_loadMissDirty = s2_loadMissDirty_r & s2_full; // @[LoadPipe_1.scala 162:66]
  wire  _s2_valid_T_7 = s2_loadMissDirty & io_load_resp_valid & _s2_valid_T_2; // @[LoadPipe_1.scala 229:55]
  wire  _s2_valid_T_8 = s2_loadMissClean & io_load_resp_valid & io_load_resp_bits_stageID == 2'h1 | _s2_valid_T_7; // @[LoadPipe_1.scala 228:93]
  reg  s2_loadHit_r; // @[Reg.scala 19:16]
  wire  s2_loadHit = s2_loadHit_r & s2_full; // @[LoadPipe_1.scala 160:54]
  wire  s2_fire = _s2_valid_T_8 | s2_loadHit; // @[LoadPipe_1.scala 229:92]
  wire  s2_ready = ~s2_full | s2_fire; // @[LoadPipe_1.scala 165:26]
  wire  s1_fire = s1_valid & s2_ready; // @[LoadPipe_1.scala 77:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[LoadPipe_1.scala 89:26]
  wire  s0_fire = s0_valid & s1_ready; // @[LoadPipe_1.scala 36:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [7:0] s0_dataBlockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LoadPipe_1.scala 34:26 44:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[LoadPipe_1.scala 43:{20,30}]
  wire  _GEN_3 = s0_fire ? 1'h0 : s0_validReg; // @[LoadPipe_1.scala 67:24 65:30 67:38]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[LoadPipe_1.scala 66:{20,34}]
  reg [31:0] s1_rAddr; // @[Reg.scala 19:16]
  reg [7:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [19:0] s1_dirInfo_dirtyTag; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_0; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_1; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_2; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_3; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_4; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_5; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_6; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_7; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7; // @[Reg.scala 19:16]
  wire [31:0] _s1_rdData_T_8 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_10 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_11 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_12 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_13 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_14 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_15 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_16 = _s1_rdData_T_8 | _s1_rdData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_17 = _s1_rdData_T_16 | _s1_rdData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_18 = _s1_rdData_T_17 | _s1_rdData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_19 = _s1_rdData_T_18 | _s1_rdData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_20 = _s1_rdData_T_19 | _s1_rdData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_21 = _s1_rdData_T_20 | _s1_rdData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_rdData = _s1_rdData_T_21 | _s1_rdData_T_15; // @[Mux.scala 27:73]
  reg [7:0] s1_dataBlockSelOH; // @[Reg.scala 19:16]
  wire  _GEN_27 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LoadPipe_1.scala 75:26 91:{35,45}]
  wire  _GEN_28 = s0_fire | _GEN_27; // @[LoadPipe_1.scala 90:{20,30}]
  wire  s1_loadResp_ready = loadRespArb_io_in_1_ready; // @[LoadPipe_1.scala 102:27 236:26]
  reg  s1_sendLoadResp; // @[Reg.scala 35:20]
  wire  s1_loadResp_valid = s1_isHit & s1_full & ~s1_sendLoadResp; // @[LoadPipe_1.scala 107:48]
  wire  _s1_sendLoadResp_T = s1_loadResp_ready & s1_loadResp_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_29 = _s1_sendLoadResp_T | s1_sendLoadResp; // @[Reg.scala 36:18 35:20 36:22]
  reg [2:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire [7:0] s1_beatOH = 8'h1 << s1_beatCounter_value; // @[OneHot.scala 57:35]
  wire  s1_lastBeat = s1_beatCounter_value == 3'h7; // @[LoadPipe_1.scala 117:44]
  wire  _s1_putAllBeat_T_1 = s1_lastBeat & _s1_valid_T_4; // @[LoadPipe_1.scala 118:64]
  wire  _GEN_31 = _s1_putAllBeat_T_1 | s1_putAllBeat; // @[Reg.scala 36:18 35:20 36:22]
  wire [2:0] s1_tlbusReq_bits_opcode = s1_loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe_1.scala 130:35]
  wire [2:0] _value_T_1 = s1_beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  wire [31:0] blockAddr = {s1_rAddr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire [31:0] writebackAddr = {s1_dirInfo_dirtyTag,s1_rAddr[11:5],5'h0}; // @[Cat.scala 33:92]
  wire [4:0] _s1_tlbusReq_bits_address_T = {s1_beatCounter_value, 2'h0}; // @[LoadPipe_1.scala 134:75]
  wire [31:0] _GEN_65 = {{27'd0}, _s1_tlbusReq_bits_address_T}; // @[LoadPipe_1.scala 134:51]
  wire [31:0] _s1_tlbusReq_bits_address_T_2 = writebackAddr + _GEN_65; // @[LoadPipe_1.scala 134:51]
  wire [31:0] temp_0_0 = s1_rdBlockData_0[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_1 = s1_rdBlockData_0[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_2 = s1_rdBlockData_0[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_3 = s1_rdBlockData_0[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_4 = s1_rdBlockData_0[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_5 = s1_rdBlockData_0[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_6 = s1_rdBlockData_0[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_0_7 = s1_rdBlockData_0[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_0 = s1_rdBlockData_1[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_1 = s1_rdBlockData_1[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_2 = s1_rdBlockData_1[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_3 = s1_rdBlockData_1[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_4 = s1_rdBlockData_1[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_5 = s1_rdBlockData_1[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_6 = s1_rdBlockData_1[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_1_7 = s1_rdBlockData_1[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_0 = s1_rdBlockData_2[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_1 = s1_rdBlockData_2[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_2 = s1_rdBlockData_2[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_3 = s1_rdBlockData_2[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_4 = s1_rdBlockData_2[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_5 = s1_rdBlockData_2[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_6 = s1_rdBlockData_2[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_2_7 = s1_rdBlockData_2[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_0 = s1_rdBlockData_3[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_1 = s1_rdBlockData_3[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_2 = s1_rdBlockData_3[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_3 = s1_rdBlockData_3[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_4 = s1_rdBlockData_3[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_5 = s1_rdBlockData_3[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_6 = s1_rdBlockData_3[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_3_7 = s1_rdBlockData_3[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_0 = s1_rdBlockData_4[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_1 = s1_rdBlockData_4[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_2 = s1_rdBlockData_4[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_3 = s1_rdBlockData_4[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_4 = s1_rdBlockData_4[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_5 = s1_rdBlockData_4[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_6 = s1_rdBlockData_4[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_4_7 = s1_rdBlockData_4[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_0 = s1_rdBlockData_5[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_1 = s1_rdBlockData_5[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_2 = s1_rdBlockData_5[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_3 = s1_rdBlockData_5[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_4 = s1_rdBlockData_5[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_5 = s1_rdBlockData_5[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_6 = s1_rdBlockData_5[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_5_7 = s1_rdBlockData_5[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_0 = s1_rdBlockData_6[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_1 = s1_rdBlockData_6[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_2 = s1_rdBlockData_6[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_3 = s1_rdBlockData_6[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_4 = s1_rdBlockData_6[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_5 = s1_rdBlockData_6[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_6 = s1_rdBlockData_6[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_6_7 = s1_rdBlockData_6[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_0 = s1_rdBlockData_7[31:0]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_1 = s1_rdBlockData_7[63:32]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_2 = s1_rdBlockData_7[95:64]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_3 = s1_rdBlockData_7[127:96]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_4 = s1_rdBlockData_7[159:128]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_5 = s1_rdBlockData_7[191:160]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_6 = s1_rdBlockData_7[223:192]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] temp_7_7 = s1_rdBlockData_7[255:224]; // @[LoadPipe_1.scala 137:51]
  wire [31:0] _s1_chosenRdBlockData_T_8 = s1_dirInfo_chosenWay[0] ? temp_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_9 = s1_dirInfo_chosenWay[1] ? temp_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_10 = s1_dirInfo_chosenWay[2] ? temp_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_11 = s1_dirInfo_chosenWay[3] ? temp_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_12 = s1_dirInfo_chosenWay[4] ? temp_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_13 = s1_dirInfo_chosenWay[5] ? temp_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_14 = s1_dirInfo_chosenWay[6] ? temp_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_15 = s1_dirInfo_chosenWay[7] ? temp_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_16 = _s1_chosenRdBlockData_T_8 | _s1_chosenRdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_17 = _s1_chosenRdBlockData_T_16 | _s1_chosenRdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_18 = _s1_chosenRdBlockData_T_17 | _s1_chosenRdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_19 = _s1_chosenRdBlockData_T_18 | _s1_chosenRdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_20 = _s1_chosenRdBlockData_T_19 | _s1_chosenRdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_21 = _s1_chosenRdBlockData_T_20 | _s1_chosenRdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_0 = _s1_chosenRdBlockData_T_21 | _s1_chosenRdBlockData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_31 = s1_dirInfo_chosenWay[0] ? temp_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_32 = s1_dirInfo_chosenWay[1] ? temp_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_33 = s1_dirInfo_chosenWay[2] ? temp_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_34 = s1_dirInfo_chosenWay[3] ? temp_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_35 = s1_dirInfo_chosenWay[4] ? temp_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_36 = s1_dirInfo_chosenWay[5] ? temp_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_37 = s1_dirInfo_chosenWay[6] ? temp_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_38 = s1_dirInfo_chosenWay[7] ? temp_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_39 = _s1_chosenRdBlockData_T_31 | _s1_chosenRdBlockData_T_32; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_40 = _s1_chosenRdBlockData_T_39 | _s1_chosenRdBlockData_T_33; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_41 = _s1_chosenRdBlockData_T_40 | _s1_chosenRdBlockData_T_34; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_42 = _s1_chosenRdBlockData_T_41 | _s1_chosenRdBlockData_T_35; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_43 = _s1_chosenRdBlockData_T_42 | _s1_chosenRdBlockData_T_36; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_44 = _s1_chosenRdBlockData_T_43 | _s1_chosenRdBlockData_T_37; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_1 = _s1_chosenRdBlockData_T_44 | _s1_chosenRdBlockData_T_38; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_54 = s1_dirInfo_chosenWay[0] ? temp_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_55 = s1_dirInfo_chosenWay[1] ? temp_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_56 = s1_dirInfo_chosenWay[2] ? temp_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_57 = s1_dirInfo_chosenWay[3] ? temp_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_58 = s1_dirInfo_chosenWay[4] ? temp_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_59 = s1_dirInfo_chosenWay[5] ? temp_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_60 = s1_dirInfo_chosenWay[6] ? temp_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_61 = s1_dirInfo_chosenWay[7] ? temp_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_62 = _s1_chosenRdBlockData_T_54 | _s1_chosenRdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_63 = _s1_chosenRdBlockData_T_62 | _s1_chosenRdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_64 = _s1_chosenRdBlockData_T_63 | _s1_chosenRdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_65 = _s1_chosenRdBlockData_T_64 | _s1_chosenRdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_66 = _s1_chosenRdBlockData_T_65 | _s1_chosenRdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_67 = _s1_chosenRdBlockData_T_66 | _s1_chosenRdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_2 = _s1_chosenRdBlockData_T_67 | _s1_chosenRdBlockData_T_61; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_77 = s1_dirInfo_chosenWay[0] ? temp_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_78 = s1_dirInfo_chosenWay[1] ? temp_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_79 = s1_dirInfo_chosenWay[2] ? temp_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_80 = s1_dirInfo_chosenWay[3] ? temp_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_81 = s1_dirInfo_chosenWay[4] ? temp_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_82 = s1_dirInfo_chosenWay[5] ? temp_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_83 = s1_dirInfo_chosenWay[6] ? temp_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_84 = s1_dirInfo_chosenWay[7] ? temp_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_85 = _s1_chosenRdBlockData_T_77 | _s1_chosenRdBlockData_T_78; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_86 = _s1_chosenRdBlockData_T_85 | _s1_chosenRdBlockData_T_79; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_87 = _s1_chosenRdBlockData_T_86 | _s1_chosenRdBlockData_T_80; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_88 = _s1_chosenRdBlockData_T_87 | _s1_chosenRdBlockData_T_81; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_89 = _s1_chosenRdBlockData_T_88 | _s1_chosenRdBlockData_T_82; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_90 = _s1_chosenRdBlockData_T_89 | _s1_chosenRdBlockData_T_83; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_3 = _s1_chosenRdBlockData_T_90 | _s1_chosenRdBlockData_T_84; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_100 = s1_dirInfo_chosenWay[0] ? temp_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_101 = s1_dirInfo_chosenWay[1] ? temp_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_102 = s1_dirInfo_chosenWay[2] ? temp_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_103 = s1_dirInfo_chosenWay[3] ? temp_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_104 = s1_dirInfo_chosenWay[4] ? temp_4_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_105 = s1_dirInfo_chosenWay[5] ? temp_4_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_106 = s1_dirInfo_chosenWay[6] ? temp_4_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_107 = s1_dirInfo_chosenWay[7] ? temp_4_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_108 = _s1_chosenRdBlockData_T_100 | _s1_chosenRdBlockData_T_101; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_109 = _s1_chosenRdBlockData_T_108 | _s1_chosenRdBlockData_T_102; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_110 = _s1_chosenRdBlockData_T_109 | _s1_chosenRdBlockData_T_103; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_111 = _s1_chosenRdBlockData_T_110 | _s1_chosenRdBlockData_T_104; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_112 = _s1_chosenRdBlockData_T_111 | _s1_chosenRdBlockData_T_105; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_113 = _s1_chosenRdBlockData_T_112 | _s1_chosenRdBlockData_T_106; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_4 = _s1_chosenRdBlockData_T_113 | _s1_chosenRdBlockData_T_107; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_123 = s1_dirInfo_chosenWay[0] ? temp_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_124 = s1_dirInfo_chosenWay[1] ? temp_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_125 = s1_dirInfo_chosenWay[2] ? temp_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_126 = s1_dirInfo_chosenWay[3] ? temp_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_127 = s1_dirInfo_chosenWay[4] ? temp_5_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_128 = s1_dirInfo_chosenWay[5] ? temp_5_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_129 = s1_dirInfo_chosenWay[6] ? temp_5_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_130 = s1_dirInfo_chosenWay[7] ? temp_5_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_131 = _s1_chosenRdBlockData_T_123 | _s1_chosenRdBlockData_T_124; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_132 = _s1_chosenRdBlockData_T_131 | _s1_chosenRdBlockData_T_125; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_133 = _s1_chosenRdBlockData_T_132 | _s1_chosenRdBlockData_T_126; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_134 = _s1_chosenRdBlockData_T_133 | _s1_chosenRdBlockData_T_127; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_135 = _s1_chosenRdBlockData_T_134 | _s1_chosenRdBlockData_T_128; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_136 = _s1_chosenRdBlockData_T_135 | _s1_chosenRdBlockData_T_129; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_5 = _s1_chosenRdBlockData_T_136 | _s1_chosenRdBlockData_T_130; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_146 = s1_dirInfo_chosenWay[0] ? temp_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_147 = s1_dirInfo_chosenWay[1] ? temp_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_148 = s1_dirInfo_chosenWay[2] ? temp_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_149 = s1_dirInfo_chosenWay[3] ? temp_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_150 = s1_dirInfo_chosenWay[4] ? temp_6_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_151 = s1_dirInfo_chosenWay[5] ? temp_6_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_152 = s1_dirInfo_chosenWay[6] ? temp_6_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_153 = s1_dirInfo_chosenWay[7] ? temp_6_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_154 = _s1_chosenRdBlockData_T_146 | _s1_chosenRdBlockData_T_147; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_155 = _s1_chosenRdBlockData_T_154 | _s1_chosenRdBlockData_T_148; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_156 = _s1_chosenRdBlockData_T_155 | _s1_chosenRdBlockData_T_149; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_157 = _s1_chosenRdBlockData_T_156 | _s1_chosenRdBlockData_T_150; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_158 = _s1_chosenRdBlockData_T_157 | _s1_chosenRdBlockData_T_151; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_159 = _s1_chosenRdBlockData_T_158 | _s1_chosenRdBlockData_T_152; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_6 = _s1_chosenRdBlockData_T_159 | _s1_chosenRdBlockData_T_153; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_169 = s1_dirInfo_chosenWay[0] ? temp_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_170 = s1_dirInfo_chosenWay[1] ? temp_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_171 = s1_dirInfo_chosenWay[2] ? temp_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_172 = s1_dirInfo_chosenWay[3] ? temp_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_173 = s1_dirInfo_chosenWay[4] ? temp_7_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_174 = s1_dirInfo_chosenWay[5] ? temp_7_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_175 = s1_dirInfo_chosenWay[6] ? temp_7_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_176 = s1_dirInfo_chosenWay[7] ? temp_7_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_177 = _s1_chosenRdBlockData_T_169 | _s1_chosenRdBlockData_T_170; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_178 = _s1_chosenRdBlockData_T_177 | _s1_chosenRdBlockData_T_171; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_179 = _s1_chosenRdBlockData_T_178 | _s1_chosenRdBlockData_T_172; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_180 = _s1_chosenRdBlockData_T_179 | _s1_chosenRdBlockData_T_173; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_181 = _s1_chosenRdBlockData_T_180 | _s1_chosenRdBlockData_T_174; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_182 = _s1_chosenRdBlockData_T_181 | _s1_chosenRdBlockData_T_175; // @[Mux.scala 27:73]
  wire [31:0] s1_chosenRdBlockData_7 = _s1_chosenRdBlockData_T_182 | _s1_chosenRdBlockData_T_176; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_8 = s1_beatOH[0] ? s1_chosenRdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_9 = s1_beatOH[1] ? s1_chosenRdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_10 = s1_beatOH[2] ? s1_chosenRdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_11 = s1_beatOH[3] ? s1_chosenRdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_12 = s1_beatOH[4] ? s1_chosenRdBlockData_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_13 = s1_beatOH[5] ? s1_chosenRdBlockData_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_14 = s1_beatOH[6] ? s1_chosenRdBlockData_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_15 = s1_beatOH[7] ? s1_chosenRdBlockData_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_16 = _s1_tlbusReq_bits_data_T_8 | _s1_tlbusReq_bits_data_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_17 = _s1_tlbusReq_bits_data_T_16 | _s1_tlbusReq_bits_data_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_18 = _s1_tlbusReq_bits_data_T_17 | _s1_tlbusReq_bits_data_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_19 = _s1_tlbusReq_bits_data_T_18 | _s1_tlbusReq_bits_data_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_20 = _s1_tlbusReq_bits_data_T_19 | _s1_tlbusReq_bits_data_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_21 = _s1_tlbusReq_bits_data_T_20 | _s1_tlbusReq_bits_data_T_14; // @[Mux.scala 27:73]
  wire [31:0] _s1_tlbusReq_bits_data_T_22 = _s1_tlbusReq_bits_data_T_21 | _s1_tlbusReq_bits_data_T_15; // @[Mux.scala 27:73]
  reg [31:0] s2_rAddr; // @[Reg.scala 19:16]
  reg [7:0] s2_chosenWayOH; // @[Reg.scala 19:16]
  reg [7:0] s2_dataBlockSelOH; // @[Reg.scala 19:16]
  wire  _GEN_41 = s2_full & s2_fire ? 1'h0 : s2_full; // @[LoadPipe_1.scala 154:26 167:{35,45}]
  wire  _GEN_42 = s1_fire | _GEN_41; // @[LoadPipe_1.scala 166:{20,30}]
  wire  s2_tlbusReq_ready = tlbusReqArb_io_in_0_ready; // @[LoadPipe_1.scala 170:27 240:26]
  reg  s2_sendGet; // @[Reg.scala 35:20]
  wire  s2_tlbusReq_valid = s2_loadMissDirty & ~s2_sendGet; // @[LoadPipe_1.scala 173:43]
  wire  _s2_sendGet_T = s2_tlbusReq_ready & s2_tlbusReq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_43 = _s2_sendGet_T | s2_sendGet; // @[Reg.scala 36:18 35:20 36:22]
  wire  s2_refillFire = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 186:67]
  reg [2:0] s2_beatCounter_value; // @[Counter.scala 61:40]
  wire  s2_lastBeat = s2_beatCounter_value == 3'h7; // @[LoadPipe_1.scala 189:44]
  wire [2:0] _value_T_3 = s2_beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  reg [31:0] s2_refillBlockDataArray_0; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_1; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_2; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_3; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_4; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_5; // @[LoadPipe_1.scala 196:42]
  reg [31:0] s2_refillBlockDataArray_6; // @[LoadPipe_1.scala 196:42]
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
  wire  _s2_loadResp_valid_T = s2_refillFire & s2_lastBeat; // @[LoadPipe_1.scala 224:53]
  wire  _s2_loadResp_valid_T_1 = s1_fire | s2_fire; // @[LoadPipe_1.scala 224:78]
  reg  s2_loadResp_valid_holdReg; // @[Reg.scala 19:16]
  wire  _GEN_63 = _s2_loadResp_valid_T | s2_loadResp_valid_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s1_rdData_T_22 = s1_rdData; // @[Mux.scala 27:73]
  wire [31:0] s1_loadResp_bits_data = s1_rdData; // @[Mux.scala 27:73]
  wire [1:0] s1_loadResp_bits_stageID = 2'h0; // @[LoadPipe_1.scala 102:27 109:30]
  wire [31:0] _s2_readRespData_T_22 = s2_readRespData; // @[Mux.scala 27:73]
  wire  s2_loadResp_ready = 1'h1; // @[LoadPipe_1.scala 221:27 235:26]
  wire  s2_loadResp_valid = _GEN_63 & (s2_loadMissClean | s2_loadMissDirty); // @[LoadPipe_1.scala 224:91]
  wire [31:0] s2_loadResp_bits_data = s2_readRespData; // @[Mux.scala 27:73]
  wire [1:0] s2_loadResp_bits_stageID = 2'h1; // @[LoadPipe_1.scala 221:27 226:30]
  Arbiter loadRespArb ( // @[LoadPipe_1.scala 234:29]
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
  Arbiter_1 tlbusReqArb ( // @[LoadPipe_1.scala 239:29]
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
  assign io_load_req_ready = ~s0_full; // @[LoadPipe_1.scala 42:26]
  assign io_load_resp_valid = loadRespArb_io_out_valid; // @[LoadPipe_1.scala 237:18]
  assign io_load_resp_bits_data = loadRespArb_io_out_bits_data; // @[LoadPipe_1.scala 237:18]
  assign io_load_resp_bits_stageID = loadRespArb_io_out_bits_stageID; // @[LoadPipe_1.scala 237:18]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[LoadPipe_1.scala 47:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[LoadPipe_1.scala 38:23]
  assign io_dir_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 186:67]
  assign io_dir_write_req_bits_addr = s2_rAddr; // @[LoadPipe_1.scala 213:32]
  assign io_dir_write_req_bits_way = s2_chosenWayOH; // @[LoadPipe_1.scala 214:31]
  assign io_dir_write_req_bits_meta = {1'h0,s2_refillFire}; // @[LoadPipe_1.scala 218:51]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[LoadPipe_1.scala 50:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:5]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 8'h1 << _GEN_0[4:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = io_tlbus_resp_bits_opcode == 3'h1 & _s1_valid_T_7; // @[LoadPipe_1.scala 186:67]
  assign io_dataBank_write_req_bits_data = io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 207:37]
  assign io_dataBank_write_req_bits_set = s2_rAddr[11:5]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_blockSelOH = 8'h1 << s2_beatCounter_value; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s2_chosenWayOH; // @[LoadPipe_1.scala 206:36]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[LoadPipe_1.scala 242:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[LoadPipe_1.scala 242:18]
  assign io_tlbus_req_bits_size = tlbusReqArb_io_out_bits_size; // @[LoadPipe_1.scala 242:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[LoadPipe_1.scala 242:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[LoadPipe_1.scala 242:18]
  assign io_tlbus_resp_ready = 1'h1; // @[LoadPipe_1.scala 184:25]
  assign loadRespArb_io_in_0_valid = s2_loadResp_valid; // @[LoadPipe_1.scala 235:26]
  assign loadRespArb_io_in_0_bits_data = _s2_readRespData_T_22; // @[LoadPipe_1.scala 235:26]
  assign loadRespArb_io_in_0_bits_stageID = s2_loadResp_bits_stageID; // @[LoadPipe_1.scala 235:26]
  assign loadRespArb_io_in_1_valid = s1_loadResp_valid; // @[LoadPipe_1.scala 236:26]
  assign loadRespArb_io_in_1_bits_data = _s1_rdData_T_22; // @[LoadPipe_1.scala 236:26]
  assign loadRespArb_io_in_1_bits_stageID = s1_loadResp_bits_stageID; // @[LoadPipe_1.scala 236:26]
  assign tlbusReqArb_io_in_0_valid = s2_loadMissDirty & ~s2_sendGet; // @[LoadPipe_1.scala 173:43]
  assign tlbusReqArb_io_in_0_bits_size = 32'h20; // @[LoadPipe_1.scala 170:27 178:27]
  assign tlbusReqArb_io_in_0_bits_address = {s2_rAddr[31:5],5'h0}; // @[Cat.scala 33:92]
  assign tlbusReqArb_io_in_1_valid = s1_full & (s1_loadMissClean & ~s1_putAllBeat | s1_loadMissDirty & ~s1_putAllBeat); // @[LoadPipe_1.scala 128:34]
  assign tlbusReqArb_io_in_1_bits_opcode = s1_loadMissClean ? 3'h4 : 3'h2; // @[LoadPipe_1.scala 130:35]
  assign tlbusReqArb_io_in_1_bits_size = 32'h20; // @[LoadPipe_1.scala 113:27 141:27]
  assign tlbusReqArb_io_in_1_bits_address = s1_loadMissDirty ? _s1_tlbusReq_bits_address_T_2 : blockAddr; // @[LoadPipe_1.scala 133:36]
  assign tlbusReqArb_io_in_1_bits_data = s1_loadMissDirty ? _s1_tlbusReq_bits_data_T_22 : 32'h0; // @[LoadPipe_1.scala 139:33]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[LoadPipe_1.scala 242:18]
  always @(posedge clock) begin
    if (reset) begin // @[LoadPipe_1.scala 34:26]
      s0_full <= 1'h0; // @[LoadPipe_1.scala 34:26]
    end else begin
      s0_full <= _GEN_2;
    end
    s0_valid_REG <= io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[LoadPipe_1.scala 65:30]
      s0_validReg <= 1'h0; // @[LoadPipe_1.scala 65:30]
    end else begin
      s0_validReg <= _GEN_4;
    end
    if (reset) begin // @[LoadPipe_1.scala 75:26]
      s1_full <= 1'h0; // @[LoadPipe_1.scala 75:26]
    end else begin
      s1_full <= _GEN_28;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_read_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_putAllBeat <= 1'h0; // @[Reg.scala 35:20]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 124:19]
      s1_putAllBeat <= 1'h0; // @[LoadPipe_1.scala 125:23]
    end else begin
      s1_putAllBeat <= _GEN_31;
    end
    if (reset) begin // @[LoadPipe_1.scala 154:26]
      s2_full <= 1'h0; // @[LoadPipe_1.scala 154:26]
    end else begin
      s2_full <= _GEN_42;
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
      s1_dirInfo_dirtyTag <= io_dir_read_resp_bits_dirtyTag; // @[Reg.scala 20:22]
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
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4 <= io_dataBank_read_resp_bits_data_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5 <= io_dataBank_read_resp_bits_data_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6 <= io_dataBank_read_resp_bits_data_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7 <= io_dataBank_read_resp_bits_data_7; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dataBlockSelOH <= s0_dataBlockSelOH; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s1_sendLoadResp <= 1'h0; // @[Reg.scala 35:20]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 104:19]
      s1_sendLoadResp <= 1'h0; // @[LoadPipe_1.scala 104:37]
    end else begin
      s1_sendLoadResp <= _GEN_29;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (_s1_valid_T_4 & s1_tlbusReq_bits_opcode == 3'h2) begin // @[LoadPipe_1.scala 119:71]
      s1_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
    end else if (_s1_valid_T_7 & _s1_valid_T_9) begin // @[LoadPipe_1.scala 121:79]
      s1_beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_rAddr <= s1_rAddr; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenWayOH <= s1_dirInfo_chosenWay; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_dataBlockSelOH <= s1_dataBlockSelOH; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s2_sendGet <= 1'h0; // @[Reg.scala 35:20]
    end else if (s2_fire) begin // @[LoadPipe_1.scala 172:19]
      s2_sendGet <= 1'h0; // @[LoadPipe_1.scala 172:32]
    end else begin
      s2_sendGet <= _GEN_43;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s2_beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (~s2_lastBeat & s2_refillFire) begin // @[LoadPipe_1.scala 190:41]
      s2_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
    end else if (s1_fire) begin // @[LoadPipe_1.scala 192:26]
      s2_beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_0 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h0 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_0 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_1 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h1 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_1 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_2 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h2 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_2 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_3 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h3 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_3 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_4 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h4 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_4 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_5 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h5 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_5 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (reset) begin // @[LoadPipe_1.scala 196:42]
      s2_refillBlockDataArray_6 <= 32'h0; // @[LoadPipe_1.scala 196:42]
    end else if (s2_refillFire) begin // @[LoadPipe_1.scala 197:25]
      if (3'h6 == s2_beatCounter_value) begin // @[LoadPipe_1.scala 197:73]
        s2_refillBlockDataArray_6 <= io_tlbus_resp_bits_data; // @[LoadPipe_1.scala 197:73]
      end
    end
    if (_s2_loadResp_valid_T_1) begin // @[util.scala 11:21]
      s2_loadResp_valid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      s2_loadResp_valid_holdReg <= _GEN_63;
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
  s1_dirInfo_chosenWay = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  s1_dirInfo_dirtyTag = _RAND_14[19:0];
  _RAND_15 = {8{`RANDOM}};
  s1_rdBlockData_0 = _RAND_15[255:0];
  _RAND_16 = {8{`RANDOM}};
  s1_rdBlockData_1 = _RAND_16[255:0];
  _RAND_17 = {8{`RANDOM}};
  s1_rdBlockData_2 = _RAND_17[255:0];
  _RAND_18 = {8{`RANDOM}};
  s1_rdBlockData_3 = _RAND_18[255:0];
  _RAND_19 = {8{`RANDOM}};
  s1_rdBlockData_4 = _RAND_19[255:0];
  _RAND_20 = {8{`RANDOM}};
  s1_rdBlockData_5 = _RAND_20[255:0];
  _RAND_21 = {8{`RANDOM}};
  s1_rdBlockData_6 = _RAND_21[255:0];
  _RAND_22 = {8{`RANDOM}};
  s1_rdBlockData_7 = _RAND_22[255:0];
  _RAND_23 = {1{`RANDOM}};
  s1_rdDataAll_0 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_rdDataAll_1 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_rdDataAll_2 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_rdDataAll_3 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s1_rdDataAll_4 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  s1_rdDataAll_5 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s1_rdDataAll_6 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_rdDataAll_7 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_dataBlockSelOH = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  s1_sendLoadResp = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  s2_rAddr = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s2_chosenWayOH = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  s2_dataBlockSelOH = _RAND_36[7:0];
  _RAND_37 = {1{`RANDOM}};
  s2_sendGet = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  s2_beatCounter_value = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  s2_refillBlockDataArray_0 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s2_refillBlockDataArray_1 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  s2_refillBlockDataArray_2 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  s2_refillBlockDataArray_3 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  s2_refillBlockDataArray_4 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  s2_refillBlockDataArray_5 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  s2_refillBlockDataArray_6 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  s2_loadResp_valid_holdReg = _RAND_46[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
