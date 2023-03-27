module SingleRAM(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_opcode,
  input  [3:0]  io_req_bits_size,
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
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:131071]; // @[SingleROM.scala 71:26]
  wire  mem_rdata_1_en; // @[SingleROM.scala 71:26]
  wire [16:0] mem_rdata_1_addr; // @[SingleROM.scala 71:26]
  wire [31:0] mem_rdata_1_data; // @[SingleROM.scala 71:26]
  wire [31:0] mem_MPORT_data; // @[SingleROM.scala 71:26]
  wire [16:0] mem_MPORT_addr; // @[SingleROM.scala 71:26]
  wire  mem_MPORT_mask; // @[SingleROM.scala 71:26]
  wire  mem_MPORT_en; // @[SingleROM.scala 71:26]
  reg  mem_rdata_1_en_pipe_0;
  reg [16:0] mem_rdata_1_addr_pipe_0;
  wire  _req_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [2:0] req_r_opcode; // @[Reg.scala 19:16]
  reg [3:0] req_r_size; // @[Reg.scala 19:16]
  reg [31:0] req_r_address; // @[Reg.scala 19:16]
  reg [31:0] req_r_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_0 = _req_T ? io_req_bits_opcode : req_r_opcode; // @[Reg.scala 19:16 20:{18,22}]
  wire [3:0] _GEN_2 = _req_T ? io_req_bits_size : req_r_size; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_4 = _req_T ? io_req_bits_address : req_r_address; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] reqBeatSize = _GEN_2[3:2]; // @[SingleROM.scala 62:32]
  reg  busy; // @[SingleROM.scala 63:23]
  wire  _GEN_8 = _req_T | busy; // @[SingleROM.scala 67:23 68:14 63:23]
  wire  _ren_T = _GEN_0 == 3'h4; // @[SingleROM.scala 74:26]
  wire  ren = _GEN_0 == 3'h4 & _GEN_8; // @[SingleROM.scala 74:41]
  wire  _wen_T_1 = _GEN_0 == 3'h2; // @[SingleROM.scala 75:41]
  reg [3:0] beatCounter_value; // @[Counter.scala 61:40]
  wire [3:0] _GEN_24 = {{2'd0}, reqBeatSize}; // @[SingleROM.scala 78:38]
  wire  lastBeat = beatCounter_value == _GEN_24; // @[SingleROM.scala 78:38]
  wire  _T_6 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 51:35]
  wire  wrap = beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_1 = beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _GEN_9 = wrap ? 4'h0 : _value_T_1; // @[Counter.scala 77:15 87:{20,28}]
  wire [5:0] addrOff = {beatCounter_value, 2'h0}; // @[SingleROM.scala 85:37]
  wire [31:0] _GEN_25 = {{26'd0}, addrOff}; // @[SingleROM.scala 86:31]
  wire [31:0] _rdAddr_T_1 = _GEN_4 + _GEN_25; // @[SingleROM.scala 86:31]
  wire [29:0] rdAddr = _rdAddr_T_1[31:2]; // @[SingleROM.scala 86:42]
  wire [29:0] _rdata_1_T_1 = rdAddr - 30'h20000; // @[SingleROM.scala 87:35]
  reg  rdata_REG; // @[SingleROM.scala 88:61]
  reg [31:0] rdata_r; // @[Reg.scala 19:16]
  assign mem_rdata_1_en = mem_rdata_1_en_pipe_0;
  assign mem_rdata_1_addr = mem_rdata_1_addr_pipe_0;
  assign mem_rdata_1_data = mem[mem_rdata_1_addr]; // @[SingleROM.scala 71:26]
  assign mem_MPORT_data = _req_T ? io_req_bits_data : req_r_data;
  assign mem_MPORT_addr = _GEN_4[16:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _req_T & _wen_T_1;
  assign io_req_ready = ~busy; // @[SingleROM.scala 65:21]
  assign io_resp_valid = busy & (_ren_T | _wen_T_1); // @[SingleROM.scala 93:27]
  assign io_resp_bits_opcode = {{2'd0}, _ren_T}; // @[SingleROM.scala 96:25]
  assign io_resp_bits_data = ren ? mem_rdata_1_data : rdata_r; // @[SingleROM.scala 88:20]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SingleROM.scala 71:26]
    end
    mem_rdata_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_rdata_1_addr_pipe_0 <= _rdata_1_T_1[16:0];
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_opcode <= io_req_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_size <= io_req_bits_size; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_address <= io_req_bits_address; // @[Reg.scala 20:22]
    end
    if (_req_T) begin // @[Reg.scala 20:18]
      req_r_data <= io_req_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[SingleROM.scala 63:23]
      busy <= 1'h0; // @[SingleROM.scala 63:23]
    end else if (_T_6 & (_wen_T_1 | _ren_T & lastBeat)) begin // @[SingleROM.scala 99:104]
      busy <= 1'h0; // @[SingleROM.scala 100:14]
    end else begin
      busy <= _GEN_8;
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (_T_6 & (_wen_T_1 | _ren_T & lastBeat)) begin // @[SingleROM.scala 99:104]
      beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (_req_T & lastBeat & _ren_T) begin // @[SingleROM.scala 79:64]
      beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if ((_req_T | _T_6) & _ren_T) begin // @[SingleROM.scala 81:76]
      beatCounter_value <= _GEN_9;
    end
    rdata_REG <= _GEN_0 == 3'h4 & _GEN_8; // @[SingleROM.scala 74:41]
    if (rdata_REG) begin // @[Reg.scala 20:18]
      rdata_r <= mem_rdata_1_data; // @[Reg.scala 20:22]
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
  mem_rdata_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdata_1_addr_pipe_0 = _RAND_2[16:0];
  _RAND_3 = {1{`RANDOM}};
  req_r_opcode = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  req_r_size = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  req_r_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  req_r_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  busy = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  beatCounter_value = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  rdata_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  rdata_r = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
