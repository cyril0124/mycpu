module Scoreboard(
  input        clock,
  input        reset,
  output       io_issue_ready,
  input        io_issue_valid,
  input  [1:0] io_issue_bits_fuId,
  input  [7:0] io_issue_bits_op,
  input  [4:0] io_issue_bits_rd,
  input  [4:0] io_issue_bits_rs1,
  input  [4:0] io_issue_bits_rs2,
  output       io_readOpr_0_ready,
  input        io_readOpr_0_valid,
  output       io_readOpr_1_ready,
  input        io_readOpr_1_valid,
  output       io_readOpr_2_ready,
  input        io_readOpr_2_valid,
  output       io_readOpr_3_ready,
  input        io_readOpr_3_valid,
  input        io_execute_0,
  input        io_execute_1,
  input        io_execute_2,
  input        io_execute_3,
  output       io_writeback_0_ready,
  input        io_writeback_0_valid,
  output       io_writeback_1_ready,
  input        io_writeback_1_valid,
  output       io_writeback_2_ready,
  input        io_writeback_2_valid,
  output       io_writeback_3_ready,
  input        io_writeback_3_valid,
  input        io_flush
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
`endif // RANDOMIZE_REG_INIT
  reg  fuStatus_0_busy; // @[Scoreboard.scala 67:42]
  reg [7:0] fuStatus_0_op; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_0_rd; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_0_rs1; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_0_rs2; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_0_gen_rs1; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_0_gen_rs2; // @[Scoreboard.scala 67:42]
  reg  fuStatus_0_rs1_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_0_rs2_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_1_busy; // @[Scoreboard.scala 67:42]
  reg [7:0] fuStatus_1_op; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_1_rd; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_1_rs1; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_1_rs2; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_1_gen_rs1; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_1_gen_rs2; // @[Scoreboard.scala 67:42]
  reg  fuStatus_1_rs1_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_1_rs2_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_2_busy; // @[Scoreboard.scala 67:42]
  reg [7:0] fuStatus_2_op; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_2_rd; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_2_rs1; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_2_rs2; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_2_gen_rs1; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_2_gen_rs2; // @[Scoreboard.scala 67:42]
  reg  fuStatus_2_rs1_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_2_rs2_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_3_busy; // @[Scoreboard.scala 67:42]
  reg [7:0] fuStatus_3_op; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_3_rd; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_3_rs1; // @[Scoreboard.scala 67:42]
  reg [4:0] fuStatus_3_rs2; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_3_gen_rs1; // @[Scoreboard.scala 67:42]
  reg [1:0] fuStatus_3_gen_rs2; // @[Scoreboard.scala 67:42]
  reg  fuStatus_3_rs1_ready; // @[Scoreboard.scala 67:42]
  reg  fuStatus_3_rs2_ready; // @[Scoreboard.scala 67:42]
  wire  _wawRd_T_2 = fuStatus_0_rd != 5'h0; // @[Scoreboard.scala 73:83]
  wire  _wawRd_T_3 = fuStatus_0_rd == io_issue_bits_rd & fuStatus_0_busy & fuStatus_0_rd != 5'h0; // @[Scoreboard.scala 73:75]
  wire  _wawRd_T_6 = fuStatus_1_rd != 5'h0; // @[Scoreboard.scala 73:83]
  wire  _wawRd_T_7 = fuStatus_1_rd == io_issue_bits_rd & fuStatus_1_busy & fuStatus_1_rd != 5'h0; // @[Scoreboard.scala 73:75]
  wire  _wawRd_T_10 = fuStatus_2_rd != 5'h0; // @[Scoreboard.scala 73:83]
  wire  _wawRd_T_11 = fuStatus_2_rd == io_issue_bits_rd & fuStatus_2_busy & fuStatus_2_rd != 5'h0; // @[Scoreboard.scala 73:75]
  wire  _wawRd_T_14 = fuStatus_3_rd != 5'h0; // @[Scoreboard.scala 73:83]
  wire  _wawRd_T_15 = fuStatus_3_rd == io_issue_bits_rd & fuStatus_3_busy & fuStatus_3_rd != 5'h0; // @[Scoreboard.scala 73:75]
  wire [3:0] _wawRd_T_16 = {_wawRd_T_3,_wawRd_T_7,_wawRd_T_11,_wawRd_T_15}; // @[Cat.scala 33:92]
  wire  wawRd = |_wawRd_T_16; // @[Scoreboard.scala 73:94]
  wire  _io_issue_ready_T_1 = io_issue_bits_fuId == 2'h0; // @[Scoreboard.scala 74:62]
  wire  _GEN_1 = 2'h1 == io_issue_bits_fuId ? fuStatus_1_busy : fuStatus_0_busy; // @[Scoreboard.scala 74:{92,92}]
  wire  _GEN_2 = 2'h2 == io_issue_bits_fuId ? fuStatus_2_busy : _GEN_1; // @[Scoreboard.scala 74:{92,92}]
  wire  _GEN_3 = 2'h3 == io_issue_bits_fuId ? fuStatus_3_busy : _GEN_2; // @[Scoreboard.scala 74:{92,92}]
  wire  _rawRs1_0_T_3 = fuStatus_1_rd == fuStatus_0_rs1 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_0_T_7 = fuStatus_2_rd == fuStatus_0_rs1 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_0_T_11 = fuStatus_3_rd == fuStatus_0_rs1 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 87:122]
  wire [2:0] _rawRs1_0_T_12 = {_rawRs1_0_T_3,_rawRs1_0_T_7,_rawRs1_0_T_11}; // @[Cat.scala 33:92]
  wire  rawRs1__0 = |_rawRs1_0_T_12; // @[Scoreboard.scala 87:141]
  wire  _rawRs2_0_T_3 = fuStatus_1_rd == fuStatus_0_rs2 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_0_T_7 = fuStatus_2_rd == fuStatus_0_rs2 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_0_T_11 = fuStatus_3_rd == fuStatus_0_rs2 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 88:122]
  wire [2:0] _rawRs2_0_T_12 = {_rawRs2_0_T_3,_rawRs2_0_T_7,_rawRs2_0_T_11}; // @[Cat.scala 33:92]
  wire  rawRs2__0 = |_rawRs2_0_T_12; // @[Scoreboard.scala 88:141]
  wire  _T_1 = io_issue_ready & io_issue_valid; // @[Decoupled.scala 51:35]
  wire  _T_2 = _io_issue_ready_T_1 & _T_1; // @[Scoreboard.scala 92:44]
  wire  _matchRs1OH_T_3 = fuStatus_0_rd == io_issue_bits_rs1 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 99:89]
  wire  _matchRs1OH_T_7 = fuStatus_1_rd == io_issue_bits_rs1 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 99:89]
  wire  _matchRs1OH_T_11 = fuStatus_2_rd == io_issue_bits_rs1 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 99:89]
  wire  _matchRs1OH_T_15 = fuStatus_3_rd == io_issue_bits_rs1 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 99:89]
  wire [3:0] matchRs1OH = {_matchRs1OH_T_15,_matchRs1OH_T_11,_matchRs1OH_T_7,_matchRs1OH_T_3}; // @[Cat.scala 33:92]
  wire  _matchRs2OH_T_3 = fuStatus_0_rd == io_issue_bits_rs2 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 100:89]
  wire  _matchRs2OH_T_7 = fuStatus_1_rd == io_issue_bits_rs2 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 100:89]
  wire  _matchRs2OH_T_11 = fuStatus_2_rd == io_issue_bits_rs2 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 100:89]
  wire  _matchRs2OH_T_15 = fuStatus_3_rd == io_issue_bits_rs2 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 100:89]
  wire [3:0] matchRs2OH = {_matchRs2OH_T_15,_matchRs2OH_T_11,_matchRs2OH_T_7,_matchRs2OH_T_3}; // @[Cat.scala 33:92]
  wire [1:0] _T_7 = matchRs1OH[0] + matchRs1OH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_9 = matchRs1OH[2] + matchRs1OH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_11 = _T_7 + _T_9; // @[Bitwise.scala 51:90]
  wire  _T_15 = ~reset; // @[Scoreboard.scala 101:19]
  wire [1:0] _T_21 = matchRs2OH[0] + matchRs2OH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_23 = matchRs2OH[2] + matchRs2OH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_25 = _T_21 + _T_23; // @[Bitwise.scala 51:90]
  wire [1:0] _fuStatus_0_gen_rs1_T_5 = matchRs1OH[1] ? 2'h1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs1_T_6 = matchRs1OH[2] ? 2'h2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs1_T_7 = matchRs1OH[3] ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs1_T_9 = _fuStatus_0_gen_rs1_T_5 | _fuStatus_0_gen_rs1_T_6; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs1_T_10 = _fuStatus_0_gen_rs1_T_9 | _fuStatus_0_gen_rs1_T_7; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs2_T_5 = matchRs2OH[1] ? 2'h1 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs2_T_6 = matchRs2OH[2] ? 2'h2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs2_T_7 = matchRs2OH[3] ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs2_T_9 = _fuStatus_0_gen_rs2_T_5 | _fuStatus_0_gen_rs2_T_6; // @[Mux.scala 27:73]
  wire [1:0] _fuStatus_0_gen_rs2_T_10 = _fuStatus_0_gen_rs2_T_9 | _fuStatus_0_gen_rs2_T_7; // @[Mux.scala 27:73]
  wire [2:0] _rawRs1_1_0_T_12 = {_matchRs1OH_T_7,_matchRs1OH_T_11,_matchRs1OH_T_15}; // @[Cat.scala 33:92]
  wire [2:0] _rawRs2_1_0_T_12 = {_matchRs2OH_T_7,_matchRs2OH_T_11,_matchRs2OH_T_15}; // @[Cat.scala 33:92]
  wire  rawRs1_1_0 = _io_issue_ready_T_1 & _T_1 & |_rawRs1_1_0_T_12; // @[Scoreboard.scala 106:25 82:23 92:62]
  wire  rawRs2_1_0 = _io_issue_ready_T_1 & _T_1 & |_rawRs2_1_0_T_12; // @[Scoreboard.scala 107:25 83:23 92:62]
  wire  _GEN_4 = _io_issue_ready_T_1 & _T_1 | fuStatus_0_busy; // @[Scoreboard.scala 92:62 93:30 67:42]
  wire  _rawRs1_1_T_3 = fuStatus_0_rd == fuStatus_1_rs1 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_1_T_7 = fuStatus_2_rd == fuStatus_1_rs1 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_1_T_11 = fuStatus_3_rd == fuStatus_1_rs1 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 87:122]
  wire [2:0] _rawRs1_1_T_12 = {_rawRs1_1_T_3,_rawRs1_1_T_7,_rawRs1_1_T_11}; // @[Cat.scala 33:92]
  wire  rawRs1__1 = |_rawRs1_1_T_12; // @[Scoreboard.scala 87:141]
  wire  _rawRs2_1_T_3 = fuStatus_0_rd == fuStatus_1_rs2 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_1_T_7 = fuStatus_2_rd == fuStatus_1_rs2 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_1_T_11 = fuStatus_3_rd == fuStatus_1_rs2 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 88:122]
  wire [2:0] _rawRs2_1_T_12 = {_rawRs2_1_T_3,_rawRs2_1_T_7,_rawRs2_1_T_11}; // @[Cat.scala 33:92]
  wire  rawRs2__1 = |_rawRs2_1_T_12; // @[Scoreboard.scala 88:141]
  wire  _T_161 = io_issue_bits_fuId == 2'h1 & _T_1; // @[Scoreboard.scala 92:44]
  wire [2:0] _rawRs1_1_1_T_12 = {_matchRs1OH_T_3,_matchRs1OH_T_11,_matchRs1OH_T_15}; // @[Cat.scala 33:92]
  wire [2:0] _rawRs2_1_1_T_12 = {_matchRs2OH_T_3,_matchRs2OH_T_11,_matchRs2OH_T_15}; // @[Cat.scala 33:92]
  wire  rawRs1_1_1 = io_issue_bits_fuId == 2'h1 & _T_1 & |_rawRs1_1_1_T_12; // @[Scoreboard.scala 106:25 82:23 92:62]
  wire  rawRs2_1_1 = io_issue_bits_fuId == 2'h1 & _T_1 & |_rawRs2_1_1_T_12; // @[Scoreboard.scala 107:25 83:23 92:62]
  wire  _GEN_47 = io_issue_bits_fuId == 2'h1 & _T_1 | fuStatus_1_busy; // @[Scoreboard.scala 92:62 93:30 67:42]
  wire  _rawRs1_2_T_3 = fuStatus_0_rd == fuStatus_2_rs1 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_2_T_7 = fuStatus_1_rd == fuStatus_2_rs1 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_2_T_11 = fuStatus_3_rd == fuStatus_2_rs1 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 87:122]
  wire [2:0] _rawRs1_2_T_12 = {_rawRs1_2_T_3,_rawRs1_2_T_7,_rawRs1_2_T_11}; // @[Cat.scala 33:92]
  wire  rawRs1__2 = |_rawRs1_2_T_12; // @[Scoreboard.scala 87:141]
  wire  _rawRs2_2_T_3 = fuStatus_0_rd == fuStatus_2_rs2 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_2_T_7 = fuStatus_1_rd == fuStatus_2_rs2 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_2_T_11 = fuStatus_3_rd == fuStatus_2_rs2 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 88:122]
  wire [2:0] _rawRs2_2_T_12 = {_rawRs2_2_T_3,_rawRs2_2_T_7,_rawRs2_2_T_11}; // @[Cat.scala 33:92]
  wire  rawRs2__2 = |_rawRs2_2_T_12; // @[Scoreboard.scala 88:141]
  wire  _T_320 = io_issue_bits_fuId == 2'h2 & _T_1; // @[Scoreboard.scala 92:44]
  wire [2:0] _rawRs1_1_2_T_12 = {_matchRs1OH_T_3,_matchRs1OH_T_7,_matchRs1OH_T_15}; // @[Cat.scala 33:92]
  wire [2:0] _rawRs2_1_2_T_12 = {_matchRs2OH_T_3,_matchRs2OH_T_7,_matchRs2OH_T_15}; // @[Cat.scala 33:92]
  wire  rawRs1_1_2 = io_issue_bits_fuId == 2'h2 & _T_1 & |_rawRs1_1_2_T_12; // @[Scoreboard.scala 106:25 82:23 92:62]
  wire  rawRs2_1_2 = io_issue_bits_fuId == 2'h2 & _T_1 & |_rawRs2_1_2_T_12; // @[Scoreboard.scala 107:25 83:23 92:62]
  wire  _GEN_90 = io_issue_bits_fuId == 2'h2 & _T_1 | fuStatus_2_busy; // @[Scoreboard.scala 92:62 93:30 67:42]
  wire  _rawRs1_3_T_3 = fuStatus_0_rd == fuStatus_3_rs1 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_3_T_7 = fuStatus_1_rd == fuStatus_3_rs1 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 87:122]
  wire  _rawRs1_3_T_11 = fuStatus_2_rd == fuStatus_3_rs1 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 87:122]
  wire [2:0] _rawRs1_3_T_12 = {_rawRs1_3_T_3,_rawRs1_3_T_7,_rawRs1_3_T_11}; // @[Cat.scala 33:92]
  wire  rawRs1__3 = |_rawRs1_3_T_12; // @[Scoreboard.scala 87:141]
  wire  _rawRs2_3_T_3 = fuStatus_0_rd == fuStatus_3_rs2 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_3_T_7 = fuStatus_1_rd == fuStatus_3_rs2 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 88:122]
  wire  _rawRs2_3_T_11 = fuStatus_2_rd == fuStatus_3_rs2 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 88:122]
  wire [2:0] _rawRs2_3_T_12 = {_rawRs2_3_T_3,_rawRs2_3_T_7,_rawRs2_3_T_11}; // @[Cat.scala 33:92]
  wire  rawRs2__3 = |_rawRs2_3_T_12; // @[Scoreboard.scala 88:141]
  wire  _T_479 = io_issue_bits_fuId == 2'h3 & _T_1; // @[Scoreboard.scala 92:44]
  wire [2:0] _rawRs1_1_3_T_12 = {_matchRs1OH_T_3,_matchRs1OH_T_7,_matchRs1OH_T_11}; // @[Cat.scala 33:92]
  wire [2:0] _rawRs2_1_3_T_12 = {_matchRs2OH_T_3,_matchRs2OH_T_7,_matchRs2OH_T_11}; // @[Cat.scala 33:92]
  wire  rawRs1_1_3 = io_issue_bits_fuId == 2'h3 & _T_1 & |_rawRs1_1_3_T_12; // @[Scoreboard.scala 106:25 82:23 92:62]
  wire  rawRs2_1_3 = io_issue_bits_fuId == 2'h3 & _T_1 & |_rawRs2_1_3_T_12; // @[Scoreboard.scala 107:25 83:23 92:62]
  wire  _GEN_133 = io_issue_bits_fuId == 2'h3 & _T_1 | fuStatus_3_busy; // @[Scoreboard.scala 92:62 93:30 67:42]
  wire  _warRd_0_T_7 = (fuStatus_1_rs1 == fuStatus_0_rd & fuStatus_1_rs1_ready | fuStatus_1_rs2 == fuStatus_0_rd &
    fuStatus_1_rs2_ready) & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 140:112]
  wire  _warRd_0_T_15 = (fuStatus_2_rs1 == fuStatus_0_rd & fuStatus_2_rs1_ready | fuStatus_2_rs2 == fuStatus_0_rd &
    fuStatus_2_rs2_ready) & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 140:112]
  wire  _warRd_0_T_23 = (fuStatus_3_rs1 == fuStatus_0_rd & fuStatus_3_rs1_ready | fuStatus_3_rs2 == fuStatus_0_rd &
    fuStatus_3_rs2_ready) & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 140:112]
  wire [2:0] _warRd_0_T_24 = {_warRd_0_T_7,_warRd_0_T_15,_warRd_0_T_23}; // @[Cat.scala 33:92]
  wire  warRd_0 = |_warRd_0_T_24 & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 141:36]
  wire  _T_636 = io_writeback_0_ready & io_writeback_0_valid; // @[Decoupled.scala 51:35]
  wire  _warRd_1_T_7 = (fuStatus_0_rs1 == fuStatus_1_rd & fuStatus_0_rs1_ready | fuStatus_0_rs2 == fuStatus_1_rd &
    fuStatus_0_rs2_ready) & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 140:112]
  wire  _warRd_1_T_15 = (fuStatus_2_rs1 == fuStatus_1_rd & fuStatus_2_rs1_ready | fuStatus_2_rs2 == fuStatus_1_rd &
    fuStatus_2_rs2_ready) & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 140:112]
  wire  _warRd_1_T_23 = (fuStatus_3_rs1 == fuStatus_1_rd & fuStatus_3_rs1_ready | fuStatus_3_rs2 == fuStatus_1_rd &
    fuStatus_3_rs2_ready) & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 140:112]
  wire [2:0] _warRd_1_T_24 = {_warRd_1_T_7,_warRd_1_T_15,_warRd_1_T_23}; // @[Cat.scala 33:92]
  wire  warRd_1 = |_warRd_1_T_24 & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 141:36]
  wire  _T_642 = io_writeback_1_ready & io_writeback_1_valid; // @[Decoupled.scala 51:35]
  wire  _warRd_2_T_7 = (fuStatus_0_rs1 == fuStatus_2_rd & fuStatus_0_rs1_ready | fuStatus_0_rs2 == fuStatus_2_rd &
    fuStatus_0_rs2_ready) & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 140:112]
  wire  _warRd_2_T_15 = (fuStatus_1_rs1 == fuStatus_2_rd & fuStatus_1_rs1_ready | fuStatus_1_rs2 == fuStatus_2_rd &
    fuStatus_1_rs2_ready) & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 140:112]
  wire  _warRd_2_T_23 = (fuStatus_3_rs1 == fuStatus_2_rd & fuStatus_3_rs1_ready | fuStatus_3_rs2 == fuStatus_2_rd &
    fuStatus_3_rs2_ready) & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 140:112]
  wire [2:0] _warRd_2_T_24 = {_warRd_2_T_7,_warRd_2_T_15,_warRd_2_T_23}; // @[Cat.scala 33:92]
  wire  warRd_2 = |_warRd_2_T_24 & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 141:36]
  wire  _T_648 = io_writeback_2_ready & io_writeback_2_valid; // @[Decoupled.scala 51:35]
  wire  _warRd_3_T_7 = (fuStatus_0_rs1 == fuStatus_3_rd & fuStatus_0_rs1_ready | fuStatus_0_rs2 == fuStatus_3_rd &
    fuStatus_0_rs2_ready) & fuStatus_0_busy & _wawRd_T_2; // @[Scoreboard.scala 140:112]
  wire  _warRd_3_T_15 = (fuStatus_1_rs1 == fuStatus_3_rd & fuStatus_1_rs1_ready | fuStatus_1_rs2 == fuStatus_3_rd &
    fuStatus_1_rs2_ready) & fuStatus_1_busy & _wawRd_T_6; // @[Scoreboard.scala 140:112]
  wire  _warRd_3_T_23 = (fuStatus_2_rs1 == fuStatus_3_rd & fuStatus_2_rs1_ready | fuStatus_2_rs2 == fuStatus_3_rd &
    fuStatus_2_rs2_ready) & fuStatus_2_busy & _wawRd_T_10; // @[Scoreboard.scala 140:112]
  wire [2:0] _warRd_3_T_24 = {_warRd_3_T_7,_warRd_3_T_15,_warRd_3_T_23}; // @[Cat.scala 33:92]
  wire  warRd_3 = |_warRd_3_T_24 & fuStatus_3_busy & _wawRd_T_14; // @[Scoreboard.scala 141:36]
  wire  _T_654 = io_writeback_3_ready & io_writeback_3_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_192 = _T_2 & ~reset; // @[Scoreboard.scala 101:19]
  wire  _GEN_194 = _T_161 & ~reset; // @[Scoreboard.scala 101:19]
  wire  _GEN_196 = _T_320 & ~reset; // @[Scoreboard.scala 101:19]
  wire  _GEN_198 = _T_479 & ~reset; // @[Scoreboard.scala 101:19]
  assign io_issue_ready = (~wawRd | wawRd & io_issue_bits_fuId == 2'h0) & io_issue_valid & ~_GEN_3; // @[Scoreboard.scala 74:89]
  assign io_readOpr_0_ready = fuStatus_0_rs1_ready & fuStatus_0_rs2_ready & fuStatus_0_busy & io_readOpr_0_valid; // @[Scoreboard.scala 124:99]
  assign io_readOpr_1_ready = fuStatus_1_rs1_ready & fuStatus_1_rs2_ready & fuStatus_1_busy & io_readOpr_1_valid; // @[Scoreboard.scala 124:99]
  assign io_readOpr_2_ready = fuStatus_2_rs1_ready & fuStatus_2_rs2_ready & fuStatus_2_busy & io_readOpr_2_valid; // @[Scoreboard.scala 124:99]
  assign io_readOpr_3_ready = fuStatus_3_rs1_ready & fuStatus_3_rs2_ready & fuStatus_3_busy & io_readOpr_3_valid; // @[Scoreboard.scala 124:99]
  assign io_writeback_0_ready = io_writeback_0_valid & ~warRd_0; // @[Scoreboard.scala 143:56]
  assign io_writeback_1_ready = io_writeback_1_valid & ~warRd_1; // @[Scoreboard.scala 143:56]
  assign io_writeback_2_ready = io_writeback_2_valid & ~warRd_2; // @[Scoreboard.scala 143:56]
  assign io_writeback_3_ready = io_writeback_3_valid & ~warRd_3; // @[Scoreboard.scala 143:56]
  always @(posedge clock) begin
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_busy <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_flush) begin // @[Scoreboard.scala 150:20]
      fuStatus_0_busy <= 1'h0; // @[Scoreboard.scala 151:38]
    end else if (_T_636 & ~_T_2) begin // @[Scoreboard.scala 145:89]
      fuStatus_0_busy <= 1'h0; // @[Scoreboard.scala 146:30]
    end else begin
      fuStatus_0_busy <= _GEN_4;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_op <= 8'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_op <= io_issue_bits_op; // @[Scoreboard.scala 94:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_rd <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_rd <= io_issue_bits_rd; // @[Scoreboard.scala 95:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_rs1 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_rs1 <= io_issue_bits_rs1; // @[Scoreboard.scala 96:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_rs2 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_rs2 <= io_issue_bits_rs2; // @[Scoreboard.scala 97:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_gen_rs1 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_gen_rs1 <= _fuStatus_0_gen_rs1_T_10; // @[Scoreboard.scala 103:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_gen_rs2 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_0_gen_rs2 <= _fuStatus_0_gen_rs2_T_10; // @[Scoreboard.scala 104:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_rs1_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_0) begin // @[Scoreboard.scala 129:29]
      fuStatus_0_rs1_ready <= 1'h0; // @[Scoreboard.scala 130:35]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs1_1_0) begin // @[Scoreboard.scala 108:41]
        fuStatus_0_rs1_ready <= 1'h0;
      end else begin
        fuStatus_0_rs1_ready <= 1'h1;
      end
    end else if (rawRs1__0) begin // @[Scoreboard.scala 89:37]
      fuStatus_0_rs1_ready <= 1'h0;
    end else begin
      fuStatus_0_rs1_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_0_rs2_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_0) begin // @[Scoreboard.scala 129:29]
      fuStatus_0_rs2_ready <= 1'h0; // @[Scoreboard.scala 131:35]
    end else if (_io_issue_ready_T_1 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs2_1_0) begin // @[Scoreboard.scala 109:41]
        fuStatus_0_rs2_ready <= 1'h0;
      end else begin
        fuStatus_0_rs2_ready <= 1'h1;
      end
    end else if (rawRs2__0) begin // @[Scoreboard.scala 90:37]
      fuStatus_0_rs2_ready <= 1'h0;
    end else begin
      fuStatus_0_rs2_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_busy <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_flush) begin // @[Scoreboard.scala 150:20]
      fuStatus_1_busy <= 1'h0; // @[Scoreboard.scala 151:38]
    end else if (_T_642 & ~_T_161) begin // @[Scoreboard.scala 145:89]
      fuStatus_1_busy <= 1'h0; // @[Scoreboard.scala 146:30]
    end else begin
      fuStatus_1_busy <= _GEN_47;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_op <= 8'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_op <= io_issue_bits_op; // @[Scoreboard.scala 94:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_rd <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_rd <= io_issue_bits_rd; // @[Scoreboard.scala 95:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_rs1 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_rs1 <= io_issue_bits_rs1; // @[Scoreboard.scala 96:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_rs2 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_rs2 <= io_issue_bits_rs2; // @[Scoreboard.scala 97:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_gen_rs1 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_gen_rs1 <= _fuStatus_0_gen_rs1_T_10; // @[Scoreboard.scala 103:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_gen_rs2 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_1_gen_rs2 <= _fuStatus_0_gen_rs2_T_10; // @[Scoreboard.scala 104:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_rs1_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_1) begin // @[Scoreboard.scala 129:29]
      fuStatus_1_rs1_ready <= 1'h0; // @[Scoreboard.scala 130:35]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs1_1_1) begin // @[Scoreboard.scala 108:41]
        fuStatus_1_rs1_ready <= 1'h0;
      end else begin
        fuStatus_1_rs1_ready <= 1'h1;
      end
    end else if (rawRs1__1) begin // @[Scoreboard.scala 89:37]
      fuStatus_1_rs1_ready <= 1'h0;
    end else begin
      fuStatus_1_rs1_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_1_rs2_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_1) begin // @[Scoreboard.scala 129:29]
      fuStatus_1_rs2_ready <= 1'h0; // @[Scoreboard.scala 131:35]
    end else if (io_issue_bits_fuId == 2'h1 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs2_1_1) begin // @[Scoreboard.scala 109:41]
        fuStatus_1_rs2_ready <= 1'h0;
      end else begin
        fuStatus_1_rs2_ready <= 1'h1;
      end
    end else if (rawRs2__1) begin // @[Scoreboard.scala 90:37]
      fuStatus_1_rs2_ready <= 1'h0;
    end else begin
      fuStatus_1_rs2_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_busy <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_flush) begin // @[Scoreboard.scala 150:20]
      fuStatus_2_busy <= 1'h0; // @[Scoreboard.scala 151:38]
    end else if (_T_648 & ~_T_320) begin // @[Scoreboard.scala 145:89]
      fuStatus_2_busy <= 1'h0; // @[Scoreboard.scala 146:30]
    end else begin
      fuStatus_2_busy <= _GEN_90;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_op <= 8'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_op <= io_issue_bits_op; // @[Scoreboard.scala 94:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_rd <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_rd <= io_issue_bits_rd; // @[Scoreboard.scala 95:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_rs1 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_rs1 <= io_issue_bits_rs1; // @[Scoreboard.scala 96:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_rs2 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_rs2 <= io_issue_bits_rs2; // @[Scoreboard.scala 97:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_gen_rs1 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_gen_rs1 <= _fuStatus_0_gen_rs1_T_10; // @[Scoreboard.scala 103:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_gen_rs2 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_2_gen_rs2 <= _fuStatus_0_gen_rs2_T_10; // @[Scoreboard.scala 104:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_rs1_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_2) begin // @[Scoreboard.scala 129:29]
      fuStatus_2_rs1_ready <= 1'h0; // @[Scoreboard.scala 130:35]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs1_1_2) begin // @[Scoreboard.scala 108:41]
        fuStatus_2_rs1_ready <= 1'h0;
      end else begin
        fuStatus_2_rs1_ready <= 1'h1;
      end
    end else if (rawRs1__2) begin // @[Scoreboard.scala 89:37]
      fuStatus_2_rs1_ready <= 1'h0;
    end else begin
      fuStatus_2_rs1_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_2_rs2_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_2) begin // @[Scoreboard.scala 129:29]
      fuStatus_2_rs2_ready <= 1'h0; // @[Scoreboard.scala 131:35]
    end else if (io_issue_bits_fuId == 2'h2 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs2_1_2) begin // @[Scoreboard.scala 109:41]
        fuStatus_2_rs2_ready <= 1'h0;
      end else begin
        fuStatus_2_rs2_ready <= 1'h1;
      end
    end else if (rawRs2__2) begin // @[Scoreboard.scala 90:37]
      fuStatus_2_rs2_ready <= 1'h0;
    end else begin
      fuStatus_2_rs2_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_busy <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_flush) begin // @[Scoreboard.scala 150:20]
      fuStatus_3_busy <= 1'h0; // @[Scoreboard.scala 151:38]
    end else if (_T_654 & ~_T_479) begin // @[Scoreboard.scala 145:89]
      fuStatus_3_busy <= 1'h0; // @[Scoreboard.scala 146:30]
    end else begin
      fuStatus_3_busy <= _GEN_133;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_op <= 8'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_op <= io_issue_bits_op; // @[Scoreboard.scala 94:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_rd <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_rd <= io_issue_bits_rd; // @[Scoreboard.scala 95:28]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_rs1 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_rs1 <= io_issue_bits_rs1; // @[Scoreboard.scala 96:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_rs2 <= 5'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_rs2 <= io_issue_bits_rs2; // @[Scoreboard.scala 97:29]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_gen_rs1 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_gen_rs1 <= _fuStatus_0_gen_rs1_T_10; // @[Scoreboard.scala 103:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_gen_rs2 <= 2'h0; // @[Scoreboard.scala 67:42]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      fuStatus_3_gen_rs2 <= _fuStatus_0_gen_rs2_T_10; // @[Scoreboard.scala 104:33]
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_rs1_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_3) begin // @[Scoreboard.scala 129:29]
      fuStatus_3_rs1_ready <= 1'h0; // @[Scoreboard.scala 130:35]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs1_1_3) begin // @[Scoreboard.scala 108:41]
        fuStatus_3_rs1_ready <= 1'h0;
      end else begin
        fuStatus_3_rs1_ready <= 1'h1;
      end
    end else if (rawRs1__3) begin // @[Scoreboard.scala 89:37]
      fuStatus_3_rs1_ready <= 1'h0;
    end else begin
      fuStatus_3_rs1_ready <= 1'h1;
    end
    if (reset) begin // @[Scoreboard.scala 67:42]
      fuStatus_3_rs2_ready <= 1'h0; // @[Scoreboard.scala 67:42]
    end else if (io_execute_3) begin // @[Scoreboard.scala 129:29]
      fuStatus_3_rs2_ready <= 1'h0; // @[Scoreboard.scala 131:35]
    end else if (io_issue_bits_fuId == 2'h3 & _T_1) begin // @[Scoreboard.scala 92:62]
      if (rawRs2_1_3) begin // @[Scoreboard.scala 109:41]
        fuStatus_3_rs2_ready <= 1'h0;
      end else begin
        fuStatus_3_rs2_ready <= 1'h1;
      end
    end else if (rawRs2__3) begin // @[Scoreboard.scala 90:37]
      fuStatus_3_rs2_ready <= 1'h0;
    end else begin
      fuStatus_3_rs2_ready <= 1'h1;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & ~reset & ~(_T_11 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs1OH has multiple hot bit\n    at Scoreboard.scala:101 assert(PopCount(matchRs1OH) <= 1.U, \"error matchRs1OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 101:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_11 <= 3'h1) & (_T_2 & ~reset)) begin
          $fatal; // @[Scoreboard.scala 101:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_192 & ~(_T_25 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs2OH has multiple hot bit\n    at Scoreboard.scala:102 assert(PopCount(matchRs2OH) <= 1.U, \"error matchRs2OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 102:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_25 <= 3'h1) & (_T_2 & _T_15)) begin
          $fatal; // @[Scoreboard.scala 102:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_161 & ~reset & ~(_T_11 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs1OH has multiple hot bit\n    at Scoreboard.scala:101 assert(PopCount(matchRs1OH) <= 1.U, \"error matchRs1OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 101:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_11 <= 3'h1) & (_T_161 & ~reset)) begin
          $fatal; // @[Scoreboard.scala 101:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & ~(_T_25 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs2OH has multiple hot bit\n    at Scoreboard.scala:102 assert(PopCount(matchRs2OH) <= 1.U, \"error matchRs2OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 102:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_25 <= 3'h1) & (_T_161 & _T_15)) begin
          $fatal; // @[Scoreboard.scala 102:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_320 & ~reset & ~(_T_11 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs1OH has multiple hot bit\n    at Scoreboard.scala:101 assert(PopCount(matchRs1OH) <= 1.U, \"error matchRs1OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 101:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_11 <= 3'h1) & (_T_320 & ~reset)) begin
          $fatal; // @[Scoreboard.scala 101:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_196 & ~(_T_25 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs2OH has multiple hot bit\n    at Scoreboard.scala:102 assert(PopCount(matchRs2OH) <= 1.U, \"error matchRs2OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 102:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_25 <= 3'h1) & (_T_320 & _T_15)) begin
          $fatal; // @[Scoreboard.scala 102:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_479 & ~reset & ~(_T_11 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs1OH has multiple hot bit\n    at Scoreboard.scala:101 assert(PopCount(matchRs1OH) <= 1.U, \"error matchRs1OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 101:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_11 <= 3'h1) & (_T_479 & ~reset)) begin
          $fatal; // @[Scoreboard.scala 101:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_198 & ~(_T_25 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: error matchRs2OH has multiple hot bit\n    at Scoreboard.scala:102 assert(PopCount(matchRs2OH) <= 1.U, \"error matchRs2OH has multiple hot bit\")\n"
            ); // @[Scoreboard.scala 102:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_25 <= 3'h1) & (_T_479 & _T_15)) begin
          $fatal; // @[Scoreboard.scala 102:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  fuStatus_0_busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  fuStatus_0_op = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  fuStatus_0_rd = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  fuStatus_0_rs1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  fuStatus_0_rs2 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  fuStatus_0_gen_rs1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  fuStatus_0_gen_rs2 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  fuStatus_0_rs1_ready = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  fuStatus_0_rs2_ready = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  fuStatus_1_busy = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  fuStatus_1_op = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  fuStatus_1_rd = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  fuStatus_1_rs1 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  fuStatus_1_rs2 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  fuStatus_1_gen_rs1 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  fuStatus_1_gen_rs2 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  fuStatus_1_rs1_ready = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  fuStatus_1_rs2_ready = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  fuStatus_2_busy = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  fuStatus_2_op = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  fuStatus_2_rd = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  fuStatus_2_rs1 = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  fuStatus_2_rs2 = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  fuStatus_2_gen_rs1 = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  fuStatus_2_gen_rs2 = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  fuStatus_2_rs1_ready = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  fuStatus_2_rs2_ready = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  fuStatus_3_busy = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  fuStatus_3_op = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  fuStatus_3_rd = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  fuStatus_3_rs1 = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  fuStatus_3_rs2 = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  fuStatus_3_gen_rs1 = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  fuStatus_3_gen_rs2 = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  fuStatus_3_rs1_ready = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  fuStatus_3_rs2_ready = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
