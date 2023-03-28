module TLAddrDecode(
  input  [31:0] io_addr,
  output        io_choseOH_0,
  output        io_choseOH_1
);
  wire  valid = io_addr < 32'h10000000; // @[Bus.scala 159:42]
  wire  valid_1 = io_addr >= 32'h10000000 & io_addr < 32'h20000000; // @[Bus.scala 159:31]
  wire  _GEN_2 = valid_1 ? 1'h0 : 1'h1; // @[Bus.scala 169:68 170:20 172:20]
  assign io_choseOH_0 = valid | _GEN_2; // @[Bus.scala 167:62 168:20]
  assign io_choseOH_1 = valid ? 1'h0 : valid_1; // @[Bus.scala 167:62 168:20]
endmodule
