module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_req_addr,
  input         io_enq_bits_dirInfo_hit,
  input  [7:0]  io_enq_bits_dirInfo_chosenWay,
  input  [31:0] io_enq_bits_rdData_0,
  input  [31:0] io_enq_bits_rdData_1,
  input  [31:0] io_enq_bits_rdData_2,
  input  [31:0] io_enq_bits_rdData_3,
  input  [31:0] io_enq_bits_rdData_4,
  input  [31:0] io_enq_bits_rdData_5,
  input  [31:0] io_enq_bits_rdData_6,
  input  [31:0] io_enq_bits_rdData_7,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_req_addr,
  output        io_deq_bits_dirInfo_hit,
  output [7:0]  io_deq_bits_dirInfo_chosenWay,
  output [31:0] io_deq_bits_rdData_0,
  output [31:0] io_deq_bits_rdData_1,
  output [31:0] io_deq_bits_rdData_2,
  output [31:0] io_deq_bits_rdData_3,
  output [31:0] io_deq_bits_rdData_4,
  output [31:0] io_deq_bits_rdData_5,
  output [31:0] io_deq_bits_rdData_6,
  output [31:0] io_deq_bits_rdData_7
);
`ifdef RANDOMIZE_MEM_INIT
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
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_req_addr [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_req_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_req_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_req_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_req_addr_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_req_addr_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_req_addr_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_req_addr_MPORT_en; // @[Decoupled.scala 273:95]
  reg  ram_dirInfo_hit [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_hit_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_dirInfo_hit_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_hit_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_hit_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_dirInfo_hit_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_hit_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_hit_MPORT_en; // @[Decoupled.scala 273:95]
  reg [7:0] ram_dirInfo_chosenWay [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_chosenWay_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_dirInfo_chosenWay_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [7:0] ram_dirInfo_chosenWay_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [7:0] ram_dirInfo_chosenWay_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_dirInfo_chosenWay_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_chosenWay_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_dirInfo_chosenWay_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_0 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_0_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_0_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_0_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_0_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_1 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_1_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_1_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_1_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_1_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_2 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_2_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_2_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_2_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_2_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_3 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_3_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_3_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_3_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_3_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_4 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_4_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_4_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_4_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_4_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_5 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_5_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_5_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_5_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_5_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_5_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_5_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_5_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_6 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_6_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_6_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_6_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_6_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_6_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_6_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_6_MPORT_en; // @[Decoupled.scala 273:95]
  reg [31:0] ram_rdData_7 [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_rdData_7_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_7_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_7_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [31:0] ram_rdData_7_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_rdData_7_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_rdData_7_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_rdData_7_MPORT_en; // @[Decoupled.scala 273:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  _do_enq_T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _do_deq_T = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire  _GEN_32 = io_deq_ready ? 1'h0 : _do_enq_T; // @[Decoupled.scala 318:26 280:27 318:35]
  wire  do_enq = empty ? _GEN_32 : _do_enq_T; // @[Decoupled.scala 315:17 280:27]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire  do_deq = empty ? 1'h0 : _do_deq_T; // @[Decoupled.scala 315:17 317:14 281:27]
  assign ram_req_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_req_addr_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_req_addr_io_deq_bits_MPORT_data = ram_req_addr[ram_req_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_req_addr_MPORT_data = io_enq_bits_req_addr;
  assign ram_req_addr_MPORT_addr = enq_ptr_value;
  assign ram_req_addr_MPORT_mask = 1'h1;
  assign ram_req_addr_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_dirInfo_hit_io_deq_bits_MPORT_en = 1'h1;
  assign ram_dirInfo_hit_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_dirInfo_hit_io_deq_bits_MPORT_data = ram_dirInfo_hit[ram_dirInfo_hit_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_dirInfo_hit_MPORT_data = io_enq_bits_dirInfo_hit;
  assign ram_dirInfo_hit_MPORT_addr = enq_ptr_value;
  assign ram_dirInfo_hit_MPORT_mask = 1'h1;
  assign ram_dirInfo_hit_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_dirInfo_chosenWay_io_deq_bits_MPORT_en = 1'h1;
  assign ram_dirInfo_chosenWay_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_dirInfo_chosenWay_io_deq_bits_MPORT_data =
    ram_dirInfo_chosenWay[ram_dirInfo_chosenWay_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_dirInfo_chosenWay_MPORT_data = io_enq_bits_dirInfo_chosenWay;
  assign ram_dirInfo_chosenWay_MPORT_addr = enq_ptr_value;
  assign ram_dirInfo_chosenWay_MPORT_mask = 1'h1;
  assign ram_dirInfo_chosenWay_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_0_io_deq_bits_MPORT_data = ram_rdData_0[ram_rdData_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_0_MPORT_data = io_enq_bits_rdData_0;
  assign ram_rdData_0_MPORT_addr = enq_ptr_value;
  assign ram_rdData_0_MPORT_mask = 1'h1;
  assign ram_rdData_0_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_1_io_deq_bits_MPORT_data = ram_rdData_1[ram_rdData_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_1_MPORT_data = io_enq_bits_rdData_1;
  assign ram_rdData_1_MPORT_addr = enq_ptr_value;
  assign ram_rdData_1_MPORT_mask = 1'h1;
  assign ram_rdData_1_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_2_io_deq_bits_MPORT_data = ram_rdData_2[ram_rdData_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_2_MPORT_data = io_enq_bits_rdData_2;
  assign ram_rdData_2_MPORT_addr = enq_ptr_value;
  assign ram_rdData_2_MPORT_mask = 1'h1;
  assign ram_rdData_2_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_3_io_deq_bits_MPORT_data = ram_rdData_3[ram_rdData_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_3_MPORT_data = io_enq_bits_rdData_3;
  assign ram_rdData_3_MPORT_addr = enq_ptr_value;
  assign ram_rdData_3_MPORT_mask = 1'h1;
  assign ram_rdData_3_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_4_io_deq_bits_MPORT_data = ram_rdData_4[ram_rdData_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_4_MPORT_data = io_enq_bits_rdData_4;
  assign ram_rdData_4_MPORT_addr = enq_ptr_value;
  assign ram_rdData_4_MPORT_mask = 1'h1;
  assign ram_rdData_4_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_5_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_5_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_5_io_deq_bits_MPORT_data = ram_rdData_5[ram_rdData_5_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_5_MPORT_data = io_enq_bits_rdData_5;
  assign ram_rdData_5_MPORT_addr = enq_ptr_value;
  assign ram_rdData_5_MPORT_mask = 1'h1;
  assign ram_rdData_5_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_6_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_6_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_6_io_deq_bits_MPORT_data = ram_rdData_6[ram_rdData_6_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_6_MPORT_data = io_enq_bits_rdData_6;
  assign ram_rdData_6_MPORT_addr = enq_ptr_value;
  assign ram_rdData_6_MPORT_mask = 1'h1;
  assign ram_rdData_6_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign ram_rdData_7_io_deq_bits_MPORT_en = 1'h1;
  assign ram_rdData_7_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_rdData_7_io_deq_bits_MPORT_data = ram_rdData_7[ram_rdData_7_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_rdData_7_MPORT_data = io_enq_bits_rdData_7;
  assign ram_rdData_7_MPORT_addr = enq_ptr_value;
  assign ram_rdData_7_MPORT_mask = 1'h1;
  assign ram_rdData_7_MPORT_en = empty ? _GEN_32 : _do_enq_T;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = io_enq_valid | ~empty; // @[Decoupled.scala 302:16 314:{24,39}]
  assign io_deq_bits_req_addr = empty ? io_enq_bits_req_addr : ram_req_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_dirInfo_hit = empty ? io_enq_bits_dirInfo_hit : ram_dirInfo_hit_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_dirInfo_chosenWay = empty ? io_enq_bits_dirInfo_chosenWay :
    ram_dirInfo_chosenWay_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_0 = empty ? io_enq_bits_rdData_0 : ram_rdData_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_1 = empty ? io_enq_bits_rdData_1 : ram_rdData_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_2 = empty ? io_enq_bits_rdData_2 : ram_rdData_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_3 = empty ? io_enq_bits_rdData_3 : ram_rdData_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_4 = empty ? io_enq_bits_rdData_4 : ram_rdData_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_5 = empty ? io_enq_bits_rdData_5 : ram_rdData_5_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_6 = empty ? io_enq_bits_rdData_6 : ram_rdData_6_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  assign io_deq_bits_rdData_7 = empty ? io_enq_bits_rdData_7 : ram_rdData_7_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17 315:17 316:19]
  always @(posedge clock) begin
    if (ram_req_addr_MPORT_en & ram_req_addr_MPORT_mask) begin
      ram_req_addr[ram_req_addr_MPORT_addr] <= ram_req_addr_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_dirInfo_hit_MPORT_en & ram_dirInfo_hit_MPORT_mask) begin
      ram_dirInfo_hit[ram_dirInfo_hit_MPORT_addr] <= ram_dirInfo_hit_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_dirInfo_chosenWay_MPORT_en & ram_dirInfo_chosenWay_MPORT_mask) begin
      ram_dirInfo_chosenWay[ram_dirInfo_chosenWay_MPORT_addr] <= ram_dirInfo_chosenWay_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_0_MPORT_en & ram_rdData_0_MPORT_mask) begin
      ram_rdData_0[ram_rdData_0_MPORT_addr] <= ram_rdData_0_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_1_MPORT_en & ram_rdData_1_MPORT_mask) begin
      ram_rdData_1[ram_rdData_1_MPORT_addr] <= ram_rdData_1_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_2_MPORT_en & ram_rdData_2_MPORT_mask) begin
      ram_rdData_2[ram_rdData_2_MPORT_addr] <= ram_rdData_2_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_3_MPORT_en & ram_rdData_3_MPORT_mask) begin
      ram_rdData_3[ram_rdData_3_MPORT_addr] <= ram_rdData_3_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_4_MPORT_en & ram_rdData_4_MPORT_mask) begin
      ram_rdData_4[ram_rdData_4_MPORT_addr] <= ram_rdData_4_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_5_MPORT_en & ram_rdData_5_MPORT_mask) begin
      ram_rdData_5[ram_rdData_5_MPORT_addr] <= ram_rdData_5_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_6_MPORT_en & ram_rdData_6_MPORT_mask) begin
      ram_rdData_6[ram_rdData_6_MPORT_addr] <= ram_rdData_6_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (ram_rdData_7_MPORT_en & ram_rdData_7_MPORT_mask) begin
      ram_rdData_7[ram_rdData_7_MPORT_addr] <= ram_rdData_7_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
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
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_req_addr[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_dirInfo_hit[initvar] = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_dirInfo_chosenWay[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_0[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_1[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_2[initvar] = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_3[initvar] = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_4[initvar] = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_5[initvar] = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_6[initvar] = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_rdData_7[initvar] = _RAND_10[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  enq_ptr_value = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  deq_ptr_value = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  maybe_full = _RAND_13[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
