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
  input         io_rom_resp_valid,
  input  [31:0] io_trapVec,
  input  [31:0] io_mepc,
  input         io_excp_valid,
  input         io_excp_bits_isMret
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  instMem_clock; // @[1_Fetch.scala 52:25]
  wire  instMem_reset; // @[1_Fetch.scala 52:25]
  wire  instMem_wen; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_waddr; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_wdata; // @[1_Fetch.scala 52:25]
  wire [3:0] instMem_wmask; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_raddr; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_rdata; // @[1_Fetch.scala 52:25]
  wire  commit = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  reg [31:0] pcReg; // @[1_Fetch.scala 46:24]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 49:25]
  wire [31:0] _pcNext_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 74:37]
  wire [31:0] _pcNext_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 75:20]
  wire [31:0] pcNext = io_excp_valid ? _pcNext_T : _pcNext_T_1; // @[1_Fetch.scala 74:18]
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) instMem ( // @[1_Fetch.scala 52:25]
    .clock(instMem_clock),
    .reset(instMem_reset),
    .wen(instMem_wen),
    .waddr(instMem_waddr),
    .wdata(instMem_wdata),
    .wmask(instMem_wmask),
    .raddr(instMem_raddr),
    .rdata(instMem_rdata)
  );
  assign io_in_execute_ready = io_in_start; // @[1_Fetch.scala 42:40]
  assign io_out_valid = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 49:25]
  assign io_out_bits_instState_commit = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 82:30]
  assign io_out_bits_instState_inst = instMem_rdata; // @[1_Fetch.scala 50:24 59:10]
  assign instMem_clock = clock; // @[1_Fetch.scala 54:22]
  assign instMem_reset = reset; // @[1_Fetch.scala 55:22]
  assign instMem_wen = 1'h0;
  assign instMem_waddr = 32'h0;
  assign instMem_wdata = 32'h0;
  assign instMem_wmask = 4'h0;
  assign instMem_raddr = commit ? pcNext : pcReg; // @[1_Fetch.scala 76:14]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 46:24]
      pcReg <= 32'h0; // @[1_Fetch.scala 46:24]
    end else if (commit) begin // @[1_Fetch.scala 76:14]
      if (io_excp_valid) begin // @[1_Fetch.scala 74:18]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 74:37]
          pcReg <= io_mepc;
        end else begin
          pcReg <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 75:20]
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
  pcReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
