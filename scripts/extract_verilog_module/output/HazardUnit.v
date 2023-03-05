module HazardUnit(
  input  [4:0]  io_in_execute_rs1,
  input  [4:0]  io_in_execute_rs2,
  input  [4:0]  io_in_memory_rd,
  input  [31:0] io_in_memory_rdVal,
  input         io_in_memory_regWrEn,
  input  [4:0]  io_in_writeback_rd,
  input  [31:0] io_in_writeback_rdVal,
  input         io_in_writeback_regWrEn,
  output [1:0]  io_out_execute_aluSrc1,
  output [1:0]  io_out_execute_aluSrc2,
  output [31:0] io_out_execute_rdValM,
  output [31:0] io_out_execute_rdValW
);
  wire  _fwMem2ExeRs1_T_2 = io_in_memory_rd != 5'h0; // @[HazardUnit.scala 39:58]
  wire  fwMem2ExeRs1 = io_in_execute_rs1 == io_in_memory_rd & io_in_memory_regWrEn & io_in_memory_rd != 5'h0; // @[HazardUnit.scala 39:51]
  wire  fwMem2ExeRs2 = io_in_execute_rs2 == io_in_memory_rd & io_in_memory_regWrEn & _fwMem2ExeRs1_T_2; // @[HazardUnit.scala 41:51]
  wire  _fwWb2ExeRs1_T_2 = io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 44:57]
  wire  fwWb2ExeRs1 = io_in_execute_rs1 == io_in_writeback_rd & io_in_writeback_regWrEn & io_in_writeback_rd != 5'h0; // @[HazardUnit.scala 44:50]
  wire  fwWb2ExeRs2 = io_in_execute_rs2 == io_in_writeback_rd & io_in_writeback_regWrEn & _fwWb2ExeRs1_T_2; // @[HazardUnit.scala 46:50]
  wire [1:0] _GEN_0 = fwWb2ExeRs1 ? 2'h2 : 2'h0; // @[HazardUnit.scala 52:25 49:28 53:32]
  wire [1:0] _GEN_1 = fwWb2ExeRs2 ? 2'h2 : 2'h0; // @[HazardUnit.scala 55:25 50:28 56:32]
  assign io_out_execute_aluSrc1 = fwMem2ExeRs1 ? 2'h1 : _GEN_0; // @[HazardUnit.scala 60:26 61:32]
  assign io_out_execute_aluSrc2 = fwMem2ExeRs2 ? 2'h1 : _GEN_1; // @[HazardUnit.scala 63:26 64:32]
  assign io_out_execute_rdValM = io_in_memory_rdVal; // @[HazardUnit.scala 67:27]
  assign io_out_execute_rdValW = io_in_writeback_rdVal; // @[HazardUnit.scala 68:27]
endmodule
