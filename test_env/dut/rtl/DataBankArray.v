module DataBankArray(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [5:0]   io_read_req_bits_set,
  input  [1:0]   io_read_req_bits_blockSelOH,
  output [31:0]  io_read_resp_bits_data_0,
  output [31:0]  io_read_resp_bits_data_1,
  output [31:0]  io_read_resp_bits_data_2,
  output [31:0]  io_read_resp_bits_data_3,
  output [127:0] io_read_resp_bits_blockData_0,
  output [127:0] io_read_resp_bits_blockData_1,
  output         io_write_req_ready,
  input          io_write_req_valid,
  input  [31:0]  io_write_req_bits_data,
  input  [5:0]   io_write_req_bits_set,
  input  [1:0]   io_write_req_bits_blockSelOH,
  input  [3:0]   io_write_req_bits_way,
  input  [3:0]   io_write_req_bits_mask
);
  wire  dataBanks_0_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_0_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_0_io_w_en; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_0_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_0_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_w_data; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_0_io_w_mask; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_0_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_1_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_1_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_1_io_w_en; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_1_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_1_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_w_data; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_1_io_w_mask; // @[DataBank.scala 90:53]
  wire [5:0] dataBanks_1_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_3; // @[DataBank.scala 90:53]
  wire  _dataBanks_0_io_w_en_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [31:0] blockData_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_2 = io_read_req_bits_blockSelOH[0] ? blockData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_3 = io_read_req_bits_blockSelOH[1] ? blockData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_5 = io_read_req_bits_blockSelOH[0] ? blockData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_6 = io_read_req_bits_blockSelOH[1] ? blockData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_8 = io_read_req_bits_blockSelOH[0] ? blockData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_9 = io_read_req_bits_blockSelOH[1] ? blockData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_11 = io_read_req_bits_blockSelOH[0] ? blockData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_12 = io_read_req_bits_blockSelOH[1] ? blockData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [63:0] lo = {blockData_0_1,blockData_0_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi = {blockData_0_3,blockData_0_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_1 = {blockData_1_1,blockData_1_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_1 = {blockData_1_3,blockData_1_2}; // @[DataBank.scala 109:57]
  DataBank dataBanks_0 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_0_clock),
    .reset(dataBanks_0_reset),
    .io_w_en(dataBanks_0_io_w_en),
    .io_w_set(dataBanks_0_io_w_set),
    .io_w_way(dataBanks_0_io_w_way),
    .io_w_data(dataBanks_0_io_w_data),
    .io_w_mask(dataBanks_0_io_w_mask),
    .io_r_set(dataBanks_0_io_r_set),
    .io_r_data_0(dataBanks_0_io_r_data_0),
    .io_r_data_1(dataBanks_0_io_r_data_1),
    .io_r_data_2(dataBanks_0_io_r_data_2),
    .io_r_data_3(dataBanks_0_io_r_data_3)
  );
  DataBank dataBanks_1 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_1_clock),
    .reset(dataBanks_1_reset),
    .io_w_en(dataBanks_1_io_w_en),
    .io_w_set(dataBanks_1_io_w_set),
    .io_w_way(dataBanks_1_io_w_way),
    .io_w_data(dataBanks_1_io_w_data),
    .io_w_mask(dataBanks_1_io_w_mask),
    .io_r_set(dataBanks_1_io_r_set),
    .io_r_data_0(dataBanks_1_io_r_data_0),
    .io_r_data_1(dataBanks_1_io_r_data_1),
    .io_r_data_2(dataBanks_1_io_r_data_2),
    .io_r_data_3(dataBanks_1_io_r_data_3)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 87:23]
  assign io_read_resp_bits_data_0 = _T_2 | _T_3; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_1 = _T_5 | _T_6; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_2 = _T_8 | _T_9; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_3 = _T_11 | _T_12; // @[Mux.scala 27:73]
  assign io_read_resp_bits_blockData_0 = {hi,lo}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_1 = {hi_1,lo_1}; // @[DataBank.scala 109:57]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 88:24]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[0]; // @[DataBank.scala 100:51]
  assign dataBanks_0_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_0_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_0_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_0_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 104:32]
  assign dataBanks_0_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[1]; // @[DataBank.scala 100:51]
  assign dataBanks_1_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_1_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_1_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_1_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 104:32]
  assign dataBanks_1_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
endmodule
