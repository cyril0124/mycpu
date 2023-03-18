module PingPongBuf(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [2:0]  io_in_bits_opcode,
  input         io_in_bits_source,
  input  [31:0] io_in_bits_address,
  input  [3:0]  io_in_bits_mask,
  input  [31:0] io_in_bits_data,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output        io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [3:0]  io_out_bits_mask,
  output [31:0] io_out_bits_data
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
`endif // RANDOMIZE_REG_INIT
  reg  ptr; // @[Counter.scala 61:40]
  wire  _ptr_wrap_value_T_1 = ptr + 1'h1; // @[Counter.scala 77:24]
  reg [2:0] buf_0_opcode; // @[PingPongBuf.scala 21:22]
  reg  buf_0_source; // @[PingPongBuf.scala 21:22]
  reg [31:0] buf_0_address; // @[PingPongBuf.scala 21:22]
  reg [3:0] buf_0_mask; // @[PingPongBuf.scala 21:22]
  reg [31:0] buf_0_data; // @[PingPongBuf.scala 21:22]
  reg [2:0] buf_1_opcode; // @[PingPongBuf.scala 21:22]
  reg  buf_1_source; // @[PingPongBuf.scala 21:22]
  reg [31:0] buf_1_address; // @[PingPongBuf.scala 21:22]
  reg [3:0] buf_1_mask; // @[PingPongBuf.scala 21:22]
  reg [31:0] buf_1_data; // @[PingPongBuf.scala 21:22]
  reg  bufValid_0; // @[PingPongBuf.scala 22:27]
  reg  bufValid_1; // @[PingPongBuf.scala 22:27]
  wire  _T = ~ptr; // @[PingPongBuf.scala 24:14]
  wire  _T_1 = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_2 = _T_1 | bufValid_0; // @[PingPongBuf.scala 26:26 27:25 22:27]
  wire  _GEN_11 = _T_1 | bufValid_1; // @[PingPongBuf.scala 32:26 33:25 22:27]
  wire  _GEN_21 = ~ptr ? _GEN_2 : bufValid_0; // @[PingPongBuf.scala 24:23 22:27]
  wire  _GEN_30 = ~ptr ? bufValid_1 : _GEN_11; // @[PingPongBuf.scala 24:23 22:27]
  wire  _T_4 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_48 = _T_4 ? buf_0_opcode : buf_1_opcode; // @[PingPongBuf.scala 39:21 49:27 50:25]
  wire  _GEN_51 = _T_4 ? buf_0_source : buf_1_source; // @[PingPongBuf.scala 39:21 49:27 50:25]
  wire [31:0] _GEN_52 = _T_4 ? buf_0_address : buf_1_address; // @[PingPongBuf.scala 39:21 49:27 50:25]
  wire [3:0] _GEN_53 = _T_4 ? buf_0_mask : buf_1_mask; // @[PingPongBuf.scala 39:21 49:27 50:25]
  wire [31:0] _GEN_55 = _T_4 ? buf_0_data : buf_1_data; // @[PingPongBuf.scala 39:21 49:27 50:25]
  assign io_in_ready = ~ptr ? ~bufValid_0 : ~bufValid_1; // @[PingPongBuf.scala 24:23 25:21 31:21]
  assign io_out_valid = _T ? bufValid_1 : bufValid_0; // @[PingPongBuf.scala 41:23 42:22 48:22]
  assign io_out_bits_opcode = _T ? buf_1_opcode : _GEN_48; // @[PingPongBuf.scala 41:23]
  assign io_out_bits_source = _T ? buf_1_source : _GEN_51; // @[PingPongBuf.scala 41:23]
  assign io_out_bits_address = _T ? buf_1_address : _GEN_52; // @[PingPongBuf.scala 41:23]
  assign io_out_bits_mask = _T ? buf_1_mask : _GEN_53; // @[PingPongBuf.scala 41:23]
  assign io_out_bits_data = _T ? buf_1_data : _GEN_55; // @[PingPongBuf.scala 41:23]
  always @(posedge clock) begin
    if (reset) begin // @[Counter.scala 61:40]
      ptr <= 1'h0; // @[Counter.scala 61:40]
    end else begin
      ptr <= _ptr_wrap_value_T_1;
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_0_opcode <= 3'h0; // @[PingPongBuf.scala 21:22]
    end else if (~ptr) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 26:26]
        buf_0_opcode <= io_in_bits_opcode; // @[PingPongBuf.scala 28:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_0_source <= 1'h0; // @[PingPongBuf.scala 21:22]
    end else if (~ptr) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 26:26]
        buf_0_source <= io_in_bits_source; // @[PingPongBuf.scala 28:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_0_address <= 32'h0; // @[PingPongBuf.scala 21:22]
    end else if (~ptr) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 26:26]
        buf_0_address <= io_in_bits_address; // @[PingPongBuf.scala 28:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_0_mask <= 4'h0; // @[PingPongBuf.scala 21:22]
    end else if (~ptr) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 26:26]
        buf_0_mask <= io_in_bits_mask; // @[PingPongBuf.scala 28:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_0_data <= 32'h0; // @[PingPongBuf.scala 21:22]
    end else if (~ptr) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 26:26]
        buf_0_data <= io_in_bits_data; // @[PingPongBuf.scala 28:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_1_opcode <= 3'h0; // @[PingPongBuf.scala 21:22]
    end else if (!(~ptr)) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 32:26]
        buf_1_opcode <= io_in_bits_opcode; // @[PingPongBuf.scala 34:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_1_source <= 1'h0; // @[PingPongBuf.scala 21:22]
    end else if (!(~ptr)) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 32:26]
        buf_1_source <= io_in_bits_source; // @[PingPongBuf.scala 34:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_1_address <= 32'h0; // @[PingPongBuf.scala 21:22]
    end else if (!(~ptr)) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 32:26]
        buf_1_address <= io_in_bits_address; // @[PingPongBuf.scala 34:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_1_mask <= 4'h0; // @[PingPongBuf.scala 21:22]
    end else if (!(~ptr)) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 32:26]
        buf_1_mask <= io_in_bits_mask; // @[PingPongBuf.scala 34:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 21:22]
      buf_1_data <= 32'h0; // @[PingPongBuf.scala 21:22]
    end else if (!(~ptr)) begin // @[PingPongBuf.scala 24:23]
      if (_T_1) begin // @[PingPongBuf.scala 32:26]
        buf_1_data <= io_in_bits_data; // @[PingPongBuf.scala 34:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:27]
      bufValid_0 <= 1'h0; // @[PingPongBuf.scala 22:27]
    end else if (_T) begin // @[PingPongBuf.scala 41:23]
      bufValid_0 <= _GEN_21;
    end else if (_T_4) begin // @[PingPongBuf.scala 49:27]
      bufValid_0 <= 1'h0; // @[PingPongBuf.scala 51:25]
    end else begin
      bufValid_0 <= _GEN_21;
    end
    if (reset) begin // @[PingPongBuf.scala 22:27]
      bufValid_1 <= 1'h0; // @[PingPongBuf.scala 22:27]
    end else if (_T) begin // @[PingPongBuf.scala 41:23]
      if (_T_4) begin // @[PingPongBuf.scala 43:27]
        bufValid_1 <= 1'h0; // @[PingPongBuf.scala 45:25]
      end else begin
        bufValid_1 <= _GEN_30;
      end
    end else begin
      bufValid_1 <= _GEN_30;
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
  ptr = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  buf_0_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  buf_0_source = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  buf_0_address = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  buf_0_mask = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  buf_0_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  buf_1_opcode = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  buf_1_source = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  buf_1_address = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  buf_1_mask = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  buf_1_data = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  bufValid_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  bufValid_1 = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
