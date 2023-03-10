module WriteBack(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input  [31:0] io_in_bits_csrWrData,
  input  [11:0] io_in_bits_csrAddr,
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
  output [31:0] io_regfile_regWrData,
  output [2:0]  io_csrWrite_op,
  output [11:0] io_csrWrite_addr,
  output [31:0] io_csrWrite_data,
  output        io_csrWrite_retired,
  input  [31:0] io_ramData
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stageReg_resultSrc; // @[5_WriteBack.scala 52:27]
  reg  stageReg_regWrEn; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_aluOut; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_pcNext4; // @[5_WriteBack.scala 52:27]
  reg [2:0] stageReg_csrOp; // @[5_WriteBack.scala 52:27]
  reg  stageReg_csrWrEn; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_csrWrData; // @[5_WriteBack.scala 52:27]
  reg [11:0] stageReg_csrAddr; // @[5_WriteBack.scala 52:27]
  reg  stageReg_instState_commit; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_instState_pc; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_instState_inst; // @[5_WriteBack.scala 52:27]
  wire  _GEN_13 = io_in_ready & io_in_bits_regWrEn; // @[5_WriteBack.scala 53:26 54:18]
  wire  _GEN_17 = io_in_ready & io_in_bits_csrWrEn; // @[5_WriteBack.scala 53:26 54:18]
  wire  _GEN_21 = io_in_ready & io_in_bits_instState_commit; // @[5_WriteBack.scala 53:26 54:18]
  wire [31:0] _rdVal_T_3 = 2'h1 == stageReg_resultSrc ? io_ramData : stageReg_aluOut; // @[Mux.scala 81:58]
  assign io_in_ready = 1'h1; // @[5_WriteBack.scala 50:20]
  assign io_instState_commit = stageReg_instState_commit; // @[5_WriteBack.scala 78:18]
  assign io_instState_pc = stageReg_instState_pc; // @[5_WriteBack.scala 78:18]
  assign io_instState_inst = stageReg_instState_inst; // @[5_WriteBack.scala 78:18]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 83:23]
  assign io_regfile_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_regfile_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 70:24]
  assign io_regfile_regWrData = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_csrWrite_op = stageReg_csrWrEn ? stageReg_csrOp : 3'h1; // @[5_WriteBack.scala 75:28]
  assign io_csrWrite_addr = stageReg_csrAddr; // @[5_WriteBack.scala 73:22]
  assign io_csrWrite_data = stageReg_csrWrData; // @[5_WriteBack.scala 74:22]
  assign io_csrWrite_retired = stageReg_instState_commit; // @[5_WriteBack.scala 76:54]
  always @(posedge clock) begin
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_resultSrc <= 2'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_regWrEn <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_regWrEn <= _GEN_13;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_aluOut <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_aluOut <= io_in_bits_aluOut; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_pcNext4 <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrOp <= 3'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrOp <= io_in_bits_csrOp; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrWrEn <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_csrWrEn <= _GEN_17;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrWrData <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrAddr <= 12'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrAddr <= 12'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_commit <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_instState_commit <= _GEN_21;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_pc <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_inst <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[5_WriteBack.scala 54:18]
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
  stageReg_regWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
