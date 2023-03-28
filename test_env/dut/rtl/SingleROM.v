module SingleROM(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_opcode,
  input  [31:0] io_req_bits_size,
  input  [31:0] io_req_bits_address,
  input  [31:0] io_req_bits_data,
  input         io_resp_ready,
  output        io_resp_valid,
  output [2:0]  io_resp_bits_opcode,
  output [31:0] io_resp_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:131071]; // @[SingleROM.scala 14:26]
  wire  mem_rdata_en; // @[SingleROM.scala 14:26]
  wire [16:0] mem_rdata_addr; // @[SingleROM.scala 14:26]
  wire [31:0] mem_rdata_data; // @[SingleROM.scala 14:26]
  wire [31:0] mem_MPORT_data; // @[SingleROM.scala 14:26]
  wire [16:0] mem_MPORT_addr; // @[SingleROM.scala 14:26]
  wire  mem_MPORT_mask; // @[SingleROM.scala 14:26]
  wire  mem_MPORT_en; // @[SingleROM.scala 14:26]
  reg  mem_rdata_en_pipe_0;
  reg [16:0] mem_rdata_addr_pipe_0;
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [2:0] reqReg_opcode; // @[Reg.scala 19:16]
  reg [31:0] reqReg_size; // @[Reg.scala 19:16]
  reg [31:0] reqReg_address; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_0 = _reqReg_T ? io_req_bits_opcode : reqReg_opcode; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_4 = _reqReg_T ? io_req_bits_address : reqReg_address; // @[Reg.scala 19:16 20:{18,22}]
  wire [29:0] reqBeatSize = reqReg_size[31:2]; // @[SingleROM.scala 18:35]
  reg  busy; // @[SingleROM.scala 19:23]
  reg [4:0] beatCounter_value; // @[Counter.scala 61:40]
  wire [29:0] _lastBeat_T_1 = reqBeatSize - 30'h1; // @[SingleROM.scala 25:54]
  wire [29:0] _GEN_21 = {{25'd0}, beatCounter_value}; // @[SingleROM.scala 25:38]
  wire  lastBeat = _GEN_21 == _lastBeat_T_1; // @[SingleROM.scala 25:38]
  wire  lastBeat_1 = _GEN_21 == reqBeatSize; // @[SingleROM.scala 26:40]
  wire  _T = io_resp_ready & io_resp_valid; // @[Decoupled.scala 51:35]
  wire  _T_3 = _GEN_0 == 3'h4; // @[SingleROM.scala 30:53]
  wire  _T_6 = _GEN_0 == 3'h2; // @[SingleROM.scala 31:35]
  wire  _T_7 = _reqReg_T & _GEN_0 == 3'h2; // @[SingleROM.scala 31:21]
  wire  _T_8 = (_T | _reqReg_T) & _GEN_0 == 3'h4 | _T_7; // @[SingleROM.scala 30:68]
  wire [4:0] _value_T_1 = beatCounter_value + 5'h1; // @[Counter.scala 77:24]
  wire  _finish_T_2 = reqReg_opcode == 3'h4; // @[SingleROM.scala 64:86]
  wire  finish = _T & (reqReg_opcode == 3'h2 | reqReg_opcode == 3'h4 & lastBeat_1); // @[SingleROM.scala 64:28]
  wire  getFire = _reqReg_T & _T_3; // @[SingleROM.scala 36:31]
  wire  putFire = _reqReg_T & lastBeat & _T_6; // @[SingleROM.scala 37:43]
  wire  reqLatch = getFire | putFire; // @[SingleROM.scala 38:28]
  wire  _GEN_10 = busy & finish ? 1'h0 : busy; // @[SingleROM.scala 19:23 40:{31,38}]
  wire  _GEN_11 = reqLatch | _GEN_10; // @[SingleROM.scala 39:{20,27}]
  wire  ren = _T_3 & (_reqReg_T | _T); // @[SingleROM.scala 42:41]
  wire  wen = _reqReg_T & _T_6; // @[SingleROM.scala 43:27]
  wire [6:0] addrOff = {beatCounter_value, 2'h0}; // @[SingleROM.scala 47:37]
  wire [31:0] _GEN_23 = {{25'd0}, addrOff}; // @[SingleROM.scala 48:31]
  wire [31:0] _rdAddr_T_1 = _GEN_4 + _GEN_23; // @[SingleROM.scala 48:31]
  wire [29:0] rdAddr = _rdAddr_T_1[31:2]; // @[SingleROM.scala 48:42]
  wire [29:0] wrAddr = _GEN_4[31:2]; // @[SingleROM.scala 52:30]
  assign mem_rdata_en = mem_rdata_en_pipe_0;
  assign mem_rdata_addr = mem_rdata_addr_pipe_0;
  assign mem_rdata_data = mem[mem_rdata_addr]; // @[SingleROM.scala 14:26]
  assign mem_MPORT_data = _reqReg_T ? io_req_bits_data : reqReg_data;
  assign mem_MPORT_addr = wrAddr[16:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T_7;
  assign io_req_ready = ~busy; // @[SingleROM.scala 22:21]
  assign io_resp_valid = busy; // @[SingleROM.scala 58:19]
  assign io_resp_bits_opcode = {{2'd0}, _finish_T_2}; // @[SingleROM.scala 61:25]
  assign io_resp_bits_data = mem_rdata_data; // @[SingleROM.scala 60:23]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SingleROM.scala 14:26]
    end
    mem_rdata_en_pipe_0 <= ren;
    if (ren) begin
      mem_rdata_addr_pipe_0 <= rdAddr[16:0];
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_opcode <= io_req_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_size <= io_req_bits_size; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_address <= io_req_bits_address; // @[Reg.scala 20:22]
    end
    if (_reqReg_T) begin // @[Reg.scala 20:18]
      reqReg_data <= io_req_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[SingleROM.scala 19:23]
      busy <= 1'h0; // @[SingleROM.scala 19:23]
    end else begin
      busy <= _GEN_11;
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (finish) begin // @[SingleROM.scala 27:20]
      beatCounter_value <= 5'h0; // @[Counter.scala 98:11]
    end else if (_T_8) begin // @[SingleROM.scala 32:7]
      beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 131072; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdata_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdata_addr_pipe_0 = _RAND_2[16:0];
  _RAND_3 = {1{`RANDOM}};
  reqReg_opcode = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  reqReg_size = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reqReg_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reqReg_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  busy = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  beatCounter_value = _RAND_8[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
