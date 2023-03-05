module ReadIMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_inst
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:1023]; // @[IMem.scala 35:18]
  wire  mem_io_inst_MPORT_en; // @[IMem.scala 35:18]
  wire [9:0] mem_io_inst_MPORT_addr; // @[IMem.scala 35:18]
  wire [7:0] mem_io_inst_MPORT_data; // @[IMem.scala 35:18]
  wire  mem_io_inst_MPORT_1_en; // @[IMem.scala 35:18]
  wire [9:0] mem_io_inst_MPORT_1_addr; // @[IMem.scala 35:18]
  wire [7:0] mem_io_inst_MPORT_1_data; // @[IMem.scala 35:18]
  wire  mem_io_inst_MPORT_2_en; // @[IMem.scala 35:18]
  wire [9:0] mem_io_inst_MPORT_2_addr; // @[IMem.scala 35:18]
  wire [7:0] mem_io_inst_MPORT_2_data; // @[IMem.scala 35:18]
  wire  mem_io_inst_MPORT_3_en; // @[IMem.scala 35:18]
  wire [9:0] mem_io_inst_MPORT_3_addr; // @[IMem.scala 35:18]
  wire [7:0] mem_io_inst_MPORT_3_data; // @[IMem.scala 35:18]
  wire [32:0] _io_inst_T = {{1'd0}, io_addr}; // @[IMem.scala 37:63]
  wire [31:0] _io_inst_T_3 = _io_inst_T[31:0] - 32'h0; // @[IMem.scala 37:69]
  wire [31:0] _io_inst_T_6 = io_addr + 32'h1; // @[IMem.scala 37:63]
  wire [31:0] _io_inst_T_8 = _io_inst_T_6 - 32'h0; // @[IMem.scala 37:69]
  wire [31:0] _io_inst_T_11 = io_addr + 32'h2; // @[IMem.scala 37:63]
  wire [31:0] _io_inst_T_13 = _io_inst_T_11 - 32'h0; // @[IMem.scala 37:69]
  wire [31:0] _io_inst_T_16 = io_addr + 32'h3; // @[IMem.scala 37:63]
  wire [31:0] _io_inst_T_18 = _io_inst_T_16 - 32'h0; // @[IMem.scala 37:69]
  wire [15:0] io_inst_lo = {mem_io_inst_MPORT_1_data,mem_io_inst_MPORT_data}; // @[Cat.scala 33:92]
  wire [15:0] io_inst_hi = {mem_io_inst_MPORT_3_data,mem_io_inst_MPORT_2_data}; // @[Cat.scala 33:92]
  assign mem_io_inst_MPORT_en = 1'h1;
  assign mem_io_inst_MPORT_addr = _io_inst_T_3[9:0];
  assign mem_io_inst_MPORT_data = mem[mem_io_inst_MPORT_addr]; // @[IMem.scala 35:18]
  assign mem_io_inst_MPORT_1_en = 1'h1;
  assign mem_io_inst_MPORT_1_addr = _io_inst_T_8[9:0];
  assign mem_io_inst_MPORT_1_data = mem[mem_io_inst_MPORT_1_addr]; // @[IMem.scala 35:18]
  assign mem_io_inst_MPORT_2_en = 1'h1;
  assign mem_io_inst_MPORT_2_addr = _io_inst_T_13[9:0];
  assign mem_io_inst_MPORT_2_data = mem[mem_io_inst_MPORT_2_addr]; // @[IMem.scala 35:18]
  assign mem_io_inst_MPORT_3_en = 1'h1;
  assign mem_io_inst_MPORT_3_addr = _io_inst_T_18[9:0];
  assign mem_io_inst_MPORT_3_data = mem[mem_io_inst_MPORT_3_addr]; // @[IMem.scala 35:18]
  assign io_inst = {io_inst_hi,io_inst_lo}; // @[Cat.scala 33:92]
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
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
