module DataBankArray(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [6:0]  io_read_req_bits_set,
  output [31:0] io_read_resp_0_0,
  output [31:0] io_read_resp_0_1,
  output [31:0] io_read_resp_0_2,
  output [31:0] io_read_resp_0_3,
  output [31:0] io_read_resp_0_4,
  output [31:0] io_read_resp_0_5,
  output [31:0] io_read_resp_0_6,
  output [31:0] io_read_resp_0_7,
  output [31:0] io_read_resp_1_0,
  output [31:0] io_read_resp_1_1,
  output [31:0] io_read_resp_1_2,
  output [31:0] io_read_resp_1_3,
  output [31:0] io_read_resp_1_4,
  output [31:0] io_read_resp_1_5,
  output [31:0] io_read_resp_1_6,
  output [31:0] io_read_resp_1_7,
  output [31:0] io_read_resp_2_0,
  output [31:0] io_read_resp_2_1,
  output [31:0] io_read_resp_2_2,
  output [31:0] io_read_resp_2_3,
  output [31:0] io_read_resp_2_4,
  output [31:0] io_read_resp_2_5,
  output [31:0] io_read_resp_2_6,
  output [31:0] io_read_resp_2_7,
  output [31:0] io_read_resp_3_0,
  output [31:0] io_read_resp_3_1,
  output [31:0] io_read_resp_3_2,
  output [31:0] io_read_resp_3_3,
  output [31:0] io_read_resp_3_4,
  output [31:0] io_read_resp_3_5,
  output [31:0] io_read_resp_3_6,
  output [31:0] io_read_resp_3_7,
  output [31:0] io_read_resp_4_0,
  output [31:0] io_read_resp_4_1,
  output [31:0] io_read_resp_4_2,
  output [31:0] io_read_resp_4_3,
  output [31:0] io_read_resp_4_4,
  output [31:0] io_read_resp_4_5,
  output [31:0] io_read_resp_4_6,
  output [31:0] io_read_resp_4_7,
  output [31:0] io_read_resp_5_0,
  output [31:0] io_read_resp_5_1,
  output [31:0] io_read_resp_5_2,
  output [31:0] io_read_resp_5_3,
  output [31:0] io_read_resp_5_4,
  output [31:0] io_read_resp_5_5,
  output [31:0] io_read_resp_5_6,
  output [31:0] io_read_resp_5_7,
  output [31:0] io_read_resp_6_0,
  output [31:0] io_read_resp_6_1,
  output [31:0] io_read_resp_6_2,
  output [31:0] io_read_resp_6_3,
  output [31:0] io_read_resp_6_4,
  output [31:0] io_read_resp_6_5,
  output [31:0] io_read_resp_6_6,
  output [31:0] io_read_resp_6_7,
  output [31:0] io_read_resp_7_0,
  output [31:0] io_read_resp_7_1,
  output [31:0] io_read_resp_7_2,
  output [31:0] io_read_resp_7_3,
  output [31:0] io_read_resp_7_4,
  output [31:0] io_read_resp_7_5,
  output [31:0] io_read_resp_7_6,
  output [31:0] io_read_resp_7_7,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_data,
  input  [6:0]  io_write_req_bits_set,
  input  [7:0]  io_write_req_bits_blockSelOH,
  input  [7:0]  io_write_req_bits_way
);
  wire  dataBanks_0_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_0_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_0_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_0_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_0_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_0_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_1_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_1_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_1_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_1_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_1_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_1_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_2_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_2_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_2_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_2_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_2_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_2_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_3_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_3_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_3_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_3_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_3_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_3_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_4_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_4_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_4_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_4_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_4_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_4_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_5_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_5_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_5_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_5_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_5_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_5_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_6_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_6_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_6_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_6_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_6_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_6_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  dataBanks_7_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_7_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  dataBanks_7_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] dataBanks_7_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [31:0] dataBanks_7_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] dataBanks_7_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  ren = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  wire  _wen_T_1 = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire  wen = io_write_req_bits_way[0] & _wen_T_1; // @[DataBank.scala 49:44]
  wire [1:0] _T_8 = io_write_req_bits_blockSelOH[0] + io_write_req_bits_blockSelOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_10 = io_write_req_bits_blockSelOH[2] + io_write_req_bits_blockSelOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_12 = _T_8 + _T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _T_14 = io_write_req_bits_blockSelOH[4] + io_write_req_bits_blockSelOH[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_16 = io_write_req_bits_blockSelOH[6] + io_write_req_bits_blockSelOH[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_18 = _T_14 + _T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _T_20 = _T_12 + _T_18; // @[Bitwise.scala 51:90]
  wire  wen_1 = io_write_req_bits_way[1] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_2 = io_write_req_bits_way[2] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_3 = io_write_req_bits_way[3] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_4 = io_write_req_bits_way[4] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_5 = io_write_req_bits_way[5] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_6 = io_write_req_bits_way[6] & _wen_T_1; // @[DataBank.scala 49:44]
  wire  wen_7 = io_write_req_bits_way[7] & _wen_T_1; // @[DataBank.scala 49:44]
  SRAMArray_2P dataBanks_0 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_0_clock),
    .io_r_addr(dataBanks_0_io_r_addr),
    .io_r_data_0(dataBanks_0_io_r_data_0),
    .io_r_data_1(dataBanks_0_io_r_data_1),
    .io_r_data_2(dataBanks_0_io_r_data_2),
    .io_r_data_3(dataBanks_0_io_r_data_3),
    .io_r_data_4(dataBanks_0_io_r_data_4),
    .io_r_data_5(dataBanks_0_io_r_data_5),
    .io_r_data_6(dataBanks_0_io_r_data_6),
    .io_r_data_7(dataBanks_0_io_r_data_7),
    .io_w_en(dataBanks_0_io_w_en),
    .io_w_addr(dataBanks_0_io_w_addr),
    .io_w_data_0(dataBanks_0_io_w_data_0),
    .io_w_data_1(dataBanks_0_io_w_data_1),
    .io_w_data_2(dataBanks_0_io_w_data_2),
    .io_w_data_3(dataBanks_0_io_w_data_3),
    .io_w_data_4(dataBanks_0_io_w_data_4),
    .io_w_data_5(dataBanks_0_io_w_data_5),
    .io_w_data_6(dataBanks_0_io_w_data_6),
    .io_w_data_7(dataBanks_0_io_w_data_7),
    .io_w_maskOH(dataBanks_0_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_1 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_1_clock),
    .io_r_addr(dataBanks_1_io_r_addr),
    .io_r_data_0(dataBanks_1_io_r_data_0),
    .io_r_data_1(dataBanks_1_io_r_data_1),
    .io_r_data_2(dataBanks_1_io_r_data_2),
    .io_r_data_3(dataBanks_1_io_r_data_3),
    .io_r_data_4(dataBanks_1_io_r_data_4),
    .io_r_data_5(dataBanks_1_io_r_data_5),
    .io_r_data_6(dataBanks_1_io_r_data_6),
    .io_r_data_7(dataBanks_1_io_r_data_7),
    .io_w_en(dataBanks_1_io_w_en),
    .io_w_addr(dataBanks_1_io_w_addr),
    .io_w_data_0(dataBanks_1_io_w_data_0),
    .io_w_data_1(dataBanks_1_io_w_data_1),
    .io_w_data_2(dataBanks_1_io_w_data_2),
    .io_w_data_3(dataBanks_1_io_w_data_3),
    .io_w_data_4(dataBanks_1_io_w_data_4),
    .io_w_data_5(dataBanks_1_io_w_data_5),
    .io_w_data_6(dataBanks_1_io_w_data_6),
    .io_w_data_7(dataBanks_1_io_w_data_7),
    .io_w_maskOH(dataBanks_1_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_2 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_2_clock),
    .io_r_addr(dataBanks_2_io_r_addr),
    .io_r_data_0(dataBanks_2_io_r_data_0),
    .io_r_data_1(dataBanks_2_io_r_data_1),
    .io_r_data_2(dataBanks_2_io_r_data_2),
    .io_r_data_3(dataBanks_2_io_r_data_3),
    .io_r_data_4(dataBanks_2_io_r_data_4),
    .io_r_data_5(dataBanks_2_io_r_data_5),
    .io_r_data_6(dataBanks_2_io_r_data_6),
    .io_r_data_7(dataBanks_2_io_r_data_7),
    .io_w_en(dataBanks_2_io_w_en),
    .io_w_addr(dataBanks_2_io_w_addr),
    .io_w_data_0(dataBanks_2_io_w_data_0),
    .io_w_data_1(dataBanks_2_io_w_data_1),
    .io_w_data_2(dataBanks_2_io_w_data_2),
    .io_w_data_3(dataBanks_2_io_w_data_3),
    .io_w_data_4(dataBanks_2_io_w_data_4),
    .io_w_data_5(dataBanks_2_io_w_data_5),
    .io_w_data_6(dataBanks_2_io_w_data_6),
    .io_w_data_7(dataBanks_2_io_w_data_7),
    .io_w_maskOH(dataBanks_2_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_3 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_3_clock),
    .io_r_addr(dataBanks_3_io_r_addr),
    .io_r_data_0(dataBanks_3_io_r_data_0),
    .io_r_data_1(dataBanks_3_io_r_data_1),
    .io_r_data_2(dataBanks_3_io_r_data_2),
    .io_r_data_3(dataBanks_3_io_r_data_3),
    .io_r_data_4(dataBanks_3_io_r_data_4),
    .io_r_data_5(dataBanks_3_io_r_data_5),
    .io_r_data_6(dataBanks_3_io_r_data_6),
    .io_r_data_7(dataBanks_3_io_r_data_7),
    .io_w_en(dataBanks_3_io_w_en),
    .io_w_addr(dataBanks_3_io_w_addr),
    .io_w_data_0(dataBanks_3_io_w_data_0),
    .io_w_data_1(dataBanks_3_io_w_data_1),
    .io_w_data_2(dataBanks_3_io_w_data_2),
    .io_w_data_3(dataBanks_3_io_w_data_3),
    .io_w_data_4(dataBanks_3_io_w_data_4),
    .io_w_data_5(dataBanks_3_io_w_data_5),
    .io_w_data_6(dataBanks_3_io_w_data_6),
    .io_w_data_7(dataBanks_3_io_w_data_7),
    .io_w_maskOH(dataBanks_3_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_4 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_4_clock),
    .io_r_addr(dataBanks_4_io_r_addr),
    .io_r_data_0(dataBanks_4_io_r_data_0),
    .io_r_data_1(dataBanks_4_io_r_data_1),
    .io_r_data_2(dataBanks_4_io_r_data_2),
    .io_r_data_3(dataBanks_4_io_r_data_3),
    .io_r_data_4(dataBanks_4_io_r_data_4),
    .io_r_data_5(dataBanks_4_io_r_data_5),
    .io_r_data_6(dataBanks_4_io_r_data_6),
    .io_r_data_7(dataBanks_4_io_r_data_7),
    .io_w_en(dataBanks_4_io_w_en),
    .io_w_addr(dataBanks_4_io_w_addr),
    .io_w_data_0(dataBanks_4_io_w_data_0),
    .io_w_data_1(dataBanks_4_io_w_data_1),
    .io_w_data_2(dataBanks_4_io_w_data_2),
    .io_w_data_3(dataBanks_4_io_w_data_3),
    .io_w_data_4(dataBanks_4_io_w_data_4),
    .io_w_data_5(dataBanks_4_io_w_data_5),
    .io_w_data_6(dataBanks_4_io_w_data_6),
    .io_w_data_7(dataBanks_4_io_w_data_7),
    .io_w_maskOH(dataBanks_4_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_5 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_5_clock),
    .io_r_addr(dataBanks_5_io_r_addr),
    .io_r_data_0(dataBanks_5_io_r_data_0),
    .io_r_data_1(dataBanks_5_io_r_data_1),
    .io_r_data_2(dataBanks_5_io_r_data_2),
    .io_r_data_3(dataBanks_5_io_r_data_3),
    .io_r_data_4(dataBanks_5_io_r_data_4),
    .io_r_data_5(dataBanks_5_io_r_data_5),
    .io_r_data_6(dataBanks_5_io_r_data_6),
    .io_r_data_7(dataBanks_5_io_r_data_7),
    .io_w_en(dataBanks_5_io_w_en),
    .io_w_addr(dataBanks_5_io_w_addr),
    .io_w_data_0(dataBanks_5_io_w_data_0),
    .io_w_data_1(dataBanks_5_io_w_data_1),
    .io_w_data_2(dataBanks_5_io_w_data_2),
    .io_w_data_3(dataBanks_5_io_w_data_3),
    .io_w_data_4(dataBanks_5_io_w_data_4),
    .io_w_data_5(dataBanks_5_io_w_data_5),
    .io_w_data_6(dataBanks_5_io_w_data_6),
    .io_w_data_7(dataBanks_5_io_w_data_7),
    .io_w_maskOH(dataBanks_5_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_6 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_6_clock),
    .io_r_addr(dataBanks_6_io_r_addr),
    .io_r_data_0(dataBanks_6_io_r_data_0),
    .io_r_data_1(dataBanks_6_io_r_data_1),
    .io_r_data_2(dataBanks_6_io_r_data_2),
    .io_r_data_3(dataBanks_6_io_r_data_3),
    .io_r_data_4(dataBanks_6_io_r_data_4),
    .io_r_data_5(dataBanks_6_io_r_data_5),
    .io_r_data_6(dataBanks_6_io_r_data_6),
    .io_r_data_7(dataBanks_6_io_r_data_7),
    .io_w_en(dataBanks_6_io_w_en),
    .io_w_addr(dataBanks_6_io_w_addr),
    .io_w_data_0(dataBanks_6_io_w_data_0),
    .io_w_data_1(dataBanks_6_io_w_data_1),
    .io_w_data_2(dataBanks_6_io_w_data_2),
    .io_w_data_3(dataBanks_6_io_w_data_3),
    .io_w_data_4(dataBanks_6_io_w_data_4),
    .io_w_data_5(dataBanks_6_io_w_data_5),
    .io_w_data_6(dataBanks_6_io_w_data_6),
    .io_w_data_7(dataBanks_6_io_w_data_7),
    .io_w_maskOH(dataBanks_6_io_w_maskOH)
  );
  SRAMArray_2P dataBanks_7 ( // @[SRAM_1.scala 255:31]
    .clock(dataBanks_7_clock),
    .io_r_addr(dataBanks_7_io_r_addr),
    .io_r_data_0(dataBanks_7_io_r_data_0),
    .io_r_data_1(dataBanks_7_io_r_data_1),
    .io_r_data_2(dataBanks_7_io_r_data_2),
    .io_r_data_3(dataBanks_7_io_r_data_3),
    .io_r_data_4(dataBanks_7_io_r_data_4),
    .io_r_data_5(dataBanks_7_io_r_data_5),
    .io_r_data_6(dataBanks_7_io_r_data_6),
    .io_r_data_7(dataBanks_7_io_r_data_7),
    .io_w_en(dataBanks_7_io_w_en),
    .io_w_addr(dataBanks_7_io_w_addr),
    .io_w_data_0(dataBanks_7_io_w_data_0),
    .io_w_data_1(dataBanks_7_io_w_data_1),
    .io_w_data_2(dataBanks_7_io_w_data_2),
    .io_w_data_3(dataBanks_7_io_w_data_3),
    .io_w_data_4(dataBanks_7_io_w_data_4),
    .io_w_data_5(dataBanks_7_io_w_data_5),
    .io_w_data_6(dataBanks_7_io_w_data_6),
    .io_w_data_7(dataBanks_7_io_w_data_7),
    .io_w_maskOH(dataBanks_7_io_w_maskOH)
  );
  assign io_read_req_ready = 1'h1; // @[DataBank.scala 43:23]
  assign io_read_resp_0_0 = ren ? dataBanks_0_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_1 = ren ? dataBanks_0_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_2 = ren ? dataBanks_0_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_3 = ren ? dataBanks_0_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_4 = ren ? dataBanks_0_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_5 = ren ? dataBanks_0_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_6 = ren ? dataBanks_0_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_0_7 = ren ? dataBanks_0_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_0 = ren ? dataBanks_1_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_1 = ren ? dataBanks_1_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_2 = ren ? dataBanks_1_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_3 = ren ? dataBanks_1_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_4 = ren ? dataBanks_1_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_5 = ren ? dataBanks_1_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_6 = ren ? dataBanks_1_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_1_7 = ren ? dataBanks_1_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_0 = ren ? dataBanks_2_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_1 = ren ? dataBanks_2_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_2 = ren ? dataBanks_2_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_3 = ren ? dataBanks_2_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_4 = ren ? dataBanks_2_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_5 = ren ? dataBanks_2_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_6 = ren ? dataBanks_2_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_2_7 = ren ? dataBanks_2_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_0 = ren ? dataBanks_3_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_1 = ren ? dataBanks_3_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_2 = ren ? dataBanks_3_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_3 = ren ? dataBanks_3_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_4 = ren ? dataBanks_3_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_5 = ren ? dataBanks_3_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_6 = ren ? dataBanks_3_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_3_7 = ren ? dataBanks_3_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_0 = ren ? dataBanks_4_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_1 = ren ? dataBanks_4_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_2 = ren ? dataBanks_4_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_3 = ren ? dataBanks_4_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_4 = ren ? dataBanks_4_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_5 = ren ? dataBanks_4_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_6 = ren ? dataBanks_4_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_4_7 = ren ? dataBanks_4_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_0 = ren ? dataBanks_5_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_1 = ren ? dataBanks_5_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_2 = ren ? dataBanks_5_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_3 = ren ? dataBanks_5_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_4 = ren ? dataBanks_5_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_5 = ren ? dataBanks_5_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_6 = ren ? dataBanks_5_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_5_7 = ren ? dataBanks_5_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_0 = ren ? dataBanks_6_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_1 = ren ? dataBanks_6_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_2 = ren ? dataBanks_6_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_3 = ren ? dataBanks_6_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_4 = ren ? dataBanks_6_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_5 = ren ? dataBanks_6_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_6 = ren ? dataBanks_6_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_6_7 = ren ? dataBanks_6_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_0 = ren ? dataBanks_7_io_r_data_0 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_1 = ren ? dataBanks_7_io_r_data_1 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_2 = ren ? dataBanks_7_io_r_data_2 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_3 = ren ? dataBanks_7_io_r_data_3 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_4 = ren ? dataBanks_7_io_r_data_4 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_5 = ren ? dataBanks_7_io_r_data_5 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_6 = ren ? dataBanks_7_io_r_data_6 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_read_resp_7_7 = ren ? dataBanks_7_io_r_data_7 : 32'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 51:28]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_0_io_w_en = io_write_req_bits_way[0] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_0_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_0_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_0_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_1_io_w_en = io_write_req_bits_way[1] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_1_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_1_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_1_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_2_clock = clock;
  assign dataBanks_2_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_2_io_w_en = io_write_req_bits_way[2] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_2_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_2_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_2_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_3_clock = clock;
  assign dataBanks_3_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_3_io_w_en = io_write_req_bits_way[3] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_3_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_3_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_3_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_4_clock = clock;
  assign dataBanks_4_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_4_io_w_en = io_write_req_bits_way[4] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_4_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_4_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_4_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_5_clock = clock;
  assign dataBanks_5_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_5_io_w_en = io_write_req_bits_way[5] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_5_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_5_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_5_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_6_clock = clock;
  assign dataBanks_6_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_6_io_w_en = io_write_req_bits_way[6] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_6_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_6_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_6_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  assign dataBanks_7_clock = clock;
  assign dataBanks_7_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign dataBanks_7_io_w_en = io_write_req_bits_way[7] & _wen_T_1; // @[DataBank.scala 49:44]
  assign dataBanks_7_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 52:19 SRAM_1.scala 237:19]
  assign dataBanks_7_io_w_data_0 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_1 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_2 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_3 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_4 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_5 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_6 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_data_7 = io_write_req_bits_data; // @[DataBank.scala 52:19 SRAM_1.scala 238:35]
  assign dataBanks_7_io_w_maskOH = io_write_req_bits_blockSelOH; // @[DataBank.scala 52:19 SRAM_1.scala 239:21]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_1 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_1 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_2 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_2 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_3 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_3 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_4 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_4 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_5 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_5 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_6 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_6 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen_7 & ~reset & ~(_T_20 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:235 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 235:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 <= 4'h1) & (wen_7 & ~reset)) begin
          $fatal; // @[SRAM_1.scala 235:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
