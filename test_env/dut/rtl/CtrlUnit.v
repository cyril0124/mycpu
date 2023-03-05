module CtrlUnit(
  output        io_out_isBranch,
  output        io_out_isJump,
  output [1:0]  io_out_resultSrc,
  output        io_out_memWrEn,
  output [2:0]  io_out_memType,
  output [3:0]  io_out_aluOpSel,
  output        io_out_aluSrc,
  output [1:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn,
  output        io_out_memSign,
  output        io_out_pcAddReg,
  input  [31:0] io_in_inst
);
  wire [31:0] decoder_io_inst; // @[CtrlUnit.scala 70:25]
  wire  decoder_io_out_isBranch; // @[CtrlUnit.scala 70:25]
  wire [1:0] decoder_io_out_resultSrc; // @[CtrlUnit.scala 70:25]
  wire  decoder_io_out_memWrEn; // @[CtrlUnit.scala 70:25]
  wire [2:0] decoder_io_out_memType; // @[CtrlUnit.scala 70:25]
  wire [3:0] decoder_io_out_aluOpSel; // @[CtrlUnit.scala 70:25]
  wire  decoder_io_out_aluSrc; // @[CtrlUnit.scala 70:25]
  wire [1:0] decoder_io_out_immSrc; // @[CtrlUnit.scala 70:25]
  wire  decoder_io_out_immSign; // @[CtrlUnit.scala 70:25]
  wire  decoder_io_out_regWrEn; // @[CtrlUnit.scala 70:25]
  wire [2:0] funct3 = io_in_inst[14:12]; // @[util.scala 44:34]
  wire [6:0] opcode = io_in_inst[6:0]; // @[util.scala 43:34]
  wire  _io_out_pcAddReg_T_1 = 7'h67 == opcode; // @[CtrlUnit.scala 89:28]
  Decoder decoder ( // @[CtrlUnit.scala 70:25]
    .io_inst(decoder_io_inst),
    .io_out_isBranch(decoder_io_out_isBranch),
    .io_out_resultSrc(decoder_io_out_resultSrc),
    .io_out_memWrEn(decoder_io_out_memWrEn),
    .io_out_memType(decoder_io_out_memType),
    .io_out_aluOpSel(decoder_io_out_aluOpSel),
    .io_out_aluSrc(decoder_io_out_aluSrc),
    .io_out_immSrc(decoder_io_out_immSrc),
    .io_out_immSign(decoder_io_out_immSign),
    .io_out_regWrEn(decoder_io_out_regWrEn)
  );
  assign io_out_isBranch = decoder_io_out_isBranch; // @[CtrlUnit.scala 75:18]
  assign io_out_isJump = _io_out_pcAddReg_T_1 | 7'h6f == opcode; // @[CtrlUnit.scala 90:40]
  assign io_out_resultSrc = decoder_io_out_resultSrc; // @[CtrlUnit.scala 76:19]
  assign io_out_memWrEn = decoder_io_out_memWrEn; // @[CtrlUnit.scala 77:17]
  assign io_out_memType = decoder_io_out_memType; // @[CtrlUnit.scala 79:17]
  assign io_out_aluOpSel = decoder_io_out_aluOpSel; // @[CtrlUnit.scala 80:18]
  assign io_out_aluSrc = decoder_io_out_aluSrc; // @[CtrlUnit.scala 81:16]
  assign io_out_immSrc = decoder_io_out_immSrc; // @[CtrlUnit.scala 82:16]
  assign io_out_immSign = decoder_io_out_immSign; // @[CtrlUnit.scala 83:17]
  assign io_out_regWrEn = decoder_io_out_regWrEn; // @[CtrlUnit.scala 84:17]
  assign io_out_memSign = ~funct3[2]; // @[CtrlUnit.scala 85:20]
  assign io_out_pcAddReg = 7'h67 == opcode; // @[CtrlUnit.scala 89:28]
  assign decoder_io_inst = io_in_inst; // @[CtrlUnit.scala 72:27]
endmodule
