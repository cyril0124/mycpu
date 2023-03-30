module TLSerializer(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [31:0] io_in_bits_0,
  input  [31:0] io_in_bits_1,
  input  [31:0] io_in_bits_2,
  input  [31:0] io_in_bits_3,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits,
  output        io_fireAll,
  output [1:0]  io_beatCounter
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] beatCounter_value; // @[Counter.scala 61:40]
  wire  lastBeat = beatCounter_value == 2'h3; // @[RefillPipe.scala 31:38]
  wire [3:0] beatOH = 4'h1 << beatCounter_value; // @[OneHot.scala 57:35]
  wire  _T = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _value_T_1 = beatCounter_value + 2'h1; // @[Counter.scala 77:24]
  wire [31:0] _io_out_bits_T_4 = beatOH[0] ? io_in_bits_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_5 = beatOH[1] ? io_in_bits_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_6 = beatOH[2] ? io_in_bits_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_7 = beatOH[3] ? io_in_bits_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_8 = _io_out_bits_T_4 | _io_out_bits_T_5; // @[Mux.scala 27:73]
  wire [31:0] _io_out_bits_T_9 = _io_out_bits_T_8 | _io_out_bits_T_6; // @[Mux.scala 27:73]
  assign io_out_valid = io_in_valid; // @[RefillPipe.scala 42:18]
  assign io_out_bits = _io_out_bits_T_9 | _io_out_bits_T_7; // @[Mux.scala 27:73]
  assign io_fireAll = _T & lastBeat; // @[RefillPipe.scala 45:31]
  assign io_beatCounter = beatCounter_value; // @[RefillPipe.scala 46:20]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (io_in_valid) begin // @[RefillPipe.scala 33:21]
      if (_T & lastBeat) begin // @[RefillPipe.scala 34:39]
        beatCounter_value <= 2'h0; // @[Counter.scala 98:11]
      end else if (_T) begin // @[RefillPipe.scala 37:33]
        beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
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
  beatCounter_value = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
