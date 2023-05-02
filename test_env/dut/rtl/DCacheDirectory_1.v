module DCacheDirectory_1(
  input         clock,
  input         reset,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_bits_hit,
  output [3:0]  io_read_resp_bits_chosenWay,
  output        io_read_resp_bits_isDirtyWay,
  output [18:0] io_read_resp_bits_tagRdVec_0,
  output [18:0] io_read_resp_bits_tagRdVec_1,
  output [18:0] io_read_resp_bits_tagRdVec_2,
  output [18:0] io_read_resp_bits_tagRdVec_3,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [3:0]  io_write_req_bits_way,
  input  [1:0]  io_write_req_bits_meta
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  tagArray_clock; // @[SRAM_1.scala 256:31]
  wire  tagArray_reset; // @[SRAM_1.scala 256:31]
  wire [8:0] tagArray_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire  tagArray_io_w_en; // @[SRAM_1.scala 256:31]
  wire [8:0] tagArray_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [18:0] tagArray_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [3:0] tagArray_io_w_maskOH; // @[SRAM_1.scala 256:31]
  wire  metaArray_clock; // @[SRAM_1.scala 256:31]
  wire  metaArray_reset; // @[SRAM_1.scala 256:31]
  wire [8:0] metaArray_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_r_data_1; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_r_data_2; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_r_data_3; // @[SRAM_1.scala 256:31]
  wire  metaArray_io_w_en; // @[SRAM_1.scala 256:31]
  wire [8:0] metaArray_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_w_data_1; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_w_data_2; // @[SRAM_1.scala 256:31]
  wire [1:0] metaArray_io_w_data_3; // @[SRAM_1.scala 256:31]
  wire [3:0] metaArray_io_w_maskOH; // @[SRAM_1.scala 256:31]
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
  wire [8:0] rSet = io_read_req_bits_addr[12:4]; // @[Parameters.scala 50:11]
  wire [18:0] rTag = io_read_req_bits_addr[31:13]; // @[Parameters.scala 46:11]
  wire [8:0] wSet = io_write_req_bits_addr[12:4]; // @[Parameters.scala 50:11]
  wire [18:0] wTag = io_write_req_bits_addr[31:13]; // @[Parameters.scala 46:11]
  wire  wen = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _T_4 = io_write_req_bits_way[0] + io_write_req_bits_way[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_6 = io_write_req_bits_way[2] + io_write_req_bits_way[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_8 = _T_4 + _T_6; // @[Bitwise.scala 51:90]
  wire  _T_22 = ~reset; // @[Directory.scala 69:11]
  wire [7:0] _T_24 = {metaArray_io_r_data_3,metaArray_io_r_data_2,metaArray_io_r_data_1,metaArray_io_r_data_0}; // @[Directory.scala 82:52]
  wire  metaRdVec_0_valid = _T_24[0]; // @[Directory.scala 82:52]
  wire  metaRdVec_0_dirty = _T_24[1]; // @[Directory.scala 82:52]
  wire  metaRdVec_1_valid = _T_24[2]; // @[Directory.scala 82:52]
  wire  metaRdVec_1_dirty = _T_24[3]; // @[Directory.scala 82:52]
  wire  metaRdVec_2_valid = _T_24[4]; // @[Directory.scala 82:52]
  wire  metaRdVec_2_dirty = _T_24[5]; // @[Directory.scala 82:52]
  wire  metaRdVec_3_valid = _T_24[6]; // @[Directory.scala 82:52]
  wire  metaRdVec_3_dirty = _T_24[7]; // @[Directory.scala 82:52]
  wire [18:0] tagRdVec_0 = tagArray_io_r_data_0; // @[Directory.scala 78:34 79:14]
  wire  tagMatchVec_0 = tagRdVec_0 == rTag; // @[Directory.scala 85:46]
  wire [18:0] tagRdVec_1 = tagArray_io_r_data_1; // @[Directory.scala 78:34 79:14]
  wire  tagMatchVec_1 = tagRdVec_1 == rTag; // @[Directory.scala 85:46]
  wire [18:0] tagRdVec_2 = tagArray_io_r_data_2; // @[Directory.scala 78:34 79:14]
  wire  tagMatchVec_2 = tagRdVec_2 == rTag; // @[Directory.scala 85:46]
  wire [18:0] tagRdVec_3 = tagArray_io_r_data_3; // @[Directory.scala 78:34 79:14]
  wire  tagMatchVec_3 = tagRdVec_3 == rTag; // @[Directory.scala 85:46]
  wire  _matchWayOH_T = tagMatchVec_0 & metaRdVec_0_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_1 = tagMatchVec_1 & metaRdVec_1_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_2 = tagMatchVec_2 & metaRdVec_2_valid; // @[Directory.scala 88:80]
  wire  _matchWayOH_T_3 = tagMatchVec_3 & metaRdVec_3_valid; // @[Directory.scala 88:80]
  wire [3:0] matchWayOH = {_matchWayOH_T_3,_matchWayOH_T_2,_matchWayOH_T_1,_matchWayOH_T}; // @[Cat.scala 33:92]
  wire  invalidWayVec_0 = ~metaRdVec_0_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_1 = ~metaRdVec_1_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_2 = ~metaRdVec_2_valid; // @[Directory.scala 89:53]
  wire  invalidWayVec_3 = ~metaRdVec_3_valid; // @[Directory.scala 89:53]
  wire [3:0] _invalidWayOH_T_8 = invalidWayVec_2 ? 4'h4 : 4'h8; // @[Mux.scala 47:70]
  wire [3:0] _invalidWayOH_T_9 = invalidWayVec_1 ? 4'h2 : _invalidWayOH_T_8; // @[Mux.scala 47:70]
  wire [3:0] invalidWayOH = invalidWayVec_0 ? 4'h1 : _invalidWayOH_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hasInvalidWay_T = {invalidWayVec_0,invalidWayVec_1,invalidWayVec_2,invalidWayVec_3}; // @[Cat.scala 33:92]
  wire  hasInvalidWay = |_hasInvalidWay_T; // @[Directory.scala 91:44]
  wire [7:0] replaceWay_lfsr = {replaceWay_lfsr_prng_io_out_7,replaceWay_lfsr_prng_io_out_6,
    replaceWay_lfsr_prng_io_out_5,replaceWay_lfsr_prng_io_out_4,replaceWay_lfsr_prng_io_out_3,
    replaceWay_lfsr_prng_io_out_2,replaceWay_lfsr_prng_io_out_1,replaceWay_lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [1:0] replaceWay_outputWay_shiftAmount = replaceWay_lfsr[1:0]; // @[DCache.scala 61:39]
  wire [3:0] replaceWay = 4'h1 << replaceWay_outputWay_shiftAmount; // @[OneHot.scala 64:12]
  wire  _replaceWayReg_T = ~io_read_req_valid; // @[Directory.scala 93:65]
  reg [3:0] replaceWayReg; // @[Reg.scala 19:16]
  wire  isHit = |matchWayOH; // @[Directory.scala 95:41]
  wire [3:0] _choseWayOH_T = hasInvalidWay ? invalidWayOH : replaceWayReg; // @[Directory.scala 96:51]
  wire [3:0] choseWayOH = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 96:28]
  wire [3:0] dirtyWayOH = {metaRdVec_3_dirty,metaRdVec_2_dirty,metaRdVec_1_dirty,metaRdVec_0_dirty}; // @[Cat.scala 33:92]
  wire [3:0] _isDirtyWay_T = choseWayOH & dirtyWayOH; // @[Directory.scala 98:38]
  wire [1:0] _T_37 = choseWayOH[0] + choseWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_39 = choseWayOH[2] + choseWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_41 = _T_37 + _T_39; // @[Bitwise.scala 51:90]
  SRAMArray_2P_14 tagArray ( // @[SRAM_1.scala 256:31]
    .clock(tagArray_clock),
    .reset(tagArray_reset),
    .io_r_addr(tagArray_io_r_addr),
    .io_r_data_0(tagArray_io_r_data_0),
    .io_r_data_1(tagArray_io_r_data_1),
    .io_r_data_2(tagArray_io_r_data_2),
    .io_r_data_3(tagArray_io_r_data_3),
    .io_w_en(tagArray_io_w_en),
    .io_w_addr(tagArray_io_w_addr),
    .io_w_data_0(tagArray_io_w_data_0),
    .io_w_data_1(tagArray_io_w_data_1),
    .io_w_data_2(tagArray_io_w_data_2),
    .io_w_data_3(tagArray_io_w_data_3),
    .io_w_maskOH(tagArray_io_w_maskOH)
  );
  SRAMArray_2P_15 metaArray ( // @[SRAM_1.scala 256:31]
    .clock(metaArray_clock),
    .reset(metaArray_reset),
    .io_r_addr(metaArray_io_r_addr),
    .io_r_data_0(metaArray_io_r_data_0),
    .io_r_data_1(metaArray_io_r_data_1),
    .io_r_data_2(metaArray_io_r_data_2),
    .io_r_data_3(metaArray_io_r_data_3),
    .io_w_en(metaArray_io_w_en),
    .io_w_addr(metaArray_io_w_addr),
    .io_w_data_0(metaArray_io_w_data_0),
    .io_w_data_1(metaArray_io_w_data_1),
    .io_w_data_2(metaArray_io_w_data_2),
    .io_w_data_3(metaArray_io_w_data_3),
    .io_w_maskOH(metaArray_io_w_maskOH)
  );
  MaxPeriodFibonacciLFSR_1 replaceWay_lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(replaceWay_lfsr_prng_clock),
    .reset(replaceWay_lfsr_prng_reset),
    .io_out_0(replaceWay_lfsr_prng_io_out_0),
    .io_out_1(replaceWay_lfsr_prng_io_out_1),
    .io_out_2(replaceWay_lfsr_prng_io_out_2),
    .io_out_3(replaceWay_lfsr_prng_io_out_3),
    .io_out_4(replaceWay_lfsr_prng_io_out_4),
    .io_out_5(replaceWay_lfsr_prng_io_out_5),
    .io_out_6(replaceWay_lfsr_prng_io_out_6),
    .io_out_7(replaceWay_lfsr_prng_io_out_7)
  );
  assign io_read_resp_bits_hit = |matchWayOH; // @[Directory.scala 95:41]
  assign io_read_resp_bits_chosenWay = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 96:28]
  assign io_read_resp_bits_isDirtyWay = |_isDirtyWay_T; // @[Directory.scala 98:53]
  assign io_read_resp_bits_tagRdVec_0 = tagArray_io_r_data_0; // @[Directory.scala 78:34 79:14]
  assign io_read_resp_bits_tagRdVec_1 = tagArray_io_r_data_1; // @[Directory.scala 78:34 79:14]
  assign io_read_resp_bits_tagRdVec_2 = tagArray_io_r_data_2; // @[Directory.scala 78:34 79:14]
  assign io_read_resp_bits_tagRdVec_3 = tagArray_io_r_data_3; // @[Directory.scala 78:34 79:14]
  assign io_write_req_ready = 1'h1; // @[Directory.scala 76:29]
  assign tagArray_clock = clock;
  assign tagArray_reset = reset;
  assign tagArray_io_r_addr = rSet; // @[SRAM_1.scala 245:19]
  assign tagArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagArray_io_w_addr = wSet; // @[Directory.scala 112:15 SRAM_1.scala 238:19]
  assign tagArray_io_w_data_0 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign tagArray_io_w_data_1 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign tagArray_io_w_data_2 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign tagArray_io_w_data_3 = wTag; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign tagArray_io_w_maskOH = io_write_req_bits_way; // @[Directory.scala 112:15 SRAM_1.scala 240:21]
  assign metaArray_clock = clock;
  assign metaArray_reset = reset;
  assign metaArray_io_r_addr = rSet; // @[SRAM_1.scala 245:19]
  assign metaArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign metaArray_io_w_addr = wSet; // @[Directory.scala 112:15 SRAM_1.scala 238:19]
  assign metaArray_io_w_data_0 = io_write_req_bits_meta; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign metaArray_io_w_data_1 = io_write_req_bits_meta; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign metaArray_io_w_data_2 = io_write_req_bits_meta; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign metaArray_io_w_data_3 = io_write_req_bits_meta; // @[Directory.scala 112:15 SRAM_1.scala 239:35]
  assign metaArray_io_w_maskOH = io_write_req_bits_way; // @[Directory.scala 112:15 SRAM_1.scala 240:21]
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
        if (~reset & ~(_T_8 < 3'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error directory write way has multiple valid bit! ==>%d\n    at Directory.scala:69 assert(PopCount(wWay) < 2.U, cf\"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}\")\n"
            ,_T_8); // @[Directory.scala 69:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_8 < 3'h2) & ~reset) begin
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
        if (_T_22 & ~(_T_41 == 3'h1)) begin
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
        if (~(_T_41 == 3'h1) & _T_22) begin
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
        if (wen & _T_22 & ~(_T_8 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:236 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 236:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_8 <= 3'h1) & (wen & _T_22)) begin
          $fatal; // @[SRAM_1.scala 236:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wen & _T_22 & ~(_T_8 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: write error, tring to write multiple ways\n    at SRAM_1.scala:236 assert(PopCount(mask) <= 1.U, \"write error, tring to write multiple ways\")\n"
            ); // @[SRAM_1.scala 236:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_8 <= 3'h1) & (wen & _T_22)) begin
          $fatal; // @[SRAM_1.scala 236:15]
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
  replaceWayReg = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
