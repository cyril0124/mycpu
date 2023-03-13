module Decode(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_isBranch,
  output        io_out_bits_isJump,
  output [1:0]  io_out_bits_resultSrc,
  output [4:0]  io_out_bits_lsuOp,
  output [3:0]  io_out_bits_aluOpSel,
  output        io_out_bits_immSign,
  output        io_out_bits_regWrEn,
  output        io_out_bits_pcAddReg,
  output [31:0] io_out_bits_pcNext4,
  output [31:0] io_out_bits_aluIn1,
  output [31:0] io_out_bits_aluIn2,
  output        io_out_bits_aluIn1IsReg,
  output        io_out_bits_aluIn2IsReg,
  output [31:0] io_out_bits_imm,
  output [31:0] io_out_bits_data2,
  output [3:0]  io_out_bits_excType,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  input         io_hazard_in_stall,
  output [4:0]  io_regfile_rs1,
  output [4:0]  io_regfile_rs2,
  input  [31:0] io_regfile_rdata1,
  input  [31:0] io_regfile_rdata2,
  input         io_ctrl_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlUnit_io_out_isBranch; // @[2_Decode.scala 117:29]
  wire  ctrlUnit_io_out_isJump; // @[2_Decode.scala 117:29]
  wire [1:0] ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 117:29]
  wire [3:0] ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 117:29]
  wire [4:0] ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 117:29]
  wire [3:0] ctrlUnit_io_out_aluSrc1; // @[2_Decode.scala 117:29]
  wire [3:0] ctrlUnit_io_out_aluSrc2; // @[2_Decode.scala 117:29]
  wire [1:0] ctrlUnit_io_out_immSrc; // @[2_Decode.scala 117:29]
  wire  ctrlUnit_io_out_immSign; // @[2_Decode.scala 117:29]
  wire  ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 117:29]
  wire  ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 117:29]
  wire [2:0] ctrlUnit_io_out_csrOp; // @[2_Decode.scala 117:29]
  wire [3:0] ctrlUnit_io_out_excType; // @[2_Decode.scala 117:29]
  wire [31:0] ctrlUnit_io_in_inst; // @[2_Decode.scala 117:29]
  wire [31:0] immGen_io_inst; // @[2_Decode.scala 141:24]
  wire [2:0] immGen_io_immSrc; // @[2_Decode.scala 141:24]
  wire  immGen_io_immSign; // @[2_Decode.scala 141:24]
  wire [31:0] immGen_io_imm; // @[2_Decode.scala 141:24]
  wire  _io_in_ready_T = ~io_hazard_in_stall; // @[2_Decode.scala 77:36]
  wire  decodeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg [31:0] stageReg_pcNext4; // @[2_Decode.scala 80:27]
  reg  stageReg_instState_commit; // @[2_Decode.scala 80:27]
  reg [31:0] stageReg_instState_pc; // @[2_Decode.scala 80:27]
  reg [31:0] stageReg_instState_inst; // @[2_Decode.scala 80:27]
  wire [4:0] rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  wire [31:0] io_out_bits_aluIn1_out = {{27'd0}, rs1}; // @[util.scala 31:36]
  wire [31:0] _io_out_bits_aluIn1_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata2 : _io_out_bits_aluIn1_T_1; // @[Mux.scala 81:58]
  wire [31:0] imm = immGen_io_imm; // @[2_Decode.scala 94:19 145:25]
  wire [31:0] _io_out_bits_aluIn1_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc1 ? imm : _io_out_bits_aluIn1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc1 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn1_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc1 ? stageReg_instState_pc :
    _io_out_bits_aluIn1_T_7; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata2 : _io_out_bits_aluIn2_T_1; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc2 ? imm : _io_out_bits_aluIn2_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc2 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn2_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc2 ? stageReg_instState_pc :
    _io_out_bits_aluIn2_T_7; // @[Mux.scala 81:58]
  CtrlUnit ctrlUnit ( // @[2_Decode.scala 117:29]
    .io_out_isBranch(ctrlUnit_io_out_isBranch),
    .io_out_isJump(ctrlUnit_io_out_isJump),
    .io_out_resultSrc(ctrlUnit_io_out_resultSrc),
    .io_out_aluOpSel(ctrlUnit_io_out_aluOpSel),
    .io_out_lsuOp(ctrlUnit_io_out_lsuOp),
    .io_out_aluSrc1(ctrlUnit_io_out_aluSrc1),
    .io_out_aluSrc2(ctrlUnit_io_out_aluSrc2),
    .io_out_immSrc(ctrlUnit_io_out_immSrc),
    .io_out_immSign(ctrlUnit_io_out_immSign),
    .io_out_regWrEn(ctrlUnit_io_out_regWrEn),
    .io_out_pcAddReg(ctrlUnit_io_out_pcAddReg),
    .io_out_csrOp(ctrlUnit_io_out_csrOp),
    .io_out_excType(ctrlUnit_io_out_excType),
    .io_in_inst(ctrlUnit_io_in_inst)
  );
  ImmGen immGen ( // @[2_Decode.scala 141:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = io_out_ready & ~io_hazard_in_stall; // @[2_Decode.scala 77:33]
  assign io_out_valid = io_out_ready & _io_in_ready_T; // @[2_Decode.scala 180:34]
  assign io_out_bits_isBranch = ctrlUnit_io_out_isBranch; // @[2_Decode.scala 149:29]
  assign io_out_bits_isJump = ctrlUnit_io_out_isJump; // @[2_Decode.scala 150:29]
  assign io_out_bits_resultSrc = ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 151:29]
  assign io_out_bits_lsuOp = ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 152:29]
  assign io_out_bits_aluOpSel = ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 153:29]
  assign io_out_bits_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 156:29]
  assign io_out_bits_regWrEn = ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 155:29]
  assign io_out_bits_pcAddReg = ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 154:29]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[2_Decode.scala 172:29]
  assign io_out_bits_aluIn1 = 4'h8 == ctrlUnit_io_out_aluSrc1 ? 32'h4 : _io_out_bits_aluIn1_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn2 = 4'h8 == ctrlUnit_io_out_aluSrc2 ? 32'h4 : _io_out_bits_aluIn2_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn1IsReg = ctrlUnit_io_out_aluSrc1 == 4'h1 | ctrlUnit_io_out_aluSrc1 == 4'h2; // @[2_Decode.scala 167:54]
  assign io_out_bits_aluIn2IsReg = ctrlUnit_io_out_aluSrc2 == 4'h1 | ctrlUnit_io_out_aluSrc2 == 4'h2; // @[2_Decode.scala 168:54]
  assign io_out_bits_imm = immGen_io_imm; // @[2_Decode.scala 94:19 145:25]
  assign io_out_bits_data2 = io_regfile_rdata2; // @[2_Decode.scala 139:15 96:29]
  assign io_out_bits_excType = ctrlUnit_io_out_excType; // @[2_Decode.scala 161:29]
  assign io_out_bits_csrOp = ctrlUnit_io_out_csrOp; // @[2_Decode.scala 160:29]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[2_Decode.scala 173:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[2_Decode.scala 173:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[2_Decode.scala 173:27]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign io_regfile_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_regfile_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign ctrlUnit_io_in_inst = stageReg_instState_inst; // @[2_Decode.scala 132:25]
  assign immGen_io_inst = stageReg_instState_inst; // @[2_Decode.scala 142:25]
  assign immGen_io_immSrc = {{1'd0}, ctrlUnit_io_out_immSrc}; // @[2_Decode.scala 143:25]
  assign immGen_io_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 144:25]
  always @(posedge clock) begin
    if (reset) begin // @[2_Decode.scala 80:27]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 80:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 88:17]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 88:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 81:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[2_Decode.scala 82:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 83:23]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 84:18]
    end
    if (reset) begin // @[2_Decode.scala 80:27]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 80:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 88:17]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 88:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 81:23]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[2_Decode.scala 82:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 83:23]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 84:18]
    end
    if (reset) begin // @[2_Decode.scala 80:27]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 80:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 88:17]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 88:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 81:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[2_Decode.scala 82:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 83:23]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 84:18]
    end
    if (reset) begin // @[2_Decode.scala 80:27]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 80:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 88:17]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 88:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 81:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[2_Decode.scala 82:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 83:23]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 84:18]
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
  stageReg_pcNext4 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
