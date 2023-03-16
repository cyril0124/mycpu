module Fetch(
  input         clock,
  input         reset,
  input         io_in_start,
  output        io_in_execute_ready,
  input         io_in_execute_bits_brTaken,
  input  [31:0] io_in_execute_bits_targetAddr,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  input         io_rom_req_ready,
  output        io_rom_req_valid,
  output [31:0] io_rom_req_bits_address,
  output        io_rom_resp_ready,
  input         io_rom_resp_valid,
  input  [31:0] io_rom_resp_bits_data,
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
`endif // RANDOMIZE_REG_INIT
  wire  _instValid_T = io_rom_resp_ready & io_rom_resp_valid; // @[Decoupled.scala 51:35]
  reg  instValidReg; // @[Reg.scala 19:16]
  wire  instValid = _instValid_T | instValidReg; // @[1_Fetch.scala 78:21]
  wire  stall = ~io_in_start | ~io_rom_req_ready | ~instValid; // @[1_Fetch.scala 41:68]
  wire  _io_in_execute_ready_T = ~stall; // @[1_Fetch.scala 45:28]
  reg [31:0] pcReg; // @[1_Fetch.scala 47:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 50:33]
  wire  commit = _io_in_execute_ready_T & io_out_ready; // @[1_Fetch.scala 52:34]
  wire  _firstFire_T = io_rom_req_ready & io_rom_req_valid; // @[Decoupled.scala 51:35]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_0 = _firstFire_T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire [31:0] _pcNext_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 80:37]
  wire [31:0] _pcNext_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 81:20]
  wire [31:0] pcNext = io_excp_valid ? _pcNext_T : _pcNext_T_1; // @[1_Fetch.scala 80:18]
  wire [31:0] pc = commit ? pcNext : pcReg; // @[1_Fetch.scala 82:14]
  wire  preFetchInst = firstFire & pc == 32'h0 | ~firstFire & instValid; // @[1_Fetch.scala 63:56]
  reg [31:0] inst_r; // @[Reg.scala 19:16]
  assign io_in_execute_ready = ~stall; // @[1_Fetch.scala 45:28]
  assign io_out_valid = ~stall; // @[1_Fetch.scala 92:21]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 50:33]
  assign io_out_bits_instState_commit = _io_in_execute_ready_T & io_out_ready; // @[1_Fetch.scala 52:34]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 89:30]
  assign io_out_bits_instState_inst = _instValid_T ? io_rom_resp_bits_data : inst_r; // @[1_Fetch.scala 74:16]
  assign io_rom_req_valid = io_in_start & preFetchInst; // @[1_Fetch.scala 68:47]
  assign io_rom_req_bits_address = pc; // @[1_Fetch.scala 69:29]
  assign io_rom_resp_ready = 1'h1; // @[1_Fetch.scala 73:23]
  always @(posedge clock) begin
    if (_firstFire_T) begin // @[1_Fetch.scala 77:27]
      instValidReg <= 1'h0; // @[1_Fetch.scala 77:42]
    end else begin
      instValidReg <= instValid;
    end
    if (reset) begin // @[1_Fetch.scala 47:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 47:34]
    end else if (commit) begin // @[1_Fetch.scala 82:14]
      if (io_excp_valid) begin // @[1_Fetch.scala 80:18]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 80:37]
          pcReg <= io_mepc;
        end else begin
          pcReg <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 81:20]
        pcReg <= io_in_execute_bits_targetAddr;
      end else begin
        pcReg <= pcNext4;
      end
    end
    firstFire <= reset | _GEN_0; // @[Reg.scala 35:{20,20}]
    if (_instValid_T) begin // @[Reg.scala 20:18]
      inst_r <= io_rom_resp_bits_data; // @[Reg.scala 20:22]
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
  instValidReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pcReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  firstFire = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  inst_r = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
