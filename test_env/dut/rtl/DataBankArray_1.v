module DataBankArray_1(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [7:0]   io_read_req_bits_set,
  input  [3:0]   io_read_req_bits_blockSelOH,
  output [31:0]  io_read_resp_bits_data_0,
  output [31:0]  io_read_resp_bits_data_1,
  output [31:0]  io_read_resp_bits_data_2,
  output [31:0]  io_read_resp_bits_data_3,
  output [31:0]  io_read_resp_bits_data_4,
  output [31:0]  io_read_resp_bits_data_5,
  output [31:0]  io_read_resp_bits_data_6,
  output [31:0]  io_read_resp_bits_data_7,
  output [255:0] io_read_resp_bits_blockData_0,
  output [255:0] io_read_resp_bits_blockData_1,
  output [255:0] io_read_resp_bits_blockData_2,
  output [255:0] io_read_resp_bits_blockData_3,
  output         io_write_req_ready,
  input          io_write_req_valid,
  input  [31:0]  io_write_req_bits_data,
  input  [7:0]   io_write_req_bits_set,
  input  [3:0]   io_write_req_bits_blockSelOH,
  input  [7:0]   io_write_req_bits_way,
  input  [3:0]   io_write_req_bits_mask
);
  wire  dataBanks_0_clock; // @[DataBank.scala 94:53]
  wire  dataBanks_0_reset; // @[DataBank.scala 94:53]
  wire  dataBanks_0_io_w_en; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_0_io_w_set; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_0_io_w_way; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_w_data; // @[DataBank.scala 94:53]
  wire [3:0] dataBanks_0_io_w_mask; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_0_io_r_set; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_0; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_1; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_2; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_3; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_4; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_5; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_6; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_0_io_r_data_7; // @[DataBank.scala 94:53]
  wire  dataBanks_1_clock; // @[DataBank.scala 94:53]
  wire  dataBanks_1_reset; // @[DataBank.scala 94:53]
  wire  dataBanks_1_io_w_en; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_1_io_w_set; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_1_io_w_way; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_w_data; // @[DataBank.scala 94:53]
  wire [3:0] dataBanks_1_io_w_mask; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_1_io_r_set; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_0; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_1; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_2; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_3; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_4; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_5; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_6; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_1_io_r_data_7; // @[DataBank.scala 94:53]
  wire  dataBanks_2_clock; // @[DataBank.scala 94:53]
  wire  dataBanks_2_reset; // @[DataBank.scala 94:53]
  wire  dataBanks_2_io_w_en; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_2_io_w_set; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_2_io_w_way; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_w_data; // @[DataBank.scala 94:53]
  wire [3:0] dataBanks_2_io_w_mask; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_2_io_r_set; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_0; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_1; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_2; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_3; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_4; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_5; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_6; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_2_io_r_data_7; // @[DataBank.scala 94:53]
  wire  dataBanks_3_clock; // @[DataBank.scala 94:53]
  wire  dataBanks_3_reset; // @[DataBank.scala 94:53]
  wire  dataBanks_3_io_w_en; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_3_io_w_set; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_3_io_w_way; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_w_data; // @[DataBank.scala 94:53]
  wire [3:0] dataBanks_3_io_w_mask; // @[DataBank.scala 94:53]
  wire [7:0] dataBanks_3_io_r_set; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_0; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_1; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_2; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_3; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_4; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_5; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_6; // @[DataBank.scala 94:53]
  wire [31:0] dataBanks_3_io_r_data_7; // @[DataBank.scala 94:53]
  wire  _dataBanks_0_io_w_en_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [31:0] blockData_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_4 = io_read_req_bits_blockSelOH[0] ? blockData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_5 = io_read_req_bits_blockSelOH[1] ? blockData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_0 = dataBanks_2_io_r_data_0; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_6 = io_read_req_bits_blockSelOH[2] ? blockData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_0 = dataBanks_3_io_r_data_0; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_7 = io_read_req_bits_blockSelOH[3] ? blockData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_8 = _T_4 | _T_5; // @[Mux.scala 27:73]
  wire [31:0] _T_9 = _T_8 | _T_6; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_11 = io_read_req_bits_blockSelOH[0] ? blockData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_12 = io_read_req_bits_blockSelOH[1] ? blockData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_1 = dataBanks_2_io_r_data_1; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_13 = io_read_req_bits_blockSelOH[2] ? blockData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_1 = dataBanks_3_io_r_data_1; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_14 = io_read_req_bits_blockSelOH[3] ? blockData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_15 = _T_11 | _T_12; // @[Mux.scala 27:73]
  wire [31:0] _T_16 = _T_15 | _T_13; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_18 = io_read_req_bits_blockSelOH[0] ? blockData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_19 = io_read_req_bits_blockSelOH[1] ? blockData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_2 = dataBanks_2_io_r_data_2; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_20 = io_read_req_bits_blockSelOH[2] ? blockData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_2 = dataBanks_3_io_r_data_2; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_21 = io_read_req_bits_blockSelOH[3] ? blockData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_22 = _T_18 | _T_19; // @[Mux.scala 27:73]
  wire [31:0] _T_23 = _T_22 | _T_20; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_25 = io_read_req_bits_blockSelOH[0] ? blockData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_26 = io_read_req_bits_blockSelOH[1] ? blockData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_3 = dataBanks_2_io_r_data_3; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_27 = io_read_req_bits_blockSelOH[2] ? blockData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_3 = dataBanks_3_io_r_data_3; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_28 = io_read_req_bits_blockSelOH[3] ? blockData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_29 = _T_25 | _T_26; // @[Mux.scala 27:73]
  wire [31:0] _T_30 = _T_29 | _T_27; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_4 = dataBanks_0_io_r_data_4; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_32 = io_read_req_bits_blockSelOH[0] ? blockData_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_4 = dataBanks_1_io_r_data_4; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_33 = io_read_req_bits_blockSelOH[1] ? blockData_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_4 = dataBanks_2_io_r_data_4; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_34 = io_read_req_bits_blockSelOH[2] ? blockData_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_4 = dataBanks_3_io_r_data_4; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_35 = io_read_req_bits_blockSelOH[3] ? blockData_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_36 = _T_32 | _T_33; // @[Mux.scala 27:73]
  wire [31:0] _T_37 = _T_36 | _T_34; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_5 = dataBanks_0_io_r_data_5; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_39 = io_read_req_bits_blockSelOH[0] ? blockData_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_5 = dataBanks_1_io_r_data_5; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_40 = io_read_req_bits_blockSelOH[1] ? blockData_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_5 = dataBanks_2_io_r_data_5; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_41 = io_read_req_bits_blockSelOH[2] ? blockData_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_5 = dataBanks_3_io_r_data_5; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_42 = io_read_req_bits_blockSelOH[3] ? blockData_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_43 = _T_39 | _T_40; // @[Mux.scala 27:73]
  wire [31:0] _T_44 = _T_43 | _T_41; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_6 = dataBanks_0_io_r_data_6; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_46 = io_read_req_bits_blockSelOH[0] ? blockData_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_6 = dataBanks_1_io_r_data_6; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_47 = io_read_req_bits_blockSelOH[1] ? blockData_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_6 = dataBanks_2_io_r_data_6; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_48 = io_read_req_bits_blockSelOH[2] ? blockData_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_6 = dataBanks_3_io_r_data_6; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_49 = io_read_req_bits_blockSelOH[3] ? blockData_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_50 = _T_46 | _T_47; // @[Mux.scala 27:73]
  wire [31:0] _T_51 = _T_50 | _T_48; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_7 = dataBanks_0_io_r_data_7; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_53 = io_read_req_bits_blockSelOH[0] ? blockData_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_7 = dataBanks_1_io_r_data_7; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_54 = io_read_req_bits_blockSelOH[1] ? blockData_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_7 = dataBanks_2_io_r_data_7; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_55 = io_read_req_bits_blockSelOH[2] ? blockData_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_7 = dataBanks_3_io_r_data_7; // @[DataBank.scala 111:{28,28}]
  wire [31:0] _T_56 = io_read_req_bits_blockSelOH[3] ? blockData_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_57 = _T_53 | _T_54; // @[Mux.scala 27:73]
  wire [31:0] _T_58 = _T_57 | _T_55; // @[Mux.scala 27:73]
  wire [127:0] lo = {blockData_0_3,blockData_0_2,blockData_0_1,blockData_0_0}; // @[DataBank.scala 113:57]
  wire [127:0] hi = {blockData_0_7,blockData_0_6,blockData_0_5,blockData_0_4}; // @[DataBank.scala 113:57]
  wire [127:0] lo_1 = {blockData_1_3,blockData_1_2,blockData_1_1,blockData_1_0}; // @[DataBank.scala 113:57]
  wire [127:0] hi_1 = {blockData_1_7,blockData_1_6,blockData_1_5,blockData_1_4}; // @[DataBank.scala 113:57]
  wire [127:0] lo_2 = {blockData_2_3,blockData_2_2,blockData_2_1,blockData_2_0}; // @[DataBank.scala 113:57]
  wire [127:0] hi_2 = {blockData_2_7,blockData_2_6,blockData_2_5,blockData_2_4}; // @[DataBank.scala 113:57]
  wire [127:0] lo_3 = {blockData_3_3,blockData_3_2,blockData_3_1,blockData_3_0}; // @[DataBank.scala 113:57]
  wire [127:0] hi_3 = {blockData_3_7,blockData_3_6,blockData_3_5,blockData_3_4}; // @[DataBank.scala 113:57]
  DataBank_8 dataBanks_0 ( // @[DataBank.scala 94:53]
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
    .io_r_data_3(dataBanks_0_io_r_data_3),
    .io_r_data_4(dataBanks_0_io_r_data_4),
    .io_r_data_5(dataBanks_0_io_r_data_5),
    .io_r_data_6(dataBanks_0_io_r_data_6),
    .io_r_data_7(dataBanks_0_io_r_data_7)
  );
  DataBank_8 dataBanks_1 ( // @[DataBank.scala 94:53]
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
    .io_r_data_3(dataBanks_1_io_r_data_3),
    .io_r_data_4(dataBanks_1_io_r_data_4),
    .io_r_data_5(dataBanks_1_io_r_data_5),
    .io_r_data_6(dataBanks_1_io_r_data_6),
    .io_r_data_7(dataBanks_1_io_r_data_7)
  );
  DataBank_8 dataBanks_2 ( // @[DataBank.scala 94:53]
    .clock(dataBanks_2_clock),
    .reset(dataBanks_2_reset),
    .io_w_en(dataBanks_2_io_w_en),
    .io_w_set(dataBanks_2_io_w_set),
    .io_w_way(dataBanks_2_io_w_way),
    .io_w_data(dataBanks_2_io_w_data),
    .io_w_mask(dataBanks_2_io_w_mask),
    .io_r_set(dataBanks_2_io_r_set),
    .io_r_data_0(dataBanks_2_io_r_data_0),
    .io_r_data_1(dataBanks_2_io_r_data_1),
    .io_r_data_2(dataBanks_2_io_r_data_2),
    .io_r_data_3(dataBanks_2_io_r_data_3),
    .io_r_data_4(dataBanks_2_io_r_data_4),
    .io_r_data_5(dataBanks_2_io_r_data_5),
    .io_r_data_6(dataBanks_2_io_r_data_6),
    .io_r_data_7(dataBanks_2_io_r_data_7)
  );
  DataBank_8 dataBanks_3 ( // @[DataBank.scala 94:53]
    .clock(dataBanks_3_clock),
    .reset(dataBanks_3_reset),
    .io_w_en(dataBanks_3_io_w_en),
    .io_w_set(dataBanks_3_io_w_set),
    .io_w_way(dataBanks_3_io_w_way),
    .io_w_data(dataBanks_3_io_w_data),
    .io_w_mask(dataBanks_3_io_w_mask),
    .io_r_set(dataBanks_3_io_r_set),
    .io_r_data_0(dataBanks_3_io_r_data_0),
    .io_r_data_1(dataBanks_3_io_r_data_1),
    .io_r_data_2(dataBanks_3_io_r_data_2),
    .io_r_data_3(dataBanks_3_io_r_data_3),
    .io_r_data_4(dataBanks_3_io_r_data_4),
    .io_r_data_5(dataBanks_3_io_r_data_5),
    .io_r_data_6(dataBanks_3_io_r_data_6),
    .io_r_data_7(dataBanks_3_io_r_data_7)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 91:23]
  assign io_read_resp_bits_data_0 = _T_9 | _T_7; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_1 = _T_16 | _T_14; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_2 = _T_23 | _T_21; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_3 = _T_30 | _T_28; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_4 = _T_37 | _T_35; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_5 = _T_44 | _T_42; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_6 = _T_51 | _T_49; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_7 = _T_58 | _T_56; // @[Mux.scala 27:73]
  assign io_read_resp_bits_blockData_0 = {hi,lo}; // @[DataBank.scala 113:57]
  assign io_read_resp_bits_blockData_1 = {hi_1,lo_1}; // @[DataBank.scala 113:57]
  assign io_read_resp_bits_blockData_2 = {hi_2,lo_2}; // @[DataBank.scala 113:57]
  assign io_read_resp_bits_blockData_3 = {hi_3,lo_3}; // @[DataBank.scala 113:57]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 92:24]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[0]; // @[DataBank.scala 104:51]
  assign dataBanks_0_io_w_set = io_write_req_bits_set; // @[DataBank.scala 107:31]
  assign dataBanks_0_io_w_way = io_write_req_bits_way; // @[DataBank.scala 106:31]
  assign dataBanks_0_io_w_data = io_write_req_bits_data; // @[DataBank.scala 105:32]
  assign dataBanks_0_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 108:32]
  assign dataBanks_0_io_r_set = io_read_req_bits_set; // @[DataBank.scala 102:31]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[1]; // @[DataBank.scala 104:51]
  assign dataBanks_1_io_w_set = io_write_req_bits_set; // @[DataBank.scala 107:31]
  assign dataBanks_1_io_w_way = io_write_req_bits_way; // @[DataBank.scala 106:31]
  assign dataBanks_1_io_w_data = io_write_req_bits_data; // @[DataBank.scala 105:32]
  assign dataBanks_1_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 108:32]
  assign dataBanks_1_io_r_set = io_read_req_bits_set; // @[DataBank.scala 102:31]
  assign dataBanks_2_clock = clock;
  assign dataBanks_2_reset = reset;
  assign dataBanks_2_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[2]; // @[DataBank.scala 104:51]
  assign dataBanks_2_io_w_set = io_write_req_bits_set; // @[DataBank.scala 107:31]
  assign dataBanks_2_io_w_way = io_write_req_bits_way; // @[DataBank.scala 106:31]
  assign dataBanks_2_io_w_data = io_write_req_bits_data; // @[DataBank.scala 105:32]
  assign dataBanks_2_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 108:32]
  assign dataBanks_2_io_r_set = io_read_req_bits_set; // @[DataBank.scala 102:31]
  assign dataBanks_3_clock = clock;
  assign dataBanks_3_reset = reset;
  assign dataBanks_3_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[3]; // @[DataBank.scala 104:51]
  assign dataBanks_3_io_w_set = io_write_req_bits_set; // @[DataBank.scala 107:31]
  assign dataBanks_3_io_w_way = io_write_req_bits_way; // @[DataBank.scala 106:31]
  assign dataBanks_3_io_w_data = io_write_req_bits_data; // @[DataBank.scala 105:32]
  assign dataBanks_3_io_w_mask = io_write_req_bits_mask; // @[DataBank.scala 108:32]
  assign dataBanks_3_io_r_set = io_read_req_bits_set; // @[DataBank.scala 102:31]
endmodule
