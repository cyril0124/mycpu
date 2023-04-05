module RefillBuffer(
  input         clock,
  input         reset,
  input         io_write_valid,
  input  [31:0] io_write_bits_cacheLineAddr,
  input  [31:0] io_write_bits_data,
  output [31:0] io_read_cacheLineAddr_0,
  output [31:0] io_read_cacheLineAddr_1,
  output [31:0] io_read_cacheLineData_0_0,
  output [31:0] io_read_cacheLineData_0_1,
  output [31:0] io_read_cacheLineData_0_2,
  output [31:0] io_read_cacheLineData_0_3,
  output [31:0] io_read_cacheLineData_0_4,
  output [31:0] io_read_cacheLineData_0_5,
  output [31:0] io_read_cacheLineData_0_6,
  output [31:0] io_read_cacheLineData_0_7,
  output [31:0] io_read_cacheLineData_1_0,
  output [31:0] io_read_cacheLineData_1_1,
  output [31:0] io_read_cacheLineData_1_2,
  output [31:0] io_read_cacheLineData_1_3,
  output [31:0] io_read_cacheLineData_1_4,
  output [31:0] io_read_cacheLineData_1_5,
  output [31:0] io_read_cacheLineData_1_6,
  output [31:0] io_read_cacheLineData_1_7,
  output        io_read_valids_0,
  output        io_read_valids_1
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
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] buf_0_0; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_1; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_2; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_3; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_4; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_5; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_6; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_0_7; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_0; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_1; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_2; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_3; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_4; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_5; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_6; // @[RefillBuffer.scala 23:18]
  reg [31:0] buf_1_7; // @[RefillBuffer.scala 23:18]
  reg [31:0] addr_0; // @[RefillBuffer.scala 24:19]
  reg [31:0] addr_1; // @[RefillBuffer.scala 24:19]
  reg  wrPtr_value; // @[Counter.scala 61:40]
  reg [2:0] beatCounter_value; // @[Counter.scala 61:40]
  wire  lastBeat = beatCounter_value == 3'h7; // @[RefillBuffer.scala 29:38]
  wire [31:0] _addr_T_2 = {io_write_bits_cacheLineAddr[31:5],5'h0}; // @[Cat.scala 33:92]
  wire [2:0] _value_T_3 = beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  assign io_read_cacheLineAddr_0 = addr_0; // @[RefillBuffer.scala 43:27]
  assign io_read_cacheLineAddr_1 = addr_1; // @[RefillBuffer.scala 43:27]
  assign io_read_cacheLineData_0_0 = buf_0_0; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_1 = buf_0_1; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_2 = buf_0_2; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_3 = buf_0_3; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_4 = buf_0_4; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_5 = buf_0_5; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_6 = buf_0_6; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_0_7 = buf_0_7; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_0 = buf_1_0; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_1 = buf_1_1; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_2 = buf_1_2; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_3 = buf_1_3; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_4 = buf_1_4; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_5 = buf_1_5; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_6 = buf_1_6; // @[RefillBuffer.scala 44:27]
  assign io_read_cacheLineData_1_7 = buf_1_7; // @[RefillBuffer.scala 44:27]
  assign io_read_valids_0 = 1'h0; // @[RefillBuffer.scala 45:20]
  assign io_read_valids_1 = 1'h0; // @[RefillBuffer.scala 45:20]
  always @(posedge clock) begin
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h0 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_0 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h1 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_1 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h2 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_2 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h3 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_3 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h4 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_4 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h5 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_5 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h6 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_6 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (~wrPtr_value & 3'h7 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_0_7 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h0 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_0 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h1 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_1 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h2 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_2 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h3 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_3 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h4 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_4 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h5 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_5 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h6 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_6 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid) begin // @[RefillBuffer.scala 39:25]
      if (wrPtr_value & 3'h7 == beatCounter_value) begin // @[RefillBuffer.scala 40:45]
        buf_1_7 <= io_write_bits_data; // @[RefillBuffer.scala 40:45]
      end
    end
    if (io_write_valid & lastBeat) begin // @[RefillBuffer.scala 31:37]
      if (~wrPtr_value) begin // @[RefillBuffer.scala 34:27]
        addr_0 <= _addr_T_2; // @[RefillBuffer.scala 34:27]
      end
    end
    if (io_write_valid & lastBeat) begin // @[RefillBuffer.scala 31:37]
      if (wrPtr_value) begin // @[RefillBuffer.scala 34:27]
        addr_1 <= _addr_T_2; // @[RefillBuffer.scala 34:27]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      wrPtr_value <= 1'h0; // @[Counter.scala 61:40]
    end else if (io_write_valid & lastBeat) begin // @[RefillBuffer.scala 31:37]
      wrPtr_value <= wrPtr_value + 1'h1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (io_write_valid & lastBeat) begin // @[RefillBuffer.scala 31:37]
      beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
    end else if (io_write_valid) begin // @[RefillBuffer.scala 35:31]
      beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
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
  buf_0_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  buf_0_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  buf_0_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  buf_0_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  buf_0_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  buf_0_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  buf_0_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buf_0_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  buf_1_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buf_1_1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  buf_1_2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  buf_1_3 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  buf_1_4 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  buf_1_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  buf_1_6 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  buf_1_7 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  addr_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  addr_1 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  wrPtr_value = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  beatCounter_value = _RAND_19[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
