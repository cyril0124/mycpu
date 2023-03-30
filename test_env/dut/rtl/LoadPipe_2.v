module LoadPipe_2(
  input          clock,
  input          reset,
  output         io_load_req_ready,
  input          io_load_req_valid,
  input  [31:0]  io_load_req_bits_addr,
  output         io_load_resp_valid,
  output [31:0]  io_load_resp_bits_data,
  input          io_dir_req_ready,
  output         io_dir_req_valid,
  output [31:0]  io_dir_req_bits_addr,
  input          io_dir_resp_bits_hit,
  input  [7:0]   io_dir_resp_bits_chosenWay,
  input          io_dir_resp_bits_isDirtyWay,
  input  [19:0]  io_dir_resp_bits_dirtyTag,
  input          io_dataBank_req_ready,
  output         io_dataBank_req_valid,
  output [7:0]   io_dataBank_req_bits_set,
  output [3:0]   io_dataBank_req_bits_blockSelOH,
  input  [31:0]  io_dataBank_resp_bits_data_0,
  input  [31:0]  io_dataBank_resp_bits_data_1,
  input  [31:0]  io_dataBank_resp_bits_data_2,
  input  [31:0]  io_dataBank_resp_bits_data_3,
  input  [31:0]  io_dataBank_resp_bits_data_4,
  input  [31:0]  io_dataBank_resp_bits_data_5,
  input  [31:0]  io_dataBank_resp_bits_data_6,
  input  [31:0]  io_dataBank_resp_bits_data_7,
  input  [255:0] io_dataBank_resp_bits_blockData_0,
  input  [255:0] io_dataBank_resp_bits_blockData_1,
  input  [255:0] io_dataBank_resp_bits_blockData_2,
  input  [255:0] io_dataBank_resp_bits_blockData_3,
  input          io_mshr_ready,
  output         io_mshr_valid,
  output [31:0]  io_mshr_bits_addr,
  output [7:0]   io_mshr_bits_dirInfo_chosenWay,
  output         io_mshr_bits_dirInfo_isDirtyWay,
  output [19:0]  io_mshr_bits_dirInfo_dirtyTag,
  output [31:0]  io_mshr_bits_data_0,
  output [31:0]  io_mshr_bits_data_1,
  output [31:0]  io_mshr_bits_data_2,
  output [31:0]  io_mshr_bits_data_3
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
  reg [255:0] _RAND_10;
  reg [255:0] _RAND_11;
  reg [255:0] _RAND_12;
  reg [255:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[LoadPipe_2.scala 32:26]
  wire  s0_latch = io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_REG; // @[LoadPipe_2.scala 60:25]
  reg  s0_validReg; // @[LoadPipe_2.scala 57:30]
  wire  _s0_valid_T_1 = io_dir_req_ready & io_dir_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T_3 = io_dataBank_req_ready & io_dataBank_req_valid; // @[Decoupled.scala 51:35]
  wire  s0_valid = (s0_valid_REG | s0_validReg) & _s0_valid_T_1 & _s0_valid_T_3; // @[LoadPipe_2.scala 60:71]
  reg  s1_full; // @[LoadPipe_2.scala 66:26]
  reg  s1_dirInfo_hit; // @[Reg.scala 19:16]
  wire  _s1_valid_T = ~s1_dirInfo_hit; // @[LoadPipe_2.scala 96:21]
  wire  _s1_valid_T_1 = io_mshr_ready & io_mshr_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_4 = s1_dirInfo_hit & io_load_resp_valid; // @[LoadPipe_2.scala 97:30]
  wire  _s1_valid_T_5 = ~s1_dirInfo_hit & _s1_valid_T_1 | _s1_valid_T_4; // @[LoadPipe_2.scala 96:47]
  wire  s1_fire = s1_full & _s1_valid_T_5; // @[LoadPipe_2.scala 95:25]
  wire  s1_ready = ~s1_full | s1_fire; // @[LoadPipe_2.scala 77:26]
  wire  s0_fire = s0_valid & s1_ready; // @[LoadPipe_2.scala 34:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_1 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LoadPipe_2.scala 32:26 41:{35,45}]
  wire  _GEN_2 = s0_latch | _GEN_1; // @[LoadPipe_2.scala 40:{20,30}]
  wire  _GEN_3 = s0_fire ? 1'h0 : s0_validReg; // @[LoadPipe_2.scala 59:24 57:30 59:38]
  wire  _GEN_4 = s0_latch | _GEN_3; // @[LoadPipe_2.scala 58:{20,34}]
  reg [31:0] s1_rAddr; // @[Reg.scala 19:16]
  reg [7:0] s1_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg  s1_dirInfo_isDirtyWay; // @[Reg.scala 19:16]
  reg [19:0] s1_dirInfo_dirtyTag; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_0; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_1; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_2; // @[Reg.scala 19:16]
  reg [255:0] s1_rdBlockData_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_0; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_1; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_2; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_3; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_4; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_5; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_6; // @[Reg.scala 19:16]
  reg [31:0] s1_rdDataAll_7; // @[Reg.scala 19:16]
  wire [31:0] _s1_rdData_T_8 = s1_dirInfo_chosenWay[0] ? s1_rdDataAll_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_9 = s1_dirInfo_chosenWay[1] ? s1_rdDataAll_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_10 = s1_dirInfo_chosenWay[2] ? s1_rdDataAll_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_11 = s1_dirInfo_chosenWay[3] ? s1_rdDataAll_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_12 = s1_dirInfo_chosenWay[4] ? s1_rdDataAll_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_13 = s1_dirInfo_chosenWay[5] ? s1_rdDataAll_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_14 = s1_dirInfo_chosenWay[6] ? s1_rdDataAll_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_15 = s1_dirInfo_chosenWay[7] ? s1_rdDataAll_7 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_16 = _s1_rdData_T_8 | _s1_rdData_T_9; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_17 = _s1_rdData_T_16 | _s1_rdData_T_10; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_18 = _s1_rdData_T_17 | _s1_rdData_T_11; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_19 = _s1_rdData_T_18 | _s1_rdData_T_12; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_20 = _s1_rdData_T_19 | _s1_rdData_T_13; // @[Mux.scala 27:73]
  wire [31:0] _s1_rdData_T_21 = _s1_rdData_T_20 | _s1_rdData_T_14; // @[Mux.scala 27:73]
  wire  _GEN_22 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LoadPipe_2.scala 66:26 79:{35,45}]
  wire  _GEN_23 = s0_fire | _GEN_22; // @[LoadPipe_2.scala 78:{20,30}]
  wire [31:0] temp_0_0 = s1_rdBlockData_0[31:0]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_1 = s1_rdBlockData_0[63:32]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_2 = s1_rdBlockData_0[95:64]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_3 = s1_rdBlockData_0[127:96]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_4 = s1_rdBlockData_0[159:128]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_5 = s1_rdBlockData_0[191:160]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_6 = s1_rdBlockData_0[223:192]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_0_7 = s1_rdBlockData_0[255:224]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_0 = s1_rdBlockData_1[31:0]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_1 = s1_rdBlockData_1[63:32]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_2 = s1_rdBlockData_1[95:64]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_3 = s1_rdBlockData_1[127:96]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_4 = s1_rdBlockData_1[159:128]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_5 = s1_rdBlockData_1[191:160]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_6 = s1_rdBlockData_1[223:192]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_1_7 = s1_rdBlockData_1[255:224]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_0 = s1_rdBlockData_2[31:0]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_1 = s1_rdBlockData_2[63:32]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_2 = s1_rdBlockData_2[95:64]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_3 = s1_rdBlockData_2[127:96]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_4 = s1_rdBlockData_2[159:128]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_5 = s1_rdBlockData_2[191:160]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_6 = s1_rdBlockData_2[223:192]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_2_7 = s1_rdBlockData_2[255:224]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_0 = s1_rdBlockData_3[31:0]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_1 = s1_rdBlockData_3[63:32]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_2 = s1_rdBlockData_3[95:64]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_3 = s1_rdBlockData_3[127:96]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_4 = s1_rdBlockData_3[159:128]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_5 = s1_rdBlockData_3[191:160]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_6 = s1_rdBlockData_3[223:192]; // @[LoadPipe_2.scala 81:51]
  wire [31:0] temp_3_7 = s1_rdBlockData_3[255:224]; // @[LoadPipe_2.scala 81:51]
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
  assign io_load_req_ready = ~s0_full; // @[LoadPipe_2.scala 38:26]
  assign io_load_resp_valid = s1_dirInfo_hit & s1_full; // @[LoadPipe_2.scala 91:36]
  assign io_load_resp_bits_data = _s1_rdData_T_21 | _s1_rdData_T_15; // @[Mux.scala 27:73]
  assign io_dir_req_valid = s0_latch | s0_full; // @[LoadPipe_2.scala 44:34]
  assign io_dir_req_bits_addr = s0_latch ? io_load_req_bits_addr : s0_reqReg_addr; // @[LoadPipe_2.scala 36:23]
  assign io_dataBank_req_valid = s0_latch | s0_full; // @[LoadPipe_2.scala 47:39]
  assign io_dataBank_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataBank_req_bits_blockSelOH = 4'h1 << _GEN_0[3:2]; // @[OneHot.scala 57:35]
  assign io_mshr_valid = _s1_valid_T & s1_full; // @[LoadPipe_2.scala 84:32]
  assign io_mshr_bits_addr = s1_rAddr; // @[LoadPipe_2.scala 86:23]
  assign io_mshr_bits_dirInfo_chosenWay = s1_dirInfo_chosenWay; // @[LoadPipe_2.scala 88:26]
  assign io_mshr_bits_dirInfo_isDirtyWay = s1_dirInfo_isDirtyWay; // @[LoadPipe_2.scala 88:26]
  assign io_mshr_bits_dirInfo_dirtyTag = s1_dirInfo_dirtyTag; // @[LoadPipe_2.scala 88:26]
  assign io_mshr_bits_data_0 = _s1_chosenRdBlockData_T_21 | _s1_chosenRdBlockData_T_15; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_1 = _s1_chosenRdBlockData_T_44 | _s1_chosenRdBlockData_T_38; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_2 = _s1_chosenRdBlockData_T_67 | _s1_chosenRdBlockData_T_61; // @[Mux.scala 27:73]
  assign io_mshr_bits_data_3 = _s1_chosenRdBlockData_T_90 | _s1_chosenRdBlockData_T_84; // @[Mux.scala 27:73]
  always @(posedge clock) begin
    if (reset) begin // @[LoadPipe_2.scala 32:26]
      s0_full <= 1'h0; // @[LoadPipe_2.scala 32:26]
    end else begin
      s0_full <= _GEN_2;
    end
    s0_valid_REG <= io_load_req_ready & io_load_req_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[LoadPipe_2.scala 57:30]
      s0_validReg <= 1'h0; // @[LoadPipe_2.scala 57:30]
    end else begin
      s0_validReg <= _GEN_4;
    end
    if (reset) begin // @[LoadPipe_2.scala 66:26]
      s1_full <= 1'h0; // @[LoadPipe_2.scala 66:26]
    end else begin
      s1_full <= _GEN_23;
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
      s1_dirInfo_chosenWay <= io_dir_resp_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_isDirtyWay <= io_dir_resp_bits_isDirtyWay; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_dirInfo_dirtyTag <= io_dir_resp_bits_dirtyTag; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_0 <= io_dataBank_resp_bits_blockData_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_1 <= io_dataBank_resp_bits_blockData_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_2 <= io_dataBank_resp_bits_blockData_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdBlockData_3 <= io_dataBank_resp_bits_blockData_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_0 <= io_dataBank_resp_bits_data_0; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_1 <= io_dataBank_resp_bits_data_1; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_2 <= io_dataBank_resp_bits_data_2; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_3 <= io_dataBank_resp_bits_data_3; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_4 <= io_dataBank_resp_bits_data_4; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_5 <= io_dataBank_resp_bits_data_5; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_6 <= io_dataBank_resp_bits_data_6; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rdDataAll_7 <= io_dataBank_resp_bits_data_7; // @[Reg.scala 20:22]
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
  s1_dirInfo_chosenWay = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  s1_dirInfo_isDirtyWay = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_dirInfo_dirtyTag = _RAND_9[19:0];
  _RAND_10 = {8{`RANDOM}};
  s1_rdBlockData_0 = _RAND_10[255:0];
  _RAND_11 = {8{`RANDOM}};
  s1_rdBlockData_1 = _RAND_11[255:0];
  _RAND_12 = {8{`RANDOM}};
  s1_rdBlockData_2 = _RAND_12[255:0];
  _RAND_13 = {8{`RANDOM}};
  s1_rdBlockData_3 = _RAND_13[255:0];
  _RAND_14 = {1{`RANDOM}};
  s1_rdDataAll_0 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_rdDataAll_1 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_rdDataAll_2 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  s1_rdDataAll_3 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  s1_rdDataAll_4 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  s1_rdDataAll_5 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  s1_rdDataAll_6 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  s1_rdDataAll_7 = _RAND_21[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule