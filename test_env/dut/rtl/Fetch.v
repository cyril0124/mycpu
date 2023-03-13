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
  output [31:0] io_rom_req_bits_address,
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
`endif // RANDOMIZE_REG_INIT
  reg  romValidReg; // @[1_Fetch.scala 45:34]
  reg [31:0] pcReg; // @[1_Fetch.scala 52:34]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 55:33]
  wire  commit = io_out_ready & io_in_start & romValidReg; // @[1_Fetch.scala 57:65]
  wire [31:0] _pcNext_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 80:37]
  wire [31:0] _pcNext_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 81:20]
  wire [31:0] pcNext = io_excp_valid ? _pcNext_T : _pcNext_T_1; // @[1_Fetch.scala 80:18]
  assign io_in_execute_ready = io_in_start; // @[1_Fetch.scala 42:40]
  assign io_out_valid = commit & io_rom_resp_valid; // @[1_Fetch.scala 92:28]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 55:33]
  assign io_out_bits_instState_commit = io_out_ready & io_in_start & romValidReg; // @[1_Fetch.scala 57:65]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 89:30]
  assign io_out_bits_instState_inst = io_rom_resp_bits_data; // @[1_Fetch.scala 56:35 77:10]
  assign io_rom_req_bits_address = commit ? pcNext : pcReg; // @[1_Fetch.scala 83:14]
  always @(posedge clock) begin
    romValidReg <= io_rom_resp_valid; // @[1_Fetch.scala 45:34]
    if (reset) begin // @[1_Fetch.scala 52:34]
      pcReg <= 32'h0; // @[1_Fetch.scala 52:34]
    end else if (commit & io_rom_resp_valid) begin // @[1_Fetch.scala 85:30]
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
  romValidReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  pcReg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
