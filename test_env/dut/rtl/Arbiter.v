module Arbiter(
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_data,
  input  [1:0]  io_in_0_bits_stageID,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_data,
  input  [1:0]  io_in_1_bits_stageID,
  output        io_out_valid,
  output [31:0] io_out_bits_data,
  output [1:0]  io_out_bits_stageID
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_stageID = io_in_0_valid ? io_in_0_bits_stageID : io_in_1_bits_stageID; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
