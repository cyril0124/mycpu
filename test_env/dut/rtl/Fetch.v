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
  input         io_rom_resp_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  instMem_clock; // @[1_Fetch.scala 45:25]
  wire [31:0] instMem_io_raddr; // @[1_Fetch.scala 45:25]
  wire [31:0] instMem_io_rdata; // @[1_Fetch.scala 45:25]
  reg [31:0] pcReg; // @[1_Fetch.scala 40:24]
  wire  commit = io_rom_resp_valid & io_in_start; // @[1_Fetch.scala 50:36]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 52:25]
  wire [31:0] pcNext = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 66:18]
  ROM instMem ( // @[1_Fetch.scala 45:25]
    .clock(instMem_clock),
    .io_raddr(instMem_io_raddr),
    .io_rdata(instMem_io_rdata)
  );
  assign io_in_execute_ready = io_in_start; // @[1_Fetch.scala 38:40]
  assign io_out_valid = (io_out_ready | io_in_start) & commit; // @[1_Fetch.scala 80:63]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 52:25]
  assign io_out_bits_instState_commit = io_rom_resp_valid & io_in_start; // @[1_Fetch.scala 50:36]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 77:30]
  assign io_out_bits_instState_inst = instMem_io_rdata; // @[1_Fetch.scala 42:24 48:10]
  assign instMem_clock = clock;
  assign instMem_io_raddr = commit ? pcNext : pcReg; // @[1_Fetch.scala 68:14]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 40:24]
      pcReg <= 32'h0; // @[1_Fetch.scala 40:24]
    end else if (commit) begin // @[1_Fetch.scala 68:14]
      if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 66:18]
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
