module DCacheDirectory(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_bits_hit,
  output [7:0]  io_read_resp_bits_chosenWay,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [7:0]  io_write_req_bits_way
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  tagArray_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] tagArray_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  tagArray_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] tagArray_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_0; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_1; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_2; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_3; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_4; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_5; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_6; // @[SRAM_1.scala 255:31]
  wire [19:0] tagArray_io_w_data_7; // @[SRAM_1.scala 255:31]
  wire [7:0] tagArray_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  metaArray_clock; // @[SRAM_1.scala 255:31]
  wire [6:0] metaArray_io_r_addr; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_0; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_1; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_2; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_3; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_4; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_5; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_6; // @[SRAM_1.scala 255:31]
  wire [1:0] metaArray_io_r_data_7; // @[SRAM_1.scala 255:31]
  wire  metaArray_io_w_en; // @[SRAM_1.scala 255:31]
  wire [6:0] metaArray_io_w_addr; // @[SRAM_1.scala 255:31]
  wire [7:0] metaArray_io_w_maskOH; // @[SRAM_1.scala 255:31]
  wire  replaceWay_lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_8; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_9; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_10; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_11; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_12; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_13; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_14; // @[PRNG.scala 91:22]
  wire  replaceWay_lfsr_prng_io_out_15; // @[PRNG.scala 91:22]
  wire [6:0] rSet = io_read_req_bits_addr[11:5]; // @[Parameters.scala 50:11]
  wire [19:0] rTag = io_read_req_bits_addr[31:12]; // @[Parameters.scala 46:11]
  wire  ren = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  wire [6:0] wSet = io_write_req_bits_addr[11:5]; // @[Parameters.scala 50:11]
  wire [19:0] wTag = io_write_req_bits_addr[31:12]; // @[Parameters.scala 46:11]
  wire  wen = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _T_8 = io_write_req_bits_way[0] + io_write_req_bits_way[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_10 = io_write_req_bits_way[2] + io_write_req_bits_way[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_12 = _T_8 + _T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _T_14 = io_write_req_bits_way[4] + io_write_req_bits_way[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_16 = io_write_req_bits_way[6] + io_write_req_bits_way[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_18 = _T_14 + _T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _T_20 = _T_12 + _T_18; // @[Bitwise.scala 51:90]
  wire  _T_46 = ~reset; // @[Directory.scala 69:11]
  wire [19:0] rdata__0 = ren ? tagArray_io_r_data_0 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__1 = ren ? tagArray_io_r_data_1 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__2 = ren ? tagArray_io_r_data_2 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__3 = ren ? tagArray_io_r_data_3 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__4 = ren ? tagArray_io_r_data_4 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__5 = ren ? tagArray_io_r_data_5 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__6 = ren ? tagArray_io_r_data_6 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [19:0] rdata__7 = ren ? tagArray_io_r_data_7 : 20'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_0 = ren ? metaArray_io_r_data_0 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_1 = ren ? metaArray_io_r_data_1 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_2 = ren ? metaArray_io_r_data_2 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_3 = ren ? metaArray_io_r_data_3 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_4 = ren ? metaArray_io_r_data_4 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_5 = ren ? metaArray_io_r_data_5 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_6 = ren ? metaArray_io_r_data_6 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [1:0] rdata_1_7 = ren ? metaArray_io_r_data_7 : 2'h0; // @[SRAM_1.scala 102:22 103:19 101:32]
  wire [15:0] _T_48 = {rdata_1_7,rdata_1_6,rdata_1_5,rdata_1_4,rdata_1_3,rdata_1_2,rdata_1_1,rdata_1_0}; // @[Directory.scala 82:52]
  wire  metaRdVec_0_valid = _T_48[0]; // @[Directory.scala 82:52]
  wire  metaRdVec_1_valid = _T_48[2]; // @[Directory.scala 82:52]
  wire  metaRdVec_2_valid = _T_48[4]; // @[Directory.scala 82:52]
  wire  metaRdVec_3_valid = _T_48[6]; // @[Directory.scala 82:52]
  wire  metaRdVec_4_valid = _T_48[8]; // @[Directory.scala 82:52]
  wire  metaRdVec_5_valid = _T_48[10]; // @[Directory.scala 82:52]
  wire  metaRdVec_6_valid = _T_48[12]; // @[Directory.scala 82:52]
  wire  metaRdVec_7_valid = _T_48[14]; // @[Directory.scala 82:52]
  wire  tagMatchVec_0 = rdata__0 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_1 = rdata__1 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_2 = rdata__2 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_3 = rdata__3 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_4 = rdata__4 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_5 = rdata__5 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_6 = rdata__6 == rTag; // @[Directory.scala 85:46]
  wire  tagMatchVec_7 = rdata__7 == rTag; // @[Directory.scala 85:46]
  wire  _matchWayOH_T = tagMatchVec_0 & metaRdVec_0_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_1 = tagMatchVec_1 & metaRdVec_1_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_2 = tagMatchVec_2 & metaRdVec_2_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_3 = tagMatchVec_3 & metaRdVec_3_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_4 = tagMatchVec_4 & metaRdVec_4_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_5 = tagMatchVec_5 & metaRdVec_5_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_6 = tagMatchVec_6 & metaRdVec_6_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_7 = tagMatchVec_7 & metaRdVec_7_valid; // @[Directory.scala 88:80]
  wire [7:0] matchWayOH = {_matchWayOH_T_7,_matchWayOH_T_6,_matchWayOH_T_5,_matchWayOH_T_4,_matchWayOH_T_3,
    _matchWayOH_T_2,_matchWayOH_T_1,_matchWayOH_T}; // @[Cat.scala 33:92]
  wire  invalidWayVec_0 = ~metaRdVec_0_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_1 = ~metaRdVec_1_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_2 = ~metaRdVec_2_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_3 = ~metaRdVec_3_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_4 = ~metaRdVec_4_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_5 = ~metaRdVec_5_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_6 = ~metaRdVec_6_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_7 = ~metaRdVec_7_valid; // @[Directory.scala 89:53]
  wire [7:0] _invalidWayOH_T_16 = invalidWayVec_6 ? 8'h40 : 8'h80; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_17 = invalidWayVec_5 ? 8'h20 : _invalidWayOH_T_16; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_18 = invalidWayVec_4 ? 8'h10 : _invalidWayOH_T_17; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_19 = invalidWayVec_3 ? 8'h8 : _invalidWayOH_T_18; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_20 = invalidWayVec_2 ? 8'h4 : _invalidWayOH_T_19; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_21 = invalidWayVec_1 ? 8'h2 : _invalidWayOH_T_20; // @[Mux.scala 47:70]
  wire [7:0] invalidWayOH = invalidWayVec_0 ? 8'h1 : _invalidWayOH_T_21; // @[Mux.scala 47:70]
  wire [7:0] _hasInvalidWay_T = {invalidWayVec_0,invalidWayVec_1,invalidWayVec_2,invalidWayVec_3,invalidWayVec_4,
    invalidWayVec_5,invalidWayVec_6,invalidWayVec_7}; // @[Cat.scala 33:92]
  wire  hasInvalidWay = |_hasInvalidWay_T; // @[Directory.scala 91:44]
  wire [7:0] replaceWay_lfsr_lo = {replaceWay_lfsr_prng_io_out_7,replaceWay_lfsr_prng_io_out_6,
    replaceWay_lfsr_prng_io_out_5,replaceWay_lfsr_prng_io_out_4,replaceWay_lfsr_prng_io_out_3,
    replaceWay_lfsr_prng_io_out_2,replaceWay_lfsr_prng_io_out_1,replaceWay_lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [15:0] replaceWay_lfsr = {replaceWay_lfsr_prng_io_out_15,replaceWay_lfsr_prng_io_out_14,
    replaceWay_lfsr_prng_io_out_13,replaceWay_lfsr_prng_io_out_12,replaceWay_lfsr_prng_io_out_11,
    replaceWay_lfsr_prng_io_out_10,replaceWay_lfsr_prng_io_out_9,replaceWay_lfsr_prng_io_out_8,replaceWay_lfsr_lo}; // @[PRNG.scala 95:17]
  wire [2:0] replaceWay_outputWay_shiftAmount = replaceWay_lfsr[2:0]; // @[DCache.scala 60:39]
  wire [7:0] replaceWay = 8'h1 << replaceWay_outputWay_shiftAmount; // @[OneHot.scala 64:12]
  wire  _replaceWayReg_T = ~io_read_req_valid; // @[Directory.scala 93:65]
  reg [7:0] replaceWayReg; // @[Reg.scala 19:16]
  wire  isHit = |matchWayOH; // @[Directory.scala 95:41]
  wire [7:0] _choseWayOH_T = hasInvalidWay ? invalidWayOH : replaceWayReg; // @[Directory.scala 96:51]
  wire [7:0] choseWayOH = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 96:28]
  wire [1:0] _T_73 = choseWayOH[0] + choseWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_75 = choseWayOH[2] + choseWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_77 = _T_73 + _T_75; // @[Bitwise.scala 51:90]
  wire [1:0] _T_79 = choseWayOH[4] + choseWayOH[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_81 = choseWayOH[6] + choseWayOH[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_83 = _T_79 + _T_81; // @[Bitwise.scala 51:90]
  wire [3:0] _T_85 = _T_77 + _T_83; // @[Bitwise.scala 51:90]
  SRAMArray_2P_8 tagArray ( // @[SRAM_1.scala 255:31]
    .clock(tagArray_clock),
    .io_r_addr(tagArray_io_r_addr),
    .io_r_data_0(tagArray_io_r_data_0),
    .io_r_data_1(tagArray_io_r_data_1),
    .io_r_data_2(tagArray_io_r_data_2),
    .io_r_data_3(tagArray_io_r_data_3),
    .io_r_data_4(tagArray_io_r_data_4),
    .io_r_data_5(tagArray_io_r_data_5),
    .io_r_data_6(tagArray_io_r_data_6),
    .io_r_data_7(tagArray_io_r_data_7),
    .io_w_en(tagArray_io_w_en),
    .io_w_addr(tagArray_io_w_addr),
    .io_w_data_0(tagArray_io_w_data_0),
    .io_w_data_1(tagArray_io_w_data_1),
    .io_w_data_2(tagArray_io_w_data_2),
    .io_w_data_3(tagArray_io_w_data_3),
    .io_w_data_4(tagArray_io_w_data_4),
    .io_w_data_5(tagArray_io_w_data_5),
    .io_w_data_6(tagArray_io_w_data_6),
    .io_w_data_7(tagArray_io_w_data_7),
    .io_w_maskOH(tagArray_io_w_maskOH)
  );
  SRAMArray_2P_9 metaArray ( // @[SRAM_1.scala 255:31]
    .clock(metaArray_clock),
    .io_r_addr(metaArray_io_r_addr),
    .io_r_data_0(metaArray_io_r_data_0),
    .io_r_data_1(metaArray_io_r_data_1),
    .io_r_data_2(metaArray_io_r_data_2),
    .io_r_data_3(metaArray_io_r_data_3),
    .io_r_data_4(metaArray_io_r_data_4),
    .io_r_data_5(metaArray_io_r_data_5),
    .io_r_data_6(metaArray_io_r_data_6),
    .io_r_data_7(metaArray_io_r_data_7),
    .io_w_en(metaArray_io_w_en),
    .io_w_addr(metaArray_io_w_addr),
    .io_w_maskOH(metaArray_io_w_maskOH)
  );
  MaxPeriodFibonacciLFSR replaceWay_lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(replaceWay_lfsr_prng_clock),
    .reset(replaceWay_lfsr_prng_reset),
    .io_out_0(replaceWay_lfsr_prng_io_out_0),
    .io_out_1(replaceWay_lfsr_prng_io_out_1),
    .io_out_2(replaceWay_lfsr_prng_io_out_2),
    .io_out_3(replaceWay_lfsr_prng_io_out_3),
    .io_out_4(replaceWay_lfsr_prng_io_out_4),
    .io_out_5(replaceWay_lfsr_prng_io_out_5),
    .io_out_6(replaceWay_lfsr_prng_io_out_6),
    .io_out_7(replaceWay_lfsr_prng_io_out_7),
    .io_out_8(replaceWay_lfsr_prng_io_out_8),
    .io_out_9(replaceWay_lfsr_prng_io_out_9),
    .io_out_10(replaceWay_lfsr_prng_io_out_10),
    .io_out_11(replaceWay_lfsr_prng_io_out_11),
    .io_out_12(replaceWay_lfsr_prng_io_out_12),
    .io_out_13(replaceWay_lfsr_prng_io_out_13),
    .io_out_14(replaceWay_lfsr_prng_io_out_14),
    .io_out_15(replaceWay_lfsr_prng_io_out_15)
  );
  assign io_read_req_ready = 1'h1; // @[Directory.scala 75:29]
  assign io_read_resp_bits_hit = |matchWayOH; // @[Directory.scala 95:41]
  assign io_read_resp_bits_chosenWay = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 96:28]
  assign io_write_req_ready = 1'h1; // @[Directory.scala 76:29]
  assign tagArray_clock = clock;
  assign tagArray_io_r_addr = rSet; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign tagArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagArray_io_w_addr = wSet; // @[Directory.scala 112:15 SRAM_1.scala 237:19]
  assign tagArray_io_w_data_0 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_1 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_2 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_3 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_4 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_5 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_6 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_data_7 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 238:35]
  assign tagArray_io_w_maskOH = io_write_req_bits_way; // @[Directory.scala 112:15 SRAM_1.scala 239:21]
  assign metaArray_clock = clock;
  assign metaArray_io_r_addr = rSet; // @[SRAM_1.scala 102:22 244:{19,19}]
  assign metaArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign metaArray_io_w_addr = wSet; // @[Directory.scala 112:15 SRAM_1.scala 237:19]
  assign metaArray_io_w_maskOH = io_write_req_bits_way; // @[Directory.scala 112:15 SRAM_1.scala 239:21]
  assign replaceWay_lfsr_prng_clock = clock;
  assign replaceWay_lfsr_prng_reset = reset;
  always @(posedge clock) begin
    if (_replaceWayReg_T) begin // @[Reg.scala 20:18]
      replaceWayReg <= replaceWay; // @[Reg.scala 20:22]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_20 < 4'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error directory write way has multiple valid bit! ==>%d\n    at Directory.scala:69 assert(PopCount(wWay) < 2.U, cf\"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}\")\n"
            ,_T_20); // @[Directory.scala 69:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 < 4'h2) & ~reset) begin
          $fatal; // @[Directory.scala 69:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_46 & ~(_T_85 == 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error chosenWay has multiple valid bit!\n    at Directory.scala:101 assert(PopCount(choseWayOH) === 1.U, \"Error chosenWay has multiple valid bit!\")\n"
            ); // @[Directory.scala 101:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_85 == 4'h1) & _T_46) begin
          $fatal; // @[Directory.scala 101:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen & _T_46 & ~(_T_20 <= 4'h1)) begin
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
        if (~(_T_20 <= 4'h1) & (wen & _T_46)) begin
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
        if (wen & _T_46 & ~(_T_20 <= 4'h1)) begin
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
        if (~(_T_20 <= 4'h1) & (wen & _T_46)) begin
          $fatal; // @[SRAM_1.scala 235:15]
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
  replaceWayReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
