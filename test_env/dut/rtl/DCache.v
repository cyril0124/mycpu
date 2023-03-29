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
  output [31:0] io_tlbus_req_bits_size,
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
  wire  loadPipe_io_dir_read_resp_bits_hit; // @[DCache.scala 83:26]
  wire [7:0] loadPipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 83:26]
  wire [19:0] loadPipe_io_dir_read_resp_bits_dirtyTag; // @[DCache.scala 83:26]
  wire  loadPipe_io_dir_write_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dir_write_req_bits_addr; // @[DCache.scala 83:26]
  wire [7:0] loadPipe_io_dir_write_req_bits_way; // @[DCache.scala 83:26]
  wire [1:0] loadPipe_io_dir_write_req_bits_meta; // @[DCache.scala 83:26]
  wire  loadPipe_io_dataBank_read_req_valid; // @[DCache.scala 83:26]
  wire [7:0] loadPipe_io_dataBank_read_req_bits_set; // @[DCache.scala 83:26]
  wire [3:0] loadPipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_0; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_1; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_2; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_3; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_4; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_5; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_6; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_read_resp_bits_data_7; // @[DCache.scala 83:26]
  wire [255:0] loadPipe_io_dataBank_read_resp_bits_blockData_0; // @[DCache.scala 83:26]
  wire [255:0] loadPipe_io_dataBank_read_resp_bits_blockData_1; // @[DCache.scala 83:26]
  wire [255:0] loadPipe_io_dataBank_read_resp_bits_blockData_2; // @[DCache.scala 83:26]
  wire [255:0] loadPipe_io_dataBank_read_resp_bits_blockData_3; // @[DCache.scala 83:26]
  wire  loadPipe_io_dataBank_write_req_valid; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_dataBank_write_req_bits_data; // @[DCache.scala 83:26]
  wire [7:0] loadPipe_io_dataBank_write_req_bits_set; // @[DCache.scala 83:26]
  wire [3:0] loadPipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 83:26]
  wire [7:0] loadPipe_io_dataBank_write_req_bits_way; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_req_ready; // @[DCache.scala 83:26]
  wire  loadPipe_io_tlbus_req_valid; // @[DCache.scala 83:26]
  wire [2:0] loadPipe_io_tlbus_req_bits_opcode; // @[DCache.scala 83:26]
  wire [31:0] loadPipe_io_tlbus_req_bits_size; // @[DCache.scala 83:26]
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
  wire [7:0] storePipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 84:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_dirtyTag; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_write_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_dir_write_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 84:27]
  wire [7:0] storePipe_io_dir_write_req_bits_way; // @[DCache.scala 84:27]
  wire [1:0] storePipe_io_dir_write_req_bits_meta; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_read_req_valid; // @[DCache.scala 84:27]
  wire [7:0] storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache.scala 84:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_0; // @[DCache.scala 84:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_1; // @[DCache.scala 84:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_2; // @[DCache.scala 84:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_3; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_write_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_dataBank_write_req_valid; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data; // @[DCache.scala 84:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 84:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 84:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_mask; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_req_ready; // @[DCache.scala 84:27]
  wire  storePipe_io_tlbus_req_valid; // @[DCache.scala 84:27]
  wire [2:0] storePipe_io_tlbus_req_bits_opcode; // @[DCache.scala 84:27]
  wire [31:0] storePipe_io_tlbus_req_bits_size; // @[DCache.scala 84:27]
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
  wire [7:0] dataBankArray_io_read_req_bits_set; // @[DCache.scala 87:31]
  wire [3:0] dataBankArray_io_read_req_bits_blockSelOH; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_0; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_1; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_2; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_3; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_4; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_5; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_6; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_7; // @[DCache.scala 87:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 87:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 87:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_2; // @[DCache.scala 87:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_3; // @[DCache.scala 87:31]
  wire  dataBankArray_io_write_req_ready; // @[DCache.scala 87:31]
  wire  dataBankArray_io_write_req_valid; // @[DCache.scala 87:31]
  wire [31:0] dataBankArray_io_write_req_bits_data; // @[DCache.scala 87:31]
  wire [7:0] dataBankArray_io_write_req_bits_set; // @[DCache.scala 87:31]
  wire [3:0] dataBankArray_io_write_req_bits_blockSelOH; // @[DCache.scala 87:31]
  wire [7:0] dataBankArray_io_write_req_bits_way; // @[DCache.scala 87:31]
  wire [3:0] dataBankArray_io_write_req_bits_mask; // @[DCache.scala 87:31]
  wire  directory_clock; // @[DCache.scala 88:27]
  wire  directory_reset; // @[DCache.scala 88:27]
  wire  directory_io_read_req_ready; // @[DCache.scala 88:27]
  wire  directory_io_read_req_valid; // @[DCache.scala 88:27]
  wire [31:0] directory_io_read_req_bits_addr; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_valid; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_bits_hit; // @[DCache.scala 88:27]
  wire [7:0] directory_io_read_resp_bits_chosenWay; // @[DCache.scala 88:27]
  wire  directory_io_read_resp_bits_isDirtyWay; // @[DCache.scala 88:27]
  wire [19:0] directory_io_read_resp_bits_dirtyTag; // @[DCache.scala 88:27]
  wire  directory_io_write_req_ready; // @[DCache.scala 88:27]
  wire  directory_io_write_req_valid; // @[DCache.scala 88:27]
  wire [31:0] directory_io_write_req_bits_addr; // @[DCache.scala 88:27]
  wire [7:0] directory_io_write_req_bits_way; // @[DCache.scala 88:27]
  wire [1:0] directory_io_write_req_bits_meta; // @[DCache.scala 88:27]
  wire  dataBankReadReqArb_io_in_0_valid; // @[DCache.scala 176:36]
  wire [7:0] dataBankReadReqArb_io_in_0_bits_set; // @[DCache.scala 176:36]
  wire [3:0] dataBankReadReqArb_io_in_0_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankReadReqArb_io_in_1_valid; // @[DCache.scala 176:36]
  wire [7:0] dataBankReadReqArb_io_in_1_bits_set; // @[DCache.scala 176:36]
  wire [3:0] dataBankReadReqArb_io_in_1_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankReadReqArb_io_out_valid; // @[DCache.scala 176:36]
  wire [7:0] dataBankReadReqArb_io_out_bits_set; // @[DCache.scala 176:36]
  wire [3:0] dataBankReadReqArb_io_out_bits_blockSelOH; // @[DCache.scala 176:36]
  wire  dataBankWriteReqArb_io_in_0_ready; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_in_0_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_in_0_bits_data; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_in_0_bits_set; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_0_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_in_0_bits_way; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_0_bits_mask; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_in_1_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_in_1_bits_data; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_in_1_bits_set; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_1_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_in_1_bits_way; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_in_1_bits_mask; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_out_ready; // @[DCache.scala 181:37]
  wire  dataBankWriteReqArb_io_out_valid; // @[DCache.scala 181:37]
  wire [31:0] dataBankWriteReqArb_io_out_bits_data; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_out_bits_set; // @[DCache.scala 181:37]
  wire [3:0] dataBankWriteReqArb_io_out_bits_blockSelOH; // @[DCache.scala 181:37]
  wire [7:0] dataBankWriteReqArb_io_out_bits_way; // @[DCache.scala 181:37]
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
  wire [7:0] dirWriteReqArb_io_in_0_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_in_0_bits_meta; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_in_1_valid; // @[DCache.scala 191:32]
  wire [31:0] dirWriteReqArb_io_in_1_bits_addr; // @[DCache.scala 191:32]
  wire [7:0] dirWriteReqArb_io_in_1_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_in_1_bits_meta; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_out_ready; // @[DCache.scala 191:32]
  wire  dirWriteReqArb_io_out_valid; // @[DCache.scala 191:32]
  wire [31:0] dirWriteReqArb_io_out_bits_addr; // @[DCache.scala 191:32]
  wire [7:0] dirWriteReqArb_io_out_bits_way; // @[DCache.scala 191:32]
  wire [1:0] dirWriteReqArb_io_out_bits_meta; // @[DCache.scala 191:32]
  reg [3:0] tlbusPendingOpcode; // @[DCache.scala 124:37]
  reg  tlbusPendingAck; // @[DCache.scala 125:34]
  reg [1:0] tlbusReqBeatCounter; // @[DCache.scala 126:38]
  reg [1:0] tlbusRespBeatCounter; // @[DCache.scala 127:39]
  wire  _T = io_tlbus_req_ready & io_tlbus_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _tlbusReqBeatCounter_T_1 = tlbusReqBeatCounter + 2'h1; // @[DCache.scala 129:52]
  wire  _T_1 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _tlbusRespBeatCounter_T_1 = tlbusRespBeatCounter + 2'h1; // @[DCache.scala 133:54]
  wire [2:0] _GEN_31 = {{1'd0}, tlbusRespBeatCounter}; // @[DCache.scala 140:89]
  wire  _GEN_4 = _T_1 & tlbusPendingOpcode == 4'h4 & _GEN_31 != 3'h4 ? 1'h0 : tlbusPendingAck; // @[DCache.scala 140:112 141:25 125:34]
  wire  _GEN_5 = _T_1 & tlbusPendingOpcode == 4'h2 ? 1'h0 : _GEN_4; // @[DCache.scala 138:74 139:25]
  wire  _GEN_6 = _T | _GEN_5; // @[DCache.scala 136:29 137:25]
  wire  _T_12 = ~tlbusPendingAck; // @[DCache.scala 147:46]
  wire [2:0] _GEN_32 = {{1'd0}, tlbusReqBeatCounter}; // @[DCache.scala 148:74]
  wire  _T_15 = _GEN_32 != 3'h4; // @[DCache.scala 148:74]
  wire  _T_16 = storePipe_io_tlbus_req_bits_opcode == 3'h2 & _GEN_32 != 3'h4; // @[DCache.scala 148:51]
  wire  _T_17 = storePipe_io_tlbus_req_bits_opcode == 3'h4 & ~tlbusPendingAck | _T_16; // @[DCache.scala 147:64]
  wire  _T_18 = storePipe_io_tlbus_req_valid & _T_17; // @[DCache.scala 146:25]
  wire  _T_24 = loadPipe_io_tlbus_req_bits_opcode == 3'h2 & _T_15; // @[DCache.scala 159:50]
  wire  _T_25 = loadPipe_io_tlbus_req_bits_opcode == 3'h4 & _T_12 | _T_24; // @[DCache.scala 158:63]
  wire  _T_26 = loadPipe_io_tlbus_req_valid & _T_25; // @[DCache.scala 157:30]
  wire  _GEN_7 = loadPipe_io_tlbus_req_valid; // @[DCache.scala 161:7 162:28]
  wire [2:0] _GEN_8 = loadPipe_io_tlbus_req_bits_opcode; // @[DCache.scala 161:7 163:27]
  wire [31:0] _GEN_10 = loadPipe_io_tlbus_req_bits_size; // @[DCache.scala 161:7 163:27]
  wire [31:0] _GEN_12 = loadPipe_io_tlbus_req_bits_address; // @[DCache.scala 161:7 163:27]
  wire [31:0] _GEN_15 = loadPipe_io_tlbus_req_bits_data; // @[DCache.scala 161:7 163:27]
  wire  _GEN_16 = _T_26 & io_tlbus_req_ready; // @[DCache.scala 161:7 164:23 171:23]
  LoadPipe_1_1 loadPipe ( // @[DCache.scala 83:26]
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
    .io_dir_read_resp_bits_hit(loadPipe_io_dir_read_resp_bits_hit),
    .io_dir_read_resp_bits_chosenWay(loadPipe_io_dir_read_resp_bits_chosenWay),
    .io_dir_read_resp_bits_isDirtyWay(loadPipe_io_dir_read_resp_bits_isDirtyWay),
    .io_dir_read_resp_bits_dirtyTag(loadPipe_io_dir_read_resp_bits_dirtyTag),
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
    .io_dataBank_read_resp_bits_data_4(loadPipe_io_dataBank_read_resp_bits_data_4),
    .io_dataBank_read_resp_bits_data_5(loadPipe_io_dataBank_read_resp_bits_data_5),
    .io_dataBank_read_resp_bits_data_6(loadPipe_io_dataBank_read_resp_bits_data_6),
    .io_dataBank_read_resp_bits_data_7(loadPipe_io_dataBank_read_resp_bits_data_7),
    .io_dataBank_read_resp_bits_blockData_0(loadPipe_io_dataBank_read_resp_bits_blockData_0),
    .io_dataBank_read_resp_bits_blockData_1(loadPipe_io_dataBank_read_resp_bits_blockData_1),
    .io_dataBank_read_resp_bits_blockData_2(loadPipe_io_dataBank_read_resp_bits_blockData_2),
    .io_dataBank_read_resp_bits_blockData_3(loadPipe_io_dataBank_read_resp_bits_blockData_3),
    .io_dataBank_write_req_valid(loadPipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(loadPipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(loadPipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(loadPipe_io_dataBank_write_req_bits_blockSelOH),
    .io_dataBank_write_req_bits_way(loadPipe_io_dataBank_write_req_bits_way),
    .io_tlbus_req_ready(loadPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(loadPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(loadPipe_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_size(loadPipe_io_tlbus_req_bits_size),
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
    .io_dir_read_resp_bits_dirtyTag(storePipe_io_dir_read_resp_bits_dirtyTag),
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
    .io_dataBank_read_resp_bits_blockData_2(storePipe_io_dataBank_read_resp_bits_blockData_2),
    .io_dataBank_read_resp_bits_blockData_3(storePipe_io_dataBank_read_resp_bits_blockData_3),
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
    .io_tlbus_req_bits_size(storePipe_io_tlbus_req_bits_size),
    .io_tlbus_req_bits_address(storePipe_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(storePipe_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(storePipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(storePipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(storePipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(storePipe_io_tlbus_resp_bits_data)
  );
  DataBankArray_1 dataBankArray ( // @[DCache.scala 87:31]
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
    .io_read_resp_bits_data_4(dataBankArray_io_read_resp_bits_data_4),
    .io_read_resp_bits_data_5(dataBankArray_io_read_resp_bits_data_5),
    .io_read_resp_bits_data_6(dataBankArray_io_read_resp_bits_data_6),
    .io_read_resp_bits_data_7(dataBankArray_io_read_resp_bits_data_7),
    .io_read_resp_bits_blockData_0(dataBankArray_io_read_resp_bits_blockData_0),
    .io_read_resp_bits_blockData_1(dataBankArray_io_read_resp_bits_blockData_1),
    .io_read_resp_bits_blockData_2(dataBankArray_io_read_resp_bits_blockData_2),
    .io_read_resp_bits_blockData_3(dataBankArray_io_read_resp_bits_blockData_3),
    .io_write_req_ready(dataBankArray_io_write_req_ready),
    .io_write_req_valid(dataBankArray_io_write_req_valid),
    .io_write_req_bits_data(dataBankArray_io_write_req_bits_data),
    .io_write_req_bits_set(dataBankArray_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(dataBankArray_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(dataBankArray_io_write_req_bits_way),
    .io_write_req_bits_mask(dataBankArray_io_write_req_bits_mask)
  );
  DCacheDirectory_1 directory ( // @[DCache.scala 88:27]
    .clock(directory_clock),
    .reset(directory_reset),
    .io_read_req_ready(directory_io_read_req_ready),
    .io_read_req_valid(directory_io_read_req_valid),
    .io_read_req_bits_addr(directory_io_read_req_bits_addr),
    .io_read_resp_valid(directory_io_read_resp_valid),
    .io_read_resp_bits_hit(directory_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(directory_io_read_resp_bits_chosenWay),
    .io_read_resp_bits_isDirtyWay(directory_io_read_resp_bits_isDirtyWay),
    .io_read_resp_bits_dirtyTag(directory_io_read_resp_bits_dirtyTag),
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
  assign io_tlbus_req_bits_size = _T_18 ? storePipe_io_tlbus_req_bits_size : _GEN_10; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_req_bits_address = _T_18 ? storePipe_io_tlbus_req_bits_address : _GEN_12; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_req_bits_data = _T_18 ? storePipe_io_tlbus_req_bits_data : _GEN_15; // @[DCache.scala 150:7 152:27]
  assign io_tlbus_resp_ready = 1'h1; // @[DCache.scala 121:29]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[DCache.scala 113:22]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[DCache.scala 113:22]
  assign loadPipe_io_dir_read_resp_bits_hit = directory_io_read_resp_bits_hit; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[DCache.scala 115:31]
  assign loadPipe_io_dir_read_resp_bits_dirtyTag = directory_io_read_resp_bits_dirtyTag; // @[DCache.scala 115:31]
  assign loadPipe_io_dataBank_read_resp_bits_data_0 = dataBankArray_io_read_resp_bits_data_0; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_1 = dataBankArray_io_read_resp_bits_data_1; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_2 = dataBankArray_io_read_resp_bits_data_2; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_3 = dataBankArray_io_read_resp_bits_data_3; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_4 = dataBankArray_io_read_resp_bits_data_4; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_5 = dataBankArray_io_read_resp_bits_data_5; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_6 = dataBankArray_io_read_resp_bits_data_6; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_data_7 = dataBankArray_io_read_resp_bits_data_7; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_2 = dataBankArray_io_read_resp_bits_blockData_2; // @[DCache.scala 114:36]
  assign loadPipe_io_dataBank_read_resp_bits_blockData_3 = dataBankArray_io_read_resp_bits_blockData_3; // @[DCache.scala 114:36]
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
  assign storePipe_io_dir_read_resp_bits_dirtyTag = directory_io_read_resp_bits_dirtyTag; // @[DCache.scala 120:32]
  assign storePipe_io_dir_write_req_ready = dirWriteReqArb_io_in_0_ready; // @[DCache.scala 192:29]
  assign storePipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache.scala 119:37]
  assign storePipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache.scala 119:37]
  assign storePipe_io_dataBank_read_resp_bits_blockData_2 = dataBankArray_io_read_resp_bits_blockData_2; // @[DCache.scala 119:37]
  assign storePipe_io_dataBank_read_resp_bits_blockData_3 = dataBankArray_io_read_resp_bits_blockData_3; // @[DCache.scala 119:37]
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
      tlbusReqBeatCounter <= 2'h0; // @[DCache.scala 126:38]
    end else if (_T) begin // @[DCache.scala 128:29]
      tlbusReqBeatCounter <= _tlbusReqBeatCounter_T_1; // @[DCache.scala 129:29]
    end else if (_T_1) begin // @[DCache.scala 131:36]
      tlbusReqBeatCounter <= 2'h0; // @[DCache.scala 132:29]
    end
    if (reset) begin // @[DCache.scala 127:39]
      tlbusRespBeatCounter <= 2'h0; // @[DCache.scala 127:39]
    end else if (_T) begin // @[DCache.scala 128:29]
      tlbusRespBeatCounter <= 2'h0; // @[DCache.scala 130:30]
    end else if (_T_1) begin // @[DCache.scala 131:36]
      tlbusRespBeatCounter <= _tlbusRespBeatCounter_T_1; // @[DCache.scala 133:30]
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
  tlbusReqBeatCounter = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  tlbusRespBeatCounter = _RAND_3[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
