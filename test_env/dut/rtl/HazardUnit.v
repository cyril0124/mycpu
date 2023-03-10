module HazardUnit(
  input  [4:0]  io_in_decode_rs1,
  input  [4:0]  io_in_decode_rs2,
  input  [4:0]  io_in_execute_rs1,
  input  [4:0]  io_in_execute_rs2,
  input  [1:0]  io_in_execute_resultSrc,
  input  [4:0]  io_in_execute_rd,
  input  [4:0]  io_in_memory_rd,
  input  [31:0] io_in_memory_rdVal,
  input         io_in_memory_regWrEn,
  input  [4:0]  io_in_writeback_rd,
  input  [31:0] io_in_writeback_rdVal,
  input         io_in_writeback_regWrEn,
  output [1:0]  io_out_execute_aluSrc1,
  output [1:0]  io_out_execute_aluSrc2,
  output [31:0] io_out_execute_rdValM,
  output [31:0] io_out_execute_rdValW,
  output        io_out_decode_stall
);
  wire  _fwMem2ExeRs1_T_2 = io_in_memory_rd != 5'h0; // @[HazardUnit.scala 41:58]
  wire  fwMem2ExeRs1 = io_in_execute_rs1 == io_in_memory_rd & io_in_memory_regWrEn & io_in_memory_rd != 5'h0; // @[HazardUnit.scala 41:51]
  wire  fwMem2ExeRs2 = io_in_execute_rs2 == io_in_memory_rd & io_in_memory_regWrEn & _fwMem2ExeRs1_T_2; // @[HazardUnit.scala 43:51]
  wire  _fwWb2ExeRs1_T_2 = io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 46:57]
  wire  fwWb2ExeRs1 = io_in_execute_rs1 == io_in_writeback_rd & io_in_writeback_regWrEn & io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 46:50]
  wire  fwWb2ExeRs2 = io_in_execute_rs2 == io_in_writeback_rd & io_in_writeback_regWrEn & _fwWb2ExeRs1_T_2; // @[HazardUnit.scala 48:50]
  wire [1:0] _GEN_0 = fwWb2ExeRs1 ? 2'h2 : 2'h0; // @[HazardUnit.scala 54:25 51:28 55:32]
  wire [1:0] _GEN_1 = fwWb2ExeRs2 ? 2'h2 : 2'h0; // @[HazardUnit.scala 57:25 52:28 58:32]
  wire  _T_5 = io_in_execute_rd == io_in_decode_rs1 | io_in_execute_rd == io_in_decode_rs2; // @[HazardUnit.scala 79:27]
  assign io_out_execute_aluSrc1 = fwMem2ExeRs1 ? 2'h1 : _GEN_0; // @[HazardUnit.scala 62:26 63:32]
  assign io_out_execute_aluSrc2 = fwMem2ExeRs2 ? 2'h1 : _GEN_1; // @[HazardUnit.scala 65:26 66:32]
  assign io_out_execute_rdValM = io_in_memory_rdVal; // @[HazardUnit.scala 69:27]
  assign io_out_execute_rdValW = io_in_writeback_rdVal; // @[HazardUnit.scala 70:27]
  assign io_out_decode_stall = io_in_execute_resultSrc == 2'h1 & io_in_execute_rd != 5'h0 & _T_5; // @[HazardUnit.scala 77:25 78:51]
endmodule
