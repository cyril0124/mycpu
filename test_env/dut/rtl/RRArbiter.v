module RRArbiter(
  input         clock,
  input  [31:0] io_in_0_bits_address,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
  input  [31:0] io_in_1_bits_address,
  input  [3:0]  io_in_1_bits_mask,
  input  [31:0] io_in_1_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output        io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [3:0]  io_out_bits_mask,
  output [31:0] io_out_bits_data,
  output        io_chosen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _ctrl_validMask_grantMask_lastGrant_T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  reg  lastGrant; // @[Reg.scala 19:16]
  wire  grantMask_1 = 1'h1 > lastGrant; // @[Arbiter.scala 81:49]
  assign io_out_valid = io_chosen ? io_in_1_valid : 1'h1; // @[Arbiter.scala 55:{16,16}]
  assign io_out_bits_opcode = io_chosen ? io_in_1_bits_opcode : 3'h4; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_source = io_chosen; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_address = io_chosen ? io_in_1_bits_address : io_in_0_bits_address; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_mask = io_chosen ? io_in_1_bits_mask : 4'h0; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_data = io_chosen ? io_in_1_bits_data : 32'h0; // @[Arbiter.scala 56:{15,15}]
  assign io_chosen = io_in_1_valid & grantMask_1; // @[Arbiter.scala 82:76]
  always @(posedge clock) begin
    if (_ctrl_validMask_grantMask_lastGrant_T) begin // @[Reg.scala 20:18]
      lastGrant <= io_chosen; // @[Reg.scala 20:22]
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
  lastGrant = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
