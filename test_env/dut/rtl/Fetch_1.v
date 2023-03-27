module Fetch_1(
  input         clock,
  input         reset,
  input         io_in_start,
  input         io_in_execute_bits_brTaken,
  input  [31:0] io_in_execute_bits_targetAddr,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [2:0]  io_tlbus_req_bits_opcode,
  output [31:0] io_tlbus_req_bits_address,
  output [31:0] io_tlbus_req_bits_data,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data,
  input  [31:0] io_trapVec,
  input  [31:0] io_mepc,
  input         io_excp_valid,
  input         io_excp_bits_isMret
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
  wire  icache_clock; // @[1_Fetch.scala 151:24]
  wire  icache_reset; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_req_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_req_valid; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_read_req_bits_addr; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_resp_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_read_resp_valid; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_read_resp_bits_data; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_req_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_req_valid; // @[1_Fetch.scala 151:24]
  wire [2:0] icache_io_tlbus_req_bits_opcode; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_req_bits_data; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_resp_valid; // @[1_Fetch.scala 151:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_resp_bits_data; // @[1_Fetch.scala 151:24]
  reg [31:0] pcReg; // @[1_Fetch.scala 136:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  wire [31:0] _branchAddr_1_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 142:24]
  wire [31:0] _branchAddr_1_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcReg; // @[1_Fetch.scala 146:24]
  wire [31:0] branchAddr_1 = io_excp_valid ? _branchAddr_1_T : _branchAddr_1_T_1; // @[1_Fetch.scala 141:27]
  wire  hasBranch_1 = io_excp_valid | io_in_execute_bits_brTaken; // @[1_Fetch.scala 156:37]
  wire  _hasBranch_T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg  hasBranch_rs; // @[Reg.scala 35:20]
  wire  _GEN_0 = hasBranch_1 | hasBranch_rs; // @[Reg.scala 36:18 35:20 36:22]
  wire  hasBranch = hasBranch_1 | hasBranch_rs; // @[1_Fetch.scala 157:24]
  reg [31:0] branchAddr_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_2 = hasBranch_1 ? branchAddr_1 : branchAddr_r; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] pcNext = _GEN_0 ? _GEN_2 : pcNext4; // @[1_Fetch.scala 161:18]
  wire  _instValid_T = icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  instValid_rs; // @[Reg.scala 35:20]
  wire  instValid = _instValid_T | instValid_rs; // @[1_Fetch.scala 174:21]
  reg  stall_REG; // @[1_Fetch.scala 163:86]
  reg  stall_REG_1; // @[1_Fetch.scala 163:110]
  wire  stall = ~io_in_start | ~icache_io_read_req_ready | stall_REG | ~stall_REG_1; // @[1_Fetch.scala 163:99]
  wire  _io_in_execute_ready_T = ~stall; // @[1_Fetch.scala 168:28]
  wire  commit = _io_in_execute_ready_T & io_out_ready & ~_GEN_0; // @[1_Fetch.scala 172:50]
  wire  _firstFire_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_5 = _firstFire_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | ~firstFire & _hasBranch_T; // @[1_Fetch.scala 180:59]
  reg [31:0] inst_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_6 = _instValid_T ? icache_io_read_resp_bits_data : inst_r; // @[Reg.scala 19:16 20:{18,22}]
  wire  updatePC = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  ICache icache ( // @[1_Fetch.scala 151:24]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_read_req_ready(icache_io_read_req_ready),
    .io_read_req_valid(icache_io_read_req_valid),
    .io_read_req_bits_addr(icache_io_read_req_bits_addr),
    .io_read_resp_ready(icache_io_read_resp_ready),
    .io_read_resp_valid(icache_io_read_resp_valid),
    .io_read_resp_bits_data(icache_io_read_resp_bits_data),
    .io_tlbus_req_ready(icache_io_tlbus_req_ready),
    .io_tlbus_req_valid(icache_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(icache_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(icache_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(icache_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(icache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(icache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(icache_io_tlbus_resp_bits_data)
  );
  assign io_out_valid = ~stall; // @[1_Fetch.scala 207:21]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  assign io_out_bits_instState_commit = _io_in_execute_ready_T & io_out_ready & ~_GEN_0; // @[1_Fetch.scala 172:50]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 202:19 199:34]
  assign io_out_bits_instState_inst = commit ? _GEN_6 : 32'h13; // @[1_Fetch.scala 200:40]
  assign io_tlbus_req_valid = icache_io_tlbus_req_valid; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_opcode = icache_io_tlbus_req_bits_opcode; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_address = icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 186:21]
  assign io_tlbus_req_bits_data = icache_io_tlbus_req_bits_data; // @[1_Fetch.scala 186:21]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = io_in_start & preFetchInst; // @[1_Fetch.scala 187:55]
  assign icache_io_read_req_bits_addr = _hasBranch_T ? pcNext : pcReg; // @[1_Fetch.scala 193:18]
  assign icache_io_read_resp_ready = 1'h1; // @[1_Fetch.scala 189:31]
  assign icache_io_tlbus_req_ready = io_tlbus_req_ready; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 186:21]
  assign icache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[1_Fetch.scala 186:21]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 136:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 136:34]
    end else if (_hasBranch_T) begin // @[1_Fetch.scala 193:18]
      if (_GEN_0) begin // @[1_Fetch.scala 161:18]
        if (hasBranch_1) begin // @[Reg.scala 20:18]
          pcReg <= branchAddr_1; // @[Reg.scala 20:22]
        end else begin
          pcReg <= branchAddr_r; // @[Reg.scala 19:16]
        end
      end else begin
        pcReg <= pcNext4;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      hasBranch_rs <= 1'h0; // @[Reg.scala 35:20]
    end else if (_hasBranch_T) begin // @[util.scala 19:21]
      hasBranch_rs <= 1'h0; // @[util.scala 19:26]
    end else begin
      hasBranch_rs <= _GEN_0;
    end
    if (hasBranch_1) begin // @[Reg.scala 20:18]
      if (io_excp_valid) begin // @[1_Fetch.scala 141:27]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 142:24]
          branchAddr_r <= io_mepc;
        end else begin
          branchAddr_r <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 146:24]
        branchAddr_r <= io_in_execute_bits_targetAddr;
      end else begin
        branchAddr_r <= pcReg;
      end
    end
    if (reset) begin // @[Reg.scala 35:20]
      instValid_rs <= 1'h0; // @[Reg.scala 35:20]
    end else if (_hasBranch_T) begin // @[util.scala 19:21]
      instValid_rs <= 1'h0; // @[util.scala 19:26]
    end else begin
      instValid_rs <= instValid;
    end
    stall_REG <= ~instValid; // @[1_Fetch.scala 163:87]
    stall_REG_1 <= io_in_start; // @[1_Fetch.scala 163:110]
    firstFire <= reset | _GEN_5; // @[Reg.scala 35:{20,20}]
    if (_instValid_T) begin // @[Reg.scala 20:18]
      inst_r <= icache_io_read_resp_bits_data; // @[Reg.scala 20:22]
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
  pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  hasBranch_rs = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  branchAddr_r = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  instValid_rs = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stall_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stall_REG_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  firstFire = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  inst_r = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
