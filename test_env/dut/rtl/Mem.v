module Mem(
  input          clock,
  input          reset,
  output         io_in_ready,
  input  [1:0]   io_in_bits_resultSrc,
  input  [4:0]   io_in_bits_lsuOp,
  input          io_in_bits_regWrEn,
  input  [31:0]  io_in_bits_aluOut,
  input  [31:0]  io_in_bits_data2,
  input  [31:0]  io_in_bits_pcNext4,
  input  [2:0]   io_in_bits_csrOp,
  input          io_in_bits_csrWrEn,
  input          io_in_bits_csrValid,
  input  [31:0]  io_in_bits_csrRdData,
  input  [31:0]  io_in_bits_csrWrData,
  input  [31:0]  io_in_bits_csrAddr,
  input  [3:0]   io_in_bits_excType,
  input          io_in_bits_instState_commit,
  input  [31:0]  io_in_bits_instState_pc,
  input  [31:0]  io_in_bits_instState_inst,
  input          io_out_ready,
  output         io_out_valid,
  output [1:0]   io_out_bits_resultSrc,
  output         io_out_bits_regWrEn,
  output [31:0]  io_out_bits_aluOut,
  output [31:0]  io_out_bits_pcNext4,
  output [2:0]   io_out_bits_csrOp,
  output         io_out_bits_csrWrEn,
  output [31:0]  io_out_bits_csrRdData,
  output [31:0]  io_out_bits_csrWrData,
  output [11:0]  io_out_bits_csrAddr,
  output         io_out_bits_instState_commit,
  output [31:0]  io_out_bits_instState_pc,
  output [31:0]  io_out_bits_instState_inst,
  output [31:0]  io_lsuData,
  output         io_lsuOK,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [2:0]   io_tlbus_req_bits_opcode,
  output [31:0]  io_tlbus_req_bits_address,
  output [127:0] io_tlbus_req_bits_data,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [127:0] io_tlbus_resp_bits_data,
  output [4:0]   io_hazard_rd,
  output [31:0]  io_hazard_rdVal,
  output         io_hazard_regWrEn,
  input          io_ctrl_flush,
  output         io_excp_valid,
  output         io_excp_bits_isMret,
  output         io_excp_bits_isSret,
  output [30:0]  io_excp_bits_excCause,
  output [31:0]  io_excp_bits_excPc,
  input          io_csrBusy,
  input  [1:0]   io_csrMode
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
`endif // RANDOMIZE_REG_INIT
  wire  lsu_clock; // @[4_Mem.scala 146:21]
  wire  lsu_reset; // @[4_Mem.scala 146:21]
  wire  lsu_io_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_req_bits_addr; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_req_bits_wdata; // @[4_Mem.scala 146:21]
  wire [4:0] lsu_io_req_bits_lsuOp; // @[4_Mem.scala 146:21]
  wire  lsu_io_resp_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_resp_bits_rdata; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_read_req_bits_addr; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_resp_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_read_resp_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_read_resp_bits_data; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_req_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_req_valid; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_write_req_bits_addr; // @[4_Mem.scala 146:21]
  wire [31:0] lsu_io_cache_write_req_bits_data; // @[4_Mem.scala 146:21]
  wire [3:0] lsu_io_cache_write_req_bits_mask; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_resp_ready; // @[4_Mem.scala 146:21]
  wire  lsu_io_cache_write_resp_valid; // @[4_Mem.scala 146:21]
  wire  dcache_clock; // @[4_Mem.scala 165:24]
  wire  dcache_reset; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_req_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_read_req_bits_addr; // @[4_Mem.scala 165:24]
  wire  dcache_io_read_resp_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_read_resp_bits_data; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_req_valid; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_write_req_bits_addr; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_write_req_bits_data; // @[4_Mem.scala 165:24]
  wire [3:0] dcache_io_write_req_bits_mask; // @[4_Mem.scala 165:24]
  wire  dcache_io_write_resp_valid; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_req_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_req_valid; // @[4_Mem.scala 165:24]
  wire [2:0] dcache_io_tlbus_req_bits_opcode; // @[4_Mem.scala 165:24]
  wire [31:0] dcache_io_tlbus_req_bits_address; // @[4_Mem.scala 165:24]
  wire [127:0] dcache_io_tlbus_req_bits_data; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_resp_ready; // @[4_Mem.scala 165:24]
  wire  dcache_io_tlbus_resp_valid; // @[4_Mem.scala 165:24]
  wire [2:0] dcache_io_tlbus_resp_bits_opcode; // @[4_Mem.scala 165:24]
  wire [127:0] dcache_io_tlbus_resp_bits_data; // @[4_Mem.scala 165:24]
  wire  lsuReady = lsu_io_req_ready; // @[4_Mem.scala 148:14 60:28]
  reg [4:0] stageReg_lsuOp; // @[4_Mem.scala 70:27]
  wire  validLsuOp = ~(stageReg_lsuOp == 5'h0 | stageReg_lsuOp == 5'h14); // @[4_Mem.scala 149:19]
  wire  stall = ~lsuReady | validLsuOp & ~io_lsuOK; // @[4_Mem.scala 64:44]
  wire  _io_in_ready_T = ~stall; // @[4_Mem.scala 68:20]
  wire  _io_in_ready_T_2 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg [1:0] stageReg_resultSrc; // @[4_Mem.scala 70:27]
  reg  stageReg_regWrEn; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_aluOut; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_data2; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_pcNext4; // @[4_Mem.scala 70:27]
  reg [2:0] stageReg_csrOp; // @[4_Mem.scala 70:27]
  reg  stageReg_csrWrEn; // @[4_Mem.scala 70:27]
  reg  stageReg_csrValid; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_csrRdData; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_csrWrData; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_csrAddr; // @[4_Mem.scala 70:27]
  reg [3:0] stageReg_excType; // @[4_Mem.scala 70:27]
  reg  stageReg_instState_commit; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_instState_pc; // @[4_Mem.scala 70:27]
  reg [31:0] stageReg_instState_inst; // @[4_Mem.scala 70:27]
  wire  _illgSret_T = stageReg_excType == 4'h3; // @[4_Mem.scala 82:38]
  wire  _illgSret_T_1 = io_csrMode == 2'h0; // @[4_Mem.scala 82:65]
  wire  illgSret = stageReg_excType == 4'h3 & io_csrMode == 2'h0; // @[4_Mem.scala 82:51]
  wire  _illgMret_T = stageReg_excType == 4'h4; // @[4_Mem.scala 83:38]
  wire  illgMret = stageReg_excType == 4'h4 & io_csrMode != 2'h3; // @[4_Mem.scala 83:51]
  wire  illgSpriv = stageReg_excType == 4'ha & _illgSret_T_1; // @[4_Mem.scala 84:52]
  wire  _instIllg_T_1 = stageReg_excType == 4'h5 | illgSret; // @[4_Mem.scala 87:52]
  wire  instIllg = _instIllg_T_1 | illgMret | illgSpriv; // @[4_Mem.scala 88:42]
  wire  _excOther_T_1 = stageReg_excType == 4'h2; // @[4_Mem.scala 90:38]
  wire  _excOther_T_2 = stageReg_excType == 4'h1 | _excOther_T_1; // @[4_Mem.scala 89:52]
  wire  _excOther_T_4 = _excOther_T_2 | _illgSret_T; // @[4_Mem.scala 90:51]
  wire  excOther = _excOther_T_4 | _illgMret_T; // @[4_Mem.scala 91:51]
  wire  hasTrap = (instIllg | excOther) & stageReg_instState_inst != 32'h0; // @[4_Mem.scala 93:44]
  wire [30:0] _cause_T_2 = io_csrMode == 2'h1 ? 31'h9 : 31'hb; // @[4_Mem.scala 98:32]
  wire [30:0] _cause_T_3 = _illgSret_T_1 ? 31'h8 : _cause_T_2; // @[4_Mem.scala 96:28]
  wire [30:0] _cause_T_5 = 4'h1 == stageReg_excType ? _cause_T_3 : 31'h0; // @[Mux.scala 81:58]
  wire [30:0] cause = 4'h2 == stageReg_excType ? 31'h3 : _cause_T_5; // @[Mux.scala 81:58]
  wire  _lsuSend_T = lsu_io_req_ready & lsu_io_req_valid; // @[Decoupled.scala 51:35]
  reg  lsuSend; // @[Reg.scala 35:20]
  wire  _GEN_48 = _lsuSend_T | lsuSend; // @[Reg.scala 36:18 35:20 36:22]
  LSU_1 lsu ( // @[4_Mem.scala 146:21]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_req_ready(lsu_io_req_ready),
    .io_req_valid(lsu_io_req_valid),
    .io_req_bits_addr(lsu_io_req_bits_addr),
    .io_req_bits_wdata(lsu_io_req_bits_wdata),
    .io_req_bits_lsuOp(lsu_io_req_bits_lsuOp),
    .io_resp_valid(lsu_io_resp_valid),
    .io_resp_bits_rdata(lsu_io_resp_bits_rdata),
    .io_cache_read_req_ready(lsu_io_cache_read_req_ready),
    .io_cache_read_req_valid(lsu_io_cache_read_req_valid),
    .io_cache_read_req_bits_addr(lsu_io_cache_read_req_bits_addr),
    .io_cache_read_resp_ready(lsu_io_cache_read_resp_ready),
    .io_cache_read_resp_valid(lsu_io_cache_read_resp_valid),
    .io_cache_read_resp_bits_data(lsu_io_cache_read_resp_bits_data),
    .io_cache_write_req_ready(lsu_io_cache_write_req_ready),
    .io_cache_write_req_valid(lsu_io_cache_write_req_valid),
    .io_cache_write_req_bits_addr(lsu_io_cache_write_req_bits_addr),
    .io_cache_write_req_bits_data(lsu_io_cache_write_req_bits_data),
    .io_cache_write_req_bits_mask(lsu_io_cache_write_req_bits_mask),
    .io_cache_write_resp_ready(lsu_io_cache_write_resp_ready),
    .io_cache_write_resp_valid(lsu_io_cache_write_resp_valid)
  );
  DCache dcache ( // @[4_Mem.scala 165:24]
    .clock(dcache_clock),
    .reset(dcache_reset),
    .io_read_req_ready(dcache_io_read_req_ready),
    .io_read_req_valid(dcache_io_read_req_valid),
    .io_read_req_bits_addr(dcache_io_read_req_bits_addr),
    .io_read_resp_valid(dcache_io_read_resp_valid),
    .io_read_resp_bits_data(dcache_io_read_resp_bits_data),
    .io_write_req_ready(dcache_io_write_req_ready),
    .io_write_req_valid(dcache_io_write_req_valid),
    .io_write_req_bits_addr(dcache_io_write_req_bits_addr),
    .io_write_req_bits_data(dcache_io_write_req_bits_data),
    .io_write_req_bits_mask(dcache_io_write_req_bits_mask),
    .io_write_resp_valid(dcache_io_write_resp_valid),
    .io_tlbus_req_ready(dcache_io_tlbus_req_ready),
    .io_tlbus_req_valid(dcache_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(dcache_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(dcache_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(dcache_io_tlbus_req_bits_data),
    .io_tlbus_resp_ready(dcache_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(dcache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(dcache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(dcache_io_tlbus_resp_bits_data)
  );
  assign io_in_ready = ~stall & _io_in_ready_T_2; // @[4_Mem.scala 68:42]
  assign io_out_valid = ~stall; // @[4_Mem.scala 185:32]
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Mem.scala 172:29]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 173:29]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Mem.scala 174:29]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Mem.scala 175:29]
  assign io_out_bits_csrOp = stageReg_csrOp; // @[4_Mem.scala 115:29]
  assign io_out_bits_csrWrEn = stageReg_csrWrEn; // @[4_Mem.scala 116:29]
  assign io_out_bits_csrRdData = stageReg_csrRdData; // @[4_Mem.scala 117:29]
  assign io_out_bits_csrWrData = stageReg_csrWrData; // @[4_Mem.scala 118:29]
  assign io_out_bits_csrAddr = stageReg_csrAddr[11:0]; // @[4_Mem.scala 119:29]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Mem.scala 176:29]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Mem.scala 176:29]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Mem.scala 176:29]
  assign io_lsuData = lsu_io_resp_bits_rdata; // @[4_Mem.scala 163:29]
  assign io_lsuOK = lsu_io_resp_valid; // @[4_Mem.scala 162:29]
  assign io_tlbus_req_valid = dcache_io_tlbus_req_valid; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_opcode = dcache_io_tlbus_req_bits_opcode; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_address = dcache_io_tlbus_req_bits_address; // @[4_Mem.scala 168:21]
  assign io_tlbus_req_bits_data = dcache_io_tlbus_req_bits_data; // @[4_Mem.scala 168:21]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 71:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Mem.scala 183:29]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 182:29]
  assign io_excp_valid = ~io_csrBusy & hasTrap & _io_in_ready_T; // @[4_Mem.scala 109:55]
  assign io_excp_bits_isMret = stageReg_excType == 4'h4; // @[4_Mem.scala 112:49]
  assign io_excp_bits_isSret = stageReg_excType == 4'h3; // @[4_Mem.scala 113:49]
  assign io_excp_bits_excCause = stageReg_csrWrEn & ~stageReg_csrValid ? 31'h2 : cause; // @[4_Mem.scala 105:35]
  assign io_excp_bits_excPc = stageReg_instState_pc; // @[4_Mem.scala 110:29]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_req_valid = stageReg_instState_commit & validLsuOp & ~lsuSend; // @[4_Mem.scala 157:72]
  assign lsu_io_req_bits_addr = stageReg_aluOut; // @[4_Mem.scala 158:29]
  assign lsu_io_req_bits_wdata = stageReg_data2; // @[4_Mem.scala 159:29]
  assign lsu_io_req_bits_lsuOp = stageReg_lsuOp; // @[4_Mem.scala 161:29]
  assign lsu_io_cache_read_req_ready = dcache_io_read_req_ready; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_read_resp_valid = dcache_io_read_resp_valid; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_read_resp_bits_data = dcache_io_read_resp_bits_data; // @[4_Mem.scala 166:23]
  assign lsu_io_cache_write_req_ready = dcache_io_write_req_ready; // @[4_Mem.scala 167:24]
  assign lsu_io_cache_write_resp_valid = dcache_io_write_resp_valid; // @[4_Mem.scala 167:24]
  assign dcache_clock = clock;
  assign dcache_reset = reset;
  assign dcache_io_read_req_valid = lsu_io_cache_read_req_valid; // @[4_Mem.scala 166:23]
  assign dcache_io_read_req_bits_addr = lsu_io_cache_read_req_bits_addr; // @[4_Mem.scala 166:23]
  assign dcache_io_write_req_valid = lsu_io_cache_write_req_valid; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_addr = lsu_io_cache_write_req_bits_addr; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_data = lsu_io_cache_write_req_bits_data; // @[4_Mem.scala 167:24]
  assign dcache_io_write_req_bits_mask = lsu_io_cache_write_req_bits_mask; // @[4_Mem.scala 167:24]
  assign dcache_io_tlbus_req_ready = io_tlbus_req_ready; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[4_Mem.scala 168:21]
  assign dcache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[4_Mem.scala 168:21]
  always @(posedge clock) begin
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_lsuOp <= io_in_bits_lsuOp;
      end else begin
        stageReg_lsuOp <= 5'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_resultSrc <= io_in_bits_resultSrc;
      end else begin
        stageReg_resultSrc <= 2'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_regWrEn <= io_in_bits_instState_commit & io_in_bits_regWrEn; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_aluOut <= io_in_bits_aluOut;
      end else begin
        stageReg_aluOut <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_data2 <= io_in_bits_data2;
      end else begin
        stageReg_data2 <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_pcNext4 <= io_in_bits_pcNext4;
      end else begin
        stageReg_pcNext4 <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_csrOp <= io_in_bits_csrOp;
      end else begin
        stageReg_csrOp <= 3'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrWrEn <= io_in_bits_instState_commit & io_in_bits_csrWrEn; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_csrValid <= io_in_bits_instState_commit & io_in_bits_csrValid; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrRdData <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrRdData <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_csrRdData <= io_in_bits_csrRdData;
      end else begin
        stageReg_csrRdData <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrRdData <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_csrWrData <= io_in_bits_csrWrData;
      end else begin
        stageReg_csrWrData <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_csrAddr <= io_in_bits_csrAddr;
      end else begin
        stageReg_csrAddr <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_excType <= io_in_bits_excType;
      end else begin
        stageReg_excType <= 4'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[4_Mem.scala 72:18]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_instState_pc <= io_in_bits_instState_pc;
      end else begin
        stageReg_instState_pc <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[4_Mem.scala 70:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 70:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[4_Mem.scala 77:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 77:38]
    end else if (io_in_ready) begin // @[4_Mem.scala 71:23]
      if (io_in_bits_instState_commit) begin // @[4_Mem.scala 72:24]
        stageReg_instState_inst <= io_in_bits_instState_inst;
      end else begin
        stageReg_instState_inst <= 32'h0;
      end
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 73:28]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 74:18]
    end
    if (reset) begin // @[Reg.scala 35:20]
      lsuSend <= 1'h0; // @[Reg.scala 35:20]
    end else if (_io_in_ready_T_2) begin // @[4_Mem.scala 156:23]
      lsuSend <= 1'h0; // @[4_Mem.scala 156:33]
    end else begin
      lsuSend <= _GEN_48;
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
  stageReg_lsuOp = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_resultSrc = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_data2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_csrValid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_csrRdData = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_excType = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  lsuSend = _RAND_16[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
