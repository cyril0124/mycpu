/* verilator lint_off MULTIDRIVEN */
module Core(
  input         clock,
  input         reset,
  input         io_in_start,
  input wire [63:0]  val,
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
  output [31:0] io_out_state_instState_inst,
  output [31:0] io_out_state_csrState_mcycle,
  output [31:0] io_out_state_csrState_mcycleh
);

reg [63:0] count;
always@(posedge clock) begin
  count <= count + val;
end

assign io_out_state_csrState_mcycle = count > 10 ? 111 : csrFile_csrState_0_mcycle;
// always_comb if(count > 10) io_out_state_csrState_mcycle = count[31:0];

`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ife_clock; // @[Core.scala 56:21]
  wire  ife_reset; // @[Core.scala 56:21]
  wire  ife_io_in_start; // @[Core.scala 56:21]
  wire  ife_io_in_execute_bits_brTaken; // @[Core.scala 56:21]
  wire [31:0] ife_io_in_execute_bits_targetAddr; // @[Core.scala 56:21]
  wire  ife_io_out_ready; // @[Core.scala 56:21]
  wire  ife_io_out_valid; // @[Core.scala 56:21]
  wire [31:0] ife_io_out_bits_pcNext4; // @[Core.scala 56:21]
  wire  ife_io_out_bits_instState_commit; // @[Core.scala 56:21]
  wire [31:0] ife_io_out_bits_instState_pc; // @[Core.scala 56:21]
  wire [31:0] ife_io_out_bits_instState_inst; // @[Core.scala 56:21]
  wire  ife_io_tlbus_req_ready; // @[Core.scala 56:21]
  wire  ife_io_tlbus_req_valid; // @[Core.scala 56:21]
  wire [31:0] ife_io_tlbus_req_bits_address; // @[Core.scala 56:21]
  wire  ife_io_tlbus_resp_valid; // @[Core.scala 56:21]
  wire [2:0] ife_io_tlbus_resp_bits_opcode; // @[Core.scala 56:21]
  wire [127:0] ife_io_tlbus_resp_bits_data; // @[Core.scala 56:21]
  wire [31:0] ife_io_trapVec; // @[Core.scala 56:21]
  wire [31:0] ife_io_mepc; // @[Core.scala 56:21]
  wire  ife_io_excp_valid; // @[Core.scala 56:21]
  wire  ife_io_excp_bits_isMret; // @[Core.scala 56:21]
  wire  dec_clock; // @[Core.scala 64:21]
  wire  dec_reset; // @[Core.scala 64:21]
  wire  dec_io_in_ready; // @[Core.scala 64:21]
  wire  dec_io_in_valid; // @[Core.scala 64:21]
  wire [31:0] dec_io_in_bits_pcNext4; // @[Core.scala 64:21]
  wire  dec_io_in_bits_instState_commit; // @[Core.scala 64:21]
  wire [31:0] dec_io_in_bits_instState_pc; // @[Core.scala 64:21]
  wire [31:0] dec_io_in_bits_instState_inst; // @[Core.scala 64:21]
  wire  dec_io_out_ready; // @[Core.scala 64:21]
  wire  dec_io_out_valid; // @[Core.scala 64:21]
  wire  dec_io_out_bits_isBranch; // @[Core.scala 64:21]
  wire  dec_io_out_bits_isJump; // @[Core.scala 64:21]
  wire [1:0] dec_io_out_bits_resultSrc; // @[Core.scala 64:21]
  wire [4:0] dec_io_out_bits_lsuOp; // @[Core.scala 64:21]
  wire [4:0] dec_io_out_bits_aluOpSel; // @[Core.scala 64:21]
  wire  dec_io_out_bits_immSign; // @[Core.scala 64:21]
  wire  dec_io_out_bits_regWrEn; // @[Core.scala 64:21]
  wire  dec_io_out_bits_pcAddReg; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_pcNext4; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_aluIn1; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_aluIn2; // @[Core.scala 64:21]
  wire  dec_io_out_bits_aluIn1IsReg; // @[Core.scala 64:21]
  wire  dec_io_out_bits_aluIn2IsReg; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_imm; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_data2; // @[Core.scala 64:21]
  wire [3:0] dec_io_out_bits_excType; // @[Core.scala 64:21]
  wire [2:0] dec_io_out_bits_csrOp; // @[Core.scala 64:21]
  wire  dec_io_out_bits_instState_commit; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_instState_pc; // @[Core.scala 64:21]
  wire [31:0] dec_io_out_bits_instState_inst; // @[Core.scala 64:21]
  wire [4:0] dec_io_hazard_out_rs1; // @[Core.scala 64:21]
  wire [4:0] dec_io_hazard_out_rs2; // @[Core.scala 64:21]
  wire  dec_io_hazard_in_stall; // @[Core.scala 64:21]
  wire [4:0] dec_io_regfile_rs1; // @[Core.scala 64:21]
  wire [4:0] dec_io_regfile_rs2; // @[Core.scala 64:21]
  wire [31:0] dec_io_regfile_rdata1; // @[Core.scala 64:21]
  wire [31:0] dec_io_regfile_rdata2; // @[Core.scala 64:21]
  wire  dec_io_ctrl_flush; // @[Core.scala 64:21]
  wire  exe_clock; // @[Core.scala 69:21]
  wire  exe_reset; // @[Core.scala 69:21]
  wire  exe_io_in_ready; // @[Core.scala 69:21]
  wire  exe_io_in_valid; // @[Core.scala 69:21]
  wire  exe_io_in_bits_isBranch; // @[Core.scala 69:21]
  wire  exe_io_in_bits_isJump; // @[Core.scala 69:21]
  wire [1:0] exe_io_in_bits_resultSrc; // @[Core.scala 69:21]
  wire [4:0] exe_io_in_bits_lsuOp; // @[Core.scala 69:21]
  wire [4:0] exe_io_in_bits_aluOpSel; // @[Core.scala 69:21]
  wire  exe_io_in_bits_immSign; // @[Core.scala 69:21]
  wire  exe_io_in_bits_regWrEn; // @[Core.scala 69:21]
  wire  exe_io_in_bits_pcAddReg; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_pcNext4; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_aluIn1; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_aluIn2; // @[Core.scala 69:21]
  wire  exe_io_in_bits_aluIn1IsReg; // @[Core.scala 69:21]
  wire  exe_io_in_bits_aluIn2IsReg; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_imm; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_data2; // @[Core.scala 69:21]
  wire [3:0] exe_io_in_bits_excType; // @[Core.scala 69:21]
  wire [2:0] exe_io_in_bits_csrOp; // @[Core.scala 69:21]
  wire  exe_io_in_bits_instState_commit; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_instState_pc; // @[Core.scala 69:21]
  wire [31:0] exe_io_in_bits_instState_inst; // @[Core.scala 69:21]
  wire  exe_io_out_memory_ready; // @[Core.scala 69:21]
  wire  exe_io_out_memory_valid; // @[Core.scala 69:21]
  wire [1:0] exe_io_out_memory_bits_resultSrc; // @[Core.scala 69:21]
  wire [4:0] exe_io_out_memory_bits_lsuOp; // @[Core.scala 69:21]
  wire  exe_io_out_memory_bits_regWrEn; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_aluOut; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_data2; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_pcNext4; // @[Core.scala 69:21]
  wire [2:0] exe_io_out_memory_bits_csrOp; // @[Core.scala 69:21]
  wire  exe_io_out_memory_bits_csrWrEn; // @[Core.scala 69:21]
  wire  exe_io_out_memory_bits_csrValid; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_csrRdData; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_csrWrData; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_csrAddr; // @[Core.scala 69:21]
  wire [3:0] exe_io_out_memory_bits_excType; // @[Core.scala 69:21]
  wire  exe_io_out_memory_bits_instState_commit; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_instState_pc; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_memory_bits_instState_inst; // @[Core.scala 69:21]
  wire  exe_io_out_fetch_bits_brTaken; // @[Core.scala 69:21]
  wire [31:0] exe_io_out_fetch_bits_targetAddr; // @[Core.scala 69:21]
  wire [4:0] exe_io_hazard_out_rs1; // @[Core.scala 69:21]
  wire [4:0] exe_io_hazard_out_rs2; // @[Core.scala 69:21]
  wire [1:0] exe_io_hazard_out_resultSrc; // @[Core.scala 69:21]
  wire [4:0] exe_io_hazard_out_rd; // @[Core.scala 69:21]
  wire [1:0] exe_io_hazard_in_aluSrc1; // @[Core.scala 69:21]
  wire [1:0] exe_io_hazard_in_aluSrc2; // @[Core.scala 69:21]
  wire [31:0] exe_io_hazard_in_rdValM; // @[Core.scala 69:21]
  wire [31:0] exe_io_hazard_in_rdValW; // @[Core.scala 69:21]
  wire  exe_io_ctrl_flush; // @[Core.scala 69:21]
  wire [2:0] exe_io_csrRead_op; // @[Core.scala 69:21]
  wire  exe_io_csrRead_valid; // @[Core.scala 69:21]
  wire [11:0] exe_io_csrRead_addr; // @[Core.scala 69:21]
  wire [31:0] exe_io_csrRead_data; // @[Core.scala 69:21]
  wire  mem_clock; // @[Core.scala 74:21]
  wire  mem_reset; // @[Core.scala 74:21]
  wire  mem_io_in_ready; // @[Core.scala 74:21]
  wire [1:0] mem_io_in_bits_resultSrc; // @[Core.scala 74:21]
  wire [4:0] mem_io_in_bits_lsuOp; // @[Core.scala 74:21]
  wire  mem_io_in_bits_regWrEn; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_aluOut; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_data2; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_pcNext4; // @[Core.scala 74:21]
  wire [2:0] mem_io_in_bits_csrOp; // @[Core.scala 74:21]
  wire  mem_io_in_bits_csrWrEn; // @[Core.scala 74:21]
  wire  mem_io_in_bits_csrValid; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_csrRdData; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_csrWrData; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_csrAddr; // @[Core.scala 74:21]
  wire [3:0] mem_io_in_bits_excType; // @[Core.scala 74:21]
  wire  mem_io_in_bits_instState_commit; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_instState_pc; // @[Core.scala 74:21]
  wire [31:0] mem_io_in_bits_instState_inst; // @[Core.scala 74:21]
  wire  mem_io_out_ready; // @[Core.scala 74:21]
  wire  mem_io_out_valid; // @[Core.scala 74:21]
  wire [1:0] mem_io_out_bits_resultSrc; // @[Core.scala 74:21]
  wire  mem_io_out_bits_regWrEn; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_aluOut; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_pcNext4; // @[Core.scala 74:21]
  wire [2:0] mem_io_out_bits_csrOp; // @[Core.scala 74:21]
  wire  mem_io_out_bits_csrWrEn; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_csrRdData; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_csrWrData; // @[Core.scala 74:21]
  wire [11:0] mem_io_out_bits_csrAddr; // @[Core.scala 74:21]
  wire  mem_io_out_bits_instState_commit; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_instState_pc; // @[Core.scala 74:21]
  wire [31:0] mem_io_out_bits_instState_inst; // @[Core.scala 74:21]
  wire [31:0] mem_io_lsuData; // @[Core.scala 74:21]
  wire  mem_io_lsuOK; // @[Core.scala 74:21]
  wire  mem_io_tlbus_req_ready; // @[Core.scala 74:21]
  wire  mem_io_tlbus_req_valid; // @[Core.scala 74:21]
  wire [2:0] mem_io_tlbus_req_bits_opcode; // @[Core.scala 74:21]
  wire [31:0] mem_io_tlbus_req_bits_address; // @[Core.scala 74:21]
  wire [127:0] mem_io_tlbus_req_bits_data; // @[Core.scala 74:21]
  wire  mem_io_tlbus_resp_valid; // @[Core.scala 74:21]
  wire [2:0] mem_io_tlbus_resp_bits_opcode; // @[Core.scala 74:21]
  wire [127:0] mem_io_tlbus_resp_bits_data; // @[Core.scala 74:21]
  wire [4:0] mem_io_hazard_rd; // @[Core.scala 74:21]
  wire [31:0] mem_io_hazard_rdVal; // @[Core.scala 74:21]
  wire  mem_io_hazard_regWrEn; // @[Core.scala 74:21]
  wire  mem_io_ctrl_flush; // @[Core.scala 74:21]
  wire  mem_io_excp_valid; // @[Core.scala 74:21]
  wire  mem_io_excp_bits_isMret; // @[Core.scala 74:21]
  wire  mem_io_excp_bits_isSret; // @[Core.scala 74:21]
  wire [30:0] mem_io_excp_bits_excCause; // @[Core.scala 74:21]
  wire [31:0] mem_io_excp_bits_excPc; // @[Core.scala 74:21]
  wire  mem_io_csrBusy; // @[Core.scala 74:21]
  wire [1:0] mem_io_csrMode; // @[Core.scala 74:21]
  wire  wb_clock; // @[Core.scala 80:20]
  wire  wb_reset; // @[Core.scala 80:20]
  wire  wb_io_in_ready; // @[Core.scala 80:20]
  wire  wb_io_in_valid; // @[Core.scala 80:20]
  wire [1:0] wb_io_in_bits_resultSrc; // @[Core.scala 80:20]
  wire  wb_io_in_bits_regWrEn; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_aluOut; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_pcNext4; // @[Core.scala 80:20]
  wire [2:0] wb_io_in_bits_csrOp; // @[Core.scala 80:20]
  wire  wb_io_in_bits_csrWrEn; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_csrRdData; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_csrWrData; // @[Core.scala 80:20]
  wire [11:0] wb_io_in_bits_csrAddr; // @[Core.scala 80:20]
  wire  wb_io_in_bits_instState_commit; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_instState_pc; // @[Core.scala 80:20]
  wire [31:0] wb_io_in_bits_instState_inst; // @[Core.scala 80:20]
  wire  wb_io_instState_commit; // @[Core.scala 80:20]
  wire [31:0] wb_io_instState_pc; // @[Core.scala 80:20]
  wire [31:0] wb_io_instState_inst; // @[Core.scala 80:20]
  wire [4:0] wb_io_hazard_rd; // @[Core.scala 80:20]
  wire [31:0] wb_io_hazard_rdVal; // @[Core.scala 80:20]
  wire  wb_io_hazard_regWrEn; // @[Core.scala 80:20]
  wire [4:0] wb_io_regfile_rd; // @[Core.scala 80:20]
  wire  wb_io_regfile_regWrEn; // @[Core.scala 80:20]
  wire [31:0] wb_io_regfile_regWrData; // @[Core.scala 80:20]
  wire [2:0] wb_io_csrWrite_op; // @[Core.scala 80:20]
  wire [11:0] wb_io_csrWrite_addr; // @[Core.scala 80:20]
  wire [31:0] wb_io_csrWrite_data; // @[Core.scala 80:20]
  wire  wb_io_csrWrite_retired; // @[Core.scala 80:20]
  wire [31:0] wb_io_lsuData; // @[Core.scala 80:20]
  wire  pipelineCtrl_io_in_brTaken; // @[Core.scala 87:30]
  wire  pipelineCtrl_io_in_excpValid; // @[Core.scala 87:30]
  wire  pipelineCtrl_io_out_decode_flush; // @[Core.scala 87:30]
  wire  pipelineCtrl_io_out_execute_flush; // @[Core.scala 87:30]
  wire  pipelineCtrl_io_out_memory_flush; // @[Core.scala 87:30]
  wire [4:0] hazardU_io_in_decode_rs1; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_decode_rs2; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_execute_rs1; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_execute_rs2; // @[Core.scala 97:25]
  wire [1:0] hazardU_io_in_execute_resultSrc; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_execute_rd; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_memory_rd; // @[Core.scala 97:25]
  wire [31:0] hazardU_io_in_memory_rdVal; // @[Core.scala 97:25]
  wire  hazardU_io_in_memory_regWrEn; // @[Core.scala 97:25]
  wire [4:0] hazardU_io_in_writeback_rd; // @[Core.scala 97:25]
  wire [31:0] hazardU_io_in_writeback_rdVal; // @[Core.scala 97:25]
  wire  hazardU_io_in_writeback_regWrEn; // @[Core.scala 97:25]
  wire [1:0] hazardU_io_out_execute_aluSrc1; // @[Core.scala 97:25]
  wire [1:0] hazardU_io_out_execute_aluSrc2; // @[Core.scala 97:25]
  wire [31:0] hazardU_io_out_execute_rdValM; // @[Core.scala 97:25]
  wire [31:0] hazardU_io_out_execute_rdValW; // @[Core.scala 97:25]
  wire  hazardU_io_out_decode_stall; // @[Core.scala 97:25]
  wire  regFile_clock; // @[Core.scala 106:25]
  wire  regFile_reset; // @[Core.scala 106:25]
  wire [4:0] regFile_io_r_0_addr; // @[Core.scala 106:25]
  wire [31:0] regFile_io_r_0_data; // @[Core.scala 106:25]
  wire [4:0] regFile_io_r_1_addr; // @[Core.scala 106:25]
  wire [31:0] regFile_io_r_1_data; // @[Core.scala 106:25]
  wire [4:0] regFile_io_w_0_addr; // @[Core.scala 106:25]
  wire  regFile_io_w_0_en; // @[Core.scala 106:25]
  wire [31:0] regFile_io_w_0_data; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_0; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_1; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_2; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_3; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_4; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_5; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_6; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_7; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_8; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_9; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_10; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_11; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_12; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_13; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_14; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_15; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_16; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_17; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_18; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_19; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_20; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_21; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_22; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_23; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_24; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_25; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_26; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_27; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_28; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_29; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_30; // @[Core.scala 106:25]
  wire [31:0] regFile_regState_0_regState_31; // @[Core.scala 106:25]
  wire  csrFile_clock; // @[Core.scala 118:25]
  wire  csrFile_reset; // @[Core.scala 118:25]
  wire [2:0] csrFile_io_read_op; // @[Core.scala 118:25]
  wire  csrFile_io_read_valid; // @[Core.scala 118:25]
  wire [11:0] csrFile_io_read_addr; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_read_data; // @[Core.scala 118:25]
  wire [2:0] csrFile_io_write_op; // @[Core.scala 118:25]
  wire [11:0] csrFile_io_write_addr; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_write_data; // @[Core.scala 118:25]
  wire  csrFile_io_write_retired; // @[Core.scala 118:25]
  wire  csrFile_io_except_valid; // @[Core.scala 118:25]
  wire  csrFile_io_except_bits_isMret; // @[Core.scala 118:25]
  wire  csrFile_io_except_bits_isSret; // @[Core.scala 118:25]
  wire [30:0] csrFile_io_except_bits_excCause; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_except_bits_excPc; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_except_bits_excValue; // @[Core.scala 118:25]
  wire [1:0] csrFile_io_mode; // @[Core.scala 118:25]
  wire  csrFile_io_busy; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_mepc; // @[Core.scala 118:25]
  wire [31:0] csrFile_io_trapVec; // @[Core.scala 118:25]
  wire [31:0] csrFile_csrState_0_mcycle; // @[Core.scala 118:25]
  wire [31:0] csrFile_csrState_0_mcycleh; // @[Core.scala 118:25]
  wire  xbar_clock; // @[Core.scala 326:22]
  wire  xbar_reset; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_in_0_ready; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_in_0_valid; // @[Core.scala 326:22]
  wire [31:0] xbar_io_masterFace_in_0_bits_address; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_in_1_ready; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_in_1_valid; // @[Core.scala 326:22]
  wire [2:0] xbar_io_masterFace_in_1_bits_opcode; // @[Core.scala 326:22]
  wire [31:0] xbar_io_masterFace_in_1_bits_address; // @[Core.scala 326:22]
  wire [127:0] xbar_io_masterFace_in_1_bits_data; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_out_0_valid; // @[Core.scala 326:22]
  wire [2:0] xbar_io_masterFace_out_0_bits_opcode; // @[Core.scala 326:22]
  wire [127:0] xbar_io_masterFace_out_0_bits_data; // @[Core.scala 326:22]
  wire  xbar_io_masterFace_out_1_valid; // @[Core.scala 326:22]
  wire [2:0] xbar_io_masterFace_out_1_bits_opcode; // @[Core.scala 326:22]
  wire [127:0] xbar_io_masterFace_out_1_bits_data; // @[Core.scala 326:22]
  wire  xbar_io_slaveFace_in_0_ready; // @[Core.scala 326:22]
  wire  xbar_io_slaveFace_in_0_valid; // @[Core.scala 326:22]
  wire [2:0] xbar_io_slaveFace_in_0_bits_opcode; // @[Core.scala 326:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_size; // @[Core.scala 326:22]
  wire [31:0] xbar_io_slaveFace_in_0_bits_address; // @[Core.scala 326:22]
  wire [127:0] xbar_io_slaveFace_in_0_bits_data; // @[Core.scala 326:22]
  wire  xbar_io_slaveFace_out_0_ready; // @[Core.scala 326:22]
  wire  xbar_io_slaveFace_out_0_valid; // @[Core.scala 326:22]
  wire [2:0] xbar_io_slaveFace_out_0_bits_opcode; // @[Core.scala 326:22]
  wire [127:0] xbar_io_slaveFace_out_0_bits_data; // @[Core.scala 326:22]
  wire  rom_clock; // @[Core.scala 327:21]
  wire  rom_reset; // @[Core.scala 327:21]
  wire  rom_io_req_ready; // @[Core.scala 327:21]
  wire  rom_io_req_valid; // @[Core.scala 327:21]
  wire [2:0] rom_io_req_bits_opcode; // @[Core.scala 327:21]
  wire [127:0] rom_io_req_bits_size; // @[Core.scala 327:21]
  wire [31:0] rom_io_req_bits_address; // @[Core.scala 327:21]
  wire [127:0] rom_io_req_bits_data; // @[Core.scala 327:21]
  wire  rom_io_resp_ready; // @[Core.scala 327:21]
  wire  rom_io_resp_valid; // @[Core.scala 327:21]
  wire [2:0] rom_io_resp_bits_opcode; // @[Core.scala 327:21]
  wire [127:0] rom_io_resp_bits_size; // @[Core.scala 327:21]
  wire [127:0] rom_io_resp_bits_data; // @[Core.scala 327:21]
  wire  ram_clock; // @[Core.scala 328:21]
  wire  ram_reset; // @[Core.scala 328:21]
  wire  ram_io_req_ready; // @[Core.scala 328:21]
  wire  ram_io_req_valid; // @[Core.scala 328:21]
  wire [2:0] ram_io_req_bits_opcode; // @[Core.scala 328:21]
  wire [127:0] ram_io_req_bits_size; // @[Core.scala 328:21]
  wire [31:0] ram_io_req_bits_address; // @[Core.scala 328:21]
  wire [127:0] ram_io_req_bits_data; // @[Core.scala 328:21]
  wire  ram_io_resp_ready; // @[Core.scala 328:21]
  wire  ram_io_resp_valid; // @[Core.scala 328:21]
  wire [2:0] ram_io_resp_bits_opcode; // @[Core.scala 328:21]
  wire [127:0] ram_io_resp_bits_size; // @[Core.scala 328:21]
  wire [127:0] ram_io_resp_bits_data; // @[Core.scala 328:21]
  reg  ife_io_in_start_REG; // @[Core.scala 57:31]
  reg  io_out_state_instState_REG_commit; // @[Core.scala 136:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core.scala 136:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core.scala 136:38]
  Fetch_1 ife ( // @[Core.scala 56:21]
    .clock(ife_clock),
    .reset(ife_reset),
    .io_in_start(ife_io_in_start),
    .io_in_execute_bits_brTaken(ife_io_in_execute_bits_brTaken),
    .io_in_execute_bits_targetAddr(ife_io_in_execute_bits_targetAddr),
    .io_out_ready(ife_io_out_ready),
    .io_out_valid(ife_io_out_valid),
    .io_out_bits_pcNext4(ife_io_out_bits_pcNext4),
    .io_out_bits_instState_commit(ife_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(ife_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(ife_io_out_bits_instState_inst),
    .io_tlbus_req_ready(ife_io_tlbus_req_ready),
    .io_tlbus_req_valid(ife_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(ife_io_tlbus_req_bits_address),
    .io_tlbus_resp_valid(ife_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(ife_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(ife_io_tlbus_resp_bits_data),
    .io_trapVec(ife_io_trapVec),
    .io_mepc(ife_io_mepc),
    .io_excp_valid(ife_io_excp_valid),
    .io_excp_bits_isMret(ife_io_excp_bits_isMret)
  );
  Decode dec ( // @[Core.scala 64:21]
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
  Execute exe ( // @[Core.scala 69:21]
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
    .io_out_memory_bits_csrRdData(exe_io_out_memory_bits_csrRdData),
    .io_out_memory_bits_csrWrData(exe_io_out_memory_bits_csrWrData),
    .io_out_memory_bits_csrAddr(exe_io_out_memory_bits_csrAddr),
    .io_out_memory_bits_excType(exe_io_out_memory_bits_excType),
    .io_out_memory_bits_instState_commit(exe_io_out_memory_bits_instState_commit),
    .io_out_memory_bits_instState_pc(exe_io_out_memory_bits_instState_pc),
    .io_out_memory_bits_instState_inst(exe_io_out_memory_bits_instState_inst),
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
    .io_csrRead_addr(exe_io_csrRead_addr),
    .io_csrRead_data(exe_io_csrRead_data)
  );
  Mem mem ( // @[Core.scala 74:21]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_in_ready(mem_io_in_ready),
    .io_in_bits_resultSrc(mem_io_in_bits_resultSrc),
    .io_in_bits_lsuOp(mem_io_in_bits_lsuOp),
    .io_in_bits_regWrEn(mem_io_in_bits_regWrEn),
    .io_in_bits_aluOut(mem_io_in_bits_aluOut),
    .io_in_bits_data2(mem_io_in_bits_data2),
    .io_in_bits_pcNext4(mem_io_in_bits_pcNext4),
    .io_in_bits_csrOp(mem_io_in_bits_csrOp),
    .io_in_bits_csrWrEn(mem_io_in_bits_csrWrEn),
    .io_in_bits_csrValid(mem_io_in_bits_csrValid),
    .io_in_bits_csrRdData(mem_io_in_bits_csrRdData),
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
    .io_out_bits_csrRdData(mem_io_out_bits_csrRdData),
    .io_out_bits_csrWrData(mem_io_out_bits_csrWrData),
    .io_out_bits_csrAddr(mem_io_out_bits_csrAddr),
    .io_out_bits_instState_commit(mem_io_out_bits_instState_commit),
    .io_out_bits_instState_pc(mem_io_out_bits_instState_pc),
    .io_out_bits_instState_inst(mem_io_out_bits_instState_inst),
    .io_lsuData(mem_io_lsuData),
    .io_lsuOK(mem_io_lsuOK),
    .io_tlbus_req_ready(mem_io_tlbus_req_ready),
    .io_tlbus_req_valid(mem_io_tlbus_req_valid),
    .io_tlbus_req_bits_opcode(mem_io_tlbus_req_bits_opcode),
    .io_tlbus_req_bits_address(mem_io_tlbus_req_bits_address),
    .io_tlbus_req_bits_data(mem_io_tlbus_req_bits_data),
    .io_tlbus_resp_valid(mem_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(mem_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(mem_io_tlbus_resp_bits_data),
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
  WriteBack wb ( // @[Core.scala 80:20]
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
    .io_in_bits_csrRdData(wb_io_in_bits_csrRdData),
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
    .io_lsuData(wb_io_lsuData)
  );
  PipelineCtrl pipelineCtrl ( // @[Core.scala 87:30]
    .io_in_brTaken(pipelineCtrl_io_in_brTaken),
    .io_in_excpValid(pipelineCtrl_io_in_excpValid),
    .io_out_decode_flush(pipelineCtrl_io_out_decode_flush),
    .io_out_execute_flush(pipelineCtrl_io_out_execute_flush),
    .io_out_memory_flush(pipelineCtrl_io_out_memory_flush)
  );
  HazardUnit hazardU ( // @[Core.scala 97:25]
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
  RegFile regFile ( // @[Core.scala 106:25]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_r_0_addr(regFile_io_r_0_addr),
    .io_r_0_data(regFile_io_r_0_data),
    .io_r_1_addr(regFile_io_r_1_addr),
    .io_r_1_data(regFile_io_r_1_data),
    .io_w_0_addr(regFile_io_w_0_addr),
    .io_w_0_en(regFile_io_w_0_en),
    .io_w_0_data(regFile_io_w_0_data),
    .regState_0_regState_0(regFile_regState_0_regState_0),
    .regState_0_regState_1(regFile_regState_0_regState_1),
    .regState_0_regState_2(regFile_regState_0_regState_2),
    .regState_0_regState_3(regFile_regState_0_regState_3),
    .regState_0_regState_4(regFile_regState_0_regState_4),
    .regState_0_regState_5(regFile_regState_0_regState_5),
    .regState_0_regState_6(regFile_regState_0_regState_6),
    .regState_0_regState_7(regFile_regState_0_regState_7),
    .regState_0_regState_8(regFile_regState_0_regState_8),
    .regState_0_regState_9(regFile_regState_0_regState_9),
    .regState_0_regState_10(regFile_regState_0_regState_10),
    .regState_0_regState_11(regFile_regState_0_regState_11),
    .regState_0_regState_12(regFile_regState_0_regState_12),
    .regState_0_regState_13(regFile_regState_0_regState_13),
    .regState_0_regState_14(regFile_regState_0_regState_14),
    .regState_0_regState_15(regFile_regState_0_regState_15),
    .regState_0_regState_16(regFile_regState_0_regState_16),
    .regState_0_regState_17(regFile_regState_0_regState_17),
    .regState_0_regState_18(regFile_regState_0_regState_18),
    .regState_0_regState_19(regFile_regState_0_regState_19),
    .regState_0_regState_20(regFile_regState_0_regState_20),
    .regState_0_regState_21(regFile_regState_0_regState_21),
    .regState_0_regState_22(regFile_regState_0_regState_22),
    .regState_0_regState_23(regFile_regState_0_regState_23),
    .regState_0_regState_24(regFile_regState_0_regState_24),
    .regState_0_regState_25(regFile_regState_0_regState_25),
    .regState_0_regState_26(regFile_regState_0_regState_26),
    .regState_0_regState_27(regFile_regState_0_regState_27),
    .regState_0_regState_28(regFile_regState_0_regState_28),
    .regState_0_regState_29(regFile_regState_0_regState_29),
    .regState_0_regState_30(regFile_regState_0_regState_30),
    .regState_0_regState_31(regFile_regState_0_regState_31)
  );
  CsrFile csrFile ( // @[Core.scala 118:25]
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
    .io_trapVec(csrFile_io_trapVec),
    .csrState_0_mcycle(csrFile_csrState_0_mcycle),
    .csrState_0_mcycleh(csrFile_csrState_0_mcycleh)
  );
  TLXbar xbar ( // @[Core.scala 326:22]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_masterFace_in_0_ready(xbar_io_masterFace_in_0_ready),
    .io_masterFace_in_0_valid(xbar_io_masterFace_in_0_valid),
    .io_masterFace_in_0_bits_address(xbar_io_masterFace_in_0_bits_address),
    .io_masterFace_in_1_ready(xbar_io_masterFace_in_1_ready),
    .io_masterFace_in_1_valid(xbar_io_masterFace_in_1_valid),
    .io_masterFace_in_1_bits_opcode(xbar_io_masterFace_in_1_bits_opcode),
    .io_masterFace_in_1_bits_address(xbar_io_masterFace_in_1_bits_address),
    .io_masterFace_in_1_bits_data(xbar_io_masterFace_in_1_bits_data),
    .io_masterFace_out_0_valid(xbar_io_masterFace_out_0_valid),
    .io_masterFace_out_0_bits_opcode(xbar_io_masterFace_out_0_bits_opcode),
    .io_masterFace_out_0_bits_data(xbar_io_masterFace_out_0_bits_data),
    .io_masterFace_out_1_valid(xbar_io_masterFace_out_1_valid),
    .io_masterFace_out_1_bits_opcode(xbar_io_masterFace_out_1_bits_opcode),
    .io_masterFace_out_1_bits_data(xbar_io_masterFace_out_1_bits_data),
    .io_slaveFace_in_0_ready(xbar_io_slaveFace_in_0_ready),
    .io_slaveFace_in_0_valid(xbar_io_slaveFace_in_0_valid),
    .io_slaveFace_in_0_bits_opcode(xbar_io_slaveFace_in_0_bits_opcode),
    .io_slaveFace_in_0_bits_size(xbar_io_slaveFace_in_0_bits_size),
    .io_slaveFace_in_0_bits_address(xbar_io_slaveFace_in_0_bits_address),
    .io_slaveFace_in_0_bits_data(xbar_io_slaveFace_in_0_bits_data),
    .io_slaveFace_out_0_ready(xbar_io_slaveFace_out_0_ready),
    .io_slaveFace_out_0_valid(xbar_io_slaveFace_out_0_valid),
    .io_slaveFace_out_0_bits_opcode(xbar_io_slaveFace_out_0_bits_opcode),
    .io_slaveFace_out_0_bits_data(xbar_io_slaveFace_out_0_bits_data)
  );
  SingleROM rom ( // @[Core.scala 327:21]
    .clock(rom_clock),
    .reset(rom_reset),
    .io_req_ready(rom_io_req_ready),
    .io_req_valid(rom_io_req_valid),
    .io_req_bits_opcode(rom_io_req_bits_opcode),
    .io_req_bits_size(rom_io_req_bits_size),
    .io_req_bits_address(rom_io_req_bits_address),
    .io_req_bits_data(rom_io_req_bits_data),
    .io_resp_ready(rom_io_resp_ready),
    .io_resp_valid(rom_io_resp_valid),
    .io_resp_bits_opcode(rom_io_resp_bits_opcode),
    .io_resp_bits_size(rom_io_resp_bits_size),
    .io_resp_bits_data(rom_io_resp_bits_data)
  );
  SingleROM ram ( // @[Core.scala 328:21]
    .clock(ram_clock),
    .reset(ram_reset),
    .io_req_ready(ram_io_req_ready),
    .io_req_valid(ram_io_req_valid),
    .io_req_bits_opcode(ram_io_req_bits_opcode),
    .io_req_bits_size(ram_io_req_bits_size),
    .io_req_bits_address(ram_io_req_bits_address),
    .io_req_bits_data(ram_io_req_bits_data),
    .io_resp_ready(ram_io_resp_ready),
    .io_resp_valid(ram_io_resp_valid),
    .io_resp_bits_opcode(ram_io_resp_bits_opcode),
    .io_resp_bits_size(ram_io_resp_bits_size),
    .io_resp_bits_data(ram_io_resp_bits_data)
  );
  assign io_out_state_intRegState_regState_0 = regFile_regState_0_regState_0; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_1 = regFile_regState_0_regState_1; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_2 = regFile_regState_0_regState_2; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_3 = regFile_regState_0_regState_3; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_4 = regFile_regState_0_regState_4; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_5 = regFile_regState_0_regState_5; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_6 = regFile_regState_0_regState_6; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_7 = regFile_regState_0_regState_7; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_8 = regFile_regState_0_regState_8; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_9 = regFile_regState_0_regState_9; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_10 = regFile_regState_0_regState_10; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_11 = regFile_regState_0_regState_11; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_12 = regFile_regState_0_regState_12; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_13 = regFile_regState_0_regState_13; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_14 = regFile_regState_0_regState_14; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_15 = regFile_regState_0_regState_15; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_16 = regFile_regState_0_regState_16; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_17 = regFile_regState_0_regState_17; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_18 = regFile_regState_0_regState_18; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_19 = regFile_regState_0_regState_19; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_20 = regFile_regState_0_regState_20; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_21 = regFile_regState_0_regState_21; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_22 = regFile_regState_0_regState_22; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_23 = regFile_regState_0_regState_23; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_24 = regFile_regState_0_regState_24; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_25 = regFile_regState_0_regState_25; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_26 = regFile_regState_0_regState_26; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_27 = regFile_regState_0_regState_27; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_28 = regFile_regState_0_regState_28; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_29 = regFile_regState_0_regState_29; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_30 = regFile_regState_0_regState_30; // @[Core.scala 130:28]
  assign io_out_state_intRegState_regState_31 = regFile_regState_0_regState_31; // @[Core.scala 130:28]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core.scala 136:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core.scala 136:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core.scala 136:28]
  assign io_out_state_csrState_mcycle = csrFile_csrState_0_mcycle; // @[Core.scala 133:28]
  assign io_out_state_csrState_mcycleh = csrFile_csrState_0_mcycleh; // @[Core.scala 133:28]
  assign ife_clock = clock;
  assign ife_reset = reset;
  assign ife_io_in_start = ife_io_in_start_REG; // @[Core.scala 57:21]
  assign ife_io_in_execute_bits_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 71:23]
  assign ife_io_in_execute_bits_targetAddr = exe_io_out_fetch_bits_targetAddr; // @[Core.scala 71:23]
  assign ife_io_out_ready = dec_io_in_ready; // @[Core.scala 65:15]
  assign ife_io_tlbus_req_ready = xbar_io_masterFace_in_0_ready; // @[Core.scala 332:22]
  assign ife_io_tlbus_resp_valid = xbar_io_masterFace_out_0_valid; // @[Core.scala 333:23]
  assign ife_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_0_bits_opcode; // @[Core.scala 333:23]
  assign ife_io_tlbus_resp_bits_data = xbar_io_masterFace_out_0_bits_data; // @[Core.scala 333:23]
  assign ife_io_trapVec = csrFile_io_trapVec; // @[Core.scala 125:13 51:23]
  assign ife_io_mepc = csrFile_io_mepc; // @[Core.scala 126:10 52:20]
  assign ife_io_excp_valid = mem_io_excp_valid; // @[Core.scala 77:17]
  assign ife_io_excp_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 77:17]
  assign dec_clock = clock;
  assign dec_reset = reset;
  assign dec_io_in_valid = ife_io_out_valid; // @[Core.scala 65:15]
  assign dec_io_in_bits_pcNext4 = ife_io_out_bits_pcNext4; // @[Core.scala 65:15]
  assign dec_io_in_bits_instState_commit = ife_io_out_bits_instState_commit; // @[Core.scala 65:15]
  assign dec_io_in_bits_instState_pc = ife_io_out_bits_instState_pc; // @[Core.scala 65:15]
  assign dec_io_in_bits_instState_inst = ife_io_out_bits_instState_inst; // @[Core.scala 65:15]
  assign dec_io_out_ready = exe_io_in_ready; // @[Core.scala 70:15]
  assign dec_io_hazard_in_stall = hazardU_io_out_decode_stall; // @[Core.scala 103:14 49:24]
  assign dec_io_regfile_rdata1 = regFile_io_r_0_data; // @[Core.scala 111:27]
  assign dec_io_regfile_rdata2 = regFile_io_r_1_data; // @[Core.scala 112:27]
  assign dec_io_ctrl_flush = pipelineCtrl_io_out_decode_flush; // @[Core.scala 91:17]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_in_valid = dec_io_out_valid; // @[Core.scala 70:15]
  assign exe_io_in_bits_isBranch = dec_io_out_bits_isBranch; // @[Core.scala 70:15]
  assign exe_io_in_bits_isJump = dec_io_out_bits_isJump; // @[Core.scala 70:15]
  assign exe_io_in_bits_resultSrc = dec_io_out_bits_resultSrc; // @[Core.scala 70:15]
  assign exe_io_in_bits_lsuOp = dec_io_out_bits_lsuOp; // @[Core.scala 70:15]
  assign exe_io_in_bits_aluOpSel = dec_io_out_bits_aluOpSel; // @[Core.scala 70:15]
  assign exe_io_in_bits_immSign = dec_io_out_bits_immSign; // @[Core.scala 70:15]
  assign exe_io_in_bits_regWrEn = dec_io_out_bits_regWrEn; // @[Core.scala 70:15]
  assign exe_io_in_bits_pcAddReg = dec_io_out_bits_pcAddReg; // @[Core.scala 70:15]
  assign exe_io_in_bits_pcNext4 = dec_io_out_bits_pcNext4; // @[Core.scala 70:15]
  assign exe_io_in_bits_aluIn1 = dec_io_out_bits_aluIn1; // @[Core.scala 70:15]
  assign exe_io_in_bits_aluIn2 = dec_io_out_bits_aluIn2; // @[Core.scala 70:15]
  assign exe_io_in_bits_aluIn1IsReg = dec_io_out_bits_aluIn1IsReg; // @[Core.scala 70:15]
  assign exe_io_in_bits_aluIn2IsReg = dec_io_out_bits_aluIn2IsReg; // @[Core.scala 70:15]
  assign exe_io_in_bits_imm = dec_io_out_bits_imm; // @[Core.scala 70:15]
  assign exe_io_in_bits_data2 = dec_io_out_bits_data2; // @[Core.scala 70:15]
  assign exe_io_in_bits_excType = dec_io_out_bits_excType; // @[Core.scala 70:15]
  assign exe_io_in_bits_csrOp = dec_io_out_bits_csrOp; // @[Core.scala 70:15]
  assign exe_io_in_bits_instState_commit = dec_io_out_bits_instState_commit; // @[Core.scala 70:15]
  assign exe_io_in_bits_instState_pc = dec_io_out_bits_instState_pc; // @[Core.scala 70:15]
  assign exe_io_in_bits_instState_inst = dec_io_out_bits_instState_inst; // @[Core.scala 70:15]
  assign exe_io_out_memory_ready = mem_io_in_ready; // @[Core.scala 75:15]
  assign exe_io_hazard_in_aluSrc1 = hazardU_io_out_execute_aluSrc1; // @[Core.scala 102:29]
  assign exe_io_hazard_in_aluSrc2 = hazardU_io_out_execute_aluSrc2; // @[Core.scala 102:29]
  assign exe_io_hazard_in_rdValM = hazardU_io_out_execute_rdValM; // @[Core.scala 102:29]
  assign exe_io_hazard_in_rdValW = hazardU_io_out_execute_rdValW; // @[Core.scala 102:29]
  assign exe_io_ctrl_flush = pipelineCtrl_io_out_execute_flush; // @[Core.scala 92:17]
  assign exe_io_csrRead_valid = csrFile_io_read_valid; // @[Core.scala 121:21]
  assign exe_io_csrRead_data = csrFile_io_read_data; // @[Core.scala 121:21]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_in_bits_resultSrc = exe_io_out_memory_bits_resultSrc; // @[Core.scala 75:15]
  assign mem_io_in_bits_lsuOp = exe_io_out_memory_bits_lsuOp; // @[Core.scala 75:15]
  assign mem_io_in_bits_regWrEn = exe_io_out_memory_bits_regWrEn; // @[Core.scala 75:15]
  assign mem_io_in_bits_aluOut = exe_io_out_memory_bits_aluOut; // @[Core.scala 75:15]
  assign mem_io_in_bits_data2 = exe_io_out_memory_bits_data2; // @[Core.scala 75:15]
  assign mem_io_in_bits_pcNext4 = exe_io_out_memory_bits_pcNext4; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrOp = exe_io_out_memory_bits_csrOp; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrWrEn = exe_io_out_memory_bits_csrWrEn; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrValid = exe_io_out_memory_bits_csrValid; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrRdData = exe_io_out_memory_bits_csrRdData; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrWrData = exe_io_out_memory_bits_csrWrData; // @[Core.scala 75:15]
  assign mem_io_in_bits_csrAddr = exe_io_out_memory_bits_csrAddr; // @[Core.scala 75:15]
  assign mem_io_in_bits_excType = exe_io_out_memory_bits_excType; // @[Core.scala 75:15]
  assign mem_io_in_bits_instState_commit = exe_io_out_memory_bits_instState_commit; // @[Core.scala 75:15]
  assign mem_io_in_bits_instState_pc = exe_io_out_memory_bits_instState_pc; // @[Core.scala 75:15]
  assign mem_io_in_bits_instState_inst = exe_io_out_memory_bits_instState_inst; // @[Core.scala 75:15]
  assign mem_io_out_ready = wb_io_in_ready; // @[Core.scala 81:14]
  assign mem_io_tlbus_req_ready = xbar_io_masterFace_in_1_ready; // @[Core.scala 335:22]
  assign mem_io_tlbus_resp_valid = xbar_io_masterFace_out_1_valid; // @[Core.scala 336:23]
  assign mem_io_tlbus_resp_bits_opcode = xbar_io_masterFace_out_1_bits_opcode; // @[Core.scala 336:23]
  assign mem_io_tlbus_resp_bits_data = xbar_io_masterFace_out_1_bits_data; // @[Core.scala 336:23]
  assign mem_io_ctrl_flush = pipelineCtrl_io_out_memory_flush; // @[Core.scala 93:17]
  assign mem_io_csrBusy = csrFile_io_busy; // @[Core.scala 123:20]
  assign mem_io_csrMode = csrFile_io_mode; // @[Core.scala 124:20]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_in_valid = mem_io_out_valid; // @[Core.scala 81:14]
  assign wb_io_in_bits_resultSrc = mem_io_out_bits_resultSrc; // @[Core.scala 81:14]
  assign wb_io_in_bits_regWrEn = mem_io_out_bits_regWrEn; // @[Core.scala 81:14]
  assign wb_io_in_bits_aluOut = mem_io_out_bits_aluOut; // @[Core.scala 81:14]
  assign wb_io_in_bits_pcNext4 = mem_io_out_bits_pcNext4; // @[Core.scala 81:14]
  assign wb_io_in_bits_csrOp = mem_io_out_bits_csrOp; // @[Core.scala 81:14]
  assign wb_io_in_bits_csrWrEn = mem_io_out_bits_csrWrEn; // @[Core.scala 81:14]
  assign wb_io_in_bits_csrRdData = mem_io_out_bits_csrRdData; // @[Core.scala 81:14]
  assign wb_io_in_bits_csrWrData = mem_io_out_bits_csrWrData; // @[Core.scala 81:14]
  assign wb_io_in_bits_csrAddr = mem_io_out_bits_csrAddr; // @[Core.scala 81:14]
  assign wb_io_in_bits_instState_commit = mem_io_out_bits_instState_commit; // @[Core.scala 81:14]
  assign wb_io_in_bits_instState_pc = mem_io_out_bits_instState_pc; // @[Core.scala 81:14]
  assign wb_io_in_bits_instState_inst = mem_io_out_bits_instState_inst; // @[Core.scala 81:14]
  assign wb_io_lsuData = mem_io_lsuData; // @[Core.scala 82:19]
  assign pipelineCtrl_io_in_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 89:34]
  assign pipelineCtrl_io_in_excpValid = mem_io_excp_valid; // @[Core.scala 88:34]
  assign hazardU_io_in_decode_rs1 = dec_io_hazard_out_rs1; // @[Core.scala 98:29]
  assign hazardU_io_in_decode_rs2 = dec_io_hazard_out_rs2; // @[Core.scala 98:29]
  assign hazardU_io_in_execute_rs1 = exe_io_hazard_out_rs1; // @[Core.scala 99:29]
  assign hazardU_io_in_execute_rs2 = exe_io_hazard_out_rs2; // @[Core.scala 99:29]
  assign hazardU_io_in_execute_resultSrc = exe_io_hazard_out_resultSrc; // @[Core.scala 99:29]
  assign hazardU_io_in_execute_rd = exe_io_hazard_out_rd; // @[Core.scala 99:29]
  assign hazardU_io_in_memory_rd = mem_io_hazard_rd; // @[Core.scala 100:29]
  assign hazardU_io_in_memory_rdVal = mem_io_hazard_rdVal; // @[Core.scala 100:29]
  assign hazardU_io_in_memory_regWrEn = mem_io_hazard_regWrEn; // @[Core.scala 100:29]
  assign hazardU_io_in_writeback_rd = wb_io_hazard_rd; // @[Core.scala 101:29]
  assign hazardU_io_in_writeback_rdVal = wb_io_hazard_rdVal; // @[Core.scala 101:29]
  assign hazardU_io_in_writeback_regWrEn = wb_io_hazard_regWrEn; // @[Core.scala 101:29]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = dec_io_regfile_rs1; // @[Core.scala 109:26]
  assign regFile_io_r_1_addr = dec_io_regfile_rs2; // @[Core.scala 110:26]
  assign regFile_io_w_0_addr = wb_io_regfile_rd; // @[Core.scala 114:26]
  assign regFile_io_w_0_en = wb_io_regfile_regWrEn; // @[Core.scala 113:24]
  assign regFile_io_w_0_data = wb_io_regfile_regWrData; // @[Core.scala 115:26]
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = exe_io_csrRead_op; // @[Core.scala 121:21]
  assign csrFile_io_read_addr = exe_io_csrRead_addr; // @[Core.scala 121:21]
  assign csrFile_io_write_op = wb_io_csrWrite_op; // @[Core.scala 122:22]
  assign csrFile_io_write_addr = wb_io_csrWrite_addr; // @[Core.scala 122:22]
  assign csrFile_io_write_data = wb_io_csrWrite_data; // @[Core.scala 122:22]
  assign csrFile_io_write_retired = wb_io_csrWrite_retired; // @[Core.scala 122:22]
  assign csrFile_io_except_valid = mem_io_excp_valid; // @[Core.scala 120:23]
  assign csrFile_io_except_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 120:23]
  assign csrFile_io_except_bits_isSret = mem_io_excp_bits_isSret; // @[Core.scala 120:23]
  assign csrFile_io_except_bits_excCause = mem_io_excp_bits_excCause; // @[Core.scala 120:23]
  assign csrFile_io_except_bits_excPc = mem_io_excp_bits_excPc; // @[Core.scala 120:23]
  assign csrFile_io_except_bits_excValue = 32'h0; // @[Core.scala 120:23]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masterFace_in_0_valid = ife_io_tlbus_req_valid; // @[Core.scala 332:22]
  assign xbar_io_masterFace_in_0_bits_address = ife_io_tlbus_req_bits_address; // @[Core.scala 332:22]
  assign xbar_io_masterFace_in_1_valid = mem_io_tlbus_req_valid; // @[Core.scala 335:22]
  assign xbar_io_masterFace_in_1_bits_opcode = mem_io_tlbus_req_bits_opcode; // @[Core.scala 335:22]
  assign xbar_io_masterFace_in_1_bits_address = mem_io_tlbus_req_bits_address; // @[Core.scala 335:22]
  assign xbar_io_masterFace_in_1_bits_data = mem_io_tlbus_req_bits_data; // @[Core.scala 335:22]
  assign xbar_io_slaveFace_in_0_ready = rom_io_req_ready; // @[Core.scala 340:16]
  assign xbar_io_slaveFace_out_0_valid = rom_io_resp_valid; // @[Core.scala 341:17]
  assign xbar_io_slaveFace_out_0_bits_opcode = rom_io_resp_bits_opcode; // @[Core.scala 341:17]
  assign xbar_io_slaveFace_out_0_bits_data = rom_io_resp_bits_data; // @[Core.scala 341:17]
  assign rom_clock = clock;
  assign rom_reset = reset;
  assign rom_io_req_valid = xbar_io_slaveFace_in_0_valid; // @[Core.scala 340:16]
  assign rom_io_req_bits_opcode = xbar_io_slaveFace_in_0_bits_opcode; // @[Core.scala 340:16]
  assign rom_io_req_bits_size = xbar_io_slaveFace_in_0_bits_size; // @[Core.scala 340:16]
  assign rom_io_req_bits_address = xbar_io_slaveFace_in_0_bits_address; // @[Core.scala 340:16]
  assign rom_io_req_bits_data = xbar_io_slaveFace_in_0_bits_data; // @[Core.scala 340:16]
  assign rom_io_resp_ready = xbar_io_slaveFace_out_0_ready; // @[Core.scala 341:17]
  assign ram_clock = clock;
  assign ram_reset = reset;
  assign ram_io_req_valid = 1'h0;
  assign ram_io_req_bits_opcode = 3'h0;
  assign ram_io_req_bits_size = 128'h0;
  assign ram_io_req_bits_address = 32'h0;
  assign ram_io_req_bits_data = 128'h0;
  assign ram_io_resp_ready = 1'h0;
  always @(posedge clock) begin
    ife_io_in_start_REG <= io_in_start; // @[Core.scala 57:31]
    io_out_state_instState_REG_commit <= wb_io_instState_commit; // @[Core.scala 136:38]
    io_out_state_instState_REG_pc <= wb_io_instState_pc; // @[Core.scala 136:38]
    io_out_state_instState_REG_inst <= wb_io_instState_inst; // @[Core.scala 136:38]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
