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
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data
);
  wire  loadPipe_clock; // @[DCache.scala 82:26]
  wire  loadPipe_reset; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_req_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_load_req_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_load_resp_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_load_resp_bits_data; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_req_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dir_req_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_resp_bits_hit; // @[DCache.scala 82:26]
  wire [7:0] loadPipe_io_dir_resp_bits_chosenWay; // @[DCache.scala 82:26]
  wire  loadPipe_io_dir_resp_bits_isDirtyWay; // @[DCache.scala 82:26]
  wire  loadPipe_io_dataBank_req_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_dataBank_req_valid; // @[DCache.scala 82:26]
  wire [7:0] loadPipe_io_dataBank_req_bits_set; // @[DCache.scala 82:26]
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
  wire [31:0] loadPipe_io_dataBank_resp_4_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_4_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_4_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_4_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_5_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_5_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_5_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_5_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_6_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_6_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_6_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_6_3; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_7_0; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_7_1; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_7_2; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_dataBank_resp_7_3; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_ready; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_valid; // @[DCache.scala 82:26]
  wire [31:0] loadPipe_io_mshr_bits_addr; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 82:26]
  wire [7:0] loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 82:26]
  wire  loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 82:26]
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
  wire  storePipe_io_store_resp_valid; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_resp_bits_hit; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_dir_read_resp_bits_chosenWay; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_0; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_1; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_2; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_3; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_4; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_5; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_6; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_tagRdVec_7; // @[DCache.scala 83:27]
  wire  storePipe_io_dir_write_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_dir_write_req_bits_way; // @[DCache.scala 83:27]
  wire  storePipe_io_dataBank_read_req_valid; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 83:27]
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
  wire [31:0] storePipe_io_dataBank_read_resp_4_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_4_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_4_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_4_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_5_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_5_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_5_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_5_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_6_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_6_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_6_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_6_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_7_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_7_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_7_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_read_resp_7_3; // @[DCache.scala 83:27]
  wire  storePipe_io_dataBank_write_req_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_ready; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_valid; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_addr; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 83:27]
  wire [7:0] storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 83:27]
  wire  storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 83:27]
  wire [19:0] storePipe_io_mshr_bits_dirtyTag; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_0; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_1; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_2; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_data_3; // @[DCache.scala 83:27]
  wire [31:0] storePipe_io_mshr_bits_storeData; // @[DCache.scala 83:27]
  wire [3:0] storePipe_io_mshr_bits_storeMask; // @[DCache.scala 83:27]
  wire  mshr_clock; // @[DCache.scala 84:22]
  wire  mshr_reset; // @[DCache.scala 84:22]
  wire  mshr_io_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_req_bits_addr; // @[DCache.scala 84:22]
  wire  mshr_io_req_bits_dirInfo_hit; // @[DCache.scala 84:22]
  wire [7:0] mshr_io_req_bits_dirInfo_chosenWay; // @[DCache.scala 84:22]
  wire  mshr_io_req_bits_dirInfo_isDirtyWay; // @[DCache.scala 84:22]
  wire [19:0] mshr_io_req_bits_dirtyTag; // @[DCache.scala 84:22]
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
  wire [7:0] mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_refill_resp_ready; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_refill_resp_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_refill_resp_bits_data; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_addr; // @[DCache.scala 84:22]
  wire [19:0] mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_0; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_1; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_2; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_3; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_resp_ready; // @[DCache.scala 84:22]
  wire  mshr_io_tasks_writeback_resp_valid; // @[DCache.scala 84:22]
  wire  mshr_io_dirWrite_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_dirWrite_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dirWrite_req_bits_addr; // @[DCache.scala 84:22]
  wire [7:0] mshr_io_dirWrite_req_bits_way; // @[DCache.scala 84:22]
  wire  mshr_io_dataWrite_req_ready; // @[DCache.scala 84:22]
  wire  mshr_io_dataWrite_req_valid; // @[DCache.scala 84:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data; // @[DCache.scala 84:22]
  wire [7:0] mshr_io_dataWrite_req_bits_set; // @[DCache.scala 84:22]
  wire [3:0] mshr_io_dataWrite_req_bits_blockSelOH; // @[DCache.scala 84:22]
  wire [7:0] mshr_io_dataWrite_req_bits_way; // @[DCache.scala 84:22]
  wire  refillPipe_clock; // @[DCache.scala 85:28]
  wire  refillPipe_reset; // @[DCache.scala 85:28]
  wire  refillPipe_io_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[DCache.scala 85:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[DCache.scala 85:28]
  wire  refillPipe_io_resp_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[DCache.scala 85:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_tlbus_resp_bits_data; // @[DCache.scala 85:28]
  wire  refillPipe_io_dirWrite_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[DCache.scala 85:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[DCache.scala 85:28]
  wire  refillPipe_io_dataWrite_req_ready; // @[DCache.scala 85:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[DCache.scala 85:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data; // @[DCache.scala 85:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_set; // @[DCache.scala 85:28]
  wire [3:0] refillPipe_io_dataWrite_req_bits_blockSelOH; // @[DCache.scala 85:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[DCache.scala 85:28]
  wire  wb_clock; // @[DCache.scala 86:20]
  wire  wb_reset; // @[DCache.scala 86:20]
  wire  wb_io_req_ready; // @[DCache.scala 86:20]
  wire  wb_io_req_valid; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_addr; // @[DCache.scala 86:20]
  wire [19:0] wb_io_req_bits_dirtyTag; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_0; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_1; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_2; // @[DCache.scala 86:20]
  wire [31:0] wb_io_req_bits_data_3; // @[DCache.scala 86:20]
  wire  wb_io_resp_valid; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_req_ready; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_req_valid; // @[DCache.scala 86:20]
  wire [31:0] wb_io_tlbus_req_bits_address; // @[DCache.scala 86:20]
  wire [31:0] wb_io_tlbus_req_bits_data; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_resp_ready; // @[DCache.scala 86:20]
  wire  wb_io_tlbus_resp_valid; // @[DCache.scala 86:20]
  wire  db_clock; // @[DCache.scala 87:20]
  wire  db_reset; // @[DCache.scala 87:20]
  wire  db_io_read_req_ready; // @[DCache.scala 87:20]
  wire  db_io_read_req_valid; // @[DCache.scala 87:20]
  wire [7:0] db_io_read_req_bits_set; // @[DCache.scala 87:20]
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
  wire [31:0] db_io_read_resp_4_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_4_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_4_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_4_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_5_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_5_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_5_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_5_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_6_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_6_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_6_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_6_3; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_7_0; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_7_1; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_7_2; // @[DCache.scala 87:20]
  wire [31:0] db_io_read_resp_7_3; // @[DCache.scala 87:20]
  wire  db_io_write_req_ready; // @[DCache.scala 87:20]
  wire  db_io_write_req_valid; // @[DCache.scala 87:20]
  wire [31:0] db_io_write_req_bits_data; // @[DCache.scala 87:20]
  wire [7:0] db_io_write_req_bits_set; // @[DCache.scala 87:20]
  wire [3:0] db_io_write_req_bits_blockSelOH; // @[DCache.scala 87:20]
  wire [7:0] db_io_write_req_bits_way; // @[DCache.scala 87:20]
  wire  dir_clock; // @[DCache.scala 88:21]
  wire  dir_reset; // @[DCache.scala 88:21]
  wire  dir_io_read_req_ready; // @[DCache.scala 88:21]
  wire  dir_io_read_req_valid; // @[DCache.scala 88:21]
  wire [31:0] dir_io_read_req_bits_addr; // @[DCache.scala 88:21]
  wire  dir_io_read_resp_bits_hit; // @[DCache.scala 88:21]
  wire [7:0] dir_io_read_resp_bits_chosenWay; // @[DCache.scala 88:21]
  wire  dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_0; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_1; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_2; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_3; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_4; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_5; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_6; // @[DCache.scala 88:21]
  wire [19:0] dir_io_read_resp_bits_tagRdVec_7; // @[DCache.scala 88:21]
  wire  dir_io_write_req_ready; // @[DCache.scala 88:21]
  wire  dir_io_write_req_valid; // @[DCache.scala 88:21]
  wire [31:0] dir_io_write_req_bits_addr; // @[DCache.scala 88:21]
  wire [7:0] dir_io_write_req_bits_way; // @[DCache.scala 88:21]
  wire [1:0] dir_io_write_req_bits_meta; // @[DCache.scala 88:21]
  wire  mshrReqArb_io_in_0_ready; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_0_valid; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_0_bits_addr; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_0_bits_dirInfo_hit; // @[DCache.scala 110:28]
  wire [7:0] mshrReqArb_io_in_0_bits_dirInfo_chosenWay; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_0; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_1; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_2; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_3; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_1_ready; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_1_valid; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_addr; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_1_bits_dirInfo_hit; // @[DCache.scala 110:28]
  wire [7:0] mshrReqArb_io_in_1_bits_dirInfo_chosenWay; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay; // @[DCache.scala 110:28]
  wire [19:0] mshrReqArb_io_in_1_bits_dirtyTag; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_0; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_1; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_2; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_3; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_in_1_bits_storeData; // @[DCache.scala 110:28]
  wire [3:0] mshrReqArb_io_in_1_bits_storeMask; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_out_ready; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_out_valid; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_addr; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_out_bits_dirInfo_hit; // @[DCache.scala 110:28]
  wire [7:0] mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache.scala 110:28]
  wire [19:0] mshrReqArb_io_out_bits_dirtyTag; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_data_0; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_data_1; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_data_2; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_data_3; // @[DCache.scala 110:28]
  wire  mshrReqArb_io_out_bits_isStore; // @[DCache.scala 110:28]
  wire [31:0] mshrReqArb_io_out_bits_storeData; // @[DCache.scala 110:28]
  wire [3:0] mshrReqArb_io_out_bits_storeMask; // @[DCache.scala 110:28]
  wire  tlbusReqArb_io_in_0_ready; // @[DCache.scala 115:29]
  wire  tlbusReqArb_io_in_0_valid; // @[DCache.scala 115:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[DCache.scala 115:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_data; // @[DCache.scala 115:29]
  wire  tlbusReqArb_io_in_1_ready; // @[DCache.scala 115:29]
  wire  tlbusReqArb_io_in_1_valid; // @[DCache.scala 115:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[DCache.scala 115:29]
  wire  tlbusReqArb_io_out_ready; // @[DCache.scala 115:29]
  wire  tlbusReqArb_io_out_valid; // @[DCache.scala 115:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[DCache.scala 115:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[DCache.scala 115:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[DCache.scala 115:29]
  wire  loadRespArb_io_in_0_valid; // @[DCache.scala 127:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[DCache.scala 127:29]
  wire  loadRespArb_io_in_1_ready; // @[DCache.scala 127:29]
  wire  loadRespArb_io_in_1_valid; // @[DCache.scala 127:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[DCache.scala 127:29]
  wire  loadRespArb_io_out_valid; // @[DCache.scala 127:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[DCache.scala 127:29]
  wire  storeRespArb_io_in_0_valid; // @[DCache.scala 132:30]
  wire  storeRespArb_io_in_1_ready; // @[DCache.scala 132:30]
  wire  storeRespArb_io_in_1_valid; // @[DCache.scala 132:30]
  wire  storeRespArb_io_out_valid; // @[DCache.scala 132:30]
  wire  dbRdReqArb_io_in_0_valid; // @[DCache.scala 138:28]
  wire [7:0] dbRdReqArb_io_in_0_bits_set; // @[DCache.scala 138:28]
  wire  dbRdReqArb_io_in_1_ready; // @[DCache.scala 138:28]
  wire  dbRdReqArb_io_in_1_valid; // @[DCache.scala 138:28]
  wire [7:0] dbRdReqArb_io_in_1_bits_set; // @[DCache.scala 138:28]
  wire  dbRdReqArb_io_out_valid; // @[DCache.scala 138:28]
  wire [7:0] dbRdReqArb_io_out_bits_set; // @[DCache.scala 138:28]
  wire  dirRdReqArb_io_in_0_valid; // @[DCache.scala 143:29]
  wire [31:0] dirRdReqArb_io_in_0_bits_addr; // @[DCache.scala 143:29]
  wire  dirRdReqArb_io_in_1_ready; // @[DCache.scala 143:29]
  wire  dirRdReqArb_io_in_1_valid; // @[DCache.scala 143:29]
  wire [31:0] dirRdReqArb_io_in_1_bits_addr; // @[DCache.scala 143:29]
  wire  dirRdReqArb_io_out_valid; // @[DCache.scala 143:29]
  wire [31:0] dirRdReqArb_io_out_bits_addr; // @[DCache.scala 143:29]
  wire  dataBankWrArb_io_in_0_valid; // @[DCache.scala 149:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_0_bits_set; // @[DCache.scala 149:31]
  wire [3:0] dataBankWrArb_io_in_0_bits_blockSelOH; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_0_bits_way; // @[DCache.scala 149:31]
  wire  dataBankWrArb_io_in_1_ready; // @[DCache.scala 149:31]
  wire  dataBankWrArb_io_in_1_valid; // @[DCache.scala 149:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_1_bits_set; // @[DCache.scala 149:31]
  wire [3:0] dataBankWrArb_io_in_1_bits_blockSelOH; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_1_bits_way; // @[DCache.scala 149:31]
  wire  dataBankWrArb_io_in_2_ready; // @[DCache.scala 149:31]
  wire  dataBankWrArb_io_in_2_valid; // @[DCache.scala 149:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_2_bits_set; // @[DCache.scala 149:31]
  wire [3:0] dataBankWrArb_io_in_2_bits_blockSelOH; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_in_2_bits_way; // @[DCache.scala 149:31]
  wire  dataBankWrArb_io_out_valid; // @[DCache.scala 149:31]
  wire [31:0] dataBankWrArb_io_out_bits_data; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_out_bits_set; // @[DCache.scala 149:31]
  wire [3:0] dataBankWrArb_io_out_bits_blockSelOH; // @[DCache.scala 149:31]
  wire [7:0] dataBankWrArb_io_out_bits_way; // @[DCache.scala 149:31]
  wire  dirWrArb_io_in_0_valid; // @[DCache.scala 155:26]
  wire [31:0] dirWrArb_io_in_0_bits_addr; // @[DCache.scala 155:26]
  wire [7:0] dirWrArb_io_in_0_bits_way; // @[DCache.scala 155:26]
  wire  dirWrArb_io_in_1_ready; // @[DCache.scala 155:26]
  wire  dirWrArb_io_in_1_valid; // @[DCache.scala 155:26]
  wire [31:0] dirWrArb_io_in_1_bits_addr; // @[DCache.scala 155:26]
  wire [7:0] dirWrArb_io_in_1_bits_way; // @[DCache.scala 155:26]
  wire  dirWrArb_io_in_2_ready; // @[DCache.scala 155:26]
  wire  dirWrArb_io_in_2_valid; // @[DCache.scala 155:26]
  wire [31:0] dirWrArb_io_in_2_bits_addr; // @[DCache.scala 155:26]
  wire [7:0] dirWrArb_io_in_2_bits_way; // @[DCache.scala 155:26]
  wire  dirWrArb_io_out_valid; // @[DCache.scala 155:26]
  wire [31:0] dirWrArb_io_out_bits_addr; // @[DCache.scala 155:26]
  wire [7:0] dirWrArb_io_out_bits_way; // @[DCache.scala 155:26]
  wire [1:0] dirWrArb_io_out_bits_meta; // @[DCache.scala 155:26]
  LoadPipe loadPipe ( // @[DCache.scala 82:26]
    .clock(loadPipe_clock),
    .reset(loadPipe_reset),
    .io_load_req_ready(loadPipe_io_load_req_ready),
    .io_load_req_valid(loadPipe_io_load_req_valid),
    .io_load_req_bits_addr(loadPipe_io_load_req_bits_addr),
    .io_load_resp_valid(loadPipe_io_load_resp_valid),
    .io_load_resp_bits_data(loadPipe_io_load_resp_bits_data),
    .io_dir_req_ready(loadPipe_io_dir_req_ready),
    .io_dir_req_valid(loadPipe_io_dir_req_valid),
    .io_dir_req_bits_addr(loadPipe_io_dir_req_bits_addr),
    .io_dir_resp_bits_hit(loadPipe_io_dir_resp_bits_hit),
    .io_dir_resp_bits_chosenWay(loadPipe_io_dir_resp_bits_chosenWay),
    .io_dir_resp_bits_isDirtyWay(loadPipe_io_dir_resp_bits_isDirtyWay),
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
    .io_dataBank_resp_4_0(loadPipe_io_dataBank_resp_4_0),
    .io_dataBank_resp_4_1(loadPipe_io_dataBank_resp_4_1),
    .io_dataBank_resp_4_2(loadPipe_io_dataBank_resp_4_2),
    .io_dataBank_resp_4_3(loadPipe_io_dataBank_resp_4_3),
    .io_dataBank_resp_5_0(loadPipe_io_dataBank_resp_5_0),
    .io_dataBank_resp_5_1(loadPipe_io_dataBank_resp_5_1),
    .io_dataBank_resp_5_2(loadPipe_io_dataBank_resp_5_2),
    .io_dataBank_resp_5_3(loadPipe_io_dataBank_resp_5_3),
    .io_dataBank_resp_6_0(loadPipe_io_dataBank_resp_6_0),
    .io_dataBank_resp_6_1(loadPipe_io_dataBank_resp_6_1),
    .io_dataBank_resp_6_2(loadPipe_io_dataBank_resp_6_2),
    .io_dataBank_resp_6_3(loadPipe_io_dataBank_resp_6_3),
    .io_dataBank_resp_7_0(loadPipe_io_dataBank_resp_7_0),
    .io_dataBank_resp_7_1(loadPipe_io_dataBank_resp_7_1),
    .io_dataBank_resp_7_2(loadPipe_io_dataBank_resp_7_2),
    .io_dataBank_resp_7_3(loadPipe_io_dataBank_resp_7_3),
    .io_mshr_ready(loadPipe_io_mshr_ready),
    .io_mshr_valid(loadPipe_io_mshr_valid),
    .io_mshr_bits_addr(loadPipe_io_mshr_bits_addr),
    .io_mshr_bits_dirInfo_hit(loadPipe_io_mshr_bits_dirInfo_hit),
    .io_mshr_bits_dirInfo_chosenWay(loadPipe_io_mshr_bits_dirInfo_chosenWay),
    .io_mshr_bits_dirInfo_isDirtyWay(loadPipe_io_mshr_bits_dirInfo_isDirtyWay),
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
    .io_dir_read_resp_bits_tagRdVec_4(storePipe_io_dir_read_resp_bits_tagRdVec_4),
    .io_dir_read_resp_bits_tagRdVec_5(storePipe_io_dir_read_resp_bits_tagRdVec_5),
    .io_dir_read_resp_bits_tagRdVec_6(storePipe_io_dir_read_resp_bits_tagRdVec_6),
    .io_dir_read_resp_bits_tagRdVec_7(storePipe_io_dir_read_resp_bits_tagRdVec_7),
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
    .io_dataBank_read_resp_4_0(storePipe_io_dataBank_read_resp_4_0),
    .io_dataBank_read_resp_4_1(storePipe_io_dataBank_read_resp_4_1),
    .io_dataBank_read_resp_4_2(storePipe_io_dataBank_read_resp_4_2),
    .io_dataBank_read_resp_4_3(storePipe_io_dataBank_read_resp_4_3),
    .io_dataBank_read_resp_5_0(storePipe_io_dataBank_read_resp_5_0),
    .io_dataBank_read_resp_5_1(storePipe_io_dataBank_read_resp_5_1),
    .io_dataBank_read_resp_5_2(storePipe_io_dataBank_read_resp_5_2),
    .io_dataBank_read_resp_5_3(storePipe_io_dataBank_read_resp_5_3),
    .io_dataBank_read_resp_6_0(storePipe_io_dataBank_read_resp_6_0),
    .io_dataBank_read_resp_6_1(storePipe_io_dataBank_read_resp_6_1),
    .io_dataBank_read_resp_6_2(storePipe_io_dataBank_read_resp_6_2),
    .io_dataBank_read_resp_6_3(storePipe_io_dataBank_read_resp_6_3),
    .io_dataBank_read_resp_7_0(storePipe_io_dataBank_read_resp_7_0),
    .io_dataBank_read_resp_7_1(storePipe_io_dataBank_read_resp_7_1),
    .io_dataBank_read_resp_7_2(storePipe_io_dataBank_read_resp_7_2),
    .io_dataBank_read_resp_7_3(storePipe_io_dataBank_read_resp_7_3),
    .io_dataBank_write_req_valid(storePipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(storePipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(storePipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(storePipe_io_dataBank_write_req_bits_blockSelOH),
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
    .io_mshr_bits_storeMask(storePipe_io_mshr_bits_storeMask)
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
    .io_dataWrite_req_bits_data(mshr_io_dataWrite_req_bits_data),
    .io_dataWrite_req_bits_set(mshr_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_blockSelOH(mshr_io_dataWrite_req_bits_blockSelOH),
    .io_dataWrite_req_bits_way(mshr_io_dataWrite_req_bits_way)
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
    .io_dataWrite_req_bits_data(refillPipe_io_dataWrite_req_bits_data),
    .io_dataWrite_req_bits_set(refillPipe_io_dataWrite_req_bits_set),
    .io_dataWrite_req_bits_blockSelOH(refillPipe_io_dataWrite_req_bits_blockSelOH),
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
    .io_read_req_ready(db_io_read_req_ready),
    .io_read_req_valid(db_io_read_req_valid),
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
    .io_read_resp_4_0(db_io_read_resp_4_0),
    .io_read_resp_4_1(db_io_read_resp_4_1),
    .io_read_resp_4_2(db_io_read_resp_4_2),
    .io_read_resp_4_3(db_io_read_resp_4_3),
    .io_read_resp_5_0(db_io_read_resp_5_0),
    .io_read_resp_5_1(db_io_read_resp_5_1),
    .io_read_resp_5_2(db_io_read_resp_5_2),
    .io_read_resp_5_3(db_io_read_resp_5_3),
    .io_read_resp_6_0(db_io_read_resp_6_0),
    .io_read_resp_6_1(db_io_read_resp_6_1),
    .io_read_resp_6_2(db_io_read_resp_6_2),
    .io_read_resp_6_3(db_io_read_resp_6_3),
    .io_read_resp_7_0(db_io_read_resp_7_0),
    .io_read_resp_7_1(db_io_read_resp_7_1),
    .io_read_resp_7_2(db_io_read_resp_7_2),
    .io_read_resp_7_3(db_io_read_resp_7_3),
    .io_write_req_ready(db_io_write_req_ready),
    .io_write_req_valid(db_io_write_req_valid),
    .io_write_req_bits_data(db_io_write_req_bits_data),
    .io_write_req_bits_set(db_io_write_req_bits_set),
    .io_write_req_bits_blockSelOH(db_io_write_req_bits_blockSelOH),
    .io_write_req_bits_way(db_io_write_req_bits_way)
  );
  DCacheDirectory_1 dir ( // @[DCache.scala 88:21]
    .clock(dir_clock),
    .reset(dir_reset),
    .io_read_req_ready(dir_io_read_req_ready),
    .io_read_req_valid(dir_io_read_req_valid),
    .io_read_req_bits_addr(dir_io_read_req_bits_addr),
    .io_read_resp_bits_hit(dir_io_read_resp_bits_hit),
    .io_read_resp_bits_chosenWay(dir_io_read_resp_bits_chosenWay),
    .io_read_resp_bits_isDirtyWay(dir_io_read_resp_bits_isDirtyWay),
    .io_read_resp_bits_tagRdVec_0(dir_io_read_resp_bits_tagRdVec_0),
    .io_read_resp_bits_tagRdVec_1(dir_io_read_resp_bits_tagRdVec_1),
    .io_read_resp_bits_tagRdVec_2(dir_io_read_resp_bits_tagRdVec_2),
    .io_read_resp_bits_tagRdVec_3(dir_io_read_resp_bits_tagRdVec_3),
    .io_read_resp_bits_tagRdVec_4(dir_io_read_resp_bits_tagRdVec_4),
    .io_read_resp_bits_tagRdVec_5(dir_io_read_resp_bits_tagRdVec_5),
    .io_read_resp_bits_tagRdVec_6(dir_io_read_resp_bits_tagRdVec_6),
    .io_read_resp_bits_tagRdVec_7(dir_io_read_resp_bits_tagRdVec_7),
    .io_write_req_ready(dir_io_write_req_ready),
    .io_write_req_valid(dir_io_write_req_valid),
    .io_write_req_bits_addr(dir_io_write_req_bits_addr),
    .io_write_req_bits_way(dir_io_write_req_bits_way),
    .io_write_req_bits_meta(dir_io_write_req_bits_meta)
  );
  Arbiter mshrReqArb ( // @[DCache.scala 110:28]
    .io_in_0_ready(mshrReqArb_io_in_0_ready),
    .io_in_0_valid(mshrReqArb_io_in_0_valid),
    .io_in_0_bits_addr(mshrReqArb_io_in_0_bits_addr),
    .io_in_0_bits_dirInfo_hit(mshrReqArb_io_in_0_bits_dirInfo_hit),
    .io_in_0_bits_dirInfo_chosenWay(mshrReqArb_io_in_0_bits_dirInfo_chosenWay),
    .io_in_0_bits_dirInfo_isDirtyWay(mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay),
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
  Arbiter_1 tlbusReqArb ( // @[DCache.scala 115:29]
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
  Arbiter_2 loadRespArb ( // @[DCache.scala 127:29]
    .io_in_0_valid(loadRespArb_io_in_0_valid),
    .io_in_0_bits_data(loadRespArb_io_in_0_bits_data),
    .io_in_1_ready(loadRespArb_io_in_1_ready),
    .io_in_1_valid(loadRespArb_io_in_1_valid),
    .io_in_1_bits_data(loadRespArb_io_in_1_bits_data),
    .io_out_valid(loadRespArb_io_out_valid),
    .io_out_bits_data(loadRespArb_io_out_bits_data)
  );
  Arbiter_3 storeRespArb ( // @[DCache.scala 132:30]
    .io_in_0_valid(storeRespArb_io_in_0_valid),
    .io_in_1_ready(storeRespArb_io_in_1_ready),
    .io_in_1_valid(storeRespArb_io_in_1_valid),
    .io_out_valid(storeRespArb_io_out_valid)
  );
  Arbiter_4 dbRdReqArb ( // @[DCache.scala 138:28]
    .io_in_0_valid(dbRdReqArb_io_in_0_valid),
    .io_in_0_bits_set(dbRdReqArb_io_in_0_bits_set),
    .io_in_1_ready(dbRdReqArb_io_in_1_ready),
    .io_in_1_valid(dbRdReqArb_io_in_1_valid),
    .io_in_1_bits_set(dbRdReqArb_io_in_1_bits_set),
    .io_out_valid(dbRdReqArb_io_out_valid),
    .io_out_bits_set(dbRdReqArb_io_out_bits_set)
  );
  Arbiter_5 dirRdReqArb ( // @[DCache.scala 143:29]
    .io_in_0_valid(dirRdReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirRdReqArb_io_in_0_bits_addr),
    .io_in_1_ready(dirRdReqArb_io_in_1_ready),
    .io_in_1_valid(dirRdReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirRdReqArb_io_in_1_bits_addr),
    .io_out_valid(dirRdReqArb_io_out_valid),
    .io_out_bits_addr(dirRdReqArb_io_out_bits_addr)
  );
  Arbiter_6 dataBankWrArb ( // @[DCache.scala 149:31]
    .io_in_0_valid(dataBankWrArb_io_in_0_valid),
    .io_in_0_bits_data(dataBankWrArb_io_in_0_bits_data),
    .io_in_0_bits_set(dataBankWrArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankWrArb_io_in_0_bits_blockSelOH),
    .io_in_0_bits_way(dataBankWrArb_io_in_0_bits_way),
    .io_in_1_ready(dataBankWrArb_io_in_1_ready),
    .io_in_1_valid(dataBankWrArb_io_in_1_valid),
    .io_in_1_bits_data(dataBankWrArb_io_in_1_bits_data),
    .io_in_1_bits_set(dataBankWrArb_io_in_1_bits_set),
    .io_in_1_bits_blockSelOH(dataBankWrArb_io_in_1_bits_blockSelOH),
    .io_in_1_bits_way(dataBankWrArb_io_in_1_bits_way),
    .io_in_2_ready(dataBankWrArb_io_in_2_ready),
    .io_in_2_valid(dataBankWrArb_io_in_2_valid),
    .io_in_2_bits_data(dataBankWrArb_io_in_2_bits_data),
    .io_in_2_bits_set(dataBankWrArb_io_in_2_bits_set),
    .io_in_2_bits_blockSelOH(dataBankWrArb_io_in_2_bits_blockSelOH),
    .io_in_2_bits_way(dataBankWrArb_io_in_2_bits_way),
    .io_out_valid(dataBankWrArb_io_out_valid),
    .io_out_bits_data(dataBankWrArb_io_out_bits_data),
    .io_out_bits_set(dataBankWrArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankWrArb_io_out_bits_blockSelOH),
    .io_out_bits_way(dataBankWrArb_io_out_bits_way)
  );
  Arbiter_7 dirWrArb ( // @[DCache.scala 155:26]
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
  assign io_read_req_ready = loadPipe_io_load_req_ready; // @[DCache.scala 102:26]
  assign io_read_resp_valid = loadRespArb_io_out_valid; // @[DCache.scala 130:18]
  assign io_read_resp_bits_data = loadRespArb_io_out_bits_data; // @[DCache.scala 130:18]
  assign io_write_req_ready = storePipe_io_store_req_ready; // @[DCache.scala 103:28]
  assign io_write_resp_valid = storeRespArb_io_out_valid; // @[DCache.scala 135:19]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[DCache.scala 118:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[DCache.scala 118:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[DCache.scala 118:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[DCache.scala 118:18]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[DCache.scala 102:26]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[DCache.scala 102:26]
  assign loadPipe_io_dir_req_ready = dirRdReqArb_io_in_1_ready; // @[DCache.scala 145:26]
  assign loadPipe_io_dir_resp_bits_hit = dir_io_read_resp_bits_hit; // @[DCache.scala 91:31]
  assign loadPipe_io_dir_resp_bits_chosenWay = dir_io_read_resp_bits_chosenWay; // @[DCache.scala 91:31]
  assign loadPipe_io_dir_resp_bits_isDirtyWay = dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 91:31]
  assign loadPipe_io_dataBank_req_ready = dbRdReqArb_io_in_1_ready; // @[DCache.scala 140:25]
  assign loadPipe_io_dataBank_resp_0_0 = db_io_read_resp_0_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_0_1 = db_io_read_resp_0_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_0_2 = db_io_read_resp_0_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_0_3 = db_io_read_resp_0_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_1_0 = db_io_read_resp_1_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_1_1 = db_io_read_resp_1_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_1_2 = db_io_read_resp_1_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_1_3 = db_io_read_resp_1_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_2_0 = db_io_read_resp_2_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_2_1 = db_io_read_resp_2_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_2_2 = db_io_read_resp_2_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_2_3 = db_io_read_resp_2_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_3_0 = db_io_read_resp_3_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_3_1 = db_io_read_resp_3_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_3_2 = db_io_read_resp_3_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_3_3 = db_io_read_resp_3_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_4_0 = db_io_read_resp_4_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_4_1 = db_io_read_resp_4_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_4_2 = db_io_read_resp_4_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_4_3 = db_io_read_resp_4_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_5_0 = db_io_read_resp_5_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_5_1 = db_io_read_resp_5_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_5_2 = db_io_read_resp_5_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_5_3 = db_io_read_resp_5_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_6_0 = db_io_read_resp_6_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_6_1 = db_io_read_resp_6_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_6_2 = db_io_read_resp_6_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_6_3 = db_io_read_resp_6_3; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_7_0 = db_io_read_resp_7_0; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_7_1 = db_io_read_resp_7_1; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_7_2 = db_io_read_resp_7_2; // @[DCache.scala 95:31]
  assign loadPipe_io_dataBank_resp_7_3 = db_io_read_resp_7_3; // @[DCache.scala 95:31]
  assign loadPipe_io_mshr_ready = mshrReqArb_io_in_0_ready; // @[DCache.scala 111:25]
  assign storePipe_clock = clock;
  assign storePipe_reset = reset;
  assign storePipe_io_store_req_valid = io_write_req_valid; // @[DCache.scala 103:28]
  assign storePipe_io_store_req_bits_addr = io_write_req_bits_addr; // @[DCache.scala 103:28]
  assign storePipe_io_store_req_bits_data = io_write_req_bits_data; // @[DCache.scala 103:28]
  assign storePipe_io_store_req_bits_mask = io_write_req_bits_mask; // @[DCache.scala 103:28]
  assign storePipe_io_dir_read_resp_bits_hit = dir_io_read_resp_bits_hit; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_chosenWay = dir_io_read_resp_bits_chosenWay; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_isDirtyWay = dir_io_read_resp_bits_isDirtyWay; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_0 = dir_io_read_resp_bits_tagRdVec_0; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_1 = dir_io_read_resp_bits_tagRdVec_1; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_2 = dir_io_read_resp_bits_tagRdVec_2; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_3 = dir_io_read_resp_bits_tagRdVec_3; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_4 = dir_io_read_resp_bits_tagRdVec_4; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_5 = dir_io_read_resp_bits_tagRdVec_5; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_6 = dir_io_read_resp_bits_tagRdVec_6; // @[DCache.scala 93:37]
  assign storePipe_io_dir_read_resp_bits_tagRdVec_7 = dir_io_read_resp_bits_tagRdVec_7; // @[DCache.scala 93:37]
  assign storePipe_io_dataBank_read_resp_0_0 = db_io_read_resp_0_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_0_1 = db_io_read_resp_0_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_0_2 = db_io_read_resp_0_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_0_3 = db_io_read_resp_0_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_1_0 = db_io_read_resp_1_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_1_1 = db_io_read_resp_1_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_1_2 = db_io_read_resp_1_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_1_3 = db_io_read_resp_1_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_2_0 = db_io_read_resp_2_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_2_1 = db_io_read_resp_2_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_2_2 = db_io_read_resp_2_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_2_3 = db_io_read_resp_2_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_3_0 = db_io_read_resp_3_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_3_1 = db_io_read_resp_3_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_3_2 = db_io_read_resp_3_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_3_3 = db_io_read_resp_3_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_4_0 = db_io_read_resp_4_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_4_1 = db_io_read_resp_4_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_4_2 = db_io_read_resp_4_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_4_3 = db_io_read_resp_4_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_5_0 = db_io_read_resp_5_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_5_1 = db_io_read_resp_5_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_5_2 = db_io_read_resp_5_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_5_3 = db_io_read_resp_5_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_6_0 = db_io_read_resp_6_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_6_1 = db_io_read_resp_6_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_6_2 = db_io_read_resp_6_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_6_3 = db_io_read_resp_6_3; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_7_0 = db_io_read_resp_7_0; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_7_1 = db_io_read_resp_7_1; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_7_2 = db_io_read_resp_7_2; // @[DCache.scala 96:37]
  assign storePipe_io_dataBank_read_resp_7_3 = db_io_read_resp_7_3; // @[DCache.scala 96:37]
  assign storePipe_io_mshr_ready = mshrReqArb_io_in_1_ready; // @[DCache.scala 112:25]
  assign mshr_clock = clock;
  assign mshr_reset = reset;
  assign mshr_io_req_valid = mshrReqArb_io_out_valid; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_addr = mshrReqArb_io_out_bits_addr; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_dirInfo_hit = mshrReqArb_io_out_bits_dirInfo_hit; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_dirInfo_chosenWay = mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_dirInfo_isDirtyWay = mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_dirtyTag = mshrReqArb_io_out_bits_dirtyTag; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_data_0 = mshrReqArb_io_out_bits_data_0; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_data_1 = mshrReqArb_io_out_bits_data_1; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_data_2 = mshrReqArb_io_out_bits_data_2; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_data_3 = mshrReqArb_io_out_bits_data_3; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_isStore = mshrReqArb_io_out_bits_isStore; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_storeData = mshrReqArb_io_out_bits_storeData; // @[DCache.scala 113:17]
  assign mshr_io_req_bits_storeMask = mshrReqArb_io_out_bits_storeMask; // @[DCache.scala 113:17]
  assign mshr_io_resp_load_ready = loadRespArb_io_in_1_ready; // @[DCache.scala 129:26]
  assign mshr_io_resp_store_ready = storeRespArb_io_in_1_ready; // @[DCache.scala 134:27]
  assign mshr_io_tasks_refill_resp_valid = refillPipe_io_resp_valid; // @[DCache.scala 106:31]
  assign mshr_io_tasks_refill_resp_bits_data = refillPipe_io_resp_bits_data; // @[DCache.scala 106:31]
  assign mshr_io_tasks_writeback_resp_valid = wb_io_resp_valid; // @[DCache.scala 108:34]
  assign mshr_io_dirWrite_req_ready = dirWrArb_io_in_2_ready; // @[DCache.scala 158:23]
  assign mshr_io_dataWrite_req_ready = dataBankWrArb_io_in_2_ready; // @[DCache.scala 152:28]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = mshr_io_tasks_refill_req_valid; // @[DCache.scala 105:30]
  assign refillPipe_io_req_bits_addr = mshr_io_tasks_refill_req_bits_addr; // @[DCache.scala 105:30]
  assign refillPipe_io_req_bits_chosenWay = mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache.scala 105:30]
  assign refillPipe_io_tlbus_req_ready = tlbusReqArb_io_in_1_ready; // @[DCache.scala 117:26]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 122:36]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[DCache.scala 123:35]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[DCache.scala 123:35]
  assign refillPipe_io_dirWrite_req_ready = dirWrArb_io_in_1_ready; // @[DCache.scala 157:23]
  assign refillPipe_io_dataWrite_req_ready = dataBankWrArb_io_in_1_ready; // @[DCache.scala 151:28]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_req_valid = mshr_io_tasks_writeback_req_valid; // @[DCache.scala 107:33]
  assign wb_io_req_bits_addr = mshr_io_tasks_writeback_req_bits_addr; // @[DCache.scala 107:33]
  assign wb_io_req_bits_dirtyTag = mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache.scala 107:33]
  assign wb_io_req_bits_data_0 = mshr_io_tasks_writeback_req_bits_data_0; // @[DCache.scala 107:33]
  assign wb_io_req_bits_data_1 = mshr_io_tasks_writeback_req_bits_data_1; // @[DCache.scala 107:33]
  assign wb_io_req_bits_data_2 = mshr_io_tasks_writeback_req_bits_data_2; // @[DCache.scala 107:33]
  assign wb_io_req_bits_data_3 = mshr_io_tasks_writeback_req_bits_data_3; // @[DCache.scala 107:33]
  assign wb_io_tlbus_req_ready = tlbusReqArb_io_in_0_ready; // @[DCache.scala 116:26]
  assign wb_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache.scala 120:28]
  assign db_clock = clock;
  assign db_reset = reset;
  assign db_io_read_req_valid = dbRdReqArb_io_out_valid; // @[DCache.scala 141:20]
  assign db_io_read_req_bits_set = dbRdReqArb_io_out_bits_set; // @[DCache.scala 141:20]
  assign db_io_write_req_valid = dataBankWrArb_io_out_valid; // @[DCache.scala 153:21]
  assign db_io_write_req_bits_data = dataBankWrArb_io_out_bits_data; // @[DCache.scala 153:21]
  assign db_io_write_req_bits_set = dataBankWrArb_io_out_bits_set; // @[DCache.scala 153:21]
  assign db_io_write_req_bits_blockSelOH = dataBankWrArb_io_out_bits_blockSelOH; // @[DCache.scala 153:21]
  assign db_io_write_req_bits_way = dataBankWrArb_io_out_bits_way; // @[DCache.scala 153:21]
  assign dir_clock = clock;
  assign dir_reset = reset;
  assign dir_io_read_req_valid = dirRdReqArb_io_out_valid; // @[DCache.scala 146:21]
  assign dir_io_read_req_bits_addr = dirRdReqArb_io_out_bits_addr; // @[DCache.scala 146:21]
  assign dir_io_write_req_valid = dirWrArb_io_out_valid; // @[DCache.scala 159:22]
  assign dir_io_write_req_bits_addr = dirWrArb_io_out_bits_addr; // @[DCache.scala 159:22]
  assign dir_io_write_req_bits_way = dirWrArb_io_out_bits_way; // @[DCache.scala 159:22]
  assign dir_io_write_req_bits_meta = dirWrArb_io_out_bits_meta; // @[DCache.scala 159:22]
  assign mshrReqArb_io_in_0_valid = loadPipe_io_mshr_valid; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_addr = loadPipe_io_mshr_bits_addr; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_hit = loadPipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_chosenWay = loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay = loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_data_0 = loadPipe_io_mshr_bits_data_0; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_data_1 = loadPipe_io_mshr_bits_data_1; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_data_2 = loadPipe_io_mshr_bits_data_2; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_0_bits_data_3 = loadPipe_io_mshr_bits_data_3; // @[DCache.scala 111:25]
  assign mshrReqArb_io_in_1_valid = storePipe_io_mshr_valid; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_addr = storePipe_io_mshr_bits_addr; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_hit = storePipe_io_mshr_bits_dirInfo_hit; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_chosenWay = storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay = storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_dirtyTag = storePipe_io_mshr_bits_dirtyTag; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_data_0 = storePipe_io_mshr_bits_data_0; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_data_1 = storePipe_io_mshr_bits_data_1; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_data_2 = storePipe_io_mshr_bits_data_2; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_data_3 = storePipe_io_mshr_bits_data_3; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_storeData = storePipe_io_mshr_bits_storeData; // @[DCache.scala 112:25]
  assign mshrReqArb_io_in_1_bits_storeMask = storePipe_io_mshr_bits_storeMask; // @[DCache.scala 112:25]
  assign mshrReqArb_io_out_ready = mshr_io_req_ready; // @[DCache.scala 113:17]
  assign tlbusReqArb_io_in_0_valid = wb_io_tlbus_req_valid; // @[DCache.scala 116:26]
  assign tlbusReqArb_io_in_0_bits_address = wb_io_tlbus_req_bits_address; // @[DCache.scala 116:26]
  assign tlbusReqArb_io_in_0_bits_data = wb_io_tlbus_req_bits_data; // @[DCache.scala 116:26]
  assign tlbusReqArb_io_in_1_valid = refillPipe_io_tlbus_req_valid; // @[DCache.scala 117:26]
  assign tlbusReqArb_io_in_1_bits_address = refillPipe_io_tlbus_req_bits_address; // @[DCache.scala 117:26]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[DCache.scala 118:18]
  assign loadRespArb_io_in_0_valid = loadPipe_io_load_resp_valid; // @[DCache.scala 128:26]
  assign loadRespArb_io_in_0_bits_data = loadPipe_io_load_resp_bits_data; // @[DCache.scala 128:26]
  assign loadRespArb_io_in_1_valid = mshr_io_resp_load_valid; // @[DCache.scala 129:26]
  assign loadRespArb_io_in_1_bits_data = mshr_io_resp_load_bits_data; // @[DCache.scala 129:26]
  assign storeRespArb_io_in_0_valid = storePipe_io_store_resp_valid; // @[DCache.scala 133:27]
  assign storeRespArb_io_in_1_valid = mshr_io_resp_store_valid; // @[DCache.scala 134:27]
  assign dbRdReqArb_io_in_0_valid = storePipe_io_dataBank_read_req_valid; // @[DCache.scala 139:25]
  assign dbRdReqArb_io_in_0_bits_set = storePipe_io_dataBank_read_req_bits_set; // @[DCache.scala 139:25]
  assign dbRdReqArb_io_in_1_valid = loadPipe_io_dataBank_req_valid; // @[DCache.scala 140:25]
  assign dbRdReqArb_io_in_1_bits_set = loadPipe_io_dataBank_req_bits_set; // @[DCache.scala 140:25]
  assign dirRdReqArb_io_in_0_valid = storePipe_io_dir_read_req_valid; // @[DCache.scala 144:26]
  assign dirRdReqArb_io_in_0_bits_addr = storePipe_io_dir_read_req_bits_addr; // @[DCache.scala 144:26]
  assign dirRdReqArb_io_in_1_valid = loadPipe_io_dir_req_valid; // @[DCache.scala 145:26]
  assign dirRdReqArb_io_in_1_bits_addr = loadPipe_io_dir_req_bits_addr; // @[DCache.scala 145:26]
  assign dataBankWrArb_io_in_0_valid = storePipe_io_dataBank_write_req_valid; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_0_bits_data = storePipe_io_dataBank_write_req_bits_data; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_0_bits_set = storePipe_io_dataBank_write_req_bits_set; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_0_bits_blockSelOH = storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_0_bits_way = storePipe_io_dataBank_write_req_bits_way; // @[DCache.scala 150:28]
  assign dataBankWrArb_io_in_1_valid = refillPipe_io_dataWrite_req_valid; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_1_bits_data = refillPipe_io_dataWrite_req_bits_data; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_1_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_1_bits_blockSelOH = refillPipe_io_dataWrite_req_bits_blockSelOH; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_1_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[DCache.scala 151:28]
  assign dataBankWrArb_io_in_2_valid = mshr_io_dataWrite_req_valid; // @[DCache.scala 152:28]
  assign dataBankWrArb_io_in_2_bits_data = mshr_io_dataWrite_req_bits_data; // @[DCache.scala 152:28]
  assign dataBankWrArb_io_in_2_bits_set = mshr_io_dataWrite_req_bits_set; // @[DCache.scala 152:28]
  assign dataBankWrArb_io_in_2_bits_blockSelOH = mshr_io_dataWrite_req_bits_blockSelOH; // @[DCache.scala 152:28]
  assign dataBankWrArb_io_in_2_bits_way = mshr_io_dataWrite_req_bits_way; // @[DCache.scala 152:28]
  assign dirWrArb_io_in_0_valid = storePipe_io_dir_write_req_valid; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_0_bits_addr = storePipe_io_dir_write_req_bits_addr; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_0_bits_way = storePipe_io_dir_write_req_bits_way; // @[DCache.scala 156:23]
  assign dirWrArb_io_in_1_valid = refillPipe_io_dirWrite_req_valid; // @[DCache.scala 157:23]
  assign dirWrArb_io_in_1_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[DCache.scala 157:23]
  assign dirWrArb_io_in_1_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[DCache.scala 157:23]
  assign dirWrArb_io_in_2_valid = mshr_io_dirWrite_req_valid; // @[DCache.scala 158:23]
  assign dirWrArb_io_in_2_bits_addr = mshr_io_dirWrite_req_bits_addr; // @[DCache.scala 158:23]
  assign dirWrArb_io_in_2_bits_way = mshr_io_dirWrite_req_bits_way; // @[DCache.scala 158:23]
endmodule
