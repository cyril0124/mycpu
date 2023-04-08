module CtrlUnit(
  output        io_out_isBranch,
  output        io_out_isJump,
  output [1:0]  io_out_resultSrc,
  output [3:0]  io_out_aluOpSel,
  output [4:0]  io_out_lsuOp,
  output [3:0]  io_out_aluSrc1,
  output [3:0]  io_out_aluSrc2,
  output [2:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn,
  output        io_out_pcAddReg,
  output [2:0]  io_out_csrOp,
  output [3:0]  io_out_excType,
  input  [31:0] io_in_inst
);
  wire [31:0] decoder_io_inst; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_isBranch; // @[CtrlUnit.scala 59:25]
  wire [1:0] decoder_io_out_resultSrc; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluOpSel; // @[CtrlUnit.scala 59:25]
  wire [4:0] decoder_io_out_lsuOp; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluSrc1; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_aluSrc2; // @[CtrlUnit.scala 59:25]
  wire [2:0] decoder_io_out_immSrc; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_immSign; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_regWrEn; // @[CtrlUnit.scala 59:25]
  wire [2:0] decoder_io_out_csrOp; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_excType; // @[CtrlUnit.scala 59:25]
  wire [6:0] opcode = io_in_inst[6:0]; // @[util.scala 74:34]
  wire  _io_out_pcAddReg_T_1 = 7'h67 == opcode; // @[CtrlUnit.scala 81:31]
  Decoder decoder ( // @[CtrlUnit.scala 59:25]
    .io_inst(decoder_io_inst),
    .io_out_isBranch(decoder_io_out_isBranch),
    .io_out_resultSrc(decoder_io_out_resultSrc),
    .io_out_aluOpSel(decoder_io_out_aluOpSel),
    .io_out_lsuOp(decoder_io_out_lsuOp),
    .io_out_aluSrc1(decoder_io_out_aluSrc1),
    .io_out_aluSrc2(decoder_io_out_aluSrc2),
    .io_out_immSrc(decoder_io_out_immSrc),
    .io_out_immSign(decoder_io_out_immSign),
    .io_out_regWrEn(decoder_io_out_regWrEn),
    .io_out_csrOp(decoder_io_out_csrOp),
    .io_out_excType(decoder_io_out_excType)
  );
  assign io_out_isBranch = decoder_io_out_isBranch; // @[CtrlUnit.scala 63:21]
  assign io_out_isJump = _io_out_pcAddReg_T_1 | 7'h6f == opcode; // @[CtrlUnit.scala 82:45]
  assign io_out_resultSrc = decoder_io_out_resultSrc; // @[CtrlUnit.scala 64:21]
  assign io_out_aluOpSel = decoder_io_out_aluOpSel; // @[CtrlUnit.scala 67:21]
  assign io_out_lsuOp = decoder_io_out_lsuOp; // @[CtrlUnit.scala 68:21]
  assign io_out_aluSrc1 = decoder_io_out_aluSrc1; // @[CtrlUnit.scala 70:21]
  assign io_out_aluSrc2 = decoder_io_out_aluSrc2; // @[CtrlUnit.scala 71:21]
  assign io_out_immSrc = decoder_io_out_immSrc; // @[CtrlUnit.scala 72:21]
  assign io_out_immSign = decoder_io_out_immSign; // @[CtrlUnit.scala 73:21]
  assign io_out_regWrEn = decoder_io_out_regWrEn; // @[CtrlUnit.scala 74:21]
  assign io_out_pcAddReg = 7'h67 == opcode; // @[CtrlUnit.scala 81:31]
  assign io_out_csrOp = decoder_io_out_csrOp; // @[CtrlUnit.scala 76:21]
  assign io_out_excType = decoder_io_out_excType; // @[CtrlUnit.scala 77:21]
  assign decoder_io_inst = io_in_inst; // @[CtrlUnit.scala 61:27]
endmodule
