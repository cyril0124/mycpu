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
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire  ife_clock; // @[Core.scala 37:21]
  wire  ife_reset; // @[Core.scala 37:21]
  wire  ife_io_in_start; // @[Core.scala 37:21]
  wire  ife_io_in_execute_ready; // @[Core.scala 37:21]
  wire  ife_io_in_execute_bits_brTaken; // @[Core.scala 37:21]
  wire [31:0] ife_io_in_execute_bits_targetAddr; // @[Core.scala 37:21]
  wire  ife_io_out_ready; // @[Core.scala 37:21]
  wire  ife_io_out_valid; // @[Core.scala 37:21]
  wire [31:0] ife_io_out_bits_pcNext4; // @[Core.scala 37:21]
  wire  ife_io_out_bits_instState_commit; // @[Core.scala 37:21]
  wire [31:0] ife_io_out_bits_instState_pc; // @[Core.scala 37:21]
  wire [31:0] ife_io_out_bits_instState_inst; // @[Core.scala 37:21]
  wire  ife_io_rom_req_ready; // @[Core.scala 37:21]
  wire  ife_io_rom_req_valid; // @[Core.scala 37:21]
  wire [31:0] ife_io_rom_req_bits_address; // @[Core.scala 37:21]
  wire  ife_io_rom_resp_ready; // @[Core.scala 37:21]
  wire  ife_io_rom_resp_valid; // @[Core.scala 37:21]
  wire [31:0] ife_io_rom_resp_bits_data; // @[Core.scala 37:21]
  wire [31:0] ife_io_trapVec; // @[Core.scala 37:21]
  wire [31:0] ife_io_mepc; // @[Core.scala 37:21]
  wire  ife_io_excp_valid; // @[Core.scala 37:21]
  wire  ife_io_excp_bits_isMret; // @[Core.scala 37:21]
  wire  dec_clock; // @[Core.scala 45:21]
  wire  dec_reset; // @[Core.scala 45:21]
  wire  dec_io_in_ready; // @[Core.scala 45:21]
  wire  dec_io_in_valid; // @[Core.scala 45:21]
  wire [31:0] dec_io_in_bits_pcNext4; // @[Core.scala 45:21]
  wire  dec_io_in_bits_instState_commit; // @[Core.scala 45:21]
  wire [31:0] dec_io_in_bits_instState_pc; // @[Core.scala 45:21]
  wire [31:0] dec_io_in_bits_instState_inst; // @[Core.scala 45:21]
  wire  dec_io_out_ready; // @[Core.scala 45:21]
  wire  dec_io_out_valid; // @[Core.scala 45:21]
  wire  dec_io_out_bits_isBranch; // @[Core.scala 45:21]
  wire  dec_io_out_bits_isJump; // @[Core.scala 45:21]
  wire [1:0] dec_io_out_bits_resultSrc; // @[Core.scala 45:21]
  wire [4:0] dec_io_out_bits_lsuOp; // @[Core.scala 45:21]
  wire [3:0] dec_io_out_bits_aluOpSel; // @[Core.scala 45:21]
  wire  dec_io_out_bits_immSign; // @[Core.scala 45:21]
  wire  dec_io_out_bits_regWrEn; // @[Core.scala 45:21]
  wire  dec_io_out_bits_pcAddReg; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_pcNext4; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_aluIn1; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_aluIn2; // @[Core.scala 45:21]
  wire  dec_io_out_bits_aluIn1IsReg; // @[Core.scala 45:21]
  wire  dec_io_out_bits_aluIn2IsReg; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_imm; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_data2; // @[Core.scala 45:21]
  wire [3:0] dec_io_out_bits_excType; // @[Core.scala 45:21]
  wire [2:0] dec_io_out_bits_csrOp; // @[Core.scala 45:21]
  wire  dec_io_out_bits_instState_commit; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_instState_pc; // @[Core.scala 45:21]
  wire [31:0] dec_io_out_bits_instState_inst; // @[Core.scala 45:21]
  wire [4:0] dec_io_hazard_out_rs1; // @[Core.scala 45:21]
  wire [4:0] dec_io_hazard_out_rs2; // @[Core.scala 45:21]
  wire  dec_io_hazard_in_stall; // @[Core.scala 45:21]
  wire [4:0] dec_io_regfile_rs1; // @[Core.scala 45:21]
  wire [4:0] dec_io_regfile_rs2; // @[Core.scala 45:21]
  wire [31:0] dec_io_regfile_rdata1; // @[Core.scala 45:21]
  wire [31:0] dec_io_regfile_rdata2; // @[Core.scala 45:21]
  wire  dec_io_ctrl_flush; // @[Core.scala 45:21]
  wire  exe_clock; // @[Core.scala 50:21]
  wire  exe_reset; // @[Core.scala 50:21]
  wire  exe_io_in_ready; // @[Core.scala 50:21]
  wire  exe_io_in_valid; // @[Core.scala 50:21]
  wire  exe_io_in_bits_isBranch; // @[Core.scala 50:21]
  wire  exe_io_in_bits_isJump; // @[Core.scala 50:21]
  wire [1:0] exe_io_in_bits_resultSrc; // @[Core.scala 50:21]
  wire [4:0] exe_io_in_bits_lsuOp; // @[Core.scala 50:21]
  wire [3:0] exe_io_in_bits_aluOpSel; // @[Core.scala 50:21]
  wire  exe_io_in_bits_immSign; // @[Core.scala 50:21]
  wire  exe_io_in_bits_regWrEn; // @[Core.scala 50:21]
  wire  exe_io_in_bits_pcAddReg; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_pcNext4; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_aluIn1; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_aluIn2; // @[Core.scala 50:21]
  wire  exe_io_in_bits_aluIn1IsReg; // @[Core.scala 50:21]
  wire  exe_io_in_bits_aluIn2IsReg; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_imm; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_data2; // @[Core.scala 50:21]
  wire [3:0] exe_io_in_bits_excType; // @[Core.scala 50:21]
  wire [2:0] exe_io_in_bits_csrOp; // @[Core.scala 50:21]
  wire  exe_io_in_bits_instState_commit; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_instState_pc; // @[Core.scala 50:21]
  wire [31:0] exe_io_in_bits_instState_inst; // @[Core.scala 50:21]
  wire  exe_io_out_memory_ready; // @[Core.scala 50:21]
  wire  exe_io_out_memory_valid; // @[Core.scala 50:21]
  wire [1:0] exe_io_out_memory_bits_resultSrc; // @[Core.scala 50:21]
  wire [4:0] exe_io_out_memory_bits_lsuOp; // @[Core.scala 50:21]
  wire  exe_io_out_memory_bits_regWrEn; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_aluOut; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_data2; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_pcNext4; // @[Core.scala 50:21]
  wire [2:0] exe_io_out_memory_bits_csrOp; // @[Core.scala 50:21]
  wire  exe_io_out_memory_bits_csrWrEn; // @[Core.scala 50:21]
  wire  exe_io_out_memory_bits_csrValid; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_csrWrData; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_csrAddr; // @[Core.scala 50:21]
  wire [3:0] exe_io_out_memory_bits_excType; // @[Core.scala 50:21]
  wire  exe_io_out_memory_bits_instState_commit; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_instState_pc; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_memory_bits_instState_inst; // @[Core.scala 50:21]
  wire  exe_io_out_fetch_ready; // @[Core.scala 50:21]
  wire  exe_io_out_fetch_bits_brTaken; // @[Core.scala 50:21]
  wire [31:0] exe_io_out_fetch_bits_targetAddr; // @[Core.scala 50:21]
  wire [4:0] exe_io_hazard_out_rs1; // @[Core.scala 50:21]
  wire [4:0] exe_io_hazard_out_rs2; // @[Core.scala 50:21]
  wire [1:0] exe_io_hazard_out_resultSrc; // @[Core.scala 50:21]
  wire [4:0] exe_io_hazard_out_rd; // @[Core.scala 50:21]
  wire [1:0] exe_io_hazard_in_aluSrc1; // @[Core.scala 50:21]
  wire [1:0] exe_io_hazard_in_aluSrc2; // @[Core.scala 50:21]
  wire [31:0] exe_io_hazard_in_rdValM; // @[Core.scala 50:21]
  wire [31:0] exe_io_hazard_in_rdValW; // @[Core.scala 50:21]
  wire  exe_io_ctrl_flush; // @[Core.scala 50:21]
  wire [2:0] exe_io_csrRead_op; // @[Core.scala 50:21]
  wire  exe_io_csrRead_valid; // @[Core.scala 50:21]
  wire [11:0] exe_io_csrRead_addr; // @[Core.scala 50:21]
  wire  mem_clock; // @[Core.scala 55:21]
  wire  mem_reset; // @[Core.scala 55:21]
  wire  mem_io_in_ready; // @[Core.scala 55:21]
  wire  mem_io_in_valid; // @[Core.scala 55:21]
  wire [1:0] mem_io_in_bits_resultSrc; // @[Core.scala 55:21]
  wire [4:0] mem_io_in_bits_lsuOp; // @[Core.scala 55:21]
  wire  mem_io_in_bits_regWrEn; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_aluOut; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_data2; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_pcNext4; // @[Core.scala 55:21]
  wire [2:0] mem_io_in_bits_csrOp; // @[Core.scala 55:21]
  wire  mem_io_in_bits_csrWrEn; // @[Core.scala 55:21]
  wire  mem_io_in_bits_csrValid; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_csrWrData; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_csrAddr; // @[Core.scala 55:21]
  wire [3:0] mem_io_in_bits_excType; // @[Core.scala 55:21]
  wire  mem_io_in_bits_instState_commit; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_instState_pc; // @[Core.scala 55:21]
  wire [31:0] mem_io_in_bits_instState_inst; // @[Core.scala 55:21]
  wire  mem_io_out_ready; // @[Core.scala 55:21]
  wire  mem_io_out_valid; // @[Core.scala 55:21]
  wire [1:0] mem_io_out_bits_resultSrc; // @[Core.scala 55:21]
  wire  mem_io_out_bits_regWrEn; // @[Core.scala 55:21]
  wire [31:0] mem_io_out_bits_aluOut; // @[Core.scala 55:21]
  wire [31:0] mem_io_out_bits_pcNext4; // @[Core.scala 55:21]
  wire [2:0] mem_io_out_bits_csrOp; // @[Core.scala 55:21]
  wire  mem_io_out_bits_csrWrEn; // @[Core.scala 55:21]
  wire [31:0] mem_io_out_bits_csrWrData; // @[Core.scala 55:21]
  wire [11:0] mem_io_out_bits_csrAddr; // @[Core.scala 55:21]
  wire  mem_io_out_bits_instState_commit; // @[Core.scala 55:21]
  wire [31:0] mem_io_out_bits_instState_pc; // @[Core.scala 55:21]
  wire [31:0] mem_io_out_bits_instState_inst; // @[Core.scala 55:21]
  wire  mem_io_ram_req_ready; // @[Core.scala 55:21]
  wire  mem_io_ram_req_valid; // @[Core.scala 55:21]
  wire [2:0] mem_io_ram_req_bits_opcode; // @[Core.scala 55:21]
  wire [31:0] mem_io_ram_req_bits_address; // @[Core.scala 55:21]
  wire [3:0] mem_io_ram_req_bits_mask; // @[Core.scala 55:21]
  wire [31:0] mem_io_ram_req_bits_data; // @[Core.scala 55:21]
  wire  mem_io_ram_resp_valid; // @[Core.scala 55:21]
  wire [31:0] mem_io_ram_resp_bits_data; // @[Core.scala 55:21]
  wire [31:0] mem_io_lsuData; // @[Core.scala 55:21]
  wire  mem_io_lsuOK; // @[Core.scala 55:21]
  wire [4:0] mem_io_hazard_rd; // @[Core.scala 55:21]
  wire [31:0] mem_io_hazard_rdVal; // @[Core.scala 55:21]
  wire  mem_io_hazard_regWrEn; // @[Core.scala 55:21]
  wire  mem_io_ctrl_flush; // @[Core.scala 55:21]
  wire  mem_io_excp_valid; // @[Core.scala 55:21]
  wire  mem_io_excp_bits_isMret; // @[Core.scala 55:21]
  wire  mem_io_excp_bits_isSret; // @[Core.scala 55:21]
  wire [30:0] mem_io_excp_bits_excCause; // @[Core.scala 55:21]
  wire [31:0] mem_io_excp_bits_excPc; // @[Core.scala 55:21]
  wire  mem_io_csrBusy; // @[Core.scala 55:21]
  wire [1:0] mem_io_csrMode; // @[Core.scala 55:21]
  wire  wb_clock; // @[Core.scala 61:20]
  wire  wb_reset; // @[Core.scala 61:20]
  wire  wb_io_in_ready; // @[Core.scala 61:20]
  wire  wb_io_in_valid; // @[Core.scala 61:20]
  wire [1:0] wb_io_in_bits_resultSrc; // @[Core.scala 61:20]
  wire  wb_io_in_bits_regWrEn; // @[Core.scala 61:20]
  wire [31:0] wb_io_in_bits_aluOut; // @[Core.scala 61:20]
  wire [31:0] wb_io_in_bits_pcNext4; // @[Core.scala 61:20]
  wire [2:0] wb_io_in_bits_csrOp; // @[Core.scala 61:20]
  wire  wb_io_in_bits_csrWrEn; // @[Core.scala 61:20]
  wire [31:0] wb_io_in_bits_csrWrData; // @[Core.scala 61:20]
  wire [11:0] wb_io_in_bits_csrAddr; // @[Core.scala 61:20]
  wire  wb_io_in_bits_instState_commit; // @[Core.scala 61:20]
  wire [31:0] wb_io_in_bits_instState_pc; // @[Core.scala 61:20]
  wire [31:0] wb_io_in_bits_instState_inst; // @[Core.scala 61:20]
  wire  wb_io_instState_commit; // @[Core.scala 61:20]
  wire [31:0] wb_io_instState_pc; // @[Core.scala 61:20]
  wire [31:0] wb_io_instState_inst; // @[Core.scala 61:20]
  wire [4:0] wb_io_hazard_rd; // @[Core.scala 61:20]
  wire [31:0] wb_io_hazard_rdVal; // @[Core.scala 61:20]
  wire  wb_io_hazard_regWrEn; // @[Core.scala 61:20]
  wire [4:0] wb_io_regfile_rd; // @[Core.scala 61:20]
  wire  wb_io_regfile_regWrEn; // @[Core.scala 61:20]
  wire [31:0] wb_io_regfile_regWrData; // @[Core.scala 61:20]
  wire [2:0] wb_io_csrWrite_op; // @[Core.scala 61:20]
  wire [11:0] wb_io_csrWrite_addr; // @[Core.scala 61:20]
  wire [31:0] wb_io_csrWrite_data; // @[Core.scala 61:20]
  wire  wb_io_csrWrite_retired; // @[Core.scala 61:20]
  wire [31:0] wb_io_lsuData; // @[Core.scala 61:20]
  wire  wb_io_lsuOK; // @[Core.scala 61:20]
  wire  pipelineCtrl_io_in_brTaken; // @[Core.scala 68:30]
  wire  pipelineCtrl_io_in_excpValid; // @[Core.scala 68:30]
  wire  pipelineCtrl_io_out_decode_flush; // @[Core.scala 68:30]
  wire  pipelineCtrl_io_out_execute_flush; // @[Core.scala 68:30]
  wire  pipelineCtrl_io_out_memory_flush; // @[Core.scala 68:30]
  wire [4:0] hazardU_io_in_decode_rs1; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_decode_rs2; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_execute_rs1; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_execute_rs2; // @[Core.scala 78:25]
  wire [1:0] hazardU_io_in_execute_resultSrc; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_execute_rd; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_memory_rd; // @[Core.scala 78:25]
  wire [31:0] hazardU_io_in_memory_rdVal; // @[Core.scala 78:25]
  wire  hazardU_io_in_memory_regWrEn; // @[Core.scala 78:25]
  wire [4:0] hazardU_io_in_writeback_rd; // @[Core.scala 78:25]
  wire [31:0] hazardU_io_in_writeback_rdVal; // @[Core.scala 78:25]
  wire  hazardU_io_in_writeback_regWrEn; // @[Core.scala 78:25]
  wire [1:0] hazardU_io_out_execute_aluSrc1; // @[Core.scala 78:25]
  wire [1:0] hazardU_io_out_execute_aluSrc2; // @[Core.scala 78:25]
  wire [31:0] hazardU_io_out_execute_rdValM; // @[Core.scala 78:25]
  wire [31:0] hazardU_io_out_execute_rdValW; // @[Core.scala 78:25]
  wire  hazardU_io_out_decode_stall; // @[Core.scala 78:25]
  wire  regFile_clock; // @[Core.scala 87:25]
  wire  regFile_reset; // @[Core.scala 87:25]
  wire [4:0] regFile_io_r_0_addr; // @[Core.scala 87:25]
  wire [31:0] regFile_io_r_0_data; // @[Core.scala 87:25]
  wire [4:0] regFile_io_r_1_addr; // @[Core.scala 87:25]
  wire [31:0] regFile_io_r_1_data; // @[Core.scala 87:25]
  wire [4:0] regFile_io_w_0_addr; // @[Core.scala 87:25]
  wire  regFile_io_w_0_en; // @[Core.scala 87:25]
  wire [31:0] regFile_io_w_0_data; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_0; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_1; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_2; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_3; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_4; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_5; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_6; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_7; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_8; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_9; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_10; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_11; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_12; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_13; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_14; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_15; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_16; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_17; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_18; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_19; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_20; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_21; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_22; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_23; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_24; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_25; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_26; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_27; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_28; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_29; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_30; // @[Core.scala 87:25]
  wire [31:0] regFile_io_state_regState_31; // @[Core.scala 87:25]
  wire  csrFile_clock; // @[Core.scala 99:25]
  wire  csrFile_reset; // @[Core.scala 99:25]
  wire [2:0] csrFile_io_read_op; // @[Core.scala 99:25]
  wire  csrFile_io_read_valid; // @[Core.scala 99:25]
  wire [11:0] csrFile_io_read_addr; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_read_data; // @[Core.scala 99:25]
  wire [2:0] csrFile_io_write_op; // @[Core.scala 99:25]
  wire [11:0] csrFile_io_write_addr; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_write_data; // @[Core.scala 99:25]
  wire  csrFile_io_write_retired; // @[Core.scala 99:25]
  wire  csrFile_io_except_valid; // @[Core.scala 99:25]
  wire  csrFile_io_except_bits_isMret; // @[Core.scala 99:25]
  wire  csrFile_io_except_bits_isSret; // @[Core.scala 99:25]
  wire [30:0] csrFile_io_except_bits_excCause; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_except_bits_excPc; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_except_bits_excValue; // @[Core.scala 99:25]
  wire [1:0] csrFile_io_mode; // @[Core.scala 99:25]
  wire  csrFile_io_busy; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_mepc; // @[Core.scala 99:25]
  wire [31:0] csrFile_io_trapVec; // @[Core.scala 99:25]
  wire  busCrossBar_clock; // @[Core.scala 167:29]
  wire  busCrossBar_reset; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_in_0_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_in_0_valid; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_masterFace_in_0_bits_address; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_in_1_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_in_1_valid; // @[Core.scala 167:29]
  wire [2:0] busCrossBar_io_masterFace_in_1_bits_opcode; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_masterFace_in_1_bits_address; // @[Core.scala 167:29]
  wire [3:0] busCrossBar_io_masterFace_in_1_bits_mask; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_masterFace_in_1_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_masterFace_out_0_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_masterFace_out_1_valid; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_masterFace_out_1_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_in_0_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_in_0_valid; // @[Core.scala 167:29]
  wire [2:0] busCrossBar_io_slaveFace_in_0_bits_opcode; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_in_0_bits_address; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_in_0_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_in_1_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_in_1_valid; // @[Core.scala 167:29]
  wire [2:0] busCrossBar_io_slaveFace_in_1_bits_opcode; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_in_1_bits_address; // @[Core.scala 167:29]
  wire [3:0] busCrossBar_io_slaveFace_in_1_bits_mask; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_in_1_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_out_0_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_out_0_valid; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_out_0_bits_data; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_out_1_ready; // @[Core.scala 167:29]
  wire  busCrossBar_io_slaveFace_out_1_valid; // @[Core.scala 167:29]
  wire [31:0] busCrossBar_io_slaveFace_out_1_bits_data; // @[Core.scala 167:29]
  wire  rom_clock; // @[Core.scala 176:21]
  wire  rom_reset; // @[Core.scala 176:21]
  wire  rom_wen; // @[Core.scala 176:21]
  wire [31:0] rom_waddr; // @[Core.scala 176:21]
  wire [31:0] rom_wdata; // @[Core.scala 176:21]
  wire [3:0] rom_wmask; // @[Core.scala 176:21]
  wire [31:0] rom_raddr; // @[Core.scala 176:21]
  wire [31:0] rom_rdata; // @[Core.scala 176:21]
  wire  ram_clock; // @[Core.scala 207:21]
  wire  ram_reset; // @[Core.scala 207:21]
  wire  ram_wen; // @[Core.scala 207:21]
  wire [31:0] ram_waddr; // @[Core.scala 207:21]
  wire [31:0] ram_wdata; // @[Core.scala 207:21]
  wire [3:0] ram_wmask; // @[Core.scala 207:21]
  wire [31:0] ram_raddr; // @[Core.scala 207:21]
  wire [31:0] ram_rdata; // @[Core.scala 207:21]
  reg  ife_io_in_start_REG; // @[Core.scala 38:31]
  reg  io_out_state_instState_REG_commit; // @[Core.scala 111:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core.scala 111:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core.scala 111:38]
  wire  _romReqReg_T = busCrossBar_io_slaveFace_in_0_ready & busCrossBar_io_slaveFace_in_0_valid; // @[Decoupled.scala 51:35]
  reg [2:0] romReqReg_opcode; // @[Reg.scala 19:16]
  reg [31:0] romReqReg_address; // @[Reg.scala 19:16]
  reg [31:0] romReqReg_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_0 = _romReqReg_T ? busCrossBar_io_slaveFace_in_0_bits_opcode : romReqReg_opcode; // @[Reg.scala 19:16 20:{18,22}]
  reg  romBusy; // @[Reg.scala 35:20]
  wire  _GEN_8 = _romReqReg_T | romBusy; // @[Reg.scala 36:18 35:20 36:22]
  wire  _T = busCrossBar_io_slaveFace_out_0_ready & busCrossBar_io_slaveFace_out_0_valid; // @[Decoupled.scala 51:35]
  wire  _ramReqReg_T = busCrossBar_io_slaveFace_in_1_ready & busCrossBar_io_slaveFace_in_1_valid; // @[Decoupled.scala 51:35]
  reg [2:0] ramReqReg_opcode; // @[Reg.scala 19:16]
  reg [31:0] ramReqReg_address; // @[Reg.scala 19:16]
  reg [3:0] ramReqReg_mask; // @[Reg.scala 19:16]
  reg [31:0] ramReqReg_data; // @[Reg.scala 19:16]
  wire [2:0] _GEN_10 = _ramReqReg_T ? busCrossBar_io_slaveFace_in_1_bits_opcode : ramReqReg_opcode; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_14 = _ramReqReg_T ? busCrossBar_io_slaveFace_in_1_bits_address : ramReqReg_address; // @[Reg.scala 19:16 20:{18,22}]
  reg  ramBusy; // @[Reg.scala 35:20]
  wire  _GEN_18 = _ramReqReg_T | ramBusy; // @[Reg.scala 36:18 35:20 36:22]
  wire  _T_1 = busCrossBar_io_slaveFace_out_1_ready & busCrossBar_io_slaveFace_out_1_valid; // @[Decoupled.scala 51:35]
  Fetch ife ( // @[Core.scala 37:21]
    .clock(ife_clock),
    .reset(ife_reset),
    .io_in_start(ife_io_in_start),
    .io_in_execute_ready(ife_io_in_execute_ready),
    .io_in_execute_bits_brTaken(ife_io_in_execute_bits_brTaken),
    .io_in_execute_bits_targetAddr(ife_io_in_execute_bits_targetAddr),
    .io_out_ready(ife_io_out_ready),
    .io_out_valid(ife_io_out_valid),
    .io_out_bits_pcNext4(ife_io_out_bits_pcNext4),
    .io_out_bits_instState_commit(ife_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(ife_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(ife_io_out_bits_instState_inst),
    .io_rom_req_ready(ife_io_rom_req_ready),
    .io_rom_req_valid(ife_io_rom_req_valid),
    .io_rom_req_bits_address(ife_io_rom_req_bits_address),
    .io_rom_resp_ready(ife_io_rom_resp_ready),
    .io_rom_resp_valid(ife_io_rom_resp_valid),
    .io_rom_resp_bits_data(ife_io_rom_resp_bits_data),
    .io_trapVec(ife_io_trapVec),
    .io_mepc(ife_io_mepc),
    .io_excp_valid(ife_io_excp_valid),
    .io_excp_bits_isMret(ife_io_excp_bits_isMret)
  );
  Decode dec ( // @[Core.scala 45:21]
    .clock(dec_clock),
    .reset(dec_reset),
    .io_in_ready(dec_io_in_ready),
    .io_in_valid(dec_io_in_valid),
    .io_in_bits_pcNext4(dec_io_in_bits_pcNext4),
    .io_in_bits_instState_commit(dec_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(dec_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(dec_io_in_bits_instState_inst),
    .io_out_ready(dec_io_out_ready),
    .io_out_valid(dec_io_out_valid),
    .io_out_bits_isBranch(dec_io_out_bits_isBranch),
    .io_out_bits_isJump(dec_io_out_bits_isJump),
    .io_out_bits_resultSrc(dec_io_out_bits_resultSrc),
    .io_out_bits_lsuOp(dec_io_out_bits_lsuOp),
    .io_out_bits_aluOpSel(dec_io_out_bits_aluOpSel),
    .io_out_bits_immSign(dec_io_out_bits_immSign),
    .io_out_bits_regWrEn(dec_io_out_bits_regWrEn),
    .io_out_bits_pcAddReg(dec_io_out_bits_pcAddReg),
    .io_out_bits_pcNext4(dec_io_out_bits_pcNext4),
    .io_out_bits_aluIn1(dec_io_out_bits_aluIn1),
    .io_out_bits_aluIn2(dec_io_out_bits_aluIn2),
    .io_out_bits_aluIn1IsReg(dec_io_out_bits_aluIn1IsReg),
    .io_out_bits_aluIn2IsReg(dec_io_out_bits_aluIn2IsReg),
    .io_out_bits_imm(dec_io_out_bits_imm),
    .io_out_bits_data2(dec_io_out_bits_data2),
    .io_out_bits_excType(dec_io_out_bits_excType),
    .io_out_bits_csrOp(dec_io_out_bits_csrOp),
    .io_out_bits_instState_commit(dec_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(dec_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(dec_io_out_bits_instState_inst),
    .io_hazard_out_rs1(dec_io_hazard_out_rs1),
    .io_hazard_out_rs2(dec_io_hazard_out_rs2),
    .io_hazard_in_stall(dec_io_hazard_in_stall),
    .io_regfile_rs1(dec_io_regfile_rs1),
    .io_regfile_rs2(dec_io_regfile_rs2),
    .io_regfile_rdata1(dec_io_regfile_rdata1),
    .io_regfile_rdata2(dec_io_regfile_rdata2),
    .io_ctrl_flush(dec_io_ctrl_flush)
  );
  Execute exe ( // @[Core.scala 50:21]
    .clock(exe_clock),
    .reset(exe_reset),
    .io_in_ready(exe_io_in_ready),
    .io_in_valid(exe_io_in_valid),
    .io_in_bits_isBranch(exe_io_in_bits_isBranch),
    .io_in_bits_isJump(exe_io_in_bits_isJump),
    .io_in_bits_resultSrc(exe_io_in_bits_resultSrc),
    .io_in_bits_lsuOp(exe_io_in_bits_lsuOp),
    .io_in_bits_aluOpSel(exe_io_in_bits_aluOpSel),
    .io_in_bits_immSign(exe_io_in_bits_immSign),
    .io_in_bits_regWrEn(exe_io_in_bits_regWrEn),
    .io_in_bits_pcAddReg(exe_io_in_bits_pcAddReg),
    .io_in_bits_pcNext4(exe_io_in_bits_pcNext4),
    .io_in_bits_aluIn1(exe_io_in_bits_aluIn1),
    .io_in_bits_aluIn2(exe_io_in_bits_aluIn2),
    .io_in_bits_aluIn1IsReg(exe_io_in_bits_aluIn1IsReg),
    .io_in_bits_aluIn2IsReg(exe_io_in_bits_aluIn2IsReg),
    .io_in_bits_imm(exe_io_in_bits_imm),
    .io_in_bits_data2(exe_io_in_bits_data2),
    .io_in_bits_excType(exe_io_in_bits_excType),
    .io_in_bits_csrOp(exe_io_in_bits_csrOp),
    .io_in_bits_instState_commit(exe_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(exe_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(exe_io_in_bits_instState_inst),
    .io_out_memory_ready(exe_io_out_memory_ready),
    .io_out_memory_valid(exe_io_out_memory_valid),
    .io_out_memory_bits_resultSrc(exe_io_out_memory_bits_resultSrc),
    .io_out_memory_bits_lsuOp(exe_io_out_memory_bits_lsuOp),
    .io_out_memory_bits_regWrEn(exe_io_out_memory_bits_regWrEn),
    .io_out_memory_bits_aluOut(exe_io_out_memory_bits_aluOut),
    .io_out_memory_bits_data2(exe_io_out_memory_bits_data2),
    .io_out_memory_bits_pcNext4(exe_io_out_memory_bits_pcNext4),
    .io_out_memory_bits_csrOp(exe_io_out_memory_bits_csrOp),
    .io_out_memory_bits_csrWrEn(exe_io_out_memory_bits_csrWrEn),
    .io_out_memory_bits_csrValid(exe_io_out_memory_bits_csrValid),
    .io_out_memory_bits_csrWrData(exe_io_out_memory_bits_csrWrData),
    .io_out_memory_bits_csrAddr(exe_io_out_memory_bits_csrAddr),
    .io_out_memory_bits_excType(exe_io_out_memory_bits_excType),
    .io_out_memory_bits_instState_commit(exe_io_out_memory_bits_instState_commit),
    .io_out_memory_bits_instState_pc(exe_io_out_memory_bits_instState_pc),
    .io_out_memory_bits_instState_inst(exe_io_out_memory_bits_instState_inst),
    .io_out_fetch_ready(exe_io_out_fetch_ready),
    .io_out_fetch_bits_brTaken(exe_io_out_fetch_bits_brTaken),
    .io_out_fetch_bits_targetAddr(exe_io_out_fetch_bits_targetAddr),
    .io_hazard_out_rs1(exe_io_hazard_out_rs1),
    .io_hazard_out_rs2(exe_io_hazard_out_rs2),
    .io_hazard_out_resultSrc(exe_io_hazard_out_resultSrc),
    .io_hazard_out_rd(exe_io_hazard_out_rd),
    .io_hazard_in_aluSrc1(exe_io_hazard_in_aluSrc1),
    .io_hazard_in_aluSrc2(exe_io_hazard_in_aluSrc2),
    .io_hazard_in_rdValM(exe_io_hazard_in_rdValM),
    .io_hazard_in_rdValW(exe_io_hazard_in_rdValW),
    .io_ctrl_flush(exe_io_ctrl_flush),
    .io_csrRead_op(exe_io_csrRead_op),
    .io_csrRead_valid(exe_io_csrRead_valid),
    .io_csrRead_addr(exe_io_csrRead_addr)
  );
  Mem mem ( // @[Core.scala 55:21]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_in_ready(mem_io_in_ready),
    .io_in_valid(mem_io_in_valid),
    .io_in_bits_resultSrc(mem_io_in_bits_resultSrc),
    .io_in_bits_lsuOp(mem_io_in_bits_lsuOp),
    .io_in_bits_regWrEn(mem_io_in_bits_regWrEn),
    .io_in_bits_aluOut(mem_io_in_bits_aluOut),
    .io_in_bits_data2(mem_io_in_bits_data2),
    .io_in_bits_pcNext4(mem_io_in_bits_pcNext4),
    .io_in_bits_csrOp(mem_io_in_bits_csrOp),
    .io_in_bits_csrWrEn(mem_io_in_bits_csrWrEn),
    .io_in_bits_csrValid(mem_io_in_bits_csrValid),
    .io_in_bits_csrWrData(mem_io_in_bits_csrWrData),
    .io_in_bits_csrAddr(mem_io_in_bits_csrAddr),
    .io_in_bits_excType(mem_io_in_bits_excType),
    .io_in_bits_instState_commit(mem_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(mem_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(mem_io_in_bits_instState_inst),
    .io_out_ready(mem_io_out_ready),
    .io_out_valid(mem_io_out_valid),
    .io_out_bits_resultSrc(mem_io_out_bits_resultSrc),
    .io_out_bits_regWrEn(mem_io_out_bits_regWrEn),
    .io_out_bits_aluOut(mem_io_out_bits_aluOut),
    .io_out_bits_pcNext4(mem_io_out_bits_pcNext4),
    .io_out_bits_csrOp(mem_io_out_bits_csrOp),
    .io_out_bits_csrWrEn(mem_io_out_bits_csrWrEn),
    .io_out_bits_csrWrData(mem_io_out_bits_csrWrData),
    .io_out_bits_csrAddr(mem_io_out_bits_csrAddr),
    .io_out_bits_instState_commit(mem_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(mem_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(mem_io_out_bits_instState_inst),
    .io_ram_req_ready(mem_io_ram_req_ready),
    .io_ram_req_valid(mem_io_ram_req_valid),
    .io_ram_req_bits_opcode(mem_io_ram_req_bits_opcode),
    .io_ram_req_bits_address(mem_io_ram_req_bits_address),
    .io_ram_req_bits_mask(mem_io_ram_req_bits_mask),
    .io_ram_req_bits_data(mem_io_ram_req_bits_data),
    .io_ram_resp_valid(mem_io_ram_resp_valid),
    .io_ram_resp_bits_data(mem_io_ram_resp_bits_data),
    .io_lsuData(mem_io_lsuData),
    .io_lsuOK(mem_io_lsuOK),
    .io_hazard_rd(mem_io_hazard_rd),
    .io_hazard_rdVal(mem_io_hazard_rdVal),
    .io_hazard_regWrEn(mem_io_hazard_regWrEn),
    .io_ctrl_flush(mem_io_ctrl_flush),
    .io_excp_valid(mem_io_excp_valid),
    .io_excp_bits_isMret(mem_io_excp_bits_isMret),
    .io_excp_bits_isSret(mem_io_excp_bits_isSret),
    .io_excp_bits_excCause(mem_io_excp_bits_excCause),
    .io_excp_bits_excPc(mem_io_excp_bits_excPc),
    .io_csrBusy(mem_io_csrBusy),
    .io_csrMode(mem_io_csrMode)
  );
  WriteBack wb ( // @[Core.scala 61:20]
    .clock(wb_clock),
    .reset(wb_reset),
    .io_in_ready(wb_io_in_ready),
    .io_in_valid(wb_io_in_valid),
    .io_in_bits_resultSrc(wb_io_in_bits_resultSrc),
    .io_in_bits_regWrEn(wb_io_in_bits_regWrEn),
    .io_in_bits_aluOut(wb_io_in_bits_aluOut),
    .io_in_bits_pcNext4(wb_io_in_bits_pcNext4),
    .io_in_bits_csrOp(wb_io_in_bits_csrOp),
    .io_in_bits_csrWrEn(wb_io_in_bits_csrWrEn),
    .io_in_bits_csrWrData(wb_io_in_bits_csrWrData),
    .io_in_bits_csrAddr(wb_io_in_bits_csrAddr),
    .io_in_bits_instState_commit(wb_io_in_bits_instState_commit),
    .io_in_bits_instState_pc(wb_io_in_bits_instState_pc),
    .io_in_bits_instState_inst(wb_io_in_bits_instState_inst),
    .io_instState_commit(wb_io_instState_commit),
    .io_instState_pc(wb_io_instState_pc),
    .io_instState_inst(wb_io_instState_inst),
    .io_hazard_rd(wb_io_hazard_rd),
    .io_hazard_rdVal(wb_io_hazard_rdVal),
    .io_hazard_regWrEn(wb_io_hazard_regWrEn),
    .io_regfile_rd(wb_io_regfile_rd),
    .io_regfile_regWrEn(wb_io_regfile_regWrEn),
    .io_regfile_regWrData(wb_io_regfile_regWrData),
    .io_csrWrite_op(wb_io_csrWrite_op),
    .io_csrWrite_addr(wb_io_csrWrite_addr),
    .io_csrWrite_data(wb_io_csrWrite_data),
    .io_csrWrite_retired(wb_io_csrWrite_retired),
    .io_lsuData(wb_io_lsuData),
    .io_lsuOK(wb_io_lsuOK)
  );
  PipelineCtrl pipelineCtrl ( // @[Core.scala 68:30]
    .io_in_brTaken(pipelineCtrl_io_in_brTaken),
    .io_in_excpValid(pipelineCtrl_io_in_excpValid),
    .io_out_decode_flush(pipelineCtrl_io_out_decode_flush),
    .io_out_execute_flush(pipelineCtrl_io_out_execute_flush),
    .io_out_memory_flush(pipelineCtrl_io_out_memory_flush)
  );
  HazardUnit hazardU ( // @[Core.scala 78:25]
    .io_in_decode_rs1(hazardU_io_in_decode_rs1),
    .io_in_decode_rs2(hazardU_io_in_decode_rs2),
    .io_in_execute_rs1(hazardU_io_in_execute_rs1),
    .io_in_execute_rs2(hazardU_io_in_execute_rs2),
    .io_in_execute_resultSrc(hazardU_io_in_execute_resultSrc),
    .io_in_execute_rd(hazardU_io_in_execute_rd),
    .io_in_memory_rd(hazardU_io_in_memory_rd),
    .io_in_memory_rdVal(hazardU_io_in_memory_rdVal),
    .io_in_memory_regWrEn(hazardU_io_in_memory_regWrEn),
    .io_in_writeback_rd(hazardU_io_in_writeback_rd),
    .io_in_writeback_rdVal(hazardU_io_in_writeback_rdVal),
    .io_in_writeback_regWrEn(hazardU_io_in_writeback_regWrEn),
    .io_out_execute_aluSrc1(hazardU_io_out_execute_aluSrc1),
    .io_out_execute_aluSrc2(hazardU_io_out_execute_aluSrc2),
    .io_out_execute_rdValM(hazardU_io_out_execute_rdValM),
    .io_out_execute_rdValW(hazardU_io_out_execute_rdValW),
    .io_out_decode_stall(hazardU_io_out_decode_stall)
  );
  RegFile regFile ( // @[Core.scala 87:25]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_r_0_addr(regFile_io_r_0_addr),
    .io_r_0_data(regFile_io_r_0_data),
    .io_r_1_addr(regFile_io_r_1_addr),
    .io_r_1_data(regFile_io_r_1_data),
    .io_w_0_addr(regFile_io_w_0_addr),
    .io_w_0_en(regFile_io_w_0_en),
    .io_w_0_data(regFile_io_w_0_data),
    .io_state_regState_0(regFile_io_state_regState_0),
    .io_state_regState_1(regFile_io_state_regState_1),
    .io_state_regState_2(regFile_io_state_regState_2),
    .io_state_regState_3(regFile_io_state_regState_3),
    .io_state_regState_4(regFile_io_state_regState_4),
    .io_state_regState_5(regFile_io_state_regState_5),
    .io_state_regState_6(regFile_io_state_regState_6),
    .io_state_regState_7(regFile_io_state_regState_7),
    .io_state_regState_8(regFile_io_state_regState_8),
    .io_state_regState_9(regFile_io_state_regState_9),
    .io_state_regState_10(regFile_io_state_regState_10),
    .io_state_regState_11(regFile_io_state_regState_11),
    .io_state_regState_12(regFile_io_state_regState_12),
    .io_state_regState_13(regFile_io_state_regState_13),
    .io_state_regState_14(regFile_io_state_regState_14),
    .io_state_regState_15(regFile_io_state_regState_15),
    .io_state_regState_16(regFile_io_state_regState_16),
    .io_state_regState_17(regFile_io_state_regState_17),
    .io_state_regState_18(regFile_io_state_regState_18),
    .io_state_regState_19(regFile_io_state_regState_19),
    .io_state_regState_20(regFile_io_state_regState_20),
    .io_state_regState_21(regFile_io_state_regState_21),
    .io_state_regState_22(regFile_io_state_regState_22),
    .io_state_regState_23(regFile_io_state_regState_23),
    .io_state_regState_24(regFile_io_state_regState_24),
    .io_state_regState_25(regFile_io_state_regState_25),
    .io_state_regState_26(regFile_io_state_regState_26),
    .io_state_regState_27(regFile_io_state_regState_27),
    .io_state_regState_28(regFile_io_state_regState_28),
    .io_state_regState_29(regFile_io_state_regState_29),
    .io_state_regState_30(regFile_io_state_regState_30),
    .io_state_regState_31(regFile_io_state_regState_31)
  );
  CsrFile csrFile ( // @[Core.scala 99:25]
    .clock(csrFile_clock),
    .reset(csrFile_reset),
    .io_read_op(csrFile_io_read_op),
    .io_read_valid(csrFile_io_read_valid),
    .io_read_addr(csrFile_io_read_addr),
    .io_read_data(csrFile_io_read_data),
    .io_write_op(csrFile_io_write_op),
    .io_write_addr(csrFile_io_write_addr),
    .io_write_data(csrFile_io_write_data),
    .io_write_retired(csrFile_io_write_retired),
    .io_except_valid(csrFile_io_except_valid),
    .io_except_bits_isMret(csrFile_io_except_bits_isMret),
    .io_except_bits_isSret(csrFile_io_except_bits_isSret),
    .io_except_bits_excCause(csrFile_io_except_bits_excCause),
    .io_except_bits_excPc(csrFile_io_except_bits_excPc),
    .io_except_bits_excValue(csrFile_io_except_bits_excValue),
    .io_mode(csrFile_io_mode),
    .io_busy(csrFile_io_busy),
    .io_mepc(csrFile_io_mepc),
    .io_trapVec(csrFile_io_trapVec)
  );
  TLXbar_1 busCrossBar ( // @[Core.scala 167:29]
    .clock(busCrossBar_clock),
    .reset(busCrossBar_reset),
    .io_masterFace_in_0_ready(busCrossBar_io_masterFace_in_0_ready),
    .io_masterFace_in_0_valid(busCrossBar_io_masterFace_in_0_valid),
    .io_masterFace_in_0_bits_address(busCrossBar_io_masterFace_in_0_bits_address),
    .io_masterFace_in_1_ready(busCrossBar_io_masterFace_in_1_ready),
    .io_masterFace_in_1_valid(busCrossBar_io_masterFace_in_1_valid),
    .io_masterFace_in_1_bits_opcode(busCrossBar_io_masterFace_in_1_bits_opcode),
    .io_masterFace_in_1_bits_address(busCrossBar_io_masterFace_in_1_bits_address),
    .io_masterFace_in_1_bits_mask(busCrossBar_io_masterFace_in_1_bits_mask),
    .io_masterFace_in_1_bits_data(busCrossBar_io_masterFace_in_1_bits_data),
    .io_masterFace_out_0_valid(busCrossBar_io_masterFace_out_0_valid),
    .io_masterFace_out_0_bits_data(busCrossBar_io_masterFace_out_0_bits_data),
    .io_masterFace_out_1_valid(busCrossBar_io_masterFace_out_1_valid),
    .io_masterFace_out_1_bits_data(busCrossBar_io_masterFace_out_1_bits_data),
    .io_slaveFace_in_0_ready(busCrossBar_io_slaveFace_in_0_ready),
    .io_slaveFace_in_0_valid(busCrossBar_io_slaveFace_in_0_valid),
    .io_slaveFace_in_0_bits_opcode(busCrossBar_io_slaveFace_in_0_bits_opcode),
    .io_slaveFace_in_0_bits_address(busCrossBar_io_slaveFace_in_0_bits_address),
    .io_slaveFace_in_0_bits_data(busCrossBar_io_slaveFace_in_0_bits_data),
    .io_slaveFace_in_1_ready(busCrossBar_io_slaveFace_in_1_ready),
    .io_slaveFace_in_1_valid(busCrossBar_io_slaveFace_in_1_valid),
    .io_slaveFace_in_1_bits_opcode(busCrossBar_io_slaveFace_in_1_bits_opcode),
    .io_slaveFace_in_1_bits_address(busCrossBar_io_slaveFace_in_1_bits_address),
    .io_slaveFace_in_1_bits_mask(busCrossBar_io_slaveFace_in_1_bits_mask),
    .io_slaveFace_in_1_bits_data(busCrossBar_io_slaveFace_in_1_bits_data),
    .io_slaveFace_out_0_ready(busCrossBar_io_slaveFace_out_0_ready),
    .io_slaveFace_out_0_valid(busCrossBar_io_slaveFace_out_0_valid),
    .io_slaveFace_out_0_bits_data(busCrossBar_io_slaveFace_out_0_bits_data),
    .io_slaveFace_out_1_ready(busCrossBar_io_slaveFace_out_1_ready),
    .io_slaveFace_out_1_valid(busCrossBar_io_slaveFace_out_1_valid),
    .io_slaveFace_out_1_bits_data(busCrossBar_io_slaveFace_out_1_bits_data)
  );
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) rom ( // @[Core.scala 176:21]
    .clock(rom_clock),
    .reset(rom_reset),
    .wen(rom_wen),
    .waddr(rom_waddr),
    .wdata(rom_wdata),
    .wmask(rom_wmask),
    .raddr(rom_raddr),
    .rdata(rom_rdata)
  );
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) ram ( // @[Core.scala 207:21]
    .clock(ram_clock),
    .reset(ram_reset),
    .wen(ram_wen),
    .waddr(ram_waddr),
    .wdata(ram_wdata),
    .wmask(ram_wmask),
    .raddr(ram_raddr),
    .rdata(ram_rdata)
  );
  assign io_out_state_intRegState_regState_0 = regFile_io_state_regState_0; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_1 = regFile_io_state_regState_1; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_2 = regFile_io_state_regState_2; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_3 = regFile_io_state_regState_3; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_4 = regFile_io_state_regState_4; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_5 = regFile_io_state_regState_5; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_6 = regFile_io_state_regState_6; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_7 = regFile_io_state_regState_7; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_8 = regFile_io_state_regState_8; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_9 = regFile_io_state_regState_9; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_10 = regFile_io_state_regState_10; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_11 = regFile_io_state_regState_11; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_12 = regFile_io_state_regState_12; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_13 = regFile_io_state_regState_13; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_14 = regFile_io_state_regState_14; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_15 = regFile_io_state_regState_15; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_16 = regFile_io_state_regState_16; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_17 = regFile_io_state_regState_17; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_18 = regFile_io_state_regState_18; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_19 = regFile_io_state_regState_19; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_20 = regFile_io_state_regState_20; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_21 = regFile_io_state_regState_21; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_22 = regFile_io_state_regState_22; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_23 = regFile_io_state_regState_23; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_24 = regFile_io_state_regState_24; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_25 = regFile_io_state_regState_25; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_26 = regFile_io_state_regState_26; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_27 = regFile_io_state_regState_27; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_28 = regFile_io_state_regState_28; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_29 = regFile_io_state_regState_29; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_30 = regFile_io_state_regState_30; // @[Core.scala 112:30]
  assign io_out_state_intRegState_regState_31 = regFile_io_state_regState_31; // @[Core.scala 112:30]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core.scala 111:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core.scala 111:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core.scala 111:28]
  assign ife_clock = clock;
  assign ife_reset = reset;
  assign ife_io_in_start = ife_io_in_start_REG; // @[Core.scala 38:21]
  assign ife_io_in_execute_bits_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 52:23]
  assign ife_io_in_execute_bits_targetAddr = exe_io_out_fetch_bits_targetAddr; // @[Core.scala 52:23]
  assign ife_io_out_ready = dec_io_in_ready; // @[Core.scala 46:15]
  assign ife_io_rom_req_ready = busCrossBar_io_masterFace_in_0_ready; // @[Core.scala 170:37]
  assign ife_io_rom_resp_valid = busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 171:21]
  assign ife_io_rom_resp_bits_data = busCrossBar_io_masterFace_out_0_bits_data; // @[Core.scala 171:21]
  assign ife_io_trapVec = csrFile_io_trapVec; // @[Core.scala 106:13 33:23]
  assign ife_io_mepc = csrFile_io_mepc; // @[Core.scala 107:10 34:20]
  assign ife_io_excp_valid = mem_io_excp_valid; // @[Core.scala 58:17]
  assign ife_io_excp_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 58:17]
  assign dec_clock = clock;
  assign dec_reset = reset;
  assign dec_io_in_valid = ife_io_out_valid; // @[Core.scala 46:15]
  assign dec_io_in_bits_pcNext4 = ife_io_out_bits_pcNext4; // @[Core.scala 46:15]
  assign dec_io_in_bits_instState_commit = ife_io_out_bits_instState_commit; // @[Core.scala 46:15]
  assign dec_io_in_bits_instState_pc = ife_io_out_bits_instState_pc; // @[Core.scala 46:15]
  assign dec_io_in_bits_instState_inst = ife_io_out_bits_instState_inst; // @[Core.scala 46:15]
  assign dec_io_out_ready = exe_io_in_ready; // @[Core.scala 51:15]
  assign dec_io_hazard_in_stall = hazardU_io_out_decode_stall; // @[Core.scala 31:24 84:14]
  assign dec_io_regfile_rdata1 = regFile_io_r_0_data; // @[Core.scala 92:27]
  assign dec_io_regfile_rdata2 = regFile_io_r_1_data; // @[Core.scala 93:27]
  assign dec_io_ctrl_flush = pipelineCtrl_io_out_decode_flush; // @[Core.scala 72:17]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_in_valid = dec_io_out_valid; // @[Core.scala 51:15]
  assign exe_io_in_bits_isBranch = dec_io_out_bits_isBranch; // @[Core.scala 51:15]
  assign exe_io_in_bits_isJump = dec_io_out_bits_isJump; // @[Core.scala 51:15]
  assign exe_io_in_bits_resultSrc = dec_io_out_bits_resultSrc; // @[Core.scala 51:15]
  assign exe_io_in_bits_lsuOp = dec_io_out_bits_lsuOp; // @[Core.scala 51:15]
  assign exe_io_in_bits_aluOpSel = dec_io_out_bits_aluOpSel; // @[Core.scala 51:15]
  assign exe_io_in_bits_immSign = dec_io_out_bits_immSign; // @[Core.scala 51:15]
  assign exe_io_in_bits_regWrEn = dec_io_out_bits_regWrEn; // @[Core.scala 51:15]
  assign exe_io_in_bits_pcAddReg = dec_io_out_bits_pcAddReg; // @[Core.scala 51:15]
  assign exe_io_in_bits_pcNext4 = dec_io_out_bits_pcNext4; // @[Core.scala 51:15]
  assign exe_io_in_bits_aluIn1 = dec_io_out_bits_aluIn1; // @[Core.scala 51:15]
  assign exe_io_in_bits_aluIn2 = dec_io_out_bits_aluIn2; // @[Core.scala 51:15]
  assign exe_io_in_bits_aluIn1IsReg = dec_io_out_bits_aluIn1IsReg; // @[Core.scala 51:15]
  assign exe_io_in_bits_aluIn2IsReg = dec_io_out_bits_aluIn2IsReg; // @[Core.scala 51:15]
  assign exe_io_in_bits_imm = dec_io_out_bits_imm; // @[Core.scala 51:15]
  assign exe_io_in_bits_data2 = dec_io_out_bits_data2; // @[Core.scala 51:15]
  assign exe_io_in_bits_excType = dec_io_out_bits_excType; // @[Core.scala 51:15]
  assign exe_io_in_bits_csrOp = dec_io_out_bits_csrOp; // @[Core.scala 51:15]
  assign exe_io_in_bits_instState_commit = dec_io_out_bits_instState_commit; // @[Core.scala 51:15]
  assign exe_io_in_bits_instState_pc = dec_io_out_bits_instState_pc; // @[Core.scala 51:15]
  assign exe_io_in_bits_instState_inst = dec_io_out_bits_instState_inst; // @[Core.scala 51:15]
  assign exe_io_out_memory_ready = mem_io_in_ready; // @[Core.scala 56:15]
  assign exe_io_out_fetch_ready = ife_io_in_execute_ready; // @[Core.scala 52:23]
  assign exe_io_hazard_in_aluSrc1 = hazardU_io_out_execute_aluSrc1; // @[Core.scala 83:29]
  assign exe_io_hazard_in_aluSrc2 = hazardU_io_out_execute_aluSrc2; // @[Core.scala 83:29]
  assign exe_io_hazard_in_rdValM = hazardU_io_out_execute_rdValM; // @[Core.scala 83:29]
  assign exe_io_hazard_in_rdValW = hazardU_io_out_execute_rdValW; // @[Core.scala 83:29]
  assign exe_io_ctrl_flush = pipelineCtrl_io_out_execute_flush; // @[Core.scala 73:17]
  assign exe_io_csrRead_valid = csrFile_io_read_valid; // @[Core.scala 102:21]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_in_valid = exe_io_out_memory_valid; // @[Core.scala 56:15]
  assign mem_io_in_bits_resultSrc = exe_io_out_memory_bits_resultSrc; // @[Core.scala 56:15]
  assign mem_io_in_bits_lsuOp = exe_io_out_memory_bits_lsuOp; // @[Core.scala 56:15]
  assign mem_io_in_bits_regWrEn = exe_io_out_memory_bits_regWrEn; // @[Core.scala 56:15]
  assign mem_io_in_bits_aluOut = exe_io_out_memory_bits_aluOut; // @[Core.scala 56:15]
  assign mem_io_in_bits_data2 = exe_io_out_memory_bits_data2; // @[Core.scala 56:15]
  assign mem_io_in_bits_pcNext4 = exe_io_out_memory_bits_pcNext4; // @[Core.scala 56:15]
  assign mem_io_in_bits_csrOp = exe_io_out_memory_bits_csrOp; // @[Core.scala 56:15]
  assign mem_io_in_bits_csrWrEn = exe_io_out_memory_bits_csrWrEn; // @[Core.scala 56:15]
  assign mem_io_in_bits_csrValid = exe_io_out_memory_bits_csrValid; // @[Core.scala 56:15]
  assign mem_io_in_bits_csrWrData = exe_io_out_memory_bits_csrWrData; // @[Core.scala 56:15]
  assign mem_io_in_bits_csrAddr = exe_io_out_memory_bits_csrAddr; // @[Core.scala 56:15]
  assign mem_io_in_bits_excType = exe_io_out_memory_bits_excType; // @[Core.scala 56:15]
  assign mem_io_in_bits_instState_commit = exe_io_out_memory_bits_instState_commit; // @[Core.scala 56:15]
  assign mem_io_in_bits_instState_pc = exe_io_out_memory_bits_instState_pc; // @[Core.scala 56:15]
  assign mem_io_in_bits_instState_inst = exe_io_out_memory_bits_instState_inst; // @[Core.scala 56:15]
  assign mem_io_out_ready = wb_io_in_ready; // @[Core.scala 62:14]
  assign mem_io_ram_req_ready = busCrossBar_io_masterFace_in_1_ready; // @[Core.scala 173:37]
  assign mem_io_ram_resp_valid = busCrossBar_io_masterFace_out_1_valid; // @[Core.scala 174:21]
  assign mem_io_ram_resp_bits_data = busCrossBar_io_masterFace_out_1_bits_data; // @[Core.scala 174:21]
  assign mem_io_ctrl_flush = pipelineCtrl_io_out_memory_flush; // @[Core.scala 74:17]
  assign mem_io_csrBusy = csrFile_io_busy; // @[Core.scala 104:20]
  assign mem_io_csrMode = csrFile_io_mode; // @[Core.scala 105:20]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_in_valid = mem_io_out_valid; // @[Core.scala 62:14]
  assign wb_io_in_bits_resultSrc = mem_io_out_bits_resultSrc; // @[Core.scala 62:14]
  assign wb_io_in_bits_regWrEn = mem_io_out_bits_regWrEn; // @[Core.scala 62:14]
  assign wb_io_in_bits_aluOut = mem_io_out_bits_aluOut; // @[Core.scala 62:14]
  assign wb_io_in_bits_pcNext4 = mem_io_out_bits_pcNext4; // @[Core.scala 62:14]
  assign wb_io_in_bits_csrOp = mem_io_out_bits_csrOp; // @[Core.scala 62:14]
  assign wb_io_in_bits_csrWrEn = mem_io_out_bits_csrWrEn; // @[Core.scala 62:14]
  assign wb_io_in_bits_csrWrData = mem_io_out_bits_csrWrData; // @[Core.scala 62:14]
  assign wb_io_in_bits_csrAddr = mem_io_out_bits_csrAddr; // @[Core.scala 62:14]
  assign wb_io_in_bits_instState_commit = mem_io_out_bits_instState_commit; // @[Core.scala 62:14]
  assign wb_io_in_bits_instState_pc = mem_io_out_bits_instState_pc; // @[Core.scala 62:14]
  assign wb_io_in_bits_instState_inst = mem_io_out_bits_instState_inst; // @[Core.scala 62:14]
  assign wb_io_lsuData = mem_io_lsuData; // @[Core.scala 63:19]
  assign wb_io_lsuOK = mem_io_lsuOK; // @[Core.scala 64:17]
  assign pipelineCtrl_io_in_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 70:34]
  assign pipelineCtrl_io_in_excpValid = mem_io_excp_valid; // @[Core.scala 69:34]
  assign hazardU_io_in_decode_rs1 = dec_io_hazard_out_rs1; // @[Core.scala 79:29]
  assign hazardU_io_in_decode_rs2 = dec_io_hazard_out_rs2; // @[Core.scala 79:29]
  assign hazardU_io_in_execute_rs1 = exe_io_hazard_out_rs1; // @[Core.scala 80:29]
  assign hazardU_io_in_execute_rs2 = exe_io_hazard_out_rs2; // @[Core.scala 80:29]
  assign hazardU_io_in_execute_resultSrc = exe_io_hazard_out_resultSrc; // @[Core.scala 80:29]
  assign hazardU_io_in_execute_rd = exe_io_hazard_out_rd; // @[Core.scala 80:29]
  assign hazardU_io_in_memory_rd = mem_io_hazard_rd; // @[Core.scala 81:29]
  assign hazardU_io_in_memory_rdVal = mem_io_hazard_rdVal; // @[Core.scala 81:29]
  assign hazardU_io_in_memory_regWrEn = mem_io_hazard_regWrEn; // @[Core.scala 81:29]
  assign hazardU_io_in_writeback_rd = wb_io_hazard_rd; // @[Core.scala 82:29]
  assign hazardU_io_in_writeback_rdVal = wb_io_hazard_rdVal; // @[Core.scala 82:29]
  assign hazardU_io_in_writeback_regWrEn = wb_io_hazard_regWrEn; // @[Core.scala 82:29]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = dec_io_regfile_rs1; // @[Core.scala 90:26]
  assign regFile_io_r_1_addr = dec_io_regfile_rs2; // @[Core.scala 91:26]
  assign regFile_io_w_0_addr = wb_io_regfile_rd; // @[Core.scala 95:26]
  assign regFile_io_w_0_en = wb_io_regfile_regWrEn; // @[Core.scala 94:24]
  assign regFile_io_w_0_data = wb_io_regfile_regWrData; // @[Core.scala 96:26]
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = exe_io_csrRead_op; // @[Core.scala 102:21]
  assign csrFile_io_read_addr = exe_io_csrRead_addr; // @[Core.scala 102:21]
  assign csrFile_io_write_op = wb_io_csrWrite_op; // @[Core.scala 103:22]
  assign csrFile_io_write_addr = wb_io_csrWrite_addr; // @[Core.scala 103:22]
  assign csrFile_io_write_data = wb_io_csrWrite_data; // @[Core.scala 103:22]
  assign csrFile_io_write_retired = wb_io_csrWrite_retired; // @[Core.scala 103:22]
  assign csrFile_io_except_valid = mem_io_excp_valid; // @[Core.scala 101:23]
  assign csrFile_io_except_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 101:23]
  assign csrFile_io_except_bits_isSret = mem_io_excp_bits_isSret; // @[Core.scala 101:23]
  assign csrFile_io_except_bits_excCause = mem_io_excp_bits_excCause; // @[Core.scala 101:23]
  assign csrFile_io_except_bits_excPc = mem_io_excp_bits_excPc; // @[Core.scala 101:23]
  assign csrFile_io_except_bits_excValue = 32'h0; // @[Core.scala 101:23]
  assign busCrossBar_clock = clock;
  assign busCrossBar_reset = reset;
  assign busCrossBar_io_masterFace_in_0_valid = ife_io_rom_req_valid; // @[Core.scala 170:37]
  assign busCrossBar_io_masterFace_in_0_bits_address = ife_io_rom_req_bits_address; // @[Core.scala 170:37]
  assign busCrossBar_io_masterFace_in_1_valid = mem_io_ram_req_valid; // @[Core.scala 173:37]
  assign busCrossBar_io_masterFace_in_1_bits_opcode = mem_io_ram_req_bits_opcode; // @[Core.scala 173:37]
  assign busCrossBar_io_masterFace_in_1_bits_address = mem_io_ram_req_bits_address; // @[Core.scala 173:37]
  assign busCrossBar_io_masterFace_in_1_bits_mask = mem_io_ram_req_bits_mask; // @[Core.scala 173:37]
  assign busCrossBar_io_masterFace_in_1_bits_data = mem_io_ram_req_bits_data; // @[Core.scala 173:37]
  assign busCrossBar_io_slaveFace_in_0_ready = ~romBusy; // @[Core.scala 196:21]
  assign busCrossBar_io_slaveFace_in_1_ready = ~ramBusy; // @[Core.scala 226:21]
  assign busCrossBar_io_slaveFace_out_0_valid = romBusy; // @[Core.scala 198:19]
  assign busCrossBar_io_slaveFace_out_0_bits_data = rom_rdata; // @[Core.scala 197:23]
  assign busCrossBar_io_slaveFace_out_1_valid = ramBusy; // @[Core.scala 228:19]
  assign busCrossBar_io_slaveFace_out_1_bits_data = ram_rdata; // @[Core.scala 227:23]
  assign rom_clock = clock; // @[Core.scala 177:18]
  assign rom_reset = reset; // @[Core.scala 178:18]
  assign rom_wen = _romReqReg_T & _GEN_0[1]; // @[Core.scala 191:33]
  assign rom_waddr = _romReqReg_T ? busCrossBar_io_slaveFace_in_0_bits_address : romReqReg_address; // @[Core.scala 184:24]
  assign rom_wdata = _romReqReg_T ? busCrossBar_io_slaveFace_in_0_bits_data : romReqReg_data; // @[Core.scala 184:24]
  assign rom_wmask = 4'hf; // @[Core.scala 192:18]
  assign rom_raddr = _romReqReg_T ? busCrossBar_io_slaveFace_in_0_bits_address : romReqReg_address; // @[Core.scala 184:24]
  assign ram_clock = clock; // @[Core.scala 208:18]
  assign ram_reset = reset; // @[Core.scala 209:18]
  assign ram_wen = _ramReqReg_T & _GEN_10[1]; // @[Core.scala 221:31]
  assign ram_waddr = _GEN_14 - 32'h2000; // @[Core.scala 224:39]
  assign ram_wdata = _ramReqReg_T ? busCrossBar_io_slaveFace_in_1_bits_data : ramReqReg_data; // @[Core.scala 215:24]
  assign ram_wmask = _ramReqReg_T ? busCrossBar_io_slaveFace_in_1_bits_mask : ramReqReg_mask; // @[Core.scala 215:24]
  assign ram_raddr = _GEN_14 - 32'h2000; // @[Core.scala 225:39]
  always @(posedge clock) begin
    ife_io_in_start_REG <= io_in_start; // @[Core.scala 38:31]
    io_out_state_instState_REG_commit <= wb_io_instState_commit; // @[Core.scala 111:38]
    io_out_state_instState_REG_pc <= wb_io_instState_pc; // @[Core.scala 111:38]
    io_out_state_instState_REG_inst <= wb_io_instState_inst; // @[Core.scala 111:38]
    if (_romReqReg_T) begin // @[Reg.scala 20:18]
      romReqReg_opcode <= busCrossBar_io_slaveFace_in_0_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_romReqReg_T) begin // @[Reg.scala 20:18]
      romReqReg_address <= busCrossBar_io_slaveFace_in_0_bits_address; // @[Reg.scala 20:22]
    end
    if (_romReqReg_T) begin // @[Reg.scala 20:18]
      romReqReg_data <= busCrossBar_io_slaveFace_in_0_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      romBusy <= 1'h0; // @[Reg.scala 35:20]
    end else if (_T) begin // @[Core.scala 187:24]
      romBusy <= 1'h0; // @[Core.scala 188:17]
    end else begin
      romBusy <= _GEN_8;
    end
    if (_ramReqReg_T) begin // @[Reg.scala 20:18]
      ramReqReg_opcode <= busCrossBar_io_slaveFace_in_1_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_ramReqReg_T) begin // @[Reg.scala 20:18]
      ramReqReg_address <= busCrossBar_io_slaveFace_in_1_bits_address; // @[Reg.scala 20:22]
    end
    if (_ramReqReg_T) begin // @[Reg.scala 20:18]
      ramReqReg_mask <= busCrossBar_io_slaveFace_in_1_bits_mask; // @[Reg.scala 20:22]
    end
    if (_ramReqReg_T) begin // @[Reg.scala 20:18]
      ramReqReg_data <= busCrossBar_io_slaveFace_in_1_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      ramBusy <= 1'h0; // @[Reg.scala 35:20]
    end else if (_T_1) begin // @[Core.scala 217:24]
      ramBusy <= 1'h0; // @[Core.scala 218:17]
    end else begin
      ramBusy <= _GEN_18;
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
  ife_io_in_start_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_out_state_instState_REG_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_out_state_instState_REG_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_out_state_instState_REG_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  romReqReg_opcode = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  romReqReg_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  romReqReg_data = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  romBusy = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ramReqReg_opcode = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  ramReqReg_address = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  ramReqReg_mask = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  ramReqReg_data = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  ramBusy = _RAND_12[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
