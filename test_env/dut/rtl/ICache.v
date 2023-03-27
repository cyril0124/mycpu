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
