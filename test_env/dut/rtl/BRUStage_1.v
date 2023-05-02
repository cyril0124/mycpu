module BRUStage_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits_opr1,
  input  [3:0]  io_in_bits_opr2,
  input  [3:0]  io_in_bits_bruOp,
  input  [2:0]  io_in_bits_immSrc,
  input  [31:0] io_in_bits_rs1Val,
  input  [31:0] io_in_bits_rs2Val,
  input  [31:0] io_in_bits_inst,
  input  [31:0] io_in_bits_pc,
  input  [7:0]  io_in_bits_id,
  output        io_out_valid,
  output        io_out_bits_brTaken,
  output [31:0] io_out_bits_brAddr,
  output [4:0]  io_out_bits_rd,
  output [31:0] io_out_bits_data,
  output [7:0]  io_out_bits_id,
  input         io_flush
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
  wire [31:0] immGen_io_inst; // @[BRU.scala 230:24]
  wire [2:0] immGen_io_immSrc; // @[BRU.scala 230:24]
  wire  immGen_io_immSign; // @[BRU.scala 230:24]
  wire [31:0] immGen_io_imm; // @[BRU.scala 230:24]
  wire [31:0] bru_io_in1; // @[BRU.scala 266:21]
  wire [31:0] bru_io_in2; // @[BRU.scala 266:21]
  wire [31:0] bru_io_offset; // @[BRU.scala 266:21]
  wire [31:0] bru_io_pc; // @[BRU.scala 266:21]
  wire [3:0] bru_io_opSel; // @[BRU.scala 266:21]
  wire [31:0] bru_io_brAddr; // @[BRU.scala 266:21]
  wire  bru_io_brTaken; // @[BRU.scala 266:21]
  reg  s1_full; // @[BRU.scala 253:26]
  wire  s1_ready = ~s1_full | io_out_valid; // @[BRU.scala 261:26]
  wire  s0_latch = io_in_valid & s1_ready; // @[BRU.scala 220:32]
  wire  s1_latch = s0_latch & s1_ready; // @[BRU.scala 252:29]
  reg [3:0] s1_bruOp; // @[Reg.scala 19:16]
  reg [31:0] s1_bruInVec_0; // @[Reg.scala 19:16]
  reg [31:0] s1_bruInVec_1; // @[Reg.scala 19:16]
  reg [31:0] s1_imm; // @[Reg.scala 19:16]
  reg [31:0] s1_pc; // @[Reg.scala 19:16]
  reg [31:0] s1_inst; // @[Reg.scala 19:16]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_7 = io_out_valid & s1_full ? 1'h0 : s1_full; // @[BRU.scala 253:26 264:{35,45}]
  wire  _GEN_8 = s1_latch | _GEN_7; // @[BRU.scala 263:{20,30}]
  ImmGen immGen ( // @[BRU.scala 230:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  BRU bru ( // @[BRU.scala 266:21]
    .io_in1(bru_io_in1),
    .io_in2(bru_io_in2),
    .io_offset(bru_io_offset),
    .io_pc(bru_io_pc),
    .io_opSel(bru_io_opSel),
    .io_brAddr(bru_io_brAddr),
    .io_brTaken(bru_io_brTaken)
  );
  assign io_in_ready = ~s1_full | io_out_valid; // @[BRU.scala 261:26]
  assign io_out_valid = s1_full; // @[BRU.scala 279:18]
  assign io_out_bits_brTaken = bru_io_brTaken & s1_full; // @[BRU.scala 273:43]
  assign io_out_bits_brAddr = bru_io_brAddr; // @[BRU.scala 274:24]
  assign io_out_bits_rd = s1_bruOp != 4'h2 | s1_bruOp != 4'h1 ? 5'h0 : s1_inst[11:7]; // @[BRU.scala 275:26]
  assign io_out_bits_data = s1_pc + 32'h4; // @[BRU.scala 277:31]
  assign io_out_bits_id = s1_id; // @[BRU.scala 278:20]
  assign immGen_io_inst = io_in_bits_inst; // @[BRU.scala 234:20]
  assign immGen_io_immSrc = io_in_bits_immSrc; // @[BRU.scala 232:22]
  assign immGen_io_immSign = 1'h1; // @[BRU.scala 233:23]
  assign bru_io_in1 = s1_bruInVec_0; // @[BRU.scala 267:16]
  assign bru_io_in2 = s1_bruInVec_1; // @[BRU.scala 268:16]
  assign bru_io_offset = s1_imm; // @[BRU.scala 269:19]
  assign bru_io_pc = s1_pc; // @[BRU.scala 270:15]
  assign bru_io_opSel = s1_bruOp; // @[BRU.scala 271:18]
  always @(posedge clock) begin
    if (reset) begin // @[BRU.scala 253:26]
      s1_full <= 1'h0; // @[BRU.scala 253:26]
    end else if (io_flush) begin // @[BRU.scala 283:20]
      s1_full <= 1'h0; // @[BRU.scala 285:17]
    end else begin
      s1_full <= _GEN_8;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_bruOp <= io_in_bits_bruOp; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (4'h1 == io_in_bits_opr1) begin // @[Mux.scala 81:58]
        s1_bruInVec_0 <= io_in_bits_rs1Val;
      end else begin
        s1_bruInVec_0 <= 32'h0;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (4'h2 == io_in_bits_opr2) begin // @[Mux.scala 81:58]
        s1_bruInVec_1 <= io_in_bits_rs2Val;
      end else begin
        s1_bruInVec_1 <= 32'h0;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_imm <= immGen_io_imm; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_pc <= io_in_bits_pc; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_inst <= io_in_bits_inst; // @[Reg.scala 20:22]
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
  s1_bruOp = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  s1_bruInVec_0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_bruInVec_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  s1_imm = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s1_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s1_inst = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s1_id = _RAND_7[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
