module LSUStage_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [4:0]  io_in_bits_lsuOp,
  input  [2:0]  io_in_bits_immSrc,
  input  [31:0] io_in_bits_rs1Val,
  input  [31:0] io_in_bits_rs2Val,
  input  [31:0] io_in_bits_inst,
  input  [7:0]  io_in_bits_id,
  output        io_out_valid,
  output [4:0]  io_out_bits_rd,
  output [31:0] io_out_bits_data,
  output [7:0]  io_out_bits_id,
  input         io_cache_read_req_ready,
  output        io_cache_read_req_valid,
  output [31:0] io_cache_read_req_bits_addr,
  output        io_cache_read_resp_ready,
  input         io_cache_read_resp_valid,
  input  [31:0] io_cache_read_resp_bits_data,
  input         io_cache_write_req_ready,
  output        io_cache_write_req_valid,
  output [31:0] io_cache_write_req_bits_addr,
  output [31:0] io_cache_write_req_bits_data,
  output [3:0]  io_cache_write_req_bits_mask,
  output        io_cache_write_resp_ready,
  input         io_cache_write_resp_valid,
  input         io_flush
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] immGen_io_inst; // @[LSU.scala 270:24]
  wire [2:0] immGen_io_immSrc; // @[LSU.scala 270:24]
  wire  immGen_io_immSign; // @[LSU.scala 270:24]
  wire [31:0] immGen_io_imm; // @[LSU.scala 270:24]
  reg  s0_full; // @[LSU.scala 262:26]
  reg [4:0] s0_info_lsuOp; // @[Reg.scala 19:16]
  wire  _s0_valid_T_1 = s0_info_lsuOp == 5'h14; // @[LSU.scala 278:75]
  wire  s0_valid = s0_full & (s0_info_lsuOp != 5'h14 | s0_info_lsuOp == 5'h14 & io_out_valid); // @[LSU.scala 278:25]
  reg  s1_full; // @[LSU.scala 285:26]
  reg  s2_full; // @[LSU.scala 352:26]
  wire  _s2_loadRespValid_T = io_cache_read_resp_ready & io_cache_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  s2_loadRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s2_loadRespValid = _s2_loadRespValid_T ? io_cache_read_resp_valid : s2_loadRespValid_holdReg; // @[util.scala 26:12]
  wire  _s2_storeRespValid_T = io_cache_write_resp_ready & io_cache_write_resp_valid; // @[Decoupled.scala 51:35]
  reg  s2_storeRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s2_storeRespValid = _s2_storeRespValid_T ? io_cache_write_resp_valid : s2_storeRespValid_holdReg; // @[util.scala 26:12]
  wire  s2_valid = s2_full & (s2_loadRespValid | s2_storeRespValid); // @[LSU.scala 387:25]
  wire  s2_fire = s2_valid & io_out_valid; // @[LSU.scala 353:28]
  wire  s2_ready = ~s2_full | s2_fire; // @[LSU.scala 361:26]
  wire  s1_ready = ~s1_full & s2_ready; // @[LSU.scala 296:30]
  wire  s0_fire = s0_valid & s1_ready; // @[LSU.scala 263:28]
  wire  s0_ready = ~s0_full | s0_fire; // @[LSU.scala 265:26]
  wire  s0_latch = io_in_valid & s0_ready; // @[LSU.scala 261:32]
  reg [2:0] s0_info_immSrc; // @[Reg.scala 19:16]
  reg [31:0] s0_info_rs1Val; // @[Reg.scala 19:16]
  reg [31:0] s0_info_rs2Val; // @[Reg.scala 19:16]
  reg [31:0] s0_info_inst; // @[Reg.scala 19:16]
  reg [7:0] s0_info_id; // @[Reg.scala 19:16]
  wire  _GEN_6 = s0_fire & s0_full ? 1'h0 : s0_full; // @[LSU.scala 262:26 268:{35,45}]
  wire  _GEN_7 = s0_latch | _GEN_6; // @[LSU.scala 267:{20,30}]
  wire [31:0] s0_addr = immGen_io_imm + s0_info_rs1Val; // @[LSU.scala 276:26]
  wire  _s1_valid_T = io_cache_read_req_ready & io_cache_read_req_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_1 = io_cache_write_req_ready & io_cache_write_req_valid; // @[Decoupled.scala 51:35]
  reg  s1_reqSend; // @[LSU.scala 321:29]
  wire  _s1_valid_T_3 = _s1_valid_T | _s1_valid_T_1 | s1_reqSend; // @[LSU.scala 345:79]
  wire  s1_valid = s1_full & (_s1_valid_T | _s1_valid_T_1 | s1_reqSend); // @[LSU.scala 345:25]
  wire  s1_fire = s1_valid & s2_ready; // @[LSU.scala 286:28]
  wire [4:0] rd = s0_info_inst[11:7]; // @[util.scala 71:31]
  reg [4:0] s1_rd; // @[Reg.scala 19:16]
  reg [4:0] s1_lsuOp; // @[Reg.scala 19:16]
  reg [31:0] s1_rs2Val; // @[Reg.scala 19:16]
  reg [31:0] s1_addr; // @[Reg.scala 19:16]
  wire [1:0] s1_offset = s1_addr[1:0]; // @[LSU.scala 294:28]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_13 = s1_fire & s1_full ? 1'h0 : s1_full; // @[LSU.scala 285:26 301:{35,45}]
  wire  _GEN_14 = s0_fire | _GEN_13; // @[LSU.scala 300:{20,30}]
  wire  _T_3 = 5'h1 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_5 = 5'h2 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_7 = 5'h3 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_9 = 5'h4 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_11 = 5'h5 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h6 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h7 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_17 = 5'h8 == s1_lsuOp; // @[Lookup.scala 31:38]
  wire  s1_en = _T_3 | (_T_5 | (_T_7 | (_T_9 | (_T_11 | (_T_13 | (_T_15 | _T_17)))))); // @[Lookup.scala 34:39]
  wire  _T_32 = _T_11 ? 1'h0 : _T_13 | (_T_15 | _T_17); // @[Lookup.scala 34:39]
  wire  _T_33 = _T_9 ? 1'h0 : _T_32; // @[Lookup.scala 34:39]
  wire  _T_34 = _T_7 ? 1'h0 : _T_33; // @[Lookup.scala 34:39]
  wire  _T_35 = _T_5 ? 1'h0 : _T_34; // @[Lookup.scala 34:39]
  wire  s1_wen = _T_3 ? 1'h0 : _T_35; // @[Lookup.scala 34:39]
  wire  s1_load = _T_3 | (_T_5 | (_T_7 | (_T_9 | _T_11))); // @[Lookup.scala 34:39]
  wire [1:0] _T_45 = _T_17 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_46 = _T_15 ? 2'h1 : _T_45; // @[Lookup.scala 34:39]
  wire [1:0] _T_47 = _T_13 ? 2'h0 : _T_46; // @[Lookup.scala 34:39]
  wire [1:0] _T_48 = _T_11 ? 2'h1 : _T_47; // @[Lookup.scala 34:39]
  wire [1:0] _T_49 = _T_9 ? 2'h0 : _T_48; // @[Lookup.scala 34:39]
  wire [1:0] _T_50 = _T_7 ? 2'h2 : _T_49; // @[Lookup.scala 34:39]
  wire [1:0] _T_51 = _T_5 ? 2'h1 : _T_50; // @[Lookup.scala 34:39]
  wire [1:0] s1_width = _T_3 ? 2'h0 : _T_51; // @[Lookup.scala 34:39]
  wire  s1_signed = _T_3 | (_T_5 | (_T_7 | _T_33)); // @[Lookup.scala 34:39]
  wire  _io_cache_read_req_valid_T_1 = ~s1_reqSend; // @[LSU.scala 326:54]
  wire  _io_cache_read_req_valid_T_3 = ~io_flush; // @[LSU.scala 326:69]
  wire [4:0] _io_cache_write_req_bits_data_T = {s1_offset, 3'h0}; // @[LSU.scala 331:60]
  wire [62:0] _GEN_0 = {{31'd0}, s1_rs2Val}; // @[LSU.scala 331:46]
  wire [62:0] _io_cache_write_req_bits_data_T_1 = _GEN_0 << _io_cache_write_req_bits_data_T; // @[LSU.scala 331:46]
  wire [3:0] _s1_storeMask_T_1 = 4'h1 << s1_offset; // @[OneHot.scala 57:35]
  wire [2:0] _s1_storeMask_T_6 = 2'h1 == s1_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_8 = 2'h2 == s1_offset ? 4'hc : {{1'd0}, _s1_storeMask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_10 = 2'h0 == s1_width ? _s1_storeMask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_12 = 2'h1 == s1_width ? _s1_storeMask_T_8 : _s1_storeMask_T_10; // @[Mux.scala 81:58]
  reg [4:0] s2_rd; // @[Reg.scala 19:16]
  reg  s2_load; // @[Reg.scala 19:16]
  reg  s2_en; // @[Reg.scala 19:16]
  reg  s2_signed; // @[Reg.scala 19:16]
  reg [1:0] s2_width; // @[Reg.scala 19:16]
  reg [1:0] s2_offset; // @[Reg.scala 19:16]
  reg [7:0] s2_id; // @[Reg.scala 19:16]
  wire  _GEN_24 = s2_fire & s2_full ? 1'h0 : s2_full; // @[LSU.scala 352:26 364:{35,45}]
  wire  _GEN_25 = s1_fire | _GEN_24; // @[LSU.scala 363:{20,30}]
  reg [31:0] s2_loadResp_holdReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_26 = _s2_loadRespValid_T ? io_cache_read_resp_bits_data : s2_loadResp_holdReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s2_loadDataRaw_T_2 = {8'h0,_GEN_26[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_5 = {16'h0,_GEN_26[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_8 = {24'h0,_GEN_26[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_10 = 2'h1 == s2_offset ? _s2_loadDataRaw_T_2 : _GEN_26; // @[Mux.scala 81:58]
  wire [31:0] _s2_loadDataRaw_T_12 = 2'h2 == s2_offset ? _s2_loadDataRaw_T_5 : _s2_loadDataRaw_T_10; // @[Mux.scala 81:58]
  wire [31:0] s2_loadDataRaw = 2'h3 == s2_offset ? _s2_loadDataRaw_T_8 : _s2_loadDataRaw_T_12; // @[Mux.scala 81:58]
  wire [7:0] _s2_loadData_T_1 = s2_loadDataRaw[7:0]; // @[LSU.scala 381:88]
  wire  s2_loadData_signBit = _s2_loadData_T_1[7]; // @[util.scala 42:27]
  wire [5:0] s2_loadData_out_lo_lo = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit}; // @[Cat.scala 33:92]
  wire [11:0] s2_loadData_out_lo = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit,s2_loadData_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _s2_loadData_out_T_1 = s2_loadDataRaw[7:0]; // @[util.scala 46:75]
  wire [31:0] s2_loadData_out = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit,s2_loadData_out_lo_lo,s2_loadData_out_lo,_s2_loadData_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] s2_loadData_out_1 = {{24'd0}, s2_loadDataRaw[7:0]}; // @[util.scala 62:36]
  wire [31:0] _s2_loadData_T_3 = s2_signed ? s2_loadData_out : s2_loadData_out_1; // @[LSU.scala 381:48]
  wire [15:0] _s2_loadData_T_5 = s2_loadDataRaw[15:0]; // @[LSU.scala 382:89]
  wire  s2_loadData_signBit_1 = _s2_loadData_T_5[15]; // @[util.scala 42:27]
  wire [7:0] s2_loadData_out_lo_1 = {s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _s2_loadData_out_T_3 = s2_loadDataRaw[15:0]; // @[util.scala 46:75]
  wire [31:0] s2_loadData_out_2 = {s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_out_lo_1,_s2_loadData_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] s2_loadData_out_3 = {{16'd0}, s2_loadDataRaw[15:0]}; // @[util.scala 62:36]
  wire [31:0] _s2_loadData_T_7 = s2_signed ? s2_loadData_out_2 : s2_loadData_out_3; // @[LSU.scala 382:48]
  wire [31:0] _s2_loadData_T_10 = 2'h3 == s2_offset ? _s2_loadDataRaw_T_8 : _s2_loadDataRaw_T_12; // @[util.scala 44:18]
  wire [31:0] _s2_loadData_T_12 = s2_signed ? _s2_loadData_T_10 : s2_loadDataRaw; // @[LSU.scala 383:48]
  wire [31:0] _s2_loadData_T_14 = 2'h0 == s2_width ? _s2_loadData_T_3 : s2_loadDataRaw; // @[Mux.scala 81:58]
  wire [31:0] _s2_loadData_T_16 = 2'h1 == s2_width ? _s2_loadData_T_7 : _s2_loadData_T_14; // @[Mux.scala 81:58]
  wire  s0_fence = s0_full & _s0_valid_T_1; // @[LSU.scala 389:28]
  ImmGen immGen ( // @[LSU.scala 270:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = ~s0_full | s0_fire; // @[LSU.scala 265:26]
  assign io_out_valid = s2_valid & s2_en | s0_fence; // @[LSU.scala 390:39]
  assign io_out_bits_rd = s2_rd; // @[LSU.scala 391:20]
  assign io_out_bits_data = 2'h2 == s2_width ? _s2_loadData_T_12 : _s2_loadData_T_16; // @[Mux.scala 81:58]
  assign io_out_bits_id = s0_fence ? s0_info_id : s2_id; // @[LSU.scala 393:26]
  assign io_cache_read_req_valid = s1_load & s1_full & ~s1_reqSend & ~io_flush; // @[LSU.scala 326:66]
  assign io_cache_read_req_bits_addr = {s1_addr[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_read_resp_ready = s2_load; // @[LSU.scala 366:30]
  assign io_cache_write_req_valid = s1_wen & s1_full & _io_cache_read_req_valid_T_1 & _io_cache_read_req_valid_T_3; // @[LSU.scala 329:66]
  assign io_cache_write_req_bits_addr = {s1_addr[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_write_req_bits_data = _io_cache_write_req_bits_data_T_1[31:0]; // @[LSU.scala 331:34]
  assign io_cache_write_req_bits_mask = 2'h2 == s1_width ? 4'hf : _s1_storeMask_T_12; // @[Mux.scala 81:58]
  assign io_cache_write_resp_ready = ~s2_load; // @[LSU.scala 367:34]
  assign immGen_io_inst = s0_info_inst; // @[LSU.scala 274:20]
  assign immGen_io_immSrc = s0_info_immSrc; // @[LSU.scala 272:22]
  assign immGen_io_immSign = 1'h1; // @[LSU.scala 273:23]
  always @(posedge clock) begin
    if (reset) begin // @[LSU.scala 262:26]
      s0_full <= 1'h0; // @[LSU.scala 262:26]
    end else if (io_flush) begin // @[LSU.scala 396:20]
      s0_full <= 1'h0; // @[LSU.scala 397:17]
    end else begin
      s0_full <= _GEN_7;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_lsuOp <= io_in_bits_lsuOp; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[LSU.scala 285:26]
      s1_full <= 1'h0; // @[LSU.scala 285:26]
    end else if (io_flush) begin // @[LSU.scala 396:20]
      s1_full <= 1'h0; // @[LSU.scala 398:17]
    end else begin
      s1_full <= _GEN_14;
    end
    if (reset) begin // @[LSU.scala 352:26]
      s2_full <= 1'h0; // @[LSU.scala 352:26]
    end else if (io_flush) begin // @[LSU.scala 396:20]
      s2_full <= 1'h0; // @[LSU.scala 399:17]
    end else begin
      s2_full <= _GEN_25;
    end
    if (s1_fire) begin // @[util.scala 25:21]
      s2_loadRespValid_holdReg <= 1'h0; // @[util.scala 25:31]
    end else if (_s2_loadRespValid_T) begin // @[util.scala 26:12]
      s2_loadRespValid_holdReg <= io_cache_read_resp_valid;
    end
    if (s1_fire) begin // @[util.scala 25:21]
      s2_storeRespValid_holdReg <= 1'h0; // @[util.scala 25:31]
    end else if (_s2_storeRespValid_T) begin // @[util.scala 26:12]
      s2_storeRespValid_holdReg <= io_cache_write_resp_valid;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_immSrc <= io_in_bits_immSrc; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_rs1Val <= io_in_bits_rs1Val; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_rs2Val <= io_in_bits_rs2Val; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_inst <= io_in_bits_inst; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_id <= io_in_bits_id; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[LSU.scala 321:29]
      s1_reqSend <= 1'h0; // @[LSU.scala 321:29]
    end else if (s1_fire) begin // @[LSU.scala 322:19]
      s1_reqSend <= 1'h0; // @[LSU.scala 322:32]
    end else begin
      s1_reqSend <= _s1_valid_T_3;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (s0_info_lsuOp == 5'h8 | s0_info_lsuOp == 5'h7 | s0_info_lsuOp == 5'h6 | _s0_valid_T_1) begin // @[LSU.scala 289:30]
        s1_rd <= 5'h0;
      end else begin
        s1_rd <= rd;
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_lsuOp <= s0_info_lsuOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rs2Val <= s0_info_rs2Val; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_addr <= s0_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_id <= s0_info_id; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_rd <= s1_rd; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_load <= s1_load; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_en <= s1_en; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_signed <= s1_signed; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      if (_T_3) begin // @[Lookup.scala 34:39]
        s2_width <= 2'h0;
      end else if (_T_5) begin // @[Lookup.scala 34:39]
        s2_width <= 2'h1;
      end else if (_T_7) begin // @[Lookup.scala 34:39]
        s2_width <= 2'h2;
      end else begin
        s2_width <= _T_49;
      end
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_offset <= s1_offset; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_id <= s1_id; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[util.scala 25:21]
      s2_loadResp_holdReg_data <= 32'h0; // @[util.scala 25:31]
    end else if (_s2_loadRespValid_T) begin // @[Reg.scala 20:18]
      s2_loadResp_holdReg_data <= io_cache_read_resp_bits_data; // @[Reg.scala 20:22]
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
  s0_info_lsuOp = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  s1_full = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s2_full = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s2_loadRespValid_holdReg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s2_storeRespValid_holdReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s0_info_immSrc = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  s0_info_rs1Val = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s0_info_rs2Val = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s0_info_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s0_info_id = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  s1_reqSend = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_rd = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  s1_lsuOp = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  s1_rs2Val = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_addr = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_id = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  s2_rd = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  s2_load = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_en = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s2_signed = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  s2_width = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  s2_offset = _RAND_22[1:0];
  _RAND_23 = {1{`RANDOM}};
  s2_id = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  s2_loadResp_holdReg_data = _RAND_24[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
