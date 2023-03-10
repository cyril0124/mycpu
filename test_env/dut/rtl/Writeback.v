module Writeback(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_rdData,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output        io_instState_commit,
  output [31:0] io_instState_pc,
  output [31:0] io_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  output [4:0]  io_regfile_rd,
  output        io_regfile_regWrEn,
  output [31:0] io_regfile_regWrData
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stageReg_resultSrc; // @[5_Writeback.scala 46:27]
  reg  stageReg_regWrEn; // @[5_Writeback.scala 46:27]
  reg [31:0] stageReg_rdData; // @[5_Writeback.scala 46:27]
  reg [31:0] stageReg_aluOut; // @[5_Writeback.scala 46:27]
  reg [31:0] stageReg_pcNext4; // @[5_Writeback.scala 46:27]
  reg  stageReg_instState_commit; // @[5_Writeback.scala 46:27]
  reg [31:0] stageReg_instState_pc; // @[5_Writeback.scala 46:27]
  reg [31:0] stageReg_instState_inst; // @[5_Writeback.scala 46:27]
  wire  _GEN_1 = io_in_ready & io_in_bits_regWrEn; // @[5_Writeback.scala 47:26 48:18 50:18]
  wire  _GEN_5 = io_in_ready & io_in_bits_instState_commit; // @[5_Writeback.scala 47:26 48:18 50:18]
  wire [31:0] _io_regfile_regWrData_T_3 = 2'h1 == stageReg_resultSrc ? stageReg_rdData : stageReg_aluOut; // @[Mux.scala 81:58]
  assign io_in_ready = 1'h1; // @[5_Writeback.scala 44:20]
  assign io_instState_commit = stageReg_instState_commit; // @[5_Writeback.scala 64:18]
  assign io_instState_pc = stageReg_instState_pc; // @[5_Writeback.scala 64:18]
  assign io_instState_inst = stageReg_instState_inst; // @[5_Writeback.scala 64:18]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[5_Writeback.scala 68:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_Writeback.scala 69:23]
  assign io_regfile_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_regfile_regWrEn = stageReg_regWrEn; // @[5_Writeback.scala 62:24]
  assign io_regfile_regWrData = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _io_regfile_regWrData_T_3; // @[Mux.scala 81:58]
  always @(posedge clock) begin
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_resultSrc <= 2'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_resultSrc <= 2'h0; // @[5_Writeback.scala 50:18]
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_regWrEn <= 1'h0; // @[5_Writeback.scala 46:27]
    end else begin
      stageReg_regWrEn <= _GEN_1;
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_rdData <= 32'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_rdData <= io_in_bits_rdData; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_rdData <= 32'h0; // @[5_Writeback.scala 50:18]
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_aluOut <= 32'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_aluOut <= io_in_bits_aluOut; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_aluOut <= 32'h0; // @[5_Writeback.scala 50:18]
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_pcNext4 <= 32'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_pcNext4 <= 32'h0; // @[5_Writeback.scala 50:18]
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_instState_commit <= 1'h0; // @[5_Writeback.scala 46:27]
    end else begin
      stageReg_instState_commit <= _GEN_5;
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_instState_pc <= 32'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_instState_pc <= 32'h0; // @[5_Writeback.scala 50:18]
    end
    if (reset) begin // @[5_Writeback.scala 46:27]
      stageReg_instState_inst <= 32'h0; // @[5_Writeback.scala 46:27]
    end else if (io_in_ready) begin // @[5_Writeback.scala 47:26]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[5_Writeback.scala 48:18]
    end else begin
      stageReg_instState_inst <= 32'h0; // @[5_Writeback.scala 50:18]
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
  stageReg_regWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_rdData = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
