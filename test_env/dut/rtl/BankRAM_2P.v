module BankRAM_2P(
  input         clock,
  input  [6:0]  io_r_addr,
  output [31:0] io_r_data,
  input         io_w_en,
  input  [6:0]  io_w_addr,
  input  [31:0] io_w_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:127]; // @[SRAM_1.scala 63:26]
  wire  mem_io_r_data_MPORT_en; // @[SRAM_1.scala 63:26]
  wire [6:0] mem_io_r_data_MPORT_addr; // @[SRAM_1.scala 63:26]
  wire [31:0] mem_io_r_data_MPORT_data; // @[SRAM_1.scala 63:26]
  wire [31:0] mem_MPORT_data; // @[SRAM_1.scala 63:26]
  wire [6:0] mem_MPORT_addr; // @[SRAM_1.scala 63:26]
  wire  mem_MPORT_mask; // @[SRAM_1.scala 63:26]
  wire  mem_MPORT_en; // @[SRAM_1.scala 63:26]
  reg  mem_io_r_data_MPORT_en_pipe_0;
  reg [6:0] mem_io_r_data_MPORT_addr_pipe_0;
  wire  readConflict = io_w_addr == io_r_addr; // @[SRAM_1.scala 81:34]
  assign mem_io_r_data_MPORT_en = mem_io_r_data_MPORT_en_pipe_0;
  assign mem_io_r_data_MPORT_addr = mem_io_r_data_MPORT_addr_pipe_0;
  assign mem_io_r_data_MPORT_data = mem[mem_io_r_data_MPORT_addr]; // @[SRAM_1.scala 63:26]
  assign mem_MPORT_data = io_w_data;
  assign mem_MPORT_addr = io_w_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_w_en;
  assign io_r_data = io_w_en & readConflict ? io_w_data : mem_io_r_data_MPORT_data; // @[SRAM_1.scala 83:25]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM_1.scala 63:26]
    end
    mem_io_r_data_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_r_data_MPORT_addr_pipe_0 <= io_r_addr;
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
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_r_data_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_r_data_MPORT_addr_pipe_0 = _RAND_2[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
