module TLAddrDecode(
  input  [31:0] io_addr,
  output        io_choseOH_0,
  output        io_choseOH_1
);
  wire  valid = io_addr < 32'h2000; // @[Bus.scala 158:42]
  wire  valid_1 = io_addr >= 32'h2000 & io_addr < 32'h4000; // @[Bus.scala 158:31]
  wire  _GEN_2 = valid_1 ? 1'h0 : 1'h1; // @[Bus.scala 168:68 169:20 171:20]
  assign io_choseOH_0 = valid | _GEN_2; // @[Bus.scala 166:62 167:20]
  assign io_choseOH_1 = valid ? 1'h0 : valid_1; // @[Bus.scala 166:62 167:20]
endmodule
