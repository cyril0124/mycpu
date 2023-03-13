module BankRam1P_1(
  input         clock,
  input         reset,
  input         io_en,
  input  [9:0]  io_addr,
  input         io_rw,
  input  [31:0] io_wdata,
  input  [3:0]  io_wmask,
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
  reg [7:0] ram_0 [0:1023]; // @[SRAM.scala 49:26]
  wire  ram_0_rdata_MPORT_en; // @[SRAM.scala 49:26]
  wire [9:0] ram_0_rdata_MPORT_addr; // @[SRAM.scala 49:26]
  wire [7:0] ram_0_rdata_MPORT_data; // @[SRAM.scala 49:26]
  wire [7:0] ram_0_MPORT_data; // @[SRAM.scala 49:26]
  wire [9:0] ram_0_MPORT_addr; // @[SRAM.scala 49:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 49:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 49:26]
  reg  ram_0_rdata_MPORT_en_pipe_0;
  reg [9:0] ram_0_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_1 [0:1023]; // @[SRAM.scala 49:26]
  wire  ram_1_rdata_MPORT_en; // @[SRAM.scala 49:26]
  wire [9:0] ram_1_rdata_MPORT_addr; // @[SRAM.scala 49:26]
  wire [7:0] ram_1_rdata_MPORT_data; // @[SRAM.scala 49:26]
  wire [7:0] ram_1_MPORT_data; // @[SRAM.scala 49:26]
  wire [9:0] ram_1_MPORT_addr; // @[SRAM.scala 49:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 49:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 49:26]
  reg  ram_1_rdata_MPORT_en_pipe_0;
  reg [9:0] ram_1_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_2 [0:1023]; // @[SRAM.scala 49:26]
  wire  ram_2_rdata_MPORT_en; // @[SRAM.scala 49:26]
  wire [9:0] ram_2_rdata_MPORT_addr; // @[SRAM.scala 49:26]
  wire [7:0] ram_2_rdata_MPORT_data; // @[SRAM.scala 49:26]
  wire [7:0] ram_2_MPORT_data; // @[SRAM.scala 49:26]
  wire [9:0] ram_2_MPORT_addr; // @[SRAM.scala 49:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 49:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 49:26]
  reg  ram_2_rdata_MPORT_en_pipe_0;
  reg [9:0] ram_2_rdata_MPORT_addr_pipe_0;
  reg [7:0] ram_3 [0:1023]; // @[SRAM.scala 49:26]
  wire  ram_3_rdata_MPORT_en; // @[SRAM.scala 49:26]
  wire [9:0] ram_3_rdata_MPORT_addr; // @[SRAM.scala 49:26]
  wire [7:0] ram_3_rdata_MPORT_data; // @[SRAM.scala 49:26]
  wire [7:0] ram_3_MPORT_data; // @[SRAM.scala 49:26]
  wire [9:0] ram_3_MPORT_addr; // @[SRAM.scala 49:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 49:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 49:26]
  reg  ram_3_rdata_MPORT_en_pipe_0;
  reg [9:0] ram_3_rdata_MPORT_addr_pipe_0;
  wire [7:0] rdata_1 = ram_1_rdata_MPORT_data; // @[SRAM.scala 53:{25,25}]
  wire [7:0] rdata_0 = ram_0_rdata_MPORT_data; // @[SRAM.scala 53:{25,25}]
  wire [15:0] io_rdata_lo = {rdata_1,rdata_0}; // @[SRAM.scala 55:23]
  wire [7:0] rdata_3 = ram_3_rdata_MPORT_data; // @[SRAM.scala 53:{25,25}]
  wire [7:0] rdata_2 = ram_2_rdata_MPORT_data; // @[SRAM.scala 53:{25,25}]
  wire [15:0] io_rdata_hi = {rdata_3,rdata_2}; // @[SRAM.scala 55:23]
  assign ram_0_rdata_MPORT_en = ram_0_rdata_MPORT_en_pipe_0;
  assign ram_0_rdata_MPORT_addr = ram_0_rdata_MPORT_addr_pipe_0;
  assign ram_0_rdata_MPORT_data = ram_0[ram_0_rdata_MPORT_addr]; // @[SRAM.scala 49:26]
  assign ram_0_MPORT_data = io_wdata[7:0];
  assign ram_0_MPORT_addr = io_addr;
  assign ram_0_MPORT_mask = io_wmask[0];
  assign ram_0_MPORT_en = io_en & io_rw;
  assign ram_1_rdata_MPORT_en = ram_1_rdata_MPORT_en_pipe_0;
  assign ram_1_rdata_MPORT_addr = ram_1_rdata_MPORT_addr_pipe_0;
  assign ram_1_rdata_MPORT_data = ram_1[ram_1_rdata_MPORT_addr]; // @[SRAM.scala 49:26]
  assign ram_1_MPORT_data = io_wdata[15:8];
  assign ram_1_MPORT_addr = io_addr;
  assign ram_1_MPORT_mask = io_wmask[1];
  assign ram_1_MPORT_en = io_en & io_rw;
  assign ram_2_rdata_MPORT_en = ram_2_rdata_MPORT_en_pipe_0;
  assign ram_2_rdata_MPORT_addr = ram_2_rdata_MPORT_addr_pipe_0;
  assign ram_2_rdata_MPORT_data = ram_2[ram_2_rdata_MPORT_addr]; // @[SRAM.scala 49:26]
  assign ram_2_MPORT_data = io_wdata[23:16];
  assign ram_2_MPORT_addr = io_addr;
  assign ram_2_MPORT_mask = io_wmask[2];
  assign ram_2_MPORT_en = io_en & io_rw;
  assign ram_3_rdata_MPORT_en = ram_3_rdata_MPORT_en_pipe_0;
  assign ram_3_rdata_MPORT_addr = ram_3_rdata_MPORT_addr_pipe_0;
  assign ram_3_rdata_MPORT_data = ram_3[ram_3_rdata_MPORT_addr]; // @[SRAM.scala 49:26]
  assign ram_3_MPORT_data = io_wdata[31:24];
  assign ram_3_MPORT_addr = io_addr;
  assign ram_3_MPORT_mask = io_wmask[3];
  assign ram_3_MPORT_en = io_en & io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 55:23]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 49:26]
    end
    ram_0_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_0_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 49:26]
    end
    ram_1_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_1_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 49:26]
    end
    ram_2_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_2_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 49:26]
    end
    ram_3_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      ram_3_rdata_MPORT_addr_pipe_0 <= io_addr;
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
    ram_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_rdata_MPORT_addr_pipe_0 = _RAND_5[9:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_rdata_MPORT_addr_pipe_0 = _RAND_8[9:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_rdata_MPORT_addr_pipe_0 = _RAND_11[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
