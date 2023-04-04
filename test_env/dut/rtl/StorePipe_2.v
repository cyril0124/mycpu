module StorePipe_2(
  input         clock,
  input         reset,
  output        io_store_req_ready,
  input         io_store_req_valid,
  input  [31:0] io_store_req_bits_addr,
  input  [31:0] io_store_req_bits_data,
  input  [3:0]  io_store_req_bits_mask,
  output        io_store_resp_valid,
  output        io_dir_read_req_valid,
  output [31:0] io_dir_read_req_bits_addr,
  input         io_dir_read_resp_bits_hit,
  input  [7:0]  io_dir_read_resp_bits_chosenWay,
  input         io_dir_read_resp_bits_isDirtyWay,
  input  [19:0] io_dir_read_resp_bits_dirtyTag,
  output        io_dir_write_req_valid,
  output [31:0] io_dir_write_req_bits_addr,
  output [7:0]  io_dir_write_req_bits_way,
  output        io_dataBank_read_req_valid,
  output [7:0]  io_dataBank_read_req_bits_set,
  input  [31:0] io_dataBank_read_resp_0_0,
  input  [31:0] io_dataBank_read_resp_0_1,
  input  [31:0] io_dataBank_read_resp_0_2,
  input  [31:0] io_dataBank_read_resp_0_3,
  input  [31:0] io_dataBank_read_resp_1_0,
  input  [31:0] io_dataBank_read_resp_1_1,
  input  [31:0] io_dataBank_read_resp_1_2,
  input  [31:0] io_dataBank_read_resp_1_3,
  input  [31:0] io_dataBank_read_resp_2_0,
  input  [31:0] io_dataBank_read_resp_2_1,
  input  [31:0] io_dataBank_read_resp_2_2,
  input  [31:0] io_dataBank_read_resp_2_3,
  input  [31:0] io_dataBank_read_resp_3_0,
  input  [31:0] io_dataBank_read_resp_3_1,
  input  [31:0] io_dataBank_read_resp_3_2,
  input  [31:0] io_dataBank_read_resp_3_3,
  input  [31:0] io_dataBank_read_resp_4_0,
  input  [31:0] io_dataBank_read_resp_4_1,
  input  [31:0] io_dataBank_read_resp_4_2,
  input  [31:0] io_dataBank_read_resp_4_3,
  input  [31:0] io_dataBank_read_resp_5_0,
  input  [31:0] io_dataBank_read_resp_5_1,
  input  [31:0] io_dataBank_read_resp_5_2,
  input  [31:0] io_dataBank_read_resp_5_3,
  input  [31:0] io_dataBank_read_resp_6_0,
  input  [31:0] io_dataBank_read_resp_6_1,
  input  [31:0] io_dataBank_read_resp_6_2,
  input  [31:0] io_dataBank_read_resp_6_3,
  input  [31:0] io_dataBank_read_resp_7_0,
  input  [31:0] io_dataBank_read_resp_7_1,
  input  [31:0] io_dataBank_read_resp_7_2,
  input  [31:0] io_dataBank_read_resp_7_3,
  output        io_dataBank_write_req_valid,
  output [31:0] io_dataBank_write_req_bits_data,
  output [7:0]  io_dataBank_write_req_bits_set,
  output [3:0]  io_dataBank_write_req_bits_blockSelOH,
  output [7:0]  io_dataBank_write_req_bits_way,
  input         io_mshr_ready,
  output        io_mshr_valid,
  output [31:0] io_mshr_bits_addr,
  output        io_mshr_bits_dirInfo_hit,
  output [7:0]  io_mshr_bits_dirInfo_chosenWay,
  output        io_mshr_bits_dirInfo_isDirtyWay,
  output [19:0] io_mshr_bits_dirInfo_dirtyTag,
  output [31:0] io_mshr_bits_data_0,
  output [31:0] io_mshr_bits_data_1,
  output [31:0] io_mshr_bits_data_2,
  output [31:0] io_mshr_bits_data_3,
  output [31:0] io_mshr_bits_storeData,
  output [3:0]  io_mshr_bits_storeMask
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
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[StorePipe_2.scala 31:26]
  wire  s0_latch = io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[StorePipe_2.scala 57:25]
  reg  s0_validReg; // @[StorePipe_2.scala 54:30]
  wire  s0_valid = (s0_valid_REG | s0_validReg) & io_dir_read_req_valid & io_dataBank_read_req_valid; // @[StorePipe_2.scala 57:77]
  reg  s1_full; // @[StorePipe_2.scala 64:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T = ~s1_dirInfo_hit; // @[StorePipe_2.scala 115:21]
  wire  _s1_valid_T_1 = io_mshr_ready & io_mshr_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_6 = s1_dirInfo_hit & io_dataBank_write_req_valid & io_dir_write_req_valid; // @[StorePipe_2.scala 116:60]
  wire  _s1_valid_T_7 = ~s1_dirInfo_hit & _s1_valid_T_1 | _s1_valid_T_6; // @[StorePipe_2.scala 115:47]
  wire  s1_valid = s1_full & _s1_valid_T_7; // @[StorePipe_2.scala 114:25]
  reg  s2_full; // @[StorePipe_2.scala 122:26]
  reg  s2_isHit; // @[Reg.scala 19:16]
  wire  s2_fire = io_store_resp_valid & s2_full & s2_isHit | ~s2_isHit; // @[StorePipe_2.scala 134:59]
  wire  s2_ready = ~s2_full | s2_fire; // @[StorePipe_2.scala 127:26]
  wire  s1_fire = s1_valid & s2_ready; // @[StorePipe_2.scala 66:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[StorePipe_2.scala 79:26]
  wire  s0_fire = s0_valid & s1_ready; // @[StorePipe_2.scala 33:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s0_reqReg_mask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_3 = s0_full & s0_fire ? 1'h0 : s0_full; // @[StorePipe_2.scala 31:26 41:{35,45}]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[StorePipe_2.scala 40:{20,30}]
  wire  _GEN_5 = s0_fire ? 1'h0 : s0_validReg; // @[StorePipe_2.scala 56:24 54:30 56:38]
  wire  _GEN_6 = s0_latch | _GEN_5; // @[StorePipe_2.scala 55:{20,34}]
  reg [31:0] s1_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s1_reqReg_mask; // @[Reg.scala 19:16]
  wire [3:0] s1_dataBlockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  reg [7:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  reg [19:0] s1_dirInfo_dirtyTag; // @[Reg.scala 19:16]
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
  wire [31:0] _s1_rdData_T_4 = s1_dataBlockSelOH[0] ? s1_rdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_5 = s1_dataBlockSelOH[1] ? s1_rdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_6 = s1_dataBlockSelOH[2] ? s1_rdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_7 = s1_dataBlockSelOH[3] ? s1_rdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_8 = _s1_rdData_T_4 | _s1_rdData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = _s1_rdData_T_8 | _s1_rdData_T_6; // @[Mux.scala 27:73]
  wire [31:0] s1_rdData = _s1_rdData_T_9 | _s1_rdData_T_7; // @[Mux.scala 27:73]
  wire  _GEN_46 = s1_full & s1_fire ? 1'h0 : s1_full; // @[StorePipe_2.scala 64:26 81:{35,45}]
  wire  _GEN_47 = s0_fire | _GEN_46; // @[StorePipe_2.scala 80:{20,30}]
  wire [7:0] _io_dataBank_write_req_bits_data_tempMask_T_5 = s1_reqReg_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _io_dataBank_write_req_bits_data_tempMask_T_7 = s1_reqReg_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _io_dataBank_write_req_bits_data_tempMask_T_9 = s1_reqReg_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _io_dataBank_write_req_bits_data_tempMask_T_11 = s1_reqReg_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [31:0] io_dataBank_write_req_bits_data_tempMask = {_io_dataBank_write_req_bits_data_tempMask_T_11,
    _io_dataBank_write_req_bits_data_tempMask_T_9,_io_dataBank_write_req_bits_data_tempMask_T_7,
    _io_dataBank_write_req_bits_data_tempMask_T_5}; // @[Cat.scala 33:92]
  wire [31:0] _io_dataBank_write_req_bits_data_T = ~io_dataBank_write_req_bits_data_tempMask; // @[Parameters.scala 67:8]
  wire [31:0] _io_dataBank_write_req_bits_data_T_1 = _io_dataBank_write_req_bits_data_T & s1_rdData; // @[Parameters.scala 67:18]
  wire [31:0] _io_dataBank_write_req_bits_data_T_2 = io_dataBank_write_req_bits_data_tempMask & s1_reqReg_data; // @[Parameters.scala 67:41]
  wire  _GEN_49 = s2_full & s2_fire ? 1'h0 : s2_full; // @[StorePipe_2.scala 122:26 129:{35,45}]
  wire  _GEN_50 = s1_fire | _GEN_49; // @[StorePipe_2.scala 128:{20,30}]
  assign io_store_req_ready = ~s0_full; // @[StorePipe_2.scala 39:27]
  assign io_store_resp_valid = s2_isHit & s2_full; // @[StorePipe_2.scala 131:37]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[StorePipe_2.scala 44:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[StorePipe_2.scala 35:23]
  assign io_dir_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe_2.scala 96:40]
  assign io_dir_write_req_bits_addr = s1_reqReg_addr; // @[StorePipe_2.scala 98:32]
  assign io_dir_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 103:31]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[StorePipe_2.scala 47:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe_2.scala 105:45]
  assign io_dataBank_write_req_bits_data = _io_dataBank_write_req_bits_data_T_1 | _io_dataBank_write_req_bits_data_T_2; // @[Parameters.scala 67:29]
  assign io_dataBank_write_req_bits_set = s1_reqReg_addr[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_blockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 109:36]
  assign io_mshr_valid = _s1_valid_T & s1_full; // @[StorePipe_2.scala 87:32]
  assign io_mshr_bits_addr = s1_reqReg_addr; // @[StorePipe_2.scala 89:23]
  assign io_mshr_bits_dirInfo_hit = s1_dirInfo_hit; // @[StorePipe_2.scala 90:26]
  assign io_mshr_bits_dirInfo_chosenWay = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 90:26]
  assign io_mshr_bits_dirInfo_isDirtyWay = s1_dirInfo_isDirtyWay; // @[StorePipe_2.scala 90:26]
  assign io_mshr_bits_dirInfo_dirtyTag = s1_dirInfo_dirtyTag; // @[StorePipe_2.scala 90:26]
  assign io_mshr_bits_data_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  assign io_mshr_bits_storeData = s1_reqReg_data; // @[StorePipe_2.scala 93:28]
  assign io_mshr_bits_storeMask = s1_reqReg_mask; // @[StorePipe_2.scala 94:28]
  always @(posedge clock) begin
    if (reset) begin // @[StorePipe_2.scala 31:26]
      s0_full <= 1'h0; // @[StorePipe_2.scala 31:26]
    end else begin
      s0_full <= _GEN_4;
    end
    s0_valid_REG <= io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[StorePipe_2.scala 54:30]
      s0_validReg <= 1'h0; // @[StorePipe_2.scala 54:30]
    end else begin
      s0_validReg <= _GEN_6;
    end
    if (reset) begin // @[StorePipe_2.scala 64:26]
      s1_full <= 1'h0; // @[StorePipe_2.scala 64:26]
    end else begin
      s1_full <= _GEN_47;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[StorePipe_2.scala 122:26]
      s2_full <= 1'h0; // @[StorePipe_2.scala 122:26]
    end else begin
      s2_full <= _GEN_50;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_isHit <= s1_dirInfo_hit; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_store_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_data <= io_store_req_bits_data; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_mask <= io_store_req_bits_mask; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_addr <= s0_reqReg_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_data <= s0_reqReg_data; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_reqReg_mask <= s0_reqReg_mask; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_chosenWay <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_read_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_dirtyTag <= io_dir_read_resp_bits_dirtyTag; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_0 <= io_dataBank_read_resp_0_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_1 <= io_dataBank_read_resp_0_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_2 <= io_dataBank_read_resp_0_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0_3 <= io_dataBank_read_resp_0_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_0 <= io_dataBank_read_resp_1_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_1 <= io_dataBank_read_resp_1_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_2 <= io_dataBank_read_resp_1_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1_3 <= io_dataBank_read_resp_1_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_0 <= io_dataBank_read_resp_2_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_1 <= io_dataBank_read_resp_2_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_2 <= io_dataBank_read_resp_2_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2_3 <= io_dataBank_read_resp_2_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_0 <= io_dataBank_read_resp_3_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_1 <= io_dataBank_read_resp_3_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_2 <= io_dataBank_read_resp_3_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3_3 <= io_dataBank_read_resp_3_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_0 <= io_dataBank_read_resp_4_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_1 <= io_dataBank_read_resp_4_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_2 <= io_dataBank_read_resp_4_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4_3 <= io_dataBank_read_resp_4_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_0 <= io_dataBank_read_resp_5_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_1 <= io_dataBank_read_resp_5_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_2 <= io_dataBank_read_resp_5_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5_3 <= io_dataBank_read_resp_5_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_0 <= io_dataBank_read_resp_6_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_1 <= io_dataBank_read_resp_6_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_2 <= io_dataBank_read_resp_6_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6_3 <= io_dataBank_read_resp_6_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_0 <= io_dataBank_read_resp_7_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_1 <= io_dataBank_read_resp_7_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_2 <= io_dataBank_read_resp_7_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7_3 <= io_dataBank_read_resp_7_3; // @[Reg.scala 20:22]
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
  s2_full = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_isHit = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s0_reqReg_data = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s0_reqReg_mask = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  s1_reqReg_addr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  s1_reqReg_data = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_reqReg_mask = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  s1_dirInfo_chosenWay = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  s1_dirInfo_isDirtyWay = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_dirInfo_dirtyTag = _RAND_15[19:0];
  _RAND_16 = {1{`RANDOM}};
  s1_rdDataAll_0_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_rdDataAll_0_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s1_rdDataAll_0_2 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s1_rdDataAll_0_3 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s1_rdDataAll_1_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s1_rdDataAll_1_1 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  s1_rdDataAll_1_2 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s1_rdDataAll_1_3 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_rdDataAll_2_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_rdDataAll_2_1 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_rdDataAll_2_2 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s1_rdDataAll_2_3 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  s1_rdDataAll_3_0 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s1_rdDataAll_3_1 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_rdDataAll_3_2 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_rdDataAll_3_3 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s1_rdDataAll_4_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s1_rdDataAll_4_1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s1_rdDataAll_4_2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s1_rdDataAll_4_3 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  s1_rdDataAll_5_0 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s1_rdDataAll_5_1 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s1_rdDataAll_5_2 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s1_rdDataAll_5_3 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s1_rdDataAll_6_0 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  s1_rdDataAll_6_1 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  s1_rdDataAll_6_2 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  s1_rdDataAll_6_3 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  s1_rdDataAll_7_0 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  s1_rdDataAll_7_1 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  s1_rdDataAll_7_2 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  s1_rdDataAll_7_3 = _RAND_47[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
