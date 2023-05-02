module DataBankArray(
  input         clock,
  input         reset,
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
  input  [6:0]  io_write_req_bits_set,
  input  [31:0] io_write_req_bits_data_0,
  input  [31:0] io_write_req_bits_data_1,
  input  [31:0] io_write_req_bits_data_2,
  input  [31:0] io_write_req_bits_data_3,
  input  [31:0] io_write_req_bits_data_4,
  input  [31:0] io_write_req_bits_data_5,
  input  [31:0] io_write_req_bits_data_6,
  input  [31:0] io_write_req_bits_data_7,
  input  [7:0]  io_write_req_bits_blockMask,
  input  [7:0]  io_write_req_bits_way
);
  wire  dataBanks_0_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_0_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_0_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_0_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_0_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_0_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_0_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_1_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_1_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_1_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_1_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_1_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_1_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_1_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_2_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_2_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_2_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_2_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_2_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_2_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_2_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_3_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_3_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_3_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_3_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_3_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_3_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_3_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_4_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_4_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_4_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_4_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_4_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_4_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_4_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_5_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_5_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_5_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_5_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_5_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_5_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_5_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_6_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_6_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_6_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_6_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_6_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_6_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_6_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  dataBanks_7_clock; // @[SRAM_1.scala 256:31]
  wire  dataBanks_7_reset; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_7_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_r_data_7; // @[SRAM_1.scala 256:31]
  wire  dataBanks_7_io_w_en; // @[SRAM_1.scala 256:31]
  wire [6:0] dataBanks_7_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_4; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_5; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_6; // @[SRAM_1.scala 256:31]
  wire [31:0] dataBanks_7_io_w_data_7; // @[SRAM_1.scala 256:31]
  wire [7:0] dataBanks_7_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  _wen_T_1 = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  SRAMArray_2P dataBanks_0 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_0_clock),
    .reset(dataBanks_0_reset),
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
  SRAMArray_2P dataBanks_1 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_1_clock),
    .reset(dataBanks_1_reset),
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
  SRAMArray_2P dataBanks_2 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_2_clock),
    .reset(dataBanks_2_reset),
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
  SRAMArray_2P dataBanks_3 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_3_clock),
    .reset(dataBanks_3_reset),
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
  SRAMArray_2P dataBanks_4 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_4_clock),
    .reset(dataBanks_4_reset),
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
  SRAMArray_2P dataBanks_5 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_5_clock),
    .reset(dataBanks_5_reset),
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
  SRAMArray_2P dataBanks_6 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_6_clock),
    .reset(dataBanks_6_reset),
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
  SRAMArray_2P dataBanks_7 ( // @[SRAM_1.scala 256:31]
    .clock(dataBanks_7_clock),
    .reset(dataBanks_7_reset),
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
  assign io_read_resp_0_0 = dataBanks_0_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_0_1 = dataBanks_0_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_0_2 = dataBanks_0_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_0_3 = dataBanks_0_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_0_4 = dataBanks_0_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_0_5 = dataBanks_0_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_0_6 = dataBanks_0_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_0_7 = dataBanks_0_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_1_0 = dataBanks_1_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_1_1 = dataBanks_1_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_1_2 = dataBanks_1_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_1_3 = dataBanks_1_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_1_4 = dataBanks_1_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_1_5 = dataBanks_1_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_1_6 = dataBanks_1_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_1_7 = dataBanks_1_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_2_0 = dataBanks_2_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_2_1 = dataBanks_2_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_2_2 = dataBanks_2_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_2_3 = dataBanks_2_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_2_4 = dataBanks_2_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_2_5 = dataBanks_2_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_2_6 = dataBanks_2_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_2_7 = dataBanks_2_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_3_0 = dataBanks_3_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_3_1 = dataBanks_3_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_3_2 = dataBanks_3_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_3_3 = dataBanks_3_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_3_4 = dataBanks_3_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_3_5 = dataBanks_3_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_3_6 = dataBanks_3_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_3_7 = dataBanks_3_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_4_0 = dataBanks_4_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_4_1 = dataBanks_4_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_4_2 = dataBanks_4_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_4_3 = dataBanks_4_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_4_4 = dataBanks_4_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_4_5 = dataBanks_4_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_4_6 = dataBanks_4_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_4_7 = dataBanks_4_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_5_0 = dataBanks_5_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_5_1 = dataBanks_5_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_5_2 = dataBanks_5_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_5_3 = dataBanks_5_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_5_4 = dataBanks_5_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_5_5 = dataBanks_5_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_5_6 = dataBanks_5_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_5_7 = dataBanks_5_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_6_0 = dataBanks_6_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_6_1 = dataBanks_6_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_6_2 = dataBanks_6_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_6_3 = dataBanks_6_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_6_4 = dataBanks_6_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_6_5 = dataBanks_6_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_6_6 = dataBanks_6_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_6_7 = dataBanks_6_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_read_resp_7_0 = dataBanks_7_io_r_data_0; // @[DataBank.scala 49:25]
  assign io_read_resp_7_1 = dataBanks_7_io_r_data_1; // @[DataBank.scala 49:25]
  assign io_read_resp_7_2 = dataBanks_7_io_r_data_2; // @[DataBank.scala 49:25]
  assign io_read_resp_7_3 = dataBanks_7_io_r_data_3; // @[DataBank.scala 49:25]
  assign io_read_resp_7_4 = dataBanks_7_io_r_data_4; // @[DataBank.scala 49:25]
  assign io_read_resp_7_5 = dataBanks_7_io_r_data_5; // @[DataBank.scala 49:25]
  assign io_read_resp_7_6 = dataBanks_7_io_r_data_6; // @[DataBank.scala 49:25]
  assign io_read_resp_7_7 = dataBanks_7_io_r_data_7; // @[DataBank.scala 49:25]
  assign io_write_req_ready = 1'h1; // @[DataBank.scala 55:28]
  assign dataBanks_0_clock = clock;
  assign dataBanks_0_reset = reset;
  assign dataBanks_0_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_0_io_w_en = io_write_req_bits_way[0] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_0_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_0_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_0_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_1_clock = clock;
  assign dataBanks_1_reset = reset;
  assign dataBanks_1_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_1_io_w_en = io_write_req_bits_way[1] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_1_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_1_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_1_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_2_clock = clock;
  assign dataBanks_2_reset = reset;
  assign dataBanks_2_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_2_io_w_en = io_write_req_bits_way[2] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_2_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_2_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_2_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_3_clock = clock;
  assign dataBanks_3_reset = reset;
  assign dataBanks_3_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_3_io_w_en = io_write_req_bits_way[3] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_3_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_3_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_3_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_4_clock = clock;
  assign dataBanks_4_reset = reset;
  assign dataBanks_4_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_4_io_w_en = io_write_req_bits_way[4] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_4_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_4_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_4_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_5_clock = clock;
  assign dataBanks_5_reset = reset;
  assign dataBanks_5_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_5_io_w_en = io_write_req_bits_way[5] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_5_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_5_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_5_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_6_clock = clock;
  assign dataBanks_6_reset = reset;
  assign dataBanks_6_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_6_io_w_en = io_write_req_bits_way[6] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_6_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_6_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_6_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
  assign dataBanks_7_clock = clock;
  assign dataBanks_7_reset = reset;
  assign dataBanks_7_io_r_addr = io_read_req_bits_set; // @[SRAM_1.scala 245:19]
  assign dataBanks_7_io_w_en = io_write_req_bits_way[7] & _wen_T_1; // @[DataBank.scala 53:44]
  assign dataBanks_7_io_w_addr = io_write_req_bits_set; // @[DataBank.scala 56:19 SRAM_1.scala 223:19]
  assign dataBanks_7_io_w_data_0 = io_write_req_bits_data_0; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_1 = io_write_req_bits_data_1; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_2 = io_write_req_bits_data_2; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_3 = io_write_req_bits_data_3; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_4 = io_write_req_bits_data_4; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_5 = io_write_req_bits_data_5; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_6 = io_write_req_bits_data_6; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_data_7 = io_write_req_bits_data_7; // @[DataBank.scala 56:19 SRAM_1.scala 224:19]
  assign dataBanks_7_io_w_maskOH = io_write_req_bits_blockMask; // @[DataBank.scala 56:19 SRAM_1.scala 225:21]
endmodule
