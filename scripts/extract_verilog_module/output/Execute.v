module Execute(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input         io_in_bits_isBranch,
  input         io_in_bits_isJump,
  input  [1:0]  io_in_bits_resultSrc,
  input  [4:0]  io_in_bits_lsuOp,
  input  [3:0]  io_in_bits_aluOpSel,
  input         io_in_bits_immSign,
  input         io_in_bits_regWrEn,
  input         io_in_bits_pcAddReg,
  input  [31:0] io_in_bits_pcNext4,
  input  [31:0] io_in_bits_aluIn1,
  input  [31:0] io_in_bits_aluIn2,
  input         io_in_bits_aluIn1IsReg,
  input         io_in_bits_aluIn2IsReg,
  input  [31:0] io_in_bits_imm,
  input  [31:0] io_in_bits_data2,
  input  [3:0]  io_in_bits_excType,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_memory_ready,
  output        io_out_memory_valid,
  output [1:0]  io_out_memory_bits_resultSrc,
  output [4:0]  io_out_memory_bits_lsuOp,
  output        io_out_memory_bits_regWrEn,
  output [31:0] io_out_memory_bits_aluOut,
  output [31:0] io_out_memory_bits_data2,
  output [31:0] io_out_memory_bits_pcNext4,
  output [2:0]  io_out_memory_bits_csrOp,
  output        io_out_memory_bits_csrWrEn,
  output        io_out_memory_bits_csrValid,
  output [31:0] io_out_memory_bits_csrWrData,
  output [31:0] io_out_memory_bits_csrAddr,
  output [3:0]  io_out_memory_bits_excType,
  output        io_out_memory_bits_instState_commit,
  output [31:0] io_out_memory_bits_instState_pc,
  output [31:0] io_out_memory_bits_instState_inst,
  input         io_out_fetch_ready,
  output        io_out_fetch_bits_brTaken,
  output [31:0] io_out_fetch_bits_targetAddr,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  output [1:0]  io_hazard_out_resultSrc,
  output [4:0]  io_hazard_out_rd,
  input  [1:0]  io_hazard_in_aluSrc1,
  input  [1:0]  io_hazard_in_aluSrc2,
  input  [31:0] io_hazard_in_rdValM,
  input  [31:0] io_hazard_in_rdValW,
  input         io_ctrl_flush,
  output [2:0]  io_csrRead_op,
  input         io_csrRead_valid,
  output [11:0] io_csrRead_addr
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_in1; // @[3_Execute.scala 98:21]
  wire [31:0] alu_io_in2; // @[3_Execute.scala 98:21]
  wire [3:0] alu_io_opSel; // @[3_Execute.scala 98:21]
  wire [31:0] alu_io_out; // @[3_Execute.scala 98:21]
  wire  alu_io_zero; // @[3_Execute.scala 98:21]
  wire  stall = ~io_out_fetch_ready | ~io_out_memory_ready; // @[3_Execute.scala 79:54]
  wire  _io_in_ready_T = ~stall; // @[3_Execute.scala 83:21]
  wire  executeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg  stageReg_isBranch; // @[3_Execute.scala 85:27]
  reg  stageReg_isJump; // @[3_Execute.scala 85:27]
  reg [1:0] stageReg_resultSrc; // @[3_Execute.scala 85:27]
  reg [4:0] stageReg_lsuOp; // @[3_Execute.scala 85:27]
  reg [3:0] stageReg_aluOpSel; // @[3_Execute.scala 85:27]
  reg  stageReg_immSign; // @[3_Execute.scala 85:27]
  reg  stageReg_regWrEn; // @[3_Execute.scala 85:27]
  reg  stageReg_pcAddReg; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_pcNext4; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_aluIn1; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_aluIn2; // @[3_Execute.scala 85:27]
  reg  stageReg_aluIn1IsReg; // @[3_Execute.scala 85:27]
  reg  stageReg_aluIn2IsReg; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_imm; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_data2; // @[3_Execute.scala 85:27]
  reg [3:0] stageReg_excType; // @[3_Execute.scala 85:27]
  reg [2:0] stageReg_csrOp; // @[3_Execute.scala 85:27]
  reg  stageReg_instState_commit; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_instState_pc; // @[3_Execute.scala 85:27]
  reg [31:0] stageReg_instState_inst; // @[3_Execute.scala 85:27]
  wire [31:0] _GEN_9 = _io_in_ready_T ? 32'h0 : stageReg_aluIn1; // @[3_Execute.scala 88:23 89:18 85:27]
  wire [31:0] _GEN_10 = _io_in_ready_T ? 32'h0 : stageReg_aluIn2; // @[3_Execute.scala 88:23 89:18 85:27]
  wire [31:0] _GEN_14 = _io_in_ready_T ? 32'h0 : stageReg_data2; // @[3_Execute.scala 88:23 89:18 85:27]
  wire [31:0] _hazardData1_T_3 = 2'h1 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValM : stageReg_aluIn1; // @[Mux.scala 81:58]
  wire [31:0] hazardData1 = 2'h2 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValW : _hazardData1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _hazardData2_T_3 = 2'h1 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValM : stageReg_aluIn2; // @[Mux.scala 81:58]
  wire [31:0] hazardData2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _hazardData2_T_3; // @[Mux.scala 81:58]
  wire  _T_6 = io_hazard_in_aluSrc2 != 2'h0; // @[3_Execute.scala 121:55]
  wire  aluZero = alu_io_zero; // @[3_Execute.scala 129:18 94:23]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_5 = $signed(stageReg_imm) + $signed(stageReg_instState_pc); // @[3_Execute.scala 134:120]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_7 = stageReg_imm + stageReg_instState_pc; // @[3_Execute.scala 135:62]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_8 = stageReg_immSign ? _io_out_fetch_bits_targetAddr_T_5 :
    _io_out_fetch_bits_targetAddr_T_7; // @[3_Execute.scala 134:48]
  wire [31:0] _io_out_memory_bits_data2_T_3 = io_hazard_in_aluSrc2 == 2'h2 ? io_hazard_in_rdValW : stageReg_data2; // @[3_Execute.scala 146:44]
  wire [31:0] _io_out_memory_bits_data2_T_4 = io_hazard_in_aluSrc2 == 2'h1 ? io_hazard_in_rdValM :
    _io_out_memory_bits_data2_T_3; // @[3_Execute.scala 145:44]
  wire [11:0] csrAddr = stageReg_instState_inst[31:20]; // @[util.scala 47:36]
  ALU alu ( // @[3_Execute.scala 98:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out),
    .io_zero(alu_io_zero)
  );
  assign io_in_ready = ~stall; // @[3_Execute.scala 83:21]
  assign io_out_memory_valid = ~stall; // @[3_Execute.scala 175:29]
  assign io_out_memory_bits_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 141:37]
  assign io_out_memory_bits_lsuOp = stageReg_lsuOp; // @[3_Execute.scala 142:37]
  assign io_out_memory_bits_regWrEn = stageReg_regWrEn; // @[3_Execute.scala 143:37]
  assign io_out_memory_bits_aluOut = alu_io_out; // @[3_Execute.scala 140:37]
  assign io_out_memory_bits_data2 = io_hazard_in_aluSrc2 == 2'h0 ? stageReg_data2 : _io_out_memory_bits_data2_T_4; // @[3_Execute.scala 144:43]
  assign io_out_memory_bits_pcNext4 = stageReg_pcNext4; // @[3_Execute.scala 147:37]
  assign io_out_memory_bits_csrOp = stageReg_csrOp; // @[3_Execute.scala 154:35]
  assign io_out_memory_bits_csrWrEn = stageReg_csrOp != 3'h0 & io_csrRead_valid; // @[3_Execute.scala 155:65]
  assign io_out_memory_bits_csrValid = io_csrRead_valid; // @[3_Execute.scala 156:35]
  assign io_out_memory_bits_csrWrData = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 106:21]
  assign io_out_memory_bits_csrAddr = {{20'd0}, csrAddr}; // @[3_Execute.scala 159:35]
  assign io_out_memory_bits_excType = stageReg_excType; // @[3_Execute.scala 160:35]
  assign io_out_memory_bits_instState_commit = stageReg_instState_commit; // @[3_Execute.scala 172:34]
  assign io_out_memory_bits_instState_pc = stageReg_instState_pc; // @[3_Execute.scala 172:34]
  assign io_out_memory_bits_instState_inst = stageReg_instState_inst; // @[3_Execute.scala 172:34]
  assign io_out_fetch_bits_brTaken = stageReg_isBranch & aluZero | stageReg_isJump; // @[3_Execute.scala 132:71]
  assign io_out_fetch_bits_targetAddr = stageReg_pcAddReg ? alu_io_out : _io_out_fetch_bits_targetAddr_T_8; // @[3_Execute.scala 133:43]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign io_hazard_out_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 168:29]
  assign io_hazard_out_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_csrRead_op = stageReg_csrOp; // @[3_Execute.scala 153:21]
  assign io_csrRead_addr = stageReg_instState_inst[31:20]; // @[util.scala 47:36]
  assign alu_io_in1 = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 106:21]
  assign alu_io_in2 = stageReg_aluIn2IsReg ? hazardData2 : stageReg_aluIn2; // @[3_Execute.scala 115:22]
  assign alu_io_opSel = stageReg_aluOpSel; // @[3_Execute.scala 128:18]
  always @(posedge clock) begin
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_isBranch <= io_in_bits_isBranch; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_isJump <= io_in_bits_isJump; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_aluOpSel <= io_in_bits_aluOpSel; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_immSign <= io_in_bits_immSign; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_regWrEn <= io_in_bits_regWrEn; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_pcAddReg <= io_in_bits_pcAddReg; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (stageReg_aluIn1IsReg & io_hazard_in_aluSrc1 != 2'h0 & stall) begin // @[3_Execute.scala 118:77]
      if (2'h2 == io_hazard_in_aluSrc1) begin // @[Mux.scala 81:58]
        stageReg_aluIn1 <= io_hazard_in_rdValW;
      end else if (2'h1 == io_hazard_in_aluSrc1) begin // @[Mux.scala 81:58]
        stageReg_aluIn1 <= io_hazard_in_rdValM;
      end
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_aluIn1 <= io_in_bits_aluIn1; // @[3_Execute.scala 87:18]
    end else begin
      stageReg_aluIn1 <= _GEN_9;
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (stageReg_aluIn2IsReg & io_hazard_in_aluSrc2 != 2'h0 & stall) begin // @[3_Execute.scala 121:77]
      if (2'h2 == io_hazard_in_aluSrc2) begin // @[Mux.scala 81:58]
        stageReg_aluIn2 <= io_hazard_in_rdValW;
      end else if (2'h1 == io_hazard_in_aluSrc2) begin // @[Mux.scala 81:58]
        stageReg_aluIn2 <= io_hazard_in_rdValM;
      end
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_aluIn2 <= io_in_bits_aluIn2; // @[3_Execute.scala 87:18]
    end else begin
      stageReg_aluIn2 <= _GEN_10;
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_aluIn1IsReg <= io_in_bits_aluIn1IsReg; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_aluIn2IsReg <= io_in_bits_aluIn2IsReg; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_imm <= io_in_bits_imm; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (_T_6 & stall) begin // @[3_Execute.scala 124:53]
      if (2'h2 == io_hazard_in_aluSrc2) begin // @[Mux.scala 81:58]
        stageReg_data2 <= io_hazard_in_rdValW;
      end else if (2'h1 == io_hazard_in_aluSrc2) begin // @[Mux.scala 81:58]
        stageReg_data2 <= io_hazard_in_rdValM;
      end else begin
        stageReg_data2 <= stageReg_aluIn2;
      end
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_data2 <= io_in_bits_data2; // @[3_Execute.scala 87:18]
    end else begin
      stageReg_data2 <= _GEN_14;
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_excType <= io_in_bits_excType; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_csrOp <= io_in_bits_csrOp; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 89:18]
    end
    if (reset) begin // @[3_Execute.scala 85:27]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 85:27]
    end else if (io_ctrl_flush & _io_in_ready_T) begin // @[3_Execute.scala 92:27]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 92:38]
    end else if (executeLatch) begin // @[3_Execute.scala 86:24]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[3_Execute.scala 87:18]
    end else if (_io_in_ready_T) begin // @[3_Execute.scala 88:23]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 89:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stageReg_isBranch = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_isJump = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_resultSrc = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_lsuOp = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_aluOpSel = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_immSign = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_pcAddReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_aluIn1 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_aluIn2 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_aluIn1IsReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_aluIn2IsReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_imm = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_data2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stageReg_excType = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
