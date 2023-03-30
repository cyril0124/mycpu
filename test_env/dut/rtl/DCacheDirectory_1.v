module DCacheDirectory_1(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_bits_hit,
  output [7:0]  io_read_resp_bits_chosenWay,
  output        io_read_resp_bits_isDirtyWay,
  output [19:0] io_read_resp_bits_dirtyTag,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [7:0]  io_write_req_bits_way,
  input  [1:0]  io_write_req_bits_meta
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
`endif // RANDOMIZE_REG_INIT
  wire  tagArray_clock; // @[Directory.scala 67:26]
  wire  tagArray_reset; // @[Directory.scala 67:26]
  wire [7:0] tagArray_io_r_addr; // @[Directory.scala 67:26]
  wire [159:0] tagArray_io_r_data; // @[Directory.scala 67:26]
  wire  tagArray_io_w_en; // @[Directory.scala 67:26]
  wire [7:0] tagArray_io_w_addr; // @[Directory.scala 67:26]
  wire [159:0] tagArray_io_w_data; // @[Directory.scala 67:26]
  wire [7:0] tagArray_io_w_mask; // @[Directory.scala 67:26]
  wire  tagValidArray_clock; // @[Directory.scala 68:31]
  wire  tagValidArray_reset; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_r_addr; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_r_data; // @[Directory.scala 68:31]
  wire  tagValidArray_io_w_en; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_w_addr; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_w_mask; // @[Directory.scala 68:31]
  wire  metaArray_clock; // @[Directory.scala 69:27]
  wire  metaArray_reset; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_r_addr; // @[Directory.scala 69:27]
  wire [15:0] metaArray_io_r_data; // @[Directory.scala 69:27]
  wire  metaArray_io_w_en; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_w_addr; // @[Directory.scala 69:27]
  wire [15:0] metaArray_io_w_data; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_w_mask; // @[Directory.scala 69:27]
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
  wire  _rAddr_T = io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] rAddr_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _rAddr_T ? io_read_req_bits_addr : rAddr_r; // @[Reg.scala 19:16 20:{18,22}]
  wire [7:0] rSet = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  wire [19:0] rTag = _GEN_0[31:12]; // @[Parameters.scala 46:11]
  wire  _wAddr_T = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] wAddr_r; // @[Reg.scala 19:16]
  wire [31:0] wAddr = _wAddr_T ? io_write_req_bits_addr : wAddr_r; // @[Directory.scala 53:20]
  wire [7:0] wSet = wAddr[11:4]; // @[Parameters.scala 50:11]
  wire [19:0] wTag = wAddr[31:12]; // @[Parameters.scala 46:11]
  wire [1:0] _T_8 = io_write_req_bits_way[0] + io_write_req_bits_way[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_10 = io_write_req_bits_way[2] + io_write_req_bits_way[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_12 = _T_8 + _T_10; // @[Bitwise.scala 51:90]
  wire [1:0] _T_14 = io_write_req_bits_way[4] + io_write_req_bits_way[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_16 = io_write_req_bits_way[6] + io_write_req_bits_way[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_18 = _T_14 + _T_16; // @[Bitwise.scala 51:90]
  wire [3:0] _T_20 = _T_12 + _T_18; // @[Bitwise.scala 51:90]
  wire  _T_46 = ~reset; // @[Directory.scala 65:11]
  wire [159:0] _WIRE_1 = tagArray_io_r_data; // @[Directory.scala 77:{44,44}]
  wire [19:0] tagRdVec_0 = _WIRE_1[19:0]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_1 = _WIRE_1[39:20]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_2 = _WIRE_1[59:40]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_3 = _WIRE_1[79:60]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_4 = _WIRE_1[99:80]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_5 = _WIRE_1[119:100]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_6 = _WIRE_1[139:120]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_7 = _WIRE_1[159:140]; // @[Directory.scala 77:44]
  wire [7:0] _WIRE_3 = tagValidArray_io_r_data; // @[Directory.scala 82:{54,54}]
  wire  tagValidRdVec_0 = _WIRE_3[0]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_1 = _WIRE_3[1]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_2 = _WIRE_3[2]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_3 = _WIRE_3[3]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_4 = _WIRE_3[4]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_5 = _WIRE_3[5]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_6 = _WIRE_3[6]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_7 = _WIRE_3[7]; // @[Directory.scala 82:54]
  wire [15:0] _WIRE_5 = metaArray_io_r_data; // @[Directory.scala 88:{46,46}]
  wire  metaRdVec_0_valid = _WIRE_5[0]; // @[Directory.scala 88:46]
  wire  metaRdVec_0_dirty = _WIRE_5[1]; // @[Directory.scala 88:46]
  wire  metaRdVec_1_valid = _WIRE_5[2]; // @[Directory.scala 88:46]
  wire  metaRdVec_1_dirty = _WIRE_5[3]; // @[Directory.scala 88:46]
  wire  metaRdVec_2_valid = _WIRE_5[4]; // @[Directory.scala 88:46]
  wire  metaRdVec_2_dirty = _WIRE_5[5]; // @[Directory.scala 88:46]
  wire  metaRdVec_3_valid = _WIRE_5[6]; // @[Directory.scala 88:46]
  wire  metaRdVec_3_dirty = _WIRE_5[7]; // @[Directory.scala 88:46]
  wire  metaRdVec_4_valid = _WIRE_5[8]; // @[Directory.scala 88:46]
  wire  metaRdVec_4_dirty = _WIRE_5[9]; // @[Directory.scala 88:46]
  wire  metaRdVec_5_valid = _WIRE_5[10]; // @[Directory.scala 88:46]
  wire  metaRdVec_5_dirty = _WIRE_5[11]; // @[Directory.scala 88:46]
  wire  metaRdVec_6_valid = _WIRE_5[12]; // @[Directory.scala 88:46]
  wire  metaRdVec_6_dirty = _WIRE_5[13]; // @[Directory.scala 88:46]
  wire  metaRdVec_7_valid = _WIRE_5[14]; // @[Directory.scala 88:46]
  wire  metaRdVec_7_dirty = _WIRE_5[15]; // @[Directory.scala 88:46]
  wire  tagMatchVec_0 = tagRdVec_0 == rTag & tagValidRdVec_0; // @[Directory.scala 92:79]
  wire  tagMatchVec_1 = tagRdVec_1 == rTag & tagValidRdVec_1; // @[Directory.scala 92:79]
  wire  tagMatchVec_2 = tagRdVec_2 == rTag & tagValidRdVec_2; // @[Directory.scala 92:79]
  wire  tagMatchVec_3 = tagRdVec_3 == rTag & tagValidRdVec_3; // @[Directory.scala 92:79]
  wire  tagMatchVec_4 = tagRdVec_4 == rTag & tagValidRdVec_4; // @[Directory.scala 92:79]
  wire  tagMatchVec_5 = tagRdVec_5 == rTag & tagValidRdVec_5; // @[Directory.scala 92:79]
  wire  tagMatchVec_6 = tagRdVec_6 == rTag & tagValidRdVec_6; // @[Directory.scala 92:79]
  wire  tagMatchVec_7 = tagRdVec_7 == rTag & tagValidRdVec_7; // @[Directory.scala 92:79]
  wire  _matchWayOH_T = tagMatchVec_0 & metaRdVec_0_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_1 = tagMatchVec_1 & metaRdVec_1_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_2 = tagMatchVec_2 & metaRdVec_2_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_3 = tagMatchVec_3 & metaRdVec_3_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_4 = tagMatchVec_4 & metaRdVec_4_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_5 = tagMatchVec_5 & metaRdVec_5_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_6 = tagMatchVec_6 & metaRdVec_6_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_7 = tagMatchVec_7 & metaRdVec_7_valid; // @[Directory.scala 95:77]
  wire [7:0] matchWayOH = {_matchWayOH_T_7,_matchWayOH_T_6,_matchWayOH_T_5,_matchWayOH_T_4,_matchWayOH_T_3,
    _matchWayOH_T_2,_matchWayOH_T_1,_matchWayOH_T}; // @[Cat.scala 33:92]
  wire  invalidWayVec_0 = ~metaRdVec_0_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_1 = ~metaRdVec_1_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_2 = ~metaRdVec_2_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_3 = ~metaRdVec_3_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_4 = ~metaRdVec_4_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_5 = ~metaRdVec_5_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_6 = ~metaRdVec_6_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_7 = ~metaRdVec_7_valid; // @[Directory.scala 96:53]
  wire [7:0] _invalidWayOH_T_16 = invalidWayVec_6 ? 8'h40 : 8'h80; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_17 = invalidWayVec_5 ? 8'h20 : _invalidWayOH_T_16; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_18 = invalidWayVec_4 ? 8'h10 : _invalidWayOH_T_17; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_19 = invalidWayVec_3 ? 8'h8 : _invalidWayOH_T_18; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_20 = invalidWayVec_2 ? 8'h4 : _invalidWayOH_T_19; // @[Mux.scala 47:70]
  wire [7:0] _invalidWayOH_T_21 = invalidWayVec_1 ? 8'h2 : _invalidWayOH_T_20; // @[Mux.scala 47:70]
  wire [7:0] invalidWayOH = invalidWayVec_0 ? 8'h1 : _invalidWayOH_T_21; // @[Mux.scala 47:70]
  wire [7:0] _hasInvalidWay_T = {invalidWayVec_0,invalidWayVec_1,invalidWayVec_2,invalidWayVec_3,invalidWayVec_4,
    invalidWayVec_5,invalidWayVec_6,invalidWayVec_7}; // @[Cat.scala 33:92]
  wire  hasInvalidWay = |_hasInvalidWay_T; // @[Directory.scala 98:44]
  wire [7:0] replaceWay_lfsr_lo = {replaceWay_lfsr_prng_io_out_7,replaceWay_lfsr_prng_io_out_6,
    replaceWay_lfsr_prng_io_out_5,replaceWay_lfsr_prng_io_out_4,replaceWay_lfsr_prng_io_out_3,
    replaceWay_lfsr_prng_io_out_2,replaceWay_lfsr_prng_io_out_1,replaceWay_lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [15:0] replaceWay_lfsr = {replaceWay_lfsr_prng_io_out_15,replaceWay_lfsr_prng_io_out_14,
    replaceWay_lfsr_prng_io_out_13,replaceWay_lfsr_prng_io_out_12,replaceWay_lfsr_prng_io_out_11,
    replaceWay_lfsr_prng_io_out_10,replaceWay_lfsr_prng_io_out_9,replaceWay_lfsr_prng_io_out_8,replaceWay_lfsr_lo}; // @[PRNG.scala 95:17]
  wire [2:0] replaceWay_outputWay_shiftAmount = replaceWay_lfsr[2:0]; // @[DCache.scala 61:39]
  wire [7:0] replaceWay = 8'h1 << replaceWay_outputWay_shiftAmount; // @[OneHot.scala 64:12]
  wire  _replaceWayReg_T = ~io_read_req_valid; // @[Directory.scala 100:65]
  reg [7:0] replaceWayReg; // @[Reg.scala 19:16]
  wire  isHit = |matchWayOH; // @[Directory.scala 102:33]
  wire [7:0] _choseWayOH_T = hasInvalidWay ? invalidWayOH : replaceWayReg; // @[Directory.scala 104:48]
  wire [7:0] choseWayOH = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 104:25]
  wire [7:0] _dirtyWayOH_T = {metaRdVec_7_dirty,metaRdVec_6_dirty,metaRdVec_5_dirty,metaRdVec_4_dirty,metaRdVec_3_dirty,
    metaRdVec_2_dirty,metaRdVec_1_dirty,metaRdVec_0_dirty}; // @[Cat.scala 33:92]
  wire [7:0] _dirtyWayOH_T_1 = {metaRdVec_7_valid,metaRdVec_6_valid,metaRdVec_5_valid,metaRdVec_4_valid,
    metaRdVec_3_valid,metaRdVec_2_valid,metaRdVec_1_valid,metaRdVec_0_valid}; // @[Cat.scala 33:92]
  wire [7:0] _dirtyWayOH_T_2 = _dirtyWayOH_T & _dirtyWayOH_T_1; // @[Directory.scala 105:48]
  wire [7:0] dirtyWayOH = _dirtyWayOH_T_2 & choseWayOH; // @[Directory.scala 105:76]
  wire [7:0] _isDirtyWay_T = choseWayOH & dirtyWayOH; // @[Directory.scala 106:35]
  wire  isDirtyWay = |_isDirtyWay_T; // @[Directory.scala 106:50]
  wire [19:0] _dirtyTag_T_8 = dirtyWayOH[0] ? tagRdVec_0 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_9 = dirtyWayOH[1] ? tagRdVec_1 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_10 = dirtyWayOH[2] ? tagRdVec_2 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_11 = dirtyWayOH[3] ? tagRdVec_3 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_12 = dirtyWayOH[4] ? tagRdVec_4 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_13 = dirtyWayOH[5] ? tagRdVec_5 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_14 = dirtyWayOH[6] ? tagRdVec_6 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_15 = dirtyWayOH[7] ? tagRdVec_7 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_16 = _dirtyTag_T_8 | _dirtyTag_T_9; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_17 = _dirtyTag_T_16 | _dirtyTag_T_10; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_18 = _dirtyTag_T_17 | _dirtyTag_T_11; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_19 = _dirtyTag_T_18 | _dirtyTag_T_12; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_20 = _dirtyTag_T_19 | _dirtyTag_T_13; // @[Mux.scala 27:73]
  wire [19:0] _dirtyTag_T_21 = _dirtyTag_T_20 | _dirtyTag_T_14; // @[Mux.scala 27:73]
  wire [19:0] dirtyTag = _dirtyTag_T_21 | _dirtyTag_T_15; // @[Mux.scala 27:73]
  wire [1:0] _T_88 = choseWayOH[0] + choseWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_90 = choseWayOH[2] + choseWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_92 = _T_88 + _T_90; // @[Bitwise.scala 51:90]
  wire [1:0] _T_94 = choseWayOH[4] + choseWayOH[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_96 = choseWayOH[6] + choseWayOH[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_98 = _T_94 + _T_96; // @[Bitwise.scala 51:90]
  wire [3:0] _T_100 = _T_92 + _T_98; // @[Bitwise.scala 51:90]
  wire [1:0] _T_114 = dirtyWayOH[0] + dirtyWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_116 = dirtyWayOH[2] + dirtyWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_118 = _T_114 + _T_116; // @[Bitwise.scala 51:90]
  wire [1:0] _T_120 = dirtyWayOH[4] + dirtyWayOH[5]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_122 = dirtyWayOH[6] + dirtyWayOH[7]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_124 = _T_120 + _T_122; // @[Bitwise.scala 51:90]
  wire [3:0] _T_126 = _T_118 + _T_124; // @[Bitwise.scala 51:90]
  reg  io_read_resp_bits_isDirtyWay_REG; // @[Directory.scala 115:100]
  reg  io_read_resp_bits_isDirtyWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_chosenWay_REG; // @[Directory.scala 116:99]
  reg [7:0] io_read_resp_bits_chosenWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_hit_REG; // @[Directory.scala 117:83]
  reg  io_read_resp_bits_hit_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_dirtyTag_REG; // @[Directory.scala 118:94]
  reg [19:0] io_read_resp_bits_dirtyTag_r; // @[Reg.scala 19:16]
  wire [79:0] _tagArray_io_w_data_T_1 = {wTag,wTag,wTag,wTag}; // @[Cat.scala 33:92]
  wire [7:0] _metaArray_io_w_data_T_1 = {io_write_req_bits_meta,io_write_req_bits_meta,io_write_req_bits_meta,
    io_write_req_bits_meta}; // @[Cat.scala 33:92]
  SRAMTemplate_99 tagArray ( // @[Directory.scala 67:26]
    .clock(tagArray_clock),
    .reset(tagArray_reset),
    .io_r_addr(tagArray_io_r_addr),
    .io_r_data(tagArray_io_r_data),
    .io_w_en(tagArray_io_w_en),
    .io_w_addr(tagArray_io_w_addr),
    .io_w_data(tagArray_io_w_data),
    .io_w_mask(tagArray_io_w_mask)
  );
  SRAMTemplate_100 tagValidArray ( // @[Directory.scala 68:31]
    .clock(tagValidArray_clock),
    .reset(tagValidArray_reset),
    .io_r_addr(tagValidArray_io_r_addr),
    .io_r_data(tagValidArray_io_r_data),
    .io_w_en(tagValidArray_io_w_en),
    .io_w_addr(tagValidArray_io_w_addr),
    .io_w_mask(tagValidArray_io_w_mask)
  );
  SRAMTemplate_101 metaArray ( // @[Directory.scala 69:27]
    .clock(metaArray_clock),
    .reset(metaArray_reset),
    .io_r_addr(metaArray_io_r_addr),
    .io_r_data(metaArray_io_r_data),
    .io_w_en(metaArray_io_w_en),
    .io_w_addr(metaArray_io_w_addr),
    .io_w_data(metaArray_io_w_data),
    .io_w_mask(metaArray_io_w_mask)
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
  assign io_read_req_ready = 1'h1; // @[Directory.scala 71:23]
  assign io_read_resp_bits_hit = _rAddr_T ? isHit : io_read_resp_bits_hit_r; // @[Directory.scala 117:33]
  assign io_read_resp_bits_chosenWay = _rAddr_T ? choseWayOH : io_read_resp_bits_chosenWay_r; // @[Directory.scala 116:39]
  assign io_read_resp_bits_isDirtyWay = _rAddr_T ? isDirtyWay : io_read_resp_bits_isDirtyWay_r; // @[Directory.scala 115:40]
  assign io_read_resp_bits_dirtyTag = _rAddr_T ? dirtyTag : io_read_resp_bits_dirtyTag_r; // @[Directory.scala 118:38]
  assign io_write_req_ready = 1'h1; // @[Directory.scala 72:24]
  assign tagArray_clock = clock;
  assign tagArray_reset = reset;
  assign tagArray_io_r_addr = rSet; // @[Directory.scala 76:24]
  assign tagArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagArray_io_w_addr = wSet; // @[Directory.scala 126:24]
  assign tagArray_io_w_data = {_tagArray_io_w_data_T_1,_tagArray_io_w_data_T_1}; // @[Cat.scala 33:92]
  assign tagArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 127:28]
  assign tagValidArray_clock = clock;
  assign tagValidArray_reset = reset;
  assign tagValidArray_io_r_addr = rSet; // @[Directory.scala 81:29]
  assign tagValidArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagValidArray_io_w_addr = wSet; // @[Directory.scala 131:29]
  assign tagValidArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 132:33]
  assign metaArray_clock = clock;
  assign metaArray_reset = reset;
  assign metaArray_io_r_addr = rSet; // @[Directory.scala 87:25]
  assign metaArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign metaArray_io_w_addr = wSet; // @[Directory.scala 136:25]
  assign metaArray_io_w_data = {_metaArray_io_w_data_T_1,_metaArray_io_w_data_T_1}; // @[Cat.scala 33:92]
  assign metaArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 137:29]
  assign replaceWay_lfsr_prng_clock = clock;
  assign replaceWay_lfsr_prng_reset = reset;
  always @(posedge clock) begin
    if (_rAddr_T) begin // @[Reg.scala 20:18]
      rAddr_r <= io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_rAddr_T) begin // @[Reg.scala 20:18]
      wAddr_r <= io_write_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_replaceWayReg_T) begin // @[Reg.scala 20:18]
      replaceWayReg <= replaceWay; // @[Reg.scala 20:22]
    end
    io_read_resp_bits_isDirtyWay_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_isDirtyWay_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_isDirtyWay_r <= isDirtyWay; // @[Reg.scala 20:22]
    end
    io_read_resp_bits_chosenWay_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_chosenWay_REG) begin // @[Reg.scala 20:18]
      if (isHit) begin // @[Directory.scala 104:25]
        io_read_resp_bits_chosenWay_r <= matchWayOH;
      end else if (hasInvalidWay) begin // @[Directory.scala 104:48]
        if (invalidWayVec_0) begin // @[Mux.scala 47:70]
          io_read_resp_bits_chosenWay_r <= 8'h1;
        end else begin
          io_read_resp_bits_chosenWay_r <= _invalidWayOH_T_21;
        end
      end else begin
        io_read_resp_bits_chosenWay_r <= replaceWayReg;
      end
    end
    io_read_resp_bits_hit_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_hit_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_hit_r <= isHit; // @[Reg.scala 20:22]
    end
    io_read_resp_bits_dirtyTag_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_dirtyTag_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_dirtyTag_r <= dirtyTag; // @[Reg.scala 20:22]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_20 < 4'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error directory write way has multiple valid bit! ==>%d\n    at Directory.scala:65 assert(PopCount(wWay) < 2.U, cf\"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}\")\n"
            ,_T_20); // @[Directory.scala 65:11]
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
          $fatal; // @[Directory.scala 65:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_46 & ~(_T_100 == 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error chosenWay has multiple valid bit!\n    at Directory.scala:109 assert(PopCount(choseWayOH) === 1.U, \"Error chosenWay has multiple valid bit!\")\n"
            ); // @[Directory.scala 109:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_100 == 4'h1) & _T_46) begin
          $fatal; // @[Directory.scala 109:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_46 & ~(_T_126 <= 4'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error dirtyWay has multiple valid bit!\n    at Directory.scala:110 assert(PopCount(dirtyWayOH) <= 1.U, \"Error dirtyWay has multiple valid bit!\")\n"
            ); // @[Directory.scala 110:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_126 <= 4'h1) & _T_46) begin
          $fatal; // @[Directory.scala 110:11]
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
  rAddr_r = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  wAddr_r = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  replaceWayReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_REG = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_r = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  io_read_resp_bits_hit_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_read_resp_bits_hit_r = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_read_resp_bits_dirtyTag_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_read_resp_bits_dirtyTag_r = _RAND_10[19:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
