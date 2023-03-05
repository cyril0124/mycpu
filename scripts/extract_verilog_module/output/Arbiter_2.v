module Arbiter_2(
  input   io_in_0_valid,
  output  io_out_valid
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1; // @[Arbiter.scala 147:19]
endmodule
