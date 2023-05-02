module ALUStage_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits_opr1,
  input  [3:0]  io_in_bits_opr2,
  input  [4:0]  io_in_bits_aluOp,
  input  [2:0]  io_in_bits_immSrc,
  input         io_in_bits_immSign,
  input  [31:0] io_in_bits_rs1Val,
  input  [31:0] io_in_bits_rs2Val,
  input  [31:0] io_in_bits_inst,
  input  [31:0] io_in_bits_pc,
  input  [7:0]  io_in_bits_id,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [7:0]  io_out_bits_id,
  output [4:0]  io_out_bits_rd,
  input         io_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] immGen_io_inst; // @[ALU.scala 232:24]
  wire [2:0] immGen_io_immSrc; // @[ALU.scala 232:24]
  wire  immGen_io_immSign; // @[ALU.scala 232:24]
  wire [31:0] immGen_io_imm; // @[ALU.scala 232:24]
  wire [31:0] alu_io_in1; // @[ALU.scala 260:21]
  wire [31:0] alu_io_in2; // @[ALU.scala 260:21]
  wire [4:0] alu_io_opSel; // @[ALU.scala 260:21]
  wire [31:0] alu_io_out; // @[ALU.scala 260:21]
  reg  s1_full; // @[ALU.scala 249:26]
  wire  s1_ready = ~s1_full | io_out_valid; // @[ALU.scala 255:26]
  wire  s0_latch = io_in_valid & s1_ready; // @[ALU.scala 221:32]
  wire  s1_latch = s0_latch & s1_ready; // @[ALU.scala 248:29]
  reg [4:0] s1_rd; // @[Reg.scala 19:16]
  reg [4:0] s1_aluOp; // @[Reg.scala 19:16]
  reg [31:0] s1_aluInVec_0; // @[Reg.scala 19:16]
  reg [31:0] s1_aluInVec_1; // @[Reg.scala 19:16]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_5 = io_out_valid & s1_full ? 1'h0 : s1_full; // @[ALU.scala 249:26 258:{35,45}]
  wire  _GEN_6 = s1_latch | _GEN_5; // @[ALU.scala 257:{20,30}]
  ImmGen immGen ( // @[ALU.scala 232:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  ALU_1 alu ( // @[ALU.scala 260:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out)
  );
  assign io_in_ready = ~s1_full | io_out_valid; // @[ALU.scala 255:26]
  assign io_out_valid = s1_full; // @[ALU.scala 268:18]
  assign io_out_bits_data = alu_io_out; // @[ALU.scala 265:22]
  assign io_out_bits_id = s1_id; // @[ALU.scala 266:20]
  assign io_out_bits_rd = s1_rd; // @[ALU.scala 267:20]
  assign immGen_io_inst = io_in_bits_inst; // @[ALU.scala 236:20]
  assign immGen_io_immSrc = io_in_bits_immSrc; // @[ALU.scala 234:22]
  assign immGen_io_immSign = io_in_bits_immSign; // @[ALU.scala 235:23]
  assign alu_io_in1 = s1_aluInVec_0; // @[ALU.scala 261:16]
  assign alu_io_in2 = s1_aluInVec_1; // @[ALU.scala 262:16]
  assign alu_io_opSel = s1_aluOp; // @[ALU.scala 263:18]
  always @(posedge clock) begin
    if (reset) begin // @[ALU.scala 249:26]
      s1_full <= 1'h0; // @[ALU.scala 249:26]
    end else if (io_flush) begin // @[ALU.scala 272:20]
      s1_full <= 1'h0; // @[ALU.scala 274:17]
    end else begin
      s1_full <= _GEN_6;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_rd <= io_in_bits_inst[11:7]; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_aluOp <= io_in_bits_aluOp; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (io_in_bits_opr1 == 4'h0) begin // @[ALU.scala 239:26]
        s1_aluInVec_0 <= 32'h0;
      end else if (io_in_bits_opr1 == 4'h7) begin // @[ALU.scala 239:62]
        s1_aluInVec_0 <= io_in_bits_pc;
      end else begin
        s1_aluInVec_0 <= io_in_bits_rs1Val;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (io_in_bits_opr2 == 4'h0) begin // @[ALU.scala 240:26]
        s1_aluInVec_1 <= 32'h0;
      end else if (io_in_bits_opr2 == 4'h3) begin // @[ALU.scala 240:62]
        s1_aluInVec_1 <= immGen_io_imm;
      end else begin
        s1_aluInVec_1 <= io_in_bits_rs2Val;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_id <= io_in_bits_id; // @[Reg.scala 20:22]
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
  s1_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_rd = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  s1_aluOp = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  s1_aluInVec_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s1_aluInVec_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s1_id = _RAND_5[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
