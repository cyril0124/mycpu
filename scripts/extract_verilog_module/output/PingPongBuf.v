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
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg  wrPtr; // @[PingPongBuf.scala 19:24]
  reg  rdPtr; // @[PingPongBuf.scala 20:24]
  reg [2:0] buf_0_opcode; // @[PingPongBuf.scala 22:22]
  reg  buf_0_source; // @[PingPongBuf.scala 22:22]
  reg [31:0] buf_0_address; // @[PingPongBuf.scala 22:22]
  reg [3:0] buf_0_mask; // @[PingPongBuf.scala 22:22]
  reg [31:0] buf_0_data; // @[PingPongBuf.scala 22:22]
  reg [2:0] buf_1_opcode; // @[PingPongBuf.scala 22:22]
  reg  buf_1_source; // @[PingPongBuf.scala 22:22]
  reg [31:0] buf_1_address; // @[PingPongBuf.scala 22:22]
  reg [3:0] buf_1_mask; // @[PingPongBuf.scala 22:22]
  reg [31:0] buf_1_data; // @[PingPongBuf.scala 22:22]
  reg  bufValid_0; // @[PingPongBuf.scala 23:27]
  reg  bufValid_1; // @[PingPongBuf.scala 23:27]
  wire  _T = ~wrPtr; // @[PingPongBuf.scala 58:16]
  wire  _T_1 = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_0 = _T_1 | bufValid_0; // @[PingPongBuf.scala 60:26 61:25 23:27]
  wire  _GEN_9 = _T_1 ? _T : wrPtr; // @[PingPongBuf.scala 60:26 63:19 19:24]
  wire  _GEN_10 = _T_1 | bufValid_1; // @[PingPongBuf.scala 67:26 68:25 23:27]
  wire  _GEN_21 = ~wrPtr ? _GEN_0 : bufValid_0; // @[PingPongBuf.scala 58:25 23:27]
  wire  _GEN_31 = ~wrPtr ? bufValid_1 : _GEN_10; // @[PingPongBuf.scala 58:25 23:27]
  wire  _T_3 = ~rdPtr; // @[PingPongBuf.scala 77:16]
  wire  _T_4 = io_out_ready & io_out_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_49 = _T_4 ? _T_3 : rdPtr; // @[PingPongBuf.scala 79:27 82:19 20:24]
  wire [2:0] _GEN_50 = _T_4 ? buf_0_opcode : buf_1_opcode; // @[PingPongBuf.scala 75:21 86:27 87:25]
  wire  _GEN_53 = _T_4 ? buf_0_source : buf_1_source; // @[PingPongBuf.scala 75:21 86:27 87:25]
  wire [31:0] _GEN_54 = _T_4 ? buf_0_address : buf_1_address; // @[PingPongBuf.scala 75:21 86:27 87:25]
  wire [3:0] _GEN_55 = _T_4 ? buf_0_mask : buf_1_mask; // @[PingPongBuf.scala 75:21 86:27 87:25]
  wire [31:0] _GEN_57 = _T_4 ? buf_0_data : buf_1_data; // @[PingPongBuf.scala 75:21 86:27 87:25]
  wire  _GEN_70 = ~rdPtr ? _GEN_49 : _GEN_49; // @[PingPongBuf.scala 77:25]
  assign io_in_ready = ~wrPtr ? ~bufValid_0 : ~bufValid_1; // @[PingPongBuf.scala 58:25 59:21 66:21]
  assign io_out_valid = ~rdPtr ? bufValid_1 : bufValid_0; // @[PingPongBuf.scala 77:25 78:22 85:22]
  assign io_out_bits_opcode = ~rdPtr ? buf_1_opcode : _GEN_50; // @[PingPongBuf.scala 77:25]
  assign io_out_bits_source = ~rdPtr ? buf_1_source : _GEN_53; // @[PingPongBuf.scala 77:25]
  assign io_out_bits_address = ~rdPtr ? buf_1_address : _GEN_54; // @[PingPongBuf.scala 77:25]
  assign io_out_bits_mask = ~rdPtr ? buf_1_mask : _GEN_55; // @[PingPongBuf.scala 77:25]
  assign io_out_bits_data = ~rdPtr ? buf_1_data : _GEN_57; // @[PingPongBuf.scala 77:25]
  always @(posedge clock) begin
    if (reset) begin // @[PingPongBuf.scala 19:24]
      wrPtr <= 1'h0; // @[PingPongBuf.scala 19:24]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      wrPtr <= _GEN_9;
    end else begin
      wrPtr <= _GEN_9;
    end
    rdPtr <= reset | _GEN_70; // @[PingPongBuf.scala 20:{24,24}]
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_0_opcode <= 3'h0; // @[PingPongBuf.scala 22:22]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 60:26]
        buf_0_opcode <= io_in_bits_opcode; // @[PingPongBuf.scala 62:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_0_source <= 1'h0; // @[PingPongBuf.scala 22:22]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 60:26]
        buf_0_source <= io_in_bits_source; // @[PingPongBuf.scala 62:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_0_address <= 32'h0; // @[PingPongBuf.scala 22:22]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 60:26]
        buf_0_address <= io_in_bits_address; // @[PingPongBuf.scala 62:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_0_mask <= 4'h0; // @[PingPongBuf.scala 22:22]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 60:26]
        buf_0_mask <= io_in_bits_mask; // @[PingPongBuf.scala 62:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_0_data <= 32'h0; // @[PingPongBuf.scala 22:22]
    end else if (~wrPtr) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 60:26]
        buf_0_data <= io_in_bits_data; // @[PingPongBuf.scala 62:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_1_opcode <= 3'h0; // @[PingPongBuf.scala 22:22]
    end else if (!(~wrPtr)) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 67:26]
        buf_1_opcode <= io_in_bits_opcode; // @[PingPongBuf.scala 69:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_1_source <= 1'h0; // @[PingPongBuf.scala 22:22]
    end else if (!(~wrPtr)) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 67:26]
        buf_1_source <= io_in_bits_source; // @[PingPongBuf.scala 69:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_1_address <= 32'h0; // @[PingPongBuf.scala 22:22]
    end else if (!(~wrPtr)) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 67:26]
        buf_1_address <= io_in_bits_address; // @[PingPongBuf.scala 69:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_1_mask <= 4'h0; // @[PingPongBuf.scala 22:22]
    end else if (!(~wrPtr)) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 67:26]
        buf_1_mask <= io_in_bits_mask; // @[PingPongBuf.scala 69:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 22:22]
      buf_1_data <= 32'h0; // @[PingPongBuf.scala 22:22]
    end else if (!(~wrPtr)) begin // @[PingPongBuf.scala 58:25]
      if (_T_1) begin // @[PingPongBuf.scala 67:26]
        buf_1_data <= io_in_bits_data; // @[PingPongBuf.scala 69:20]
      end
    end
    if (reset) begin // @[PingPongBuf.scala 23:27]
      bufValid_0 <= 1'h0; // @[PingPongBuf.scala 23:27]
    end else if (~rdPtr) begin // @[PingPongBuf.scala 77:25]
      bufValid_0 <= _GEN_21;
    end else if (_T_4) begin // @[PingPongBuf.scala 86:27]
      bufValid_0 <= 1'h0; // @[PingPongBuf.scala 88:25]
    end else begin
      bufValid_0 <= _GEN_21;
    end
    if (reset) begin // @[PingPongBuf.scala 23:27]
      bufValid_1 <= 1'h0; // @[PingPongBuf.scala 23:27]
    end else if (~rdPtr) begin // @[PingPongBuf.scala 77:25]
      if (_T_4) begin // @[PingPongBuf.scala 79:27]
        bufValid_1 <= 1'h0; // @[PingPongBuf.scala 81:25]
      end else begin
        bufValid_1 <= _GEN_31;
      end
    end else begin
      bufValid_1 <= _GEN_31;
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
  wrPtr = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rdPtr = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  buf_0_opcode = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  buf_0_source = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  buf_0_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  buf_0_mask = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  buf_0_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  buf_1_opcode = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  buf_1_source = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  buf_1_address = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  buf_1_mask = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  buf_1_data = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  bufValid_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  bufValid_1 = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
