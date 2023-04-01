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
  output [31:0] io_tlbus_req_bits_address,
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
  wire [31:0] icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_resp_ready; // @[1_Fetch.scala 151:24]
  wire  icache_io_tlbus_resp_valid; // @[1_Fetch.scala 151:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 151:24]
  wire [31:0] icache_io_tlbus_resp_bits_data; // @[1_Fetch.scala 151:24]
  reg [31:0] pcReg; // @[1_Fetch.scala 137:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  wire [31:0] _branchAddr_1_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 142:24]
  wire [31:0] _branchAddr_1_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcReg; // @[1_Fetch.scala 146:24]
  wire [31:0] branchAddr_1 = io_excp_valid ? _branchAddr_1_T : _branchAddr_1_T_1; // @[1_Fetch.scala 141:27]
  wire  hasBranch_1 = io_excp_valid | io_in_execute_bits_brTaken; // @[1_Fetch.scala 161:37]
  wire  _hasBranch_T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  _hasBranch_T_1 = ~io_in_start; // @[1_Fetch.scala 162:62]
  wire  _hasBranch_T_2 = _hasBranch_T | ~io_in_start; // @[1_Fetch.scala 162:59]
  reg  hasBranch_holdReg; // @[Reg.scala 19:16]
  wire  _GEN_0 = hasBranch_1 | hasBranch_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire  hasBranch = hasBranch_1 | hasBranch_holdReg; // @[util.scala 12:12]
  reg [31:0] branchAddr_holdReg; // @[Reg.scala 19:16]
  wire [31:0] _GEN_2 = hasBranch_1 ? branchAddr_1 : branchAddr_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] pcNext = _GEN_0 ? _GEN_2 : pcNext4; // @[1_Fetch.scala 166:18]
  wire  commit = io_out_ready & ~_GEN_0; // @[1_Fetch.scala 174:50]
  wire  _lastInstValid_T = icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  lastInstValid_holdReg; // @[Reg.scala 19:16]
  wire  _GEN_4 = _lastInstValid_T | lastInstValid_holdReg; // @[Reg.scala 19:16 20:{18,22}]
  wire  lastInstValid = _lastInstValid_T | lastInstValid_holdReg; // @[util.scala 12:12]
  wire  _firstFire_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_6 = _firstFire_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | ~firstFire & _hasBranch_T; // @[1_Fetch.scala 180:59]
  reg [31:0] inst_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_7 = _lastInstValid_T ? icache_io_read_resp_bits_data : inst_r; // @[Reg.scala 19:16 20:{18,22}]
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
    .io_tlbus_req_bits_address(icache_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(icache_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(icache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(icache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(icache_io_tlbus_resp_bits_data)
  );
  assign io_out_valid = io_in_start & icache_io_read_req_ready & _GEN_4; // @[1_Fetch.scala 203:71]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 139:33]
  assign io_out_bits_instState_commit = io_out_ready & ~_GEN_0; // @[1_Fetch.scala 174:50]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 198:19 195:34]
  assign io_out_bits_instState_inst = commit ? _GEN_7 : 32'h13; // @[1_Fetch.scala 196:40]
  assign io_tlbus_req_valid = icache_io_tlbus_req_valid; // @[1_Fetch.scala 182:21]
  assign io_tlbus_req_bits_address = icache_io_tlbus_req_bits_address; // @[1_Fetch.scala 182:21]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = io_in_start & preFetchInst; // @[1_Fetch.scala 183:55]
  assign icache_io_read_req_bits_addr = _hasBranch_T ? pcNext : pcReg; // @[1_Fetch.scala 184:40]
  assign icache_io_read_resp_ready = 1'h1; // @[1_Fetch.scala 185:31]
  assign icache_io_tlbus_req_ready = io_tlbus_req_ready; // @[1_Fetch.scala 182:21]
  assign icache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[1_Fetch.scala 182:21]
  assign icache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[1_Fetch.scala 182:21]
  assign icache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[1_Fetch.scala 182:21]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 137:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 137:34]
    end else if (_hasBranch_T) begin // @[1_Fetch.scala 184:40]
      if (_GEN_0) begin // @[1_Fetch.scala 166:18]
        if (hasBranch_1) begin // @[Reg.scala 20:18]
          pcReg <= branchAddr_1; // @[Reg.scala 20:22]
        end else begin
          pcReg <= branchAddr_holdReg; // @[Reg.scala 19:16]
        end
      end else begin
        pcReg <= pcNext4;
      end
    end
    if (_hasBranch_T_2) begin // @[util.scala 11:21]
      hasBranch_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      hasBranch_holdReg <= _GEN_0;
    end
    if (_hasBranch_T_1) begin // @[util.scala 11:21]
      branchAddr_holdReg <= 32'h0; // @[util.scala 11:31]
    end else if (hasBranch_1) begin // @[Reg.scala 20:18]
      if (io_excp_valid) begin // @[1_Fetch.scala 141:27]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 142:24]
          branchAddr_holdReg <= io_mepc;
        end else begin
          branchAddr_holdReg <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 146:24]
        branchAddr_holdReg <= io_in_execute_bits_targetAddr;
      end else begin
        branchAddr_holdReg <= pcReg;
      end
    end
    if (_hasBranch_T) begin // @[util.scala 11:21]
      lastInstValid_holdReg <= 1'h0; // @[util.scala 11:31]
    end else begin
      lastInstValid_holdReg <= _GEN_4;
    end
    firstFire <= reset | _GEN_6; // @[Reg.scala 35:{20,20}]
    if (_lastInstValid_T) begin // @[Reg.scala 20:18]
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
  hasBranch_holdReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  branchAddr_holdReg = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  lastInstValid_holdReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  firstFire = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  inst_r = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
