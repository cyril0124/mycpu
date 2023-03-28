module DCacheDirectory_1(
  input         clock,
  input         reset,
  output        io_read_req_ready,
  input         io_read_req_valid,
  input  [31:0] io_read_req_bits_addr,
  output        io_read_resp_valid,
  output        io_read_resp_bits_hit,
  output [3:0]  io_read_resp_bits_chosenWay,
  output        io_read_resp_bits_isDirtyWay,
  output        io_write_req_ready,
  input         io_write_req_valid,
  input  [31:0] io_write_req_bits_addr,
  input  [3:0]  io_write_req_bits_way,
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
`endif // RANDOMIZE_REG_INIT
  wire  tagArray_clock; // @[Directory.scala 67:26]
  wire  tagArray_reset; // @[Directory.scala 67:26]
  wire [7:0] tagArray_io_r_addr; // @[Directory.scala 67:26]
  wire [79:0] tagArray_io_r_data; // @[Directory.scala 67:26]
  wire  tagArray_io_w_en; // @[Directory.scala 67:26]
  wire [7:0] tagArray_io_w_addr; // @[Directory.scala 67:26]
  wire [79:0] tagArray_io_w_data; // @[Directory.scala 67:26]
  wire [3:0] tagArray_io_w_mask; // @[Directory.scala 67:26]
  wire  tagValidArray_clock; // @[Directory.scala 68:31]
  wire  tagValidArray_reset; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_r_addr; // @[Directory.scala 68:31]
  wire [3:0] tagValidArray_io_r_data; // @[Directory.scala 68:31]
  wire  tagValidArray_io_w_en; // @[Directory.scala 68:31]
  wire [7:0] tagValidArray_io_w_addr; // @[Directory.scala 68:31]
  wire [3:0] tagValidArray_io_w_mask; // @[Directory.scala 68:31]
  wire  metaArray_clock; // @[Directory.scala 69:27]
  wire  metaArray_reset; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_r_addr; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_r_data; // @[Directory.scala 69:27]
  wire  metaArray_io_w_en; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_w_addr; // @[Directory.scala 69:27]
  wire [7:0] metaArray_io_w_data; // @[Directory.scala 69:27]
  wire [3:0] metaArray_io_w_mask; // @[Directory.scala 69:27]
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
  wire [1:0] _T_4 = io_write_req_bits_way[0] + io_write_req_bits_way[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_6 = io_write_req_bits_way[2] + io_write_req_bits_way[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_8 = _T_4 + _T_6; // @[Bitwise.scala 51:90]
  wire  _T_22 = ~reset; // @[Directory.scala 65:11]
  wire [79:0] _WIRE_1 = tagArray_io_r_data; // @[Directory.scala 77:{44,44}]
  wire [19:0] tagRdVec_0 = _WIRE_1[19:0]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_1 = _WIRE_1[39:20]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_2 = _WIRE_1[59:40]; // @[Directory.scala 77:44]
  wire [19:0] tagRdVec_3 = _WIRE_1[79:60]; // @[Directory.scala 77:44]
  wire [3:0] _WIRE_3 = tagValidArray_io_r_data; // @[Directory.scala 82:{54,54}]
  wire  tagValidRdVec_0 = _WIRE_3[0]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_1 = _WIRE_3[1]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_2 = _WIRE_3[2]; // @[Directory.scala 82:54]
  wire  tagValidRdVec_3 = _WIRE_3[3]; // @[Directory.scala 82:54]
  wire [7:0] _WIRE_5 = metaArray_io_r_data; // @[Directory.scala 88:{46,46}]
  wire  metaRdVec_0_valid = _WIRE_5[0]; // @[Directory.scala 88:46]
  wire  metaRdVec_0_dirty = _WIRE_5[1]; // @[Directory.scala 88:46]
  wire  metaRdVec_1_valid = _WIRE_5[2]; // @[Directory.scala 88:46]
  wire  metaRdVec_1_dirty = _WIRE_5[3]; // @[Directory.scala 88:46]
  wire  metaRdVec_2_valid = _WIRE_5[4]; // @[Directory.scala 88:46]
  wire  metaRdVec_2_dirty = _WIRE_5[5]; // @[Directory.scala 88:46]
  wire  metaRdVec_3_valid = _WIRE_5[6]; // @[Directory.scala 88:46]
  wire  metaRdVec_3_dirty = _WIRE_5[7]; // @[Directory.scala 88:46]
  wire  tagMatchVec_0 = tagRdVec_0 == rTag & tagValidRdVec_0; // @[Directory.scala 92:79]
  wire  tagMatchVec_1 = tagRdVec_1 == rTag & tagValidRdVec_1; // @[Directory.scala 92:79]
  wire  tagMatchVec_2 = tagRdVec_2 == rTag & tagValidRdVec_2; // @[Directory.scala 92:79]
  wire  tagMatchVec_3 = tagRdVec_3 == rTag & tagValidRdVec_3; // @[Directory.scala 92:79]
  wire  _matchWayOH_T = tagMatchVec_0 & metaRdVec_0_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_1 = tagMatchVec_1 & metaRdVec_1_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_2 = tagMatchVec_2 & metaRdVec_2_valid; // @[Directory.scala 95:77]
  wire  _matchWayOH_T_3 = tagMatchVec_3 & metaRdVec_3_valid; // @[Directory.scala 95:77]
  wire [3:0] matchWayOH = {_matchWayOH_T_3,_matchWayOH_T_2,_matchWayOH_T_1,_matchWayOH_T}; // @[Cat.scala 33:92]
  wire  invalidWayVec_0 = ~metaRdVec_0_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_1 = ~metaRdVec_1_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_2 = ~metaRdVec_2_valid; // @[Directory.scala 96:53]
  wire  invalidWayVec_3 = ~metaRdVec_3_valid; // @[Directory.scala 96:53]
  wire [3:0] _invalidWayOH_T_8 = invalidWayVec_2 ? 4'h4 : 4'h8; // @[Mux.scala 47:70]
  wire [3:0] _invalidWayOH_T_9 = invalidWayVec_1 ? 4'h2 : _invalidWayOH_T_8; // @[Mux.scala 47:70]
  wire [3:0] invalidWayOH = invalidWayVec_0 ? 4'h1 : _invalidWayOH_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hasInvalidWay_T = {invalidWayVec_0,invalidWayVec_1,invalidWayVec_2,invalidWayVec_3}; // @[Cat.scala 33:92]
  wire  hasInvalidWay = |_hasInvalidWay_T; // @[Directory.scala 98:44]
  wire [7:0] replaceWay_lfsr = {replaceWay_lfsr_prng_io_out_7,replaceWay_lfsr_prng_io_out_6,
    replaceWay_lfsr_prng_io_out_5,replaceWay_lfsr_prng_io_out_4,replaceWay_lfsr_prng_io_out_3,
    replaceWay_lfsr_prng_io_out_2,replaceWay_lfsr_prng_io_out_1,replaceWay_lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [1:0] replaceWay_outputWay_shiftAmount = replaceWay_lfsr[1:0]; // @[DCache.scala 61:39]
  wire [3:0] replaceWay = 4'h1 << replaceWay_outputWay_shiftAmount; // @[OneHot.scala 64:12]
  wire  _replaceWayReg_T = ~io_read_req_valid; // @[Directory.scala 100:65]
  reg [3:0] replaceWayReg; // @[Reg.scala 19:16]
  wire  isHit = |matchWayOH; // @[Directory.scala 102:33]
  wire [3:0] _choseWayOH_T = hasInvalidWay ? invalidWayOH : replaceWayReg; // @[Directory.scala 104:48]
  wire [3:0] choseWayOH = isHit ? matchWayOH : _choseWayOH_T; // @[Directory.scala 104:25]
  wire [3:0] _dirtyWayOH_T = {metaRdVec_3_dirty,metaRdVec_2_dirty,metaRdVec_1_dirty,metaRdVec_0_dirty}; // @[Cat.scala 33:92]
  wire [3:0] _dirtyWayOH_T_1 = {metaRdVec_3_valid,metaRdVec_2_valid,metaRdVec_1_valid,metaRdVec_0_valid}; // @[Cat.scala 33:92]
  wire [3:0] dirtyWayOH = _dirtyWayOH_T & _dirtyWayOH_T_1; // @[Directory.scala 105:48]
  wire [3:0] _isDirtyWay_T = choseWayOH & dirtyWayOH; // @[Directory.scala 106:35]
  wire  isDirtyWay = |_isDirtyWay_T; // @[Directory.scala 106:50]
  wire [1:0] _T_44 = choseWayOH[0] + choseWayOH[1]; // @[Bitwise.scala 51:90]
  wire [1:0] _T_46 = choseWayOH[2] + choseWayOH[3]; // @[Bitwise.scala 51:90]
  wire [2:0] _T_48 = _T_44 + _T_46; // @[Bitwise.scala 51:90]
  reg  io_read_resp_valid_REG; // @[Directory.scala 112:34]
  reg  io_read_resp_bits_isDirtyWay_REG; // @[Directory.scala 114:100]
  reg  io_read_resp_bits_isDirtyWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_chosenWay_REG; // @[Directory.scala 115:99]
  reg [3:0] io_read_resp_bits_chosenWay_r; // @[Reg.scala 19:16]
  reg  io_read_resp_bits_hit_REG; // @[Directory.scala 116:83]
  reg  io_read_resp_bits_hit_r; // @[Reg.scala 19:16]
  wire [39:0] _tagArray_io_w_data_T = {wTag,wTag}; // @[Cat.scala 33:92]
  wire [3:0] _metaArray_io_w_data_T = {io_write_req_bits_meta,io_write_req_bits_meta}; // @[Cat.scala 33:92]
  SRAMTemplate_51 tagArray ( // @[Directory.scala 67:26]
    .clock(tagArray_clock),
    .reset(tagArray_reset),
    .io_r_addr(tagArray_io_r_addr),
    .io_r_data(tagArray_io_r_data),
    .io_w_en(tagArray_io_w_en),
    .io_w_addr(tagArray_io_w_addr),
    .io_w_data(tagArray_io_w_data),
    .io_w_mask(tagArray_io_w_mask)
  );
  SRAMTemplate_52 tagValidArray ( // @[Directory.scala 68:31]
    .clock(tagValidArray_clock),
    .reset(tagValidArray_reset),
    .io_r_addr(tagValidArray_io_r_addr),
    .io_r_data(tagValidArray_io_r_data),
    .io_w_en(tagValidArray_io_w_en),
    .io_w_addr(tagValidArray_io_w_addr),
    .io_w_mask(tagValidArray_io_w_mask)
  );
  SRAMTemplate_53 metaArray ( // @[Directory.scala 69:27]
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
    .io_out_7(replaceWay_lfsr_prng_io_out_7)
  );
  assign io_read_req_ready = 1'h1; // @[Directory.scala 71:23]
  assign io_read_resp_valid = io_read_resp_valid_REG; // @[Directory.scala 112:24]
  assign io_read_resp_bits_hit = _rAddr_T ? isHit : io_read_resp_bits_hit_r; // @[Directory.scala 116:33]
  assign io_read_resp_bits_chosenWay = _rAddr_T ? choseWayOH : io_read_resp_bits_chosenWay_r; // @[Directory.scala 115:39]
  assign io_read_resp_bits_isDirtyWay = _rAddr_T ? isDirtyWay : io_read_resp_bits_isDirtyWay_r; // @[Directory.scala 114:40]
  assign io_write_req_ready = 1'h1; // @[Directory.scala 72:24]
  assign tagArray_clock = clock;
  assign tagArray_reset = reset;
  assign tagArray_io_r_addr = rSet; // @[Directory.scala 76:24]
  assign tagArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagArray_io_w_addr = wSet; // @[Directory.scala 125:24]
  assign tagArray_io_w_data = {_tagArray_io_w_data_T,_tagArray_io_w_data_T}; // @[Cat.scala 33:92]
  assign tagArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 126:28]
  assign tagValidArray_clock = clock;
  assign tagValidArray_reset = reset;
  assign tagValidArray_io_r_addr = rSet; // @[Directory.scala 81:29]
  assign tagValidArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign tagValidArray_io_w_addr = wSet; // @[Directory.scala 130:29]
  assign tagValidArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 131:33]
  assign metaArray_clock = clock;
  assign metaArray_reset = reset;
  assign metaArray_io_r_addr = rSet; // @[Directory.scala 87:25]
  assign metaArray_io_w_en = io_write_req_ready & io_write_req_valid; // @[Decoupled.scala 51:35]
  assign metaArray_io_w_addr = wSet; // @[Directory.scala 135:25]
  assign metaArray_io_w_data = {_metaArray_io_w_data_T,_metaArray_io_w_data_T}; // @[Cat.scala 33:92]
  assign metaArray_io_w_mask = io_write_req_bits_way; // @[Directory.scala 136:29]
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
    io_read_resp_valid_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
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
          io_read_resp_bits_chosenWay_r <= 4'h1;
        end else begin
          io_read_resp_bits_chosenWay_r <= _invalidWayOH_T_9;
        end
      end else begin
        io_read_resp_bits_chosenWay_r <= replaceWayReg;
      end
    end
    io_read_resp_bits_hit_REG <= io_read_req_ready & io_read_req_valid; // @[Decoupled.scala 51:35]
    if (io_read_resp_bits_hit_REG) begin // @[Reg.scala 20:18]
      io_read_resp_bits_hit_r <= isHit; // @[Reg.scala 20:22]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_8 < 3'h2)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Error directory write way has multiple valid bit! ==>%d\n    at Directory.scala:65 assert(PopCount(wWay) < 2.U, cf\"Error directory write way has multiple valid bit! ==>${PopCount(wWay)}\")\n"
            ,_T_8); // @[Directory.scala 65:11]
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
        if (_T_22 & ~(_T_48 == 3'h1)) begin
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
        if (~(_T_48 == 3'h1) & _T_22) begin
          $fatal; // @[Directory.scala 109:11]
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
  replaceWayReg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  io_read_resp_valid_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_read_resp_bits_isDirtyWay_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_REG = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_read_resp_bits_chosenWay_r = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  io_read_resp_bits_hit_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_read_resp_bits_hit_r = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
