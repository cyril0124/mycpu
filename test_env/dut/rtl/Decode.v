module Decode(
  input         clock,
  input         reset,
  output        io_in_fetch_ready,
  input         io_in_fetch_valid,
  input  [31:0] io_in_fetch_bits_pcNext4,
  input         io_in_fetch_bits_instState_commit,
  input  [31:0] io_in_fetch_bits_instState_pc,
  input  [31:0] io_in_fetch_bits_instState_inst,
  input  [4:0]  io_in_writeback_bits_rd,
  input         io_in_writeback_bits_regWrEn,
  input  [31:0] io_in_writeback_bits_regWrData,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_isBranch,
  output        io_out_bits_isJump,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_memWrEn,
  output [2:0]  io_out_bits_memType,
  output        io_out_bits_memSign,
  output [3:0]  io_out_bits_aluOpSel,
  output        io_out_bits_immSign,
  output        io_out_bits_regWrEn,
  output        io_out_bits_pcAddReg,
  output        io_out_bits_aluSrc,
  output [31:0] io_out_bits_pcNext4,
  output [31:0] io_out_bits_data1,
  output [31:0] io_out_bits_data2,
  output [31:0] io_out_bits_imm,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [31:0] io_regState_regState_0,
  output [31:0] io_regState_regState_1,
  output [31:0] io_regState_regState_2,
  output [31:0] io_regState_regState_3,
  output [31:0] io_regState_regState_4,
  output [31:0] io_regState_regState_5,
  output [31:0] io_regState_regState_6,
  output [31:0] io_regState_regState_7,
  output [31:0] io_regState_regState_8,
  output [31:0] io_regState_regState_9,
  output [31:0] io_regState_regState_10,
  output [31:0] io_regState_regState_11,
  output [31:0] io_regState_regState_12,
  output [31:0] io_regState_regState_13,
  output [31:0] io_regState_regState_14,
  output [31:0] io_regState_regState_15,
  output [31:0] io_regState_regState_16,
  output [31:0] io_regState_regState_17,
  output [31:0] io_regState_regState_18,
  output [31:0] io_regState_regState_19,
  output [31:0] io_regState_regState_20,
  output [31:0] io_regState_regState_21,
  output [31:0] io_regState_regState_22,
  output [31:0] io_regState_regState_23,
  output [31:0] io_regState_regState_24,
  output [31:0] io_regState_regState_25,
  output [31:0] io_regState_regState_26,
  output [31:0] io_regState_regState_27,
  output [31:0] io_regState_regState_28,
  output [31:0] io_regState_regState_29,
  output [31:0] io_regState_regState_30,
  output [31:0] io_regState_regState_31,
  input         io_ctrl_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlUnit_io_out_isBranch; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_isJump; // @[2_Decode.scala 74:26]
  wire [1:0] ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_memWrEn; // @[2_Decode.scala 74:26]
  wire [2:0] ctrlUnit_io_out_memType; // @[2_Decode.scala 74:26]
  wire [3:0] ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_aluSrc; // @[2_Decode.scala 74:26]
  wire [1:0] ctrlUnit_io_out_immSrc; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_immSign; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_memSign; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 74:26]
  wire [31:0] ctrlUnit_io_in_inst; // @[2_Decode.scala 74:26]
  wire  regFile_clock; // @[2_Decode.scala 95:25]
  wire  regFile_reset; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_r_0_addr; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_r_0_data; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_r_1_addr; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_r_1_data; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_w_0_addr; // @[2_Decode.scala 95:25]
  wire  regFile_io_w_0_en; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_w_0_data; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_0; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_1; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_2; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_3; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_4; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_5; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_6; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_7; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_8; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_9; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_10; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_11; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_12; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_13; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_14; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_15; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_16; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_17; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_18; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_19; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_20; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_21; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_22; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_23; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_24; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_25; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_26; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_27; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_28; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_29; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_30; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_31; // @[2_Decode.scala 95:25]
  wire [31:0] immGen_io_inst; // @[2_Decode.scala 106:24]
  wire [2:0] immGen_io_immSrc; // @[2_Decode.scala 106:24]
  wire  immGen_io_immSign; // @[2_Decode.scala 106:24]
  wire [31:0] immGen_io_imm; // @[2_Decode.scala 106:24]
  wire  decodeLatch = io_out_ready & io_in_fetch_valid; // @[2_Decode.scala 59:36]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  CtrlUnit ctrlUnit ( // @[2_Decode.scala 74:26]
    .io_out_isBranch(ctrlUnit_io_out_isBranch),
    .io_out_isJump(ctrlUnit_io_out_isJump),
    .io_out_resultSrc(ctrlUnit_io_out_resultSrc),
    .io_out_memWrEn(ctrlUnit_io_out_memWrEn),
    .io_out_memType(ctrlUnit_io_out_memType),
    .io_out_aluOpSel(ctrlUnit_io_out_aluOpSel),
    .io_out_aluSrc(ctrlUnit_io_out_aluSrc),
    .io_out_immSrc(ctrlUnit_io_out_immSrc),
    .io_out_immSign(ctrlUnit_io_out_immSign),
    .io_out_regWrEn(ctrlUnit_io_out_regWrEn),
    .io_out_memSign(ctrlUnit_io_out_memSign),
    .io_out_pcAddReg(ctrlUnit_io_out_pcAddReg),
    .io_in_inst(ctrlUnit_io_in_inst)
  );
  RegFile regFile ( // @[2_Decode.scala 95:25]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_r_0_addr(regFile_io_r_0_addr),
    .io_r_0_data(regFile_io_r_0_data),
    .io_r_1_addr(regFile_io_r_1_addr),
    .io_r_1_data(regFile_io_r_1_data),
    .io_w_0_addr(regFile_io_w_0_addr),
    .io_w_0_en(regFile_io_w_0_en),
    .io_w_0_data(regFile_io_w_0_data),
    .io_state_regState_0(regFile_io_state_regState_0),
    .io_state_regState_1(regFile_io_state_regState_1),
    .io_state_regState_2(regFile_io_state_regState_2),
    .io_state_regState_3(regFile_io_state_regState_3),
    .io_state_regState_4(regFile_io_state_regState_4),
    .io_state_regState_5(regFile_io_state_regState_5),
    .io_state_regState_6(regFile_io_state_regState_6),
    .io_state_regState_7(regFile_io_state_regState_7),
    .io_state_regState_8(regFile_io_state_regState_8),
    .io_state_regState_9(regFile_io_state_regState_9),
    .io_state_regState_10(regFile_io_state_regState_10),
    .io_state_regState_11(regFile_io_state_regState_11),
    .io_state_regState_12(regFile_io_state_regState_12),
    .io_state_regState_13(regFile_io_state_regState_13),
    .io_state_regState_14(regFile_io_state_regState_14),
    .io_state_regState_15(regFile_io_state_regState_15),
    .io_state_regState_16(regFile_io_state_regState_16),
    .io_state_regState_17(regFile_io_state_regState_17),
    .io_state_regState_18(regFile_io_state_regState_18),
    .io_state_regState_19(regFile_io_state_regState_19),
    .io_state_regState_20(regFile_io_state_regState_20),
    .io_state_regState_21(regFile_io_state_regState_21),
    .io_state_regState_22(regFile_io_state_regState_22),
    .io_state_regState_23(regFile_io_state_regState_23),
    .io_state_regState_24(regFile_io_state_regState_24),
    .io_state_regState_25(regFile_io_state_regState_25),
    .io_state_regState_26(regFile_io_state_regState_26),
    .io_state_regState_27(regFile_io_state_regState_27),
    .io_state_regState_28(regFile_io_state_regState_28),
    .io_state_regState_29(regFile_io_state_regState_29),
    .io_state_regState_30(regFile_io_state_regState_30),
    .io_state_regState_31(regFile_io_state_regState_31)
  );
  ImmGen immGen ( // @[2_Decode.scala 106:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_fetch_ready = io_out_ready; // @[2_Decode.scala 56:39]
  assign io_out_valid = io_out_ready; // @[2_Decode.scala 139:34]
  assign io_out_bits_isBranch = ctrlUnit_io_out_isBranch; // @[2_Decode.scala 114:26]
  assign io_out_bits_isJump = ctrlUnit_io_out_isJump; // @[2_Decode.scala 115:24]
  assign io_out_bits_resultSrc = ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 116:27]
  assign io_out_bits_memWrEn = ctrlUnit_io_out_memWrEn; // @[2_Decode.scala 117:25]
  assign io_out_bits_memType = ctrlUnit_io_out_memType; // @[2_Decode.scala 119:25]
  assign io_out_bits_memSign = ctrlUnit_io_out_memSign; // @[2_Decode.scala 120:25]
  assign io_out_bits_aluOpSel = ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 121:26]
  assign io_out_bits_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 124:25]
  assign io_out_bits_regWrEn = ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 123:25]
  assign io_out_bits_pcAddReg = ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 122:26]
  assign io_out_bits_aluSrc = ctrlUnit_io_out_aluSrc; // @[2_Decode.scala 125:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[2_Decode.scala 130:25]
  assign io_out_bits_data1 = regFile_io_r_0_data; // @[2_Decode.scala 127:23]
  assign io_out_bits_data2 = regFile_io_r_1_data; // @[2_Decode.scala 128:23]
  assign io_out_bits_imm = immGen_io_imm; // @[2_Decode.scala 71:19 110:9]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[2_Decode.scala 132:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[2_Decode.scala 132:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[2_Decode.scala 132:27]
  assign io_regState_regState_0 = regFile_io_state_regState_0; // @[2_Decode.scala 133:17]
  assign io_regState_regState_1 = regFile_io_state_regState_1; // @[2_Decode.scala 133:17]
  assign io_regState_regState_2 = regFile_io_state_regState_2; // @[2_Decode.scala 133:17]
  assign io_regState_regState_3 = regFile_io_state_regState_3; // @[2_Decode.scala 133:17]
  assign io_regState_regState_4 = regFile_io_state_regState_4; // @[2_Decode.scala 133:17]
  assign io_regState_regState_5 = regFile_io_state_regState_5; // @[2_Decode.scala 133:17]
  assign io_regState_regState_6 = regFile_io_state_regState_6; // @[2_Decode.scala 133:17]
  assign io_regState_regState_7 = regFile_io_state_regState_7; // @[2_Decode.scala 133:17]
  assign io_regState_regState_8 = regFile_io_state_regState_8; // @[2_Decode.scala 133:17]
  assign io_regState_regState_9 = regFile_io_state_regState_9; // @[2_Decode.scala 133:17]
  assign io_regState_regState_10 = regFile_io_state_regState_10; // @[2_Decode.scala 133:17]
  assign io_regState_regState_11 = regFile_io_state_regState_11; // @[2_Decode.scala 133:17]
  assign io_regState_regState_12 = regFile_io_state_regState_12; // @[2_Decode.scala 133:17]
  assign io_regState_regState_13 = regFile_io_state_regState_13; // @[2_Decode.scala 133:17]
  assign io_regState_regState_14 = regFile_io_state_regState_14; // @[2_Decode.scala 133:17]
  assign io_regState_regState_15 = regFile_io_state_regState_15; // @[2_Decode.scala 133:17]
  assign io_regState_regState_16 = regFile_io_state_regState_16; // @[2_Decode.scala 133:17]
  assign io_regState_regState_17 = regFile_io_state_regState_17; // @[2_Decode.scala 133:17]
  assign io_regState_regState_18 = regFile_io_state_regState_18; // @[2_Decode.scala 133:17]
  assign io_regState_regState_19 = regFile_io_state_regState_19; // @[2_Decode.scala 133:17]
  assign io_regState_regState_20 = regFile_io_state_regState_20; // @[2_Decode.scala 133:17]
  assign io_regState_regState_21 = regFile_io_state_regState_21; // @[2_Decode.scala 133:17]
  assign io_regState_regState_22 = regFile_io_state_regState_22; // @[2_Decode.scala 133:17]
  assign io_regState_regState_23 = regFile_io_state_regState_23; // @[2_Decode.scala 133:17]
  assign io_regState_regState_24 = regFile_io_state_regState_24; // @[2_Decode.scala 133:17]
  assign io_regState_regState_25 = regFile_io_state_regState_25; // @[2_Decode.scala 133:17]
  assign io_regState_regState_26 = regFile_io_state_regState_26; // @[2_Decode.scala 133:17]
  assign io_regState_regState_27 = regFile_io_state_regState_27; // @[2_Decode.scala 133:17]
  assign io_regState_regState_28 = regFile_io_state_regState_28; // @[2_Decode.scala 133:17]
  assign io_regState_regState_29 = regFile_io_state_regState_29; // @[2_Decode.scala 133:17]
  assign io_regState_regState_30 = regFile_io_state_regState_30; // @[2_Decode.scala 133:17]
  assign io_regState_regState_31 = regFile_io_state_regState_31; // @[2_Decode.scala 133:17]
  assign ctrlUnit_io_in_inst = stageReg_instState_inst; // @[2_Decode.scala 92:25]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign regFile_io_r_1_addr = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign regFile_io_w_0_addr = io_in_writeback_bits_rd; // @[2_Decode.scala 103:26]
  assign regFile_io_w_0_en = io_in_writeback_bits_regWrEn; // @[2_Decode.scala 102:56]
  assign regFile_io_w_0_data = io_in_writeback_bits_regWrData; // @[2_Decode.scala 104:26]
  assign immGen_io_inst = stageReg_instState_inst; // @[2_Decode.scala 107:20]
  assign immGen_io_immSrc = {{1'd0}, ctrlUnit_io_out_immSrc}; // @[2_Decode.scala 108:22]
  assign immGen_io_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 109:23]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcNext4 <= io_in_fetch_bits_pcNext4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_commit <= io_in_fetch_bits_instState_commit; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_pc <= io_in_fetch_bits_instState_pc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_inst <= io_in_fetch_bits_instState_inst; // @[Reg.scala 36:22]
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
