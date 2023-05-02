module CSRStage_1(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [2:0]  io_in_bits_csrOp,
  input  [3:0]  io_in_bits_excpType,
  input  [31:0] io_in_bits_rs1Val,
  input  [31:0] io_in_bits_inst,
  input  [7:0]  io_in_bits_id,
  output        io_out_valid,
  output [4:0]  io_out_bits_rd,
  output [31:0] io_out_bits_data,
  output [31:0] io_out_bits_excpAddr,
  output        io_out_bits_excpValid,
  output [7:0]  io_out_bits_id,
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
`endif // RANDOMIZE_REG_INIT
  wire  csrFile_clock; // @[CSR.scala 190:25]
  wire  csrFile_reset; // @[CSR.scala 190:25]
  wire [2:0] csrFile_io_read_op; // @[CSR.scala 190:25]
  wire  csrFile_io_read_valid; // @[CSR.scala 190:25]
  wire [11:0] csrFile_io_read_addr; // @[CSR.scala 190:25]
  wire [31:0] csrFile_io_read_data; // @[CSR.scala 190:25]
  wire [2:0] csrFile_io_write_op; // @[CSR.scala 190:25]
  wire [11:0] csrFile_io_write_addr; // @[CSR.scala 190:25]
  wire [31:0] csrFile_io_write_data; // @[CSR.scala 190:25]
  wire [31:0] csrFile_io_mepc; // @[CSR.scala 190:25]
  wire [31:0] csrFile_io_trapVec; // @[CSR.scala 190:25]
  wire [31:0] csrFile_csrState_0_mcycle; // @[CSR.scala 190:25]
  wire [31:0] csrFile_csrState_0_mcycleh; // @[CSR.scala 190:25]
  wire [31:0] immGen_io_inst; // @[CSR.scala 216:24]
  wire [2:0] immGen_io_immSrc; // @[CSR.scala 216:24]
  wire  immGen_io_immSign; // @[CSR.scala 216:24]
  wire [31:0] immGen_io_imm; // @[CSR.scala 216:24]
  reg  s1_full; // @[CSR.scala 243:26]
  wire  s1_ready = ~s1_full | io_out_valid; // @[CSR.scala 253:26]
  wire  s0_latch = io_in_valid & s1_ready; // @[CSR.scala 206:32]
  wire [11:0] s0_csrAddr = io_in_bits_inst[31:20]; // @[util.scala 78:36]
  wire  s0_csrWrEn = io_in_bits_csrOp != 3'h0 & csrFile_io_read_valid; // @[CSR.scala 232:43]
  wire  s1_latch = s0_latch & s1_ready; // @[CSR.scala 242:29]
  reg [4:0] s1_rd; // @[Reg.scala 19:16]
  reg [2:0] s1_csrOp; // @[Reg.scala 19:16]
  reg [3:0] s1_excpType; // @[Reg.scala 19:16]
  reg [11:0] s1_csrAddr; // @[Reg.scala 19:16]
  reg  s1_csrWrEn; // @[Reg.scala 19:16]
  reg [31:0] s1_csrWrData; // @[Reg.scala 19:16]
  reg [31:0] s1_csrRdData; // @[Reg.scala 19:16]
  reg [7:0] s1_id; // @[Reg.scala 19:16]
  wire  _GEN_8 = io_out_valid & s1_full ? 1'h0 : s1_full; // @[CSR.scala 243:26 256:{35,45}]
  wire  _GEN_9 = s1_latch | _GEN_8; // @[CSR.scala 255:{20,30}]
  CsrFile csrFile ( // @[CSR.scala 190:25]
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
  ImmGen immGen ( // @[CSR.scala 216:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = ~s1_full | io_out_valid; // @[CSR.scala 253:26]
  assign io_out_valid = s1_full; // @[CSR.scala 269:18]
  assign io_out_bits_rd = s1_rd; // @[CSR.scala 267:20]
  assign io_out_bits_data = s1_csrRdData; // @[CSR.scala 266:22]
  assign io_out_bits_excpAddr = 4'h4 == s1_excpType ? csrFile_io_mepc : csrFile_io_trapVec; // @[Mux.scala 81:58]
  assign io_out_bits_excpValid = s1_excpType != 4'h0; // @[CSR.scala 262:42]
  assign io_out_bits_id = s1_id; // @[CSR.scala 268:20]
  assign csrState_mcycle = csrFile_csrState_0_mcycle;
  assign csrState_mcycleh = csrFile_csrState_0_mcycleh;
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = io_in_bits_csrOp; // @[CSR.scala 229:24]
  assign csrFile_io_read_addr = io_in_bits_inst[31:20]; // @[util.scala 78:36]
  assign csrFile_io_write_op = s1_csrWrEn ? s1_csrOp : 3'h1; // @[CSR.scala 260:31]
  assign csrFile_io_write_addr = s1_csrAddr; // @[CSR.scala 258:27]
  assign csrFile_io_write_data = s1_csrWrData; // @[CSR.scala 259:27]
  assign immGen_io_inst = io_in_bits_inst; // @[CSR.scala 220:20]
  assign immGen_io_immSrc = 3'h5; // @[CSR.scala 218:22]
  assign immGen_io_immSign = 1'h0; // @[CSR.scala 219:23]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 243:26]
      s1_full <= 1'h0; // @[CSR.scala 243:26]
    end else if (io_flush) begin // @[CSR.scala 273:20]
      s1_full <= 1'h0; // @[CSR.scala 275:17]
    end else begin
      s1_full <= _GEN_9;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_rd <= io_in_bits_inst[11:7]; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_csrOp <= io_in_bits_csrOp; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_excpType <= io_in_bits_excpType; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_csrAddr <= s0_csrAddr; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_csrWrEn <= s0_csrWrEn; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_csrWrData <= io_in_bits_rs1Val; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_csrRdData <= csrFile_io_read_data; // @[Reg.scala 20:22]
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
  s1_csrOp = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  s1_excpType = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_csrAddr = _RAND_4[11:0];
  _RAND_5 = {1{`RANDOM}};
  s1_csrWrEn = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_csrWrData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s1_csrRdData = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s1_id = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
