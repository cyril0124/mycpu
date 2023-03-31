module DCache_1(
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
  wire  loadPipe_clock; // @[DCache_2.scala 31:26]
  wire  loadPipe_reset; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_load_req_ready; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_load_req_valid; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_load_req_bits_addr; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_load_resp_valid; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_load_resp_bits_data; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dir_req_ready; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dir_req_valid; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dir_req_bits_addr; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dir_resp_bits_hit; // @[DCache_2.scala 31:26]
  wire [7:0] loadPipe_io_dir_resp_bits_chosenWay; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dir_resp_bits_isDirtyWay; // @[DCache_2.scala 31:26]
  wire [19:0] loadPipe_io_dir_resp_bits_dirtyTag; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dataBank_req_ready; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_dataBank_req_valid; // @[DCache_2.scala 31:26]
  wire [7:0] loadPipe_io_dataBank_req_bits_set; // @[DCache_2.scala 31:26]
  wire [3:0] loadPipe_io_dataBank_req_bits_blockSelOH; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_0; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_1; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_2; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_3; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_4; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_5; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_6; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_dataBank_resp_bits_data_7; // @[DCache_2.scala 31:26]
  wire [255:0] loadPipe_io_dataBank_resp_bits_blockData_0; // @[DCache_2.scala 31:26]
  wire [255:0] loadPipe_io_dataBank_resp_bits_blockData_1; // @[DCache_2.scala 31:26]
  wire [255:0] loadPipe_io_dataBank_resp_bits_blockData_2; // @[DCache_2.scala 31:26]
  wire [255:0] loadPipe_io_dataBank_resp_bits_blockData_3; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_mshr_ready; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_mshr_valid; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_mshr_bits_addr; // @[DCache_2.scala 31:26]
  wire [7:0] loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache_2.scala 31:26]
  wire  loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 31:26]
  wire [19:0] loadPipe_io_mshr_bits_dirInfo_dirtyTag; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_mshr_bits_data_0; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_mshr_bits_data_1; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_mshr_bits_data_2; // @[DCache_2.scala 31:26]
  wire [31:0] loadPipe_io_mshr_bits_data_3; // @[DCache_2.scala 31:26]
  wire  storePipe_clock; // @[DCache_2.scala 33:27]
  wire  storePipe_reset; // @[DCache_2.scala 33:27]
  wire  storePipe_io_store_req_ready; // @[DCache_2.scala 33:27]
  wire  storePipe_io_store_req_valid; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_store_req_bits_addr; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_store_req_bits_data; // @[DCache_2.scala 33:27]
  wire [3:0] storePipe_io_store_req_bits_mask; // @[DCache_2.scala 33:27]
  wire  storePipe_io_store_resp_valid; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dir_read_req_valid; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_dir_read_req_bits_addr; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dir_read_resp_bits_hit; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_dir_read_resp_bits_chosenWay; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dir_read_resp_bits_isDirtyWay; // @[DCache_2.scala 33:27]
  wire [19:0] storePipe_io_dir_read_resp_bits_dirtyTag; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dir_write_req_valid; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_dir_write_req_bits_addr; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_dir_write_req_bits_way; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dataBank_read_req_ready; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dataBank_read_req_valid; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_dataBank_read_req_bits_set; // @[DCache_2.scala 33:27]
  wire [3:0] storePipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache_2.scala 33:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_0; // @[DCache_2.scala 33:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_1; // @[DCache_2.scala 33:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_2; // @[DCache_2.scala 33:27]
  wire [255:0] storePipe_io_dataBank_read_resp_bits_blockData_3; // @[DCache_2.scala 33:27]
  wire  storePipe_io_dataBank_write_req_valid; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_dataBank_write_req_bits_data; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_set; // @[DCache_2.scala 33:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_dataBank_write_req_bits_way; // @[DCache_2.scala 33:27]
  wire [3:0] storePipe_io_dataBank_write_req_bits_mask; // @[DCache_2.scala 33:27]
  wire  storePipe_io_mshr_ready; // @[DCache_2.scala 33:27]
  wire  storePipe_io_mshr_valid; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_addr; // @[DCache_2.scala 33:27]
  wire [7:0] storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache_2.scala 33:27]
  wire  storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 33:27]
  wire [19:0] storePipe_io_mshr_bits_dirInfo_dirtyTag; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_data_0; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_data_1; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_data_2; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_data_3; // @[DCache_2.scala 33:27]
  wire [31:0] storePipe_io_mshr_bits_storeData; // @[DCache_2.scala 33:27]
  wire [3:0] storePipe_io_mshr_bits_storeMask; // @[DCache_2.scala 33:27]
  wire  mshr_clock; // @[DCache_2.scala 35:22]
  wire  mshr_reset; // @[DCache_2.scala 35:22]
  wire  mshr_io_req_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_req_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_addr; // @[DCache_2.scala 35:22]
  wire [7:0] mshr_io_req_bits_dirInfo_chosenWay; // @[DCache_2.scala 35:22]
  wire  mshr_io_req_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 35:22]
  wire [19:0] mshr_io_req_bits_dirInfo_dirtyTag; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_data_0; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_data_1; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_data_2; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_data_3; // @[DCache_2.scala 35:22]
  wire  mshr_io_req_bits_isStore; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_req_bits_storeData; // @[DCache_2.scala 35:22]
  wire [3:0] mshr_io_req_bits_storeMask; // @[DCache_2.scala 35:22]
  wire  mshr_io_resp_load_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_resp_load_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_resp_load_bits_data; // @[DCache_2.scala 35:22]
  wire  mshr_io_resp_store_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_resp_store_valid; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_refill_req_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_refill_req_bits_addr; // @[DCache_2.scala 35:22]
  wire [7:0] mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_refill_resp_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_refill_resp_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_refill_resp_bits_data; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_writeback_req_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_addr; // @[DCache_2.scala 35:22]
  wire [19:0] mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_0; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_1; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_2; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_tasks_writeback_req_bits_data_3; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_writeback_resp_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_tasks_writeback_resp_valid; // @[DCache_2.scala 35:22]
  wire  mshr_io_dirWrite_req_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_dirWrite_req_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_dirWrite_req_bits_addr; // @[DCache_2.scala 35:22]
  wire [7:0] mshr_io_dirWrite_req_bits_way; // @[DCache_2.scala 35:22]
  wire  mshr_io_dataWrite_req_ready; // @[DCache_2.scala 35:22]
  wire  mshr_io_dataWrite_req_valid; // @[DCache_2.scala 35:22]
  wire [31:0] mshr_io_dataWrite_req_bits_data; // @[DCache_2.scala 35:22]
  wire [7:0] mshr_io_dataWrite_req_bits_set; // @[DCache_2.scala 35:22]
  wire [3:0] mshr_io_dataWrite_req_bits_blockSelOH; // @[DCache_2.scala 35:22]
  wire [7:0] mshr_io_dataWrite_req_bits_way; // @[DCache_2.scala 35:22]
  wire [3:0] mshr_io_dataWrite_req_bits_mask; // @[DCache_2.scala 35:22]
  wire  refillPipe_clock; // @[DCache_2.scala 37:28]
  wire  refillPipe_reset; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_req_ready; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_req_valid; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_req_bits_addr; // @[DCache_2.scala 37:28]
  wire [7:0] refillPipe_io_req_bits_chosenWay; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_resp_valid; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_resp_bits_data; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_tlbus_req_ready; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_tlbus_req_valid; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_tlbus_req_bits_address; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_tlbus_resp_ready; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_tlbus_resp_valid; // @[DCache_2.scala 37:28]
  wire [2:0] refillPipe_io_tlbus_resp_bits_opcode; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_tlbus_resp_bits_data; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_dirWrite_req_ready; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_dirWrite_req_valid; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_dirWrite_req_bits_addr; // @[DCache_2.scala 37:28]
  wire [7:0] refillPipe_io_dirWrite_req_bits_way; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_dataWrite_req_ready; // @[DCache_2.scala 37:28]
  wire  refillPipe_io_dataWrite_req_valid; // @[DCache_2.scala 37:28]
  wire [31:0] refillPipe_io_dataWrite_req_bits_data; // @[DCache_2.scala 37:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_set; // @[DCache_2.scala 37:28]
  wire [3:0] refillPipe_io_dataWrite_req_bits_blockSelOH; // @[DCache_2.scala 37:28]
  wire [7:0] refillPipe_io_dataWrite_req_bits_way; // @[DCache_2.scala 37:28]
  wire  writebackQueue_clock; // @[DCache_2.scala 39:32]
  wire  writebackQueue_reset; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_req_ready; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_req_valid; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_req_bits_addr; // @[DCache_2.scala 39:32]
  wire [19:0] writebackQueue_io_req_bits_dirtyTag; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_req_bits_data_0; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_req_bits_data_1; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_req_bits_data_2; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_req_bits_data_3; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_resp_valid; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_tlbus_req_ready; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_tlbus_req_valid; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_tlbus_req_bits_address; // @[DCache_2.scala 39:32]
  wire [31:0] writebackQueue_io_tlbus_req_bits_data; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_tlbus_resp_ready; // @[DCache_2.scala 39:32]
  wire  writebackQueue_io_tlbus_resp_valid; // @[DCache_2.scala 39:32]
  wire  dataBankArray_clock; // @[DCache_2.scala 41:31]
  wire  dataBankArray_reset; // @[DCache_2.scala 41:31]
  wire  dataBankArray_io_read_req_ready; // @[DCache_2.scala 41:31]
  wire  dataBankArray_io_read_req_valid; // @[DCache_2.scala 41:31]
  wire [7:0] dataBankArray_io_read_req_bits_set; // @[DCache_2.scala 41:31]
  wire [3:0] dataBankArray_io_read_req_bits_blockSelOH; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_0; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_1; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_2; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_3; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_4; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_5; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_6; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_read_resp_bits_data_7; // @[DCache_2.scala 41:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_0; // @[DCache_2.scala 41:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_1; // @[DCache_2.scala 41:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_2; // @[DCache_2.scala 41:31]
  wire [255:0] dataBankArray_io_read_resp_bits_blockData_3; // @[DCache_2.scala 41:31]
  wire  dataBankArray_io_write_req_ready; // @[DCache_2.scala 41:31]
  wire  dataBankArray_io_write_req_valid; // @[DCache_2.scala 41:31]
  wire [31:0] dataBankArray_io_write_req_bits_data; // @[DCache_2.scala 41:31]
  wire [7:0] dataBankArray_io_write_req_bits_set; // @[DCache_2.scala 41:31]
  wire [3:0] dataBankArray_io_write_req_bits_blockSelOH; // @[DCache_2.scala 41:31]
  wire [7:0] dataBankArray_io_write_req_bits_way; // @[DCache_2.scala 41:31]
  wire [3:0] dataBankArray_io_write_req_bits_mask; // @[DCache_2.scala 41:31]
  wire  directory_clock; // @[DCache_2.scala 43:27]
  wire  directory_reset; // @[DCache_2.scala 43:27]
  wire  directory_io_read_req_ready; // @[DCache_2.scala 43:27]
  wire  directory_io_read_req_valid; // @[DCache_2.scala 43:27]
  wire [31:0] directory_io_read_req_bits_addr; // @[DCache_2.scala 43:27]
  wire  directory_io_read_resp_bits_hit; // @[DCache_2.scala 43:27]
  wire [7:0] directory_io_read_resp_bits_chosenWay; // @[DCache_2.scala 43:27]
  wire  directory_io_read_resp_bits_isDirtyWay; // @[DCache_2.scala 43:27]
  wire [19:0] directory_io_read_resp_bits_dirtyTag; // @[DCache_2.scala 43:27]
  wire  directory_io_write_req_ready; // @[DCache_2.scala 43:27]
  wire  directory_io_write_req_valid; // @[DCache_2.scala 43:27]
  wire [31:0] directory_io_write_req_bits_addr; // @[DCache_2.scala 43:27]
  wire [7:0] directory_io_write_req_bits_way; // @[DCache_2.scala 43:27]
  wire [1:0] directory_io_write_req_bits_meta; // @[DCache_2.scala 43:27]
  wire  mshrReqArb_io_in_0_ready; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_in_0_valid; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_0_bits_addr; // @[DCache_2.scala 63:28]
  wire [7:0] mshrReqArb_io_in_0_bits_dirInfo_chosenWay; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 63:28]
  wire [19:0] mshrReqArb_io_in_0_bits_dirInfo_dirtyTag; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_0; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_1; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_2; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_0_bits_data_3; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_in_1_ready; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_in_1_valid; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_addr; // @[DCache_2.scala 63:28]
  wire [7:0] mshrReqArb_io_in_1_bits_dirInfo_chosenWay; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 63:28]
  wire [19:0] mshrReqArb_io_in_1_bits_dirInfo_dirtyTag; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_0; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_1; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_2; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_data_3; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_in_1_bits_storeData; // @[DCache_2.scala 63:28]
  wire [3:0] mshrReqArb_io_in_1_bits_storeMask; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_out_ready; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_out_valid; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_addr; // @[DCache_2.scala 63:28]
  wire [7:0] mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 63:28]
  wire [19:0] mshrReqArb_io_out_bits_dirInfo_dirtyTag; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_data_0; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_data_1; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_data_2; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_data_3; // @[DCache_2.scala 63:28]
  wire  mshrReqArb_io_out_bits_isStore; // @[DCache_2.scala 63:28]
  wire [31:0] mshrReqArb_io_out_bits_storeData; // @[DCache_2.scala 63:28]
  wire [3:0] mshrReqArb_io_out_bits_storeMask; // @[DCache_2.scala 63:28]
  wire  tlbusReqArb_io_in_0_ready; // @[DCache_2.scala 68:29]
  wire  tlbusReqArb_io_in_0_valid; // @[DCache_2.scala 68:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_address; // @[DCache_2.scala 68:29]
  wire [31:0] tlbusReqArb_io_in_0_bits_data; // @[DCache_2.scala 68:29]
  wire  tlbusReqArb_io_in_1_ready; // @[DCache_2.scala 68:29]
  wire  tlbusReqArb_io_in_1_valid; // @[DCache_2.scala 68:29]
  wire [31:0] tlbusReqArb_io_in_1_bits_address; // @[DCache_2.scala 68:29]
  wire  tlbusReqArb_io_out_ready; // @[DCache_2.scala 68:29]
  wire  tlbusReqArb_io_out_valid; // @[DCache_2.scala 68:29]
  wire [2:0] tlbusReqArb_io_out_bits_opcode; // @[DCache_2.scala 68:29]
  wire [31:0] tlbusReqArb_io_out_bits_address; // @[DCache_2.scala 68:29]
  wire [31:0] tlbusReqArb_io_out_bits_data; // @[DCache_2.scala 68:29]
  wire  loadRespArb_io_in_0_valid; // @[DCache_2.scala 80:29]
  wire [31:0] loadRespArb_io_in_0_bits_data; // @[DCache_2.scala 80:29]
  wire  loadRespArb_io_in_1_ready; // @[DCache_2.scala 80:29]
  wire  loadRespArb_io_in_1_valid; // @[DCache_2.scala 80:29]
  wire [31:0] loadRespArb_io_in_1_bits_data; // @[DCache_2.scala 80:29]
  wire  loadRespArb_io_out_valid; // @[DCache_2.scala 80:29]
  wire [31:0] loadRespArb_io_out_bits_data; // @[DCache_2.scala 80:29]
  wire  storeRespArb_io_in_0_valid; // @[DCache_2.scala 85:30]
  wire  storeRespArb_io_in_1_ready; // @[DCache_2.scala 85:30]
  wire  storeRespArb_io_in_1_valid; // @[DCache_2.scala 85:30]
  wire  storeRespArb_io_out_valid; // @[DCache_2.scala 85:30]
  wire  dataBankRdReqArb_io_in_0_ready; // @[DCache_2.scala 91:34]
  wire  dataBankRdReqArb_io_in_0_valid; // @[DCache_2.scala 91:34]
  wire [7:0] dataBankRdReqArb_io_in_0_bits_set; // @[DCache_2.scala 91:34]
  wire [3:0] dataBankRdReqArb_io_in_0_bits_blockSelOH; // @[DCache_2.scala 91:34]
  wire  dataBankRdReqArb_io_in_1_ready; // @[DCache_2.scala 91:34]
  wire  dataBankRdReqArb_io_in_1_valid; // @[DCache_2.scala 91:34]
  wire [7:0] dataBankRdReqArb_io_in_1_bits_set; // @[DCache_2.scala 91:34]
  wire [3:0] dataBankRdReqArb_io_in_1_bits_blockSelOH; // @[DCache_2.scala 91:34]
  wire  dataBankRdReqArb_io_out_ready; // @[DCache_2.scala 91:34]
  wire  dataBankRdReqArb_io_out_valid; // @[DCache_2.scala 91:34]
  wire [7:0] dataBankRdReqArb_io_out_bits_set; // @[DCache_2.scala 91:34]
  wire [3:0] dataBankRdReqArb_io_out_bits_blockSelOH; // @[DCache_2.scala 91:34]
  wire  dirRdReqArb_io_in_0_valid; // @[DCache_2.scala 96:29]
  wire [31:0] dirRdReqArb_io_in_0_bits_addr; // @[DCache_2.scala 96:29]
  wire  dirRdReqArb_io_in_1_ready; // @[DCache_2.scala 96:29]
  wire  dirRdReqArb_io_in_1_valid; // @[DCache_2.scala 96:29]
  wire [31:0] dirRdReqArb_io_in_1_bits_addr; // @[DCache_2.scala 96:29]
  wire  dirRdReqArb_io_out_valid; // @[DCache_2.scala 96:29]
  wire [31:0] dirRdReqArb_io_out_bits_addr; // @[DCache_2.scala 96:29]
  wire  dataBankWrArb_io_in_0_valid; // @[DCache_2.scala 102:31]
  wire [31:0] dataBankWrArb_io_in_0_bits_data; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_0_bits_set; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_in_0_bits_blockSelOH; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_0_bits_way; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_in_0_bits_mask; // @[DCache_2.scala 102:31]
  wire  dataBankWrArb_io_in_1_ready; // @[DCache_2.scala 102:31]
  wire  dataBankWrArb_io_in_1_valid; // @[DCache_2.scala 102:31]
  wire [31:0] dataBankWrArb_io_in_1_bits_data; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_1_bits_set; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_in_1_bits_blockSelOH; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_1_bits_way; // @[DCache_2.scala 102:31]
  wire  dataBankWrArb_io_in_2_ready; // @[DCache_2.scala 102:31]
  wire  dataBankWrArb_io_in_2_valid; // @[DCache_2.scala 102:31]
  wire [31:0] dataBankWrArb_io_in_2_bits_data; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_2_bits_set; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_in_2_bits_blockSelOH; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_in_2_bits_way; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_in_2_bits_mask; // @[DCache_2.scala 102:31]
  wire  dataBankWrArb_io_out_valid; // @[DCache_2.scala 102:31]
  wire [31:0] dataBankWrArb_io_out_bits_data; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_out_bits_set; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_out_bits_blockSelOH; // @[DCache_2.scala 102:31]
  wire [7:0] dataBankWrArb_io_out_bits_way; // @[DCache_2.scala 102:31]
  wire [3:0] dataBankWrArb_io_out_bits_mask; // @[DCache_2.scala 102:31]
  wire  dirWrArb_io_in_0_valid; // @[DCache_2.scala 108:26]
  wire [31:0] dirWrArb_io_in_0_bits_addr; // @[DCache_2.scala 108:26]
  wire [7:0] dirWrArb_io_in_0_bits_way; // @[DCache_2.scala 108:26]
  wire  dirWrArb_io_in_1_ready; // @[DCache_2.scala 108:26]
  wire  dirWrArb_io_in_1_valid; // @[DCache_2.scala 108:26]
  wire [31:0] dirWrArb_io_in_1_bits_addr; // @[DCache_2.scala 108:26]
  wire [7:0] dirWrArb_io_in_1_bits_way; // @[DCache_2.scala 108:26]
  wire  dirWrArb_io_in_2_ready; // @[DCache_2.scala 108:26]
  wire  dirWrArb_io_in_2_valid; // @[DCache_2.scala 108:26]
  wire [31:0] dirWrArb_io_in_2_bits_addr; // @[DCache_2.scala 108:26]
  wire [7:0] dirWrArb_io_in_2_bits_way; // @[DCache_2.scala 108:26]
  wire  dirWrArb_io_out_valid; // @[DCache_2.scala 108:26]
  wire [31:0] dirWrArb_io_out_bits_addr; // @[DCache_2.scala 108:26]
  wire [7:0] dirWrArb_io_out_bits_way; // @[DCache_2.scala 108:26]
  wire [1:0] dirWrArb_io_out_bits_meta; // @[DCache_2.scala 108:26]
  LoadPipe_2 loadPipe ( // @[DCache_2.scala 31:26]
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
    .io_dir_resp_bits_dirtyTag(loadPipe_io_dir_resp_bits_dirtyTag),
    .io_dataBank_req_ready(loadPipe_io_dataBank_req_ready),
    .io_dataBank_req_valid(loadPipe_io_dataBank_req_valid),
    .io_dataBank_req_bits_set(loadPipe_io_dataBank_req_bits_set),
    .io_dataBank_req_bits_blockSelOH(loadPipe_io_dataBank_req_bits_blockSelOH),
    .io_dataBank_resp_bits_data_0(loadPipe_io_dataBank_resp_bits_data_0),
    .io_dataBank_resp_bits_data_1(loadPipe_io_dataBank_resp_bits_data_1),
    .io_dataBank_resp_bits_data_2(loadPipe_io_dataBank_resp_bits_data_2),
    .io_dataBank_resp_bits_data_3(loadPipe_io_dataBank_resp_bits_data_3),
    .io_dataBank_resp_bits_data_4(loadPipe_io_dataBank_resp_bits_data_4),
    .io_dataBank_resp_bits_data_5(loadPipe_io_dataBank_resp_bits_data_5),
    .io_dataBank_resp_bits_data_6(loadPipe_io_dataBank_resp_bits_data_6),
    .io_dataBank_resp_bits_data_7(loadPipe_io_dataBank_resp_bits_data_7),
    .io_dataBank_resp_bits_blockData_0(loadPipe_io_dataBank_resp_bits_blockData_0),
    .io_dataBank_resp_bits_blockData_1(loadPipe_io_dataBank_resp_bits_blockData_1),
    .io_dataBank_resp_bits_blockData_2(loadPipe_io_dataBank_resp_bits_blockData_2),
    .io_dataBank_resp_bits_blockData_3(loadPipe_io_dataBank_resp_bits_blockData_3),
    .io_mshr_ready(loadPipe_io_mshr_ready),
    .io_mshr_valid(loadPipe_io_mshr_valid),
    .io_mshr_bits_addr(loadPipe_io_mshr_bits_addr),
    .io_mshr_bits_dirInfo_chosenWay(loadPipe_io_mshr_bits_dirInfo_chosenWay),
    .io_mshr_bits_dirInfo_isDirtyWay(loadPipe_io_mshr_bits_dirInfo_isDirtyWay),
    .io_mshr_bits_dirInfo_dirtyTag(loadPipe_io_mshr_bits_dirInfo_dirtyTag),
    .io_mshr_bits_data_0(loadPipe_io_mshr_bits_data_0),
    .io_mshr_bits_data_1(loadPipe_io_mshr_bits_data_1),
    .io_mshr_bits_data_2(loadPipe_io_mshr_bits_data_2),
    .io_mshr_bits_data_3(loadPipe_io_mshr_bits_data_3)
  );
  StorePipe_2 storePipe ( // @[DCache_2.scala 33:27]
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
    .io_dir_read_resp_bits_dirtyTag(storePipe_io_dir_read_resp_bits_dirtyTag),
    .io_dir_write_req_valid(storePipe_io_dir_write_req_valid),
    .io_dir_write_req_bits_addr(storePipe_io_dir_write_req_bits_addr),
    .io_dir_write_req_bits_way(storePipe_io_dir_write_req_bits_way),
    .io_dataBank_read_req_ready(storePipe_io_dataBank_read_req_ready),
    .io_dataBank_read_req_valid(storePipe_io_dataBank_read_req_valid),
    .io_dataBank_read_req_bits_set(storePipe_io_dataBank_read_req_bits_set),
    .io_dataBank_read_req_bits_blockSelOH(storePipe_io_dataBank_read_req_bits_blockSelOH),
    .io_dataBank_read_resp_bits_blockData_0(storePipe_io_dataBank_read_resp_bits_blockData_0),
    .io_dataBank_read_resp_bits_blockData_1(storePipe_io_dataBank_read_resp_bits_blockData_1),
    .io_dataBank_read_resp_bits_blockData_2(storePipe_io_dataBank_read_resp_bits_blockData_2),
    .io_dataBank_read_resp_bits_blockData_3(storePipe_io_dataBank_read_resp_bits_blockData_3),
    .io_dataBank_write_req_valid(storePipe_io_dataBank_write_req_valid),
    .io_dataBank_write_req_bits_data(storePipe_io_dataBank_write_req_bits_data),
    .io_dataBank_write_req_bits_set(storePipe_io_dataBank_write_req_bits_set),
    .io_dataBank_write_req_bits_blockSelOH(storePipe_io_dataBank_write_req_bits_blockSelOH),
    .io_dataBank_write_req_bits_way(storePipe_io_dataBank_write_req_bits_way),
    .io_dataBank_write_req_bits_mask(storePipe_io_dataBank_write_req_bits_mask),
    .io_mshr_ready(storePipe_io_mshr_ready),
    .io_mshr_valid(storePipe_io_mshr_valid),
    .io_mshr_bits_addr(storePipe_io_mshr_bits_addr),
    .io_mshr_bits_dirInfo_chosenWay(storePipe_io_mshr_bits_dirInfo_chosenWay),
    .io_mshr_bits_dirInfo_isDirtyWay(storePipe_io_mshr_bits_dirInfo_isDirtyWay),
    .io_mshr_bits_dirInfo_dirtyTag(storePipe_io_mshr_bits_dirInfo_dirtyTag),
    .io_mshr_bits_data_0(storePipe_io_mshr_bits_data_0),
    .io_mshr_bits_data_1(storePipe_io_mshr_bits_data_1),
    .io_mshr_bits_data_2(storePipe_io_mshr_bits_data_2),
    .io_mshr_bits_data_3(storePipe_io_mshr_bits_data_3),
    .io_mshr_bits_storeData(storePipe_io_mshr_bits_storeData),
    .io_mshr_bits_storeMask(storePipe_io_mshr_bits_storeMask)
  );
  MSHR mshr ( // @[DCache_2.scala 35:22]
    .clock(mshr_clock),
    .reset(mshr_reset),
    .io_req_ready(mshr_io_req_ready),
    .io_req_valid(mshr_io_req_valid),
    .io_req_bits_addr(mshr_io_req_bits_addr),
    .io_req_bits_dirInfo_chosenWay(mshr_io_req_bits_dirInfo_chosenWay),
    .io_req_bits_dirInfo_isDirtyWay(mshr_io_req_bits_dirInfo_isDirtyWay),
    .io_req_bits_dirInfo_dirtyTag(mshr_io_req_bits_dirInfo_dirtyTag),
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
    .io_dataWrite_req_bits_way(mshr_io_dataWrite_req_bits_way),
    .io_dataWrite_req_bits_mask(mshr_io_dataWrite_req_bits_mask)
  );
  RefillPipe_1 refillPipe ( // @[DCache_2.scala 37:28]
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
  WritebackQueue writebackQueue ( // @[DCache_2.scala 39:32]
    .clock(writebackQueue_clock),
    .reset(writebackQueue_reset),
    .io_req_ready(writebackQueue_io_req_ready),
    .io_req_valid(writebackQueue_io_req_valid),
    .io_req_bits_addr(writebackQueue_io_req_bits_addr),
    .io_req_bits_dirtyTag(writebackQueue_io_req_bits_dirtyTag),
    .io_req_bits_data_0(writebackQueue_io_req_bits_data_0),
    .io_req_bits_data_1(writebackQueue_io_req_bits_data_1),
    .io_req_bits_data_2(writebackQueue_io_req_bits_data_2),
    .io_req_bits_data_3(writebackQueue_io_req_bits_data_3),
    .io_resp_valid(writebackQueue_io_resp_valid),
    .io_tlbus_req_ready(writebackQueue_io_tlbus_req_ready),
    .io_tlbus_req_valid(writebackQueue_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(writebackQueue_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(writebackQueue_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(writebackQueue_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(writebackQueue_io_tlbus_resp_valid)
  );
  DataBankArray_1 dataBankArray ( // @[DCache_2.scala 41:31]
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
  DCacheDirectory_1 directory ( // @[DCache_2.scala 43:27]
    .clock(directory_clock),
    .reset(directory_reset),
    .io_read_req_ready(directory_io_read_req_ready),
    .io_read_req_valid(directory_io_read_req_valid),
    .io_read_req_bits_addr(directory_io_read_req_bits_addr),
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
  Arbiter mshrReqArb ( // @[DCache_2.scala 63:28]
    .io_in_0_ready(mshrReqArb_io_in_0_ready),
    .io_in_0_valid(mshrReqArb_io_in_0_valid),
    .io_in_0_bits_addr(mshrReqArb_io_in_0_bits_addr),
    .io_in_0_bits_dirInfo_chosenWay(mshrReqArb_io_in_0_bits_dirInfo_chosenWay),
    .io_in_0_bits_dirInfo_isDirtyWay(mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay),
    .io_in_0_bits_dirInfo_dirtyTag(mshrReqArb_io_in_0_bits_dirInfo_dirtyTag),
    .io_in_0_bits_data_0(mshrReqArb_io_in_0_bits_data_0),
    .io_in_0_bits_data_1(mshrReqArb_io_in_0_bits_data_1),
    .io_in_0_bits_data_2(mshrReqArb_io_in_0_bits_data_2),
    .io_in_0_bits_data_3(mshrReqArb_io_in_0_bits_data_3),
    .io_in_1_ready(mshrReqArb_io_in_1_ready),
    .io_in_1_valid(mshrReqArb_io_in_1_valid),
    .io_in_1_bits_addr(mshrReqArb_io_in_1_bits_addr),
    .io_in_1_bits_dirInfo_chosenWay(mshrReqArb_io_in_1_bits_dirInfo_chosenWay),
    .io_in_1_bits_dirInfo_isDirtyWay(mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay),
    .io_in_1_bits_dirInfo_dirtyTag(mshrReqArb_io_in_1_bits_dirInfo_dirtyTag),
    .io_in_1_bits_data_0(mshrReqArb_io_in_1_bits_data_0),
    .io_in_1_bits_data_1(mshrReqArb_io_in_1_bits_data_1),
    .io_in_1_bits_data_2(mshrReqArb_io_in_1_bits_data_2),
    .io_in_1_bits_data_3(mshrReqArb_io_in_1_bits_data_3),
    .io_in_1_bits_storeData(mshrReqArb_io_in_1_bits_storeData),
    .io_in_1_bits_storeMask(mshrReqArb_io_in_1_bits_storeMask),
    .io_out_ready(mshrReqArb_io_out_ready),
    .io_out_valid(mshrReqArb_io_out_valid),
    .io_out_bits_addr(mshrReqArb_io_out_bits_addr),
    .io_out_bits_dirInfo_chosenWay(mshrReqArb_io_out_bits_dirInfo_chosenWay),
    .io_out_bits_dirInfo_isDirtyWay(mshrReqArb_io_out_bits_dirInfo_isDirtyWay),
    .io_out_bits_dirInfo_dirtyTag(mshrReqArb_io_out_bits_dirInfo_dirtyTag),
    .io_out_bits_data_0(mshrReqArb_io_out_bits_data_0),
    .io_out_bits_data_1(mshrReqArb_io_out_bits_data_1),
    .io_out_bits_data_2(mshrReqArb_io_out_bits_data_2),
    .io_out_bits_data_3(mshrReqArb_io_out_bits_data_3),
    .io_out_bits_isStore(mshrReqArb_io_out_bits_isStore),
    .io_out_bits_storeData(mshrReqArb_io_out_bits_storeData),
    .io_out_bits_storeMask(mshrReqArb_io_out_bits_storeMask)
  );
  Arbiter_1 tlbusReqArb ( // @[DCache_2.scala 68:29]
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
  Arbiter_2 loadRespArb ( // @[DCache_2.scala 80:29]
    .io_in_0_valid(loadRespArb_io_in_0_valid),
    .io_in_0_bits_data(loadRespArb_io_in_0_bits_data),
    .io_in_1_ready(loadRespArb_io_in_1_ready),
    .io_in_1_valid(loadRespArb_io_in_1_valid),
    .io_in_1_bits_data(loadRespArb_io_in_1_bits_data),
    .io_out_valid(loadRespArb_io_out_valid),
    .io_out_bits_data(loadRespArb_io_out_bits_data)
  );
  Arbiter_3 storeRespArb ( // @[DCache_2.scala 85:30]
    .io_in_0_valid(storeRespArb_io_in_0_valid),
    .io_in_1_ready(storeRespArb_io_in_1_ready),
    .io_in_1_valid(storeRespArb_io_in_1_valid),
    .io_out_valid(storeRespArb_io_out_valid)
  );
  Arbiter_4 dataBankRdReqArb ( // @[DCache_2.scala 91:34]
    .io_in_0_ready(dataBankRdReqArb_io_in_0_ready),
    .io_in_0_valid(dataBankRdReqArb_io_in_0_valid),
    .io_in_0_bits_set(dataBankRdReqArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankRdReqArb_io_in_0_bits_blockSelOH),
    .io_in_1_ready(dataBankRdReqArb_io_in_1_ready),
    .io_in_1_valid(dataBankRdReqArb_io_in_1_valid),
    .io_in_1_bits_set(dataBankRdReqArb_io_in_1_bits_set),
    .io_in_1_bits_blockSelOH(dataBankRdReqArb_io_in_1_bits_blockSelOH),
    .io_out_ready(dataBankRdReqArb_io_out_ready),
    .io_out_valid(dataBankRdReqArb_io_out_valid),
    .io_out_bits_set(dataBankRdReqArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankRdReqArb_io_out_bits_blockSelOH)
  );
  Arbiter_5 dirRdReqArb ( // @[DCache_2.scala 96:29]
    .io_in_0_valid(dirRdReqArb_io_in_0_valid),
    .io_in_0_bits_addr(dirRdReqArb_io_in_0_bits_addr),
    .io_in_1_ready(dirRdReqArb_io_in_1_ready),
    .io_in_1_valid(dirRdReqArb_io_in_1_valid),
    .io_in_1_bits_addr(dirRdReqArb_io_in_1_bits_addr),
    .io_out_valid(dirRdReqArb_io_out_valid),
    .io_out_bits_addr(dirRdReqArb_io_out_bits_addr)
  );
  Arbiter_6 dataBankWrArb ( // @[DCache_2.scala 102:31]
    .io_in_0_valid(dataBankWrArb_io_in_0_valid),
    .io_in_0_bits_data(dataBankWrArb_io_in_0_bits_data),
    .io_in_0_bits_set(dataBankWrArb_io_in_0_bits_set),
    .io_in_0_bits_blockSelOH(dataBankWrArb_io_in_0_bits_blockSelOH),
    .io_in_0_bits_way(dataBankWrArb_io_in_0_bits_way),
    .io_in_0_bits_mask(dataBankWrArb_io_in_0_bits_mask),
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
    .io_in_2_bits_mask(dataBankWrArb_io_in_2_bits_mask),
    .io_out_valid(dataBankWrArb_io_out_valid),
    .io_out_bits_data(dataBankWrArb_io_out_bits_data),
    .io_out_bits_set(dataBankWrArb_io_out_bits_set),
    .io_out_bits_blockSelOH(dataBankWrArb_io_out_bits_blockSelOH),
    .io_out_bits_way(dataBankWrArb_io_out_bits_way),
    .io_out_bits_mask(dataBankWrArb_io_out_bits_mask)
  );
  Arbiter_7 dirWrArb ( // @[DCache_2.scala 108:26]
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
  assign io_read_req_ready = loadPipe_io_load_req_ready; // @[DCache_2.scala 55:26]
  assign io_read_resp_valid = loadRespArb_io_out_valid; // @[DCache_2.scala 83:18]
  assign io_read_resp_bits_data = loadRespArb_io_out_bits_data; // @[DCache_2.scala 83:18]
  assign io_write_req_ready = storePipe_io_store_req_ready; // @[DCache_2.scala 56:28]
  assign io_write_resp_valid = storeRespArb_io_out_valid; // @[DCache_2.scala 88:19]
  assign io_tlbus_req_valid = tlbusReqArb_io_out_valid; // @[DCache_2.scala 71:18]
  assign io_tlbus_req_bits_opcode = tlbusReqArb_io_out_bits_opcode; // @[DCache_2.scala 71:18]
  assign io_tlbus_req_bits_address = tlbusReqArb_io_out_bits_address; // @[DCache_2.scala 71:18]
  assign io_tlbus_req_bits_data = tlbusReqArb_io_out_bits_data; // @[DCache_2.scala 71:18]
  assign loadPipe_clock = clock;
  assign loadPipe_reset = reset;
  assign loadPipe_io_load_req_valid = io_read_req_valid; // @[DCache_2.scala 55:26]
  assign loadPipe_io_load_req_bits_addr = io_read_req_bits_addr; // @[DCache_2.scala 55:26]
  assign loadPipe_io_dir_req_ready = dirRdReqArb_io_in_1_ready; // @[DCache_2.scala 98:26]
  assign loadPipe_io_dir_resp_bits_hit = directory_io_read_resp_bits_hit; // @[DCache_2.scala 46:31]
  assign loadPipe_io_dir_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[DCache_2.scala 46:31]
  assign loadPipe_io_dir_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[DCache_2.scala 46:31]
  assign loadPipe_io_dir_resp_bits_dirtyTag = directory_io_read_resp_bits_dirtyTag; // @[DCache_2.scala 46:31]
  assign loadPipe_io_dataBank_req_ready = dataBankRdReqArb_io_in_1_ready; // @[DCache_2.scala 93:31]
  assign loadPipe_io_dataBank_resp_bits_data_0 = dataBankArray_io_read_resp_bits_data_0; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_1 = dataBankArray_io_read_resp_bits_data_1; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_2 = dataBankArray_io_read_resp_bits_data_2; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_3 = dataBankArray_io_read_resp_bits_data_3; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_4 = dataBankArray_io_read_resp_bits_data_4; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_5 = dataBankArray_io_read_resp_bits_data_5; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_6 = dataBankArray_io_read_resp_bits_data_6; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_data_7 = dataBankArray_io_read_resp_bits_data_7; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_blockData_2 = dataBankArray_io_read_resp_bits_blockData_2; // @[DCache_2.scala 51:36]
  assign loadPipe_io_dataBank_resp_bits_blockData_3 = dataBankArray_io_read_resp_bits_blockData_3; // @[DCache_2.scala 51:36]
  assign loadPipe_io_mshr_ready = mshrReqArb_io_in_0_ready; // @[DCache_2.scala 64:25]
  assign storePipe_clock = clock;
  assign storePipe_reset = reset;
  assign storePipe_io_store_req_valid = io_write_req_valid; // @[DCache_2.scala 56:28]
  assign storePipe_io_store_req_bits_addr = io_write_req_bits_addr; // @[DCache_2.scala 56:28]
  assign storePipe_io_store_req_bits_data = io_write_req_bits_data; // @[DCache_2.scala 56:28]
  assign storePipe_io_store_req_bits_mask = io_write_req_bits_mask; // @[DCache_2.scala 56:28]
  assign storePipe_io_dir_read_resp_bits_hit = directory_io_read_resp_bits_hit; // @[DCache_2.scala 48:37]
  assign storePipe_io_dir_read_resp_bits_chosenWay = directory_io_read_resp_bits_chosenWay; // @[DCache_2.scala 48:37]
  assign storePipe_io_dir_read_resp_bits_isDirtyWay = directory_io_read_resp_bits_isDirtyWay; // @[DCache_2.scala 48:37]
  assign storePipe_io_dir_read_resp_bits_dirtyTag = directory_io_read_resp_bits_dirtyTag; // @[DCache_2.scala 48:37]
  assign storePipe_io_dataBank_read_req_ready = dataBankRdReqArb_io_in_0_ready; // @[DCache_2.scala 92:31]
  assign storePipe_io_dataBank_read_resp_bits_blockData_0 = dataBankArray_io_read_resp_bits_blockData_0; // @[DCache_2.scala 53:42]
  assign storePipe_io_dataBank_read_resp_bits_blockData_1 = dataBankArray_io_read_resp_bits_blockData_1; // @[DCache_2.scala 53:42]
  assign storePipe_io_dataBank_read_resp_bits_blockData_2 = dataBankArray_io_read_resp_bits_blockData_2; // @[DCache_2.scala 53:42]
  assign storePipe_io_dataBank_read_resp_bits_blockData_3 = dataBankArray_io_read_resp_bits_blockData_3; // @[DCache_2.scala 53:42]
  assign storePipe_io_mshr_ready = mshrReqArb_io_in_1_ready; // @[DCache_2.scala 65:25]
  assign mshr_clock = clock;
  assign mshr_reset = reset;
  assign mshr_io_req_valid = mshrReqArb_io_out_valid; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_addr = mshrReqArb_io_out_bits_addr; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_dirInfo_chosenWay = mshrReqArb_io_out_bits_dirInfo_chosenWay; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_dirInfo_isDirtyWay = mshrReqArb_io_out_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_dirInfo_dirtyTag = mshrReqArb_io_out_bits_dirInfo_dirtyTag; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_data_0 = mshrReqArb_io_out_bits_data_0; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_data_1 = mshrReqArb_io_out_bits_data_1; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_data_2 = mshrReqArb_io_out_bits_data_2; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_data_3 = mshrReqArb_io_out_bits_data_3; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_isStore = mshrReqArb_io_out_bits_isStore; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_storeData = mshrReqArb_io_out_bits_storeData; // @[DCache_2.scala 66:17]
  assign mshr_io_req_bits_storeMask = mshrReqArb_io_out_bits_storeMask; // @[DCache_2.scala 66:17]
  assign mshr_io_resp_load_ready = loadRespArb_io_in_1_ready; // @[DCache_2.scala 82:26]
  assign mshr_io_resp_store_ready = storeRespArb_io_in_1_ready; // @[DCache_2.scala 87:27]
  assign mshr_io_tasks_refill_resp_valid = refillPipe_io_resp_valid; // @[DCache_2.scala 59:31]
  assign mshr_io_tasks_refill_resp_bits_data = refillPipe_io_resp_bits_data; // @[DCache_2.scala 59:31]
  assign mshr_io_tasks_writeback_resp_valid = writebackQueue_io_resp_valid; // @[DCache_2.scala 61:34]
  assign mshr_io_dirWrite_req_ready = dirWrArb_io_in_2_ready; // @[DCache_2.scala 111:23]
  assign mshr_io_dataWrite_req_ready = dataBankWrArb_io_in_2_ready; // @[DCache_2.scala 105:28]
  assign refillPipe_clock = clock;
  assign refillPipe_reset = reset;
  assign refillPipe_io_req_valid = mshr_io_tasks_refill_req_valid; // @[DCache_2.scala 58:30]
  assign refillPipe_io_req_bits_addr = mshr_io_tasks_refill_req_bits_addr; // @[DCache_2.scala 58:30]
  assign refillPipe_io_req_bits_chosenWay = mshr_io_tasks_refill_req_bits_chosenWay; // @[DCache_2.scala 58:30]
  assign refillPipe_io_tlbus_req_ready = tlbusReqArb_io_in_1_ready; // @[DCache_2.scala 70:26]
  assign refillPipe_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache_2.scala 75:36]
  assign refillPipe_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[DCache_2.scala 76:35]
  assign refillPipe_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[DCache_2.scala 76:35]
  assign refillPipe_io_dirWrite_req_ready = dirWrArb_io_in_1_ready; // @[DCache_2.scala 110:23]
  assign refillPipe_io_dataWrite_req_ready = dataBankWrArb_io_in_1_ready; // @[DCache_2.scala 104:28]
  assign writebackQueue_clock = clock;
  assign writebackQueue_reset = reset;
  assign writebackQueue_io_req_valid = mshr_io_tasks_writeback_req_valid; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_addr = mshr_io_tasks_writeback_req_bits_addr; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_dirtyTag = mshr_io_tasks_writeback_req_bits_dirtyTag; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_data_0 = mshr_io_tasks_writeback_req_bits_data_0; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_data_1 = mshr_io_tasks_writeback_req_bits_data_1; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_data_2 = mshr_io_tasks_writeback_req_bits_data_2; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_req_bits_data_3 = mshr_io_tasks_writeback_req_bits_data_3; // @[DCache_2.scala 60:33]
  assign writebackQueue_io_tlbus_req_ready = tlbusReqArb_io_in_0_ready; // @[DCache_2.scala 69:26]
  assign writebackQueue_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[DCache_2.scala 73:40]
  assign dataBankArray_clock = clock;
  assign dataBankArray_reset = reset;
  assign dataBankArray_io_read_req_valid = dataBankRdReqArb_io_out_valid; // @[DCache_2.scala 94:31]
  assign dataBankArray_io_read_req_bits_set = dataBankRdReqArb_io_out_bits_set; // @[DCache_2.scala 94:31]
  assign dataBankArray_io_read_req_bits_blockSelOH = dataBankRdReqArb_io_out_bits_blockSelOH; // @[DCache_2.scala 94:31]
  assign dataBankArray_io_write_req_valid = dataBankWrArb_io_out_valid; // @[DCache_2.scala 106:32]
  assign dataBankArray_io_write_req_bits_data = dataBankWrArb_io_out_bits_data; // @[DCache_2.scala 106:32]
  assign dataBankArray_io_write_req_bits_set = dataBankWrArb_io_out_bits_set; // @[DCache_2.scala 106:32]
  assign dataBankArray_io_write_req_bits_blockSelOH = dataBankWrArb_io_out_bits_blockSelOH; // @[DCache_2.scala 106:32]
  assign dataBankArray_io_write_req_bits_way = dataBankWrArb_io_out_bits_way; // @[DCache_2.scala 106:32]
  assign dataBankArray_io_write_req_bits_mask = dataBankWrArb_io_out_bits_mask; // @[DCache_2.scala 106:32]
  assign directory_clock = clock;
  assign directory_reset = reset;
  assign directory_io_read_req_valid = dirRdReqArb_io_out_valid; // @[DCache_2.scala 99:27]
  assign directory_io_read_req_bits_addr = dirRdReqArb_io_out_bits_addr; // @[DCache_2.scala 99:27]
  assign directory_io_write_req_valid = dirWrArb_io_out_valid; // @[DCache_2.scala 112:28]
  assign directory_io_write_req_bits_addr = dirWrArb_io_out_bits_addr; // @[DCache_2.scala 112:28]
  assign directory_io_write_req_bits_way = dirWrArb_io_out_bits_way; // @[DCache_2.scala 112:28]
  assign directory_io_write_req_bits_meta = dirWrArb_io_out_bits_meta; // @[DCache_2.scala 112:28]
  assign mshrReqArb_io_in_0_valid = loadPipe_io_mshr_valid; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_addr = loadPipe_io_mshr_bits_addr; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_chosenWay = loadPipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_isDirtyWay = loadPipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_dirInfo_dirtyTag = loadPipe_io_mshr_bits_dirInfo_dirtyTag; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_data_0 = loadPipe_io_mshr_bits_data_0; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_data_1 = loadPipe_io_mshr_bits_data_1; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_data_2 = loadPipe_io_mshr_bits_data_2; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_0_bits_data_3 = loadPipe_io_mshr_bits_data_3; // @[DCache_2.scala 64:25]
  assign mshrReqArb_io_in_1_valid = storePipe_io_mshr_valid; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_addr = storePipe_io_mshr_bits_addr; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_chosenWay = storePipe_io_mshr_bits_dirInfo_chosenWay; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_isDirtyWay = storePipe_io_mshr_bits_dirInfo_isDirtyWay; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_dirInfo_dirtyTag = storePipe_io_mshr_bits_dirInfo_dirtyTag; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_data_0 = storePipe_io_mshr_bits_data_0; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_data_1 = storePipe_io_mshr_bits_data_1; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_data_2 = storePipe_io_mshr_bits_data_2; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_data_3 = storePipe_io_mshr_bits_data_3; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_storeData = storePipe_io_mshr_bits_storeData; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_in_1_bits_storeMask = storePipe_io_mshr_bits_storeMask; // @[DCache_2.scala 65:25]
  assign mshrReqArb_io_out_ready = mshr_io_req_ready; // @[DCache_2.scala 66:17]
  assign tlbusReqArb_io_in_0_valid = writebackQueue_io_tlbus_req_valid; // @[DCache_2.scala 69:26]
  assign tlbusReqArb_io_in_0_bits_address = writebackQueue_io_tlbus_req_bits_address; // @[DCache_2.scala 69:26]
  assign tlbusReqArb_io_in_0_bits_data = writebackQueue_io_tlbus_req_bits_data; // @[DCache_2.scala 69:26]
  assign tlbusReqArb_io_in_1_valid = refillPipe_io_tlbus_req_valid; // @[DCache_2.scala 70:26]
  assign tlbusReqArb_io_in_1_bits_address = refillPipe_io_tlbus_req_bits_address; // @[DCache_2.scala 70:26]
  assign tlbusReqArb_io_out_ready = io_tlbus_req_ready; // @[DCache_2.scala 71:18]
  assign loadRespArb_io_in_0_valid = loadPipe_io_load_resp_valid; // @[DCache_2.scala 81:26]
  assign loadRespArb_io_in_0_bits_data = loadPipe_io_load_resp_bits_data; // @[DCache_2.scala 81:26]
  assign loadRespArb_io_in_1_valid = mshr_io_resp_load_valid; // @[DCache_2.scala 82:26]
  assign loadRespArb_io_in_1_bits_data = mshr_io_resp_load_bits_data; // @[DCache_2.scala 82:26]
  assign storeRespArb_io_in_0_valid = storePipe_io_store_resp_valid; // @[DCache_2.scala 86:27]
  assign storeRespArb_io_in_1_valid = mshr_io_resp_store_valid; // @[DCache_2.scala 87:27]
  assign dataBankRdReqArb_io_in_0_valid = storePipe_io_dataBank_read_req_valid; // @[DCache_2.scala 92:31]
  assign dataBankRdReqArb_io_in_0_bits_set = storePipe_io_dataBank_read_req_bits_set; // @[DCache_2.scala 92:31]
  assign dataBankRdReqArb_io_in_0_bits_blockSelOH = storePipe_io_dataBank_read_req_bits_blockSelOH; // @[DCache_2.scala 92:31]
  assign dataBankRdReqArb_io_in_1_valid = loadPipe_io_dataBank_req_valid; // @[DCache_2.scala 93:31]
  assign dataBankRdReqArb_io_in_1_bits_set = loadPipe_io_dataBank_req_bits_set; // @[DCache_2.scala 93:31]
  assign dataBankRdReqArb_io_in_1_bits_blockSelOH = loadPipe_io_dataBank_req_bits_blockSelOH; // @[DCache_2.scala 93:31]
  assign dataBankRdReqArb_io_out_ready = dataBankArray_io_read_req_ready; // @[DCache_2.scala 94:31]
  assign dirRdReqArb_io_in_0_valid = storePipe_io_dir_read_req_valid; // @[DCache_2.scala 97:26]
  assign dirRdReqArb_io_in_0_bits_addr = storePipe_io_dir_read_req_bits_addr; // @[DCache_2.scala 97:26]
  assign dirRdReqArb_io_in_1_valid = loadPipe_io_dir_req_valid; // @[DCache_2.scala 98:26]
  assign dirRdReqArb_io_in_1_bits_addr = loadPipe_io_dir_req_bits_addr; // @[DCache_2.scala 98:26]
  assign dataBankWrArb_io_in_0_valid = storePipe_io_dataBank_write_req_valid; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_0_bits_data = storePipe_io_dataBank_write_req_bits_data; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_0_bits_set = storePipe_io_dataBank_write_req_bits_set; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_0_bits_blockSelOH = storePipe_io_dataBank_write_req_bits_blockSelOH; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_0_bits_way = storePipe_io_dataBank_write_req_bits_way; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_0_bits_mask = storePipe_io_dataBank_write_req_bits_mask; // @[DCache_2.scala 103:28]
  assign dataBankWrArb_io_in_1_valid = refillPipe_io_dataWrite_req_valid; // @[DCache_2.scala 104:28]
  assign dataBankWrArb_io_in_1_bits_data = refillPipe_io_dataWrite_req_bits_data; // @[DCache_2.scala 104:28]
  assign dataBankWrArb_io_in_1_bits_set = refillPipe_io_dataWrite_req_bits_set; // @[DCache_2.scala 104:28]
  assign dataBankWrArb_io_in_1_bits_blockSelOH = refillPipe_io_dataWrite_req_bits_blockSelOH; // @[DCache_2.scala 104:28]
  assign dataBankWrArb_io_in_1_bits_way = refillPipe_io_dataWrite_req_bits_way; // @[DCache_2.scala 104:28]
  assign dataBankWrArb_io_in_2_valid = mshr_io_dataWrite_req_valid; // @[DCache_2.scala 105:28]
  assign dataBankWrArb_io_in_2_bits_data = mshr_io_dataWrite_req_bits_data; // @[DCache_2.scala 105:28]
  assign dataBankWrArb_io_in_2_bits_set = mshr_io_dataWrite_req_bits_set; // @[DCache_2.scala 105:28]
  assign dataBankWrArb_io_in_2_bits_blockSelOH = mshr_io_dataWrite_req_bits_blockSelOH; // @[DCache_2.scala 105:28]
  assign dataBankWrArb_io_in_2_bits_way = mshr_io_dataWrite_req_bits_way; // @[DCache_2.scala 105:28]
  assign dataBankWrArb_io_in_2_bits_mask = mshr_io_dataWrite_req_bits_mask; // @[DCache_2.scala 105:28]
  assign dirWrArb_io_in_0_valid = storePipe_io_dir_write_req_valid; // @[DCache_2.scala 109:23]
  assign dirWrArb_io_in_0_bits_addr = storePipe_io_dir_write_req_bits_addr; // @[DCache_2.scala 109:23]
  assign dirWrArb_io_in_0_bits_way = storePipe_io_dir_write_req_bits_way; // @[DCache_2.scala 109:23]
  assign dirWrArb_io_in_1_valid = refillPipe_io_dirWrite_req_valid; // @[DCache_2.scala 110:23]
  assign dirWrArb_io_in_1_bits_addr = refillPipe_io_dirWrite_req_bits_addr; // @[DCache_2.scala 110:23]
  assign dirWrArb_io_in_1_bits_way = refillPipe_io_dirWrite_req_bits_way; // @[DCache_2.scala 110:23]
  assign dirWrArb_io_in_2_valid = mshr_io_dirWrite_req_valid; // @[DCache_2.scala 111:23]
  assign dirWrArb_io_in_2_bits_addr = mshr_io_dirWrite_req_bits_addr; // @[DCache_2.scala 111:23]
  assign dirWrArb_io_in_2_bits_way = mshr_io_dirWrite_req_bits_way; // @[DCache_2.scala 111:23]
endmodule
