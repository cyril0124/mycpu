module DataBankArray(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [6:0]  io_read_req_bits_set,
  input  [7:0]  io_read_req_bits_blockSelOH,
  output [31:0] io_read_resp_bits_data_0,
  output [31:0] io_read_resp_bits_data_1,
  output [31:0] io_read_resp_bits_data_2,
  output [31:0] io_read_resp_bits_data_3,
  output [31:0] io_read_resp_bits_data_4,
  output [31:0] io_read_resp_bits_data_5,
  output [31:0] io_read_resp_bits_data_6,
  output [31:0] io_read_resp_bits_data_7,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_data,
  input  [6:0]  io_write_req_bits_set,
  input  [7:0]  io_write_req_bits_blockSelOH,
  input  [7:0]  io_write_req_bits_way
);
  wire  dataBanks_0_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_0_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_0_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_0_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_0_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_0_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_0_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_1_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_1_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_1_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_1_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_1_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_1_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_1_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_2_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_2_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_2_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_2_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_2_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_2_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_2_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_3_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_3_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_3_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_3_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_3_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_3_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_3_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_4_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_4_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_4_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_4_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_4_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_4_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_4_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_5_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_5_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_5_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_5_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_5_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_5_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_5_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_6_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_6_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_6_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_6_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_6_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_6_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_6_io_r_data_7; // @[DataBank.scala 81:53]
  wire  dataBanks_7_clock; // @[DataBank.scala 81:53]
  wire  dataBanks_7_reset; // @[DataBank.scala 81:53]
  wire  dataBanks_7_io_w_en; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_7_io_w_set; // @[DataBank.scala 81:53]
  wire [7:0] dataBanks_7_io_w_way; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_w_data; // @[DataBank.scala 81:53]
  wire [6:0] dataBanks_7_io_r_set; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_0; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_1; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_2; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_3; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_4; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_5; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_6; // @[DataBank.scala 81:53]
  wire [31:0] dataBanks_7_io_r_data_7; // @[DataBank.scala 81:53]
  wire  _dataBanks_0_io_w_en_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [31:0] blockData_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_8 = io_read_req_bits_blockSelOH[0] ? blockData_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_9 = io_read_req_bits_blockSelOH[1] ? blockData_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_0 = dataBanks_2_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_10 = io_read_req_bits_blockSelOH[2] ? blockData_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_0 = dataBanks_3_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_11 = io_read_req_bits_blockSelOH[3] ? blockData_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_0 = dataBanks_4_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_12 = io_read_req_bits_blockSelOH[4] ? blockData_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_0 = dataBanks_5_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_13 = io_read_req_bits_blockSelOH[5] ? blockData_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_0 = dataBanks_6_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_14 = io_read_req_bits_blockSelOH[6] ? blockData_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_0 = dataBanks_7_io_r_data_0; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_15 = io_read_req_bits_blockSelOH[7] ? blockData_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_16 = _T_8 | _T_9; // @[Mux.scala 27:73]
  wire [31:0] _T_17 = _T_16 | _T_10; // @[Mux.scala 27:73]
  wire [31:0] _T_18 = _T_17 | _T_11; // @[Mux.scala 27:73]
  wire [31:0] _T_19 = _T_18 | _T_12; // @[Mux.scala 27:73]
  wire [31:0] _T_20 = _T_19 | _T_13; // @[Mux.scala 27:73]
  wire [31:0] _T_21 = _T_20 | _T_14; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_23 = io_read_req_bits_blockSelOH[0] ? blockData_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_24 = io_read_req_bits_blockSelOH[1] ? blockData_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_1 = dataBanks_2_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_25 = io_read_req_bits_blockSelOH[2] ? blockData_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_1 = dataBanks_3_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_26 = io_read_req_bits_blockSelOH[3] ? blockData_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_1 = dataBanks_4_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_27 = io_read_req_bits_blockSelOH[4] ? blockData_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_1 = dataBanks_5_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_28 = io_read_req_bits_blockSelOH[5] ? blockData_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_1 = dataBanks_6_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_29 = io_read_req_bits_blockSelOH[6] ? blockData_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_1 = dataBanks_7_io_r_data_1; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_30 = io_read_req_bits_blockSelOH[7] ? blockData_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_31 = _T_23 | _T_24; // @[Mux.scala 27:73]
  wire [31:0] _T_32 = _T_31 | _T_25; // @[Mux.scala 27:73]
  wire [31:0] _T_33 = _T_32 | _T_26; // @[Mux.scala 27:73]
  wire [31:0] _T_34 = _T_33 | _T_27; // @[Mux.scala 27:73]
  wire [31:0] _T_35 = _T_34 | _T_28; // @[Mux.scala 27:73]
  wire [31:0] _T_36 = _T_35 | _T_29; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_38 = io_read_req_bits_blockSelOH[0] ? blockData_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_39 = io_read_req_bits_blockSelOH[1] ? blockData_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_2 = dataBanks_2_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_40 = io_read_req_bits_blockSelOH[2] ? blockData_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_2 = dataBanks_3_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_41 = io_read_req_bits_blockSelOH[3] ? blockData_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_2 = dataBanks_4_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_42 = io_read_req_bits_blockSelOH[4] ? blockData_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_2 = dataBanks_5_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_43 = io_read_req_bits_blockSelOH[5] ? blockData_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_2 = dataBanks_6_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_44 = io_read_req_bits_blockSelOH[6] ? blockData_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_2 = dataBanks_7_io_r_data_2; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_45 = io_read_req_bits_blockSelOH[7] ? blockData_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_46 = _T_38 | _T_39; // @[Mux.scala 27:73]
  wire [31:0] _T_47 = _T_46 | _T_40; // @[Mux.scala 27:73]
  wire [31:0] _T_48 = _T_47 | _T_41; // @[Mux.scala 27:73]
  wire [31:0] _T_49 = _T_48 | _T_42; // @[Mux.scala 27:73]
  wire [31:0] _T_50 = _T_49 | _T_43; // @[Mux.scala 27:73]
  wire [31:0] _T_51 = _T_50 | _T_44; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_53 = io_read_req_bits_blockSelOH[0] ? blockData_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_54 = io_read_req_bits_blockSelOH[1] ? blockData_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_3 = dataBanks_2_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_55 = io_read_req_bits_blockSelOH[2] ? blockData_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_3 = dataBanks_3_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_56 = io_read_req_bits_blockSelOH[3] ? blockData_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_3 = dataBanks_4_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_57 = io_read_req_bits_blockSelOH[4] ? blockData_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_3 = dataBanks_5_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_58 = io_read_req_bits_blockSelOH[5] ? blockData_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_3 = dataBanks_6_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_59 = io_read_req_bits_blockSelOH[6] ? blockData_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_3 = dataBanks_7_io_r_data_3; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_60 = io_read_req_bits_blockSelOH[7] ? blockData_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_61 = _T_53 | _T_54; // @[Mux.scala 27:73]
  wire [31:0] _T_62 = _T_61 | _T_55; // @[Mux.scala 27:73]
  wire [31:0] _T_63 = _T_62 | _T_56; // @[Mux.scala 27:73]
  wire [31:0] _T_64 = _T_63 | _T_57; // @[Mux.scala 27:73]
  wire [31:0] _T_65 = _T_64 | _T_58; // @[Mux.scala 27:73]
  wire [31:0] _T_66 = _T_65 | _T_59; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_4 = dataBanks_0_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_68 = io_read_req_bits_blockSelOH[0] ? blockData_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_4 = dataBanks_1_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_69 = io_read_req_bits_blockSelOH[1] ? blockData_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_4 = dataBanks_2_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_70 = io_read_req_bits_blockSelOH[2] ? blockData_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_4 = dataBanks_3_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_71 = io_read_req_bits_blockSelOH[3] ? blockData_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_4 = dataBanks_4_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_72 = io_read_req_bits_blockSelOH[4] ? blockData_4_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_4 = dataBanks_5_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_73 = io_read_req_bits_blockSelOH[5] ? blockData_5_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_4 = dataBanks_6_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_74 = io_read_req_bits_blockSelOH[6] ? blockData_6_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_4 = dataBanks_7_io_r_data_4; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_75 = io_read_req_bits_blockSelOH[7] ? blockData_7_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_76 = _T_68 | _T_69; // @[Mux.scala 27:73]
  wire [31:0] _T_77 = _T_76 | _T_70; // @[Mux.scala 27:73]
  wire [31:0] _T_78 = _T_77 | _T_71; // @[Mux.scala 27:73]
  wire [31:0] _T_79 = _T_78 | _T_72; // @[Mux.scala 27:73]
  wire [31:0] _T_80 = _T_79 | _T_73; // @[Mux.scala 27:73]
  wire [31:0] _T_81 = _T_80 | _T_74; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_5 = dataBanks_0_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_83 = io_read_req_bits_blockSelOH[0] ? blockData_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_5 = dataBanks_1_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_84 = io_read_req_bits_blockSelOH[1] ? blockData_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_5 = dataBanks_2_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_85 = io_read_req_bits_blockSelOH[2] ? blockData_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_5 = dataBanks_3_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_86 = io_read_req_bits_blockSelOH[3] ? blockData_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_5 = dataBanks_4_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_87 = io_read_req_bits_blockSelOH[4] ? blockData_4_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_5 = dataBanks_5_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_88 = io_read_req_bits_blockSelOH[5] ? blockData_5_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_5 = dataBanks_6_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_89 = io_read_req_bits_blockSelOH[6] ? blockData_6_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_5 = dataBanks_7_io_r_data_5; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_90 = io_read_req_bits_blockSelOH[7] ? blockData_7_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_91 = _T_83 | _T_84; // @[Mux.scala 27:73]
  wire [31:0] _T_92 = _T_91 | _T_85; // @[Mux.scala 27:73]
  wire [31:0] _T_93 = _T_92 | _T_86; // @[Mux.scala 27:73]
  wire [31:0] _T_94 = _T_93 | _T_87; // @[Mux.scala 27:73]
  wire [31:0] _T_95 = _T_94 | _T_88; // @[Mux.scala 27:73]
  wire [31:0] _T_96 = _T_95 | _T_89; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_6 = dataBanks_0_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_98 = io_read_req_bits_blockSelOH[0] ? blockData_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_6 = dataBanks_1_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_99 = io_read_req_bits_blockSelOH[1] ? blockData_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_6 = dataBanks_2_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_100 = io_read_req_bits_blockSelOH[2] ? blockData_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_6 = dataBanks_3_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_101 = io_read_req_bits_blockSelOH[3] ? blockData_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_6 = dataBanks_4_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_102 = io_read_req_bits_blockSelOH[4] ? blockData_4_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_6 = dataBanks_5_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_103 = io_read_req_bits_blockSelOH[5] ? blockData_5_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_6 = dataBanks_6_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_104 = io_read_req_bits_blockSelOH[6] ? blockData_6_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_6 = dataBanks_7_io_r_data_6; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_105 = io_read_req_bits_blockSelOH[7] ? blockData_7_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_106 = _T_98 | _T_99; // @[Mux.scala 27:73]
  wire [31:0] _T_107 = _T_106 | _T_100; // @[Mux.scala 27:73]
  wire [31:0] _T_108 = _T_107 | _T_101; // @[Mux.scala 27:73]
  wire [31:0] _T_109 = _T_108 | _T_102; // @[Mux.scala 27:73]
  wire [31:0] _T_110 = _T_109 | _T_103; // @[Mux.scala 27:73]
  wire [31:0] _T_111 = _T_110 | _T_104; // @[Mux.scala 27:73]
  wire [31:0] blockData_0_7 = dataBanks_0_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_113 = io_read_req_bits_blockSelOH[0] ? blockData_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_1_7 = dataBanks_1_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_114 = io_read_req_bits_blockSelOH[1] ? blockData_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_2_7 = dataBanks_2_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_115 = io_read_req_bits_blockSelOH[2] ? blockData_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_3_7 = dataBanks_3_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_116 = io_read_req_bits_blockSelOH[3] ? blockData_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_4_7 = dataBanks_4_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_117 = io_read_req_bits_blockSelOH[4] ? blockData_4_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_5_7 = dataBanks_5_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_118 = io_read_req_bits_blockSelOH[5] ? blockData_5_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_6_7 = dataBanks_6_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_119 = io_read_req_bits_blockSelOH[6] ? blockData_6_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] blockData_7_7 = dataBanks_7_io_r_data_7; // @[DataBank.scala 98:{28,28}]
  wire [31:0] _T_120 = io_read_req_bits_blockSelOH[7] ? blockData_7_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_121 = _T_113 | _T_114; // @[Mux.scala 27:73]
  wire [31:0] _T_122 = _T_121 | _T_115; // @[Mux.scala 27:73]
  wire [31:0] _T_123 = _T_122 | _T_116; // @[Mux.scala 27:73]
  wire [31:0] _T_124 = _T_123 | _T_117; // @[Mux.scala 27:73]
  wire [31:0] _T_125 = _T_124 | _T_118; // @[Mux.scala 27:73]
  wire [31:0] _T_126 = _T_125 | _T_119; // @[Mux.scala 27:73]
  DataBank dataBanks_0 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_0_io_r_data_3),
    .io_r_data_4(dataBanks_0_io_r_data_4),
    .io_r_data_5(dataBanks_0_io_r_data_5),
    .io_r_data_6(dataBanks_0_io_r_data_6),
    .io_r_data_7(dataBanks_0_io_r_data_7)
  );
  DataBank dataBanks_1 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_1_io_r_data_3),
    .io_r_data_4(dataBanks_1_io_r_data_4),
    .io_r_data_5(dataBanks_1_io_r_data_5),
    .io_r_data_6(dataBanks_1_io_r_data_6),
    .io_r_data_7(dataBanks_1_io_r_data_7)
  );
  DataBank dataBanks_2 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_2_io_r_data_3),
    .io_r_data_4(dataBanks_2_io_r_data_4),
    .io_r_data_5(dataBanks_2_io_r_data_5),
    .io_r_data_6(dataBanks_2_io_r_data_6),
    .io_r_data_7(dataBanks_2_io_r_data_7)
  );
  DataBank dataBanks_3 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_3_io_r_data_3),
    .io_r_data_4(dataBanks_3_io_r_data_4),
    .io_r_data_5(dataBanks_3_io_r_data_5),
    .io_r_data_6(dataBanks_3_io_r_data_6),
    .io_r_data_7(dataBanks_3_io_r_data_7)
  );
  DataBank dataBanks_4 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_4_io_r_data_3),
    .io_r_data_4(dataBanks_4_io_r_data_4),
    .io_r_data_5(dataBanks_4_io_r_data_5),
    .io_r_data_6(dataBanks_4_io_r_data_6),
    .io_r_data_7(dataBanks_4_io_r_data_7)
  );
  DataBank dataBanks_5 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_5_io_r_data_3),
    .io_r_data_4(dataBanks_5_io_r_data_4),
    .io_r_data_5(dataBanks_5_io_r_data_5),
    .io_r_data_6(dataBanks_5_io_r_data_6),
    .io_r_data_7(dataBanks_5_io_r_data_7)
  );
  DataBank dataBanks_6 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_6_io_r_data_3),
    .io_r_data_4(dataBanks_6_io_r_data_4),
    .io_r_data_5(dataBanks_6_io_r_data_5),
    .io_r_data_6(dataBanks_6_io_r_data_6),
    .io_r_data_7(dataBanks_6_io_r_data_7)
  );
  DataBank dataBanks_7 ( // @[DataBank.scala 81:53]
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
    .io_r_data_3(dataBanks_7_io_r_data_3),
    .io_r_data_4(dataBanks_7_io_r_data_4),
    .io_r_data_5(dataBanks_7_io_r_data_5),
    .io_r_data_6(dataBanks_7_io_r_data_6),
    .io_r_data_7(dataBanks_7_io_r_data_7)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 78:23]
  assign io_read_resp_bits_data_0 = _T_21 | _T_15; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_1 = _T_36 | _T_30; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_2 = _T_51 | _T_45; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_3 = _T_66 | _T_60; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_4 = _T_81 | _T_75; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_5 = _T_96 | _T_90; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_6 = _T_111 | _T_105; // @[Mux.scala 27:73]
  assign io_read_resp_bits_data_7 = _T_126 | _T_120; // @[Mux.scala 27:73]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 79:24]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[0]; // @[DataBank.scala 91:51]
  assign dataBanks_0_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_0_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_0_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_0_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[1]; // @[DataBank.scala 91:51]
  assign dataBanks_1_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_1_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_1_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_1_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_2_clock = clock;
  assign dataBanks_2_reset = reset;
  assign dataBanks_2_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[2]; // @[DataBank.scala 91:51]
  assign dataBanks_2_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_2_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_2_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_2_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_3_clock = clock;
  assign dataBanks_3_reset = reset;
  assign dataBanks_3_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[3]; // @[DataBank.scala 91:51]
  assign dataBanks_3_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_3_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_3_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_3_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_4_clock = clock;
  assign dataBanks_4_reset = reset;
  assign dataBanks_4_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[4]; // @[DataBank.scala 91:51]
  assign dataBanks_4_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_4_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_4_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_4_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_5_clock = clock;
  assign dataBanks_5_reset = reset;
  assign dataBanks_5_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[5]; // @[DataBank.scala 91:51]
  assign dataBanks_5_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_5_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_5_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_5_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_6_clock = clock;
  assign dataBanks_6_reset = reset;
  assign dataBanks_6_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[6]; // @[DataBank.scala 91:51]
  assign dataBanks_6_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_6_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_6_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_6_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
  assign dataBanks_7_clock = clock;
  assign dataBanks_7_reset = reset;
  assign dataBanks_7_io_w_en = _dataBanks_0_io_w_en_T & io_write_req_bits_blockSelOH[7]; // @[DataBank.scala 91:51]
  assign dataBanks_7_io_w_set = io_write_req_bits_set; // @[DataBank.scala 94:31]
  assign dataBanks_7_io_w_way = io_write_req_bits_way; // @[DataBank.scala 93:31]
  assign dataBanks_7_io_w_data = io_write_req_bits_data; // @[DataBank.scala 92:32]
  assign dataBanks_7_io_r_set = io_read_req_bits_set; // @[DataBank.scala 89:31]
endmodule
