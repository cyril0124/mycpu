module RefillPipe_1(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [7:0]  io_req_bits_chosenWay,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [31:0] io_tlbus_req_bits_address,
  output        io_tlbus_resp_ready,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data,
  input         io_dirWrite_req_ready,
  output        io_dirWrite_req_valid,
  output [31:0] io_dirWrite_req_bits_addr,
  output [7:0]  io_dirWrite_req_bits_way,
  input         io_dataWrite_req_ready,
  output        io_dataWrite_req_valid,
  output [31:0] io_dataWrite_req_bits_data,
  output [7:0]  io_dataWrite_req_bits_set,
  output [3:0]  io_dataWrite_req_bits_blockSelOH,
  output [7:0]  io_dataWrite_req_bits_way
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
  reg [1:0] state; // @[RefillPipe.scala 41:24]
  wire  _io_req_ready_T = state == 2'h0; // @[RefillPipe.scala 44:27]
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [7:0] reqReg_chosenWay; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  reg  reqValidReg; // @[Reg.scala 19:16]
  wire  _GEN_2 = _reqReg_T | reqValidReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [3:0] dataBlockSelOH = 4'h1 << _GEN_0[3:2]; // @[OneHot.scala 57:35]
  reg [1:0] beatCounter_value; // @[Counter.scala 61:40]
  wire  lastBeat = beatCounter_value == 2'h3; // @[RefillPipe.scala 54:38]
  wire  _refillFire_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  refillFire = _refillFire_T & io_tlbus_resp_bits_opcode == 3'h1; // @[RefillPipe.scala 55:41]
  wire  refillLastBeat = refillFire & lastBeat; // @[RefillPipe.scala 56:37]
  reg [31:0] refillBlockDataArray_0; // @[RefillPipe.scala 61:39]
  reg [31:0] refillBlockDataArray_1; // @[RefillPipe.scala 61:39]
  reg [31:0] refillBlockDataArray_2; // @[RefillPipe.scala 61:39]
  wire [31:0] _readRespData_T_4 = dataBlockSelOH[0] ? refillBlockDataArray_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _readRespData_T_5 = dataBlockSelOH[1] ? refillBlockDataArray_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _readRespData_T_6 = dataBlockSelOH[2] ? refillBlockDataArray_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _readRespData_T_7 = dataBlockSelOH[3] ? io_tlbus_resp_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _readRespData_T_8 = _readRespData_T_4 | _readRespData_T_5; // @[Mux.scala 27:73]
  wire [31:0] _readRespData_T_9 = _readRespData_T_8 | _readRespData_T_6; // @[Mux.scala 27:73]
  wire  _T_2 = io_tlbus_req_ready & io_tlbus_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_12 = _T_2 ? 2'h2 : {{1'd0}, _reqReg_T}; // @[RefillPipe.scala 74:33 75:23]
  wire  _GEN_13 = _T_2 ? 1'h0 : _GEN_2; // @[RefillPipe.scala 74:33 76:25]
  wire [1:0] _GEN_14 = _io_req_ready_T ? _GEN_12 : 2'h0; // @[RefillPipe.scala 69:27 42:29]
  wire  _GEN_15 = _io_req_ready_T ? _GEN_13 : _GEN_2; // @[RefillPipe.scala 69:27]
  wire [1:0] _GEN_16 = _T_2 ? 2'h2 : 2'h1; // @[RefillPipe.scala 83:19 84:33 85:23]
  wire  _T_5 = state == 2'h2; // @[RefillPipe.scala 92:16]
  wire [1:0] _GEN_20 = io_resp_valid ? 2'h0 : 2'h3; // @[RefillPipe.scala 95:23 96:32 97:27]
  wire [1:0] _value_T_1 = beatCounter_value + 2'h1; // @[Counter.scala 77:24]
  wire  _T_7 = state == 2'h3; // @[RefillPipe.scala 108:16]
  assign io_req_ready = state == 2'h0; // @[RefillPipe.scala 44:27]
  assign io_resp_valid = _T_7 | refillLastBeat; // @[RefillPipe.scala 136:38]
  assign io_resp_bits_data = _readRespData_T_9 | _readRespData_T_7; // @[Mux.scala 27:73]
  assign io_tlbus_req_valid = _reqReg_T | reqValidReg; // @[RefillPipe.scala 49:23]
  assign io_tlbus_req_bits_address = {_GEN_0[31:4],4'h0}; // @[Cat.scala 33:92]
  assign io_tlbus_resp_ready = io_dataWrite_req_ready & io_dirWrite_req_ready; // @[RefillPipe.scala 58:51]
  assign io_dirWrite_req_valid = refillFire & _T_5; // @[RefillPipe.scala 118:33]
  assign io_dirWrite_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[RefillPipe.scala 47:18]
  assign io_dirWrite_req_bits_way = _reqReg_T ? io_req_bits_chosenWay : reqReg_chosenWay; // @[RefillPipe.scala 47:18]
  assign io_dataWrite_req_valid = refillFire & _T_5; // @[RefillPipe.scala 118:33]
  assign io_dataWrite_req_bits_data = io_tlbus_resp_bits_data; // @[RefillPipe.scala 133:32]
  assign io_dataWrite_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataWrite_req_bits_blockSelOH = 4'h1 << beatCounter_value; // @[OneHot.scala 57:35]
  assign io_dataWrite_req_bits_way = _reqReg_T ? io_req_bits_chosenWay : reqReg_chosenWay; // @[RefillPipe.scala 47:18]
  always @(posedge clock) begin
    if (reset) begin // @[RefillPipe.scala 41:24]
      state <= 2'h0; // @[RefillPipe.scala 41:24]
    end else if (state == 2'h3) begin // @[RefillPipe.scala 108:27]
      state <= _GEN_20;
    end else if (state == 2'h2) begin // @[RefillPipe.scala 92:33]
      if (refillLastBeat) begin // @[RefillPipe.scala 94:30]
        state <= _GEN_20;
      end else begin
        state <= 2'h2;
      end
    end else if (state == 2'h1) begin // @[RefillPipe.scala 82:26]
      state <= _GEN_16;
    end else begin
      state <= _GEN_14;
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_chosenWay <= io_req_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (state == 2'h1) begin // @[RefillPipe.scala 82:26]
      if (_T_2) begin // @[RefillPipe.scala 84:33]
        reqValidReg <= 1'h0; // @[RefillPipe.scala 86:25]
      end else begin
        reqValidReg <= _GEN_15;
      end
    end else begin
      reqValidReg <= _GEN_15;
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (state == 2'h2) begin // @[RefillPipe.scala 92:33]
      if (refillLastBeat) begin // @[RefillPipe.scala 94:30]
        beatCounter_value <= 2'h0; // @[Counter.scala 98:11]
      end else if (refillFire) begin // @[RefillPipe.scala 100:32]
        beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[RefillPipe.scala 61:39]
      refillBlockDataArray_0 <= 32'h0; // @[RefillPipe.scala 61:39]
    end else if (refillFire) begin // @[RefillPipe.scala 62:22]
      if (2'h0 == beatCounter_value) begin // @[RefillPipe.scala 62:64]
        refillBlockDataArray_0 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 62:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 61:39]
      refillBlockDataArray_1 <= 32'h0; // @[RefillPipe.scala 61:39]
    end else if (refillFire) begin // @[RefillPipe.scala 62:22]
      if (2'h1 == beatCounter_value) begin // @[RefillPipe.scala 62:64]
        refillBlockDataArray_1 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 62:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 61:39]
      refillBlockDataArray_2 <= 32'h0; // @[RefillPipe.scala 61:39]
    end else if (refillFire) begin // @[RefillPipe.scala 62:22]
      if (2'h2 == beatCounter_value) begin // @[RefillPipe.scala 62:64]
        refillBlockDataArray_2 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 62:64]
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  reqReg_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reqReg_chosenWay = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  reqValidReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  beatCounter_value = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  refillBlockDataArray_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  refillBlockDataArray_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  refillBlockDataArray_2 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
