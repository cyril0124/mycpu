module LSUStage(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [4:0]  io_in_bits_lsuOp,
  input  [2:0]  io_in_bits_immSrc,
  input  [31:0] io_in_bits_inst,
  input  [31:0] io_in_bits_pc,
  input  [7:0]  io_in_bits_id,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [4:0]  io_out_bits_rd,
  output        io_out_bits_wrEn,
  output [31:0] io_out_bits_inst,
  output [31:0] io_out_bits_pc,
  output [7:0]  io_out_bits_id,
  output [4:0]  io_rfRd_0_addr,
  output        io_rfRd_0_en,
  input  [31:0] io_rfRd_0_data,
  output [4:0]  io_rfRd_1_addr,
  input  [31:0] io_rfRd_1_data,
  input         io_rfRdReady,
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
  reg [31:0] _RAND_25;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] immGen_io_inst; // @[LSU.scala 86:24]
  wire [2:0] immGen_io_immSrc; // @[LSU.scala 86:24]
  wire  immGen_io_immSign; // @[LSU.scala 86:24]
  wire [31:0] immGen_io_imm; // @[LSU.scala 86:24]
  reg  s0_full; // @[LSU.scala 63:26]
  reg [4:0] s0_info_lsuOp; // @[Reg.scala 19:16]
  wire  _s0_valid_T_2 = s0_info_lsuOp == 5'h14; // @[LSU.scala 94:93]
  wire  _s0_valid_T_3 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  s0_valid = s0_full & (s0_info_lsuOp != 5'h14 & io_rfRdReady | s0_info_lsuOp == 5'h14 & _s0_valid_T_3); // @[LSU.scala 94:25]
  reg  s1_full; // @[LSU.scala 101:26]
  wire  _s1_valid_T = io_cache_read_req_ready & io_cache_read_req_valid; // @[Decoupled.scala 51:35]
  wire  _s1_valid_T_1 = io_cache_write_req_ready & io_cache_write_req_valid; // @[Decoupled.scala 51:35]
  reg  s1_reqSend; // @[LSU.scala 136:29]
  wire  _s1_valid_T_3 = _s1_valid_T | _s1_valid_T_1 | s1_reqSend; // @[LSU.scala 160:79]
  wire  s1_valid = s1_full & (_s1_valid_T | _s1_valid_T_1 | s1_reqSend); // @[LSU.scala 160:25]
  reg  s2_full; // @[LSU.scala 167:26]
  wire  _s2_loadRespValid_T = io_cache_read_resp_ready & io_cache_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  s2_loadRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s2_loadRespValid = _s2_loadRespValid_T ? io_cache_read_resp_valid : s2_loadRespValid_holdReg; // @[util.scala 26:12]
  wire  _s2_storeRespValid_T = io_cache_write_resp_ready & io_cache_write_resp_valid; // @[Decoupled.scala 51:35]
  reg  s2_storeRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s2_storeRespValid = _s2_storeRespValid_T ? io_cache_write_resp_valid : s2_storeRespValid_holdReg; // @[util.scala 26:12]
  wire  s2_valid = s2_full & (s2_loadRespValid | s2_storeRespValid); // @[LSU.scala 204:25]
  wire  s2_fire = s2_valid & io_out_ready; // @[LSU.scala 168:28]
  wire  s2_ready = ~s2_full | s2_fire; // @[LSU.scala 178:26]
  wire  s1_fire = s1_valid & s2_ready; // @[LSU.scala 102:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[LSU.scala 113:26]
  wire  s0_fire = s0_valid & s1_ready; // @[LSU.scala 64:28]
  wire  s0_ready = ~s0_full | s0_fire; // @[LSU.scala 66:26]
  wire  s0_latch = io_in_valid & s0_ready; // @[LSU.scala 62:32]
  reg [2:0] s0_info_immSrc; // @[Reg.scala 19:16]
  reg [31:0] s0_info_inst; // @[Reg.scala 19:16]
  reg [31:0] s0_info_pc; // @[Reg.scala 19:16]
  reg [7:0] s0_info_id; // @[Reg.scala 19:16]
  wire  _GEN_7 = s0_fire & s0_full ? 1'h0 : s0_full; // @[LSU.scala 63:26 69:{35,45}]
  wire  _GEN_8 = s0_latch | _GEN_7; // @[LSU.scala 68:{20,30}]
  wire [31:0] s0_addr = immGen_io_imm + io_rfRd_0_data; // @[LSU.scala 92:26]
  reg [4:0] s1_lsuOp; // @[Reg.scala 19:16]
  reg [31:0] s1_rsValVec_1; // @[Reg.scala 19:16]
  reg [31:0] s1_addr; // @[Reg.scala 19:16]
  reg [31:0] s1_pc; // @[Reg.scala 19:16]
  reg [31:0] s1_inst; // @[Reg.scala 19:16]
  wire [1:0] s1_offset = s1_addr[1:0]; // @[LSU.scala 111:28]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_18 = s1_fire & s1_full ? 1'h0 : s1_full; // @[LSU.scala 101:26 116:{35,45}]
  wire  _GEN_19 = s0_fire | _GEN_18; // @[LSU.scala 115:{20,30}]
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
  wire  _io_cache_read_req_valid_T_1 = ~s1_reqSend; // @[LSU.scala 141:54]
  wire  _io_cache_read_req_valid_T_3 = ~io_flush; // @[LSU.scala 141:69]
  wire [4:0] _io_cache_write_req_bits_data_T = {s1_offset, 3'h0}; // @[LSU.scala 146:60]
  wire [62:0] _GEN_0 = {{31'd0}, s1_rsValVec_1}; // @[LSU.scala 146:46]
  wire [62:0] _io_cache_write_req_bits_data_T_1 = _GEN_0 << _io_cache_write_req_bits_data_T; // @[LSU.scala 146:46]
  wire [3:0] _s1_storeMask_T_1 = 4'h1 << s1_offset; // @[OneHot.scala 57:35]
  wire [2:0] _s1_storeMask_T_6 = 2'h1 == s1_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_8 = 2'h2 == s1_offset ? 4'hc : {{1'd0}, _s1_storeMask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_10 = 2'h0 == s1_width ? _s1_storeMask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _s1_storeMask_T_12 = 2'h1 == s1_width ? _s1_storeMask_T_8 : _s1_storeMask_T_10; // @[Mux.scala 81:58]
  reg  s2_load; // @[Reg.scala 19:16]
  reg  s2_en; // @[Reg.scala 19:16]
  reg  s2_signed; // @[Reg.scala 19:16]
  reg [1:0] s2_width; // @[Reg.scala 19:16]
  reg [1:0] s2_offset; // @[Reg.scala 19:16]
  reg [31:0] s2_pc; // @[Reg.scala 19:16]
  reg [31:0] s2_inst; // @[Reg.scala 19:16]
  reg [7:0] s2_id; // @[Reg.scala 19:16]
  wire  _GEN_30 = s2_fire & s2_full ? 1'h0 : s2_full; // @[LSU.scala 167:26 181:{35,45}]
  wire  _GEN_31 = s1_fire | _GEN_30; // @[LSU.scala 180:{20,30}]
  reg [31:0] s2_loadResp_holdReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_32 = _s2_loadRespValid_T ? io_cache_read_resp_bits_data : s2_loadResp_holdReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s2_loadDataRaw_T_2 = {8'h0,_GEN_32[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_5 = {16'h0,_GEN_32[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_8 = {24'h0,_GEN_32[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _s2_loadDataRaw_T_10 = 2'h1 == s2_offset ? _s2_loadDataRaw_T_2 : _GEN_32; // @[Mux.scala 81:58]
  wire [31:0] _s2_loadDataRaw_T_12 = 2'h2 == s2_offset ? _s2_loadDataRaw_T_5 : _s2_loadDataRaw_T_10; // @[Mux.scala 81:58]
  wire [31:0] s2_loadDataRaw = 2'h3 == s2_offset ? _s2_loadDataRaw_T_8 : _s2_loadDataRaw_T_12; // @[Mux.scala 81:58]
  wire [7:0] _s2_loadData_T_1 = s2_loadDataRaw[7:0]; // @[LSU.scala 198:88]
  wire  s2_loadData_signBit = _s2_loadData_T_1[7]; // @[util.scala 42:27]
  wire [5:0] s2_loadData_out_lo_lo = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit}; // @[Cat.scala 33:92]
  wire [11:0] s2_loadData_out_lo = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit,s2_loadData_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _s2_loadData_out_T_1 = s2_loadDataRaw[7:0]; // @[util.scala 46:75]
  wire [31:0] s2_loadData_out = {s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,s2_loadData_signBit,
    s2_loadData_signBit,s2_loadData_signBit,s2_loadData_out_lo_lo,s2_loadData_out_lo,_s2_loadData_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] s2_loadData_out_1 = {{24'd0}, s2_loadDataRaw[7:0]}; // @[util.scala 62:36]
  wire [31:0] _s2_loadData_T_3 = s2_signed ? s2_loadData_out : s2_loadData_out_1; // @[LSU.scala 198:48]
  wire [15:0] _s2_loadData_T_5 = s2_loadDataRaw[15:0]; // @[LSU.scala 199:89]
  wire  s2_loadData_signBit_1 = _s2_loadData_T_5[15]; // @[util.scala 42:27]
  wire [7:0] s2_loadData_out_lo_1 = {s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _s2_loadData_out_T_3 = s2_loadDataRaw[15:0]; // @[util.scala 46:75]
  wire [31:0] s2_loadData_out_2 = {s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,s2_loadData_signBit_1,
    s2_loadData_out_lo_1,_s2_loadData_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] s2_loadData_out_3 = {{16'd0}, s2_loadDataRaw[15:0]}; // @[util.scala 62:36]
  wire [31:0] _s2_loadData_T_7 = s2_signed ? s2_loadData_out_2 : s2_loadData_out_3; // @[LSU.scala 199:48]
  wire [31:0] _s2_loadData_T_10 = 2'h3 == s2_offset ? _s2_loadDataRaw_T_8 : _s2_loadDataRaw_T_12; // @[util.scala 44:18]
  wire [31:0] _s2_loadData_T_12 = s2_signed ? _s2_loadData_T_10 : s2_loadDataRaw; // @[LSU.scala 200:48]
  wire [31:0] _s2_loadData_T_14 = 2'h0 == s2_width ? _s2_loadData_T_3 : s2_loadDataRaw; // @[Mux.scala 81:58]
  wire [31:0] _s2_loadData_T_16 = 2'h1 == s2_width ? _s2_loadData_T_7 : _s2_loadData_T_14; // @[Mux.scala 81:58]
  wire  s0_fence = s0_full & _s0_valid_T_2; // @[LSU.scala 206:28]
  ImmGen immGen ( // @[LSU.scala 86:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = ~s0_full | s0_fire; // @[LSU.scala 66:26]
  assign io_out_valid = s2_valid & s2_en | s0_fence; // @[LSU.scala 207:39]
  assign io_out_bits_data = 2'h2 == s2_width ? _s2_loadData_T_12 : _s2_loadData_T_16; // @[Mux.scala 81:58]
  assign io_out_bits_rd = s2_inst[11:7]; // @[util.scala 71:31]
  assign io_out_bits_wrEn = s0_fence ? 1'h0 : s2_load & s2_en; // @[LSU.scala 212:28]
  assign io_out_bits_inst = s0_fence ? s0_info_inst : s2_inst; // @[LSU.scala 210:28]
  assign io_out_bits_pc = s0_fence ? s0_info_pc : s2_pc; // @[LSU.scala 209:26]
  assign io_out_bits_id = s0_fence ? s0_info_id : s2_id; // @[LSU.scala 213:26]
  assign io_rfRd_0_addr = s0_info_inst[19:15]; // @[util.scala 72:31]
  assign io_rfRd_0_en = s0_full; // @[LSU.scala 81:23]
  assign io_rfRd_1_addr = s0_info_inst[24:20]; // @[util.scala 73:31]
  assign io_cache_read_req_valid = s1_load & s1_full & ~s1_reqSend & ~io_flush; // @[LSU.scala 141:66]
  assign io_cache_read_req_bits_addr = {s1_addr[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_read_resp_ready = 1'h1; // @[LSU.scala 183:30]
  assign io_cache_write_req_valid = s1_wen & s1_full & _io_cache_read_req_valid_T_1 & _io_cache_read_req_valid_T_3; // @[LSU.scala 144:66]
  assign io_cache_write_req_bits_addr = {s1_addr[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_write_req_bits_data = _io_cache_write_req_bits_data_T_1[31:0]; // @[LSU.scala 146:34]
  assign io_cache_write_req_bits_mask = 2'h2 == s1_width ? 4'hf : _s1_storeMask_T_12; // @[Mux.scala 81:58]
  assign io_cache_write_resp_ready = 1'h1; // @[LSU.scala 184:31]
  assign immGen_io_inst = s0_info_inst; // @[LSU.scala 90:20]
  assign immGen_io_immSrc = s0_info_immSrc; // @[LSU.scala 88:22]
  assign immGen_io_immSign = 1'h1; // @[LSU.scala 89:23]
  always @(posedge clock) begin
    if (reset) begin // @[LSU.scala 63:26]
      s0_full <= 1'h0; // @[LSU.scala 63:26]
    end else if (io_flush) begin // @[LSU.scala 216:20]
      s0_full <= 1'h0; // @[LSU.scala 217:17]
    end else begin
      s0_full <= _GEN_8;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_lsuOp <= io_in_bits_lsuOp; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[LSU.scala 101:26]
      s1_full <= 1'h0; // @[LSU.scala 101:26]
    end else if (io_flush) begin // @[LSU.scala 216:20]
      s1_full <= 1'h0; // @[LSU.scala 218:17]
    end else begin
      s1_full <= _GEN_19;
    end
    if (reset) begin // @[LSU.scala 136:29]
      s1_reqSend <= 1'h0; // @[LSU.scala 136:29]
    end else if (s1_fire) begin // @[LSU.scala 137:19]
      s1_reqSend <= 1'h0; // @[LSU.scala 137:32]
    end else begin
      s1_reqSend <= _s1_valid_T_3;
    end
    if (reset) begin // @[LSU.scala 167:26]
      s2_full <= 1'h0; // @[LSU.scala 167:26]
    end else if (io_flush) begin // @[LSU.scala 216:20]
      s2_full <= 1'h0; // @[LSU.scala 219:17]
    end else begin
      s2_full <= _GEN_31;
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
      s0_info_inst <= io_in_bits_inst; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_pc <= io_in_bits_pc; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_id <= io_in_bits_id; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_lsuOp <= s0_info_lsuOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rsValVec_1 <= io_rfRd_1_data; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_addr <= s0_addr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_pc <= s0_info_pc; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_inst <= s0_info_inst; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_id <= s0_info_id; // @[Reg.scala 20:22]
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
      s2_pc <= s1_pc; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_inst <= s1_inst; // @[Reg.scala 20:22]
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
  s1_reqSend = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s2_full = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s2_loadRespValid_holdReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_storeRespValid_holdReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s0_info_immSrc = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  s0_info_inst = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  s0_info_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  s0_info_id = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  s1_lsuOp = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  s1_rsValVec_1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_addr = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_id = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  s2_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_en = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_signed = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s2_width = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  s2_offset = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  s2_pc = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  s2_inst = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  s2_id = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  s2_loadResp_holdReg_data = _RAND_25[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
