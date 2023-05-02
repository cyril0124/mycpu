module SRAMArray_1P(
  input         clock,
  input  [5:0]  io_addr,
  input  [65:0] io_wdata_0,
  output [65:0] io_rdata_0
);
  wire  brams_0_clock; // @[SRAM_1.scala 135:38]
  wire [5:0] brams_0_io_addr; // @[SRAM_1.scala 135:38]
  wire [65:0] brams_0_io_wdata; // @[SRAM_1.scala 135:38]
  wire [65:0] brams_0_io_rdata; // @[SRAM_1.scala 135:38]
  BankRAM_1P brams_0 ( // @[SRAM_1.scala 135:38]
    .clock(brams_0_clock),
    .io_addr(brams_0_io_addr),
    .io_wdata(brams_0_io_wdata),
    .io_rdata(brams_0_io_rdata)
  );
  assign io_rdata_0 = brams_0_io_rdata; // @[SRAM_1.scala 142:21]
  assign brams_0_clock = clock;
  assign brams_0_io_addr = io_addr; // @[SRAM_1.scala 139:26]
  assign brams_0_io_wdata = io_wdata_0; // @[SRAM_1.scala 141:27]
endmodule
