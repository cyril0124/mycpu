module IMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_inst
);
  wire  mem_clock; // @[IMem.scala 21:21]
  wire [31:0] mem_io_addr; // @[IMem.scala 21:21]
  wire [31:0] mem_io_inst; // @[IMem.scala 21:21]
  ReadIMem mem ( // @[IMem.scala 21:21]
    .clock(mem_clock),
    .io_addr(mem_io_addr),
    .io_inst(mem_io_inst)
  );
  assign io_inst = mem_io_inst; // @[IMem.scala 23:12]
  assign mem_clock = clock;
  assign mem_io_addr = io_addr; // @[IMem.scala 23:12]
endmodule
