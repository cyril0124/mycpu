module RefillPipe(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [7:0]  io_req_bits_chosenWay,
  input         io_resp_ready,
  output        io_resp_valid,
  output [31:0] io_resp_bits_data,
  input         io_tlbus_req_ready,
  output        io_tlbus_req_valid,
  output [31:0] io_tlbus_req_bits_address,
  output        io_tlbus_resp_ready,
  input         io_tlbus_resp_valid,
  input  [2:0]  io_tlbus_resp_bits_opcode,
  input  [31:0] io_tlbus_resp_bits_data,
  output        io_dirWrite_req_valid,
  output [31:0] io_dirWrite_req_bits_addr,
  output [7:0]  io_dirWrite_req_bits_way,
  output        io_dataWrite_req_valid,
  output [31:0] io_dataWrite_req_bits_data,
  output [6:0]  io_dataWrite_req_bits_set,
  output [7:0]  io_dataWrite_req_bits_blockSelOH,
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[RefillPipe.scala 42:24]
  wire  _io_req_ready_T = state == 2'h0; // @[RefillPipe.scala 45:27]
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [7:0] reqReg_chosenWay; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  reg  reqValidReg; // @[Reg.scala 19:16]
  wire  _GEN_2 = _reqReg_T | reqValidReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [7:0] dataBlockSelOH = 8'h1 << reqReg_addr[4:2]; // @[OneHot.scala 57:35]
  reg [2:0] beatCounter_value; // @[Counter.scala 61:40]
  wire  lastBeat = beatCounter_value == 3'h7; // @[RefillPipe.scala 55:38]
  wire  _refillFire_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  refillFire = _refillFire_T & io_tlbus_resp_bits_opcode == 3'h1; // @[RefillPipe.scala 56:41]
  wire  refillLastBeat = refillFire & lastBeat; // @[RefillPipe.scala 57:37]
  reg [31:0] refillBlockDataArray_0; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_1; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_2; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_3; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_4; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_5; // @[RefillPipe.scala 62:39]
  reg [31:0] refillBlockDataArray_6; // @[RefillPipe.scala 62:39]
  wire  _T_2 = io_tlbus_req_ready & io_tlbus_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_20 = _T_2 ? 2'h2 : {{1'd0}, _reqReg_T}; // @[RefillPipe.scala 75:33 76:23]
  wire  _GEN_21 = _T_2 ? 1'h0 : _GEN_2; // @[RefillPipe.scala 75:33 77:25]
  wire [1:0] _GEN_22 = _io_req_ready_T ? _GEN_20 : 2'h0; // @[RefillPipe.scala 70:27 43:29]
  wire  _GEN_23 = _io_req_ready_T ? _GEN_21 : _GEN_2; // @[RefillPipe.scala 70:27]
  wire [1:0] _GEN_24 = _T_2 ? 2'h2 : 2'h1; // @[RefillPipe.scala 84:19 85:33 86:23]
  wire  _T_5 = state == 2'h2; // @[RefillPipe.scala 93:16]
  wire [1:0] _GEN_28 = io_resp_valid ? 2'h0 : 2'h3; // @[RefillPipe.scala 96:23 97:32 98:27]
  wire [2:0] _value_T_1 = beatCounter_value + 3'h1; // @[Counter.scala 77:24]
  wire  _T_7 = state == 2'h3; // @[RefillPipe.scala 109:16]
  wire  refillSafe = refillFire & _T_5; // @[RefillPipe.scala 119:33]
  wire [31:0] _io_resp_bits_data_T_8 = dataBlockSelOH[0] ? refillBlockDataArray_0 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_9 = dataBlockSelOH[1] ? refillBlockDataArray_1 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_10 = dataBlockSelOH[2] ? refillBlockDataArray_2 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_11 = dataBlockSelOH[3] ? refillBlockDataArray_3 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_12 = dataBlockSelOH[4] ? refillBlockDataArray_4 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_13 = dataBlockSelOH[5] ? refillBlockDataArray_5 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_14 = dataBlockSelOH[6] ? refillBlockDataArray_6 : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_15 = dataBlockSelOH[7] ? io_tlbus_resp_bits_data : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_16 = _io_resp_bits_data_T_8 | _io_resp_bits_data_T_9; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_17 = _io_resp_bits_data_T_16 | _io_resp_bits_data_T_10; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_18 = _io_resp_bits_data_T_17 | _io_resp_bits_data_T_11; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_19 = _io_resp_bits_data_T_18 | _io_resp_bits_data_T_12; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_20 = _io_resp_bits_data_T_19 | _io_resp_bits_data_T_13; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_21 = _io_resp_bits_data_T_20 | _io_resp_bits_data_T_14; // @[Mux.scala 27:73]
  assign io_req_ready = state == 2'h0; // @[RefillPipe.scala 45:27]
  assign io_resp_valid = _T_7 | refillLastBeat; // @[RefillPipe.scala 136:38]
  assign io_resp_bits_data = _io_resp_bits_data_T_21 | _io_resp_bits_data_T_15; // @[Mux.scala 27:73]
  assign io_tlbus_req_valid = _reqReg_T | reqValidReg; // @[RefillPipe.scala 50:23]
  assign io_tlbus_req_bits_address = {_GEN_0[31:5],5'h0}; // @[Cat.scala 33:92]
  assign io_tlbus_resp_ready = 1'h1; // @[RefillPipe.scala 59:51]
  assign io_dirWrite_req_valid = refillSafe & lastBeat; // @[RefillPipe.scala 120:41]
  assign io_dirWrite_req_bits_addr = reqReg_addr; // @[RefillPipe.scala 121:31]
  assign io_dirWrite_req_bits_way = reqReg_chosenWay; // @[RefillPipe.scala 126:30]
  assign io_dataWrite_req_valid = refillFire & _T_5; // @[RefillPipe.scala 119:33]
  assign io_dataWrite_req_bits_data = io_tlbus_resp_bits_data; // @[RefillPipe.scala 133:32]
  assign io_dataWrite_req_bits_set = reqReg_addr[11:5]; // @[Parameters.scala 50:11]
  assign io_dataWrite_req_bits_blockSelOH = 8'h1 << beatCounter_value; // @[OneHot.scala 57:35]
  assign io_dataWrite_req_bits_way = reqReg_chosenWay; // @[RefillPipe.scala 131:31]
  always @(posedge clock) begin
    if (reset) begin // @[RefillPipe.scala 42:24]
      state <= 2'h0; // @[RefillPipe.scala 42:24]
    end else if (state == 2'h3) begin // @[RefillPipe.scala 109:27]
      state <= _GEN_28;
    end else if (state == 2'h2) begin // @[RefillPipe.scala 93:33]
      if (refillLastBeat) begin // @[RefillPipe.scala 95:30]
        state <= _GEN_28;
      end else begin
        state <= 2'h2;
      end
    end else if (state == 2'h1) begin // @[RefillPipe.scala 83:26]
      state <= _GEN_24;
    end else begin
      state <= _GEN_22;
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_chosenWay <= io_req_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (state == 2'h1) begin // @[RefillPipe.scala 83:26]
      if (_T_2) begin // @[RefillPipe.scala 85:33]
        reqValidReg <= 1'h0; // @[RefillPipe.scala 87:25]
      end else begin
        reqValidReg <= _GEN_23;
      end
    end else begin
      reqValidReg <= _GEN_23;
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (state == 2'h2) begin // @[RefillPipe.scala 93:33]
      if (refillLastBeat) begin // @[RefillPipe.scala 95:30]
        beatCounter_value <= 3'h0; // @[Counter.scala 98:11]
      end else if (refillFire) begin // @[RefillPipe.scala 101:32]
        beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_0 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h0 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_0 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_1 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h1 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_1 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_2 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h2 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_2 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_3 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h3 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_3 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_4 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h4 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_4 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_5 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h5 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_5 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
      end
    end
    if (reset) begin // @[RefillPipe.scala 62:39]
      refillBlockDataArray_6 <= 32'h0; // @[RefillPipe.scala 62:39]
    end else if (refillFire) begin // @[RefillPipe.scala 63:22]
      if (3'h6 == beatCounter_value) begin // @[RefillPipe.scala 63:64]
        refillBlockDataArray_6 <= io_tlbus_resp_bits_data; // @[RefillPipe.scala 63:64]
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
  beatCounter_value = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  refillBlockDataArray_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  refillBlockDataArray_1 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  refillBlockDataArray_2 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  refillBlockDataArray_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  refillBlockDataArray_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  refillBlockDataArray_5 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  refillBlockDataArray_6 = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
