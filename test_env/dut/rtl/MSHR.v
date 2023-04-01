module MSHR(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input         io_req_bits_dirInfo_hit,
  input  [7:0]  io_req_bits_dirInfo_chosenWay,
  input         io_req_bits_dirInfo_isDirtyWay,
  input  [19:0] io_req_bits_dirInfo_dirtyTag,
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
  output [7:0]  io_tasks_refill_req_bits_chosenWay,
  output        io_tasks_refill_resp_ready,
  input         io_tasks_refill_resp_valid,
  input  [31:0] io_tasks_refill_resp_bits_data,
  output        io_tasks_writeback_req_valid,
  output [31:0] io_tasks_writeback_req_bits_addr,
  output [19:0] io_tasks_writeback_req_bits_dirtyTag,
  output [31:0] io_tasks_writeback_req_bits_data_0,
  output [31:0] io_tasks_writeback_req_bits_data_1,
  output [31:0] io_tasks_writeback_req_bits_data_2,
  output [31:0] io_tasks_writeback_req_bits_data_3,
  output        io_tasks_writeback_resp_ready,
  input         io_tasks_writeback_resp_valid,
  input         io_dirWrite_req_ready,
  output        io_dirWrite_req_valid,
  output [31:0] io_dirWrite_req_bits_addr,
  output [7:0]  io_dirWrite_req_bits_way,
  input         io_dataWrite_req_ready,
  output        io_dataWrite_req_valid,
  output [31:0] io_dataWrite_req_bits_data,
  output [7:0]  io_dataWrite_req_bits_set,
  output [3:0]  io_dataWrite_req_bits_blockSelOH,
  output [7:0]  io_dataWrite_req_bits_way,
  output [3:0]  io_dataWrite_req_bits_mask
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
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] reqReg_addr; // @[Reg.scala 19:16]
  reg [7:0] reqReg_dirInfo_chosenWay; // @[Reg.scala 19:16]
  reg [19:0] reqReg_dirInfo_dirtyTag; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_0; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_1; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_2; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data_3; // @[Reg.scala 19:16]
  reg  reqReg_isStore; // @[Reg.scala 19:16]
  reg [31:0] reqReg_storeData; // @[Reg.scala 19:16]
  reg [3:0] reqReg_storeMask; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire  _GEN_9 = _reqReg_T ? io_req_bits_isStore : reqReg_isStore; // @[Reg.scala 19:16 20:{18,22}]
  reg [2:0] state; // @[MSHR.scala 63:24]
  wire  _io_busy_T = state == 3'h0; // @[MSHR.scala 66:22]
  wire [1:0] _GEN_13 = io_req_bits_dirInfo_isDirtyWay ? 2'h1 : 2'h2; // @[MSHR.scala 73:50 74:27 76:27]
  wire [1:0] _GEN_14 = _reqReg_T ? _GEN_13 : 2'h0; // @[MSHR.scala 71:19 72:27]
  wire [1:0] _GEN_15 = _io_busy_T ? _GEN_14 : 2'h0; // @[MSHR.scala 70:27 64:29]
  wire  _T_2 = state == 3'h1; // @[MSHR.scala 82:16]
  wire  _T_3 = io_tasks_writeback_resp_ready & io_tasks_writeback_resp_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _GEN_16 = _T_3 ? 2'h2 : 2'h1; // @[MSHR.scala 83:19 84:44 85:23]
  wire [1:0] _GEN_17 = state == 3'h1 ? _GEN_16 : _GEN_15; // @[MSHR.scala 82:32]
  wire  _T_4 = state == 3'h2; // @[MSHR.scala 90:16]
  wire  _T_5 = io_tasks_refill_resp_ready & io_tasks_refill_resp_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_18 = _T_5 ? 3'h4 : 3'h2; // @[MSHR.scala 91:19 94:47 95:23]
  wire [2:0] _GEN_19 = _T_5 & _GEN_9 ? 3'h3 : _GEN_18; // @[MSHR.scala 92:56 93:23]
  wire  _T_8 = io_resp_load_ready & io_resp_load_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_20 = _T_8 ? 3'h0 : _GEN_19; // @[MSHR.scala 98:33 99:23]
  wire  _T_9 = state == 3'h3; // @[MSHR.scala 104:16]
  wire  _T_10 = io_dirWrite_req_ready & io_dirWrite_req_valid; // @[Decoupled.scala 51:35]
  wire  _T_11 = io_dataWrite_req_ready & io_dataWrite_req_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _GEN_22 = _T_10 & _T_11 ? 3'h4 : 3'h3; // @[MSHR.scala 105:19 106:61 107:23]
  wire  _T_13 = io_resp_store_ready & io_resp_store_valid; // @[Decoupled.scala 51:35]
  wire  _T_14 = state == 3'h4; // @[MSHR.scala 116:16]
  wire  _willRefill_T_1 = ~io_req_bits_dirInfo_hit; // @[MSHR.scala 125:63]
  wire  willRefill = ~io_req_bits_dirInfo_isDirtyWay & ~io_req_bits_dirInfo_hit & _reqReg_T; // @[MSHR.scala 125:88]
  wire  willWriteback = io_req_bits_dirInfo_isDirtyWay & _willRefill_T_1 & _reqReg_T; // @[MSHR.scala 126:87]
  wire  willWriteStore = _T_4 & _GEN_9 & _T_5; // @[MSHR.scala 127:61]
  wire  _willRespLoad_T_1 = ~_GEN_9; // @[MSHR.scala 128:49]
  wire  willRespLoad = _T_4 & ~_GEN_9 & _T_5; // @[MSHR.scala 128:62]
  wire  willRespStore = _T_9 & _T_10 & _T_11; // @[MSHR.scala 129:73]
  reg [31:0] io_resp_load_bits_data_r; // @[Reg.scala 19:16]
  assign io_req_ready = state == 3'h0; // @[MSHR.scala 67:27]
  assign io_resp_load_valid = _willRespLoad_T_1 & (_T_14 | willRespLoad); // @[MSHR.scala 161:40]
  assign io_resp_load_bits_data = _T_5 ? io_tasks_refill_resp_bits_data : io_resp_load_bits_data_r; // @[MSHR.scala 162:34]
  assign io_resp_store_valid = _GEN_9 & (_T_14 | willRespStore); // @[MSHR.scala 167:40]
  assign io_tasks_refill_req_valid = _T_4 | willRefill; // @[MSHR.scala 131:52]
  assign io_tasks_refill_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[MSHR.scala 59:18]
  assign io_tasks_refill_req_bits_chosenWay = _reqReg_T ? io_req_bits_dirInfo_chosenWay : reqReg_dirInfo_chosenWay; // @[MSHR.scala 59:18]
  assign io_tasks_refill_resp_ready = 1'h1; // @[MSHR.scala 134:32]
  assign io_tasks_writeback_req_valid = _T_2 | willWriteback; // @[MSHR.scala 137:58]
  assign io_tasks_writeback_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_req_bits_dirtyTag = _reqReg_T ? io_req_bits_dirInfo_dirtyTag : reqReg_dirInfo_dirtyTag; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_req_bits_data_0 = _reqReg_T ? io_req_bits_data_0 : reqReg_data_0; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_req_bits_data_1 = _reqReg_T ? io_req_bits_data_1 : reqReg_data_1; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_req_bits_data_2 = _reqReg_T ? io_req_bits_data_2 : reqReg_data_2; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_req_bits_data_3 = _reqReg_T ? io_req_bits_data_3 : reqReg_data_3; // @[MSHR.scala 59:18]
  assign io_tasks_writeback_resp_ready = 1'h1; // @[MSHR.scala 141:35]
  assign io_dirWrite_req_valid = _T_9 | willWriteStore; // @[MSHR.scala 144:51]
  assign io_dirWrite_req_bits_addr = _reqReg_T ? io_req_bits_addr : reqReg_addr; // @[MSHR.scala 59:18]
  assign io_dirWrite_req_bits_way = _reqReg_T ? io_req_bits_dirInfo_chosenWay : reqReg_dirInfo_chosenWay; // @[MSHR.scala 59:18]
  assign io_dataWrite_req_valid = _T_9 | willWriteStore; // @[MSHR.scala 153:52]
  assign io_dataWrite_req_bits_data = _reqReg_T ? io_req_bits_storeData : reqReg_storeData; // @[MSHR.scala 59:18]
  assign io_dataWrite_req_bits_set = _GEN_0[11:4]; // @[Parameters.scala 50:11]
  assign io_dataWrite_req_bits_blockSelOH = 4'h1 << _GEN_0[3:2]; // @[OneHot.scala 57:35]
  assign io_dataWrite_req_bits_way = _reqReg_T ? io_req_bits_dirInfo_chosenWay : reqReg_dirInfo_chosenWay; // @[MSHR.scala 59:18]
  assign io_dataWrite_req_bits_mask = _reqReg_T ? io_req_bits_storeMask : reqReg_storeMask; // @[MSHR.scala 59:18]
  always @(posedge clock) begin
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_dirInfo_chosenWay <= io_req_bits_dirInfo_chosenWay; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_dirInfo_dirtyTag <= io_req_bits_dirInfo_dirtyTag; // @[Reg.scala 20:22]
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
    if (reset) begin // @[MSHR.scala 63:24]
      state <= 3'h0; // @[MSHR.scala 63:24]
    end else if (state == 3'h4) begin // @[MSHR.scala 116:27]
      if (_T_8 | _T_13) begin // @[MSHR.scala 118:55]
        state <= 3'h0; // @[MSHR.scala 119:23]
      end else begin
        state <= 3'h4; // @[MSHR.scala 117:19]
      end
    end else if (state == 3'h3) begin // @[MSHR.scala 104:32]
      if (_T_13) begin // @[MSHR.scala 110:34]
        state <= 3'h0; // @[MSHR.scala 111:23]
      end else begin
        state <= _GEN_22;
      end
    end else if (state == 3'h2) begin // @[MSHR.scala 90:29]
      state <= _GEN_20;
    end else begin
      state <= {{1'd0}, _GEN_17};
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
  reqReg_dirInfo_chosenWay = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reqReg_dirInfo_dirtyTag = _RAND_2[19:0];
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
  io_resp_load_bits_data_r = _RAND_11[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
