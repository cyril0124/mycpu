module BusCrossBar(
  output  io_masterFace_out_0_valid
);
  wire  masterArbs_0_io_in_0_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_0_io_out_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_in_0_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_out_valid; // @[TLBus.scala 191:50]
  Arbiter_2 masterArbs_0 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_0_io_in_0_valid),
    .io_out_valid(masterArbs_0_io_out_valid)
  );
  Arbiter_2 masterArbs_1 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_1_io_in_0_valid),
    .io_out_valid(masterArbs_1_io_out_valid)
  );
  assign io_masterFace_out_0_valid = masterArbs_0_io_out_valid; // @[TLBus.scala 199:30]
  assign masterArbs_0_io_in_0_valid = 1'h1; // @[TLBus.scala 194:57]
  assign masterArbs_1_io_in_0_valid = 1'h0; // @[TLBus.scala 194:57]
endmodule
