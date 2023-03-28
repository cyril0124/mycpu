module SingleRAM(
);
  wire  ren = 1'h0; // @[SingleROM.scala 42:41]
  wire  wen = 1'h0; // @[SingleROM.scala 43:27]
  wire [29:0] rdAddr = 30'h0; // @[SingleROM.scala 48:42]
  wire [29:0] wrAddr = 30'h0; // @[SingleROM.scala 52:30]
endmodule
