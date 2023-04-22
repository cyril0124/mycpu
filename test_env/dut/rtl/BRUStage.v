module BRUStage(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits_opr1,
  input  [3:0]  io_in_bits_opr2,
  input  [3:0]  io_in_bits_bruOp,
  input  [2:0]  io_in_bits_immSrc,
  input  [31:0] io_in_bits_inst,
  input  [31:0] io_in_bits_pc,
  input  [7:0]  io_in_bits_id,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_brTaken,
  output [31:0] io_out_bits_brAddr,
  output [31:0] io_out_bits_data,
  output [4:0]  io_out_bits_rd,
  output        io_out_bits_wrEn,
  output [31:0] io_out_bits_inst,
  output [31:0] io_out_bits_pc,
  output [7:0]  io_out_bits_id,
  output [4:0]  io_rfRd_0_addr,
  output        io_rfRd_0_en,
  input  [31:0] io_rfRd_0_data,
  output [4:0]  io_rfRd_1_addr,
  input  [31:0] io_rfRd_1_data,
  input         io_rfRdReady,
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] immGen_io_inst; // @[BRU.scala 119:24]
  wire [2:0] immGen_io_immSrc; // @[BRU.scala 119:24]
  wire  immGen_io_immSign; // @[BRU.scala 119:24]
  wire [31:0] immGen_io_imm; // @[BRU.scala 119:24]
  wire [31:0] bru_io_in1; // @[BRU.scala 155:21]
  wire [31:0] bru_io_in2; // @[BRU.scala 155:21]
  wire [31:0] bru_io_offset; // @[BRU.scala 155:21]
  wire [31:0] bru_io_pc; // @[BRU.scala 155:21]
  wire [3:0] bru_io_opSel; // @[BRU.scala 155:21]
  wire [31:0] bru_io_brAddr; // @[BRU.scala 155:21]
  wire  bru_io_brTaken; // @[BRU.scala 155:21]
  reg  s0_full; // @[BRU.scala 96:26]
  wire  s0_valid = io_rfRdReady & s0_full; // @[BRU.scala 135:30]
  reg  s1_full; // @[BRU.scala 141:26]
  wire  s1_fire = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  s1_ready = ~s1_full | s1_fire; // @[BRU.scala 150:26]
  wire  s0_fire = s0_valid & s1_ready; // @[BRU.scala 97:28]
  wire  s0_ready = ~s0_full | s0_fire; // @[BRU.scala 99:26]
  wire  s0_latch = io_in_valid & s0_ready; // @[BRU.scala 95:32]
  reg [3:0] s0_info_opr1; // @[Reg.scala 19:16]
  reg [3:0] s0_info_opr2; // @[Reg.scala 19:16]
  reg [3:0] s0_info_bruOp; // @[Reg.scala 19:16]
  reg [2:0] s0_info_immSrc; // @[Reg.scala 19:16]
  reg [31:0] s0_info_inst; // @[Reg.scala 19:16]
  reg [31:0] s0_info_pc; // @[Reg.scala 19:16]
  reg [7:0] s0_info_id; // @[Reg.scala 19:16]
  wire  _GEN_7 = s0_fire & s0_full ? 1'h0 : s0_full; // @[BRU.scala 102:{35,45} 96:26]
  wire  _GEN_8 = s0_latch | _GEN_7; // @[BRU.scala 101:{20,30}]
  wire [4:0] s0_rs1 = s0_info_inst[19:15]; // @[util.scala 72:31]
  wire [4:0] s0_rs2 = s0_info_inst[24:20]; // @[util.scala 73:31]
  wire [4:0] s0_rd = s0_info_inst[11:7]; // @[util.scala 71:31]
  reg [3:0] s1_bruOp; // @[Reg.scala 19:16]
  reg [4:0] s1_rd; // @[Reg.scala 19:16]
  reg [31:0] s1_bruInVec_0; // @[Reg.scala 19:16]
  reg [31:0] s1_bruInVec_1; // @[Reg.scala 19:16]
  reg [31:0] s1_imm; // @[Reg.scala 19:16]
  reg [31:0] s1_pc; // @[Reg.scala 19:16]
  reg [31:0] s1_inst; // @[Reg.scala 19:16]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_17 = s1_fire & s1_full ? 1'h0 : s1_full; // @[BRU.scala 141:26 153:{35,45}]
  wire  _GEN_18 = s0_fire | _GEN_17; // @[BRU.scala 152:{20,30}]
  ImmGen immGen ( // @[BRU.scala 119:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  BRU bru ( // @[BRU.scala 155:21]
    .io_in1(bru_io_in1),
    .io_in2(bru_io_in2),
    .io_offset(bru_io_offset),
    .io_pc(bru_io_pc),
    .io_opSel(bru_io_opSel),
    .io_brAddr(bru_io_brAddr),
    .io_brTaken(bru_io_brTaken)
  );
  assign io_in_ready = ~s0_full | s0_fire; // @[BRU.scala 99:26]
  assign io_out_valid = s1_full; // @[BRU.scala 170:18]
  assign io_out_bits_brTaken = bru_io_brTaken & s1_full; // @[BRU.scala 162:43]
  assign io_out_bits_brAddr = bru_io_brAddr; // @[BRU.scala 163:24]
  assign io_out_bits_data = s1_pc + 32'h4; // @[BRU.scala 165:31]
  assign io_out_bits_rd = s1_rd; // @[BRU.scala 166:20]
  assign io_out_bits_wrEn = (s1_bruOp == 4'h1 | s1_bruOp == 4'h2) & s1_full; // @[BRU.scala 164:72]
  assign io_out_bits_inst = s1_inst; // @[BRU.scala 168:22]
  assign io_out_bits_pc = s1_pc; // @[BRU.scala 167:20]
  assign io_out_bits_id = s1_id; // @[BRU.scala 169:20]
  assign io_rfRd_0_addr = s0_info_opr1 == 4'h1 ? s0_rs1 : 5'h0; // @[BRU.scala 107:21]
  assign io_rfRd_0_en = s0_full; // @[BRU.scala 114:23]
  assign io_rfRd_1_addr = s0_info_opr2 == 4'h2 ? s0_rs2 : 5'h0; // @[BRU.scala 108:21]
  assign immGen_io_inst = s0_info_inst; // @[BRU.scala 123:20]
  assign immGen_io_immSrc = s0_info_immSrc; // @[BRU.scala 121:22]
  assign immGen_io_immSign = 1'h1; // @[BRU.scala 122:23]
  assign bru_io_in1 = s1_bruInVec_0; // @[BRU.scala 156:16]
  assign bru_io_in2 = s1_bruInVec_1; // @[BRU.scala 157:16]
  assign bru_io_offset = s1_imm; // @[BRU.scala 158:19]
  assign bru_io_pc = s1_pc; // @[BRU.scala 159:15]
  assign bru_io_opSel = s1_bruOp; // @[BRU.scala 160:18]
  always @(posedge clock) begin
    if (reset) begin // @[BRU.scala 96:26]
      s0_full <= 1'h0; // @[BRU.scala 96:26]
    end else if (io_flush) begin // @[BRU.scala 174:20]
      s0_full <= 1'h0; // @[BRU.scala 175:17]
    end else begin
      s0_full <= _GEN_8;
    end
    if (reset) begin // @[BRU.scala 141:26]
      s1_full <= 1'h0; // @[BRU.scala 141:26]
    end else if (io_flush) begin // @[BRU.scala 174:20]
      s1_full <= 1'h0; // @[BRU.scala 176:17]
    end else begin
      s1_full <= _GEN_18;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_opr1 <= io_in_bits_opr1; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_opr2 <= io_in_bits_opr2; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_bruOp <= io_in_bits_bruOp; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_immSrc <= io_in_bits_immSrc; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_inst <= io_in_bits_inst; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_pc <= io_in_bits_pc; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_id <= io_in_bits_id; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_bruOp <= s0_info_bruOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rd <= s0_rd; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (4'h1 == s0_info_opr1) begin // @[Mux.scala 81:58]
        s1_bruInVec_0 <= io_rfRd_0_data;
      end else begin
        s1_bruInVec_0 <= 32'h0;
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (4'h2 == s0_info_opr2) begin // @[Mux.scala 81:58]
        s1_bruInVec_1 <= io_rfRd_1_data;
      end else begin
        s1_bruInVec_1 <= 32'h0;
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_imm <= immGen_io_imm; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_pc <= s0_info_pc; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_inst <= s0_info_inst; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_id <= s0_info_id; // @[Reg.scala 20:22]
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
  s0_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_full = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_info_opr1 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  s0_info_opr2 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s0_info_bruOp = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  s0_info_immSrc = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  s0_info_inst = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s0_info_pc = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s0_info_id = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  s1_bruOp = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  s1_rd = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  s1_bruInVec_0 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  s1_bruInVec_1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_imm = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  s1_pc = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  s1_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  s1_id = _RAND_16[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
