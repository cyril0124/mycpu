module MSHR(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input         io_req_bits_dirInfo_hit,
  input  [3:0]  io_req_bits_dirInfo_chosenWay,
  input         io_req_bits_dirInfo_isDirtyWay,
  input  [18:0] io_req_bits_dirtyTag,
  input  [31:0] io_req_bits_data_0,
  input  [31:0] io_req_bits_data_1,
  input  [31:0] io_req_bits_data_2,
  input  [31:0] io_req_bits_data_3,
  input         io_req_bits_isStore,
  input  [31:0] io_req_bits_storeData,
  input  [3:0]  io_req_bits_storeMask,
  input         io_resp_load_ready,
  output        io_resp_load_valid,
  output [31:0] io_resp_load_bits_data,
  input         io_resp_store_ready,
  output        io_resp_store_valid,
  output        io_tasks_refill_req_valid,
  output [31:0] io_tasks_refill_req_bits_addr,
  output [3:0]  io_tasks_refill_req_bits_chosenWay,
  output        io_tasks_refill_resp_ready,
  input         io_tasks_refill_resp_valid,
  input  [31:0] io_tasks_refill_resp_bits_data,
  output        io_tasks_writeback_req_valid,
  output [31:0] io_tasks_writeback_req_bits_addr,
  output [18:0] io_tasks_writeback_req_bits_dirtyTag,
  output [31:0] io_tasks_writeback_req_bits_data_0,
  output [31:0] io_tasks_writeback_req_bits_data_1,
  output [31:0] io_tasks_writeback_req_bits_data_2,
  output [31:0] io_tasks_writeback_req_bits_data_3,
  output        io_tasks_writeback_resp_ready,
  input         io_tasks_writeback_resp_valid,
  input         io_dirWrite_req_ready,
  output        io_dirWrite_req_valid,
  output [31:0] io_dirWrite_req_bits_addr,
  output [3:0]  io_dirWrite_req_bits_way,
  input         io_dataWrite_req_ready,
  output        io_dataWrite_req_valid,
  output [8:0]  io_dataWrite_req_bits_set,
  output [31:0] io_dataWrite_req_bits_data_0,
  output [31:0] io_dataWrite_req_bits_data_1,
  output [31:0] io_dataWrite_req_bits_data_2,
  output [31:0] io_dataWrite_req_bits_data_3,
  output [3:0]  io_dataWrite_req_bits_blockMask,
  output [3:0]  io_dataWrite_req_bits_way
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
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [3:0] reqReg_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [18:0] reqReg_dirtyTag; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_0; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_1; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_2; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_3; // @[Reg.scala 19:16]
  reg  reqReg_isStore; // @[Reg.scala 19:16]
  reg [31:0] reqReg_storeData; // @[Reg.scala 19:16]
  reg [3:0] reqReg_storeMask; // @[Reg.scala 19:16]
  wire  _GEN_13 = _reqReg_T ? io_req_bits_isStore : reqReg_isStore; // @[Reg.scala 19:16 20:{18,22}]
  reg [2:0] state; // @[MSHR.scala 64:24]
  wire  _io_busy_T = state == 3'h0; // @[MSHR.scala 67:22]
  wire [1:0] _GEN_17 = io_req_bits_dirInfo_isDirtyWay ? 2'h1 : 2'h2; // @[MSHR.scala 74:50 75:27 77:27]
  wire [1:0] _GEN_18 = _reqReg_T ? _GEN_17 : 2'h0; // @[MSHR.scala 72:19 73:27]
  wire [1:0] _GEN_19 = _io_busy_T ? _GEN_18 : 2'h0; // @[MSHR.scala 71:27 65:29]
  wire  _T_2 = state == 3'h1; // @[MSHR.scala 83:16]
  wire  _T_3 = io_tasks_writeback_resp_ready & io_tasks_writeback_resp_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_20 = _T_3 ? 2'h2 : 2'h1; // @[MSHR.scala 84:19 85:44 86:23]
  wire [1:0] _GEN_21 = state == 3'h1 ? _GEN_20 : _GEN_19; // @[MSHR.scala 83:32]
  wire  _T_4 = state == 3'h2; // @[MSHR.scala 91:16]
  wire  _T_5 = io_tasks_refill_resp_ready & io_tasks_refill_resp_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_22 = _T_5 ? 3'h4 : 3'h2; // @[MSHR.scala 92:19 95:47 96:23]
  wire [2:0] _GEN_23 = _T_5 & _GEN_13 ? 3'h3 : _GEN_22; // @[MSHR.scala 93:56 94:23]
  wire  _T_8 = io_resp_load_ready & io_resp_load_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_24 = _T_8 ? 3'h0 : _GEN_23; // @[MSHR.scala 100:23 99:33]
  wire  _T_9 = state == 3'h3; // @[MSHR.scala 105:16]
  wire  _T_10 = io_dirWrite_req_ready & io_dirWrite_req_valid; // @[Decoupled.scala 51:35]
  wire  _T_11 = io_dataWrite_req_ready & io_dataWrite_req_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_26 = _T_10 & _T_11 ? 3'h4 : 3'h3; // @[MSHR.scala 106:19 107:61 108:23]
  wire  _T_13 = io_resp_store_ready & io_resp_store_valid; // @[Decoupled.scala 51:35]
  wire  _T_14 = state == 3'h4; // @[MSHR.scala 117:16]
  wire  _willRefill_T_1 = ~io_req_bits_dirInfo_hit; // @[MSHR.scala 126:63]
  wire  willRefill = ~io_req_bits_dirInfo_isDirtyWay & ~io_req_bits_dirInfo_hit & _reqReg_T; // @[MSHR.scala 126:88]
  wire  willWriteback = io_req_bits_dirInfo_isDirtyWay & _willRefill_T_1 & _reqReg_T; // @[MSHR.scala 127:87]
  wire  willWriteStore = _T_4 & _GEN_13 & _T_5; // @[MSHR.scala 128:61]
  wire  _willRespLoad_T_1 = ~_GEN_13; // @[MSHR.scala 129:49]
  wire  willRespLoad = _T_4 & ~_GEN_13 & _T_5; // @[MSHR.scala 129:62]
  wire  willRespStore = _T_9 & _T_10 & _T_11; // @[MSHR.scala 130:73]
  wire [3:0] _io_dataWrite_req_bits_blockMask_T_1 = 4'h1 << reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  reg [31:0] oldData_r; // @[Reg.scala 19:16]
  wire [31:0] _GEN_31 = _T_5 ? io_tasks_refill_resp_bits_data : oldData_r; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] hi = _io_dataWrite_req_bits_blockMask_T_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo = _io_dataWrite_req_bits_blockMask_T_1[1:0]; // @[OneHot.scala 31:18]
  wire  _T_20 = |hi; // @[OneHot.scala 32:14]
  wire [1:0] _T_21 = hi | lo; // @[OneHot.scala 32:28]
  wire [1:0] _T_23 = {_T_20,_T_21[1]}; // @[Cat.scala 33:92]
  wire [7:0] _tempWrData_tempMask_T_5 = reqReg_storeMask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_7 = reqReg_storeMask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_9 = reqReg_storeMask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] _tempWrData_tempMask_T_11 = reqReg_storeMask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [31:0] tempWrData_tempMask = {_tempWrData_tempMask_T_11,_tempWrData_tempMask_T_9,_tempWrData_tempMask_T_7,
    _tempWrData_tempMask_T_5}; // @[Cat.scala 33:92]
  wire [31:0] _tempWrData_T = ~tempWrData_tempMask; // @[Parameters.scala 67:8]
  wire [31:0] _tempWrData_T_1 = _tempWrData_T & _GEN_31; // @[Parameters.scala 67:18]
  wire [31:0] _tempWrData_T_2 = tempWrData_tempMask & reqReg_storeData; // @[Parameters.scala 67:41]
  wire [31:0] _tempWrData_T_3 = _tempWrData_T_1 | _tempWrData_T_2; // @[Parameters.scala 67:29]
  reg [31:0] io_resp_load_bits_data_r; // @[Reg.scala 19:16]
  assign io_req_ready = state == 3'h0; // @[MSHR.scala 68:27]
  assign io_resp_load_valid = _willRespLoad_T_1 & (_T_14 | willRespLoad); // @[MSHR.scala 166:40]
  assign io_resp_load_bits_data = _T_5 ? io_tasks_refill_resp_bits_data : io_resp_load_bits_data_r; // @[MSHR.scala 167:34]
  assign io_resp_store_valid = _GEN_13 & (_T_14 | willRespStore); // @[MSHR.scala 172:40]
  assign io_tasks_refill_req_valid = _T_4 | willRefill; // @[MSHR.scala 132:52]
  assign io_tasks_refill_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[MSHR.scala 60:18]
  assign io_tasks_refill_req_bits_chosenWay = _reqReg_T ? io_req_bits_dirInfo_chosenWay : reqReg_dirInfo_chosenWay; // @[MSHR.scala 60:18]
  assign io_tasks_refill_resp_ready = 1'h1; // @[MSHR.scala 135:32]
  assign io_tasks_writeback_req_valid = _T_2 | willWriteback; // @[MSHR.scala 138:58]
  assign io_tasks_writeback_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_req_bits_dirtyTag = _reqReg_T ? io_req_bits_dirtyTag : reqReg_dirtyTag; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_req_bits_data_0 = _reqReg_T ? io_req_bits_data_0 : reqReg_data_0; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_req_bits_data_1 = _reqReg_T ? io_req_bits_data_1 : reqReg_data_1; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_req_bits_data_2 = _reqReg_T ? io_req_bits_data_2 : reqReg_data_2; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_req_bits_data_3 = _reqReg_T ? io_req_bits_data_3 : reqReg_data_3; // @[MSHR.scala 60:18]
  assign io_tasks_writeback_resp_ready = 1'h1; // @[MSHR.scala 142:35]
  assign io_dirWrite_req_valid = _T_9 | willWriteStore; // @[MSHR.scala 145:51]
  assign io_dirWrite_req_bits_addr = reqReg_addr; // @[MSHR.scala 146:31]
  assign io_dirWrite_req_bits_way = reqReg_dirInfo_chosenWay; // @[MSHR.scala 151:30]
  assign io_dataWrite_req_valid = _T_9 | willWriteStore; // @[MSHR.scala 154:52]
  assign io_dataWrite_req_bits_set = reqReg_addr[12:4]; // @[Parameters.scala 50:11]
  assign io_dataWrite_req_bits_data_0 = 2'h0 == _T_23 ? _tempWrData_T_3 : 32'h0; // @[MSHR.scala 159:30 160:{60,60}]
  assign io_dataWrite_req_bits_data_1 = 2'h1 == _T_23 ? _tempWrData_T_3 : 32'h0; // @[MSHR.scala 159:30 160:{60,60}]
  assign io_dataWrite_req_bits_data_2 = 2'h2 == _T_23 ? _tempWrData_T_3 : 32'h0; // @[MSHR.scala 159:30 160:{60,60}]
  assign io_dataWrite_req_bits_data_3 = 2'h3 == _T_23 ? _tempWrData_T_3 : 32'h0; // @[MSHR.scala 159:30 160:{60,60}]
  assign io_dataWrite_req_bits_blockMask = 4'h1 << reqReg_addr[3:2]; // @[OneHot.scala 57:35]
  assign io_dataWrite_req_bits_way = reqReg_dirInfo_chosenWay; // @[MSHR.scala 157:31]
  always @(posedge clock) begin
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_dirInfo_chosenWay <= io_req_bits_dirInfo_chosenWay; // @[Reg.scala 20:22]
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
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_isStore <= io_req_bits_isStore; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_storeData <= io_req_bits_storeData; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_storeMask <= io_req_bits_storeMask; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[MSHR.scala 64:24]
      state <= 3'h0; // @[MSHR.scala 64:24]
    end else if (state == 3'h4) begin // @[MSHR.scala 117:27]
      if (_T_8 | _T_13) begin // @[MSHR.scala 119:55]
        state <= 3'h0; // @[MSHR.scala 120:23]
      end else begin
        state <= 3'h4; // @[MSHR.scala 118:19]
      end
    end else if (state == 3'h3) begin // @[MSHR.scala 105:32]
      if (_T_13) begin // @[MSHR.scala 111:34]
        state <= 3'h0; // @[MSHR.scala 112:23]
      end else begin
        state <= _GEN_26;
      end
    end else if (state == 3'h2) begin // @[MSHR.scala 91:29]
      state <= _GEN_24;
    end else begin
      state <= {{1'd0}, _GEN_21};
    end
    if (_T_5) begin // @[Reg.scala 20:18]
      oldData_r <= io_tasks_refill_resp_bits_data; // @[Reg.scala 20:22]
    end
    if (_T_5) begin // @[Reg.scala 20:18]
      io_resp_load_bits_data_r <= io_tasks_refill_resp_bits_data; // @[Reg.scala 20:22]
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
  reqReg_dirInfo_chosenWay = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  reqReg_dirtyTag = _RAND_2[18:0];
  _RAND_3 = {1{`RANDOM}};
  reqReg_data_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reqReg_data_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reqReg_data_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reqReg_data_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reqReg_isStore = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  reqReg_storeData = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reqReg_storeMask = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  state = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  oldData_r = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  io_resp_load_bits_data_r = _RAND_12[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
