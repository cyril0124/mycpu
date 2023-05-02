module IFU(
  input          clock,
  input          reset,
  input          io_start,
  input          io_redirect_valid,
  input  [31:0]  io_redirect_bits_targetAddr,
  input          io_redirect_bits_brTaken,
  input  [31:0]  io_redirect_bits_pc,
  input  [7:0]   io_redirect_bits_way,
  input  [3:0]   io_redirect_bits_idx,
  input          io_output_ready,
  output         io_output_valid,
  output [31:0]  io_output_bits_inst_0,
  output [31:0]  io_output_bits_inst_1,
  output [31:0]  io_output_bits_inst_2,
  output [31:0]  io_output_bits_inst_3,
  output [31:0]  io_output_bits_pc,
  output [2:0]   io_output_bits_size,
  output         io_output_bits_predictBrTaken_0,
  output         io_output_bits_predictBrTaken_1,
  output         io_output_bits_predictBrTaken_2,
  output         io_output_bits_predictBrTaken_3,
  output [3:0]   io_output_bits_predictIdx_0,
  output [3:0]   io_output_bits_predictIdx_1,
  output [3:0]   io_output_bits_predictIdx_2,
  output [3:0]   io_output_bits_predictIdx_3,
  input          io_tlbus_req_ready,
  output         io_tlbus_req_valid,
  output [31:0]  io_tlbus_req_bits_address,
  input          io_tlbus_resp_valid,
  input  [2:0]   io_tlbus_resp_bits_opcode,
  input  [127:0] io_tlbus_resp_bits_data
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
  reg [159:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [127:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[IFU.scala 51:24]
  wire  icache_reset; // @[IFU.scala 51:24]
  wire  icache_io_read_req_ready; // @[IFU.scala 51:24]
  wire  icache_io_read_req_valid; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_req_bits_addr; // @[IFU.scala 51:24]
  wire  icache_io_read_resp_ready; // @[IFU.scala 51:24]
  wire  icache_io_read_resp_valid; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_addr; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_0; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_1; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_2; // @[IFU.scala 51:24]
  wire [31:0] icache_io_read_resp_bits_inst_3; // @[IFU.scala 51:24]
  wire [2:0] icache_io_read_resp_bits_size; // @[IFU.scala 51:24]
  wire  icache_io_tlbus_req_ready; // @[IFU.scala 51:24]
  wire  icache_io_tlbus_req_valid; // @[IFU.scala 51:24]
  wire [31:0] icache_io_tlbus_req_bits_address; // @[IFU.scala 51:24]
  wire  icache_io_tlbus_resp_ready; // @[IFU.scala 51:24]
  wire  icache_io_tlbus_resp_valid; // @[IFU.scala 51:24]
  wire [2:0] icache_io_tlbus_resp_bits_opcode; // @[IFU.scala 51:24]
  wire [127:0] icache_io_tlbus_resp_bits_data; // @[IFU.scala 51:24]
  wire  icache_io_flush; // @[IFU.scala 51:24]
  wire  ghr_clock; // @[IFU.scala 65:21]
  wire  ghr_reset; // @[IFU.scala 65:21]
  wire  ghr_io_update_valid; // @[IFU.scala 65:21]
  wire  ghr_io_update_bits_brTaken; // @[IFU.scala 65:21]
  wire [4:0] ghr_io_out; // @[IFU.scala 65:21]
  wire  btbs_0_clock; // @[IFU.scala 66:45]
  wire  btbs_0_reset; // @[IFU.scala 66:45]
  wire  btbs_0_io_write_valid; // @[IFU.scala 66:45]
  wire [31:0] btbs_0_io_write_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_0_io_write_bits_jump; // @[IFU.scala 66:45]
  wire [31:0] btbs_0_io_write_bits_target; // @[IFU.scala 66:45]
  wire [31:0] btbs_0_io_read_req_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_0_io_read_resp_hit; // @[IFU.scala 66:45]
  wire [31:0] btbs_0_io_read_resp_target; // @[IFU.scala 66:45]
  wire  btbs_0_io_read_resp_jump; // @[IFU.scala 66:45]
  wire  btbs_1_clock; // @[IFU.scala 66:45]
  wire  btbs_1_reset; // @[IFU.scala 66:45]
  wire  btbs_1_io_write_valid; // @[IFU.scala 66:45]
  wire [31:0] btbs_1_io_write_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_1_io_write_bits_jump; // @[IFU.scala 66:45]
  wire [31:0] btbs_1_io_write_bits_target; // @[IFU.scala 66:45]
  wire [31:0] btbs_1_io_read_req_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_1_io_read_resp_hit; // @[IFU.scala 66:45]
  wire [31:0] btbs_1_io_read_resp_target; // @[IFU.scala 66:45]
  wire  btbs_1_io_read_resp_jump; // @[IFU.scala 66:45]
  wire  btbs_2_clock; // @[IFU.scala 66:45]
  wire  btbs_2_reset; // @[IFU.scala 66:45]
  wire  btbs_2_io_write_valid; // @[IFU.scala 66:45]
  wire [31:0] btbs_2_io_write_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_2_io_write_bits_jump; // @[IFU.scala 66:45]
  wire [31:0] btbs_2_io_write_bits_target; // @[IFU.scala 66:45]
  wire [31:0] btbs_2_io_read_req_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_2_io_read_resp_hit; // @[IFU.scala 66:45]
  wire [31:0] btbs_2_io_read_resp_target; // @[IFU.scala 66:45]
  wire  btbs_2_io_read_resp_jump; // @[IFU.scala 66:45]
  wire  btbs_3_clock; // @[IFU.scala 66:45]
  wire  btbs_3_reset; // @[IFU.scala 66:45]
  wire  btbs_3_io_write_valid; // @[IFU.scala 66:45]
  wire [31:0] btbs_3_io_write_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_3_io_write_bits_jump; // @[IFU.scala 66:45]
  wire [31:0] btbs_3_io_write_bits_target; // @[IFU.scala 66:45]
  wire [31:0] btbs_3_io_read_req_bits_pc; // @[IFU.scala 66:45]
  wire  btbs_3_io_read_resp_hit; // @[IFU.scala 66:45]
  wire [31:0] btbs_3_io_read_resp_target; // @[IFU.scala 66:45]
  wire  btbs_3_io_read_resp_jump; // @[IFU.scala 66:45]
  wire  phts_0_clock; // @[IFU.scala 67:45]
  wire  phts_0_reset; // @[IFU.scala 67:45]
  wire  phts_0_io_update_valid; // @[IFU.scala 67:45]
  wire [4:0] phts_0_io_update_bits_idx; // @[IFU.scala 67:45]
  wire  phts_0_io_update_bits_brTaken; // @[IFU.scala 67:45]
  wire [4:0] phts_0_io_index; // @[IFU.scala 67:45]
  wire  phts_0_io_brTaken; // @[IFU.scala 67:45]
  wire  phts_1_clock; // @[IFU.scala 67:45]
  wire  phts_1_reset; // @[IFU.scala 67:45]
  wire  phts_1_io_update_valid; // @[IFU.scala 67:45]
  wire [4:0] phts_1_io_update_bits_idx; // @[IFU.scala 67:45]
  wire  phts_1_io_update_bits_brTaken; // @[IFU.scala 67:45]
  wire [4:0] phts_1_io_index; // @[IFU.scala 67:45]
  wire  phts_1_io_brTaken; // @[IFU.scala 67:45]
  wire  phts_2_clock; // @[IFU.scala 67:45]
  wire  phts_2_reset; // @[IFU.scala 67:45]
  wire  phts_2_io_update_valid; // @[IFU.scala 67:45]
  wire [4:0] phts_2_io_update_bits_idx; // @[IFU.scala 67:45]
  wire  phts_2_io_update_bits_brTaken; // @[IFU.scala 67:45]
  wire [4:0] phts_2_io_index; // @[IFU.scala 67:45]
  wire  phts_2_io_brTaken; // @[IFU.scala 67:45]
  wire  phts_3_clock; // @[IFU.scala 67:45]
  wire  phts_3_reset; // @[IFU.scala 67:45]
  wire  phts_3_io_update_valid; // @[IFU.scala 67:45]
  wire [4:0] phts_3_io_update_bits_idx; // @[IFU.scala 67:45]
  wire  phts_3_io_update_bits_brTaken; // @[IFU.scala 67:45]
  wire [4:0] phts_3_io_index; // @[IFU.scala 67:45]
  wire  phts_3_io_brTaken; // @[IFU.scala 67:45]
  wire  backendRedirectQueue_clock; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_reset; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_enq_ready; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_enq_valid; // @[IFU.scala 94:38]
  wire [31:0] backendRedirectQueue_io_enq_bits_targetAddr; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_enq_bits_brTaken; // @[IFU.scala 94:38]
  wire [31:0] backendRedirectQueue_io_enq_bits_pc; // @[IFU.scala 94:38]
  wire [7:0] backendRedirectQueue_io_enq_bits_way; // @[IFU.scala 94:38]
  wire [3:0] backendRedirectQueue_io_enq_bits_idx; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_deq_ready; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_deq_valid; // @[IFU.scala 94:38]
  wire [31:0] backendRedirectQueue_io_deq_bits_targetAddr; // @[IFU.scala 94:38]
  wire  backendRedirectQueue_io_deq_bits_brTaken; // @[IFU.scala 94:38]
  wire [31:0] backendRedirectQueue_io_deq_bits_pc; // @[IFU.scala 94:38]
  wire [7:0] backendRedirectQueue_io_deq_bits_way; // @[IFU.scala 94:38]
  wire [3:0] backendRedirectQueue_io_deq_bits_idx; // @[IFU.scala 94:38]
  wire [31:0] preDecoders_0_io_inst; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_0_io_out_brType; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_0_io_out_wbType; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_0_io_out_lsuOp; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_0_io_out_aluOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_0_io_out_opr1; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_0_io_out_opr2; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_0_io_out_immSrc; // @[IFU.scala 170:52]
  wire  preDecoders_0_io_out_immSign; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_0_io_out_csrOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_0_io_out_excpType; // @[IFU.scala 170:52]
  wire [31:0] preDecoders_1_io_inst; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_1_io_out_brType; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_1_io_out_wbType; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_1_io_out_lsuOp; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_1_io_out_aluOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_1_io_out_opr1; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_1_io_out_opr2; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_1_io_out_immSrc; // @[IFU.scala 170:52]
  wire  preDecoders_1_io_out_immSign; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_1_io_out_csrOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_1_io_out_excpType; // @[IFU.scala 170:52]
  wire [31:0] preDecoders_2_io_inst; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_2_io_out_brType; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_2_io_out_wbType; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_2_io_out_lsuOp; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_2_io_out_aluOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_2_io_out_opr1; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_2_io_out_opr2; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_2_io_out_immSrc; // @[IFU.scala 170:52]
  wire  preDecoders_2_io_out_immSign; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_2_io_out_csrOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_2_io_out_excpType; // @[IFU.scala 170:52]
  wire [31:0] preDecoders_3_io_inst; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_3_io_out_brType; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_3_io_out_wbType; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_3_io_out_lsuOp; // @[IFU.scala 170:52]
  wire [4:0] preDecoders_3_io_out_aluOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_3_io_out_opr1; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_3_io_out_opr2; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_3_io_out_immSrc; // @[IFU.scala 170:52]
  wire  preDecoders_3_io_out_immSign; // @[IFU.scala 170:52]
  wire [2:0] preDecoders_3_io_out_csrOp; // @[IFU.scala 170:52]
  wire [3:0] preDecoders_3_io_out_excpType; // @[IFU.scala 170:52]
  wire [31:0] immGens_0_io_inst; // @[IFU.scala 184:48]
  wire [2:0] immGens_0_io_immSrc; // @[IFU.scala 184:48]
  wire  immGens_0_io_immSign; // @[IFU.scala 184:48]
  wire [31:0] immGens_0_io_imm; // @[IFU.scala 184:48]
  wire [31:0] immGens_1_io_inst; // @[IFU.scala 184:48]
  wire [2:0] immGens_1_io_immSrc; // @[IFU.scala 184:48]
  wire  immGens_1_io_immSign; // @[IFU.scala 184:48]
  wire [31:0] immGens_1_io_imm; // @[IFU.scala 184:48]
  wire [31:0] immGens_2_io_inst; // @[IFU.scala 184:48]
  wire [2:0] immGens_2_io_immSrc; // @[IFU.scala 184:48]
  wire  immGens_2_io_immSign; // @[IFU.scala 184:48]
  wire [31:0] immGens_2_io_imm; // @[IFU.scala 184:48]
  wire [31:0] immGens_3_io_inst; // @[IFU.scala 184:48]
  wire [2:0] immGens_3_io_immSrc; // @[IFU.scala 184:48]
  wire  immGens_3_io_immSign; // @[IFU.scala 184:48]
  wire [31:0] immGens_3_io_imm; // @[IFU.scala 184:48]
  reg [31:0] s0_pcReg; // @[IFU.scala 84:27]
  wire  isAlignAddr = ~(|s0_pcReg[3:0]); // @[IFU.scala 87:23]
  wire  _s0_lastPC_T = icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s0_lastPC; // @[Reg.scala 19:16]
  wire [31:0] _s0_pcNext4_T_1 = s0_pcReg + 32'h10; // @[IFU.scala 90:34]
  wire [4:0] _GEN_17 = {{1'd0}, s0_lastPC[3:0]}; // @[IFU.scala 91:48]
  wire [4:0] _s0_pcNext4_T_4 = 5'h10 - _GEN_17; // @[IFU.scala 91:48]
  wire [4:0] _s0_pcNext4_T_6 = {_s0_pcNext4_T_4[4:2], 2'h0}; // @[IFU.scala 91:88]
  wire [31:0] _GEN_18 = {{27'd0}, _s0_pcNext4_T_6}; // @[IFU.scala 91:35]
  wire [31:0] _s0_pcNext4_T_8 = s0_lastPC + _GEN_18; // @[IFU.scala 91:35]
  wire [31:0] s0_pcNext4 = isAlignAddr ? _s0_pcNext4_T_1 : _s0_pcNext4_T_8; // @[IFU.scala 89:25]
  wire  backendRedirect = backendRedirectQueue_io_deq_ready & backendRedirectQueue_io_deq_valid; // @[Decoupled.scala 51:35]
  reg  s0_firstFire; // @[Reg.scala 35:20]
  wire  _GEN_1 = _s0_lastPC_T ? 1'h0 : s0_firstFire; // @[Reg.scala 36:18 35:20 36:22]
  wire  _s0_preFetchInst_T_2 = ~s0_firstFire; // @[IFU.scala 103:30]
  wire  _s0_preFetchInst_T_3 = io_output_ready & io_output_valid; // @[Decoupled.scala 51:35]
  wire  _s0_preFetchInst_T_4 = _s0_preFetchInst_T_3 | backendRedirect; // @[IFU.scala 104:52]
  wire  _s0_preFetchInst_T_5 = ~s0_firstFire & _s0_preFetchInst_T_4; // @[IFU.scala 103:44]
  wire  s0_preFetchInst = s0_firstFire & s0_pcReg == 32'h0 | _s0_preFetchInst_T_5; // @[IFU.scala 102:68]
  reg [3:0] s1_brTaken; // @[Reg.scala 19:16]
  wire [3:0] preDecodeSigs_3_brType = preDecoders_3_io_out_brType; // @[IFU.scala 174:{32,32}]
  wire  s1_isBranchVec_3 = preDecodeSigs_3_brType != 4'h0 & preDecodeSigs_3_brType != 4'h2; // @[IFU.scala 176:69]
  wire [3:0] preDecodeSigs_2_brType = preDecoders_2_io_out_brType; // @[IFU.scala 174:{32,32}]
  wire  s1_isBranchVec_2 = preDecodeSigs_2_brType != 4'h0 & preDecodeSigs_2_brType != 4'h2; // @[IFU.scala 176:69]
  wire [3:0] preDecodeSigs_1_brType = preDecoders_1_io_out_brType; // @[IFU.scala 174:{32,32}]
  wire  s1_isBranchVec_1 = preDecodeSigs_1_brType != 4'h0 & preDecodeSigs_1_brType != 4'h2; // @[IFU.scala 176:69]
  wire [3:0] preDecodeSigs_0_brType = preDecoders_0_io_out_brType; // @[IFU.scala 174:{32,32}]
  wire  s1_isBranchVec_0 = preDecodeSigs_0_brType != 4'h0 & preDecodeSigs_0_brType != 4'h2; // @[IFU.scala 176:69]
  wire [3:0] _s1_isBranchMask_T = {s1_isBranchVec_3,s1_isBranchVec_2,s1_isBranchVec_1,s1_isBranchVec_0}; // @[Cat.scala 33:92]
  wire  icacheRespIsAlignAddr = ~(|icache_io_read_resp_bits_addr[3:0]); // @[IFU.scala 77:9]
  reg [2:0] s1_instSize; // @[Reg.scala 19:16]
  reg [31:0] s1_instPC; // @[Reg.scala 19:16]
  wire [2:0] _GEN_19 = {{1'd0}, s1_instPC[3:2]}; // @[IFU.scala 166:83]
  wire [2:0] _s1_instValidSize_T_2 = 3'h4 - _GEN_19; // @[IFU.scala 166:83]
  wire [2:0] s1_instValidSize = icacheRespIsAlignAddr ? s1_instSize : _s1_instValidSize_T_2; // @[IFU.scala 166:31]
  wire [2:0] _s1_instValidMask_T_2 = 3'h4 - s1_instValidSize; // @[IFU.scala 168:73]
  wire [10:0] _s1_instValidMask_T_3 = 11'hf << _s1_instValidMask_T_2; // @[IFU.scala 168:54]
  wire [3:0] s1_instValidMask = _s1_instValidMask_T_3[3:0]; // @[IFU.scala 168:94]
  wire [3:0] s1_isBranchMask = _s1_isBranchMask_T & s1_instValidMask; // @[IFU.scala 177:55]
  wire [3:0] s1_predictBrTakenOH = s1_brTaken & s1_isBranchMask; // @[IFU.scala 221:42]
  wire [3:0] _s1_chosenPredictBrTaken_T_4 = s1_predictBrTakenOH[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:70]
  wire [3:0] _s1_chosenPredictBrTaken_T_5 = s1_predictBrTakenOH[2] ? 4'h4 : _s1_chosenPredictBrTaken_T_4; // @[Mux.scala 47:70]
  wire [3:0] _s1_chosenPredictBrTaken_T_6 = s1_predictBrTakenOH[1] ? 4'h2 : _s1_chosenPredictBrTaken_T_5; // @[Mux.scala 47:70]
  wire [3:0] _s1_chosenPredictBrTaken_T_7 = s1_predictBrTakenOH[0] ? 4'h1 : _s1_chosenPredictBrTaken_T_6; // @[Mux.scala 47:70]
  wire  s1_chosenPredictBrTaken = |_s1_chosenPredictBrTaken_T_7; // @[IFU.scala 222:74]
  wire  s1_isJumpVec_3 = preDecodeSigs_3_brType == 4'h1; // @[IFU.scala 180:56]
  wire  s1_isJumpVec_2 = preDecodeSigs_2_brType == 4'h1; // @[IFU.scala 180:56]
  wire  s1_isJumpVec_1 = preDecodeSigs_1_brType == 4'h1; // @[IFU.scala 180:56]
  wire  s1_isJumpVec_0 = preDecodeSigs_0_brType == 4'h1; // @[IFU.scala 180:56]
  wire [3:0] _s1_isJumpMask_T = {s1_isJumpVec_3,s1_isJumpVec_2,s1_isJumpVec_1,s1_isJumpVec_0}; // @[Cat.scala 33:92]
  wire [3:0] s1_isJumpMask = _s1_isJumpMask_T & s1_instValidMask; // @[IFU.scala 181:51]
  wire [3:0] _s1_redirectJumpOH_T_4 = s1_isJumpMask[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:70]
  wire [3:0] _s1_redirectJumpOH_T_5 = s1_isJumpMask[2] ? 4'h4 : _s1_redirectJumpOH_T_4; // @[Mux.scala 47:70]
  wire [3:0] _s1_redirectJumpOH_T_6 = s1_isJumpMask[1] ? 4'h2 : _s1_redirectJumpOH_T_5; // @[Mux.scala 47:70]
  wire [3:0] s1_redirectJumpOH = s1_isJumpMask[0] ? 4'h1 : _s1_redirectJumpOH_T_6; // @[Mux.scala 47:70]
  wire  s1_redirectJump = |s1_redirectJumpOH; // @[IFU.scala 198:45]
  reg  s1_full; // @[IFU.scala 151:26]
  wire  s1_redirect = (s1_chosenPredictBrTaken | s1_redirectJump) & s1_full; // @[IFU.scala 225:65]
  wire [3:0] _s1_redirectOH_T = s1_isBranchMask & s1_brTaken; // @[IFU.scala 223:59]
  wire [3:0] _s1_redirectOH_T_1 = _s1_redirectOH_T | s1_redirectJumpOH; // @[IFU.scala 223:72]
  wire [3:0] _s1_redirectOH_T_6 = _s1_redirectOH_T_1[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:70]
  wire [3:0] _s1_redirectOH_T_7 = _s1_redirectOH_T_1[2] ? 4'h4 : _s1_redirectOH_T_6; // @[Mux.scala 47:70]
  wire [3:0] _s1_redirectOH_T_8 = _s1_redirectOH_T_1[1] ? 4'h2 : _s1_redirectOH_T_7; // @[Mux.scala 47:70]
  wire [3:0] s1_redirectOH = _s1_redirectOH_T_1[0] ? 4'h1 : _s1_redirectOH_T_8; // @[Mux.scala 47:70]
  wire [31:0] _s1_targetAddrVec_T_1 = immGens_0_io_imm + s1_instPC; // @[IFU.scala 190:87]
  wire [32:0] _s1_targetAddrVec_T_2 = {{1'd0}, _s1_targetAddrVec_T_1}; // @[IFU.scala 190:99]
  wire [31:0] s1_targetAddrVec_0 = _s1_targetAddrVec_T_2[31:0]; // @[IFU.scala 190:99]
  wire [31:0] _s1_targetAddrVec_T_5 = immGens_1_io_imm + s1_instPC; // @[IFU.scala 190:87]
  wire [31:0] s1_targetAddrVec_1 = _s1_targetAddrVec_T_5 + 32'h4; // @[IFU.scala 190:99]
  wire [31:0] _s1_targetAddrVec_T_9 = immGens_2_io_imm + s1_instPC; // @[IFU.scala 190:87]
  wire [31:0] s1_targetAddrVec_2 = _s1_targetAddrVec_T_9 + 32'h8; // @[IFU.scala 190:99]
  wire [31:0] _s1_targetAddrVec_T_13 = immGens_3_io_imm + s1_instPC; // @[IFU.scala 190:87]
  wire [31:0] s1_targetAddrVec_3 = _s1_targetAddrVec_T_13 + 32'hc; // @[IFU.scala 190:99]
  wire [31:0] _s1_targetAddr_T_4 = s1_redirectOH[2] ? s1_targetAddrVec_2 : s1_targetAddrVec_3; // @[Mux.scala 47:70]
  wire [31:0] _s1_targetAddr_T_5 = s1_redirectOH[1] ? s1_targetAddrVec_1 : _s1_targetAddr_T_4; // @[Mux.scala 47:70]
  wire [31:0] s1_targetAddr = s1_redirectOH[0] ? s1_targetAddrVec_0 : _s1_targetAddr_T_5; // @[Mux.scala 47:70]
  wire [31:0] _s0_pcNext_T = s1_redirect ? s1_targetAddr : s0_pcNext4; // @[IFU.scala 122:66]
  wire [31:0] s0_pcNext = backendRedirect ? backendRedirectQueue_io_deq_bits_targetAddr : _s0_pcNext_T; // @[IFU.scala 122:21]
  wire [31:0] _s0_nextPC_T = s1_redirect ? s1_targetAddr : s0_pcNext; // @[IFU.scala 111:97]
  wire [31:0] _s0_nextPC_T_1 = backendRedirect ? backendRedirectQueue_io_deq_bits_targetAddr : _s0_nextPC_T; // @[IFU.scala 111:52]
  wire [32:0] _btbs_0_io_read_req_bits_pc_T = {{1'd0}, icache_io_read_req_bits_addr}; // @[IFU.scala 132:45]
  wire [31:0] _btbs_1_io_read_req_bits_pc_T_1 = icache_io_read_req_bits_addr + 32'h4; // @[IFU.scala 132:45]
  wire [31:0] _btbs_2_io_read_req_bits_pc_T_1 = icache_io_read_req_bits_addr + 32'h8; // @[IFU.scala 132:45]
  wire [31:0] _btbs_3_io_read_req_bits_pc_T_1 = icache_io_read_req_bits_addr + 32'hc; // @[IFU.scala 132:45]
  wire [4:0] phtIdx = _btbs_0_io_read_req_bits_pc_T[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  wire [4:0] phtIdx_1 = _btbs_1_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  wire [4:0] phtIdx_2 = _btbs_2_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  wire [4:0] phtIdx_3 = _btbs_3_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  reg  s0_valid_REG; // @[IFU.scala 142:24]
  wire  _s0_valid_T_1 = ~io_redirect_valid; // @[IFU.scala 142:53]
  wire  s0_valid = s0_valid_REG & ~io_redirect_valid; // @[IFU.scala 142:50]
  reg  s1_valid_REG; // @[IFU.scala 232:25]
  reg  s1_instValid; // @[IFU.scala 228:31]
  wire  s1_valid = (s1_valid_REG | s1_instValid) & s1_full; // @[IFU.scala 232:54]
  wire  s1_fire = s1_valid & io_output_ready; // @[IFU.scala 152:28]
  wire  s1_ready = ~s1_full | s1_fire; // @[IFU.scala 154:26]
  wire  s1_latch = s0_valid & s1_ready; // @[IFU.scala 147:29]
  wire [3:0] _s1_brTaken_T = {phts_3_io_brTaken,phts_2_io_brTaken,phts_1_io_brTaken,phts_0_io_brTaken}; // @[Cat.scala 33:92]
  wire [67:0] s1_btbInfo_lo = {btbs_1_io_read_resp_hit,btbs_1_io_read_resp_target,btbs_1_io_read_resp_jump,
    btbs_0_io_read_resp_hit,btbs_0_io_read_resp_target,btbs_0_io_read_resp_jump}; // @[Cat.scala 33:92]
  wire [135:0] _s1_btbInfo_T_4 = {btbs_3_io_read_resp_hit,btbs_3_io_read_resp_target,btbs_3_io_read_resp_jump,
    btbs_2_io_read_resp_hit,btbs_2_io_read_resp_target,btbs_2_io_read_resp_jump,s1_btbInfo_lo}; // @[Cat.scala 33:92]
  reg [135:0] s1_btbInfo_r; // @[Reg.scala 19:16]
  wire  s1_btbInfo_0_hit = s1_btbInfo_r[33]; // @[IFU.scala 149:101]
  wire  s1_btbInfo_1_hit = s1_btbInfo_r[67]; // @[IFU.scala 149:101]
  wire  s1_btbInfo_2_hit = s1_btbInfo_r[101]; // @[IFU.scala 149:101]
  wire  s1_btbInfo_3_hit = s1_btbInfo_r[135]; // @[IFU.scala 149:101]
  reg [3:0] s1_predictIdx_0; // @[Reg.scala 19:16]
  reg [3:0] s1_predictIdx_1; // @[Reg.scala 19:16]
  reg [3:0] s1_predictIdx_2; // @[Reg.scala 19:16]
  reg [3:0] s1_predictIdx_3; // @[Reg.scala 19:16]
  wire [3:0] s0_predictIdx_0 = phtIdx[3:0]; // @[IFU.scala 135:33 138:26]
  wire [3:0] s0_predictIdx_1 = phtIdx_1[3:0]; // @[IFU.scala 135:33 138:26]
  wire [3:0] s0_predictIdx_2 = phtIdx_2[3:0]; // @[IFU.scala 135:33 138:26]
  wire [3:0] s0_predictIdx_3 = phtIdx_3[3:0]; // @[IFU.scala 135:33 138:26]
  wire  _GEN_9 = s1_full & s1_fire ? 1'h0 : s1_full; // @[IFU.scala 151:26 157:{35,45}]
  wire  _GEN_10 = s1_latch | _GEN_9; // @[IFU.scala 156:{20,30}]
  wire [127:0] _s1_insts_T = {icache_io_read_resp_bits_inst_3,icache_io_read_resp_bits_inst_2,
    icache_io_read_resp_bits_inst_1,icache_io_read_resp_bits_inst_0}; // @[Cat.scala 33:92]
  wire  _s1_insts_T_1 = icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
  reg [127:0] s1_insts_r; // @[Reg.scala 19:16]
  wire [1:0] redirectChosenOH_shiftAmount = backendRedirectQueue_io_deq_bits_way[1:0]; // @[OneHot.scala 63:49]
  wire [3:0] redirectChosenOH = 4'h1 << redirectChosenOH_shiftAmount; // @[OneHot.scala 64:12]
  wire  backendRedirectValid = backendRedirect & redirectChosenOH[0]; // @[IFU.scala 201:52]
  wire  s1_redirectValid = s1_redirectJumpOH[0] & ~s1_btbInfo_0_hit; // @[IFU.scala 202:53]
  wire [32:0] _btbs_0_io_write_bits_pc_T = {{1'd0}, s1_instPC}; // @[IFU.scala 207:89]
  wire  backendRedirectValid_1 = backendRedirect & redirectChosenOH[1]; // @[IFU.scala 201:52]
  wire  s1_redirectValid_1 = s1_redirectJumpOH[1] & ~s1_btbInfo_1_hit; // @[IFU.scala 202:53]
  wire [31:0] _btbs_1_io_write_bits_pc_T_1 = s1_instPC + 32'h4; // @[IFU.scala 207:89]
  wire  backendRedirectValid_2 = backendRedirect & redirectChosenOH[2]; // @[IFU.scala 201:52]
  wire  s1_redirectValid_2 = s1_redirectJumpOH[2] & ~s1_btbInfo_2_hit; // @[IFU.scala 202:53]
  wire [31:0] _btbs_2_io_write_bits_pc_T_1 = s1_instPC + 32'h8; // @[IFU.scala 207:89]
  wire  backendRedirectValid_3 = backendRedirect & redirectChosenOH[3]; // @[IFU.scala 201:52]
  wire  s1_redirectValid_3 = s1_redirectJumpOH[3] & ~s1_btbInfo_3_hit; // @[IFU.scala 202:53]
  wire [31:0] _btbs_3_io_write_bits_pc_T_1 = s1_instPC + 32'hc; // @[IFU.scala 207:89]
  wire [3:0] _phts_0_io_update_bits_idx_T = backendRedirectValid ? backendRedirectQueue_io_deq_bits_idx :
    s1_predictIdx_0; // @[IFU.scala 218:38]
  wire [3:0] _phts_1_io_update_bits_idx_T = backendRedirectValid_1 ? backendRedirectQueue_io_deq_bits_idx :
    s1_predictIdx_1; // @[IFU.scala 218:38]
  wire [3:0] _phts_2_io_update_bits_idx_T = backendRedirectValid_2 ? backendRedirectQueue_io_deq_bits_idx :
    s1_predictIdx_2; // @[IFU.scala 218:38]
  wire [3:0] _phts_3_io_update_bits_idx_T = backendRedirectValid_3 ? backendRedirectQueue_io_deq_bits_idx :
    s1_predictIdx_3; // @[IFU.scala 218:38]
  wire [3:0] _s1_chosenRedirectOH_T_4 = s1_redirectOH[3] ? 4'h8 : 4'h0; // @[Mux.scala 47:70]
  wire [3:0] _s1_chosenRedirectOH_T_5 = s1_redirectOH[2] ? 4'h4 : _s1_chosenRedirectOH_T_4; // @[Mux.scala 47:70]
  wire [3:0] _s1_chosenRedirectOH_T_6 = s1_redirectOH[1] ? 4'h2 : _s1_chosenRedirectOH_T_5; // @[Mux.scala 47:70]
  wire [3:0] s1_chosenRedirectOH = s1_redirectOH[0] ? 4'h1 : _s1_chosenRedirectOH_T_6; // @[Mux.scala 47:70]
  wire  _GEN_14 = s1_instValid & s1_latch ? 1'h0 : s1_instValid; // @[IFU.scala 228:31 230:{41,56}]
  wire  _GEN_15 = _s1_insts_T_1 | _GEN_14; // @[IFU.scala 229:{21,36}]
  wire [1:0] size_hi = s1_chosenRedirectOH[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] size_lo = s1_chosenRedirectOH[1:0]; // @[OneHot.scala 31:18]
  wire  _size_T = |size_hi; // @[OneHot.scala 32:14]
  wire [1:0] _size_T_1 = size_hi | size_lo; // @[OneHot.scala 32:28]
  wire [1:0] _size_T_3 = {_size_T,_size_T_1[1]}; // @[Cat.scala 33:92]
  wire [2:0] size = {{1'd0}, _size_T_3}; // @[IFU.scala 238:20 239:10]
  wire [2:0] _io_output_bits_size_T_1 = size + 3'h1; // @[IFU.scala 240:50]
  wire [3:0] _T_7 = s1_predictBrTakenOH | s1_isJumpMask; // @[IFU.scala 241:68]
  ICache icache ( // @[IFU.scala 51:24]
    .clock(icache_clock),
    .reset(icache_reset),
    .io_read_req_ready(icache_io_read_req_ready),
    .io_read_req_valid(icache_io_read_req_valid),
    .io_read_req_bits_addr(icache_io_read_req_bits_addr),
    .io_read_resp_ready(icache_io_read_resp_ready),
    .io_read_resp_valid(icache_io_read_resp_valid),
    .io_read_resp_bits_addr(icache_io_read_resp_bits_addr),
    .io_read_resp_bits_inst_0(icache_io_read_resp_bits_inst_0),
    .io_read_resp_bits_inst_1(icache_io_read_resp_bits_inst_1),
    .io_read_resp_bits_inst_2(icache_io_read_resp_bits_inst_2),
    .io_read_resp_bits_inst_3(icache_io_read_resp_bits_inst_3),
    .io_read_resp_bits_size(icache_io_read_resp_bits_size),
    .io_tlbus_req_ready(icache_io_tlbus_req_ready),
    .io_tlbus_req_valid(icache_io_tlbus_req_valid),
    .io_tlbus_req_bits_address(icache_io_tlbus_req_bits_address),
    .io_tlbus_resp_ready(icache_io_tlbus_resp_ready),
    .io_tlbus_resp_valid(icache_io_tlbus_resp_valid),
    .io_tlbus_resp_bits_opcode(icache_io_tlbus_resp_bits_opcode),
    .io_tlbus_resp_bits_data(icache_io_tlbus_resp_bits_data),
    .io_flush(icache_io_flush)
  );
  GHR ghr ( // @[IFU.scala 65:21]
    .clock(ghr_clock),
    .reset(ghr_reset),
    .io_update_valid(ghr_io_update_valid),
    .io_update_bits_brTaken(ghr_io_update_bits_brTaken),
    .io_out(ghr_io_out)
  );
  BTB btbs_0 ( // @[IFU.scala 66:45]
    .clock(btbs_0_clock),
    .reset(btbs_0_reset),
    .io_write_valid(btbs_0_io_write_valid),
    .io_write_bits_pc(btbs_0_io_write_bits_pc),
    .io_write_bits_jump(btbs_0_io_write_bits_jump),
    .io_write_bits_target(btbs_0_io_write_bits_target),
    .io_read_req_bits_pc(btbs_0_io_read_req_bits_pc),
    .io_read_resp_hit(btbs_0_io_read_resp_hit),
    .io_read_resp_target(btbs_0_io_read_resp_target),
    .io_read_resp_jump(btbs_0_io_read_resp_jump)
  );
  BTB btbs_1 ( // @[IFU.scala 66:45]
    .clock(btbs_1_clock),
    .reset(btbs_1_reset),
    .io_write_valid(btbs_1_io_write_valid),
    .io_write_bits_pc(btbs_1_io_write_bits_pc),
    .io_write_bits_jump(btbs_1_io_write_bits_jump),
    .io_write_bits_target(btbs_1_io_write_bits_target),
    .io_read_req_bits_pc(btbs_1_io_read_req_bits_pc),
    .io_read_resp_hit(btbs_1_io_read_resp_hit),
    .io_read_resp_target(btbs_1_io_read_resp_target),
    .io_read_resp_jump(btbs_1_io_read_resp_jump)
  );
  BTB btbs_2 ( // @[IFU.scala 66:45]
    .clock(btbs_2_clock),
    .reset(btbs_2_reset),
    .io_write_valid(btbs_2_io_write_valid),
    .io_write_bits_pc(btbs_2_io_write_bits_pc),
    .io_write_bits_jump(btbs_2_io_write_bits_jump),
    .io_write_bits_target(btbs_2_io_write_bits_target),
    .io_read_req_bits_pc(btbs_2_io_read_req_bits_pc),
    .io_read_resp_hit(btbs_2_io_read_resp_hit),
    .io_read_resp_target(btbs_2_io_read_resp_target),
    .io_read_resp_jump(btbs_2_io_read_resp_jump)
  );
  BTB btbs_3 ( // @[IFU.scala 66:45]
    .clock(btbs_3_clock),
    .reset(btbs_3_reset),
    .io_write_valid(btbs_3_io_write_valid),
    .io_write_bits_pc(btbs_3_io_write_bits_pc),
    .io_write_bits_jump(btbs_3_io_write_bits_jump),
    .io_write_bits_target(btbs_3_io_write_bits_target),
    .io_read_req_bits_pc(btbs_3_io_read_req_bits_pc),
    .io_read_resp_hit(btbs_3_io_read_resp_hit),
    .io_read_resp_target(btbs_3_io_read_resp_target),
    .io_read_resp_jump(btbs_3_io_read_resp_jump)
  );
  PHT phts_0 ( // @[IFU.scala 67:45]
    .clock(phts_0_clock),
    .reset(phts_0_reset),
    .io_update_valid(phts_0_io_update_valid),
    .io_update_bits_idx(phts_0_io_update_bits_idx),
    .io_update_bits_brTaken(phts_0_io_update_bits_brTaken),
    .io_index(phts_0_io_index),
    .io_brTaken(phts_0_io_brTaken)
  );
  PHT phts_1 ( // @[IFU.scala 67:45]
    .clock(phts_1_clock),
    .reset(phts_1_reset),
    .io_update_valid(phts_1_io_update_valid),
    .io_update_bits_idx(phts_1_io_update_bits_idx),
    .io_update_bits_brTaken(phts_1_io_update_bits_brTaken),
    .io_index(phts_1_io_index),
    .io_brTaken(phts_1_io_brTaken)
  );
  PHT phts_2 ( // @[IFU.scala 67:45]
    .clock(phts_2_clock),
    .reset(phts_2_reset),
    .io_update_valid(phts_2_io_update_valid),
    .io_update_bits_idx(phts_2_io_update_bits_idx),
    .io_update_bits_brTaken(phts_2_io_update_bits_brTaken),
    .io_index(phts_2_io_index),
    .io_brTaken(phts_2_io_brTaken)
  );
  PHT phts_3 ( // @[IFU.scala 67:45]
    .clock(phts_3_clock),
    .reset(phts_3_reset),
    .io_update_valid(phts_3_io_update_valid),
    .io_update_bits_idx(phts_3_io_update_bits_idx),
    .io_update_bits_brTaken(phts_3_io_update_bits_brTaken),
    .io_index(phts_3_io_index),
    .io_brTaken(phts_3_io_brTaken)
  );
  Queue_5 backendRedirectQueue ( // @[IFU.scala 94:38]
    .clock(backendRedirectQueue_clock),
    .reset(backendRedirectQueue_reset),
    .io_enq_ready(backendRedirectQueue_io_enq_ready),
    .io_enq_valid(backendRedirectQueue_io_enq_valid),
    .io_enq_bits_targetAddr(backendRedirectQueue_io_enq_bits_targetAddr),
    .io_enq_bits_brTaken(backendRedirectQueue_io_enq_bits_brTaken),
    .io_enq_bits_pc(backendRedirectQueue_io_enq_bits_pc),
    .io_enq_bits_way(backendRedirectQueue_io_enq_bits_way),
    .io_enq_bits_idx(backendRedirectQueue_io_enq_bits_idx),
    .io_deq_ready(backendRedirectQueue_io_deq_ready),
    .io_deq_valid(backendRedirectQueue_io_deq_valid),
    .io_deq_bits_targetAddr(backendRedirectQueue_io_deq_bits_targetAddr),
    .io_deq_bits_brTaken(backendRedirectQueue_io_deq_bits_brTaken),
    .io_deq_bits_pc(backendRedirectQueue_io_deq_bits_pc),
    .io_deq_bits_way(backendRedirectQueue_io_deq_bits_way),
    .io_deq_bits_idx(backendRedirectQueue_io_deq_bits_idx)
  );
  Decoder_1 preDecoders_0 ( // @[IFU.scala 170:52]
    .io_inst(preDecoders_0_io_inst),
    .io_out_brType(preDecoders_0_io_out_brType),
    .io_out_wbType(preDecoders_0_io_out_wbType),
    .io_out_lsuOp(preDecoders_0_io_out_lsuOp),
    .io_out_aluOp(preDecoders_0_io_out_aluOp),
    .io_out_opr1(preDecoders_0_io_out_opr1),
    .io_out_opr2(preDecoders_0_io_out_opr2),
    .io_out_immSrc(preDecoders_0_io_out_immSrc),
    .io_out_immSign(preDecoders_0_io_out_immSign),
    .io_out_csrOp(preDecoders_0_io_out_csrOp),
    .io_out_excpType(preDecoders_0_io_out_excpType)
  );
  Decoder_1 preDecoders_1 ( // @[IFU.scala 170:52]
    .io_inst(preDecoders_1_io_inst),
    .io_out_brType(preDecoders_1_io_out_brType),
    .io_out_wbType(preDecoders_1_io_out_wbType),
    .io_out_lsuOp(preDecoders_1_io_out_lsuOp),
    .io_out_aluOp(preDecoders_1_io_out_aluOp),
    .io_out_opr1(preDecoders_1_io_out_opr1),
    .io_out_opr2(preDecoders_1_io_out_opr2),
    .io_out_immSrc(preDecoders_1_io_out_immSrc),
    .io_out_immSign(preDecoders_1_io_out_immSign),
    .io_out_csrOp(preDecoders_1_io_out_csrOp),
    .io_out_excpType(preDecoders_1_io_out_excpType)
  );
  Decoder_1 preDecoders_2 ( // @[IFU.scala 170:52]
    .io_inst(preDecoders_2_io_inst),
    .io_out_brType(preDecoders_2_io_out_brType),
    .io_out_wbType(preDecoders_2_io_out_wbType),
    .io_out_lsuOp(preDecoders_2_io_out_lsuOp),
    .io_out_aluOp(preDecoders_2_io_out_aluOp),
    .io_out_opr1(preDecoders_2_io_out_opr1),
    .io_out_opr2(preDecoders_2_io_out_opr2),
    .io_out_immSrc(preDecoders_2_io_out_immSrc),
    .io_out_immSign(preDecoders_2_io_out_immSign),
    .io_out_csrOp(preDecoders_2_io_out_csrOp),
    .io_out_excpType(preDecoders_2_io_out_excpType)
  );
  Decoder_1 preDecoders_3 ( // @[IFU.scala 170:52]
    .io_inst(preDecoders_3_io_inst),
    .io_out_brType(preDecoders_3_io_out_brType),
    .io_out_wbType(preDecoders_3_io_out_wbType),
    .io_out_lsuOp(preDecoders_3_io_out_lsuOp),
    .io_out_aluOp(preDecoders_3_io_out_aluOp),
    .io_out_opr1(preDecoders_3_io_out_opr1),
    .io_out_opr2(preDecoders_3_io_out_opr2),
    .io_out_immSrc(preDecoders_3_io_out_immSrc),
    .io_out_immSign(preDecoders_3_io_out_immSign),
    .io_out_csrOp(preDecoders_3_io_out_csrOp),
    .io_out_excpType(preDecoders_3_io_out_excpType)
  );
  ImmGen immGens_0 ( // @[IFU.scala 184:48]
    .io_inst(immGens_0_io_inst),
    .io_immSrc(immGens_0_io_immSrc),
    .io_immSign(immGens_0_io_immSign),
    .io_imm(immGens_0_io_imm)
  );
  ImmGen immGens_1 ( // @[IFU.scala 184:48]
    .io_inst(immGens_1_io_inst),
    .io_immSrc(immGens_1_io_immSrc),
    .io_immSign(immGens_1_io_immSign),
    .io_imm(immGens_1_io_imm)
  );
  ImmGen immGens_2 ( // @[IFU.scala 184:48]
    .io_inst(immGens_2_io_inst),
    .io_immSrc(immGens_2_io_immSrc),
    .io_immSign(immGens_2_io_immSign),
    .io_imm(immGens_2_io_imm)
  );
  ImmGen immGens_3 ( // @[IFU.scala 184:48]
    .io_inst(immGens_3_io_inst),
    .io_immSrc(immGens_3_io_immSrc),
    .io_immSign(immGens_3_io_immSign),
    .io_imm(immGens_3_io_imm)
  );
  assign io_output_valid = s1_valid & _s0_valid_T_1; // @[IFU.scala 235:33]
  assign io_output_bits_inst_0 = s1_insts_r[31:0]; // @[IFU.scala 161:78]
  assign io_output_bits_inst_1 = s1_insts_r[63:32]; // @[IFU.scala 161:78]
  assign io_output_bits_inst_2 = s1_insts_r[95:64]; // @[IFU.scala 161:78]
  assign io_output_bits_inst_3 = s1_insts_r[127:96]; // @[IFU.scala 161:78]
  assign io_output_bits_pc = s1_instPC; // @[IFU.scala 237:23]
  assign io_output_bits_size = s1_redirect ? _io_output_bits_size_T_1 : s1_instValidSize; // @[IFU.scala 240:31]
  assign io_output_bits_predictBrTaken_0 = _T_7[0]; // @[IFU.scala 241:85]
  assign io_output_bits_predictBrTaken_1 = _T_7[1]; // @[IFU.scala 241:85]
  assign io_output_bits_predictBrTaken_2 = _T_7[2]; // @[IFU.scala 241:85]
  assign io_output_bits_predictBrTaken_3 = _T_7[3]; // @[IFU.scala 241:85]
  assign io_output_bits_predictIdx_0 = s1_predictIdx_0; // @[IFU.scala 242:31]
  assign io_output_bits_predictIdx_1 = s1_predictIdx_1; // @[IFU.scala 242:31]
  assign io_output_bits_predictIdx_2 = s1_predictIdx_2; // @[IFU.scala 242:31]
  assign io_output_bits_predictIdx_3 = s1_predictIdx_3; // @[IFU.scala 242:31]
  assign io_tlbus_req_valid = icache_io_tlbus_req_valid; // @[IFU.scala 63:21]
  assign io_tlbus_req_bits_address = icache_io_tlbus_req_bits_address; // @[IFU.scala 63:21]
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_io_read_req_valid = s0_preFetchInst & io_start; // @[IFU.scala 114:49]
  assign icache_io_read_req_bits_addr = s0_firstFire ? s0_pcReg : _s0_nextPC_T_1; // @[IFU.scala 111:24]
  assign icache_io_read_resp_ready = 1'h1; // @[IFU.scala 160:16]
  assign icache_io_tlbus_req_ready = io_tlbus_req_ready; // @[IFU.scala 63:21]
  assign icache_io_tlbus_resp_valid = io_tlbus_resp_valid; // @[IFU.scala 63:21]
  assign icache_io_tlbus_resp_bits_opcode = io_tlbus_resp_bits_opcode; // @[IFU.scala 63:21]
  assign icache_io_tlbus_resp_bits_data = io_tlbus_resp_bits_data; // @[IFU.scala 63:21]
  assign icache_io_flush = io_redirect_valid; // @[IFU.scala 116:21]
  assign ghr_clock = clock;
  assign ghr_reset = reset;
  assign ghr_io_update_valid = backendRedirectQueue_io_deq_ready & backendRedirectQueue_io_deq_valid; // @[Decoupled.scala 51:35]
  assign ghr_io_update_bits_brTaken = backendRedirectQueue_io_deq_bits_brTaken; // @[IFU.scala 128:32]
  assign btbs_0_clock = clock;
  assign btbs_0_reset = reset;
  assign btbs_0_io_write_valid = backendRedirectValid | s1_redirectValid; // @[IFU.scala 203:42]
  assign btbs_0_io_write_bits_pc = backendRedirectValid ? backendRedirectQueue_io_deq_bits_pc :
    _btbs_0_io_write_bits_pc_T[31:0]; // @[IFU.scala 207:36]
  assign btbs_0_io_write_bits_jump = backendRedirectValid ? 1'h0 : s1_isJumpVec_0; // @[IFU.scala 206:38]
  assign btbs_0_io_write_bits_target = backendRedirectValid ? backendRedirectQueue_io_deq_bits_targetAddr :
    s1_targetAddrVec_0; // @[IFU.scala 208:40]
  assign btbs_0_io_read_req_bits_pc = _btbs_0_io_read_req_bits_pc_T[31:0]; // @[IFU.scala 132:45]
  assign btbs_1_clock = clock;
  assign btbs_1_reset = reset;
  assign btbs_1_io_write_valid = backendRedirectValid_1 | s1_redirectValid_1; // @[IFU.scala 203:42]
  assign btbs_1_io_write_bits_pc = backendRedirectValid_1 ? backendRedirectQueue_io_deq_bits_pc :
    _btbs_1_io_write_bits_pc_T_1; // @[IFU.scala 207:36]
  assign btbs_1_io_write_bits_jump = backendRedirectValid_1 ? 1'h0 : s1_isJumpVec_1; // @[IFU.scala 206:38]
  assign btbs_1_io_write_bits_target = backendRedirectValid_1 ? backendRedirectQueue_io_deq_bits_targetAddr :
    s1_targetAddrVec_1; // @[IFU.scala 208:40]
  assign btbs_1_io_read_req_bits_pc = icache_io_read_req_bits_addr + 32'h4; // @[IFU.scala 132:45]
  assign btbs_2_clock = clock;
  assign btbs_2_reset = reset;
  assign btbs_2_io_write_valid = backendRedirectValid_2 | s1_redirectValid_2; // @[IFU.scala 203:42]
  assign btbs_2_io_write_bits_pc = backendRedirectValid_2 ? backendRedirectQueue_io_deq_bits_pc :
    _btbs_2_io_write_bits_pc_T_1; // @[IFU.scala 207:36]
  assign btbs_2_io_write_bits_jump = backendRedirectValid_2 ? 1'h0 : s1_isJumpVec_2; // @[IFU.scala 206:38]
  assign btbs_2_io_write_bits_target = backendRedirectValid_2 ? backendRedirectQueue_io_deq_bits_targetAddr :
    s1_targetAddrVec_2; // @[IFU.scala 208:40]
  assign btbs_2_io_read_req_bits_pc = icache_io_read_req_bits_addr + 32'h8; // @[IFU.scala 132:45]
  assign btbs_3_clock = clock;
  assign btbs_3_reset = reset;
  assign btbs_3_io_write_valid = backendRedirectValid_3 | s1_redirectValid_3; // @[IFU.scala 203:42]
  assign btbs_3_io_write_bits_pc = backendRedirectValid_3 ? backendRedirectQueue_io_deq_bits_pc :
    _btbs_3_io_write_bits_pc_T_1; // @[IFU.scala 207:36]
  assign btbs_3_io_write_bits_jump = backendRedirectValid_3 ? 1'h0 : s1_isJumpVec_3; // @[IFU.scala 206:38]
  assign btbs_3_io_write_bits_target = backendRedirectValid_3 ? backendRedirectQueue_io_deq_bits_targetAddr :
    s1_targetAddrVec_3; // @[IFU.scala 208:40]
  assign btbs_3_io_read_req_bits_pc = icache_io_read_req_bits_addr + 32'hc; // @[IFU.scala 132:45]
  assign phts_0_clock = clock;
  assign phts_0_reset = reset;
  assign phts_0_io_update_valid = backendRedirectValid | s1_redirectValid; // @[IFU.scala 214:42]
  assign phts_0_io_update_bits_idx = {{1'd0}, _phts_0_io_update_bits_idx_T}; // @[IFU.scala 218:32]
  assign phts_0_io_update_bits_brTaken = backendRedirectValid ? backendRedirectQueue_io_deq_bits_brTaken : 1'h1; // @[IFU.scala 217:42]
  assign phts_0_io_index = _btbs_0_io_read_req_bits_pc_T[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  assign phts_1_clock = clock;
  assign phts_1_reset = reset;
  assign phts_1_io_update_valid = backendRedirectValid_1 | s1_redirectValid_1; // @[IFU.scala 214:42]
  assign phts_1_io_update_bits_idx = {{1'd0}, _phts_1_io_update_bits_idx_T}; // @[IFU.scala 218:32]
  assign phts_1_io_update_bits_brTaken = backendRedirectValid_1 ? backendRedirectQueue_io_deq_bits_brTaken : 1'h1; // @[IFU.scala 217:42]
  assign phts_1_io_index = _btbs_1_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  assign phts_2_clock = clock;
  assign phts_2_reset = reset;
  assign phts_2_io_update_valid = backendRedirectValid_2 | s1_redirectValid_2; // @[IFU.scala 214:42]
  assign phts_2_io_update_bits_idx = {{1'd0}, _phts_2_io_update_bits_idx_T}; // @[IFU.scala 218:32]
  assign phts_2_io_update_bits_brTaken = backendRedirectValid_2 ? backendRedirectQueue_io_deq_bits_brTaken : 1'h1; // @[IFU.scala 217:42]
  assign phts_2_io_index = _btbs_2_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  assign phts_3_clock = clock;
  assign phts_3_reset = reset;
  assign phts_3_io_update_valid = backendRedirectValid_3 | s1_redirectValid_3; // @[IFU.scala 214:42]
  assign phts_3_io_update_bits_idx = {{1'd0}, _phts_3_io_update_bits_idx_T}; // @[IFU.scala 218:32]
  assign phts_3_io_update_bits_brTaken = backendRedirectValid_3 ? backendRedirectQueue_io_deq_bits_brTaken : 1'h1; // @[IFU.scala 217:42]
  assign phts_3_io_index = _btbs_3_io_read_req_bits_pc_T_1[6:2] ^ ghr_io_out; // @[IFU.scala 137:98]
  assign backendRedirectQueue_clock = clock;
  assign backendRedirectQueue_reset = reset;
  assign backendRedirectQueue_io_enq_valid = io_redirect_valid; // @[IFU.scala 96:39]
  assign backendRedirectQueue_io_enq_bits_targetAddr = io_redirect_bits_targetAddr; // @[IFU.scala 95:38]
  assign backendRedirectQueue_io_enq_bits_brTaken = io_redirect_bits_brTaken; // @[IFU.scala 95:38]
  assign backendRedirectQueue_io_enq_bits_pc = io_redirect_bits_pc; // @[IFU.scala 95:38]
  assign backendRedirectQueue_io_enq_bits_way = io_redirect_bits_way; // @[IFU.scala 95:38]
  assign backendRedirectQueue_io_enq_bits_idx = io_redirect_bits_idx; // @[IFU.scala 95:38]
  assign backendRedirectQueue_io_deq_ready = icache_io_read_req_ready; // @[IFU.scala 97:39]
  assign preDecoders_0_io_inst = s1_insts_r[31:0]; // @[IFU.scala 161:78]
  assign preDecoders_1_io_inst = s1_insts_r[63:32]; // @[IFU.scala 161:78]
  assign preDecoders_2_io_inst = s1_insts_r[95:64]; // @[IFU.scala 161:78]
  assign preDecoders_3_io_inst = s1_insts_r[127:96]; // @[IFU.scala 161:78]
  assign immGens_0_io_inst = s1_insts_r[31:0]; // @[IFU.scala 161:78]
  assign immGens_0_io_immSrc = preDecoders_0_io_out_immSrc; // @[IFU.scala 174:{32,32}]
  assign immGens_0_io_immSign = preDecoders_0_io_out_immSign; // @[IFU.scala 174:{32,32}]
  assign immGens_1_io_inst = s1_insts_r[63:32]; // @[IFU.scala 161:78]
  assign immGens_1_io_immSrc = preDecoders_1_io_out_immSrc; // @[IFU.scala 174:{32,32}]
  assign immGens_1_io_immSign = preDecoders_1_io_out_immSign; // @[IFU.scala 174:{32,32}]
  assign immGens_2_io_inst = s1_insts_r[95:64]; // @[IFU.scala 161:78]
  assign immGens_2_io_immSrc = preDecoders_2_io_out_immSrc; // @[IFU.scala 174:{32,32}]
  assign immGens_2_io_immSign = preDecoders_2_io_out_immSign; // @[IFU.scala 174:{32,32}]
  assign immGens_3_io_inst = s1_insts_r[127:96]; // @[IFU.scala 161:78]
  assign immGens_3_io_immSrc = preDecoders_3_io_out_immSrc; // @[IFU.scala 174:{32,32}]
  assign immGens_3_io_immSign = preDecoders_3_io_out_immSign; // @[IFU.scala 174:{32,32}]
  always @(posedge clock) begin
    if (reset) begin // @[IFU.scala 84:27]
      s0_pcReg <= 32'h0; // @[IFU.scala 84:27]
    end else if (_s0_lastPC_T & _s0_preFetchInst_T_2) begin // @[IFU.scala 119:52]
      if (backendRedirect) begin // @[IFU.scala 122:21]
        s0_pcReg <= backendRedirectQueue_io_deq_bits_targetAddr;
      end else if (s1_redirect) begin // @[IFU.scala 122:66]
        s0_pcReg <= s1_targetAddr;
      end else begin
        s0_pcReg <= s0_pcNext4;
      end
    end
    if (_s0_lastPC_T) begin // @[Reg.scala 20:18]
      s0_lastPC <= icache_io_read_req_bits_addr; // @[Reg.scala 20:22]
    end
    s0_firstFire <= reset | _GEN_1; // @[Reg.scala 35:{20,20}]
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_brTaken <= _s1_brTaken_T; // @[Reg.scala 20:22]
    end
    if (_s1_insts_T_1) begin // @[Reg.scala 20:18]
      s1_instSize <= icache_io_read_resp_bits_size; // @[Reg.scala 20:22]
    end
    if (_s1_insts_T_1) begin // @[Reg.scala 20:18]
      s1_instPC <= icache_io_read_resp_bits_addr; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[IFU.scala 151:26]
      s1_full <= 1'h0; // @[IFU.scala 151:26]
    end else if (io_redirect_valid) begin // @[IFU.scala 244:28]
      s1_full <= 1'h0; // @[IFU.scala 245:17]
    end else begin
      s1_full <= _GEN_10;
    end
    s0_valid_REG <= icache_io_read_req_ready & icache_io_read_req_valid; // @[Decoupled.scala 51:35]
    s1_valid_REG <= icache_io_read_resp_ready & icache_io_read_resp_valid; // @[Decoupled.scala 51:35]
    if (reset) begin // @[IFU.scala 228:31]
      s1_instValid <= 1'h0; // @[IFU.scala 228:31]
    end else begin
      s1_instValid <= _GEN_15;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_btbInfo_r <= _s1_btbInfo_T_4; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_predictIdx_0 <= s0_predictIdx_0; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_predictIdx_1 <= s0_predictIdx_1; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_predictIdx_2 <= s0_predictIdx_2; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_predictIdx_3 <= s0_predictIdx_3; // @[Reg.scala 20:22]
    end
    if (_s1_insts_T_1) begin // @[Reg.scala 20:18]
      s1_insts_r <= _s1_insts_T; // @[Reg.scala 20:22]
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
  s0_pcReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  s0_lastPC = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s0_firstFire = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_brTaken = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_instSize = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  s1_instPC = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s1_full = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s0_valid_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_valid_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_instValid = _RAND_9[0:0];
  _RAND_10 = {5{`RANDOM}};
  s1_btbInfo_r = _RAND_10[135:0];
  _RAND_11 = {1{`RANDOM}};
  s1_predictIdx_0 = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  s1_predictIdx_1 = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  s1_predictIdx_2 = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  s1_predictIdx_3 = _RAND_14[3:0];
  _RAND_15 = {4{`RANDOM}};
  s1_insts_r = _RAND_15[127:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
