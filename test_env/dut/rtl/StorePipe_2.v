module StorePipe_2(
  input          clock,
  input          reset,
  output         io_store_req_ready,
  input          io_store_req_valid,
  input  [31:0]  io_store_req_bits_addr,
  input  [31:0]  io_store_req_bits_data,
  input  [3:0]   io_store_req_bits_mask,
  output         io_store_resp_valid,
  output         io_dir_read_req_valid,
  output [31:0]  io_dir_read_req_bits_addr,
  input          io_dir_read_resp_bits_hit,
  input  [7:0]   io_dir_read_resp_bits_chosenWay,
  input          io_dir_read_resp_bits_isDirtyWay,
  input  [19:0]  io_dir_read_resp_bits_dirtyTag,
  output         io_dir_write_req_valid,
  output [31:0]  io_dir_write_req_bits_addr,
  output [7:0]   io_dir_write_req_bits_way,
  input          io_dataBank_read_req_ready,
  output         io_dataBank_read_req_valid,
  output [7:0]   io_dataBank_read_req_bits_set,
  output [3:0]   io_dataBank_read_req_bits_blockSelOH,
  input  [255:0] io_dataBank_read_resp_bits_blockData_0,
  input  [255:0] io_dataBank_read_resp_bits_blockData_1,
  input  [255:0] io_dataBank_read_resp_bits_blockData_2,
  input  [255:0] io_dataBank_read_resp_bits_blockData_3,
  output         io_dataBank_write_req_valid,
  output [31:0]  io_dataBank_write_req_bits_data,
  output [7:0]   io_dataBank_write_req_bits_set,
  output [3:0]   io_dataBank_write_req_bits_blockSelOH,
  output [7:0]   io_dataBank_write_req_bits_way,
  output [3:0]   io_dataBank_write_req_bits_mask,
  input          io_mshr_ready,
  output         io_mshr_valid,
  output [31:0]  io_mshr_bits_addr,
  output [7:0]   io_mshr_bits_dirInfo_chosenWay,
  output         io_mshr_bits_dirInfo_isDirtyWay,
  output [19:0]  io_mshr_bits_dirInfo_dirtyTag,
  output [31:0]  io_mshr_bits_data_0,
  output [31:0]  io_mshr_bits_data_1,
  output [31:0]  io_mshr_bits_data_2,
  output [31:0]  io_mshr_bits_data_3,
  output [31:0]  io_mshr_bits_storeData,
  output [3:0]   io_mshr_bits_storeMask
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
  reg [255:0] _RAND_16;
  reg [255:0] _RAND_17;
  reg [255:0] _RAND_18;
  reg [255:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[StorePipe_2.scala 31:26]
  wire  s0_latch = io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[StorePipe_2.scala 59:25]
  reg  s0_validReg; // @[StorePipe_2.scala 56:30]
  wire  _s0_valid_T_3 = io_dataBank_read_req_ready & io_dataBank_read_req_valid; // @[Decoupled.scala 51:35]
  wire  s0_valid = (s0_valid_REG | s0_validReg) & io_dir_read_req_valid & _s0_valid_T_3; // @[StorePipe_2.scala 59:77]
  reg  s1_full; // @[StorePipe_2.scala 66:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T = ~s1_dirInfo_hit; // @[StorePipe_2.scala 112:21]
  wire  _s1_valid_T_1 = io_mshr_ready & io_mshr_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_6 = s1_dirInfo_hit & io_dataBank_write_req_valid & io_dir_write_req_valid; // @[StorePipe_2.scala 113:60]
  wire  _s1_valid_T_7 = ~s1_dirInfo_hit & _s1_valid_T_1 | _s1_valid_T_6; // @[StorePipe_2.scala 112:47]
  wire  s1_valid = s1_full & _s1_valid_T_7; // @[StorePipe_2.scala 111:25]
  reg  s2_full; // @[StorePipe_2.scala 119:26]
  reg  s2_isHit; // @[Reg.scala 19:16]
  wire  s2_fire = io_store_resp_valid & s2_full & s2_isHit | ~s2_isHit; // @[StorePipe_2.scala 131:59]
  wire  s2_ready = ~s2_full | s2_fire; // @[StorePipe_2.scala 124:26]
  wire  s1_fire = s1_valid & s2_ready; // @[StorePipe_2.scala 68:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[StorePipe_2.scala 78:26]
  wire  s0_fire = s0_valid & s1_ready; // @[StorePipe_2.scala 33:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s0_reqReg_mask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_3 = s0_full & s0_fire ? 1'h0 : s0_full; // @[StorePipe_2.scala 31:26 41:{35,45}]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[StorePipe_2.scala 40:{20,30}]
  wire  _GEN_5 = s0_fire ? 1'h0 : s0_validReg; // @[StorePipe_2.scala 58:24 56:30 58:38]
  wire  _GEN_6 = s0_latch | _GEN_5; // @[StorePipe_2.scala 57:{20,34}]
  reg [31:0] s1_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_reqReg_data; // @[Reg.scala 19:16]
  reg [3:0] s1_reqReg_mask; // @[Reg.scala 19:16]
  reg [7:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  reg [19:0] s1_dirInfo_dirtyTag; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_0; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_1; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_2; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_3; // @[Reg.scala 19:16]
  wire  _GEN_18 = s1_full & s1_fire ? 1'h0 : s1_full; // @[StorePipe_2.scala 66:26 80:{35,45}]
  wire  _GEN_19 = s0_fire | _GEN_18; // @[StorePipe_2.scala 79:{20,30}]
  wire [31:0] temp_0_0 = s1_rdBlockData_0[31:0]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_1 = s1_rdBlockData_0[63:32]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_2 = s1_rdBlockData_0[95:64]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_3 = s1_rdBlockData_0[127:96]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_4 = s1_rdBlockData_0[159:128]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_5 = s1_rdBlockData_0[191:160]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_6 = s1_rdBlockData_0[223:192]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_0_7 = s1_rdBlockData_0[255:224]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_0 = s1_rdBlockData_1[31:0]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_1 = s1_rdBlockData_1[63:32]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_2 = s1_rdBlockData_1[95:64]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_3 = s1_rdBlockData_1[127:96]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_4 = s1_rdBlockData_1[159:128]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_5 = s1_rdBlockData_1[191:160]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_6 = s1_rdBlockData_1[223:192]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_1_7 = s1_rdBlockData_1[255:224]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_0 = s1_rdBlockData_2[31:0]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_1 = s1_rdBlockData_2[63:32]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_2 = s1_rdBlockData_2[95:64]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_3 = s1_rdBlockData_2[127:96]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_4 = s1_rdBlockData_2[159:128]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_5 = s1_rdBlockData_2[191:160]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_6 = s1_rdBlockData_2[223:192]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_2_7 = s1_rdBlockData_2[255:224]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_0 = s1_rdBlockData_3[31:0]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_1 = s1_rdBlockData_3[63:32]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_2 = s1_rdBlockData_3[95:64]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_3 = s1_rdBlockData_3[127:96]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_4 = s1_rdBlockData_3[159:128]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_5 = s1_rdBlockData_3[191:160]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_6 = s1_rdBlockData_3[223:192]; // @[StorePipe_2.scala 82:51]
  wire [31:0] temp_3_7 = s1_rdBlockData_3[255:224]; // @[StorePipe_2.scala 82:51]
  wire [31:0] _s1_chosenRdBlockData_T_8 = s1_dirInfo_chosenWay[0] ? temp_0_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_9 = s1_dirInfo_chosenWay[1] ? temp_0_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_10 = s1_dirInfo_chosenWay[2] ? temp_0_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_11 = s1_dirInfo_chosenWay[3] ? temp_0_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_12 = s1_dirInfo_chosenWay[4] ? temp_0_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_13 = s1_dirInfo_chosenWay[5] ? temp_0_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_14 = s1_dirInfo_chosenWay[6] ? temp_0_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_15 = s1_dirInfo_chosenWay[7] ? temp_0_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_16 = _s1_chosenRdBlockData_T_8 | _s1_chosenRdBlockData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_17 = _s1_chosenRdBlockData_T_16 | _s1_chosenRdBlockData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_18 = _s1_chosenRdBlockData_T_17 | _s1_chosenRdBlockData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_19 = _s1_chosenRdBlockData_T_18 | _s1_chosenRdBlockData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_20 = _s1_chosenRdBlockData_T_19 | _s1_chosenRdBlockData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_21 = _s1_chosenRdBlockData_T_20 | _s1_chosenRdBlockData_T_14; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_31 = s1_dirInfo_chosenWay[0] ? temp_1_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_32 = s1_dirInfo_chosenWay[1] ? temp_1_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_33 = s1_dirInfo_chosenWay[2] ? temp_1_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_34 = s1_dirInfo_chosenWay[3] ? temp_1_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_35 = s1_dirInfo_chosenWay[4] ? temp_1_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_36 = s1_dirInfo_chosenWay[5] ? temp_1_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_37 = s1_dirInfo_chosenWay[6] ? temp_1_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_38 = s1_dirInfo_chosenWay[7] ? temp_1_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_39 = _s1_chosenRdBlockData_T_31 | _s1_chosenRdBlockData_T_32; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_40 = _s1_chosenRdBlockData_T_39 | _s1_chosenRdBlockData_T_33; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_41 = _s1_chosenRdBlockData_T_40 | _s1_chosenRdBlockData_T_34; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_42 = _s1_chosenRdBlockData_T_41 | _s1_chosenRdBlockData_T_35; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_43 = _s1_chosenRdBlockData_T_42 | _s1_chosenRdBlockData_T_36; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_44 = _s1_chosenRdBlockData_T_43 | _s1_chosenRdBlockData_T_37; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_54 = s1_dirInfo_chosenWay[0] ? temp_2_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_55 = s1_dirInfo_chosenWay[1] ? temp_2_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_56 = s1_dirInfo_chosenWay[2] ? temp_2_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_57 = s1_dirInfo_chosenWay[3] ? temp_2_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_58 = s1_dirInfo_chosenWay[4] ? temp_2_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_59 = s1_dirInfo_chosenWay[5] ? temp_2_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_60 = s1_dirInfo_chosenWay[6] ? temp_2_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_61 = s1_dirInfo_chosenWay[7] ? temp_2_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_62 = _s1_chosenRdBlockData_T_54 | _s1_chosenRdBlockData_T_55; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_63 = _s1_chosenRdBlockData_T_62 | _s1_chosenRdBlockData_T_56; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_64 = _s1_chosenRdBlockData_T_63 | _s1_chosenRdBlockData_T_57; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_65 = _s1_chosenRdBlockData_T_64 | _s1_chosenRdBlockData_T_58; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_66 = _s1_chosenRdBlockData_T_65 | _s1_chosenRdBlockData_T_59; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_67 = _s1_chosenRdBlockData_T_66 | _s1_chosenRdBlockData_T_60; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_77 = s1_dirInfo_chosenWay[0] ? temp_3_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_78 = s1_dirInfo_chosenWay[1] ? temp_3_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_79 = s1_dirInfo_chosenWay[2] ? temp_3_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_80 = s1_dirInfo_chosenWay[3] ? temp_3_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_81 = s1_dirInfo_chosenWay[4] ? temp_3_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_82 = s1_dirInfo_chosenWay[5] ? temp_3_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_83 = s1_dirInfo_chosenWay[6] ? temp_3_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_84 = s1_dirInfo_chosenWay[7] ? temp_3_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_85 = _s1_chosenRdBlockData_T_77 | _s1_chosenRdBlockData_T_78; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_86 = _s1_chosenRdBlockData_T_85 | _s1_chosenRdBlockData_T_79; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_87 = _s1_chosenRdBlockData_T_86 | _s1_chosenRdBlockData_T_80; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_88 = _s1_chosenRdBlockData_T_87 | _s1_chosenRdBlockData_T_81; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_89 = _s1_chosenRdBlockData_T_88 | _s1_chosenRdBlockData_T_82; // @[Mux.scala 27:73]
  wire [31:0] _s1_chosenRdBlockData_T_90 = _s1_chosenRdBlockData_T_89 | _s1_chosenRdBlockData_T_83; // @[Mux.scala 27:73]
  wire  _GEN_21 = s2_full & s2_fire ? 1'h0 : s2_full; // @[StorePipe_2.scala 119:26 126:{35,45}]
  wire  _GEN_22 = s1_fire | _GEN_21; // @[StorePipe_2.scala 125:{20,30}]
  assign io_store_req_ready = ~s0_full; // @[StorePipe_2.scala 39:27]
  assign io_store_resp_valid = s2_isHit & s2_full; // @[StorePipe_2.scala 128:37]
  assign io_dir_read_req_valid = s0_latch | s0_full; // @[StorePipe_2.scala 44:39]
  assign io_dir_read_req_bits_addr = s0_latch ? io_store_req_bits_addr : s0_reqReg_addr; // @[StorePipe_2.scala 35:23]
  assign io_dir_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe_2.scala 94:40]
  assign io_dir_write_req_bits_addr = s1_reqReg_addr; // @[StorePipe_2.scala 96:32]
  assign io_dir_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 101:31]
  assign io_dataBank_read_req_valid = s0_latch | s0_full; // @[StorePipe_2.scala 47:44]
  assign io_dataBank_read_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_read_req_bits_blockSelOH = 4'h1 << _GEN_0[3:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_valid = s1_dirInfo_hit & s1_full; // @[StorePipe_2.scala 103:45]
  assign io_dataBank_write_req_bits_data = s1_reqReg_data; // @[StorePipe_2.scala 109:37]
  assign io_dataBank_write_req_bits_set = s1_reqReg_addr[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_write_req_bits_blockSelOH = 4'h1 << s1_reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  assign io_dataBank_write_req_bits_way = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 108:36]
  assign io_dataBank_write_req_bits_mask = s1_reqReg_mask; // @[StorePipe_2.scala 107:37]
  assign io_mshr_valid = _s1_valid_T & s1_full; // @[StorePipe_2.scala 85:32]
  assign io_mshr_bits_addr = s1_reqReg_addr; // @[StorePipe_2.scala 87:23]
  assign io_mshr_bits_dirInfo_chosenWay = s1_dirInfo_chosenWay; // @[StorePipe_2.scala 88:26]
  assign io_mshr_bits_dirInfo_isDirtyWay = s1_dirInfo_isDirtyWay; // @[StorePipe_2.scala 88:26]
  assign io_mshr_bits_dirInfo_dirtyTag = s1_dirInfo_dirtyTag; // @[StorePipe_2.scala 88:26]
  assign io_mshr_bits_data_0 = _s1_chosenRdBlockData_T_21 | _s1_chosenRdBlockData_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_1 = _s1_chosenRdBlockData_T_44 | _s1_chosenRdBlockData_T_38; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_2 = _s1_chosenRdBlockData_T_67 | _s1_chosenRdBlockData_T_61; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_3 = _s1_chosenRdBlockData_T_90 | _s1_chosenRdBlockData_T_84; // @[Mux.scala 27:73]
  assign io_mshr_bits_storeData = s1_reqReg_data; // @[StorePipe_2.scala 91:28]
  assign io_mshr_bits_storeMask = s1_reqReg_mask; // @[StorePipe_2.scala 92:28]
  always @(posedge clock) begin
    if (reset) begin // @[StorePipe_2.scala 31:26]
      s0_full <= 1'h0; // @[StorePipe_2.scala 31:26]
    end else begin
      s0_full <= _GEN_4;
    end
    s0_valid_REG <= io_store_req_ready & io_store_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[StorePipe_2.scala 56:30]
      s0_validReg <= 1'h0; // @[StorePipe_2.scala 56:30]
    end else begin
      s0_validReg <= _GEN_6;
    end
    if (reset) begin // @[StorePipe_2.scala 66:26]
      s1_full <= 1'h0; // @[StorePipe_2.scala 66:26]
    end else begin
      s1_full <= _GEN_19;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_hit <= io_dir_read_resp_bits_hit; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[StorePipe_2.scala 119:26]
      s2_full <= 1'h0; // @[StorePipe_2.scala 119:26]
    end else begin
      s2_full <= _GEN_22;
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
      s1_rdBlockData_0 <= io_dataBank_read_resp_bits_blockData_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_1 <= io_dataBank_read_resp_bits_blockData_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_2 <= io_dataBank_read_resp_bits_blockData_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_3 <= io_dataBank_read_resp_bits_blockData_3; // @[Reg.scala 20:22]
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
  _RAND_16 = {8{`RANDOM}};
  s1_rdBlockData_0 = _RAND_16[255:0];
  _RAND_17 = {8{`RANDOM}};
  s1_rdBlockData_1 = _RAND_17[255:0];
  _RAND_18 = {8{`RANDOM}};
  s1_rdBlockData_2 = _RAND_18[255:0];
  _RAND_19 = {8{`RANDOM}};
  s1_rdBlockData_3 = _RAND_19[255:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
