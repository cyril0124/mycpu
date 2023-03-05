module Memory(
  input         clock,
  input         reset,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_memWrEn,
  input  [2:0]  io_in_bits_memType,
  input         io_in_bits_memSign,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_rdData,
  output [31:0] io_out_bits_aluOut,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn
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
  wire  dataMem_clock; // @[4_Memory.scala 58:25]
  wire  dataMem_reset; // @[4_Memory.scala 58:25]
  wire  dataMem_io_wen; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_waddr; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_wdata; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_raddr; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_rdata; // @[4_Memory.scala 58:25]
  reg [1:0] stageReg_resultSrc; // @[Reg.scala 35:20]
  reg  stageReg_memWrEn; // @[Reg.scala 35:20]
  reg [2:0] stageReg_memType; // @[Reg.scala 35:20]
  reg  stageReg_memSign; // @[Reg.scala 35:20]
  reg  stageReg_regWrEn; // @[Reg.scala 35:20]
  reg [31:0] stageReg_aluOut; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data2; // @[Reg.scala 35:20]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  wire  _dataMemRdData_T = 3'h0 == stageReg_memType; // @[util.scala 61:21]
  wire  _dataMemRdData_out_T_1 = dataMem_io_rdata[7] & stageReg_memSign; // @[util.scala 63:60]
  wire [23:0] _dataMemRdData_out_T_3 = _dataMemRdData_out_T_1 ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _dataMemRdData_out_T_5 = {_dataMemRdData_out_T_3,dataMem_io_rdata[7:0]}; // @[Cat.scala 33:92]
  wire  _dataMemRdData_T_1 = 3'h1 == stageReg_memType; // @[util.scala 61:21]
  wire  _dataMemRdData_out_T_7 = dataMem_io_rdata[15] & stageReg_memSign; // @[util.scala 65:63]
  wire [15:0] _dataMemRdData_out_T_9 = _dataMemRdData_out_T_7 ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _dataMemRdData_out_T_11 = {_dataMemRdData_out_T_9,dataMem_io_rdata[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_24 = dataMem_io_rdata; // @[util.scala 60:13 61:21 69:25]
  wire [31:0] _GEN_25 = 3'h1 == stageReg_memType ? _dataMemRdData_out_T_11 : _GEN_24; // @[util.scala 61:21 65:32]
  wire [31:0] _dataMem_io_wdata_out_T_2 = {24'h0,stageReg_data2[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _dataMem_io_wdata_out_T_5 = {16'hffff,stageReg_data2[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_28 = _dataMemRdData_T_1 ? _dataMem_io_wdata_out_T_5 : stageReg_data2; // @[util.scala 92:21 96:32]
  wire [31:0] dataMemRdData = 3'h0 == stageReg_memType ? _dataMemRdData_out_T_5 : _GEN_25; // @[util.scala 61:21 63:32]
  RAM dataMem ( // @[4_Memory.scala 58:25]
    .clock(dataMem_clock),
    .reset(dataMem_reset),
    .io_wen(dataMem_io_wen),
    .io_waddr(dataMem_io_waddr),
    .io_wdata(dataMem_io_wdata),
    .io_raddr(dataMem_io_raddr),
    .io_rdata(dataMem_io_rdata)
  );
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Memory.scala 66:27]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Memory.scala 67:25]
  assign io_out_bits_rdData = dataMemRdData; // @[4_Memory.scala 69:24]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Memory.scala 70:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Memory.scala 71:25]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Memory.scala 73:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Memory.scala 73:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Memory.scala 73:27]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Memory.scala 79:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Memory.scala 78:23]
  assign dataMem_clock = clock;
  assign dataMem_reset = reset;
  assign dataMem_io_wen = stageReg_memWrEn; // @[4_Memory.scala 62:20]
  assign dataMem_io_waddr = stageReg_aluOut; // @[4_Memory.scala 61:22]
  assign dataMem_io_wdata = _dataMemRdData_T ? _dataMem_io_wdata_out_T_2 : _GEN_28; // @[util.scala 92:21 94:32]
  assign dataMem_io_raddr = stageReg_aluOut; // @[4_Memory.scala 60:22]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_resultSrc <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_resultSrc <= io_in_bits_resultSrc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memWrEn <= io_in_bits_memWrEn;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memType <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memType <= io_in_bits_memType;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memSign <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memSign <= io_in_bits_memSign;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_regWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_regWrEn <= io_in_bits_regWrEn;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluOut <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_aluOut <= io_in_bits_aluOut;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data2 <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_data2 <= io_in_bits_data2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_pcNext4 <= io_in_bits_pcNext4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_commit <= io_in_bits_instState_commit;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_pc <= io_in_bits_instState_pc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_inst <= io_in_bits_instState_inst;
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
  stageReg_memWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_memType = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_memSign = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_data2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_7[31:0];
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
