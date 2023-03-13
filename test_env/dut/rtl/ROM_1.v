module ROM_1(
  input         clock,
  input  [3:0]  io_wmask,
  input  [31:0] io_raddr,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0 [0:1023]; // @[ROM.scala 42:26]
  wire  mem_0_io_rdata_MPORT_en; // @[ROM.scala 42:26]
  wire [9:0] mem_0_io_rdata_MPORT_addr; // @[ROM.scala 42:26]
  wire [7:0] mem_0_io_rdata_MPORT_data; // @[ROM.scala 42:26]
  wire [7:0] mem_0_MPORT_data; // @[ROM.scala 42:26]
  wire [9:0] mem_0_MPORT_addr; // @[ROM.scala 42:26]
  wire  mem_0_MPORT_mask; // @[ROM.scala 42:26]
  wire  mem_0_MPORT_en; // @[ROM.scala 42:26]
  reg  mem_0_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_0_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:1023]; // @[ROM.scala 42:26]
  wire  mem_1_io_rdata_MPORT_en; // @[ROM.scala 42:26]
  wire [9:0] mem_1_io_rdata_MPORT_addr; // @[ROM.scala 42:26]
  wire [7:0] mem_1_io_rdata_MPORT_data; // @[ROM.scala 42:26]
  wire [7:0] mem_1_MPORT_data; // @[ROM.scala 42:26]
  wire [9:0] mem_1_MPORT_addr; // @[ROM.scala 42:26]
  wire  mem_1_MPORT_mask; // @[ROM.scala 42:26]
  wire  mem_1_MPORT_en; // @[ROM.scala 42:26]
  reg  mem_1_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_1_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:1023]; // @[ROM.scala 42:26]
  wire  mem_2_io_rdata_MPORT_en; // @[ROM.scala 42:26]
  wire [9:0] mem_2_io_rdata_MPORT_addr; // @[ROM.scala 42:26]
  wire [7:0] mem_2_io_rdata_MPORT_data; // @[ROM.scala 42:26]
  wire [7:0] mem_2_MPORT_data; // @[ROM.scala 42:26]
  wire [9:0] mem_2_MPORT_addr; // @[ROM.scala 42:26]
  wire  mem_2_MPORT_mask; // @[ROM.scala 42:26]
  wire  mem_2_MPORT_en; // @[ROM.scala 42:26]
  reg  mem_2_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_2_io_rdata_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:1023]; // @[ROM.scala 42:26]
  wire  mem_3_io_rdata_MPORT_en; // @[ROM.scala 42:26]
  wire [9:0] mem_3_io_rdata_MPORT_addr; // @[ROM.scala 42:26]
  wire [7:0] mem_3_io_rdata_MPORT_data; // @[ROM.scala 42:26]
  wire [7:0] mem_3_MPORT_data; // @[ROM.scala 42:26]
  wire [9:0] mem_3_MPORT_addr; // @[ROM.scala 42:26]
  wire  mem_3_MPORT_mask; // @[ROM.scala 42:26]
  wire  mem_3_MPORT_en; // @[ROM.scala 42:26]
  reg  mem_3_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_3_io_rdata_MPORT_addr_pipe_0;
  wire [15:0] io_rdata_lo = {mem_1_io_rdata_MPORT_data,mem_0_io_rdata_MPORT_data}; // @[ROM.scala 74:66]
  wire [15:0] io_rdata_hi = {mem_3_io_rdata_MPORT_data,mem_2_io_rdata_MPORT_data}; // @[ROM.scala 74:66]
  assign mem_0_io_rdata_MPORT_en = mem_0_io_rdata_MPORT_en_pipe_0;
  assign mem_0_io_rdata_MPORT_addr = mem_0_io_rdata_MPORT_addr_pipe_0;
  assign mem_0_io_rdata_MPORT_data = mem_0[mem_0_io_rdata_MPORT_addr]; // @[ROM.scala 42:26]
  assign mem_0_MPORT_data = 8'h0;
  assign mem_0_MPORT_addr = 10'h0;
  assign mem_0_MPORT_mask = io_wmask[0];
  assign mem_0_MPORT_en = 1'h0;
  assign mem_1_io_rdata_MPORT_en = mem_1_io_rdata_MPORT_en_pipe_0;
  assign mem_1_io_rdata_MPORT_addr = mem_1_io_rdata_MPORT_addr_pipe_0;
  assign mem_1_io_rdata_MPORT_data = mem_1[mem_1_io_rdata_MPORT_addr]; // @[ROM.scala 42:26]
  assign mem_1_MPORT_data = 8'h0;
  assign mem_1_MPORT_addr = 10'h0;
  assign mem_1_MPORT_mask = io_wmask[1];
  assign mem_1_MPORT_en = 1'h0;
  assign mem_2_io_rdata_MPORT_en = mem_2_io_rdata_MPORT_en_pipe_0;
  assign mem_2_io_rdata_MPORT_addr = mem_2_io_rdata_MPORT_addr_pipe_0;
  assign mem_2_io_rdata_MPORT_data = mem_2[mem_2_io_rdata_MPORT_addr]; // @[ROM.scala 42:26]
  assign mem_2_MPORT_data = 8'h0;
  assign mem_2_MPORT_addr = 10'h0;
  assign mem_2_MPORT_mask = io_wmask[2];
  assign mem_2_MPORT_en = 1'h0;
  assign mem_3_io_rdata_MPORT_en = mem_3_io_rdata_MPORT_en_pipe_0;
  assign mem_3_io_rdata_MPORT_addr = mem_3_io_rdata_MPORT_addr_pipe_0;
  assign mem_3_io_rdata_MPORT_data = mem_3[mem_3_io_rdata_MPORT_addr]; // @[ROM.scala 42:26]
  assign mem_3_MPORT_data = 8'h0;
  assign mem_3_MPORT_addr = 10'h0;
  assign mem_3_MPORT_mask = io_wmask[3];
  assign mem_3_MPORT_en = 1'h0;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[ROM.scala 74:66]
  always @(posedge clock) begin
    if (mem_0_MPORT_en & mem_0_MPORT_mask) begin
      mem_0[mem_0_MPORT_addr] <= mem_0_MPORT_data; // @[ROM.scala 42:26]
    end
    mem_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_0_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
    end
    if (mem_1_MPORT_en & mem_1_MPORT_mask) begin
      mem_1[mem_1_MPORT_addr] <= mem_1_MPORT_data; // @[ROM.scala 42:26]
    end
    mem_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_1_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
    end
    if (mem_2_MPORT_en & mem_2_MPORT_mask) begin
      mem_2[mem_2_MPORT_addr] <= mem_2_MPORT_data; // @[ROM.scala 42:26]
    end
    mem_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_2_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
    end
    if (mem_3_MPORT_en & mem_3_MPORT_mask) begin
      mem_3[mem_3_MPORT_addr] <= mem_3_MPORT_data; // @[ROM.scala 42:26]
    end
    mem_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_3_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
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
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[9:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[9:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
