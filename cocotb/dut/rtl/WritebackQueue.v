module WritebackQueue(
  input          clock,
  input          reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [31:0]  io_req_bits_addr,
  input  [18:0]  io_req_bits_dirtyTag,
  input  [31:0]  io_req_bits_data_0,
  input  [31:0]  io_req_bits_data_1,
  input  [31:0]  io_req_bits_data_2,
  input  [31:0]  io_req_bits_data_3,
  output         io_resp_valid,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [31:0]  io_tlbus_req_bits_address,
  output [127:0] io_tlbus_req_bits_data,
  output         io_tlbus_resp_ready,
  input          io_tlbus_resp_valid
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
`endif // RANDOMIZE_REG_INIT
  wire  serializer_io_in_valid; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_in_bits_0_0; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_in_bits_0_1; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_in_bits_0_2; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_in_bits_0_3; // @[WritebackQueue.scala 49:28]
  wire  serializer_io_out_ready; // @[WritebackQueue.scala 49:28]
  wire  serializer_io_out_valid; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_out_bits_0; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_out_bits_1; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_out_bits_2; // @[WritebackQueue.scala 49:28]
  wire [31:0] serializer_io_out_bits_3; // @[WritebackQueue.scala 49:28]
  wire  serializer_io_fireAll; // @[WritebackQueue.scala 49:28]
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [18:0] reqReg_dirtyTag; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_0; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_1; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_2; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_3; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [18:0] _GEN_1 = _reqReg_T ? io_req_bits_dirtyTag : reqReg_dirtyTag; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_2 = _reqReg_T ? io_req_bits_data_0 : reqReg_data_0; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_3 = _reqReg_T ? io_req_bits_data_1 : reqReg_data_1; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_4 = _reqReg_T ? io_req_bits_data_2 : reqReg_data_2; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_5 = _reqReg_T ? io_req_bits_data_3 : reqReg_data_3; // @[Reg.scala 19:16 20:{18,22}]
  wire [18:0] req_dirtyTag = _reqReg_T ? io_req_bits_dirtyTag : reqReg_dirtyTag; // @[WritebackQueue.scala 43:18]
  reg  reqValidReg; // @[Reg.scala 19:16]
  wire  _GEN_6 = _reqReg_T | reqValidReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [127:0] _T = {_GEN_5,_GEN_4,_GEN_3,_GEN_2}; // @[WritebackQueue.scala 51:47]
  reg [1:0] state; // @[WritebackQueue.scala 53:24]
  wire  _io_req_ready_T = state == 2'h0; // @[WritebackQueue.scala 56:27]
  wire  _GEN_8 = _io_req_ready_T & _reqReg_T; // @[WritebackQueue.scala 58:27 54:29]
  wire [1:0] _GEN_9 = serializer_io_fireAll ? 2'h2 : 2'h1; // @[WritebackQueue.scala 66:19 67:37 68:23]
  wire  _GEN_10 = serializer_io_fireAll ? 1'h0 : _GEN_6; // @[WritebackQueue.scala 67:37 70:25]
  wire  _GEN_12 = state == 2'h1 ? _GEN_10 : _GEN_6; // @[WritebackQueue.scala 65:34]
  wire  _T_8 = state == 2'h2; // @[WritebackQueue.scala 74:16]
  wire  _T_9 = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_13 = io_resp_valid ? 2'h0 : 2'h3; // @[WritebackQueue.scala 77:23 79:32 80:27]
  wire  _T_11 = state == 2'h3; // @[WritebackQueue.scala 85:16]
  wire [63:0] io_tlbus_req_bits_data_lo = {serializer_io_out_bits_1,serializer_io_out_bits_0}; // @[WritebackQueue.scala 103:54]
  wire [63:0] io_tlbus_req_bits_data_hi = {serializer_io_out_bits_3,serializer_io_out_bits_2}; // @[WritebackQueue.scala 103:54]
  wire [8:0] dirtySet = _GEN_0[12:4]; // @[Parameters.scala 50:11]
  wire [31:0] writebackAddr = {_GEN_1,dirtySet,4'h0}; // @[Cat.scala 33:92]
  wire [32:0] _io_tlbus_req_bits_address_T_1 = {{1'd0}, writebackAddr}; // @[WritebackQueue.scala 110:49]
  TLSerializer serializer ( // @[WritebackQueue.scala 49:28]
    .io_in_valid(serializer_io_in_valid),
    .io_in_bits_0_0(serializer_io_in_bits_0_0),
    .io_in_bits_0_1(serializer_io_in_bits_0_1),
    .io_in_bits_0_2(serializer_io_in_bits_0_2),
    .io_in_bits_0_3(serializer_io_in_bits_0_3),
    .io_out_ready(serializer_io_out_ready),
    .io_out_valid(serializer_io_out_valid),
    .io_out_bits_0(serializer_io_out_bits_0),
    .io_out_bits_1(serializer_io_out_bits_1),
    .io_out_bits_2(serializer_io_out_bits_2),
    .io_out_bits_3(serializer_io_out_bits_3),
    .io_fireAll(serializer_io_fireAll)
  );
  assign io_req_ready = state == 2'h0; // @[WritebackQueue.scala 56:27]
  assign io_resp_valid = _T_11 | _T_9 & _T_8; // @[WritebackQueue.scala 96:38]
  assign io_tlbus_req_valid = serializer_io_out_valid; // @[WritebackQueue.scala 101:24]
  assign io_tlbus_req_bits_address = _io_tlbus_req_bits_address_T_1[31:0]; // @[WritebackQueue.scala 110:49]
  assign io_tlbus_req_bits_data = {io_tlbus_req_bits_data_hi,io_tlbus_req_bits_data_lo}; // @[WritebackQueue.scala 103:54]
  assign io_tlbus_resp_ready = 1'h1; // @[WritebackQueue.scala 98:25]
  assign serializer_io_in_valid = _reqReg_T | reqValidReg; // @[WritebackQueue.scala 45:23]
  assign serializer_io_in_bits_0_0 = _T[31:0]; // @[WritebackQueue.scala 51:47]
  assign serializer_io_in_bits_0_1 = _T[63:32]; // @[WritebackQueue.scala 51:47]
  assign serializer_io_in_bits_0_2 = _T[95:64]; // @[WritebackQueue.scala 51:47]
  assign serializer_io_in_bits_0_3 = _T[127:96]; // @[WritebackQueue.scala 51:47]
  assign serializer_io_out_ready = io_tlbus_req_ready; // @[WritebackQueue.scala 100:29]
  always @(posedge clock) begin
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_dirtyTag <= io_req_bits_dirtyTag; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_data_0 <= io_req_bits_data_0; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_data_1 <= io_req_bits_data_1; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_data_2 <= io_req_bits_data_2; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_data_3 <= io_req_bits_data_3; // @[Reg.scala 20:22]
    end
    if (state == 2'h3) begin // @[WritebackQueue.scala 85:27]
      if (io_resp_valid) begin // @[WritebackQueue.scala 87:28]
        reqValidReg <= 1'h0; // @[WritebackQueue.scala 90:25]
      end else begin
        reqValidReg <= _GEN_12;
      end
    end else begin
      reqValidReg <= _GEN_12;
    end
    if (reset) begin // @[WritebackQueue.scala 53:24]
      state <= 2'h0; // @[WritebackQueue.scala 53:24]
    end else if (state == 2'h3) begin // @[WritebackQueue.scala 85:27]
      state <= _GEN_13;
    end else if (state == 2'h2) begin // @[WritebackQueue.scala 74:32]
      if (_T_9) begin // @[WritebackQueue.scala 76:34]
        state <= _GEN_13;
      end else begin
        state <= 2'h2; // @[WritebackQueue.scala 75:19]
      end
    end else if (state == 2'h1) begin // @[WritebackQueue.scala 65:34]
      state <= _GEN_9;
    end else begin
      state <= {{1'd0}, _GEN_8};
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
  reqReg_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reqReg_dirtyTag = _RAND_1[18:0];
  _RAND_2 = {1{`RANDOM}};
  reqReg_data_0 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reqReg_data_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reqReg_data_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reqReg_data_3 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reqValidReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
