module WriteBack(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input  [31:0] io_in_bits_csrRdData,
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
  input  [31:0] io_lsuData
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
`endif // RANDOMIZE_REG_INIT
  wire  writebackLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg [1:0] stageReg_resultSrc; // @[5_WriteBack.scala 44:27]
  reg  stageReg_regWrEn; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_aluOut; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_pcNext4; // @[5_WriteBack.scala 44:27]
  reg [2:0] stageReg_csrOp; // @[5_WriteBack.scala 44:27]
  reg  stageReg_csrWrEn; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_csrRdData; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_csrWrData; // @[5_WriteBack.scala 44:27]
  reg [11:0] stageReg_csrAddr; // @[5_WriteBack.scala 44:27]
  reg  stageReg_instState_commit; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_instState_pc; // @[5_WriteBack.scala 44:27]
  reg [31:0] stageReg_instState_inst; // @[5_WriteBack.scala 44:27]
  wire  _GEN_13 = writebackLatch & (io_in_bits_instState_commit & io_in_bits_regWrEn); // @[5_WriteBack.scala 45:26 46:18]
  wire  _GEN_17 = writebackLatch & (io_in_bits_instState_commit & io_in_bits_csrWrEn); // @[5_WriteBack.scala 45:26 46:18]
  wire  _GEN_21 = writebackLatch & io_in_bits_instState_commit; // @[5_WriteBack.scala 45:26 46:18]
  wire [31:0] _rdVal_T_1 = 2'h1 == stageReg_resultSrc ? io_lsuData : stageReg_aluOut; // @[Mux.scala 81:58]
  wire [31:0] _rdVal_T_3 = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_1; // @[Mux.scala 81:58]
  assign io_in_ready = io_in_valid; // @[5_WriteBack.scala 42:27]
  assign io_instState_commit = stageReg_instState_commit; // @[5_WriteBack.scala 73:55]
  assign io_instState_pc = stageReg_instState_pc; // @[5_WriteBack.scala 72:26]
  assign io_instState_inst = stageReg_instState_inst; // @[5_WriteBack.scala 72:26]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 71:31]
  assign io_hazard_rdVal = 2'h3 == stageReg_resultSrc ? stageReg_csrRdData : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 78:26]
  assign io_regfile_rd = stageReg_instState_inst[11:7]; // @[util.scala 71:31]
  assign io_regfile_regWrEn = stageReg_regWrEn & stageReg_instState_commit; // @[5_WriteBack.scala 64:46]
  assign io_regfile_regWrData = 2'h3 == stageReg_resultSrc ? stageReg_csrRdData : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_csrWrite_op = stageReg_csrWrEn ? stageReg_csrOp : 3'h1; // @[5_WriteBack.scala 69:32]
  assign io_csrWrite_addr = stageReg_csrAddr; // @[5_WriteBack.scala 67:26]
  assign io_csrWrite_data = stageReg_csrWrData; // @[5_WriteBack.scala 68:26]
  assign io_csrWrite_retired = stageReg_instState_commit; // @[5_WriteBack.scala 70:55]
  always @(posedge clock) begin
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_resultSrc <= 2'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_resultSrc <= io_in_bits_resultSrc;
      end else begin
        stageReg_resultSrc <= 2'h0;
      end
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_regWrEn <= 1'h0; // @[5_WriteBack.scala 44:27]
    end else begin
      stageReg_regWrEn <= _GEN_13;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_aluOut <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_aluOut <= io_in_bits_aluOut;
      end else begin
        stageReg_aluOut <= 32'h0;
      end
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_pcNext4 <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_pcNext4 <= io_in_bits_pcNext4;
      end else begin
        stageReg_pcNext4 <= 32'h0;
      end
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_csrOp <= 3'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_csrOp <= io_in_bits_csrOp;
      end else begin
        stageReg_csrOp <= 3'h0;
      end
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_csrWrEn <= 1'h0; // @[5_WriteBack.scala 44:27]
    end else begin
      stageReg_csrWrEn <= _GEN_17;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_csrRdData <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_csrRdData <= io_in_bits_csrRdData;
      end else begin
        stageReg_csrRdData <= 32'h0;
      end
    end else begin
      stageReg_csrRdData <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_csrWrData <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_csrWrData <= io_in_bits_csrWrData;
      end else begin
        stageReg_csrWrData <= 32'h0;
      end
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_csrAddr <= 12'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_csrAddr <= io_in_bits_csrAddr;
      end else begin
        stageReg_csrAddr <= 12'h0;
      end
    end else begin
      stageReg_csrAddr <= 12'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_instState_commit <= 1'h0; // @[5_WriteBack.scala 44:27]
    end else begin
      stageReg_instState_commit <= _GEN_21;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_instState_pc <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_instState_pc <= io_in_bits_instState_pc;
      end else begin
        stageReg_instState_pc <= 32'h0;
      end
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 44:27]
      stageReg_instState_inst <= 32'h0; // @[5_WriteBack.scala 44:27]
    end else if (writebackLatch) begin // @[5_WriteBack.scala 45:26]
      if (io_in_bits_instState_commit) begin // @[5_WriteBack.scala 46:24]
        stageReg_instState_inst <= io_in_bits_instState_inst;
      end else begin
        stageReg_instState_inst <= 32'h0;
      end
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
  stageReg_csrRdData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_8[11:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
