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
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  _instValid_T = io_rom_resp_ready & io_rom_resp_valid; // @[Decoupled.scala 51:35]
  reg  instValidReg; // @[Reg.scala 19:16]
  wire  _instValid_T_1 = io_rom_req_ready ? 1'h0 : instValidReg; // @[1_Fetch.scala 66:28]
  wire  instValid = _instValid_T | _instValid_T_1; // @[1_Fetch.scala 64:21]
  wire  stall = ~io_in_start | ~io_rom_req_ready | ~instValid; // @[1_Fetch.scala 41:68]
  wire  _io_in_execute_ready_T = ~stall; // @[1_Fetch.scala 45:28]
  reg [31:0] pcReg; // @[1_Fetch.scala 47:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 50:33]
  wire  _GEN_0 = _instValid_T | instValidReg; // @[Reg.scala 19:16 20:{18,22}]
  wire  _T = io_rom_req_ready & io_rom_req_valid; // @[Decoupled.scala 51:35]
  reg  firstFire; // @[Reg.scala 35:20]
  wire  _GEN_2 = _T ? 1'h0 : firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  preFetchInst = firstFire & pcReg == 32'h0 | ~firstFire & (_instValid_T | instValidReg & io_rom_req_ready); // @[1_Fetch.scala 73:59]
  reg  sendReq; // @[Reg.scala 35:20]
  wire  _GEN_3 = _T | sendReq; // @[Reg.scala 36:18 35:20 36:22]
  reg [31:0] inst_r; // @[Reg.scala 19:16]
  wire [31:0] _pcNext_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 94:24]
  wire [31:0] _pcNext_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 98:24]
  wire [31:0] pcNext = io_excp_valid ? _pcNext_T : _pcNext_T_1; // @[1_Fetch.scala 93:18]
  wire  updatePC = _T & io_out_ready; // @[1_Fetch.scala 104:36]
  assign io_in_execute_ready = ~stall; // @[1_Fetch.scala 45:28]
  assign io_out_valid = ~stall; // @[1_Fetch.scala 113:21]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 50:33]
  assign io_out_bits_instState_commit = _io_in_execute_ready_T & io_out_ready; // @[1_Fetch.scala 52:34]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 110:34]
  assign io_out_bits_instState_inst = _instValid_T ? io_rom_resp_bits_data : inst_r; // @[1_Fetch.scala 88:35]
  assign io_rom_req_valid = io_in_start & io_rom_req_ready & preFetchInst; // @[1_Fetch.scala 82:74]
  assign io_rom_req_bits_address = updatePC ? pcNext : pcReg; // @[1_Fetch.scala 105:18]
  assign io_rom_resp_ready = 1'h1; // @[1_Fetch.scala 87:29]
  always @(posedge clock) begin
    if (_T) begin // @[1_Fetch.scala 63:27]
      instValidReg <= 1'h0; // @[1_Fetch.scala 63:42]
    end else begin
      instValidReg <= _GEN_0;
    end
    if (reset) begin // @[1_Fetch.scala 47:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 47:34]
    end else if (updatePC) begin // @[1_Fetch.scala 105:18]
      if (io_excp_valid) begin // @[1_Fetch.scala 93:18]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 94:24]
          pcReg <= io_mepc;
        end else begin
          pcReg <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 98:24]
        pcReg <= io_in_execute_bits_targetAddr;
      end else begin
        pcReg <= pcNext4;
      end
    end
    firstFire <= reset | _GEN_2; // @[Reg.scala 35:{20,20}]
    if (reset) begin // @[Reg.scala 35:20]
      sendReq <= 1'h0; // @[Reg.scala 35:20]
    end else if (_instValid_T) begin // @[1_Fetch.scala 77:28]
      sendReq <= 1'h0; // @[1_Fetch.scala 77:38]
    end else begin
      sendReq <= _GEN_3;
    end
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
  sendReq = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  inst_r = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
