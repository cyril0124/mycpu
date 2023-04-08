module StorePipe(
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
  input  [19:0] io_dir_read_resp_bits_tagRdVec_0,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_1,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_2,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_3,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_4,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_5,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_6,
  input  [19:0] io_dir_read_resp_bits_tagRdVec_7,
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
  output [7:0]  io_dataBank_write_req_bits_set,
  output [31:0] io_dataBank_write_req_bits_data_0,
  output [31:0] io_dataBank_write_req_bits_data_1,
  output [31:0] io_dataBank_write_req_bits_data_2,
  output [31:0] io_dataBank_write_req_bits_data_3,
  output [3:0]  io_dataBank_write_req_bits_blockMask,
  output [7:0]  io_dataBank_write_req_bits_way,
  input         io_mshr_ready,
  output        io_mshr_valid,
  output [31:0] io_mshr_bits_addr,
  output        io_mshr_bits_dirInfo_hit,
  output [7:0]  io_mshr_bits_dirInfo_chosenWay,
  output        io_mshr_bits_dirInfo_isDirtyWay,
  output [19:0] io_mshr_bits_dirtyTag,
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
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[StorePipe.scala 30:26]
  wire  s0_latch = io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[StorePipe.scala 56:25]
  reg  s0_validReg; // @[StorePipe.scala 53:30]
  wire  s0_valid = (s0_valid_REG | s0_validReg) & io_dir_read_req_valid & io_dataBank_read_req_valid; // @[StorePipe.scala 56:77]
  reg  s1_full; // @[StorePipe.scala 63:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T = ~s1_dirInfo_hit; // @[StorePipe.scala 114:21]
  wire  _s1_valid_T_1 = io_mshr_ready & io_mshr_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_6 = s1_dirInfo_hit & io_dataBank_write_req_valid & io_dir_write_req_valid; // @[StorePipe.scala 115:60]
  wire  _s1_valid_T_7 = ~s1_dirInfo_hit & _s1_valid_T_1 | _s1_valid_T_6; // @[StorePipe.scala 114:47]
  wire  s1_valid = s1_full & _s1_valid_T_7; // @[StorePipe.scala 113:25]
  reg  s2_full; // @[StorePipe.scala 121:26]
  reg  s2_isHit; // @[Reg.scala 19:16]
  wire  s2_fire = io_store_resp_valid & s2_full & s2_isHit | ~s2_isHit; // @[StorePipe.scala 133:59]
  wire  s2_ready = ~s2_full | s2_fire; // @[StorePipe.scala 126:26]
  wire  s1_fire = s1_valid & s2_ready; // @[StorePipe.scala 65:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[StorePipe.scala 80:26]
  wire  s0_fire = s0_valid & s1_ready; // @[StorePipe.scala 32:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s0_reqReg_mask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_3 = s0_full & s0_fire ? 1'h0 : s0_full; // @[StorePipe.scala 30:26 40:{35,45}]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[StorePipe.scala 39:{20,30}]
  wire  _GEN_5 = s0_fire ? 1'h0 : s0_validReg; // @[StorePipe.scala 55:24 53:30 55:38]
  wire  _GEN_6 = s0_latch | _GEN_5; // @[StorePipe.scala 54:{20,34}]
  reg [31:0] s1_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s1_reqReg_mask; // @[Reg.scala 19:16]
  wire [3:0] s1_dataBlockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
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
  wire [31:0] _s1_rdData_T_4 = s1_dataBlockSelOH[0] ? s1_rdBlockData_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_5 = s1_dataBlockSelOH[1] ? s1_rdBlockData_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_6 = s1_dataBlockSelOH[2] ? s1_rdBlockData_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_7 = s1_dataBlockSelOH[3] ? s1_rdBlockData_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_8 = _s1_rdData_T_4 | _s1_rdData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = _s1_rdData_T_8 | _s1_rdData_T_6; // @[Mux.scala 27:73]
  wire [31:0] s1_rdData = _s1_rdData_T_9 | _s1_rdData_T_7; // @[Mux.scala 27:73]
  reg [19:0] s1_tagRdVec_0; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_1; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_2; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_3; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_4; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_5; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_6; // @[Reg.scala 19:16]
  reg [19:0] s1_tagRdVec_7; // @[Reg.scala 19:16]
  wire [19:0] _s1_dirtyTag_T_8 = s1_dirInfo_chosenWay[0] ? s1_tagRdVec_0 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_9 = s1_dirInfo_chosenWay[1] ? s1_tagRdVec_1 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_10 = s1_dirInfo_chosenWay[2] ? s1_tagRdVec_2 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_11 = s1_dirInfo_chosenWay[3] ? s1_tagRdVec_3 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_12 = s1_dirInfo_chosenWay[4] ? s1_tagRdVec_4 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_13 = s1_dirInfo_chosenWay[5] ? s1_tagRdVec_5 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_14 = s1_dirInfo_chosenWay[6] ? s1_tagRdVec_6 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_15 = s1_dirInfo_chosenWay[7] ? s1_tagRdVec_7 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_16 = _s1_dirtyTag_T_8 | _s1_dirtyTag_T_9; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_17 = _s1_dirtyTag_T_16 | _s1_dirtyTag_T_10; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_18 = _s1_dirtyTag_T_17 | _s1_dirtyTag_T_11; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_19 = _s1_dirtyTag_T_18 | _s1_dirtyTag_T_12; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_20 = _s1_dirtyTag_T_19 | _s1_dirtyTag_T_13; // @[Mux.scala 27:73]
  wire [19:0] _s1_dirtyTag_T_21 = _s1_dirtyTag_T_20 | _s1_dirtyTag_T_14; // @[Mux.scala 27:73]
  wire  _GEN_61 = s1_full & s1_fire ? 1'h0 : s1_full; // @[StorePipe.scala 63:26 82:{35,45}]
  wire  _GEN_62 = s0_fire | _GEN_61; // @[StorePipe.scala 81:{20,30}]
  wire [1:0] hi = s1_dataBlockSelOH[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo = s1_dataBlockSelOH[1:0]; // @[OneHot.scala 31:18]
  wire  _T_2 = |hi; // @[OneHot.scala 32:14]
  wire [1:0] _T_3 = hi | lo; // @[OneHot.scala 32:28]
  wire [1:0] _T_5 = {_T_2,_T_3[1]}; // @[Cat.scala 33:92]
  wire [7:0] _tempWrData_tempMask_T_5 = s1_reqReg_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_7 = s1_reqReg_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_9 = s1_reqReg_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_11 = s1_reqReg_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [31:0] tempWrData_tempMask = {_tempWrData_tempMask_T_11,_tempWrData_tempMask_T_9,_tempWrData_tempMask_T_7,
    _tempWrData_tempMask_T_5}; // @[Cat.scala 33:92]
  wire [31:0] _tempWrData_T = ~tempWrData_tempMask; // @[Parameters.scala 67:8]
  wire [31:0] _tempWrData_T_1 = _tempWrData_T & s1_rdData; // @[Parameters.scala 67:18]
  wire [31:0] _tempWrData_T_2 = tempWrData_tempMask & s1_reqReg_data; // @[Parameters.scala 67:41]
  wire [31:0] _tempWrData_T_3 = _tempWrData_T_1 | _tempWrData_T_2; // @[Parameters.scala 67:29]
  wire  _GEN_68 = s2_full & s2_fire ? 1'h0 : s2_full; // @[StorePipe.scala 121:26 128:{35,45}]
  wire  _GEN_69 = s1_fire | _GEN_68; // @[StorePipe.scala 127:{20,30}]
  assign io_store_req_ready = ~s0_full; // @[StorePipe.scala 38:27]
  assign io_store_resp_valid = s2_isHit & s2_full; // @[StorePipe.scala 130:37]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 43:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[StorePipe.scala 34:23]
  assign io_dir_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe.scala 94:40]
  assign io_dir_write_req_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 96:32]
  assign io_dir_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe.scala 101:31]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[StorePipe.scala 46:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe.scala 103:45]
  assign io_dataBank_write_req_bits_set = s1_reqReg_addr[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_data_0 = 2'h0 == _T_5 ? _tempWrData_T_3 : 32'h0; // @[StorePipe.scala 108:30 109:{45,45}]
  assign io_dataBank_write_req_bits_data_1 = 2'h1 == _T_5 ? _tempWrData_T_3 : 32'h0; // @[StorePipe.scala 108:30 109:{45,45}]
  assign io_dataBank_write_req_bits_data_2 = 2'h2 == _T_5 ? _tempWrData_T_3 : 32'h0; // @[StorePipe.scala 108:30 109:{45,45}]
  assign io_dataBank_write_req_bits_data_3 = 2'h3 == _T_5 ? _tempWrData_T_3 : 32'h0; // @[StorePipe.scala 108:30 109:{45,45}]
  assign io_dataBank_write_req_bits_blockMask = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe.scala 107:36]
  assign io_mshr_valid = _s1_valid_T & s1_full; // @[StorePipe.scala 84:32]
  assign io_mshr_bits_addr = s1_reqReg_addr; // @[StorePipe.scala 86:23]
  assign io_mshr_bits_dirInfo_hit = s1_dirInfo_hit; // @[StorePipe.scala 87:26]
  assign io_mshr_bits_dirInfo_chosenWay = s1_dirInfo_chosenWay; // @[StorePipe.scala 87:26]
  assign io_mshr_bits_dirInfo_isDirtyWay = s1_dirInfo_isDirtyWay; // @[StorePipe.scala 87:26]
  assign io_mshr_bits_dirtyTag = _s1_dirtyTag_T_21 | _s1_dirtyTag_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_0 = _s1_rdBlockData_T_21 | _s1_rdBlockData_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_1 = _s1_rdBlockData_T_36 | _s1_rdBlockData_T_30; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_2 = _s1_rdBlockData_T_51 | _s1_rdBlockData_T_45; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_3 = _s1_rdBlockData_T_66 | _s1_rdBlockData_T_60; // @[Mux.scala 27:73]
  assign io_mshr_bits_storeData = s1_reqReg_data; // @[StorePipe.scala 91:28]
  assign io_mshr_bits_storeMask = s1_reqReg_mask; // @[StorePipe.scala 92:28]
  always @(posedge clock) begin
    if (reset) begin // @[StorePipe.scala 30:26]
      s0_full <= 1'h0; // @[StorePipe.scala 30:26]
    end else begin
      s0_full <= _GEN_4;
    end
    s0_valid_REG <= io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[StorePipe.scala 53:30]
      s0_validReg <= 1'h0; // @[StorePipe.scala 53:30]
    end else begin
      s0_validReg <= _GEN_6;
    end
    if (reset) begin // @[StorePipe.scala 63:26]
      s1_full <= 1'h0; // @[StorePipe.scala 63:26]
    end else begin
      s1_full <= _GEN_62;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[StorePipe.scala 121:26]
      s2_full <= 1'h0; // @[StorePipe.scala 121:26]
    end else begin
      s2_full <= _GEN_69;
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
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_chosenWay <= io_dir_read_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_read_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_0 <= io_dir_read_resp_bits_tagRdVec_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_1 <= io_dir_read_resp_bits_tagRdVec_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_2 <= io_dir_read_resp_bits_tagRdVec_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_3 <= io_dir_read_resp_bits_tagRdVec_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_4 <= io_dir_read_resp_bits_tagRdVec_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_5 <= io_dir_read_resp_bits_tagRdVec_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_6 <= io_dir_read_resp_bits_tagRdVec_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_tagRdVec_7 <= io_dir_read_resp_bits_tagRdVec_7; // @[Reg.scala 20:22]
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
  s1_rdDataAll_0_0 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_rdDataAll_0_1 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_rdDataAll_0_2 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_rdDataAll_0_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_rdDataAll_1_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s1_rdDataAll_1_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s1_rdDataAll_1_2 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s1_rdDataAll_1_3 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s1_rdDataAll_2_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  s1_rdDataAll_2_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s1_rdDataAll_2_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s1_rdDataAll_2_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  s1_rdDataAll_3_0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  s1_rdDataAll_3_1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s1_rdDataAll_3_2 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  s1_rdDataAll_3_3 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s1_rdDataAll_4_0 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  s1_rdDataAll_4_1 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  s1_rdDataAll_4_2 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  s1_rdDataAll_4_3 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  s1_rdDataAll_5_0 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  s1_rdDataAll_5_1 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  s1_rdDataAll_5_2 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  s1_rdDataAll_5_3 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  s1_rdDataAll_6_0 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  s1_rdDataAll_6_1 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  s1_rdDataAll_6_2 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  s1_rdDataAll_6_3 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  s1_rdDataAll_7_0 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  s1_rdDataAll_7_1 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  s1_rdDataAll_7_2 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  s1_rdDataAll_7_3 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  s1_dirInfo_chosenWay = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  s1_dirInfo_isDirtyWay = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  s1_tagRdVec_0 = _RAND_47[19:0];
  _RAND_48 = {1{`RANDOM}};
  s1_tagRdVec_1 = _RAND_48[19:0];
  _RAND_49 = {1{`RANDOM}};
  s1_tagRdVec_2 = _RAND_49[19:0];
  _RAND_50 = {1{`RANDOM}};
  s1_tagRdVec_3 = _RAND_50[19:0];
  _RAND_51 = {1{`RANDOM}};
  s1_tagRdVec_4 = _RAND_51[19:0];
  _RAND_52 = {1{`RANDOM}};
  s1_tagRdVec_5 = _RAND_52[19:0];
  _RAND_53 = {1{`RANDOM}};
  s1_tagRdVec_6 = _RAND_53[19:0];
  _RAND_54 = {1{`RANDOM}};
  s1_tagRdVec_7 = _RAND_54[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
