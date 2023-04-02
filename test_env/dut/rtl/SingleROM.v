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
  output [31:0] io_resp_bits_size,
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
  reg [31:0] mem [0:131071]; // @[SingleROM.scala 70:26]
  wire  mem_rdata_en; // @[SingleROM.scala 70:26]
  wire [16:0] mem_rdata_addr; // @[SingleROM.scala 70:26]
  wire [31:0] mem_rdata_data; // @[SingleROM.scala 70:26]
  wire [31:0] mem_MPORT_data; // @[SingleROM.scala 70:26]
  wire [16:0] mem_MPORT_addr; // @[SingleROM.scala 70:26]
  wire  mem_MPORT_mask; // @[SingleROM.scala 70:26]
  wire  mem_MPORT_en; // @[SingleROM.scala 70:26]
  reg  mem_rdata_en_pipe_0;
  reg [16:0] mem_rdata_addr_pipe_0;
  wire  _reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [2:0] reqReg_opcode; // @[Reg.scala 19:16]
  reg [31:0] reqReg_size; // @[Reg.scala 19:16]
  reg [31:0] reqReg_address; // @[Reg.scala 19:16]
  reg [31:0] reqReg_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_0 = _reqReg_T ? io_req_bits_opcode : reqReg_opcode; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_4 = _reqReg_T ? io_req_bits_address : reqReg_address; // @[Reg.scala 19:16 20:{18,22}]
  reg  busy; // @[SingleROM.scala 75:23]
  reg [4:0] reqLastBeat_count_value; // @[Counter.scala 61:40]
  wire [29:0] reqLastBeat_beatNum = io_req_bits_size[31:2]; // @[Bus.scala 85:41]
  wire [29:0] _reqLastBeat_lastBeat_T_1 = reqLastBeat_beatNum - 30'h1; // @[Bus.scala 86:52]
  wire [29:0] _GEN_25 = {{25'd0}, reqLastBeat_count_value}; // @[Bus.scala 86:40]
  wire  reqLastBeat_lastBeat = _GEN_25 == _reqLastBeat_lastBeat_T_1; // @[Bus.scala 86:40]
  wire  reqLastBeat_fireLastBeat = _reqReg_T & reqLastBeat_lastBeat; // @[Bus.scala 87:38]
  wire [4:0] _reqLastBeat_value_T_1 = reqLastBeat_count_value + 5'h1; // @[Counter.scala 77:24]
  reg [4:0] respLastBeat_count_value; // @[Counter.scala 61:40]
  wire [29:0] respLastBeat_beatNum = io_resp_bits_size[31:2]; // @[Bus.scala 96:42]
  wire [29:0] _respLastBeat_lastBeat_T_1 = respLastBeat_beatNum - 30'h1; // @[Bus.scala 97:52]
  wire [29:0] _GEN_26 = {{25'd0}, respLastBeat_count_value}; // @[Bus.scala 97:40]
  wire  respLastBeat_lastBeat = _GEN_26 == _respLastBeat_lastBeat_T_1; // @[Bus.scala 97:40]
  wire  _respLastBeat_fireLastBeat_T = io_resp_ready & io_resp_valid; // @[Decoupled.scala 51:35]
  wire  respLastBeat_fireLastBeat = _respLastBeat_fireLastBeat_T & respLastBeat_lastBeat; // @[Bus.scala 98:39]
  wire [4:0] _respLastBeat_value_T_1 = respLastBeat_count_value + 5'h1; // @[Counter.scala 77:24]
  wire  _getFire_T_1 = _GEN_0 == 3'h4; // @[SingleROM.scala 83:45]
  wire  getFire = _reqReg_T & _GEN_0 == 3'h4; // @[SingleROM.scala 83:31]
  wire  _putFire_T_2 = _GEN_0 == 3'h2; // @[SingleROM.scala 84:60]
  wire  putFire = _reqReg_T & reqLastBeat_fireLastBeat & _GEN_0 == 3'h2; // @[SingleROM.scala 84:46]
  wire  reqLatch = getFire | putFire; // @[SingleROM.scala 85:28]
  wire  _finish_T_2 = reqReg_opcode == 3'h4; // @[SingleROM.scala 114:86]
  wire  finish = _respLastBeat_fireLastBeat_T & (reqReg_opcode == 3'h2 | reqReg_opcode == 3'h4 &
    respLastBeat_fireLastBeat); // @[SingleROM.scala 114:28]
  wire  _GEN_12 = busy & finish ? 1'h0 : busy; // @[SingleROM.scala 75:23 87:{31,38}]
  wire  _GEN_13 = reqLatch | _GEN_12; // @[SingleROM.scala 86:{20,27}]
  wire  ren = _getFire_T_1 & (_reqReg_T | _respLastBeat_fireLastBeat_T); // @[SingleROM.scala 89:41]
  wire  wen = _reqReg_T & _putFire_T_2; // @[SingleROM.scala 90:27]
  reg [4:0] beatCount_count_value; // @[Counter.scala 61:40]
  wire [29:0] _GEN_27 = {{25'd0}, beatCount_count_value}; // @[Bus.scala 97:40]
  wire  beatCount_lastBeat = _GEN_27 == _respLastBeat_lastBeat_T_1; // @[Bus.scala 97:40]
  wire  beatCount_fireLastBeat = _respLastBeat_fireLastBeat_T & beatCount_lastBeat; // @[Bus.scala 98:39]
  wire [4:0] _beatCount_value_T_1 = beatCount_count_value + 5'h1; // @[Counter.scala 77:24]
  wire [4:0] beatCount = _reqReg_T ? 5'h0 : _beatCount_value_T_1; // @[SingleROM.scala 94:24]
  wire [6:0] addrOff = {beatCount, 2'h0}; // @[SingleROM.scala 95:29]
  wire [31:0] _GEN_28 = {{25'd0}, addrOff}; // @[SingleROM.scala 96:31]
  wire [31:0] _rdAddr_T_1 = _GEN_4 + _GEN_28; // @[SingleROM.scala 96:31]
  wire [29:0] rdAddr = _rdAddr_T_1[31:2]; // @[SingleROM.scala 96:42]
  wire [29:0] wrAddr = _GEN_4[31:2]; // @[SingleROM.scala 101:30]
  assign mem_rdata_en = mem_rdata_en_pipe_0;
  assign mem_rdata_addr = mem_rdata_addr_pipe_0;
  assign mem_rdata_data = mem[mem_rdata_addr]; // @[SingleROM.scala 70:26]
  assign mem_MPORT_data = _reqReg_T ? io_req_bits_data : reqReg_data;
  assign mem_MPORT_addr = wrAddr[16:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = wen;
  assign io_req_ready = ~busy; // @[SingleROM.scala 78:21]
  assign io_resp_valid = busy; // @[SingleROM.scala 107:19]
  assign io_resp_bits_opcode = {{2'd0}, _finish_T_2}; // @[SingleROM.scala 111:25]
  assign io_resp_bits_size = reqReg_size; // @[SingleROM.scala 109:23]
  assign io_resp_bits_data = mem_rdata_data; // @[SingleROM.scala 110:23]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SingleROM.scala 70:26]
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
    if (reset) begin // @[SingleROM.scala 75:23]
      busy <= 1'h0; // @[SingleROM.scala 75:23]
    end else begin
      busy <= _GEN_13;
    end
    if (reset) begin // @[Counter.scala 61:40]
      reqLastBeat_count_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (reqLastBeat_fireLastBeat | _reqReg_T & io_req_bits_opcode == 3'h4) begin // @[Bus.scala 88:71]
      reqLastBeat_count_value <= 5'h0; // @[Counter.scala 98:11]
    end else if (_reqReg_T) begin // @[Bus.scala 90:34]
      reqLastBeat_count_value <= _reqLastBeat_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      respLastBeat_count_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (respLastBeat_fireLastBeat | _respLastBeat_fireLastBeat_T & io_resp_bits_opcode == 3'h0) begin // @[Bus.scala 99:79]
      respLastBeat_count_value <= 5'h0; // @[Counter.scala 98:11]
    end else if (_respLastBeat_fireLastBeat_T) begin // @[Bus.scala 101:35]
      respLastBeat_count_value <= _respLastBeat_value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      beatCount_count_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (beatCount_fireLastBeat | _respLastBeat_fireLastBeat_T & io_resp_bits_opcode == 3'h0) begin // @[Bus.scala 99:79]
      beatCount_count_value <= 5'h0; // @[Counter.scala 98:11]
    end else if (_respLastBeat_fireLastBeat_T) begin // @[Bus.scala 101:35]
      beatCount_count_value <= _beatCount_value_T_1; // @[Counter.scala 77:15]
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
  reqLastBeat_count_value = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  respLastBeat_count_value = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  beatCount_count_value = _RAND_10[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
