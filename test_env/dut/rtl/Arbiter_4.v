module Arbiter_4(
  output  io_in_0_ready,
  input   io_in_0_valid,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input   io_out_ready,
  output  io_out_valid
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
endmodule
