module Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_addr,
  input         io_in_0_bits_dirInfo_hit,
  input  [7:0]  io_in_0_bits_dirInfo_chosenWay,
  input         io_in_0_bits_dirInfo_isDirtyWay,
  input  [19:0] io_in_0_bits_dirInfo_dirtyTag,
  input  [31:0] io_in_0_bits_data_0,
  input  [31:0] io_in_0_bits_data_1,
  input  [31:0] io_in_0_bits_data_2,
  input  [31:0] io_in_0_bits_data_3,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_addr,
  input         io_in_1_bits_dirInfo_hit,
  input  [7:0]  io_in_1_bits_dirInfo_chosenWay,
  input         io_in_1_bits_dirInfo_isDirtyWay,
  input  [19:0] io_in_1_bits_dirInfo_dirtyTag,
  input  [31:0] io_in_1_bits_data_0,
  input  [31:0] io_in_1_bits_data_1,
  input  [31:0] io_in_1_bits_data_2,
  input  [31:0] io_in_1_bits_data_3,
  input  [31:0] io_in_1_bits_storeData,
  input  [3:0]  io_in_1_bits_storeMask,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_addr,
  output        io_out_bits_dirInfo_hit,
  output [7:0]  io_out_bits_dirInfo_chosenWay,
  output        io_out_bits_dirInfo_isDirtyWay,
  output [19:0] io_out_bits_dirInfo_dirtyTag,
  output [31:0] io_out_bits_data_0,
  output [31:0] io_out_bits_data_1,
  output [31:0] io_out_bits_data_2,
  output [31:0] io_out_bits_data_3,
  output        io_out_bits_isStore,
  output [31:0] io_out_bits_storeData,
  output [3:0]  io_out_bits_storeMask
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 146:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 146:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 147:31]
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_dirInfo_hit = io_in_0_valid ? io_in_0_bits_dirInfo_hit : io_in_1_bits_dirInfo_hit; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_dirInfo_chosenWay = io_in_0_valid ? io_in_0_bits_dirInfo_chosenWay : io_in_1_bits_dirInfo_chosenWay
    ; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_dirInfo_isDirtyWay = io_in_0_valid ? io_in_0_bits_dirInfo_isDirtyWay :
    io_in_1_bits_dirInfo_isDirtyWay; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_dirInfo_dirtyTag = io_in_0_valid ? io_in_0_bits_dirInfo_dirtyTag : io_in_1_bits_dirInfo_dirtyTag; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data_0 = io_in_0_valid ? io_in_0_bits_data_0 : io_in_1_bits_data_0; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data_1 = io_in_0_valid ? io_in_0_bits_data_1 : io_in_1_bits_data_1; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data_2 = io_in_0_valid ? io_in_0_bits_data_2 : io_in_1_bits_data_2; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_data_3 = io_in_0_valid ? io_in_0_bits_data_3 : io_in_1_bits_data_3; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_isStore = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_storeData = io_in_0_valid ? 32'h0 : io_in_1_bits_storeData; // @[Arbiter.scala 136:15 138:26 140:19]
  assign io_out_bits_storeMask = io_in_0_valid ? 4'h0 : io_in_1_bits_storeMask; // @[Arbiter.scala 136:15 138:26 140:19]
endmodule
