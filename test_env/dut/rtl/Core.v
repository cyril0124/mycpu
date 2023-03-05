module Core(
  input         clock,
  input         reset,
  input         io_in_start,
  output [31:0] io_out_state_intRegState_regState_0,
  output [31:0] io_out_state_intRegState_regState_1,
  output [31:0] io_out_state_intRegState_regState_2,
  output [31:0] io_out_state_intRegState_regState_3,
  output [31:0] io_out_state_intRegState_regState_4,
  output [31:0] io_out_state_intRegState_regState_5,
  output [31:0] io_out_state_intRegState_regState_6,
  output [31:0] io_out_state_intRegState_regState_7,
  output [31:0] io_out_state_intRegState_regState_8,
  output [31:0] io_out_state_intRegState_regState_9,
  output [31:0] io_out_state_intRegState_regState_10,
  output [31:0] io_out_state_intRegState_regState_11,
  output [31:0] io_out_state_intRegState_regState_12,
  output [31:0] io_out_state_intRegState_regState_13,
  output [31:0] io_out_state_intRegState_regState_14,
  output [31:0] io_out_state_intRegState_regState_15,
  output [31:0] io_out_state_intRegState_regState_16,
  output [31:0] io_out_state_intRegState_regState_17,
  output [31:0] io_out_state_intRegState_regState_18,
  output [31:0] io_out_state_intRegState_regState_19,
  output [31:0] io_out_state_intRegState_regState_20,
  output [31:0] io_out_state_intRegState_regState_21,
  output [31:0] io_out_state_intRegState_regState_22,
  output [31:0] io_out_state_intRegState_regState_23,
  output [31:0] io_out_state_intRegState_regState_24,
  output [31:0] io_out_state_intRegState_regState_25,
  output [31:0] io_out_state_intRegState_regState_26,
  output [31:0] io_out_state_intRegState_regState_27,
  output [31:0] io_out_state_intRegState_regState_28,
  output [31:0] io_out_state_intRegState_regState_29,
  output [31:0] io_out_state_intRegState_regState_30,
  output [31:0] io_out_state_intRegState_regState_31,
  output        io_out_state_instState_commit,
  output [31:0] io_out_state_instState_pc,
  output [31:0] io_out_state_instState_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  fetchStage_clock; // @[Core.scala 33:28]
  wire  fetchStage_reset; // @[Core.scala 33:28]
  wire  fetchStage_io_in_start; // @[Core.scala 33:28]
  wire  fetchStage_io_in_execute_ready; // @[Core.scala 33:28]
  wire  fetchStage_io_in_execute_bits_brTaken; // @[Core.scala 33:28]
  wire [31:0] fetchStage_io_in_execute_bits_targetAddr; // @[Core.scala 33:28]
  wire  fetchStage_io_out_ready; // @[Core.scala 33:28]
  wire  fetchStage_io_out_valid; // @[Core.scala 33:28]
  wire [31:0] fetchStage_io_out_bits_pcNext4; // @[Core.scala 33:28]
  wire  fetchStage_io_out_bits_instState_commit; // @[Core.scala 33:28]
  wire [31:0] fetchStage_io_out_bits_instState_pc; // @[Core.scala 33:28]
  wire [31:0] fetchStage_io_out_bits_instState_inst; // @[Core.scala 33:28]
  wire  fetchStage_io_rom_resp_valid; // @[Core.scala 33:28]
  wire  decodeStage_clock; // @[Core.scala 38:29]
  wire  decodeStage_reset; // @[Core.scala 38:29]
  wire  decodeStage_io_in_fetch_ready; // @[Core.scala 38:29]
  wire  decodeStage_io_in_fetch_valid; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_in_fetch_bits_pcNext4; // @[Core.scala 38:29]
  wire  decodeStage_io_in_fetch_bits_instState_commit; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_in_fetch_bits_instState_pc; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_in_fetch_bits_instState_inst; // @[Core.scala 38:29]
  wire [4:0] decodeStage_io_in_writeback_bits_rd; // @[Core.scala 38:29]
  wire  decodeStage_io_in_writeback_bits_regWrEn; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_in_writeback_bits_regWrData; // @[Core.scala 38:29]
  wire  decodeStage_io_out_ready; // @[Core.scala 38:29]
  wire  decodeStage_io_out_valid; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_isBranch; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_isJump; // @[Core.scala 38:29]
  wire [1:0] decodeStage_io_out_bits_resultSrc; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_memWrEn; // @[Core.scala 38:29]
  wire [2:0] decodeStage_io_out_bits_memType; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_memSign; // @[Core.scala 38:29]
  wire [3:0] decodeStage_io_out_bits_aluOpSel; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_immSign; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_regWrEn; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_pcAddReg; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_aluSrc; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_pcNext4; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_data1; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_data2; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_imm; // @[Core.scala 38:29]
  wire  decodeStage_io_out_bits_instState_commit; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_instState_pc; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_out_bits_instState_inst; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_0; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_1; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_2; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_3; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_4; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_5; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_6; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_7; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_8; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_9; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_10; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_11; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_12; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_13; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_14; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_15; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_16; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_17; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_18; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_19; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_20; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_21; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_22; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_23; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_24; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_25; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_26; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_27; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_28; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_29; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_30; // @[Core.scala 38:29]
  wire [31:0] decodeStage_io_regState_regState_31; // @[Core.scala 38:29]
  wire  decodeStage_io_ctrl_flush; // @[Core.scala 38:29]
  wire  executeStage_clock; // @[Core.scala 43:30]
  wire  executeStage_reset; // @[Core.scala 43:30]
  wire  executeStage_io_in_ready; // @[Core.scala 43:30]
  wire  executeStage_io_in_valid; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_isBranch; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_isJump; // @[Core.scala 43:30]
  wire [1:0] executeStage_io_in_bits_resultSrc; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_memWrEn; // @[Core.scala 43:30]
  wire [2:0] executeStage_io_in_bits_memType; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_memSign; // @[Core.scala 43:30]
  wire [3:0] executeStage_io_in_bits_aluOpSel; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_immSign; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_regWrEn; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_pcAddReg; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_aluSrc; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_pcNext4; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_data1; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_data2; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_imm; // @[Core.scala 43:30]
  wire  executeStage_io_in_bits_instState_commit; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_instState_pc; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_in_bits_instState_inst; // @[Core.scala 43:30]
  wire [1:0] executeStage_io_out_memory_bits_resultSrc; // @[Core.scala 43:30]
  wire  executeStage_io_out_memory_bits_memWrEn; // @[Core.scala 43:30]
  wire [2:0] executeStage_io_out_memory_bits_memType; // @[Core.scala 43:30]
  wire  executeStage_io_out_memory_bits_memSign; // @[Core.scala 43:30]
  wire  executeStage_io_out_memory_bits_regWrEn; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_memory_bits_aluOut; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_memory_bits_data2; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_memory_bits_pcNext4; // @[Core.scala 43:30]
  wire  executeStage_io_out_memory_bits_instState_commit; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_memory_bits_instState_pc; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_memory_bits_instState_inst; // @[Core.scala 43:30]
  wire  executeStage_io_out_fetch_ready; // @[Core.scala 43:30]
  wire  executeStage_io_out_fetch_bits_brTaken; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_out_fetch_bits_targetAddr; // @[Core.scala 43:30]
  wire [4:0] executeStage_io_hazard_out_rs1; // @[Core.scala 43:30]
  wire [4:0] executeStage_io_hazard_out_rs2; // @[Core.scala 43:30]
  wire [1:0] executeStage_io_hazard_in_aluSrc1; // @[Core.scala 43:30]
  wire [1:0] executeStage_io_hazard_in_aluSrc2; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_hazard_in_rdValM; // @[Core.scala 43:30]
  wire [31:0] executeStage_io_hazard_in_rdValW; // @[Core.scala 43:30]
  wire  executeStage_io_ctrl_flush; // @[Core.scala 43:30]
  wire  memoryStage_clock; // @[Core.scala 48:29]
  wire  memoryStage_reset; // @[Core.scala 48:29]
  wire [1:0] memoryStage_io_in_bits_resultSrc; // @[Core.scala 48:29]
  wire  memoryStage_io_in_bits_memWrEn; // @[Core.scala 48:29]
  wire [2:0] memoryStage_io_in_bits_memType; // @[Core.scala 48:29]
  wire  memoryStage_io_in_bits_memSign; // @[Core.scala 48:29]
  wire  memoryStage_io_in_bits_regWrEn; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_in_bits_aluOut; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_in_bits_data2; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_in_bits_pcNext4; // @[Core.scala 48:29]
  wire  memoryStage_io_in_bits_instState_commit; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_in_bits_instState_pc; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_in_bits_instState_inst; // @[Core.scala 48:29]
  wire [1:0] memoryStage_io_out_bits_resultSrc; // @[Core.scala 48:29]
  wire  memoryStage_io_out_bits_regWrEn; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_out_bits_rdData; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_out_bits_aluOut; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_out_bits_pcNext4; // @[Core.scala 48:29]
  wire  memoryStage_io_out_bits_instState_commit; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_out_bits_instState_pc; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_out_bits_instState_inst; // @[Core.scala 48:29]
  wire [4:0] memoryStage_io_hazard_rd; // @[Core.scala 48:29]
  wire [31:0] memoryStage_io_hazard_rdVal; // @[Core.scala 48:29]
  wire  memoryStage_io_hazard_regWrEn; // @[Core.scala 48:29]
  wire  writebackStage_clock; // @[Core.scala 52:32]
  wire  writebackStage_reset; // @[Core.scala 52:32]
  wire [1:0] writebackStage_io_in_bits_resultSrc; // @[Core.scala 52:32]
  wire  writebackStage_io_in_bits_regWrEn; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_in_bits_rdData; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_in_bits_aluOut; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_in_bits_pcNext4; // @[Core.scala 52:32]
  wire  writebackStage_io_in_bits_instState_commit; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_in_bits_instState_pc; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_in_bits_instState_inst; // @[Core.scala 52:32]
  wire [4:0] writebackStage_io_out_bits_rd; // @[Core.scala 52:32]
  wire  writebackStage_io_out_bits_regWrEn; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_out_bits_regWrData; // @[Core.scala 52:32]
  wire  writebackStage_io_instState_commit; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_instState_pc; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_instState_inst; // @[Core.scala 52:32]
  wire [4:0] writebackStage_io_hazard_rd; // @[Core.scala 52:32]
  wire [31:0] writebackStage_io_hazard_rdVal; // @[Core.scala 52:32]
  wire  writebackStage_io_hazard_regWrEn; // @[Core.scala 52:32]
  wire  pipelineCtrl_io_in_brTaken; // @[Core.scala 59:30]
  wire  pipelineCtrl_io_out_decode_flush; // @[Core.scala 59:30]
  wire  pipelineCtrl_io_out_execute_flush; // @[Core.scala 59:30]
  wire [4:0] hazardUnit_io_in_execute_rs1; // @[Core.scala 68:28]
  wire [4:0] hazardUnit_io_in_execute_rs2; // @[Core.scala 68:28]
  wire [4:0] hazardUnit_io_in_memory_rd; // @[Core.scala 68:28]
  wire [31:0] hazardUnit_io_in_memory_rdVal; // @[Core.scala 68:28]
  wire  hazardUnit_io_in_memory_regWrEn; // @[Core.scala 68:28]
  wire [4:0] hazardUnit_io_in_writeback_rd; // @[Core.scala 68:28]
  wire [31:0] hazardUnit_io_in_writeback_rdVal; // @[Core.scala 68:28]
  wire  hazardUnit_io_in_writeback_regWrEn; // @[Core.scala 68:28]
  wire [1:0] hazardUnit_io_out_execute_aluSrc1; // @[Core.scala 68:28]
  wire [1:0] hazardUnit_io_out_execute_aluSrc2; // @[Core.scala 68:28]
  wire [31:0] hazardUnit_io_out_execute_rdValM; // @[Core.scala 68:28]
  wire [31:0] hazardUnit_io_out_execute_rdValW; // @[Core.scala 68:28]
  wire  busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 81:29]
  wire  rom_clock; // @[Core.scala 87:21]
  wire [31:0] rom_io_raddr; // @[Core.scala 87:21]
  wire [31:0] rom_io_rdata; // @[Core.scala 87:21]
  reg  fetchStage_io_in_start_REG; // @[Core.scala 34:38]
  reg  io_out_state_instState_REG_commit; // @[Core.scala 78:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core.scala 78:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core.scala 78:38]
  Fetch fetchStage ( // @[Core.scala 33:28]
    .clock(fetchStage_clock),
    .reset(fetchStage_reset),
    .io_in_start(fetchStage_io_in_start),
    .io_in_execute_ready(fetchStage_io_in_execute_ready),
    .io_in_execute_bits_brTaken(fetchStage_io_in_execute_bits_brTaken),
    .io_in_execute_bits_targetAddr(fetchStage_io_in_execute_bits_targetAddr),
    .io_out_ready(fetchStage_io_out_ready),
    .io_out_valid(fetchStage_io_out_valid),
    .io_out_bits_pcNext4(fetchStage_io_out_bits_pcNext4),
    .io_out_bits_instState_commit(fetchStage_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(fetchStage_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(fetchStage_io_out_bits_instState_inst),
    .io_rom_resp_valid(fetchStage_io_rom_resp_valid)
  );
  Decode decodeStage ( // @[Core.scala 38:29]
    .clock(decodeStage_clock),
    .reset(decodeStage_reset),
    .io_in_fetch_ready(decodeStage_io_in_fetch_ready),
    .io_in_fetch_valid(decodeStage_io_in_fetch_valid),
    .io_in_fetch_bits_pcNext4(decodeStage_io_in_fetch_bits_pcNext4),
    .io_in_fetch_bits_instState_commit(decodeStage_io_in_fetch_bits_instState_commit),
    .io_in_fetch_bits_instState_pc(decodeStage_io_in_fetch_bits_instState_pc),
    .io_in_fetch_bits_instState_inst(decodeStage_io_in_fetch_bits_instState_inst),
    .io_in_writeback_bits_rd(decodeStage_io_in_writeback_bits_rd),
    .io_in_writeback_bits_regWrEn(decodeStage_io_in_writeback_bits_regWrEn),
    .io_in_writeback_bits_regWrData(decodeStage_io_in_writeback_bits_regWrData),
    .io_out_ready(decodeStage_io_out_ready),
    .io_out_valid(decodeStage_io_out_valid),
    .io_out_bits_isBranch(decodeStage_io_out_bits_isBranch),
    .io_out_bits_isJump(decodeStage_io_out_bits_isJump),
    .io_out_bits_resultSrc(decodeStage_io_out_bits_resultSrc),
    .io_out_bits_memWrEn(decodeStage_io_out_bits_memWrEn),
    .io_out_bits_memType(decodeStage_io_out_bits_memType),
    .io_out_bits_memSign(decodeStage_io_out_bits_memSign),
    .io_out_bits_aluOpSel(decodeStage_io_out_bits_aluOpSel),
    .io_out_bits_immSign(decodeStage_io_out_bits_immSign),
    .io_out_bits_regWrEn(decodeStage_io_out_bits_regWrEn),
    .io_out_bits_pcAddReg(decodeStage_io_out_bits_pcAddReg),
    .io_out_bits_aluSrc(decodeStage_io_out_bits_aluSrc),
    .io_out_bits_pcNext4(decodeStage_io_out_bits_pcNext4),
    .io_out_bits_data1(decodeStage_io_out_bits_data1),
    .io_out_bits_data2(decodeStage_io_out_bits_data2),
    .io_out_bits_imm(decodeStage_io_out_bits_imm),
    .io_out_bits_instState_commit(decodeStage_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(decodeStage_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(decodeStage_io_out_bits_instState_inst),
    .io_regState_regState_0(decodeStage_io_regState_regState_0),
    .io_regState_regState_1(decodeStage_io_regState_regState_1),
    .io_regState_regState_2(decodeStage_io_regState_regState_2),
    .io_regState_regState_3(decodeStage_io_regState_regState_3),
    .io_regState_regState_4(decodeStage_io_regState_regState_4),
    .io_regState_regState_5(decodeStage_io_regState_regState_5),
    .io_regState_regState_6(decodeStage_io_regState_regState_6),
    .io_regState_regState_7(decodeStage_io_regState_regState_7),
    .io_regState_regState_8(decodeStage_io_regState_regState_8),
    .io_regState_regState_9(decodeStage_io_regState_regState_9),
    .io_regState_regState_10(decodeStage_io_regState_regState_10),
    .io_regState_regState_11(decodeStage_io_regState_regState_11),
    .io_regState_regState_12(decodeStage_io_regState_regState_12),
    .io_regState_regState_13(decodeStage_io_regState_regState_13),
    .io_regState_regState_14(decodeStage_io_regState_regState_14),
    .io_regState_regState_15(decodeStage_io_regState_regState_15),
    .io_regState_regState_16(decodeStage_io_regState_regState_16),
    .io_regState_regState_17(decodeStage_io_regState_regState_17),
    .io_regState_regState_18(decodeStage_io_regState_regState_18),
    .io_regState_regState_19(decodeStage_io_regState_regState_19),
    .io_regState_regState_20(decodeStage_io_regState_regState_20),
    .io_regState_regState_21(decodeStage_io_regState_regState_21),
    .io_regState_regState_22(decodeStage_io_regState_regState_22),
    .io_regState_regState_23(decodeStage_io_regState_regState_23),
    .io_regState_regState_24(decodeStage_io_regState_regState_24),
    .io_regState_regState_25(decodeStage_io_regState_regState_25),
    .io_regState_regState_26(decodeStage_io_regState_regState_26),
    .io_regState_regState_27(decodeStage_io_regState_regState_27),
    .io_regState_regState_28(decodeStage_io_regState_regState_28),
    .io_regState_regState_29(decodeStage_io_regState_regState_29),
    .io_regState_regState_30(decodeStage_io_regState_regState_30),
    .io_regState_regState_31(decodeStage_io_regState_regState_31),
    .io_ctrl_flush(decodeStage_io_ctrl_flush)
  );
  Execute executeStage ( // @[Core.scala 43:30]
    .clock(executeStage_clock),
    .reset(executeStage_reset),
    .io_in_ready(executeStage_io_in_ready),
    .io_in_valid(executeStage_io_in_valid),
    .io_in_bits_isBranch(executeStage_io_in_bits_isBranch),
    .io_in_bits_isJump(executeStage_io_in_bits_isJump),
    .io_in_bits_resultSrc(executeStage_io_in_bits_resultSrc),
    .io_in_bits_memWrEn(executeStage_io_in_bits_memWrEn),
    .io_in_bits_memType(executeStage_io_in_bits_memType),
    .io_in_bits_memSign(executeStage_io_in_bits_memSign),
    .io_in_bits_aluOpSel(executeStage_io_in_bits_aluOpSel),
    .io_in_bits_immSign(executeStage_io_in_bits_immSign),
    .io_in_bits_regWrEn(executeStage_io_in_bits_regWrEn),
    .io_in_bits_pcAddReg(executeStage_io_in_bits_pcAddReg),
    .io_in_bits_aluSrc(executeStage_io_in_bits_aluSrc),
    .io_in_bits_pcNext4(executeStage_io_in_bits_pcNext4),
    .io_in_bits_data1(executeStage_io_in_bits_data1),
    .io_in_bits_data2(executeStage_io_in_bits_data2),
    .io_in_bits_imm(executeStage_io_in_bits_imm),
    .io_in_bits_instState_commit(executeStage_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(executeStage_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(executeStage_io_in_bits_instState_inst),
    .io_out_memory_bits_resultSrc(executeStage_io_out_memory_bits_resultSrc),
    .io_out_memory_bits_memWrEn(executeStage_io_out_memory_bits_memWrEn),
    .io_out_memory_bits_memType(executeStage_io_out_memory_bits_memType),
    .io_out_memory_bits_memSign(executeStage_io_out_memory_bits_memSign),
    .io_out_memory_bits_regWrEn(executeStage_io_out_memory_bits_regWrEn),
    .io_out_memory_bits_aluOut(executeStage_io_out_memory_bits_aluOut),
    .io_out_memory_bits_data2(executeStage_io_out_memory_bits_data2),
    .io_out_memory_bits_pcNext4(executeStage_io_out_memory_bits_pcNext4),
    .io_out_memory_bits_instState_commit(executeStage_io_out_memory_bits_instState_commit),
    .io_out_memory_bits_instState_pc(executeStage_io_out_memory_bits_instState_pc),
    .io_out_memory_bits_instState_inst(executeStage_io_out_memory_bits_instState_inst),
    .io_out_fetch_ready(executeStage_io_out_fetch_ready),
    .io_out_fetch_bits_brTaken(executeStage_io_out_fetch_bits_brTaken),
    .io_out_fetch_bits_targetAddr(executeStage_io_out_fetch_bits_targetAddr),
    .io_hazard_out_rs1(executeStage_io_hazard_out_rs1),
    .io_hazard_out_rs2(executeStage_io_hazard_out_rs2),
    .io_hazard_in_aluSrc1(executeStage_io_hazard_in_aluSrc1),
    .io_hazard_in_aluSrc2(executeStage_io_hazard_in_aluSrc2),
    .io_hazard_in_rdValM(executeStage_io_hazard_in_rdValM),
    .io_hazard_in_rdValW(executeStage_io_hazard_in_rdValW),
    .io_ctrl_flush(executeStage_io_ctrl_flush)
  );
  Memory memoryStage ( // @[Core.scala 48:29]
    .clock(memoryStage_clock),
    .reset(memoryStage_reset),
    .io_in_bits_resultSrc(memoryStage_io_in_bits_resultSrc),
    .io_in_bits_memWrEn(memoryStage_io_in_bits_memWrEn),
    .io_in_bits_memType(memoryStage_io_in_bits_memType),
    .io_in_bits_memSign(memoryStage_io_in_bits_memSign),
    .io_in_bits_regWrEn(memoryStage_io_in_bits_regWrEn),
    .io_in_bits_aluOut(memoryStage_io_in_bits_aluOut),
    .io_in_bits_data2(memoryStage_io_in_bits_data2),
    .io_in_bits_pcNext4(memoryStage_io_in_bits_pcNext4),
    .io_in_bits_instState_commit(memoryStage_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(memoryStage_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(memoryStage_io_in_bits_instState_inst),
    .io_out_bits_resultSrc(memoryStage_io_out_bits_resultSrc),
    .io_out_bits_regWrEn(memoryStage_io_out_bits_regWrEn),
    .io_out_bits_rdData(memoryStage_io_out_bits_rdData),
    .io_out_bits_aluOut(memoryStage_io_out_bits_aluOut),
    .io_out_bits_pcNext4(memoryStage_io_out_bits_pcNext4),
    .io_out_bits_instState_commit(memoryStage_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(memoryStage_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(memoryStage_io_out_bits_instState_inst),
    .io_hazard_rd(memoryStage_io_hazard_rd),
    .io_hazard_rdVal(memoryStage_io_hazard_rdVal),
    .io_hazard_regWrEn(memoryStage_io_hazard_regWrEn)
  );
  Writeback writebackStage ( // @[Core.scala 52:32]
    .clock(writebackStage_clock),
    .reset(writebackStage_reset),
    .io_in_bits_resultSrc(writebackStage_io_in_bits_resultSrc),
    .io_in_bits_regWrEn(writebackStage_io_in_bits_regWrEn),
    .io_in_bits_rdData(writebackStage_io_in_bits_rdData),
    .io_in_bits_aluOut(writebackStage_io_in_bits_aluOut),
    .io_in_bits_pcNext4(writebackStage_io_in_bits_pcNext4),
    .io_in_bits_instState_commit(writebackStage_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(writebackStage_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(writebackStage_io_in_bits_instState_inst),
    .io_out_bits_rd(writebackStage_io_out_bits_rd),
    .io_out_bits_regWrEn(writebackStage_io_out_bits_regWrEn),
    .io_out_bits_regWrData(writebackStage_io_out_bits_regWrData),
    .io_instState_commit(writebackStage_io_instState_commit),
    .io_instState_pc(writebackStage_io_instState_pc),
    .io_instState_inst(writebackStage_io_instState_inst),
    .io_hazard_rd(writebackStage_io_hazard_rd),
    .io_hazard_rdVal(writebackStage_io_hazard_rdVal),
    .io_hazard_regWrEn(writebackStage_io_hazard_regWrEn)
  );
  PipelineCtrl pipelineCtrl ( // @[Core.scala 59:30]
    .io_in_brTaken(pipelineCtrl_io_in_brTaken),
    .io_out_decode_flush(pipelineCtrl_io_out_decode_flush),
    .io_out_execute_flush(pipelineCtrl_io_out_execute_flush)
  );
  HazardUnit hazardUnit ( // @[Core.scala 68:28]
    .io_in_execute_rs1(hazardUnit_io_in_execute_rs1),
    .io_in_execute_rs2(hazardUnit_io_in_execute_rs2),
    .io_in_memory_rd(hazardUnit_io_in_memory_rd),
    .io_in_memory_rdVal(hazardUnit_io_in_memory_rdVal),
    .io_in_memory_regWrEn(hazardUnit_io_in_memory_regWrEn),
    .io_in_writeback_rd(hazardUnit_io_in_writeback_rd),
    .io_in_writeback_rdVal(hazardUnit_io_in_writeback_rdVal),
    .io_in_writeback_regWrEn(hazardUnit_io_in_writeback_regWrEn),
    .io_out_execute_aluSrc1(hazardUnit_io_out_execute_aluSrc1),
    .io_out_execute_aluSrc2(hazardUnit_io_out_execute_aluSrc2),
    .io_out_execute_rdValM(hazardUnit_io_out_execute_rdValM),
    .io_out_execute_rdValW(hazardUnit_io_out_execute_rdValW)
  );
  BusCrossBar busCrossBar ( // @[Core.scala 81:29]
    .io_masterFace_out_0_valid(busCrossBar_io_masterFace_out_0_valid)
  );
  ROM rom ( // @[Core.scala 87:21]
    .clock(rom_clock),
    .io_raddr(rom_io_raddr),
    .io_rdata(rom_io_rdata)
  );
  assign io_out_state_intRegState_regState_0 = decodeStage_io_regState_regState_0; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_1 = decodeStage_io_regState_regState_1; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_2 = decodeStage_io_regState_regState_2; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_3 = decodeStage_io_regState_regState_3; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_4 = decodeStage_io_regState_regState_4; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_5 = decodeStage_io_regState_regState_5; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_6 = decodeStage_io_regState_regState_6; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_7 = decodeStage_io_regState_regState_7; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_8 = decodeStage_io_regState_regState_8; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_9 = decodeStage_io_regState_regState_9; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_10 = decodeStage_io_regState_regState_10; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_11 = decodeStage_io_regState_regState_11; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_12 = decodeStage_io_regState_regState_12; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_13 = decodeStage_io_regState_regState_13; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_14 = decodeStage_io_regState_regState_14; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_15 = decodeStage_io_regState_regState_15; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_16 = decodeStage_io_regState_regState_16; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_17 = decodeStage_io_regState_regState_17; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_18 = decodeStage_io_regState_regState_18; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_19 = decodeStage_io_regState_regState_19; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_20 = decodeStage_io_regState_regState_20; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_21 = decodeStage_io_regState_regState_21; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_22 = decodeStage_io_regState_regState_22; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_23 = decodeStage_io_regState_regState_23; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_24 = decodeStage_io_regState_regState_24; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_25 = decodeStage_io_regState_regState_25; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_26 = decodeStage_io_regState_regState_26; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_27 = decodeStage_io_regState_regState_27; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_28 = decodeStage_io_regState_regState_28; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_29 = decodeStage_io_regState_regState_29; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_30 = decodeStage_io_regState_regState_30; // @[Core.scala 77:30]
  assign io_out_state_intRegState_regState_31 = decodeStage_io_regState_regState_31; // @[Core.scala 77:30]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core.scala 78:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core.scala 78:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core.scala 78:28]
  assign fetchStage_clock = clock;
  assign fetchStage_reset = reset;
  assign fetchStage_io_in_start = fetchStage_io_in_start_REG; // @[Core.scala 34:28]
  assign fetchStage_io_in_execute_bits_brTaken = executeStage_io_out_fetch_bits_brTaken; // @[Core.scala 45:30]
  assign fetchStage_io_in_execute_bits_targetAddr = executeStage_io_out_fetch_bits_targetAddr; // @[Core.scala 45:30]
  assign fetchStage_io_out_ready = decodeStage_io_in_fetch_ready; // @[Core.scala 39:29]
  assign fetchStage_io_rom_resp_valid = busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 84:28]
  assign decodeStage_clock = clock;
  assign decodeStage_reset = reset;
  assign decodeStage_io_in_fetch_valid = fetchStage_io_out_valid; // @[Core.scala 39:29]
  assign decodeStage_io_in_fetch_bits_pcNext4 = fetchStage_io_out_bits_pcNext4; // @[Core.scala 39:29]
  assign decodeStage_io_in_fetch_bits_instState_commit = fetchStage_io_out_bits_instState_commit; // @[Core.scala 39:29]
  assign decodeStage_io_in_fetch_bits_instState_pc = fetchStage_io_out_bits_instState_pc; // @[Core.scala 39:29]
  assign decodeStage_io_in_fetch_bits_instState_inst = fetchStage_io_out_bits_instState_inst; // @[Core.scala 39:29]
  assign decodeStage_io_in_writeback_bits_rd = writebackStage_io_out_bits_rd; // @[Core.scala 56:33]
  assign decodeStage_io_in_writeback_bits_regWrEn = writebackStage_io_out_bits_regWrEn; // @[Core.scala 56:33]
  assign decodeStage_io_in_writeback_bits_regWrData = writebackStage_io_out_bits_regWrData; // @[Core.scala 56:33]
  assign decodeStage_io_out_ready = executeStage_io_in_ready; // @[Core.scala 44:24]
  assign decodeStage_io_ctrl_flush = pipelineCtrl_io_out_decode_flush; // @[Core.scala 62:25]
  assign executeStage_clock = clock;
  assign executeStage_reset = reset;
  assign executeStage_io_in_valid = decodeStage_io_out_valid; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_isBranch = decodeStage_io_out_bits_isBranch; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_isJump = decodeStage_io_out_bits_isJump; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_resultSrc = decodeStage_io_out_bits_resultSrc; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_memWrEn = decodeStage_io_out_bits_memWrEn; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_memType = decodeStage_io_out_bits_memType; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_memSign = decodeStage_io_out_bits_memSign; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_aluOpSel = decodeStage_io_out_bits_aluOpSel; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_immSign = decodeStage_io_out_bits_immSign; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_regWrEn = decodeStage_io_out_bits_regWrEn; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_pcAddReg = decodeStage_io_out_bits_pcAddReg; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_aluSrc = decodeStage_io_out_bits_aluSrc; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_pcNext4 = decodeStage_io_out_bits_pcNext4; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_data1 = decodeStage_io_out_bits_data1; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_data2 = decodeStage_io_out_bits_data2; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_imm = decodeStage_io_out_bits_imm; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_instState_commit = decodeStage_io_out_bits_instState_commit; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_instState_pc = decodeStage_io_out_bits_instState_pc; // @[Core.scala 44:24]
  assign executeStage_io_in_bits_instState_inst = decodeStage_io_out_bits_instState_inst; // @[Core.scala 44:24]
  assign executeStage_io_out_fetch_ready = fetchStage_io_in_execute_ready; // @[Core.scala 45:30]
  assign executeStage_io_hazard_in_aluSrc1 = hazardUnit_io_out_execute_aluSrc1; // @[Core.scala 73:31]
  assign executeStage_io_hazard_in_aluSrc2 = hazardUnit_io_out_execute_aluSrc2; // @[Core.scala 73:31]
  assign executeStage_io_hazard_in_rdValM = hazardUnit_io_out_execute_rdValM; // @[Core.scala 73:31]
  assign executeStage_io_hazard_in_rdValW = hazardUnit_io_out_execute_rdValW; // @[Core.scala 73:31]
  assign executeStage_io_ctrl_flush = pipelineCtrl_io_out_execute_flush; // @[Core.scala 63:26]
  assign memoryStage_clock = clock;
  assign memoryStage_reset = reset;
  assign memoryStage_io_in_bits_resultSrc = executeStage_io_out_memory_bits_resultSrc; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_memWrEn = executeStage_io_out_memory_bits_memWrEn; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_memType = executeStage_io_out_memory_bits_memType; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_memSign = executeStage_io_out_memory_bits_memSign; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_regWrEn = executeStage_io_out_memory_bits_regWrEn; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_aluOut = executeStage_io_out_memory_bits_aluOut; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_data2 = executeStage_io_out_memory_bits_data2; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_pcNext4 = executeStage_io_out_memory_bits_pcNext4; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_instState_commit = executeStage_io_out_memory_bits_instState_commit; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_instState_pc = executeStage_io_out_memory_bits_instState_pc; // @[Core.scala 49:23]
  assign memoryStage_io_in_bits_instState_inst = executeStage_io_out_memory_bits_instState_inst; // @[Core.scala 49:23]
  assign writebackStage_clock = clock;
  assign writebackStage_reset = reset;
  assign writebackStage_io_in_bits_resultSrc = memoryStage_io_out_bits_resultSrc; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_regWrEn = memoryStage_io_out_bits_regWrEn; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_rdData = memoryStage_io_out_bits_rdData; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_aluOut = memoryStage_io_out_bits_aluOut; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_pcNext4 = memoryStage_io_out_bits_pcNext4; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_instState_commit = memoryStage_io_out_bits_instState_commit; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_instState_pc = memoryStage_io_out_bits_instState_pc; // @[Core.scala 53:26]
  assign writebackStage_io_in_bits_instState_inst = memoryStage_io_out_bits_instState_inst; // @[Core.scala 53:26]
  assign pipelineCtrl_io_in_brTaken = executeStage_io_out_fetch_bits_brTaken; // @[Core.scala 60:32]
  assign hazardUnit_io_in_execute_rs1 = executeStage_io_hazard_out_rs1; // @[Core.scala 70:30]
  assign hazardUnit_io_in_execute_rs2 = executeStage_io_hazard_out_rs2; // @[Core.scala 70:30]
  assign hazardUnit_io_in_memory_rd = memoryStage_io_hazard_rd; // @[Core.scala 71:29]
  assign hazardUnit_io_in_memory_rdVal = memoryStage_io_hazard_rdVal; // @[Core.scala 71:29]
  assign hazardUnit_io_in_memory_regWrEn = memoryStage_io_hazard_regWrEn; // @[Core.scala 71:29]
  assign hazardUnit_io_in_writeback_rd = writebackStage_io_hazard_rd; // @[Core.scala 72:32]
  assign hazardUnit_io_in_writeback_rdVal = writebackStage_io_hazard_rdVal; // @[Core.scala 72:32]
  assign hazardUnit_io_in_writeback_regWrEn = writebackStage_io_hazard_regWrEn; // @[Core.scala 72:32]
  assign rom_clock = clock;
  assign rom_io_raddr = 32'h0; // @[Core.scala 102:18]
  always @(posedge clock) begin
    fetchStage_io_in_start_REG <= io_in_start; // @[Core.scala 34:38]
    io_out_state_instState_REG_commit <= writebackStage_io_instState_commit; // @[Core.scala 78:38]
    io_out_state_instState_REG_pc <= writebackStage_io_instState_pc; // @[Core.scala 78:38]
    io_out_state_instState_REG_inst <= writebackStage_io_instState_inst; // @[Core.scala 78:38]
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
  fetchStage_io_in_start_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_out_state_instState_REG_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_out_state_instState_REG_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_state_instState_REG_inst = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
