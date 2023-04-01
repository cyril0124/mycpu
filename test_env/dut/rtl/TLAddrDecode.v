module TLAddrDecode(
  input  [31:0] io_addr,
  output        io_choseOH_0,
  output        io_choseOH_1
);
  wire  valid = io_addr < 32'h10000000; // @[Bus.scala 201:42]
  wire  valid_1 = io_addr >= 32'h10000000 & io_addr < 32'h20000000; // @[Bus.scala 201:31]
  wire  _GEN_2 = valid_1 ? 1'h0 : 1'h1; // @[Bus.scala 211:68 212:20 214:20]
  assign io_choseOH_0 = valid | _GEN_2; // @[Bus.scala 209:62 210:20]
  assign io_choseOH_1 = valid ? 1'h0 : valid_1; // @[Bus.scala 209:62 210:20]
endmodule
