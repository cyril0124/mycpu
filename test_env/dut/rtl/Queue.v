module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_inst,
  input         io_enq_bits_valid,
  input         io_enq_bits_predictBrTaken,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_inst,
  output        io_deq_bits_valid,
  output        io_deq_bits_predictBrTaken,
  output [3:0]  io_count,
  input         io_flush
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_inst [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_inst_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_inst_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_inst_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_inst_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_inst_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_inst_MPORT_en; // @[Decoupled.scala 273:95]
  reg  ram_valid [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_valid_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_valid_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_valid_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_valid_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_valid_MPORT_en; // @[Decoupled.scala 273:95]
  reg  ram_predictBrTaken [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_predictBrTaken_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_predictBrTaken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_predictBrTaken_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_predictBrTaken_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_predictBrTaken_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_predictBrTaken_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_predictBrTaken_MPORT_en; // @[Decoupled.scala 273:95]
  reg [2:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire [2:0] ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 326:32]
  wire [3:0] _io_count_T_1 = maybe_full & ptr_match ? 4'h8 : 4'h0; // @[Decoupled.scala 329:20]
  wire [3:0] _GEN_13 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 329:62]
  assign ram_inst_io_deq_bits_MPORT_en = 1'h1;
  assign ram_inst_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_inst_io_deq_bits_MPORT_data = ram_inst[ram_inst_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_inst_MPORT_data = io_enq_bits_inst;
  assign ram_inst_MPORT_addr = enq_ptr_value;
  assign ram_inst_MPORT_mask = 1'h1;
  assign ram_inst_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_valid_io_deq_bits_MPORT_en = 1'h1;
  assign ram_valid_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_valid_io_deq_bits_MPORT_data = ram_valid[ram_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_valid_MPORT_data = io_enq_bits_valid;
  assign ram_valid_MPORT_addr = enq_ptr_value;
  assign ram_valid_MPORT_mask = 1'h1;
  assign ram_valid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_predictBrTaken_io_deq_bits_MPORT_en = 1'h1;
  assign ram_predictBrTaken_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_predictBrTaken_io_deq_bits_MPORT_data = ram_predictBrTaken[ram_predictBrTaken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_predictBrTaken_MPORT_data = io_enq_bits_predictBrTaken;
  assign ram_predictBrTaken_MPORT_addr = enq_ptr_value;
  assign ram_predictBrTaken_MPORT_mask = 1'h1;
  assign ram_predictBrTaken_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits_inst = ram_inst_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_valid = ram_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_deq_bits_predictBrTaken = ram_predictBrTaken_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  assign io_count = _io_count_T_1 | _GEN_13; // @[Decoupled.scala 329:62]
  always @(posedge clock) begin
    if (ram_inst_MPORT_en & ram_inst_MPORT_mask) begin
      ram_inst[ram_inst_MPORT_addr] <= ram_inst_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_valid_MPORT_en & ram_valid_MPORT_mask) begin
      ram_valid[ram_valid_MPORT_addr] <= ram_valid_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_predictBrTaken_MPORT_en & ram_predictBrTaken_MPORT_mask) begin
      ram_predictBrTaken[ram_predictBrTaken_MPORT_addr] <= ram_predictBrTaken_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (io_flush) begin // @[Decoupled.scala 296:15]
      enq_ptr_value <= 3'h0; // @[Counter.scala 98:11]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (io_flush) begin // @[Decoupled.scala 296:15]
      deq_ptr_value <= 3'h0; // @[Counter.scala 98:11]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (io_flush) begin // @[Decoupled.scala 296:15]
      maybe_full <= 1'h0; // @[Decoupled.scala 299:16]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
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
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_inst[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_valid[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_predictBrTaken[initvar] = _RAND_2[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enq_ptr_value = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  deq_ptr_value = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
