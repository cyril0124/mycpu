module DCache(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [31:0]  io_read_req_bits_addr,
  input          io_read_resp_ready,
  output         io_read_resp_valid,
  output [31:0]  io_read_resp_bits_data,
  output         io_write_req_ready,
  input          io_write_req_valid,
  input  [31:0]  io_write_req_bits_addr,
  input  [31:0]  io_write_req_bits_data,
  input  [3:0]   io_write_req_bits_mask,
  input          io_write_resp_ready,
  output         io_write_resp_valid,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [2:0]   io_tlbus_req_bits_opcode,
  output [31:0]  io_tlbus_req_bits_address,
  output [127:0] io_tlbus_req_bits_data,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [127:0] io_tlbus_resp_bits_data,
  input          io_flush
);
  wire  loadPipe_clock; // @[DCache.scala 82:26]
  wire  loadPipe_reset; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_req_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_load_req_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_resp_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_resp_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_load_resp_bits_data; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_req_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dir_req_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_resp_bits_hit; // @[DCache.scala 82:26]
  wire [3:0] loadPipe_io_dir_resp_bits_chosenWay; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_resp_bits_isDirtyWay; // @[DCache.scala 82:26]
  wire [18:0] loadPipe_io_dir_resp_bits_tagRdVec_0; // @[DCache.scala 82:26]
  wire [18:0] loadPipe_io_dir_resp_bits_tagRdVec_1; // @[DCache.scala 82:26]
  wire [18:0] loadPipe_io_dir_resp_bits_tagRdVec_2; // @[DCache.scala 82:26]
  wire [18:0] loadPipe_io_dir_resp_bits_tagRdVec_3; // @[DCache.scala 82:26]
  wire  loadPipe_io_dataBank_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_dataBank_req_valid; // @[DCache.scala 82:26]
  wire [8:0] loadPipe_io_dataBank_req_bits_set; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_0_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_0_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_0_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_0_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_1_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_1_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_1_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_1_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_2_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_2_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_2_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_2_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_3_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_3_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_3_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_3_3; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 82:26]
  wire [3:0] loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 82:26]
  wire [18:0] loadPipe_io_mshr_bits_dirtyTag; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_data_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_data_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_data_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_data_3; // @[DCache.scala 82:26]
  wire  storePipe_clock; // @[DCache.scala 83:27]
  wire  storePipe_reset; // @[DCache.scala 83:27]
  wire  storePipe_io_store_req_ready; // @[DCache.scala 83:27]
  wire  storePipe_io_store_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_store_req_bits_addr; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_store_req_bits_data; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_store_req_bits_mask; // @[DCache.scala 83:27]
  wire  storePipe_io_store_resp_ready; // @[DCache.scala 83:27]
  wire  storePipe_io_store_resp_valid; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_resp_bits_hit; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 83:27]
  wire [18:0] storePipe_io_dir_read_resp_bits_tagRdVec_0; // @[DCache.scala 83:27]
  wire [18:0] storePipe_io_dir_read_resp_bits_tagRdVec_1; // @[DCache.scala 83:27]
  wire [18:0] storePipe_io_dir_read_resp_bits_tagRdVec_2; // @[DCache.scala 83:27]
  wire [18:0] storePipe_io_dir_read_resp_bits_tagRdVec_3; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_write_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_dir_write_req_bits_way; // @[DCache.scala 83:27]
  wire  storePipe_io_dataBank_read_req_valid; // @[DCache.scala 83:27]
  wire [8:0] storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_0_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_0_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_0_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_0_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_1_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_1_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_1_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_1_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_2_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_2_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_2_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_2_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_3_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_3_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_3_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_3_3; // @[DCache.scala 83:27]
  wire  storePipe_io_dataBank_write_req_valid; // @[DCache.scala 83:27]
  wire [8:0] storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data_3; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_blockMask; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_ready; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_addr; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 83:27]
  wire [18:0] storePipe_io_mshr_bits_dirtyTag; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_storeData; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_mshr_bits_storeMask; // @[DCache.scala 83:27]
  wire  storePipe_io_flush; // @[DCache.scala 83:27]
  wire  mshr_clock; // @[DCache.scala 84:22]
  wire  mshr_reset; // @[DCache.scala 84:22]
  wire  mshr_io_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_addr; // @[DCache.scala 84:22]
  wire  mshr_io_req_bits_dirInfo_hit; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_req_bits_dirInfo_chosenWay; // @[DCache.scala 84:22]
  wire  mshr_io_req_bits_dirInfo_isDirtyWay; // @[DCache.scala 84:22]
  wire [18:0] mshr_io_req_bits_dirtyTag; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_data_0; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_data_1; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_data_2; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_data_3; // @[DCache.scala 84:22]
  wire  mshr_io_req_bits_isStore; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_storeData; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_req_bits_storeMask; // @[DCache.scala 84:22]
  wire  mshr_io_resp_load_ready; // @[DCache.scala 84:22]
  wire  mshr_io_resp_load_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_resp_load_bits_data; // @[DCache.scala 84:22]
  wire  mshr_io_resp_store_ready; // @[DCache.scala 84:22]
  wire  mshr_io_resp_store_valid; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_refill_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_refill_req_bits_addr; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_refill_resp_ready; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_refill_resp_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_refill_resp_bits_data; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_addr; // @[DCache.scala 84:22]
  wire [18:0] mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_0; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_1; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_2; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_3; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_resp_ready; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_resp_valid; // @[DCache.scala 84:22]
  wire  mshr_io_dirWrite_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_dirWrite_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dirWrite_req_bits_addr; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_dirWrite_req_bits_way; // @[DCache.scala 84:22]
  wire  mshr_io_dataWrite_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_dataWrite_req_valid; // @[DCache.scala 84:22]
  wire [8:0] mshr_io_dataWrite_req_bits_set; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data_0; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data_1; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data_2; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data_3; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_dataWrite_req_bits_blockMask; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_dataWrite_req_bits_way; // @[DCache.scala 84:22]
  wire  mshr_io_flush; // @[DCache.scala 84:22]
  wire  refillPipe_clock; // @[DCache.scala 85:28]
  wire  refillPipe_reset; // @[DCache.scala 85:28]
  wire  refillPipe_io_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[DCache.scala 85:28]
  wire [3:0] refillPipe_io_req_bits_chosenWay; // @[DCache.scala 85:28]
  wire  refillPipe_io_resp_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[DCache.scala 85:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[DCache.scala 85:28]
  wire [127:0] refillPipe_io_tlbus_resp_bits_data; // @[DCache.scala 85:28]
  wire  refillPipe_io_dirWrite_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[DCache.scala 85:28]
  wire [3:0] refillPipe_io_dirWrite_req_bits_way; // @[DCache.scala 85:28]
  wire  refillPipe_io_dataWrite_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[DCache.scala 85:28]
  wire [8:0] refillPipe_io_dataWrite_req_bits_set; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_0; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_1; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_2; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data_3; // @[DCache.scala 85:28]
  wire [3:0] refillPipe_io_dataWrite_req_bits_way; // @[DCache.scala 85:28]
  wire  wb_clock; // @[DCache.scala 86:20]
  wire  wb_reset; // @[DCache.scala 86:20]
  wire  wb_io_req_ready; // @[DCache.scala 86:20]
  wire  wb_io_req_valid; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_addr; // @[DCache.scala 86:20]
  wire [18:0] wb_io_req_bits_dirtyTag; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_0; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_1; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_2; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_3; // @[DCache.scala 86:20]
  wire  wb_io_resp_valid; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_req_ready; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_req_valid; // @[DCache.scala 86:20]
  wire [31:0] wb_io_tlbus_req_bits_address; // @[DCache.scala 86:20]
  wire [127:0] wb_io_tlbus_req_bits_data; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_resp_ready; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_resp_valid; // @[DCache.scala 86:20]
  wire  db_clock; // @[DCache.scala 87:20]
  wire  db_reset; // @[DCache.scala 87:20]
  wire [8:0] db_io_read_req_bits_set; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_0_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_0_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_0_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_0_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_1_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_1_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_1_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_1_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_2_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_2_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_2_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_2_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_3_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_3_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_3_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_3_3; // @[DCache.scala 87:20]
  wire  db_io_write_req_ready; // @[DCache.scala 87:20]
  wire  db_io_write_req_valid; // @[DCache.scala 87:20]
  wire [8:0] db_io_write_req_bits_set; // @[DCache.scala 87:20]
  wire [31:0] db_io_write_req_bits_data_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_write_req_bits_data_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_write_req_bits_data_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_write_req_bits_data_3; // @[DCache.scala 87:20]
  wire [3:0] db_io_write_req_bits_blockMask; // @[DCache.scala 87:20]
  wire [3:0] db_io_write_req_bits_way; // @[DCache.scala 87:20]
  wire  dir_clock; // @[DCache.scala 88:21]
  wire  dir_reset; // @[DCache.scala 88:21]
  wire  dir_io_read_req_valid; // @[DCache.scala 88:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[DCache.scala 88:21]
  wire  dir_io_read_resp_bits_hit; // @[DCache.scala 88:21]
  wire [3:0] dir_io_read_resp_bits_chosenWay; // @[DCache.scala 88:21]
  wire  dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 88:21]
  wire [18:0] dir_io_read_resp_bits_tagRdVec_0; // @[DCache.scala 88:21]
  wire [18:0] dir_io_read_resp_bits_tagRdVec_1; // @[DCache.scala 88:21]
  wire [18:0] dir_io_read_resp_bits_tagRdVec_2; // @[DCache.scala 88:21]
  wire [18:0] dir_io_read_resp_bits_tagRdVec_3; // @[DCache.scala 88:21]
  wire  dir_io_write_req_ready; // @[DCache.scala 88:21]
  wire  dir_io_write_req_valid; // @[DCache.scala 88:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[DCache.scala 88:21]
  wire [3:0] dir_io_write_req_bits_way; // @[DCache.scala 88:21]
  wire [1:0] dir_io_write_req_bits_meta; // @[DCache.scala 88:21]
  wire  mshrReqArb_io_in_0_ready; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_0_valid; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_0_bits_addr; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_0_bits_dirInfo_hit; // @[DCache.scala 109:28]
  wire [3:0] mshrReqArb_io_in_0_bits_dirInfo_chosenWay; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay; // @[DCache.scala 109:28]
  wire [18:0] mshrReqArb_io_in_0_bits_dirtyTag; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_0; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_1; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_2; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_3; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_1_ready; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_1_valid; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_addr; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_1_bits_dirInfo_hit; // @[DCache.scala 109:28]
  wire [3:0] mshrReqArb_io_in_1_bits_dirInfo_chosenWay; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay; // @[DCache.scala 109:28]
  wire [18:0] mshrReqArb_io_in_1_bits_dirtyTag; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_0; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_1; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_2; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_3; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_in_1_bits_storeData; // @[DCache.scala 109:28]
  wire [3:0] mshrReqArb_io_in_1_bits_storeMask; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_out_ready; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_out_valid; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_addr; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_out_bits_dirInfo_hit; // @[DCache.scala 109:28]
  wire [3:0] mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache.scala 109:28]
  wire [18:0] mshrReqArb_io_out_bits_dirtyTag; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_data_0; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_data_1; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_data_2; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_data_3; // @[DCache.scala 109:28]
  wire  mshrReqArb_io_out_bits_isStore; // @[DCache.scala 109:28]
  wire [31:0] mshrReqArb_io_out_bits_storeData; // @[DCache.scala 109:28]
  wire [3:0] mshrReqArb_io_out_bits_storeMask; // @[DCache.scala 109:28]
  wire  tlbusReqArb_io_in_0_ready; // @[DCache.scala 114:29]
  wire  tlbusReqArb_io_in_0_valid; // @[DCache.scala 114:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[DCache.scala 114:29]
  wire [127:0] tlbusReqArb_io_in_0_bits_data; // @[DCache.scala 114:29]
  wire  tlbusReqArb_io_in_1_ready; // @[DCache.scala 114:29]
  wire  tlbusReqArb_io_in_1_valid; // @[DCache.scala 114:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[DCache.scala 114:29]
  wire  tlbusReqArb_io_out_ready; // @[DCache.scala 114:29]
  wire  tlbusReqArb_io_out_valid; // @[DCache.scala 114:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[DCache.scala 114:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[DCache.scala 114:29]
  wire [127:0] tlbusReqArb_io_out_bits_data; // @[DCache.scala 114:29]
  wire  loadRespArb_io_in_0_ready; // @[DCache.scala 126:29]
  wire  loadRespArb_io_in_0_valid; // @[DCache.scala 126:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[DCache.scala 126:29]
  wire  loadRespArb_io_in_1_ready; // @[DCache.scala 126:29]
  wire  loadRespArb_io_in_1_valid; // @[DCache.scala 126:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[DCache.scala 126:29]
  wire  loadRespArb_io_out_ready; // @[DCache.scala 126:29]
  wire  loadRespArb_io_out_valid; // @[DCache.scala 126:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[DCache.scala 126:29]
  wire  storeRespArb_io_in_0_ready; // @[DCache.scala 131:30]
  wire  storeRespArb_io_in_0_valid; // @[DCache.scala 131:30]
  wire  storeRespArb_io_in_1_ready; // @[DCache.scala 131:30]
  wire  storeRespArb_io_in_1_valid; // @[DCache.scala 131:30]
  wire  storeRespArb_io_out_ready; // @[DCache.scala 131:30]
  wire  storeRespArb_io_out_valid; // @[DCache.scala 131:30]
  wire  dbRdReqArb_io_in_0_valid; // @[DCache.scala 137:28]
  wire [8:0] dbRdReqArb_io_in_0_bits_set; // @[DCache.scala 137:28]
  wire  dbRdReqArb_io_in_1_ready; // @[DCache.scala 137:28]
  wire [8:0] dbRdReqArb_io_in_1_bits_set; // @[DCache.scala 137:28]
  wire [8:0] dbRdReqArb_io_out_bits_set; // @[DCache.scala 137:28]
  wire  dirRdReqArb_io_in_0_valid; // @[DCache.scala 142:29]
  wire [31:0] dirRdReqArb_io_in_0_bits_addr; // @[DCache.scala 142:29]
  wire  dirRdReqArb_io_in_1_ready; // @[DCache.scala 142:29]
  wire  dirRdReqArb_io_in_1_valid; // @[DCache.scala 142:29]
  wire [31:0] dirRdReqArb_io_in_1_bits_addr; // @[DCache.scala 142:29]
  wire  dirRdReqArb_io_out_valid; // @[DCache.scala 142:29]
  wire [31:0] dirRdReqArb_io_out_bits_addr; // @[DCache.scala 142:29]
  wire  dataBankWrArb_io_in_0_valid; // @[DCache.scala 148:31]
  wire [8:0] dataBankWrArb_io_in_0_bits_set; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data_0; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data_1; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data_2; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data_3; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_in_0_bits_blockMask; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_in_0_bits_way; // @[DCache.scala 148:31]
  wire  dataBankWrArb_io_in_1_ready; // @[DCache.scala 148:31]
  wire  dataBankWrArb_io_in_1_valid; // @[DCache.scala 148:31]
  wire [8:0] dataBankWrArb_io_in_1_bits_set; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data_0; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data_1; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data_2; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data_3; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_in_1_bits_way; // @[DCache.scala 148:31]
  wire  dataBankWrArb_io_in_2_ready; // @[DCache.scala 148:31]
  wire  dataBankWrArb_io_in_2_valid; // @[DCache.scala 148:31]
  wire [8:0] dataBankWrArb_io_in_2_bits_set; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data_0; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data_1; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data_2; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data_3; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_in_2_bits_blockMask; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_in_2_bits_way; // @[DCache.scala 148:31]
  wire  dataBankWrArb_io_out_valid; // @[DCache.scala 148:31]
  wire [8:0] dataBankWrArb_io_out_bits_set; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_out_bits_data_0; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_out_bits_data_1; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_out_bits_data_2; // @[DCache.scala 148:31]
  wire [31:0] dataBankWrArb_io_out_bits_data_3; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_out_bits_blockMask; // @[DCache.scala 148:31]
  wire [3:0] dataBankWrArb_io_out_bits_way; // @[DCache.scala 148:31]
  wire  dirWrArb_io_in_0_valid; // @[DCache.scala 154:26]
  wire [31:0] dirWrArb_io_in_0_bits_addr; // @[DCache.scala 154:26]
  wire [3:0] dirWrArb_io_in_0_bits_way; // @[DCache.scala 154:26]
  wire  dirWrArb_io_in_1_ready; // @[DCache.scala 154:26]
  wire  dirWrArb_io_in_1_valid; // @[DCache.scala 154:26]
  wire [31:0] dirWrArb_io_in_1_bits_addr; // @[DCache.scala 154:26]
  wire [3:0] dirWrArb_io_in_1_bits_way; // @[DCache.scala 154:26]
  wire  dirWrArb_io_in_2_ready; // @[DCache.scala 154:26]
  wire  dirWrArb_io_in_2_valid; // @[DCache.scala 154:26]
  wire [31:0] dirWrArb_io_in_2_bits_addr; // @[DCache.scala 154:26]
  wire [3:0] dirWrArb_io_in_2_bits_way; // @[DCache.scala 154:26]
  wire  dirWrArb_io_out_valid; // @[DCache.scala 154:26]
  wire [31:0] dirWrArb_io_out_bits_addr; // @[DCache.scala 154:26]
  wire [3:0] dirWrArb_io_out_bits_way; // @[DCache.scala 154:26]
  wire [1:0] dirWrArb_io_out_bits_meta; // @[DCache.scala 154:26]
  LoadPipe loadPipe ( // @[DCache.scala 82:26]
    .clock(loadPipe_clock),
    .reset(loadPipe_reset),
    .io_load_req_ready(loadPipe_io_load_req_ready),
    .io_load_req_valid(loadPipe_io_load_req_valid),
    .io_load_req_bits_addr(loadPipe_io_load_req_bits_addr),
    .io_load_resp_ready(loadPipe_io_load_resp_ready),
    .io_load_resp_valid(loadPipe_io_load_resp_valid),
    .io_load_resp_bits_data(loadPipe_io_load_resp_bits_data),
    .io_dir_req_ready(loadPipe_io_dir_req_ready),
    .io_dir_req_valid(loadPipe_io_dir_req_valid),
    .io_dir_req_bits_addr(loadPipe_io_dir_req_bits_addr),
    .io_dir_resp_bits_hit(loadPipe_io_dir_resp_bits_hit),
    .io_dir_resp_bits_chosenWay(loadPipe_io_dir_resp_bits_chosenWay),
    .io_dir_resp_bits_isDirtyWay(loadPipe_io_dir_resp_bits_isDirtyWay),
    .io_dir_resp_bits_tagRdVec_0(loadPipe_io_dir_resp_bits_tagRdVec_0),
    .io_dir_resp_bits_tagRdVec_1(loadPipe_io_dir_resp_bits_tagRdVec_1),
    .io_dir_resp_bits_tagRdVec_2(loadPipe_io_dir_resp_bits_tagRdVec_2),
    .io_dir_resp_bits_tagRdVec_3(loadPipe_io_dir_resp_bits_tagRdVec_3),
    .io_dataBank_req_ready(loadPipe_io_dataBank_req_ready),
    .io_dataBank_req_valid(loadPipe_io_dataBank_req_valid),
    .io_dataBank_req_bits_set(loadPipe_io_dataBank_req_bits_set),
    .io_dataBank_resp_0_0(loadPipe_io_dataBank_resp_0_0),
    .io_dataBank_resp_0_1(loadPipe_io_dataBank_resp_0_1),
    .io_dataBank_resp_0_2(loadPipe_io_dataBank_resp_0_2),
    .io_dataBank_resp_0_3(loadPipe_io_dataBank_resp_0_3),
    .io_dataBank_resp_1_0(loadPipe_io_dataBank_resp_1_0),
    .io_dataBank_resp_1_1(loadPipe_io_dataBank_resp_1_1),
    .io_dataBank_resp_1_2(loadPipe_io_dataBank_resp_1_2),
    .io_dataBank_resp_1_3(loadPipe_io_dataBank_resp_1_3),
    .io_dataBank_resp_2_0(loadPipe_io_dataBank_resp_2_0),
    .io_dataBank_resp_2_1(loadPipe_io_dataBank_resp_2_1),
    .io_dataBank_resp_2_2(loadPipe_io_dataBank_resp_2_2),
    .io_dataBank_resp_2_3(loadPipe_io_dataBank_resp_2_3),
    .io_dataBank_resp_3_0(loadPipe_io_dataBank_resp_3_0),
    .io_dataBank_resp_3_1(loadPipe_io_dataBank_resp_3_1),
    .io_dataBank_resp_3_2(loadPipe_io_dataBank_resp_3_2),
    .io_dataBank_resp_3_3(loadPipe_io_dataBank_resp_3_3),
    .io_mshr_ready(loadPipe_io_mshr_ready),
    .io_mshr_valid(loadPipe_io_mshr_valid),
    .io_mshr_bits_addr(loadPipe_io_mshr_bits_addr),
    .io_mshr_bits_dirInfo_hit(loadPipe_io_mshr_bits_dirInfo_hit),
    .io_mshr_bits_dirInfo_chosenWay(loadPipe_io_mshr_bits_dirInfo_chosenWay),
    .io_mshr_bits_dirInfo_isDirtyWay(loadPipe_io_mshr_bits_dirInfo_isDirtyWay),
    .io_mshr_bits_dirtyTag(loadPipe_io_mshr_bits_dirtyTag),
    .io_mshr_bits_data_0(loadPipe_io_mshr_bits_data_0),
    .io_mshr_bits_data_1(loadPipe_io_mshr_bits_data_1),
    .io_mshr_bits_data_2(loadPipe_io_mshr_bits_data_2),
    .io_mshr_bits_data_3(loadPipe_io_mshr_bits_data_3)
  );
  StorePipe storePipe ( // @[DCache.scala 83:27]
    .clock(storePipe_clock),
    .reset(storePipe_reset),
    .io_store_req_ready(storePipe_io_store_req_ready),
    .io_store_req_valid(storePipe_io_store_req_valid),
    .io_store_req_bits_addr(storePipe_io_store_req_bits_addr),
    .io_store_req_bits_data(storePipe_io_store_req_bits_data),
    .io_store_req_bits_mask(storePipe_io_store_req_bits_mask),
    .io_store_resp_ready(storePipe_io_store_resp_ready),
    .io_store_resp_valid(storePipe_io_store_resp_valid),
    .io_dir_read_req_valid(storePipe_io_dir_read_req_valid),
    .io_dir_read_req_bits_addr(storePipe_io_dir_read_req_bits_addr),
    .io_dir_read_resp_bits_hit(storePipe_io_dir_read_resp_bits_hit),
    .io_dir_read_resp_bits_chosenWay(storePipe_io_dir_read_resp_bits_chosenWay),
    .io_dir_read_resp_bits_isDirtyWay(storePipe_io_dir_read_resp_bits_isDirtyWay),
    .io_dir_read_resp_bits_tagRdVec_0(storePipe_io_dir_read_resp_bits_tagRdVec_0),
    .io_dir_read_resp_bits_tagRdVec_1(storePipe_io_dir_read_resp_bits_tagRdVec_1),
    .io_dir_read_resp_bits_tagRdVec_2(storePipe_io_dir_read_resp_bits_tagRdVec_2),
    .io_dir_read_resp_bits_tagRdVec_3(storePipe_io_dir_read_resp_bits_tagRdVec_3),
    .io_dir_write_req_valid(storePipe_io_dir_write_req_valid),
    .io_dir_write_req_bits_addr(storePipe_io_dir_write_req_bits_addr),
    .io_dir_write_req_bits_way(storePipe_io_dir_write_req_bits_way),
    .io_dataBank_read_req_valid(storePipe_io_dataBank_read_req_valid),
    .io_dataBank_read_req_bits_set(storePipe_io_dataBank_read_req_bits_set),
    .io_dataBank_read_resp_0_0(storePipe_io_dataBank_read_resp_0_0),
    .io_dataBank_read_resp_0_1(storePipe_io_dataBank_read_resp_0_1),
    .io_dataBank_read_resp_0_2(storePipe_io_dataBank_read_resp_0_2),
    .io_dataBank_read_resp_0_3(storePipe_io_dataBank_read_resp_0_3),
    .io_dataBank_read_resp_1_0(storePipe_io_dataBank_read_resp_1_0),
    .io_dataBank_read_resp_1_1(storePipe_io_dataBank_read_resp_1_1),
    .io_dataBank_read_resp_1_2(storePipe_io_dataBank_read_resp_1_2),
    .io_dataBank_read_resp_1_3(storePipe_io_dataBank_read_resp_1_3),
    .io_dataBank_read_resp_2_0(storePipe_io_dataBank_read_resp_2_0),
    .io_dataBank_read_resp_2_1(storePipe_io_dataBank_read_resp_2_1),
    .io_dataBank_read_resp_2_2(storePipe_io_dataBank_read_resp_2_2),
    .io_dataBank_read_resp_2_3(storePipe_io_dataBank_read_resp_2_3),
    .io_dataBank_read_resp_3_0(storePipe_io_dataBank_read_resp_3_0),
    .io_dataBank_read_resp_3_1(storePipe_io_dataBank_read_resp_3_1),
    .io_dataBank_read_resp_3_2(storePipe_io_dataBank_read_resp_3_2),
    .io_dataBank_read_resp_3_3(storePipe_io_dataBank_read_resp_3_3),
    .io_dataBank_write_req_valid(storePipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_set(storePipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_data_0(storePipe_io_dataBank_write_req_bits_data_0),
    .io_dataBank_write_req_bits_data_1(storePipe_io_dataBank_write_req_bits_data_1),
    .io_dataBank_write_req_bits_data_2(storePipe_io_dataBank_write_req_bits_data_2),
    .io_dataBank_write_req_bits_data_3(storePipe_io_dataBank_write_req_bits_data_3),
    .io_dataBank_write_req_bits_blockMask(storePipe_io_dataBank_write_req_bits_blockMask),
    .io_dataBank_write_req_bits_way(storePipe_io_dataBank_write_req_bits_way),
    .io_mshr_ready(storePipe_io_mshr_ready),
    .io_mshr_valid(storePipe_io_mshr_valid),
    .io_mshr_bits_addr(storePipe_io_mshr_bits_addr),
    .io_mshr_bits_dirInfo_hit(storePipe_io_mshr_bits_dirInfo_hit),
    .io_mshr_bits_dirInfo_chosenWay(storePipe_io_mshr_bits_dirInfo_chosenWay),
    .io_mshr_bits_dirInfo_isDirtyWay(storePipe_io_mshr_bits_dirInfo_isDirtyWay),
    .io_mshr_bits_dirtyTag(storePipe_io_mshr_bits_dirtyTag),
    .io_mshr_bits_data_0(storePipe_io_mshr_bits_data_0),
    .io_mshr_bits_data_1(storePipe_io_mshr_bits_data_1),
    .io_mshr_bits_data_2(storePipe_io_mshr_bits_data_2),
    .io_mshr_bits_data_3(storePipe_io_mshr_bits_data_3),
    .io_mshr_bits_storeData(storePipe_io_mshr_bits_storeData),
    .io_mshr_bits_storeMask(storePipe_io_mshr_bits_storeMask),
    .io_flush(storePipe_io_flush)
  );
  MSHR mshr ( // @[DCache.scala 84:22]
    .clock(mshr_clock),
    .reset(mshr_reset),
    .io_req_ready(mshr_io_req_ready),
    .io_req_valid(mshr_io_req_valid),
    .io_req_bits_addr(mshr_io_req_bits_addr),
    .io_req_bits_dirInfo_hit(mshr_io_req_bits_dirInfo_hit),
    .io_req_bits_dirInfo_chosenWay(mshr_io_req_bits_dirInfo_chosenWay),
    .io_req_bits_dirInfo_isDirtyWay(mshr_io_req_bits_dirInfo_isDirtyWay),
    .io_req_bits_dirtyTag(mshr_io_req_bits_dirtyTag),
    .io_req_bits_data_0(mshr_io_req_bits_data_0),
    .io_req_bits_data_1(mshr_io_req_bits_data_1),
    .io_req_bits_data_2(mshr_io_req_bits_data_2),
    .io_req_bits_data_3(mshr_io_req_bits_data_3),
    .io_req_bits_isStore(mshr_io_req_bits_isStore),
    .io_req_bits_storeData(mshr_io_req_bits_storeData),
    .io_req_bits_storeMask(mshr_io_req_bits_storeMask),
    .io_resp_load_ready(mshr_io_resp_load_ready),
    .io_resp_load_valid(mshr_io_resp_load_valid),
    .io_resp_load_bits_data(mshr_io_resp_load_bits_data),
    .io_resp_store_ready(mshr_io_resp_store_ready),
    .io_resp_store_valid(mshr_io_resp_store_valid),
    .io_tasks_refill_req_valid(mshr_io_tasks_refill_req_valid),
    .io_tasks_refill_req_bits_addr(mshr_io_tasks_refill_req_bits_addr),
    .io_tasks_refill_req_bits_chosenWay(mshr_io_tasks_refill_req_bits_chosenWay),
    .io_tasks_refill_resp_ready(mshr_io_tasks_refill_resp_ready),
    .io_tasks_refill_resp_valid(mshr_io_tasks_refill_resp_valid),
    .io_tasks_refill_resp_bits_data(mshr_io_tasks_refill_resp_bits_data),
    .io_tasks_writeback_req_valid(mshr_io_tasks_writeback_req_valid),
    .io_tasks_writeback_req_bits_addr(mshr_io_tasks_writeback_req_bits_addr),
    .io_tasks_writeback_req_bits_dirtyTag(mshr_io_tasks_writeback_req_bits_dirtyTag),
    .io_tasks_writeback_req_bits_data_0(mshr_io_tasks_writeback_req_bits_data_0),
    .io_tasks_writeback_req_bits_data_1(mshr_io_tasks_writeback_req_bits_data_1),
    .io_tasks_writeback_req_bits_data_2(mshr_io_tasks_writeback_req_bits_data_2),
    .io_tasks_writeback_req_bits_data_3(mshr_io_tasks_writeback_req_bits_data_3),
    .io_tasks_writeback_resp_ready(mshr_io_tasks_writeback_resp_ready),
    .io_tasks_writeback_resp_valid(mshr_io_tasks_writeback_resp_valid),
    .io_dirWrite_req_ready(mshr_io_dirWrite_req_ready),
    .io_dirWrite_req_valid(mshr_io_dirWrite_req_valid),
    .io_dirWrite_req_bits_addr(mshr_io_dirWrite_req_bits_addr),
    .io_dirWrite_req_bits_way(mshr_io_dirWrite_req_bits_way),
    .io_dataWrite_req_ready(mshr_io_dataWrite_req_ready),
    .io_dataWrite_req_valid(mshr_io_dataWrite_req_valid),
    .io_dataWrite_req_bits_set(mshr_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_data_0(mshr_io_dataWrite_req_bits_data_0),
    .io_dataWrite_req_bits_data_1(mshr_io_dataWrite_req_bits_data_1),
    .io_dataWrite_req_bits_data_2(mshr_io_dataWrite_req_bits_data_2),
    .io_dataWrite_req_bits_data_3(mshr_io_dataWrite_req_bits_data_3),
    .io_dataWrite_req_bits_blockMask(mshr_io_dataWrite_req_bits_blockMask),
    .io_dataWrite_req_bits_way(mshr_io_dataWrite_req_bits_way),
    .io_flush(mshr_io_flush)
  );
  RefillPipe_1 refillPipe ( // @[DCache.scala 85:28]
    .clock(refillPipe_clock),
    .reset(refillPipe_reset),
    .io_req_ready(refillPipe_io_req_ready),
    .io_req_valid(refillPipe_io_req_valid),
    .io_req_bits_addr(refillPipe_io_req_bits_addr),
    .io_req_bits_chosenWay(refillPipe_io_req_bits_chosenWay),
    .io_resp_valid(refillPipe_io_resp_valid),
    .io_resp_bits_data(refillPipe_io_resp_bits_data),
    .io_tlbus_req_ready(refillPipe_io_tlbus_req_ready),
    .io_tlbus_req_valid(refillPipe_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(refillPipe_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(refillPipe_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(refillPipe_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(refillPipe_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(refillPipe_io_tlbus_resp_bits_data),
    .io_dirWrite_req_ready(refillPipe_io_dirWrite_req_ready),
    .io_dirWrite_req_valid(refillPipe_io_dirWrite_req_valid),
    .io_dirWrite_req_bits_addr(refillPipe_io_dirWrite_req_bits_addr),
    .io_dirWrite_req_bits_way(refillPipe_io_dirWrite_req_bits_way),
    .io_dataWrite_req_ready(refillPipe_io_dataWrite_req_ready),
    .io_dataWrite_req_valid(refillPipe_io_dataWrite_req_valid),
    .io_dataWrite_req_bits_set(refillPipe_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_data_0(refillPipe_io_dataWrite_req_bits_data_0),
    .io_dataWrite_req_bits_data_1(refillPipe_io_dataWrite_req_bits_data_1),
    .io_dataWrite_req_bits_data_2(refillPipe_io_dataWrite_req_bits_data_2),
    .io_dataWrite_req_bits_data_3(refillPipe_io_dataWrite_req_bits_data_3),
    .io_dataWrite_req_bits_way(refillPipe_io_dataWrite_req_bits_way)
  );
  WritebackQueue wb ( // @[DCache.scala 86:20]
    .clock(wb_clock),
    .reset(wb_reset),
    .io_req_ready(wb_io_req_ready),
    .io_req_valid(wb_io_req_valid),
    .io_req_bits_addr(wb_io_req_bits_addr),
    .io_req_bits_dirtyTag(wb_io_req_bits_dirtyTag),
    .io_req_bits_data_0(wb_io_req_bits_data_0),
    .io_req_bits_data_1(wb_io_req_bits_data_1),
    .io_req_bits_data_2(wb_io_req_bits_data_2),
    .io_req_bits_data_3(wb_io_req_bits_data_3),
    .io_resp_valid(wb_io_resp_valid),
    .io_tlbus_req_ready(wb_io_tlbus_req_ready),
    .io_tlbus_req_valid(wb_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(wb_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(wb_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(wb_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(wb_io_tlbus_resp_valid)
  );
  DataBankArray_1 db ( // @[DCache.scala 87:20]
    .clock(db_clock),
    .reset(db_reset),
    .io_read_req_bits_set(db_io_read_req_bits_set),
    .io_read_resp_0_0(db_io_read_resp_0_0),
    .io_read_resp_0_1(db_io_read_resp_0_1),
    .io_read_resp_0_2(db_io_read_resp_0_2),
    .io_read_resp_0_3(db_io_read_resp_0_3),
    .io_read_resp_1_0(db_io_read_resp_1_0),
    .io_read_resp_1_1(db_io_read_resp_1_1),
    .io_read_resp_1_2(db_io_read_resp_1_2),
    .io_read_resp_1_3(db_io_read_resp_1_3),
    .io_read_resp_2_0(db_io_read_resp_2_0),
    .io_read_resp_2_1(db_io_read_resp_2_1),
    .io_read_resp_2_2(db_io_read_resp_2_2),
    .io_read_resp_2_3(db_io_read_resp_2_3),
    .io_read_resp_3_0(db_io_read_resp_3_0),
    .io_read_resp_3_1(db_io_read_resp_3_1),
    .io_read_resp_3_2(db_io_read_resp_3_2),
    .io_read_resp_3_3(db_io_read_resp_3_3),
    .io_write_req_ready(db_io_write_req_ready),
    .io_write_req_valid(db_io_write_req_valid),
    .io_write_req_bits_set(db_io_write_req_bits_set),
    .io_write_req_bits_data_0(db_io_write_req_bits_data_0),
    .io_write_req_bits_data_1(db_io_write_req_bits_data_1),
    .io_write_req_bits_data_2(db_io_write_req_bits_data_2),
    .io_write_req_bits_data_3(db_io_write_req_bits_data_3),
    .io_write_req_bits_blockMask(db_io_write_req_bits_blockMask),
    .io_write_req_bits_way(db_io_write_req_bits_way)
  );
  DCacheDirectory_1 dir ( // @[DCache.scala 88:21]
    .clock(dir_clock),
    .reset(dir_reset),
    .io_read_req_valid(dir_io_read_req_valid),
    .io_read_req_bits_addr(dir_io_read_req_bits_addr),
    .io_read_resp_bits_hit(dir_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(dir_io_read_resp_bits_chosenWay),
    .io_read_resp_bits_isDirtyWay(dir_io_read_resp_bits_isDirtyWay),
    .io_read_resp_bits_tagRdVec_0(dir_io_read_resp_bits_tagRdVec_0),
    .io_read_resp_bits_tagRdVec_1(dir_io_read_resp_bits_tagRdVec_1),
    .io_read_resp_bits_tagRdVec_2(dir_io_read_resp_bits_tagRdVec_2),
    .io_read_resp_bits_tagRdVec_3(dir_io_read_resp_bits_tagRdVec_3),
    .io_write_req_ready(dir_io_write_req_ready),
    .io_write_req_valid(dir_io_write_req_valid),
    .io_write_req_bits_addr(dir_io_write_req_bits_addr),
    .io_write_req_bits_way(dir_io_write_req_bits_way),
    .io_write_req_bits_meta(dir_io_write_req_bits_meta)
  );
  Arbiter_1 mshrReqArb ( // @[DCache.scala 109:28]
    .io_in_0_ready(mshrReqArb_io_in_0_ready),
    .io_in_0_valid(mshrReqArb_io_in_0_valid),
    .io_in_0_bits_addr(mshrReqArb_io_in_0_bits_addr),
    .io_in_0_bits_dirInfo_hit(mshrReqArb_io_in_0_bits_dirInfo_hit),
    .io_in_0_bits_dirInfo_chosenWay(mshrReqArb_io_in_0_bits_dirInfo_chosenWay),
    .io_in_0_bits_dirInfo_isDirtyWay(mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay),
    .io_in_0_bits_dirtyTag(mshrReqArb_io_in_0_bits_dirtyTag),
    .io_in_0_bits_data_0(mshrReqArb_io_in_0_bits_data_0),
    .io_in_0_bits_data_1(mshrReqArb_io_in_0_bits_data_1),
    .io_in_0_bits_data_2(mshrReqArb_io_in_0_bits_data_2),
    .io_in_0_bits_data_3(mshrReqArb_io_in_0_bits_data_3),
    .io_in_1_ready(mshrReqArb_io_in_1_ready),
    .io_in_1_valid(mshrReqArb_io_in_1_valid),
    .io_in_1_bits_addr(mshrReqArb_io_in_1_bits_addr),
    .io_in_1_bits_dirInfo_hit(mshrReqArb_io_in_1_bits_dirInfo_hit),
    .io_in_1_bits_dirInfo_chosenWay(mshrReqArb_io_in_1_bits_dirInfo_chosenWay),
    .io_in_1_bits_dirInfo_isDirtyWay(mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay),
    .io_in_1_bits_dirtyTag(mshrReqArb_io_in_1_bits_dirtyTag),
    .io_in_1_bits_data_0(mshrReqArb_io_in_1_bits_data_0),
    .io_in_1_bits_data_1(mshrReqArb_io_in_1_bits_data_1),
    .io_in_1_bits_data_2(mshrReqArb_io_in_1_bits_data_2),
    .io_in_1_bits_data_3(mshrReqArb_io_in_1_bits_data_3),
    .io_in_1_bits_storeData(mshrReqArb_io_in_1_bits_storeData),
    .io_in_1_bits_storeMask(mshrReqArb_io_in_1_bits_storeMask),
    .io_out_ready(mshrReqArb_io_out_ready),
    .io_out_valid(mshrReqArb_io_out_valid),
    .io_out_bits_addr(mshrReqArb_io_out_bits_addr),
    .io_out_bits_dirInfo_hit(mshrReqArb_io_out_bits_dirInfo_hit),
    .io_out_bits_dirInfo_chosenWay(mshrReqArb_io_out_bits_dirInfo_chosenWay),
    .io_out_bits_dirInfo_isDirtyWay(mshrReqArb_io_out_bits_dirInfo_isDirtyWay),
    .io_out_bits_dirtyTag(mshrReqArb_io_out_bits_dirtyTag),
    .io_out_bits_data_0(mshrReqArb_io_out_bits_data_0),
    .io_out_bits_data_1(mshrReqArb_io_out_bits_data_1),
    .io_out_bits_data_2(mshrReqArb_io_out_bits_data_2),
    .io_out_bits_data_3(mshrReqArb_io_out_bits_data_3),
    .io_out_bits_isStore(mshrReqArb_io_out_bits_isStore),
    .io_out_bits_storeData(mshrReqArb_io_out_bits_storeData),
    .io_out_bits_storeMask(mshrReqArb_io_out_bits_storeMask)
  );
  Arbiter_2 tlbusReqArb ( // @[DCache.scala 114:29]
    .io_in_0_ready(tlbusReqArb_io_in_0_ready),
    .io_in_0_valid(tlbusReqArb_io_in_0_valid),
    .io_in_0_bits_address(tlbusReqArb_io_in_0_bits_address),
    .io_in_0_bits_data(tlbusReqArb_io_in_0_bits_data),
    .io_in_1_ready(tlbusReqArb_io_in_1_ready),
    .io_in_1_valid(tlbusReqArb_io_in_1_valid),
    .io_in_1_bits_address(tlbusReqArb_io_in_1_bits_address),
    .io_out_ready(tlbusReqArb_io_out_ready),
    .io_out_valid(tlbusReqArb_io_out_valid),
    .io_out_bits_opcode(tlbusReqArb_io_out_bits_opcode),
    .io_out_bits_address(tlbusReqArb_io_out_bits_address),
    .io_out_bits_data(tlbusReqArb_io_out_bits_data)
  );
  Arbiter_3 loadRespArb ( // @[DCache.scala 126:29]
    .io_in_0_ready(loadRespArb_io_in_0_ready),
    .io_in_0_valid(loadRespArb_io_in_0_valid),
    .io_in_0_bits_data(loadRespArb_io_in_0_bits_data),
    .io_in_1_ready(loadRespArb_io_in_1_ready),
    .io_in_1_valid(loadRespArb_io_in_1_valid),
    .io_in_1_bits_data(loadRespArb_io_in_1_bits_data),
    .io_out_ready(loadRespArb_io_out_ready),
    .io_out_valid(loadRespArb_io_out_valid),
    .io_out_bits_data(loadRespArb_io_out_bits_data)
  );
  Arbiter_4 storeRespArb ( // @[DCache.scala 131:30]
    .io_in_0_ready(storeRespArb_io_in_0_ready),
    .io_in_0_valid(storeRespArb_io_in_0_valid),
    .io_in_1_ready(storeRespArb_io_in_1_ready),
    .io_in_1_valid(storeRespArb_io_in_1_valid),
    .io_out_ready(storeRespArb_io_out_ready),
    .io_out_valid(storeRespArb_io_out_valid)
  );
  Arbiter_5 dbRdReqArb ( // @[DCache.scala 137:28]
    .io_in_0_valid(dbRdReqArb_io_in_0_valid),
    .io_in_0_bits_set(dbRdReqArb_io_in_0_bits_set),
    .io_in_1_ready(dbRdReqArb_io_in_1_ready),
    .io_in_1_bits_set(dbRdReqArb_io_in_1_bits_set),
    .io_out_bits_set(dbRdReqArb_io_out_bits_set)
  );
  Arbiter_6 dirRdReqArb ( // @[DCache.scala 142:29]
    .io_in_0_valid(dirRdReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirRdReqArb_io_in_0_bits_addr),
    .io_in_1_ready(dirRdReqArb_io_in_1_ready),
    .io_in_1_valid(dirRdReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirRdReqArb_io_in_1_bits_addr),
    .io_out_valid(dirRdReqArb_io_out_valid),
    .io_out_bits_addr(dirRdReqArb_io_out_bits_addr)
  );
  Arbiter_7 dataBankWrArb ( // @[DCache.scala 148:31]
    .io_in_0_valid(dataBankWrArb_io_in_0_valid),
    .io_in_0_bits_set(dataBankWrArb_io_in_0_bits_set),
    .io_in_0_bits_data_0(dataBankWrArb_io_in_0_bits_data_0),
    .io_in_0_bits_data_1(dataBankWrArb_io_in_0_bits_data_1),
    .io_in_0_bits_data_2(dataBankWrArb_io_in_0_bits_data_2),
    .io_in_0_bits_data_3(dataBankWrArb_io_in_0_bits_data_3),
    .io_in_0_bits_blockMask(dataBankWrArb_io_in_0_bits_blockMask),
    .io_in_0_bits_way(dataBankWrArb_io_in_0_bits_way),
    .io_in_1_ready(dataBankWrArb_io_in_1_ready),
    .io_in_1_valid(dataBankWrArb_io_in_1_valid),
    .io_in_1_bits_set(dataBankWrArb_io_in_1_bits_set),
    .io_in_1_bits_data_0(dataBankWrArb_io_in_1_bits_data_0),
    .io_in_1_bits_data_1(dataBankWrArb_io_in_1_bits_data_1),
    .io_in_1_bits_data_2(dataBankWrArb_io_in_1_bits_data_2),
    .io_in_1_bits_data_3(dataBankWrArb_io_in_1_bits_data_3),
    .io_in_1_bits_way(dataBankWrArb_io_in_1_bits_way),
    .io_in_2_ready(dataBankWrArb_io_in_2_ready),
    .io_in_2_valid(dataBankWrArb_io_in_2_valid),
    .io_in_2_bits_set(dataBankWrArb_io_in_2_bits_set),
    .io_in_2_bits_data_0(dataBankWrArb_io_in_2_bits_data_0),
    .io_in_2_bits_data_1(dataBankWrArb_io_in_2_bits_data_1),
    .io_in_2_bits_data_2(dataBankWrArb_io_in_2_bits_data_2),
    .io_in_2_bits_data_3(dataBankWrArb_io_in_2_bits_data_3),
    .io_in_2_bits_blockMask(dataBankWrArb_io_in_2_bits_blockMask),
    .io_in_2_bits_way(dataBankWrArb_io_in_2_bits_way),
    .io_out_valid(dataBankWrArb_io_out_valid),
    .io_out_bits_set(dataBankWrArb_io_out_bits_set),
    .io_out_bits_data_0(dataBankWrArb_io_out_bits_data_0),
    .io_out_bits_data_1(dataBankWrArb_io_out_bits_data_1),
    .io_out_bits_data_2(dataBankWrArb_io_out_bits_data_2),
    .io_out_bits_data_3(dataBankWrArb_io_out_bits_data_3),
    .io_out_bits_blockMask(dataBankWrArb_io_out_bits_blockMask),
    .io_out_bits_way(dataBankWrArb_io_out_bits_way)
  );
  Arbiter_8 dirWrArb ( // @[DCache.scala 154:26]
    .io_in_0_valid(dirWrArb_io_in_0_valid),
    .io_in_0_bits_addr(dirWrArb_io_in_0_bits_addr),
    .io_in_0_bits_way(dirWrArb_io_in_0_bits_way),
    .io_in_1_ready(dirWrArb_io_in_1_ready),
    .io_in_1_valid(dirWrArb_io_in_1_valid),
    .io_in_1_bits_addr(dirWrArb_io_in_1_bits_addr),
    .io_in_1_bits_way(dirWrArb_io_in_1_bits_way),
    .io_in_2_ready(dirWrArb_io_in_2_ready),
    .io_in_2_valid(dirWrArb_io_in_2_valid),
    .io_in_2_bits_addr(dirWrArb_io_in_2_bits_addr),
    .io_in_2_bits_way(dirWrArb_io_in_2_bits_way),
    .io_out_valid(dirWrArb_io_out_valid),
    .io_out_bits_addr(dirWrArb_io_out_bits_addr),
    .io_out_bits_way(dirWrArb_io_out_bits_way),
    .io_out_bits_meta(dirWrArb_io_out_bits_meta)
  );
  assign io_read_req_ready = loadPipe_io_load_req_ready; // @[DCache.scala 101:26]
  assign io_read_resp_valid = loadRespArb_io_out_valid; // @[DCache.scala 129:18]
  assign io_read_resp_bits_data = loadRespArb_io_out_bits_data; // @[DCache.scala 129:18]
  assign io_write_req_ready = storePipe_io_store_req_ready; // @[DCache.scala 102:28]
  assign io_write_resp_valid = storeRespArb_io_out_valid; // @[DCache.scala 134:19]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[DCache.scala 117:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[DCache.scala 117:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[DCache.scala 117:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[DCache.scala 117:18]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[DCache.scala 101:26]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[DCache.scala 101:26]
  assign loadPipe_io_load_resp_ready = loadRespArb_io_in_0_ready; // @[DCache.scala 127:26]
  assign loadPipe_io_dir_req_ready = dirRdReqArb_io_in_1_ready; // @[DCache.scala 144:26]
  assign loadPipe_io_dir_resp_bits_hit = dir_io_read_resp_bits_hit; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_chosenWay = dir_io_read_resp_bits_chosenWay; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_isDirtyWay = dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_tagRdVec_0 = dir_io_read_resp_bits_tagRdVec_0; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_tagRdVec_1 = dir_io_read_resp_bits_tagRdVec_1; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_tagRdVec_2 = dir_io_read_resp_bits_tagRdVec_2; // @[DCache.scala 94:31]
  assign loadPipe_io_dir_resp_bits_tagRdVec_3 = dir_io_read_resp_bits_tagRdVec_3; // @[DCache.scala 94:31]
  assign loadPipe_io_dataBank_req_ready = dbRdReqArb_io_in_1_ready; // @[DCache.scala 139:25]
  assign loadPipe_io_dataBank_resp_0_0 = db_io_read_resp_0_0; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_0_1 = db_io_read_resp_0_1; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_0_2 = db_io_read_resp_0_2; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_0_3 = db_io_read_resp_0_3; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_1_0 = db_io_read_resp_1_0; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_1_1 = db_io_read_resp_1_1; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_1_2 = db_io_read_resp_1_2; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_1_3 = db_io_read_resp_1_3; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_2_0 = db_io_read_resp_2_0; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_2_1 = db_io_read_resp_2_1; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_2_2 = db_io_read_resp_2_2; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_2_3 = db_io_read_resp_2_3; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_3_0 = db_io_read_resp_3_0; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_3_1 = db_io_read_resp_3_1; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_3_2 = db_io_read_resp_3_2; // @[DCache.scala 98:31]
  assign loadPipe_io_dataBank_resp_3_3 = db_io_read_resp_3_3; // @[DCache.scala 98:31]
  assign loadPipe_io_mshr_ready = mshrReqArb_io_in_0_ready; // @[DCache.scala 110:25]
  assign storePipe_clock = clock;
  assign storePipe_reset = reset;
  assign storePipe_io_store_req_valid = io_write_req_valid; // @[DCache.scala 102:28]
  assign storePipe_io_store_req_bits_addr = io_write_req_bits_addr; // @[DCache.scala 102:28]
  assign storePipe_io_store_req_bits_data = io_write_req_bits_data; // @[DCache.scala 102:28]
  assign storePipe_io_store_req_bits_mask = io_write_req_bits_mask; // @[DCache.scala 102:28]
  assign storePipe_io_store_resp_ready = storeRespArb_io_in_0_ready; // @[DCache.scala 132:27]
  assign storePipe_io_dir_read_resp_bits_hit = dir_io_read_resp_bits_hit; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_chosenWay = dir_io_read_resp_bits_chosenWay; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_isDirtyWay = dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_0 = dir_io_read_resp_bits_tagRdVec_0; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_1 = dir_io_read_resp_bits_tagRdVec_1; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_2 = dir_io_read_resp_bits_tagRdVec_2; // @[DCache.scala 96:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_3 = dir_io_read_resp_bits_tagRdVec_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_0_0 = db_io_read_resp_0_0; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_0_1 = db_io_read_resp_0_1; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_0_2 = db_io_read_resp_0_2; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_0_3 = db_io_read_resp_0_3; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_1_0 = db_io_read_resp_1_0; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_1_1 = db_io_read_resp_1_1; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_1_2 = db_io_read_resp_1_2; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_1_3 = db_io_read_resp_1_3; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_2_0 = db_io_read_resp_2_0; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_2_1 = db_io_read_resp_2_1; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_2_2 = db_io_read_resp_2_2; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_2_3 = db_io_read_resp_2_3; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_3_0 = db_io_read_resp_3_0; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_3_1 = db_io_read_resp_3_1; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_3_2 = db_io_read_resp_3_2; // @[DCache.scala 99:37]
  assign storePipe_io_dataBank_read_resp_3_3 = db_io_read_resp_3_3; // @[DCache.scala 99:37]
  assign storePipe_io_mshr_ready = mshrReqArb_io_in_1_ready; // @[DCache.scala 111:25]
  assign storePipe_io_flush = io_flush; // @[DCache.scala 90:24]
  assign mshr_clock = clock;
  assign mshr_reset = reset;
  assign mshr_io_req_valid = mshrReqArb_io_out_valid; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_addr = mshrReqArb_io_out_bits_addr; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_dirInfo_hit = mshrReqArb_io_out_bits_dirInfo_hit; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_dirInfo_chosenWay = mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_dirInfo_isDirtyWay = mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_dirtyTag = mshrReqArb_io_out_bits_dirtyTag; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_data_0 = mshrReqArb_io_out_bits_data_0; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_data_1 = mshrReqArb_io_out_bits_data_1; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_data_2 = mshrReqArb_io_out_bits_data_2; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_data_3 = mshrReqArb_io_out_bits_data_3; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_isStore = mshrReqArb_io_out_bits_isStore; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_storeData = mshrReqArb_io_out_bits_storeData; // @[DCache.scala 112:17]
  assign mshr_io_req_bits_storeMask = mshrReqArb_io_out_bits_storeMask; // @[DCache.scala 112:17]
  assign mshr_io_resp_load_ready = loadRespArb_io_in_1_ready; // @[DCache.scala 128:26]
  assign mshr_io_resp_store_ready = storeRespArb_io_in_1_ready; // @[DCache.scala 133:27]
  assign mshr_io_tasks_refill_resp_valid = refillPipe_io_resp_valid; // @[DCache.scala 105:31]
  assign mshr_io_tasks_refill_resp_bits_data = refillPipe_io_resp_bits_data; // @[DCache.scala 105:31]
  assign mshr_io_tasks_writeback_resp_valid = wb_io_resp_valid; // @[DCache.scala 107:34]
  assign mshr_io_dirWrite_req_ready = dirWrArb_io_in_2_ready; // @[DCache.scala 157:23]
  assign mshr_io_dataWrite_req_ready = dataBankWrArb_io_in_2_ready; // @[DCache.scala 151:28]
  assign mshr_io_flush = io_flush; // @[DCache.scala 91:19]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = mshr_io_tasks_refill_req_valid; // @[DCache.scala 104:30]
  assign refillPipe_io_req_bits_addr = mshr_io_tasks_refill_req_bits_addr; // @[DCache.scala 104:30]
  assign refillPipe_io_req_bits_chosenWay = mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache.scala 104:30]
  assign refillPipe_io_tlbus_req_ready = tlbusReqArb_io_in_1_ready; // @[DCache.scala 116:26]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 121:36]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[DCache.scala 122:35]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[DCache.scala 122:35]
  assign refillPipe_io_dirWrite_req_ready = dirWrArb_io_in_1_ready; // @[DCache.scala 156:23]
  assign refillPipe_io_dataWrite_req_ready = dataBankWrArb_io_in_1_ready; // @[DCache.scala 150:28]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_req_valid = mshr_io_tasks_writeback_req_valid; // @[DCache.scala 106:33]
  assign wb_io_req_bits_addr = mshr_io_tasks_writeback_req_bits_addr; // @[DCache.scala 106:33]
  assign wb_io_req_bits_dirtyTag = mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache.scala 106:33]
  assign wb_io_req_bits_data_0 = mshr_io_tasks_writeback_req_bits_data_0; // @[DCache.scala 106:33]
  assign wb_io_req_bits_data_1 = mshr_io_tasks_writeback_req_bits_data_1; // @[DCache.scala 106:33]
  assign wb_io_req_bits_data_2 = mshr_io_tasks_writeback_req_bits_data_2; // @[DCache.scala 106:33]
  assign wb_io_req_bits_data_3 = mshr_io_tasks_writeback_req_bits_data_3; // @[DCache.scala 106:33]
  assign wb_io_tlbus_req_ready = tlbusReqArb_io_in_0_ready; // @[DCache.scala 115:26]
  assign wb_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 119:28]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_bits_set = dbRdReqArb_io_out_bits_set; // @[DCache.scala 140:20]
  assign db_io_write_req_valid = dataBankWrArb_io_out_valid; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_set = dataBankWrArb_io_out_bits_set; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_data_0 = dataBankWrArb_io_out_bits_data_0; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_data_1 = dataBankWrArb_io_out_bits_data_1; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_data_2 = dataBankWrArb_io_out_bits_data_2; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_data_3 = dataBankWrArb_io_out_bits_data_3; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_blockMask = dataBankWrArb_io_out_bits_blockMask; // @[DCache.scala 152:21]
  assign db_io_write_req_bits_way = dataBankWrArb_io_out_bits_way; // @[DCache.scala 152:21]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = dirRdReqArb_io_out_valid; // @[DCache.scala 145:21]
  assign dir_io_read_req_bits_addr = dirRdReqArb_io_out_bits_addr; // @[DCache.scala 145:21]
  assign dir_io_write_req_valid = dirWrArb_io_out_valid; // @[DCache.scala 158:22]
  assign dir_io_write_req_bits_addr = dirWrArb_io_out_bits_addr; // @[DCache.scala 158:22]
  assign dir_io_write_req_bits_way = dirWrArb_io_out_bits_way; // @[DCache.scala 158:22]
  assign dir_io_write_req_bits_meta = dirWrArb_io_out_bits_meta; // @[DCache.scala 158:22]
  assign mshrReqArb_io_in_0_valid = loadPipe_io_mshr_valid; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_addr = loadPipe_io_mshr_bits_addr; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_hit = loadPipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_chosenWay = loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay = loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_dirtyTag = loadPipe_io_mshr_bits_dirtyTag; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_data_0 = loadPipe_io_mshr_bits_data_0; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_data_1 = loadPipe_io_mshr_bits_data_1; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_data_2 = loadPipe_io_mshr_bits_data_2; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_0_bits_data_3 = loadPipe_io_mshr_bits_data_3; // @[DCache.scala 110:25]
  assign mshrReqArb_io_in_1_valid = storePipe_io_mshr_valid; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_addr = storePipe_io_mshr_bits_addr; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_hit = storePipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_chosenWay = storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay = storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_dirtyTag = storePipe_io_mshr_bits_dirtyTag; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_data_0 = storePipe_io_mshr_bits_data_0; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_data_1 = storePipe_io_mshr_bits_data_1; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_data_2 = storePipe_io_mshr_bits_data_2; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_data_3 = storePipe_io_mshr_bits_data_3; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_storeData = storePipe_io_mshr_bits_storeData; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_bits_storeMask = storePipe_io_mshr_bits_storeMask; // @[DCache.scala 111:25]
  assign mshrReqArb_io_out_ready = mshr_io_req_ready; // @[DCache.scala 112:17]
  assign tlbusReqArb_io_in_0_valid = wb_io_tlbus_req_valid; // @[DCache.scala 115:26]
  assign tlbusReqArb_io_in_0_bits_address = wb_io_tlbus_req_bits_address; // @[DCache.scala 115:26]
  assign tlbusReqArb_io_in_0_bits_data = wb_io_tlbus_req_bits_data; // @[DCache.scala 115:26]
  assign tlbusReqArb_io_in_1_valid = refillPipe_io_tlbus_req_valid; // @[DCache.scala 116:26]
  assign tlbusReqArb_io_in_1_bits_address = refillPipe_io_tlbus_req_bits_address; // @[DCache.scala 116:26]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[DCache.scala 117:18]
  assign loadRespArb_io_in_0_valid = loadPipe_io_load_resp_valid; // @[DCache.scala 127:26]
  assign loadRespArb_io_in_0_bits_data = loadPipe_io_load_resp_bits_data; // @[DCache.scala 127:26]
  assign loadRespArb_io_in_1_valid = mshr_io_resp_load_valid; // @[DCache.scala 128:26]
  assign loadRespArb_io_in_1_bits_data = mshr_io_resp_load_bits_data; // @[DCache.scala 128:26]
  assign loadRespArb_io_out_ready = io_read_resp_ready; // @[DCache.scala 129:18]
  assign storeRespArb_io_in_0_valid = storePipe_io_store_resp_valid; // @[DCache.scala 132:27]
  assign storeRespArb_io_in_1_valid = mshr_io_resp_store_valid; // @[DCache.scala 133:27]
  assign storeRespArb_io_out_ready = io_write_resp_ready; // @[DCache.scala 134:19]
  assign dbRdReqArb_io_in_0_valid = storePipe_io_dataBank_read_req_valid; // @[DCache.scala 138:25]
  assign dbRdReqArb_io_in_0_bits_set = storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 138:25]
  assign dbRdReqArb_io_in_1_bits_set = loadPipe_io_dataBank_req_bits_set; // @[DCache.scala 139:25]
  assign dirRdReqArb_io_in_0_valid = storePipe_io_dir_read_req_valid; // @[DCache.scala 143:26]
  assign dirRdReqArb_io_in_0_bits_addr = storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 143:26]
  assign dirRdReqArb_io_in_1_valid = loadPipe_io_dir_req_valid; // @[DCache.scala 144:26]
  assign dirRdReqArb_io_in_1_bits_addr = loadPipe_io_dir_req_bits_addr; // @[DCache.scala 144:26]
  assign dataBankWrArb_io_in_0_valid = storePipe_io_dataBank_write_req_valid; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_set = storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_data_0 = storePipe_io_dataBank_write_req_bits_data_0; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_data_1 = storePipe_io_dataBank_write_req_bits_data_1; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_data_2 = storePipe_io_dataBank_write_req_bits_data_2; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_data_3 = storePipe_io_dataBank_write_req_bits_data_3; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_blockMask = storePipe_io_dataBank_write_req_bits_blockMask; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_0_bits_way = storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 149:28]
  assign dataBankWrArb_io_in_1_valid = refillPipe_io_dataWrite_req_valid; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_data_0 = refillPipe_io_dataWrite_req_bits_data_0; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_data_1 = refillPipe_io_dataWrite_req_bits_data_1; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_data_2 = refillPipe_io_dataWrite_req_bits_data_2; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_data_3 = refillPipe_io_dataWrite_req_bits_data_3; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_2_valid = mshr_io_dataWrite_req_valid; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_set = mshr_io_dataWrite_req_bits_set; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_data_0 = mshr_io_dataWrite_req_bits_data_0; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_data_1 = mshr_io_dataWrite_req_bits_data_1; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_data_2 = mshr_io_dataWrite_req_bits_data_2; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_data_3 = mshr_io_dataWrite_req_bits_data_3; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_blockMask = mshr_io_dataWrite_req_bits_blockMask; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_bits_way = mshr_io_dataWrite_req_bits_way; // @[DCache.scala 151:28]
  assign dirWrArb_io_in_0_valid = storePipe_io_dir_write_req_valid; // @[DCache.scala 155:23]
  assign dirWrArb_io_in_0_bits_addr = storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 155:23]
  assign dirWrArb_io_in_0_bits_way = storePipe_io_dir_write_req_bits_way; // @[DCache.scala 155:23]
  assign dirWrArb_io_in_1_valid = refillPipe_io_dirWrite_req_valid; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_1_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_1_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_2_valid = mshr_io_dirWrite_req_valid; // @[DCache.scala 157:23]
  assign dirWrArb_io_in_2_bits_addr = mshr_io_dirWrite_req_bits_addr; // @[DCache.scala 157:23]
  assign dirWrArb_io_in_2_bits_way = mshr_io_dirWrite_req_bits_way; // @[DCache.scala 157:23]
endmodule
