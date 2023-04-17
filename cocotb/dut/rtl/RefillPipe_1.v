module RefillPipe_1(
  input          clock,
  input          reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [31:0]  io_req_bits_addr,
  input  [3:0]   io_req_bits_chosenWay,
  output         io_resp_valid,
  output [31:0]  io_resp_bits_data,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [31:0]  io_tlbus_req_bits_address,
  output         io_tlbus_resp_ready,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [127:0] io_tlbus_resp_bits_data,
  input          io_dirWrite_req_ready,
  output         io_dirWrite_req_valid,
  output [31:0]  io_dirWrite_req_bits_addr,
  output [3:0]   io_dirWrite_req_bits_way,
  input          io_dataWrite_req_ready,
  output         io_dataWrite_req_valid,
  output [8:0]   io_dataWrite_req_bits_set,
  output [31:0]  io_dataWrite_req_bits_data_0,
  output [31:0]  io_dataWrite_req_bits_data_1,
  output [31:0]  io_dataWrite_req_bits_data_2,
  output [31:0]  io_dataWrite_req_bits_data_3,
  output [3:0]   io_dataWrite_req_bits_way
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[RefillPipe.scala 42:24]
  wire  _io_req_ready_T = state == 2'h0; // @[RefillPipe.scala 45:27]
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [3:0] reqReg_chosenWay; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  reg  reqValidReg; // @[Reg.scala 19:16]
  wire  _GEN_2 = _reqReg_T | reqValidReg; // @[Reg.scala 19:16 20:{18,22}]
  wire [3:0] dataBlockSelOH = 4'h1 << reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  wire  _refillFire_T = io_tlbus_resp_ready & io_tlbus_resp_valid; // @[Decoupled.scala 51:35]
  wire  refillFire = _refillFire_T & io_tlbus_resp_bits_opcode == 3'h1; // @[RefillPipe.scala 59:41]
  wire  _T_2 = io_tlbus_req_ready & io_tlbus_req_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_4 = _T_2 ? 2'h2 : {{1'd0}, _reqReg_T}; // @[RefillPipe.scala 71:33 72:23]
  wire  _GEN_5 = _T_2 ? 1'h0 : _GEN_2; // @[RefillPipe.scala 71:33 73:25]
  wire [1:0] _GEN_6 = _io_req_ready_T ? _GEN_4 : 2'h0; // @[RefillPipe.scala 66:27 43:29]
  wire  _GEN_7 = _io_req_ready_T ? _GEN_5 : _GEN_2; // @[RefillPipe.scala 66:27]
  wire [1:0] _GEN_8 = _T_2 ? 2'h2 : 2'h1; // @[RefillPipe.scala 80:19 81:33 82:23]
  wire  _T_5 = state == 2'h2; // @[RefillPipe.scala 89:16]
  wire [1:0] _GEN_12 = io_resp_valid ? 2'h0 : 2'h3; // @[RefillPipe.scala 92:23 93:32 94:27]
  wire  _T_7 = state == 2'h3; // @[RefillPipe.scala 105:16]
  wire [31:0] _io_resp_bits_data_T_8 = dataBlockSelOH[0] ? io_tlbus_resp_bits_data[31:0] : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_9 = dataBlockSelOH[1] ? io_tlbus_resp_bits_data[63:32] : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_10 = dataBlockSelOH[2] ? io_tlbus_resp_bits_data[95:64] : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_11 = dataBlockSelOH[3] ? io_tlbus_resp_bits_data[127:96] : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_12 = _io_resp_bits_data_T_8 | _io_resp_bits_data_T_9; // @[Mux.scala 27:73]
  wire [31:0] _io_resp_bits_data_T_13 = _io_resp_bits_data_T_12 | _io_resp_bits_data_T_10; // @[Mux.scala 27:73]
  assign io_req_ready = state == 2'h0; // @[RefillPipe.scala 45:27]
  assign io_resp_valid = _T_7 | refillFire; // @[RefillPipe.scala 140:38]
  assign io_resp_bits_data = _io_resp_bits_data_T_13 | _io_resp_bits_data_T_11; // @[Mux.scala 27:73]
  assign io_tlbus_req_valid = _reqReg_T | reqValidReg; // @[RefillPipe.scala 50:23]
  assign io_tlbus_req_bits_address = {_GEN_0[31:4],4'h0}; // @[Cat.scala 33:92]
  assign io_tlbus_resp_ready = io_dataWrite_req_ready & io_dirWrite_req_ready; // @[RefillPipe.scala 62:51]
  assign io_dirWrite_req_valid = refillFire & _T_5; // @[RefillPipe.scala 115:33]
  assign io_dirWrite_req_bits_addr = reqReg_addr; // @[RefillPipe.scala 117:31]
  assign io_dirWrite_req_bits_way = reqReg_chosenWay; // @[RefillPipe.scala 122:30]
  assign io_dataWrite_req_valid = refillFire & _T_5; // @[RefillPipe.scala 115:33]
  assign io_dataWrite_req_bits_set = reqReg_addr[12:4]; // @[Parameters.scala 50:11]
  assign io_dataWrite_req_bits_data_0 = io_tlbus_resp_bits_data[31:0]; // @[RefillPipe.scala 130:99]
  assign io_dataWrite_req_bits_data_1 = io_tlbus_resp_bits_data[63:32]; // @[RefillPipe.scala 130:99]
  assign io_dataWrite_req_bits_data_2 = io_tlbus_resp_bits_data[95:64]; // @[RefillPipe.scala 130:99]
  assign io_dataWrite_req_bits_data_3 = io_tlbus_resp_bits_data[127:96]; // @[RefillPipe.scala 130:99]
  assign io_dataWrite_req_bits_way = reqReg_chosenWay; // @[RefillPipe.scala 128:31]
  always @(posedge clock) begin
    if (reset) begin // @[RefillPipe.scala 42:24]
      state <= 2'h0; // @[RefillPipe.scala 42:24]
    end else if (state == 2'h3) begin // @[RefillPipe.scala 105:27]
      state <= _GEN_12;
    end else if (state == 2'h2) begin // @[RefillPipe.scala 89:33]
      if (refillFire) begin // @[RefillPipe.scala 91:30]
        state <= _GEN_12;
      end else begin
        state <= 2'h2;
      end
    end else if (state == 2'h1) begin // @[RefillPipe.scala 79:26]
      state <= _GEN_8;
    end else begin
      state <= _GEN_6;
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_chosenWay <= io_req_bits_chosenWay; // @[Reg.scala 20:22]
    end
    if (state == 2'h1) begin // @[RefillPipe.scala 79:26]
      if (_T_2) begin // @[RefillPipe.scala 81:33]
        reqValidReg <= 1'h0; // @[RefillPipe.scala 83:25]
      end else begin
        reqValidReg <= _GEN_7;
      end
    end else begin
      reqValidReg <= _GEN_7;
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
  reqReg_chosenWay = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  reqValidReg = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
