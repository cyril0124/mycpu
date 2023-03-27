module DataBankArray(
  input          clock,
  input          reset,
  output         io_read_req_ready,
  input          io_read_req_valid,
  input  [6:0]   io_read_req_bits_set,
  input  [7:0]   io_read_req_bits_blockSelOH,
  output [31:0]  io_read_resp_bits_data_0,
  output [31:0]  io_read_resp_bits_data_1,
  output [31:0]  io_read_resp_bits_data_2,
  output [31:0]  io_read_resp_bits_data_3,
  output [127:0] io_read_resp_bits_blockData_0,
  output [127:0] io_read_resp_bits_blockData_1,
  output [127:0] io_read_resp_bits_blockData_2,
  output [127:0] io_read_resp_bits_blockData_3,
  output [127:0] io_read_resp_bits_blockData_4,
  output [127:0] io_read_resp_bits_blockData_5,
  output [127:0] io_read_resp_bits_blockData_6,
  output [127:0] io_read_resp_bits_blockData_7,
  output         io_write_req_ready,
  input          io_write_req_valid,
  input  [31:0]  io_write_req_bits_data,
  input  [6:0]   io_write_req_bits_set,
  input  [7:0]   io_write_req_bits_blockSelOH,
  input  [3:0]   io_write_req_bits_way
);
  wire  dataBanks_0_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_0_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_0_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_0_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_0_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_0_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_0_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_1_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_1_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_1_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_1_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_1_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_1_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_1_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_2_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_2_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_2_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_2_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_2_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_2_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_2_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_2_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_2_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_2_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_2_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_3_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_3_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_3_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_3_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_3_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_3_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_3_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_3_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_3_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_3_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_3_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_4_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_4_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_4_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_4_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_4_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_4_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_4_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_4_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_4_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_4_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_4_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_5_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_5_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_5_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_5_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_5_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_5_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_5_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_5_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_5_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_5_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_5_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_6_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_6_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_6_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_6_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_6_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_6_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_6_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_6_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_6_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_6_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_6_io_r_data_3; // @[DataBank.scala 90:53]
  wire  dataBanks_7_clock; // @[DataBank.scala 90:53]
  wire  dataBanks_7_reset; // @[DataBank.scala 90:53]
  wire  dataBanks_7_io_w_en; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_7_io_w_set; // @[DataBank.scala 90:53]
  wire [3:0] dataBanks_7_io_w_way; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_7_io_w_data; // @[DataBank.scala 90:53]
  wire [6:0] dataBanks_7_io_r_set; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_7_io_r_data_0; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_7_io_r_data_1; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_7_io_r_data_2; // @[DataBank.scala 90:53]
  wire [31:0] dataBanks_7_io_r_data_3; // @[DataBank.scala 90:53]
  wire  _dataBanks_0_io_w_en_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [31:0] blockData_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_8 = io_read_req_bits_blockSelOH[0] ? blockData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_9 = io_read_req_bits_blockSelOH[1] ? blockData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_0 = dataBanks_2_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_10 = io_read_req_bits_blockSelOH[2] ? blockData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_0 = dataBanks_3_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_11 = io_read_req_bits_blockSelOH[3] ? blockData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_0 = dataBanks_4_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_12 = io_read_req_bits_blockSelOH[4] ? blockData_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_0 = dataBanks_5_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_13 = io_read_req_bits_blockSelOH[5] ? blockData_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_0 = dataBanks_6_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_14 = io_read_req_bits_blockSelOH[6] ? blockData_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_0 = dataBanks_7_io_r_data_0; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_15 = io_read_req_bits_blockSelOH[7] ? blockData_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_16 = _T_8 | _T_9; // @[Mux.scala 27:73]
  wire [31:0] _T_17 = _T_16 | _T_10; // @[Mux.scala 27:73]
  wire [31:0] _T_18 = _T_17 | _T_11; // @[Mux.scala 27:73]
  wire [31:0] _T_19 = _T_18 | _T_12; // @[Mux.scala 27:73]
  wire [31:0] _T_20 = _T_19 | _T_13; // @[Mux.scala 27:73]
  wire [31:0] _T_21 = _T_20 | _T_14; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_23 = io_read_req_bits_blockSelOH[0] ? blockData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_24 = io_read_req_bits_blockSelOH[1] ? blockData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_1 = dataBanks_2_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_25 = io_read_req_bits_blockSelOH[2] ? blockData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_1 = dataBanks_3_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_26 = io_read_req_bits_blockSelOH[3] ? blockData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_1 = dataBanks_4_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_27 = io_read_req_bits_blockSelOH[4] ? blockData_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_1 = dataBanks_5_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_28 = io_read_req_bits_blockSelOH[5] ? blockData_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_1 = dataBanks_6_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_29 = io_read_req_bits_blockSelOH[6] ? blockData_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_1 = dataBanks_7_io_r_data_1; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_30 = io_read_req_bits_blockSelOH[7] ? blockData_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_31 = _T_23 | _T_24; // @[Mux.scala 27:73]
  wire [31:0] _T_32 = _T_31 | _T_25; // @[Mux.scala 27:73]
  wire [31:0] _T_33 = _T_32 | _T_26; // @[Mux.scala 27:73]
  wire [31:0] _T_34 = _T_33 | _T_27; // @[Mux.scala 27:73]
  wire [31:0] _T_35 = _T_34 | _T_28; // @[Mux.scala 27:73]
  wire [31:0] _T_36 = _T_35 | _T_29; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_38 = io_read_req_bits_blockSelOH[0] ? blockData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_39 = io_read_req_bits_blockSelOH[1] ? blockData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_2 = dataBanks_2_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_40 = io_read_req_bits_blockSelOH[2] ? blockData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_2 = dataBanks_3_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_41 = io_read_req_bits_blockSelOH[3] ? blockData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_2 = dataBanks_4_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_42 = io_read_req_bits_blockSelOH[4] ? blockData_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_2 = dataBanks_5_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_43 = io_read_req_bits_blockSelOH[5] ? blockData_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_2 = dataBanks_6_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_44 = io_read_req_bits_blockSelOH[6] ? blockData_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_2 = dataBanks_7_io_r_data_2; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_45 = io_read_req_bits_blockSelOH[7] ? blockData_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_46 = _T_38 | _T_39; // @[Mux.scala 27:73]
  wire [31:0] _T_47 = _T_46 | _T_40; // @[Mux.scala 27:73]
  wire [31:0] _T_48 = _T_47 | _T_41; // @[Mux.scala 27:73]
  wire [31:0] _T_49 = _T_48 | _T_42; // @[Mux.scala 27:73]
  wire [31:0] _T_50 = _T_49 | _T_43; // @[Mux.scala 27:73]
  wire [31:0] _T_51 = _T_50 | _T_44; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_53 = io_read_req_bits_blockSelOH[0] ? blockData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_54 = io_read_req_bits_blockSelOH[1] ? blockData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_3 = dataBanks_2_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_55 = io_read_req_bits_blockSelOH[2] ? blockData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_3 = dataBanks_3_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_56 = io_read_req_bits_blockSelOH[3] ? blockData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_3 = dataBanks_4_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_57 = io_read_req_bits_blockSelOH[4] ? blockData_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_3 = dataBanks_5_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_58 = io_read_req_bits_blockSelOH[5] ? blockData_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_3 = dataBanks_6_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_59 = io_read_req_bits_blockSelOH[6] ? blockData_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_3 = dataBanks_7_io_r_data_3; // @[DataBank.scala 107:{28,28}]
  wire [31:0] _T_60 = io_read_req_bits_blockSelOH[7] ? blockData_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_61 = _T_53 | _T_54; // @[Mux.scala 27:73]
  wire [31:0] _T_62 = _T_61 | _T_55; // @[Mux.scala 27:73]
  wire [31:0] _T_63 = _T_62 | _T_56; // @[Mux.scala 27:73]
  wire [31:0] _T_64 = _T_63 | _T_57; // @[Mux.scala 27:73]
  wire [31:0] _T_65 = _T_64 | _T_58; // @[Mux.scala 27:73]
  wire [31:0] _T_66 = _T_65 | _T_59; // @[Mux.scala 27:73]
  wire [63:0] lo = {blockData_0_1,blockData_0_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi = {blockData_0_3,blockData_0_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_1 = {blockData_1_1,blockData_1_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_1 = {blockData_1_3,blockData_1_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_2 = {blockData_2_1,blockData_2_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_2 = {blockData_2_3,blockData_2_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_3 = {blockData_3_1,blockData_3_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_3 = {blockData_3_3,blockData_3_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_4 = {blockData_4_1,blockData_4_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_4 = {blockData_4_3,blockData_4_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_5 = {blockData_5_1,blockData_5_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_5 = {blockData_5_3,blockData_5_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_6 = {blockData_6_1,blockData_6_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_6 = {blockData_6_3,blockData_6_2}; // @[DataBank.scala 109:57]
  wire [63:0] lo_7 = {blockData_7_1,blockData_7_0}; // @[DataBank.scala 109:57]
  wire [63:0] hi_7 = {blockData_7_3,blockData_7_2}; // @[DataBank.scala 109:57]
  DataBank dataBanks_0 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_0_clock),
    .reset(dataBanks_0_reset),
    .io_w_en(dataBanks_0_io_w_en),
    .io_w_set(dataBanks_0_io_w_set),
    .io_w_way(dataBanks_0_io_w_way),
    .io_w_data(dataBanks_0_io_w_data),
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
    .io_r_set(dataBanks_1_io_r_set),
    .io_r_data_0(dataBanks_1_io_r_data_0),
    .io_r_data_1(dataBanks_1_io_r_data_1),
    .io_r_data_2(dataBanks_1_io_r_data_2),
    .io_r_data_3(dataBanks_1_io_r_data_3)
  );
  DataBank dataBanks_2 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_2_clock),
    .reset(dataBanks_2_reset),
    .io_w_en(dataBanks_2_io_w_en),
    .io_w_set(dataBanks_2_io_w_set),
    .io_w_way(dataBanks_2_io_w_way),
    .io_w_data(dataBanks_2_io_w_data),
    .io_r_set(dataBanks_2_io_r_set),
    .io_r_data_0(dataBanks_2_io_r_data_0),
    .io_r_data_1(dataBanks_2_io_r_data_1),
    .io_r_data_2(dataBanks_2_io_r_data_2),
    .io_r_data_3(dataBanks_2_io_r_data_3)
  );
  DataBank dataBanks_3 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_3_clock),
    .reset(dataBanks_3_reset),
    .io_w_en(dataBanks_3_io_w_en),
    .io_w_set(dataBanks_3_io_w_set),
    .io_w_way(dataBanks_3_io_w_way),
    .io_w_data(dataBanks_3_io_w_data),
    .io_r_set(dataBanks_3_io_r_set),
    .io_r_data_0(dataBanks_3_io_r_data_0),
    .io_r_data_1(dataBanks_3_io_r_data_1),
    .io_r_data_2(dataBanks_3_io_r_data_2),
    .io_r_data_3(dataBanks_3_io_r_data_3)
  );
  DataBank dataBanks_4 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_4_clock),
    .reset(dataBanks_4_reset),
    .io_w_en(dataBanks_4_io_w_en),
    .io_w_set(dataBanks_4_io_w_set),
    .io_w_way(dataBanks_4_io_w_way),
    .io_w_data(dataBanks_4_io_w_data),
    .io_r_set(dataBanks_4_io_r_set),
    .io_r_data_0(dataBanks_4_io_r_data_0),
    .io_r_data_1(dataBanks_4_io_r_data_1),
    .io_r_data_2(dataBanks_4_io_r_data_2),
    .io_r_data_3(dataBanks_4_io_r_data_3)
  );
  DataBank dataBanks_5 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_5_clock),
    .reset(dataBanks_5_reset),
    .io_w_en(dataBanks_5_io_w_en),
    .io_w_set(dataBanks_5_io_w_set),
    .io_w_way(dataBanks_5_io_w_way),
    .io_w_data(dataBanks_5_io_w_data),
    .io_r_set(dataBanks_5_io_r_set),
    .io_r_data_0(dataBanks_5_io_r_data_0),
    .io_r_data_1(dataBanks_5_io_r_data_1),
    .io_r_data_2(dataBanks_5_io_r_data_2),
    .io_r_data_3(dataBanks_5_io_r_data_3)
  );
  DataBank dataBanks_6 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_6_clock),
    .reset(dataBanks_6_reset),
    .io_w_en(dataBanks_6_io_w_en),
    .io_w_set(dataBanks_6_io_w_set),
    .io_w_way(dataBanks_6_io_w_way),
    .io_w_data(dataBanks_6_io_w_data),
    .io_r_set(dataBanks_6_io_r_set),
    .io_r_data_0(dataBanks_6_io_r_data_0),
    .io_r_data_1(dataBanks_6_io_r_data_1),
    .io_r_data_2(dataBanks_6_io_r_data_2),
    .io_r_data_3(dataBanks_6_io_r_data_3)
  );
  DataBank dataBanks_7 ( // @[DataBank.scala 90:53]
    .clock(dataBanks_7_clock),
    .reset(dataBanks_7_reset),
    .io_w_en(dataBanks_7_io_w_en),
    .io_w_set(dataBanks_7_io_w_set),
    .io_w_way(dataBanks_7_io_w_way),
    .io_w_data(dataBanks_7_io_w_data),
    .io_r_set(dataBanks_7_io_r_set),
    .io_r_data_0(dataBanks_7_io_r_data_0),
    .io_r_data_1(dataBanks_7_io_r_data_1),
    .io_r_data_2(dataBanks_7_io_r_data_2),
    .io_r_data_3(dataBanks_7_io_r_data_3)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 87:23]
  assign io_read_resp_bits_data_0 = _T_21 | _T_15; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_1 = _T_36 | _T_30; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_2 = _T_51 | _T_45; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_3 = _T_66 | _T_60; // @[Mux.scala 27:73]
  assign io_read_resp_bits_blockData_0 = {hi,lo}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_1 = {hi_1,lo_1}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_2 = {hi_2,lo_2}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_3 = {hi_3,lo_3}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_4 = {hi_4,lo_4}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_5 = {hi_5,lo_5}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_6 = {hi_6,lo_6}; // @[DataBank.scala 109:57]
  assign io_read_resp_bits_blockData_7 = {hi_7,lo_7}; // @[DataBank.scala 109:57]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 88:24]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[0]; // @[DataBank.scala 100:51]
  assign dataBanks_0_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_0_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_0_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_0_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[1]; // @[DataBank.scala 100:51]
  assign dataBanks_1_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_1_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_1_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_1_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_2_clock = clock;
  assign dataBanks_2_reset = reset;
  assign dataBanks_2_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[2]; // @[DataBank.scala 100:51]
  assign dataBanks_2_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_2_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_2_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_2_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_3_clock = clock;
  assign dataBanks_3_reset = reset;
  assign dataBanks_3_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[3]; // @[DataBank.scala 100:51]
  assign dataBanks_3_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_3_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_3_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_3_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_4_clock = clock;
  assign dataBanks_4_reset = reset;
  assign dataBanks_4_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[4]; // @[DataBank.scala 100:51]
  assign dataBanks_4_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_4_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_4_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_4_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_5_clock = clock;
  assign dataBanks_5_reset = reset;
  assign dataBanks_5_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[5]; // @[DataBank.scala 100:51]
  assign dataBanks_5_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_5_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_5_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_5_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_6_clock = clock;
  assign dataBanks_6_reset = reset;
  assign dataBanks_6_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[6]; // @[DataBank.scala 100:51]
  assign dataBanks_6_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_6_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_6_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_6_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
  assign dataBanks_7_clock = clock;
  assign dataBanks_7_reset = reset;
  assign dataBanks_7_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[7]; // @[DataBank.scala 100:51]
  assign dataBanks_7_io_w_set = io_write_req_bits_set; // @[DataBank.scala 103:31]
  assign dataBanks_7_io_w_way = io_write_req_bits_way; // @[DataBank.scala 102:31]
  assign dataBanks_7_io_w_data = io_write_req_bits_data; // @[DataBank.scala 101:32]
  assign dataBanks_7_io_r_set = io_read_req_bits_set; // @[DataBank.scala 98:31]
endmodule
