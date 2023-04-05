module LoadPipe(
  input         clock,
  input         reset,
  output        io_load_req_ready,
  input         io_load_req_valid,
  input  [31:0] io_load_req_bits_addr,
  output        io_load_resp_valid,
  output [31:0] io_load_resp_bits_data,
  input         io_dir_req_ready,
  output        io_dir_req_valid,
  output [31:0] io_dir_req_bits_addr,
  input         io_dir_resp_bits_hit,
  input  [7:0]  io_dir_resp_bits_chosenWay,
  input         io_dir_resp_bits_isDirtyWay,
  input         io_dataBank_req_ready,
  output        io_dataBank_req_valid,
  output [7:0]  io_dataBank_req_bits_set,
  input  [31:0] io_dataBank_resp_0_0,
  input  [31:0] io_dataBank_resp_0_1,
  input  [31:0] io_dataBank_resp_0_2,
  input  [31:0] io_dataBank_resp_0_3,
  input  [31:0] io_dataBank_resp_1_0,
  input  [31:0] io_dataBank_resp_1_1,
  input  [31:0] io_dataBank_resp_1_2,
  input  [31:0] io_dataBank_resp_1_3,
  input  [31:0] io_dataBank_resp_2_0,
  input  [31:0] io_dataBank_resp_2_1,
  input  [31:0] io_dataBank_resp_2_2,
  input  [31:0] io_dataBank_resp_2_3,
  input  [31:0] io_dataBank_resp_3_0,
  input  [31:0] io_dataBank_resp_3_1,
  input  [31:0] io_dataBank_resp_3_2,
  input  [31:0] io_dataBank_resp_3_3,
  input  [31:0] io_dataBank_resp_4_0,
  input  [31:0] io_dataBank_resp_4_1,
  input  [31:0] io_dataBank_resp_4_2,
  input  [31:0] io_dataBank_resp_4_3,
  input  [31:0] io_dataBank_resp_5_0,
  input  [31:0] io_dataBank_resp_5_1,
  input  [31:0] io_dataBank_resp_5_2,
  input  [31:0] io_dataBank_resp_5_3,
  input  [31:0] io_dataBank_resp_6_0,
  input  [31:0] io_dataBank_resp_6_1,
  input  [31:0] io_dataBank_resp_6_2,
  input  [31:0] io_dataBank_resp_6_3,
  input  [31:0] io_dataBank_resp_7_0,
  input  [31:0] io_dataBank_resp_7_1,
  input  [31:0] io_dataBank_resp_7_2,
  input  [31:0] io_dataBank_resp_7_3,
  input         io_mshr_ready,
  output        io_mshr_valid,
  output [31:0] io_mshr_bits_addr,
  output        io_mshr_bits_dirInfo_hit,
  output [7:0]  io_mshr_bits_dirInfo_chosenWay,
  output        io_mshr_bits_dirInfo_isDirtyWay,
  output [31:0] io_mshr_bits_data_0,
  output [31:0] io_mshr_bits_data_1,
  output [31:0] io_mshr_bits_data_2,
  output [31:0] io_mshr_bits_data_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[LoadPipe.scala 31:26]
  wire  s0_latch = io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[LoadPipe.scala 55:25]
  reg  s0_validReg; // @[LoadPipe.scala 52:30]
  wire  _s0_valid_T_1 = io_dir_req_ready & io_dir_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_3 = io_dataBank_req_ready & io_dataBank_req_valid; // @[Decoupled.scala 51:35]
  wire  s0_valid = (s0_valid_REG | s0_validReg) & _s0_valid_T_1 & _s0_valid_T_3; // @[LoadPipe.scala 55:71]
  reg  s1_full; // @[LoadPipe.scala 61:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T = ~s1_dirInfo_hit; // @[LoadPipe.scala 116:21]
  wire  _s1_valid_T_1 = io_mshr_ready & io_mshr_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_4 = s1_dirInfo_hit & io_load_resp_valid; // @[LoadPipe.scala 117:30]
  wire  _s1_valid_T_5 = ~s1_dirInfo_hit & _s1_valid_T_1 | _s1_valid_T_4; // @[LoadPipe.scala 116:47]
  wire  s1_fire = s1_full & _s1_valid_T_5; // @[LoadPipe.scala 115:25]
  wire  s1_ready = ~s1_full | s1_fire; // @[LoadPipe.scala 100:26]
  wire  s0_fire = s0_valid & s1_ready; // @[LoadPipe.scala 33:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LoadPipe.scala 31:26 40:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[LoadPipe.scala 39:{20,30}]
  wire  _GEN_3 = s0_fire ? 1'h0 : s0_validReg; // @[LoadPipe.scala 54:24 52:30 54:38]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[LoadPipe.scala 53:{20,34}]
  reg [31:0] s1_rAddr; // @[Reg.scala 19:16]
  wire [3:0] s1_blockSel = 4'h1 << s1_rAddr[3:2]; // @[OneHot.scala 57:35]
  reg [31:0] s1_rdDataAll_0_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7_3; // @[Reg.scala 19:16]
  reg [7:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  wire [31:0] _s1_rdBlockData_T_8 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_9 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_10 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_11 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_12 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_13 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_14 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_15 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_16 = _s1_rdBlockData_T_8 | _s1_rdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_17 = _s1_rdBlockData_T_16 | _s1_rdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_18 = _s1_rdBlockData_T_17 | _s1_rdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_19 = _s1_rdBlockData_T_18 | _s1_rdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_20 = _s1_rdBlockData_T_19 | _s1_rdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_21 = _s1_rdBlockData_T_20 | _s1_rdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_23 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_24 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_25 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_26 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_27 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_28 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_29 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_30 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_31 = _s1_rdBlockData_T_23 | _s1_rdBlockData_T_24; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_32 = _s1_rdBlockData_T_31 | _s1_rdBlockData_T_25; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_33 = _s1_rdBlockData_T_32 | _s1_rdBlockData_T_26; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_34 = _s1_rdBlockData_T_33 | _s1_rdBlockData_T_27; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_35 = _s1_rdBlockData_T_34 | _s1_rdBlockData_T_28; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_36 = _s1_rdBlockData_T_35 | _s1_rdBlockData_T_29; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_38 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_39 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_40 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_41 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_42 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_43 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_44 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_45 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_46 = _s1_rdBlockData_T_38 | _s1_rdBlockData_T_39; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_47 = _s1_rdBlockData_T_46 | _s1_rdBlockData_T_40; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_48 = _s1_rdBlockData_T_47 | _s1_rdBlockData_T_41; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_49 = _s1_rdBlockData_T_48 | _s1_rdBlockData_T_42; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_50 = _s1_rdBlockData_T_49 | _s1_rdBlockData_T_43; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_51 = _s1_rdBlockData_T_50 | _s1_rdBlockData_T_44; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_53 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_54 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_55 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_56 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_57 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_58 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_59 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_60 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_61 = _s1_rdBlockData_T_53 | _s1_rdBlockData_T_54; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_62 = _s1_rdBlockData_T_61 | _s1_rdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_63 = _s1_rdBlockData_T_62 | _s1_rdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_64 = _s1_rdBlockData_T_63 | _s1_rdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_65 = _s1_rdBlockData_T_64 | _s1_rdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdBlockData_T_66 = _s1_rdBlockData_T_65 | _s1_rdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] s1_rdBlockData_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_4 = s1_blockSel[0] ? s1_rdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_5 = s1_blockSel[1] ? s1_rdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_6 = s1_blockSel[2] ? s1_rdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_7 = s1_blockSel[3] ? s1_rdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_8 = _s1_rdData_T_4 | _s1_rdData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = _s1_rdData_T_8 | _s1_rdData_T_6; // @[Mux.scala 27:73]
  wire  _GEN_49 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LoadPipe.scala 102:{35,45} 61:26]
  wire  _GEN_50 = s0_fire | _GEN_49; // @[LoadPipe.scala 101:{20,30}]
  assign io_load_req_ready = ~s0_full; // @[LoadPipe.scala 37:26]
  assign io_load_resp_valid = s1_dirInfo_hit & s1_full; // @[LoadPipe.scala 111:36]
  assign io_load_resp_bits_data = _s1_rdData_T_9 | _s1_rdData_T_7; // @[Mux.scala 27:73]
  assign io_dir_req_valid = s0_latch | s0_full; // @[LoadPipe.scala 43:34]
  assign io_dir_req_bits_addr = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[LoadPipe.scala 35:23]
  assign io_dataBank_req_valid = s0_latch | s0_full; // @[LoadPipe.scala 46:39]
  assign io_dataBank_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_mshr_valid = _s1_valid_T & s1_full; // @[LoadPipe.scala 104:32]
  assign io_mshr_bits_addr = s1_rAddr; // @[LoadPipe.scala 106:23]
  assign io_mshr_bits_dirInfo_hit = s1_dirInfo_hit; // @[LoadPipe.scala 108:26]
  assign io_mshr_bits_dirInfo_chosenWay = s1_dirInfo_chosenWay; // @[LoadPipe.scala 108:26]
  assign io_mshr_bits_dirInfo_isDirtyWay = s1_dirInfo_isDirtyWay; // @[LoadPipe.scala 108:26]
  assign io_mshr_bits_data_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  always @(posedge clock) begin
    if (reset) begin // @[LoadPipe.scala 31:26]
      s0_full <= 1'h0; // @[LoadPipe.scala 31:26]
    end else begin
      s0_full <= _GEN_2;
    end
    s0_valid_REG <= io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[LoadPipe.scala 52:30]
      s0_validReg <= 1'h0; // @[LoadPipe.scala 52:30]
    end else begin
      s0_validReg <= _GEN_4;
    end
    if (reset) begin // @[LoadPipe.scala 61:26]
      s1_full <= 1'h0; // @[LoadPipe.scala 61:26]
    end else begin
      s1_full <= _GEN_50;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (s0_latch) begin // @[Reg.scala 20:18]
        s1_rAddr <= io_load_req_bits_addr; // @[Reg.scala 20:22]
      end else begin
        s1_rAddr <= s0_reqReg_addr; // @[Reg.scala 19:16]
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_0 <= io_dataBank_resp_0_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_1 <= io_dataBank_resp_0_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_2 <= io_dataBank_resp_0_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_3 <= io_dataBank_resp_0_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_0 <= io_dataBank_resp_1_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_1 <= io_dataBank_resp_1_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_2 <= io_dataBank_resp_1_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_3 <= io_dataBank_resp_1_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_0 <= io_dataBank_resp_2_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_1 <= io_dataBank_resp_2_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_2 <= io_dataBank_resp_2_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_3 <= io_dataBank_resp_2_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_0 <= io_dataBank_resp_3_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_1 <= io_dataBank_resp_3_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_2 <= io_dataBank_resp_3_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_3 <= io_dataBank_resp_3_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_0 <= io_dataBank_resp_4_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_1 <= io_dataBank_resp_4_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_2 <= io_dataBank_resp_4_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_3 <= io_dataBank_resp_4_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_0 <= io_dataBank_resp_5_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_1 <= io_dataBank_resp_5_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_2 <= io_dataBank_resp_5_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_3 <= io_dataBank_resp_5_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_0 <= io_dataBank_resp_6_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_1 <= io_dataBank_resp_6_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_2 <= io_dataBank_resp_6_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_3 <= io_dataBank_resp_6_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_0 <= io_dataBank_resp_7_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_1 <= io_dataBank_resp_7_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_2 <= io_dataBank_resp_7_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_3 <= io_dataBank_resp_7_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_chosenWay <= io_dir_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  s0_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s0_valid_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_validReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_full = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_dirInfo_hit = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s1_rAddr = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s1_rdDataAll_0_0 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s1_rdDataAll_0_1 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s1_rdDataAll_0_2 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s1_rdDataAll_0_3 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_rdDataAll_1_0 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_rdDataAll_1_1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_rdDataAll_1_2 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_rdDataAll_1_3 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_rdDataAll_2_0 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_rdDataAll_2_1 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_rdDataAll_2_2 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s1_rdDataAll_2_3 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s1_rdDataAll_3_0 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s1_rdDataAll_3_1 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s1_rdDataAll_3_2 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  s1_rdDataAll_3_3 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s1_rdDataAll_4_0 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_rdDataAll_4_1 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_rdDataAll_4_2 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_rdDataAll_4_3 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s1_rdDataAll_5_0 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  s1_rdDataAll_5_1 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s1_rdDataAll_5_2 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_rdDataAll_5_3 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_rdDataAll_6_0 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s1_rdDataAll_6_1 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s1_rdDataAll_6_2 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s1_rdDataAll_6_3 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s1_rdDataAll_7_0 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  s1_rdDataAll_7_1 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s1_rdDataAll_7_2 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s1_rdDataAll_7_3 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s1_dirInfo_chosenWay = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  s1_dirInfo_isDirtyWay = _RAND_40[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
