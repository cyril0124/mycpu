module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [31:0] io_enq_bits_size,
  input         io_enq_bits_source,
  input  [31:0] io_enq_bits_address,
  input  [31:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [31:0] io_deq_bits_size,
  output        io_deq_bits_source,
  output [31:0] io_deq_bits_address,
  output [31:0] io_deq_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_opcode_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_opcode_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_opcode_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_opcode_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_size [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_size_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_size_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_size_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_size_MPORT_en; // @[Decoupled.scala 273:95]
  reg  ram_source [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_source_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_source_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_source_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_source_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_address [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_address_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_address_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_address_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_address_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_address_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_address_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_address_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_data [0:7]; // @[Decoupled.scala 273:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [2:0] ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_data_MPORT_data; // @[Decoupled.scala 273:95]
  wire [2:0] ram_data_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 273:95]
  reg [2:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire  _GEN_19 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 318:26 280:27 318:35]
  wire  do_enq = empty ? _GEN_19 : _do_enq_T; // @[Decoupled.scala 315:17 280:27]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 315:17 317:14 281:27]
  assign ram_opcode_io_deq_bits_MPORT_en = 1'h1;
  assign ram_opcode_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = enq_ptr_value;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_size_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = enq_ptr_value;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_source_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = enq_ptr_value;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_address_io_deq_bits_MPORT_en = 1'h1;
  assign ram_address_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_address_io_deq_bits_MPORT_data = ram_address[ram_address_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_address_MPORT_data = io_enq_bits_address;
  assign ram_address_MPORT_addr = enq_ptr_value;
  assign ram_address_MPORT_mask = 1'h1;
  assign ram_address_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = enq_ptr_value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = empty ? _GEN_19 : _do_enq_T;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 302:16 314:{24,39}]
  assign io_deq_bits_opcode = empty ? io_enq_bits_opcode : ram_opcode_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_size = empty ? io_enq_bits_size : ram_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_source = empty ? io_enq_bits_source : ram_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_address = empty ? io_enq_bits_address : ram_address_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_data = empty ? io_enq_bits_data : ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  always @(posedge clock) begin
    if (ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_address_MPORT_en & ram_address_MPORT_mask) begin
      ram_address[ram_address_MPORT_addr] <= ram_address_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      if (empty) begin // @[Decoupled.scala 315:17]
        if (io_deq_ready) begin // @[Decoupled.scala 318:26]
          maybe_full <= 1'h0; // @[Decoupled.scala 318:35]
        end else begin
          maybe_full <= _do_enq_T; // @[Decoupled.scala 280:27]
        end
      end else begin
        maybe_full <= _do_enq_T; // @[Decoupled.scala 280:27]
      end
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
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_size[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_source[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_address[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_data[initvar] = _RAND_4[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  enq_ptr_value = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  deq_ptr_value = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  maybe_full = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
