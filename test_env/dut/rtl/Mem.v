module Mem(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input  [4:0]  io_in_bits_lsuOp,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input         io_in_bits_csrValid,
  input  [31:0] io_in_bits_csrWrData,
  input  [31:0] io_in_bits_csrAddr,
  input  [3:0]  io_in_bits_excType,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_aluOut,
  output [31:0] io_out_bits_pcNext4,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_csrWrEn,
  output [31:0] io_out_bits_csrWrData,
  output [11:0] io_out_bits_csrAddr,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [31:0] io_ramData,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  input         io_ctrl_flush,
  output        io_excp_valid,
  output        io_excp_bits_isMret,
  output        io_excp_bits_isSret,
  output [30:0] io_excp_bits_excCause,
  output [31:0] io_excp_bits_excPc,
  input         io_csrBusy,
  input  [1:0]  io_csrMode
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
`endif // RANDOMIZE_REG_INIT
  wire  lsu_clock; // @[4_Mem.scala 114:21]
  wire  lsu_reset; // @[4_Mem.scala 114:21]
  wire [31:0] lsu_io_addr; // @[4_Mem.scala 114:21]
  wire [31:0] lsu_io_wdata; // @[4_Mem.scala 114:21]
  wire [31:0] lsu_io_data; // @[4_Mem.scala 114:21]
  wire [4:0] lsu_io_lsuOp; // @[4_Mem.scala 114:21]
  wire  lsu_io_excp_storeUnalign; // @[4_Mem.scala 114:21]
  reg [1:0] stageReg_resultSrc; // @[4_Mem.scala 60:27]
  reg [4:0] stageReg_lsuOp; // @[4_Mem.scala 60:27]
  reg  stageReg_regWrEn; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_aluOut; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_data2; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_pcNext4; // @[4_Mem.scala 60:27]
  reg [2:0] stageReg_csrOp; // @[4_Mem.scala 60:27]
  reg  stageReg_csrWrEn; // @[4_Mem.scala 60:27]
  reg  stageReg_csrValid; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_csrWrData; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_csrAddr; // @[4_Mem.scala 60:27]
  reg [3:0] stageReg_excType; // @[4_Mem.scala 60:27]
  reg  stageReg_instState_commit; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_instState_pc; // @[4_Mem.scala 60:27]
  reg [31:0] stageReg_instState_inst; // @[4_Mem.scala 60:27]
  wire  _GEN_18 = io_in_ready & io_in_bits_regWrEn; // @[4_Mem.scala 61:23 62:18]
  wire  _GEN_23 = io_in_ready & io_in_bits_csrWrEn; // @[4_Mem.scala 61:23 62:18]
  wire  _GEN_24 = io_in_ready & io_in_bits_csrValid; // @[4_Mem.scala 61:23 62:18]
  wire  _GEN_29 = io_in_ready & io_in_bits_instState_commit; // @[4_Mem.scala 61:23 62:18]
  wire  _illgSret_T = stageReg_excType == 4'h3; // @[4_Mem.scala 71:38]
  wire  _illgSret_T_1 = io_csrMode == 2'h0; // @[4_Mem.scala 71:65]
  wire  illgSret = stageReg_excType == 4'h3 & io_csrMode == 2'h0; // @[4_Mem.scala 71:51]
  wire  _illgMret_T = stageReg_excType == 4'h4; // @[4_Mem.scala 72:38]
  wire  illgMret = stageReg_excType == 4'h4 & io_csrMode != 2'h3; // @[4_Mem.scala 72:51]
  wire  illgSpriv = stageReg_excType == 4'ha & _illgSret_T_1; // @[4_Mem.scala 73:52]
  wire  _instIllg_T_1 = stageReg_excType == 4'h5 | illgSret; // @[4_Mem.scala 76:52]
  wire  instIllg = _instIllg_T_1 | illgMret | illgSpriv; // @[4_Mem.scala 77:42]
  wire  _excOther_T_1 = stageReg_excType == 4'h2; // @[4_Mem.scala 79:38]
  wire  _excOther_T_2 = stageReg_excType == 4'h1 | _excOther_T_1; // @[4_Mem.scala 78:51]
  wire  _excOther_T_4 = _excOther_T_2 | _illgSret_T; // @[4_Mem.scala 79:51]
  wire  excOther = _excOther_T_4 | _illgMret_T; // @[4_Mem.scala 80:51]
  wire  hasTrap = (instIllg | excOther) & stageReg_instState_inst != 32'h0; // @[4_Mem.scala 82:42]
  wire [30:0] _cause_T_2 = io_csrMode == 2'h1 ? 31'h9 : 31'hb; // @[4_Mem.scala 86:28]
  wire [30:0] _cause_T_3 = _illgSret_T_1 ? 31'h8 : _cause_T_2; // @[4_Mem.scala 85:28]
  wire [30:0] _cause_T_5 = 4'h1 == stageReg_excType ? _cause_T_3 : 31'h0; // @[Mux.scala 81:58]
  wire [30:0] cause = 4'h2 == stageReg_excType ? 31'h3 : _cause_T_5; // @[Mux.scala 81:58]
  LSU lsu ( // @[4_Mem.scala 114:21]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_addr(lsu_io_addr),
    .io_wdata(lsu_io_wdata),
    .io_data(lsu_io_data),
    .io_lsuOp(lsu_io_lsuOp),
    .io_excp_storeUnalign(lsu_io_excp_storeUnalign)
  );
  assign io_in_ready = 1'h1; // @[4_Mem.scala 58:33]
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Mem.scala 122:27]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 123:25]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Mem.scala 124:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Mem.scala 125:25]
  assign io_out_bits_csrOp = stageReg_csrOp; // @[4_Mem.scala 97:23]
  assign io_out_bits_csrWrEn = stageReg_csrWrEn; // @[4_Mem.scala 98:25]
  assign io_out_bits_csrWrData = stageReg_csrWrData; // @[4_Mem.scala 100:27]
  assign io_out_bits_csrAddr = stageReg_csrAddr[11:0]; // @[4_Mem.scala 101:25]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Mem.scala 126:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Mem.scala 126:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Mem.scala 126:27]
  assign io_ramData = lsu_io_data; // @[4_Mem.scala 120:16]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Mem.scala 132:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 131:23]
  assign io_excp_valid = ~io_csrBusy & hasTrap; // @[4_Mem.scala 91:34]
  assign io_excp_bits_isMret = stageReg_excType == 4'h4; // @[4_Mem.scala 94:45]
  assign io_excp_bits_isSret = stageReg_excType == 4'h3; // @[4_Mem.scala 95:45]
  assign io_excp_bits_excCause = stageReg_csrWrEn & ~stageReg_csrValid ? 31'h2 : cause; // @[4_Mem.scala 89:33]
  assign io_excp_bits_excPc = stageReg_instState_pc; // @[4_Mem.scala 92:24]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_addr = stageReg_aluOut; // @[4_Mem.scala 116:17]
  assign lsu_io_wdata = stageReg_data2; // @[4_Mem.scala 117:18]
  assign lsu_io_lsuOp = stageReg_lsuOp; // @[4_Mem.scala 119:18]
  always @(posedge clock) begin
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_lsuOp <= 5'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 67:28]
    end else begin
      stageReg_regWrEn <= _GEN_18;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_aluOut <= io_in_bits_aluOut; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_data2 <= io_in_bits_data2; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_data2 <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_csrOp <= io_in_bits_csrOp; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 67:28]
    end else begin
      stageReg_csrWrEn <= _GEN_23;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 67:28]
    end else begin
      stageReg_csrValid <= _GEN_24;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_csrAddr <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_excType <= io_in_bits_excType; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_excType <= 4'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 67:28]
    end else begin
      stageReg_instState_commit <= _GEN_29;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 60:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 60:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 67:17]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 67:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 61:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[4_Mem.scala 62:18]
    end else begin
      stageReg_instState_inst <= 32'h0;
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
  stageReg_resultSrc = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_lsuOp = _RAND_1[4:0];
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
  stageReg_csrWrData = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_excType = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_14[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
