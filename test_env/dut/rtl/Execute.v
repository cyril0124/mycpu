module Execute(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input         io_in_bits_isBranch,
  input         io_in_bits_isJump,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_memWrEn,
  input  [2:0]  io_in_bits_memType,
  input         io_in_bits_memSign,
  input  [3:0]  io_in_bits_aluOpSel,
  input         io_in_bits_immSign,
  input         io_in_bits_regWrEn,
  input         io_in_bits_pcAddReg,
  input         io_in_bits_aluSrc,
  input  [31:0] io_in_bits_pcNext4,
  input  [31:0] io_in_bits_data1,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_imm,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_memory_bits_resultSrc,
  output        io_out_memory_bits_memWrEn,
  output [2:0]  io_out_memory_bits_memType,
  output        io_out_memory_bits_memSign,
  output        io_out_memory_bits_regWrEn,
  output [31:0] io_out_memory_bits_aluOut,
  output [31:0] io_out_memory_bits_data2,
  output [31:0] io_out_memory_bits_pcNext4,
  output        io_out_memory_bits_instState_commit,
  output [31:0] io_out_memory_bits_instState_pc,
  output [31:0] io_out_memory_bits_instState_inst,
  input         io_out_fetch_ready,
  output        io_out_fetch_bits_brTaken,
  output [31:0] io_out_fetch_bits_targetAddr,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  input  [1:0]  io_hazard_in_aluSrc1,
  input  [1:0]  io_hazard_in_aluSrc2,
  input  [31:0] io_hazard_in_rdValM,
  input  [31:0] io_hazard_in_rdValW,
  input         io_ctrl_flush
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_in1; // @[3_Execute.scala 81:21]
  wire [31:0] alu_io_in2; // @[3_Execute.scala 81:21]
  wire [3:0] alu_io_opSel; // @[3_Execute.scala 81:21]
  wire [31:0] alu_io_out; // @[3_Execute.scala 81:21]
  wire  alu_io_zero; // @[3_Execute.scala 81:21]
  wire  executeLatch = io_in_valid & io_out_fetch_ready; // @[3_Execute.scala 71:59]
  reg  stageReg_isBranch; // @[Reg.scala 35:20]
  reg  stageReg_isJump; // @[Reg.scala 35:20]
  reg [1:0] stageReg_resultSrc; // @[Reg.scala 35:20]
  reg  stageReg_memWrEn; // @[Reg.scala 35:20]
  reg [2:0] stageReg_memType; // @[Reg.scala 35:20]
  reg  stageReg_memSign; // @[Reg.scala 35:20]
  reg [3:0] stageReg_aluOpSel; // @[Reg.scala 35:20]
  reg  stageReg_immSign; // @[Reg.scala 35:20]
  reg  stageReg_regWrEn; // @[Reg.scala 35:20]
  reg  stageReg_pcAddReg; // @[Reg.scala 35:20]
  reg  stageReg_aluSrc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data1; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data2; // @[Reg.scala 35:20]
  reg [31:0] stageReg_imm; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  wire [31:0] _alu_io_in1_T_3 = 2'h1 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValM : stageReg_data1; // @[Mux.scala 81:58]
  wire [31:0] _data2_T_3 = 2'h1 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValM : stageReg_data2; // @[Mux.scala 81:58]
  wire [31:0] data2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _data2_T_3; // @[Mux.scala 81:58]
  wire  aluZero = alu_io_zero; // @[3_Execute.scala 78:23 99:13]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_5 = $signed(stageReg_imm) + $signed(stageReg_instState_pc); // @[3_Execute.scala 106:98]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_7 = stageReg_imm + stageReg_instState_pc; // @[3_Execute.scala 107:58]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_8 = stageReg_immSign ? _io_out_fetch_bits_targetAddr_T_5 :
    _io_out_fetch_bits_targetAddr_T_7; // @[3_Execute.scala 105:44]
  Alu alu ( // @[3_Execute.scala 81:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out),
    .io_zero(alu_io_zero)
  );
  assign io_in_ready = io_out_fetch_ready; // @[3_Execute.scala 70:40]
  assign io_out_memory_bits_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 122:16 113:34]
  assign io_out_memory_bits_memWrEn = stageReg_memWrEn; // @[3_Execute.scala 122:16 114:32]
  assign io_out_memory_bits_memType = stageReg_memType; // @[3_Execute.scala 122:16 117:32]
  assign io_out_memory_bits_memSign = stageReg_memSign; // @[3_Execute.scala 122:16 116:32]
  assign io_out_memory_bits_regWrEn = stageReg_regWrEn; // @[3_Execute.scala 122:16 118:32]
  assign io_out_memory_bits_aluOut = alu_io_out; // @[3_Execute.scala 122:16 112:31]
  assign io_out_memory_bits_data2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _data2_T_3; // @[Mux.scala 81:58]
  assign io_out_memory_bits_pcNext4 = stageReg_pcNext4; // @[3_Execute.scala 122:16 120:32]
  assign io_out_memory_bits_instState_commit = stageReg_instState_commit; // @[3_Execute.scala 137:34]
  assign io_out_memory_bits_instState_pc = stageReg_instState_pc; // @[3_Execute.scala 137:34]
  assign io_out_memory_bits_instState_inst = stageReg_instState_inst; // @[3_Execute.scala 137:34]
  assign io_out_fetch_bits_brTaken = stageReg_isBranch & aluZero | stageReg_isJump; // @[3_Execute.scala 102:65]
  assign io_out_fetch_bits_targetAddr = stageReg_pcAddReg ? alu_io_out : _io_out_fetch_bits_targetAddr_T_8; // @[3_Execute.scala 103:40]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign alu_io_in1 = 2'h2 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValW : _alu_io_in1_T_3; // @[Mux.scala 81:58]
  assign alu_io_in2 = stageReg_aluSrc ? stageReg_imm : data2; // @[3_Execute.scala 96:22]
  assign alu_io_opSel = stageReg_aluOpSel; // @[3_Execute.scala 98:18]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_isBranch <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_isBranch <= io_in_bits_isBranch; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_isJump <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_isJump <= io_in_bits_isJump; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_resultSrc <= 2'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memWrEn <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memWrEn <= io_in_bits_memWrEn; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memType <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memType <= 3'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memType <= io_in_bits_memType; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memSign <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memSign <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memSign <= io_in_bits_memSign; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluOpSel <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_aluOpSel <= io_in_bits_aluOpSel; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_immSign <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_immSign <= io_in_bits_immSign; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_regWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_regWrEn <= io_in_bits_regWrEn; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcAddReg <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcAddReg <= io_in_bits_pcAddReg; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluSrc <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_aluSrc <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_aluSrc <= io_in_bits_aluSrc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data1 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_data1 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_data1 <= io_in_bits_data1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data2 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_data2 <= io_in_bits_data2; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_imm <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_imm <= io_in_bits_imm; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[Reg.scala 36:22]
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
  stageReg_isBranch = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_isJump = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_resultSrc = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_memWrEn = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_memType = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_memSign = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_aluOpSel = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_immSign = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_pcAddReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_aluSrc = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_data1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_data2 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_imm = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_17[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
