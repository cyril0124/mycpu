module CSRStage(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [2:0]  io_in_bits_csrOp,
  input  [3:0]  io_in_bits_excpType,
  input  [31:0] io_in_bits_inst,
  input  [31:0] io_in_bits_pc,
  input  [7:0]  io_in_bits_id,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [4:0]  io_out_bits_rd,
  output        io_out_bits_wrEn,
  output [31:0] io_out_bits_excpAddr,
  output        io_out_bits_excpValid,
  output [31:0] io_out_bits_inst,
  output [31:0] io_out_bits_pc,
  output [7:0]  io_out_bits_id,
  output [4:0]  io_rfRd_0_addr,
  output        io_rfRd_0_en,
  input  [31:0] io_rfRd_0_data,
  input         io_rfRdReady,
  input         io_flush,
  output [31:0] csrState_mcycle,
  output [31:0] csrState_mcycleh
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
  wire  csrFile_clock; // @[CSR.scala 54:25]
  wire  csrFile_reset; // @[CSR.scala 54:25]
  wire [2:0] csrFile_io_read_op; // @[CSR.scala 54:25]
  wire  csrFile_io_read_valid; // @[CSR.scala 54:25]
  wire [11:0] csrFile_io_read_addr; // @[CSR.scala 54:25]
  wire [31:0] csrFile_io_read_data; // @[CSR.scala 54:25]
  wire [2:0] csrFile_io_write_op; // @[CSR.scala 54:25]
  wire [11:0] csrFile_io_write_addr; // @[CSR.scala 54:25]
  wire [31:0] csrFile_io_write_data; // @[CSR.scala 54:25]
  wire [31:0] csrFile_io_mepc; // @[CSR.scala 54:25]
  wire [31:0] csrFile_io_trapVec; // @[CSR.scala 54:25]
  wire [31:0] csrFile_csrState_0_mcycle; // @[CSR.scala 54:25]
  wire [31:0] csrFile_csrState_0_mcycleh; // @[CSR.scala 54:25]
  wire [31:0] immGen_io_inst; // @[CSR.scala 78:24]
  wire [2:0] immGen_io_immSrc; // @[CSR.scala 78:24]
  wire  immGen_io_immSign; // @[CSR.scala 78:24]
  wire [31:0] immGen_io_imm; // @[CSR.scala 78:24]
  reg  s0_full; // @[CSR.scala 70:26]
  wire  s0_valid = io_rfRdReady & s0_full; // @[CSR.scala 110:30]
  reg  s1_full; // @[CSR.scala 117:26]
  wire  s1_fire = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  s1_ready = ~s1_full | s1_fire; // @[CSR.scala 129:26]
  wire  s0_fire = s0_valid & s1_ready; // @[CSR.scala 71:28]
  wire  s0_ready = ~s0_full | s0_fire; // @[CSR.scala 73:26]
  wire  s0_latch = io_in_valid & s0_ready; // @[CSR.scala 69:32]
  reg [2:0] s0_info_csrOp; // @[Reg.scala 19:16]
  reg [3:0] s0_info_excpType; // @[Reg.scala 19:16]
  reg [31:0] s0_info_inst; // @[Reg.scala 19:16]
  reg [31:0] s0_info_pc; // @[Reg.scala 19:16]
  reg [7:0] s0_info_id; // @[Reg.scala 19:16]
  wire  _GEN_5 = s0_fire & s0_full ? 1'h0 : s0_full; // @[CSR.scala 70:26 76:{35,45}]
  wire  _GEN_6 = s0_latch | _GEN_5; // @[CSR.scala 75:{20,30}]
  wire [4:0] s0_rd = s0_info_inst[11:7]; // @[util.scala 71:31]
  wire [11:0] s0_csrAddr = s0_info_inst[31:20]; // @[util.scala 78:36]
  wire  s0_csrWrEn = s0_info_csrOp != 3'h0 & csrFile_io_read_valid; // @[CSR.scala 106:43]
  reg [2:0] s1_csrOp; // @[Reg.scala 19:16]
  reg [3:0] s1_excpType; // @[Reg.scala 19:16]
  reg [4:0] s1_rd; // @[Reg.scala 19:16]
  reg [11:0] s1_csrAddr; // @[Reg.scala 19:16]
  reg  s1_csrWrEn; // @[Reg.scala 19:16]
  reg [31:0] s1_csrWrData; // @[Reg.scala 19:16]
  reg [31:0] s1_csrRdData; // @[Reg.scala 19:16]
  reg [31:0] s1_pc; // @[Reg.scala 19:16]
  reg [31:0] s1_inst; // @[Reg.scala 19:16]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_17 = s1_fire & s1_full ? 1'h0 : s1_full; // @[CSR.scala 117:26 132:{35,45}]
  wire  _GEN_18 = s0_fire | _GEN_17; // @[CSR.scala 131:{20,30}]
  CsrFile csrFile ( // @[CSR.scala 54:25]
    .clock(csrFile_clock),
    .reset(csrFile_reset),
    .io_read_op(csrFile_io_read_op),
    .io_read_valid(csrFile_io_read_valid),
    .io_read_addr(csrFile_io_read_addr),
    .io_read_data(csrFile_io_read_data),
    .io_write_op(csrFile_io_write_op),
    .io_write_addr(csrFile_io_write_addr),
    .io_write_data(csrFile_io_write_data),
    .io_mepc(csrFile_io_mepc),
    .io_trapVec(csrFile_io_trapVec),
    .csrState_0_mcycle(csrFile_csrState_0_mcycle),
    .csrState_0_mcycleh(csrFile_csrState_0_mcycleh)
  );
  ImmGen immGen ( // @[CSR.scala 78:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = ~s0_full | s0_fire; // @[CSR.scala 73:26]
  assign io_out_valid = s1_full; // @[CSR.scala 148:18]
  assign io_out_bits_data = s1_csrRdData; // @[CSR.scala 143:22]
  assign io_out_bits_rd = s1_rd; // @[CSR.scala 144:20]
  assign io_out_bits_wrEn = s1_full; // @[CSR.scala 142:22]
  assign io_out_bits_excpAddr = 4'h4 == s1_excpType ? csrFile_io_mepc : csrFile_io_trapVec; // @[Mux.scala 81:58]
  assign io_out_bits_excpValid = s1_excpType != 4'h0; // @[CSR.scala 138:42]
  assign io_out_bits_inst = s1_inst; // @[CSR.scala 146:22]
  assign io_out_bits_pc = s1_pc; // @[CSR.scala 145:20]
  assign io_out_bits_id = s1_id; // @[CSR.scala 147:20]
  assign io_rfRd_0_addr = s0_info_inst[19:15]; // @[util.scala 72:31]
  assign io_rfRd_0_en = s0_full; // @[CSR.scala 95:23]
  assign csrState_mcycle = csrFile_csrState_0_mcycle;
  assign csrState_mcycleh = csrFile_csrState_0_mcycleh;
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = s0_info_csrOp; // @[CSR.scala 103:24]
  assign csrFile_io_read_addr = s0_info_inst[31:20]; // @[util.scala 78:36]
  assign csrFile_io_write_op = s1_csrWrEn ? s1_csrOp : 3'h1; // @[CSR.scala 136:31]
  assign csrFile_io_write_addr = s1_csrAddr; // @[CSR.scala 134:27]
  assign csrFile_io_write_data = s1_csrWrData; // @[CSR.scala 135:27]
  assign immGen_io_inst = s0_info_inst; // @[CSR.scala 82:20]
  assign immGen_io_immSrc = 3'h5; // @[CSR.scala 80:22]
  assign immGen_io_immSign = 1'h0; // @[CSR.scala 81:23]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 70:26]
      s0_full <= 1'h0; // @[CSR.scala 70:26]
    end else if (io_flush) begin // @[CSR.scala 152:20]
      s0_full <= 1'h0; // @[CSR.scala 153:17]
    end else begin
      s0_full <= _GEN_6;
    end
    if (reset) begin // @[CSR.scala 117:26]
      s1_full <= 1'h0; // @[CSR.scala 117:26]
    end else if (io_flush) begin // @[CSR.scala 152:20]
      s1_full <= 1'h0; // @[CSR.scala 154:17]
    end else begin
      s1_full <= _GEN_18;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_csrOp <= io_in_bits_csrOp; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_info_excpType <= io_in_bits_excpType; // @[Reg.scala 20:22]
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
      s1_csrOp <= s0_info_csrOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_excpType <= s0_info_excpType; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_rd <= s0_rd; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_csrAddr <= s0_csrAddr; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_csrWrEn <= s0_csrWrEn; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_csrWrData <= io_rfRd_0_data; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_csrRdData <= csrFile_io_read_data; // @[Reg.scala 20:22]
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
  s0_info_csrOp = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  s0_info_excpType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s0_info_inst = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s0_info_pc = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s0_info_id = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  s1_csrOp = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  s1_excpType = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  s1_rd = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  s1_csrAddr = _RAND_10[11:0];
  _RAND_11 = {1{`RANDOM}};
  s1_csrWrEn = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_csrWrData = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  s1_csrRdData = _RAND_13[31:0];
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
