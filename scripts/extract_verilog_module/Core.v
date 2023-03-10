module Fetch(
  input         clock,
  input         reset,
  input         io_in_start,
  output        io_in_execute_ready,
  input         io_in_execute_bits_brTaken,
  input  [31:0] io_in_execute_bits_targetAddr,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  input         io_rom_resp_valid,
  input  [31:0] io_trapVec,
  input  [31:0] io_mepc,
  input         io_excp_valid,
  input         io_excp_bits_isMret
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  instMem_clock; // @[1_Fetch.scala 52:25]
  wire  instMem_reset; // @[1_Fetch.scala 52:25]
  wire  instMem_wen; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_waddr; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_wdata; // @[1_Fetch.scala 52:25]
  wire [3:0] instMem_wmask; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_raddr; // @[1_Fetch.scala 52:25]
  wire [31:0] instMem_rdata; // @[1_Fetch.scala 52:25]
  wire  commit = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  reg [31:0] pcReg; // @[1_Fetch.scala 46:24]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 49:25]
  wire [31:0] _pcNext_T = io_excp_bits_isMret ? io_mepc : io_trapVec; // @[1_Fetch.scala 74:37]
  wire [31:0] _pcNext_T_1 = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 75:20]
  wire [31:0] pcNext = io_excp_valid ? _pcNext_T : _pcNext_T_1; // @[1_Fetch.scala 74:18]
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) instMem ( // @[1_Fetch.scala 52:25]
    .clock(instMem_clock),
    .reset(instMem_reset),
    .wen(instMem_wen),
    .waddr(instMem_waddr),
    .wdata(instMem_wdata),
    .wmask(instMem_wmask),
    .raddr(instMem_raddr),
    .rdata(instMem_rdata)
  );
  assign io_in_execute_ready = io_in_start; // @[1_Fetch.scala 42:40]
  assign io_out_valid = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 49:25]
  assign io_out_bits_instState_commit = io_out_ready & io_in_start & io_rom_resp_valid; // @[1_Fetch.scala 44:56]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 82:30]
  assign io_out_bits_instState_inst = instMem_rdata; // @[1_Fetch.scala 50:24 59:10]
  assign instMem_clock = clock; // @[1_Fetch.scala 54:22]
  assign instMem_reset = reset; // @[1_Fetch.scala 55:22]
  assign instMem_wen = 1'h0;
  assign instMem_waddr = 32'h0;
  assign instMem_wdata = 32'h0;
  assign instMem_wmask = 4'h0;
  assign instMem_raddr = commit ? pcNext : pcReg; // @[1_Fetch.scala 76:14]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 46:24]
      pcReg <= 32'h0; // @[1_Fetch.scala 46:24]
    end else if (commit) begin // @[1_Fetch.scala 76:14]
      if (io_excp_valid) begin // @[1_Fetch.scala 74:18]
        if (io_excp_bits_isMret) begin // @[1_Fetch.scala 74:37]
          pcReg <= io_mepc;
        end else begin
          pcReg <= io_trapVec;
        end
      end else if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 75:20]
        pcReg <= io_in_execute_bits_targetAddr;
      end else begin
        pcReg <= pcNext4;
      end
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
  pcReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Decoder(
  input  [31:0] io_inst,
  output        io_out_isBranch,
  output [1:0]  io_out_resultSrc,
  output [3:0]  io_out_aluOpSel,
  output [4:0]  io_out_lsuOp,
  output [3:0]  io_out_aluSrc1,
  output [3:0]  io_out_aluSrc2,
  output [1:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn,
  output [2:0]  io_out_csrOp,
  output [3:0]  io_out_excType
);
  wire [31:0] _decodeSigs_T = io_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_1 = 32'h3 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_3 = 32'h1003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_5 = 32'h2003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_7 = 32'h4003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_9 = 32'h5003 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_11 = 32'h13 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_12 = io_inst & 32'hfc00707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_13 = 32'h1013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_15 = 32'h2013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_17 = 32'h3013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_19 = 32'h4013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_21 = 32'h5013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_23 = 32'h40005013 == _decodeSigs_T_12; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_25 = 32'h6013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_27 = 32'h7013 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_28 = io_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_29 = 32'h17 == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_31 = 32'h23 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_33 = 32'h1023 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_35 = 32'h2023 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire [31:0] _decodeSigs_T_36 = io_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_37 = 32'h33 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_39 = 32'h40000033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_41 = 32'h1033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_43 = 32'h2033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_45 = 32'h3033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_47 = 32'h4033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_49 = 32'h5033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_51 = 32'h40005033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_53 = 32'h6033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_55 = 32'h7033 == _decodeSigs_T_36; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_57 = 32'h37 == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_59 = 32'h63 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_61 = 32'h1063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_63 = 32'h4063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_65 = 32'h5063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_67 = 32'h6063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_69 = 32'h7063 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_71 = 32'h67 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_73 = 32'h6f == _decodeSigs_T_28; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_75 = 32'hf == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_77 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_79 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_81 = 32'h30200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_83 = 32'h10200073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_85 = 32'h1073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_87 = 32'h2073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_89 = 32'h3073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_91 = 32'h5073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_93 = 32'h6073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_95 = 32'h7073 == _decodeSigs_T; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_115 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_59 | (_decodeSigs_T_61 | (_decodeSigs_T_63 | (
    _decodeSigs_T_65 | (_decodeSigs_T_67 | _decodeSigs_T_69)))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_116 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_115; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_117 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_116; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_118 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_117; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_119 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_118; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_120 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_119; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_121 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_120; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_122 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_121; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_123 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_122; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_124 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_123; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_125 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_124; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_126 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_125; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_127 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_126; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_128 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_127; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_129 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_128; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_130 = _decodeSigs_T_27 ? 1'h0 : _decodeSigs_T_129; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_131 = _decodeSigs_T_25 ? 1'h0 : _decodeSigs_T_130; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_132 = _decodeSigs_T_23 ? 1'h0 : _decodeSigs_T_131; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_133 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_132; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_134 = _decodeSigs_T_19 ? 1'h0 : _decodeSigs_T_133; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_135 = _decodeSigs_T_17 ? 1'h0 : _decodeSigs_T_134; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_136 = _decodeSigs_T_15 ? 1'h0 : _decodeSigs_T_135; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_137 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_136; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_138 = _decodeSigs_T_11 ? 1'h0 : _decodeSigs_T_137; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_139 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_138; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_140 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_139; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_141 = _decodeSigs_T_5 ? 1'h0 : _decodeSigs_T_140; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_142 = _decodeSigs_T_3 ? 1'h0 : _decodeSigs_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_143 = _decodeSigs_T_95 ? 2'h3 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_144 = _decodeSigs_T_93 ? 2'h3 : _decodeSigs_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_145 = _decodeSigs_T_91 ? 2'h3 : _decodeSigs_T_144; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_146 = _decodeSigs_T_89 ? 2'h3 : _decodeSigs_T_145; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_147 = _decodeSigs_T_87 ? 2'h3 : _decodeSigs_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_148 = _decodeSigs_T_85 ? 2'h3 : _decodeSigs_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_149 = _decodeSigs_T_83 ? 2'h0 : _decodeSigs_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_150 = _decodeSigs_T_81 ? 2'h0 : _decodeSigs_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_151 = _decodeSigs_T_79 ? 2'h0 : _decodeSigs_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_152 = _decodeSigs_T_77 ? 2'h0 : _decodeSigs_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_153 = _decodeSigs_T_75 ? 2'h0 : _decodeSigs_T_152; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_154 = _decodeSigs_T_73 ? 2'h2 : _decodeSigs_T_153; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_155 = _decodeSigs_T_71 ? 2'h2 : _decodeSigs_T_154; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_156 = _decodeSigs_T_69 ? 2'h0 : _decodeSigs_T_155; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_157 = _decodeSigs_T_67 ? 2'h0 : _decodeSigs_T_156; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_158 = _decodeSigs_T_65 ? 2'h0 : _decodeSigs_T_157; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_159 = _decodeSigs_T_63 ? 2'h0 : _decodeSigs_T_158; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_160 = _decodeSigs_T_61 ? 2'h0 : _decodeSigs_T_159; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_161 = _decodeSigs_T_59 ? 2'h0 : _decodeSigs_T_160; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_162 = _decodeSigs_T_57 ? 2'h0 : _decodeSigs_T_161; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_163 = _decodeSigs_T_55 ? 2'h0 : _decodeSigs_T_162; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_164 = _decodeSigs_T_53 ? 2'h0 : _decodeSigs_T_163; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_165 = _decodeSigs_T_51 ? 2'h0 : _decodeSigs_T_164; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_166 = _decodeSigs_T_49 ? 2'h0 : _decodeSigs_T_165; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_167 = _decodeSigs_T_47 ? 2'h0 : _decodeSigs_T_166; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_168 = _decodeSigs_T_45 ? 2'h0 : _decodeSigs_T_167; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_169 = _decodeSigs_T_43 ? 2'h0 : _decodeSigs_T_168; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_170 = _decodeSigs_T_41 ? 2'h0 : _decodeSigs_T_169; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_171 = _decodeSigs_T_39 ? 2'h0 : _decodeSigs_T_170; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_172 = _decodeSigs_T_37 ? 2'h0 : _decodeSigs_T_171; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_173 = _decodeSigs_T_35 ? 2'h0 : _decodeSigs_T_172; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_174 = _decodeSigs_T_33 ? 2'h0 : _decodeSigs_T_173; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_175 = _decodeSigs_T_31 ? 2'h0 : _decodeSigs_T_174; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_176 = _decodeSigs_T_29 ? 2'h0 : _decodeSigs_T_175; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_177 = _decodeSigs_T_27 ? 2'h0 : _decodeSigs_T_176; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_178 = _decodeSigs_T_25 ? 2'h0 : _decodeSigs_T_177; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_179 = _decodeSigs_T_23 ? 2'h0 : _decodeSigs_T_178; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_180 = _decodeSigs_T_21 ? 2'h0 : _decodeSigs_T_179; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_181 = _decodeSigs_T_19 ? 2'h0 : _decodeSigs_T_180; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_182 = _decodeSigs_T_17 ? 2'h0 : _decodeSigs_T_181; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_183 = _decodeSigs_T_15 ? 2'h0 : _decodeSigs_T_182; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_184 = _decodeSigs_T_13 ? 2'h0 : _decodeSigs_T_183; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_185 = _decodeSigs_T_11 ? 2'h0 : _decodeSigs_T_184; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_186 = _decodeSigs_T_9 ? 2'h1 : _decodeSigs_T_185; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_187 = _decodeSigs_T_7 ? 2'h1 : _decodeSigs_T_186; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_188 = _decodeSigs_T_5 ? 2'h1 : _decodeSigs_T_187; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_189 = _decodeSigs_T_3 ? 2'h1 : _decodeSigs_T_188; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_200 = _decodeSigs_T_75 ? 5'h14 : 5'h0; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_201 = _decodeSigs_T_73 ? 5'h0 : _decodeSigs_T_200; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_202 = _decodeSigs_T_71 ? 5'h0 : _decodeSigs_T_201; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_203 = _decodeSigs_T_69 ? 5'h0 : _decodeSigs_T_202; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_204 = _decodeSigs_T_67 ? 5'h0 : _decodeSigs_T_203; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_205 = _decodeSigs_T_65 ? 5'h0 : _decodeSigs_T_204; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_206 = _decodeSigs_T_63 ? 5'h0 : _decodeSigs_T_205; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_207 = _decodeSigs_T_61 ? 5'h0 : _decodeSigs_T_206; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_208 = _decodeSigs_T_59 ? 5'h0 : _decodeSigs_T_207; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_209 = _decodeSigs_T_57 ? 5'h0 : _decodeSigs_T_208; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_210 = _decodeSigs_T_55 ? 5'h0 : _decodeSigs_T_209; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_211 = _decodeSigs_T_53 ? 5'h0 : _decodeSigs_T_210; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_212 = _decodeSigs_T_51 ? 5'h0 : _decodeSigs_T_211; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_213 = _decodeSigs_T_49 ? 5'h0 : _decodeSigs_T_212; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_214 = _decodeSigs_T_47 ? 5'h0 : _decodeSigs_T_213; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_215 = _decodeSigs_T_45 ? 5'h0 : _decodeSigs_T_214; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_216 = _decodeSigs_T_43 ? 5'h0 : _decodeSigs_T_215; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_217 = _decodeSigs_T_41 ? 5'h0 : _decodeSigs_T_216; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_218 = _decodeSigs_T_39 ? 5'h0 : _decodeSigs_T_217; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_219 = _decodeSigs_T_37 ? 5'h0 : _decodeSigs_T_218; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_220 = _decodeSigs_T_35 ? 5'h8 : _decodeSigs_T_219; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_221 = _decodeSigs_T_33 ? 5'h7 : _decodeSigs_T_220; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_222 = _decodeSigs_T_31 ? 5'h6 : _decodeSigs_T_221; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_223 = _decodeSigs_T_29 ? 5'h0 : _decodeSigs_T_222; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_224 = _decodeSigs_T_27 ? 5'h0 : _decodeSigs_T_223; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_225 = _decodeSigs_T_25 ? 5'h0 : _decodeSigs_T_224; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_226 = _decodeSigs_T_23 ? 5'h0 : _decodeSigs_T_225; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_227 = _decodeSigs_T_21 ? 5'h0 : _decodeSigs_T_226; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_228 = _decodeSigs_T_19 ? 5'h0 : _decodeSigs_T_227; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_229 = _decodeSigs_T_17 ? 5'h0 : _decodeSigs_T_228; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_230 = _decodeSigs_T_15 ? 5'h0 : _decodeSigs_T_229; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_231 = _decodeSigs_T_13 ? 5'h0 : _decodeSigs_T_230; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_232 = _decodeSigs_T_11 ? 5'h0 : _decodeSigs_T_231; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_233 = _decodeSigs_T_9 ? 5'h5 : _decodeSigs_T_232; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_234 = _decodeSigs_T_7 ? 5'h4 : _decodeSigs_T_233; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_235 = _decodeSigs_T_5 ? 5'h3 : _decodeSigs_T_234; // @[Lookup.scala 34:39]
  wire [4:0] _decodeSigs_T_236 = _decodeSigs_T_3 ? 5'h2 : _decodeSigs_T_235; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_250 = _decodeSigs_T_69 ? 4'hf : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_251 = _decodeSigs_T_67 ? 4'h9 : _decodeSigs_T_250; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_252 = _decodeSigs_T_65 ? 4'h7 : _decodeSigs_T_251; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_253 = _decodeSigs_T_63 ? 4'h8 : _decodeSigs_T_252; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_254 = _decodeSigs_T_61 ? 4'h6 : _decodeSigs_T_253; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_255 = _decodeSigs_T_59 ? 4'h5 : _decodeSigs_T_254; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_256 = _decodeSigs_T_57 ? 4'he : _decodeSigs_T_255; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_257 = _decodeSigs_T_55 ? 4'h2 : _decodeSigs_T_256; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_258 = _decodeSigs_T_53 ? 4'h3 : _decodeSigs_T_257; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_259 = _decodeSigs_T_51 ? 4'hc : _decodeSigs_T_258; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_260 = _decodeSigs_T_49 ? 4'hb : _decodeSigs_T_259; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_261 = _decodeSigs_T_47 ? 4'h4 : _decodeSigs_T_260; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_262 = _decodeSigs_T_45 ? 4'h9 : _decodeSigs_T_261; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_263 = _decodeSigs_T_43 ? 4'h8 : _decodeSigs_T_262; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_264 = _decodeSigs_T_41 ? 4'ha : _decodeSigs_T_263; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_265 = _decodeSigs_T_39 ? 4'h1 : _decodeSigs_T_264; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_266 = _decodeSigs_T_37 ? 4'h0 : _decodeSigs_T_265; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_267 = _decodeSigs_T_35 ? 4'h0 : _decodeSigs_T_266; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_268 = _decodeSigs_T_33 ? 4'h0 : _decodeSigs_T_267; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_269 = _decodeSigs_T_31 ? 4'h0 : _decodeSigs_T_268; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_270 = _decodeSigs_T_29 ? 4'h0 : _decodeSigs_T_269; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_271 = _decodeSigs_T_27 ? 4'h2 : _decodeSigs_T_270; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_272 = _decodeSigs_T_25 ? 4'h3 : _decodeSigs_T_271; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_273 = _decodeSigs_T_23 ? 4'hc : _decodeSigs_T_272; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_274 = _decodeSigs_T_21 ? 4'hb : _decodeSigs_T_273; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_275 = _decodeSigs_T_19 ? 4'h4 : _decodeSigs_T_274; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_276 = _decodeSigs_T_17 ? 4'h9 : _decodeSigs_T_275; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_277 = _decodeSigs_T_15 ? 4'h8 : _decodeSigs_T_276; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_278 = _decodeSigs_T_13 ? 4'ha : _decodeSigs_T_277; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_279 = _decodeSigs_T_11 ? 4'h0 : _decodeSigs_T_278; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_280 = _decodeSigs_T_9 ? 4'h0 : _decodeSigs_T_279; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_281 = _decodeSigs_T_7 ? 4'h0 : _decodeSigs_T_280; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_282 = _decodeSigs_T_5 ? 4'h0 : _decodeSigs_T_281; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_283 = _decodeSigs_T_3 ? 4'h0 : _decodeSigs_T_282; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_284 = _decodeSigs_T_95 ? 4'h6 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_285 = _decodeSigs_T_93 ? 4'h6 : _decodeSigs_T_284; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_286 = _decodeSigs_T_91 ? 4'h6 : _decodeSigs_T_285; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_287 = _decodeSigs_T_89 ? 4'h1 : _decodeSigs_T_286; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_288 = _decodeSigs_T_87 ? 4'h1 : _decodeSigs_T_287; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_289 = _decodeSigs_T_85 ? 4'h1 : _decodeSigs_T_288; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_290 = _decodeSigs_T_83 ? 4'h0 : _decodeSigs_T_289; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_291 = _decodeSigs_T_81 ? 4'h0 : _decodeSigs_T_290; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_292 = _decodeSigs_T_79 ? 4'h0 : _decodeSigs_T_291; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_293 = _decodeSigs_T_77 ? 4'h0 : _decodeSigs_T_292; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_294 = _decodeSigs_T_75 ? 4'h0 : _decodeSigs_T_293; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_295 = _decodeSigs_T_73 ? 4'h7 : _decodeSigs_T_294; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_296 = _decodeSigs_T_71 ? 4'h1 : _decodeSigs_T_295; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_297 = _decodeSigs_T_69 ? 4'h1 : _decodeSigs_T_296; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_298 = _decodeSigs_T_67 ? 4'h1 : _decodeSigs_T_297; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_299 = _decodeSigs_T_65 ? 4'h1 : _decodeSigs_T_298; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_300 = _decodeSigs_T_63 ? 4'h1 : _decodeSigs_T_299; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_301 = _decodeSigs_T_61 ? 4'h1 : _decodeSigs_T_300; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_302 = _decodeSigs_T_59 ? 4'h1 : _decodeSigs_T_301; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_303 = _decodeSigs_T_57 ? 4'h0 : _decodeSigs_T_302; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_304 = _decodeSigs_T_55 ? 4'h1 : _decodeSigs_T_303; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_305 = _decodeSigs_T_53 ? 4'h1 : _decodeSigs_T_304; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_306 = _decodeSigs_T_51 ? 4'h1 : _decodeSigs_T_305; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_307 = _decodeSigs_T_49 ? 4'h1 : _decodeSigs_T_306; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_308 = _decodeSigs_T_47 ? 4'h1 : _decodeSigs_T_307; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_309 = _decodeSigs_T_45 ? 4'h1 : _decodeSigs_T_308; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_310 = _decodeSigs_T_43 ? 4'h1 : _decodeSigs_T_309; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_311 = _decodeSigs_T_41 ? 4'h1 : _decodeSigs_T_310; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_312 = _decodeSigs_T_39 ? 4'h1 : _decodeSigs_T_311; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_313 = _decodeSigs_T_37 ? 4'h1 : _decodeSigs_T_312; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_314 = _decodeSigs_T_35 ? 4'h1 : _decodeSigs_T_313; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_315 = _decodeSigs_T_33 ? 4'h1 : _decodeSigs_T_314; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_316 = _decodeSigs_T_31 ? 4'h1 : _decodeSigs_T_315; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_317 = _decodeSigs_T_29 ? 4'h7 : _decodeSigs_T_316; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_318 = _decodeSigs_T_27 ? 4'h1 : _decodeSigs_T_317; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_319 = _decodeSigs_T_25 ? 4'h1 : _decodeSigs_T_318; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_320 = _decodeSigs_T_23 ? 4'h1 : _decodeSigs_T_319; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_321 = _decodeSigs_T_21 ? 4'h1 : _decodeSigs_T_320; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_322 = _decodeSigs_T_19 ? 4'h1 : _decodeSigs_T_321; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_323 = _decodeSigs_T_17 ? 4'h1 : _decodeSigs_T_322; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_324 = _decodeSigs_T_15 ? 4'h1 : _decodeSigs_T_323; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_325 = _decodeSigs_T_13 ? 4'h1 : _decodeSigs_T_324; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_326 = _decodeSigs_T_11 ? 4'h1 : _decodeSigs_T_325; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_327 = _decodeSigs_T_9 ? 4'h1 : _decodeSigs_T_326; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_328 = _decodeSigs_T_7 ? 4'h1 : _decodeSigs_T_327; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_329 = _decodeSigs_T_5 ? 4'h1 : _decodeSigs_T_328; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_330 = _decodeSigs_T_3 ? 4'h1 : _decodeSigs_T_329; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_342 = _decodeSigs_T_73 ? 4'h3 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_343 = _decodeSigs_T_71 ? 4'h3 : _decodeSigs_T_342; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_344 = _decodeSigs_T_69 ? 4'h2 : _decodeSigs_T_343; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_345 = _decodeSigs_T_67 ? 4'h2 : _decodeSigs_T_344; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_346 = _decodeSigs_T_65 ? 4'h2 : _decodeSigs_T_345; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_347 = _decodeSigs_T_63 ? 4'h2 : _decodeSigs_T_346; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_348 = _decodeSigs_T_61 ? 4'h2 : _decodeSigs_T_347; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_349 = _decodeSigs_T_59 ? 4'h2 : _decodeSigs_T_348; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_350 = _decodeSigs_T_57 ? 4'h3 : _decodeSigs_T_349; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_351 = _decodeSigs_T_55 ? 4'h2 : _decodeSigs_T_350; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_352 = _decodeSigs_T_53 ? 4'h2 : _decodeSigs_T_351; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_353 = _decodeSigs_T_51 ? 4'h2 : _decodeSigs_T_352; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_354 = _decodeSigs_T_49 ? 4'h2 : _decodeSigs_T_353; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_355 = _decodeSigs_T_47 ? 4'h2 : _decodeSigs_T_354; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_356 = _decodeSigs_T_45 ? 4'h2 : _decodeSigs_T_355; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_357 = _decodeSigs_T_43 ? 4'h2 : _decodeSigs_T_356; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_358 = _decodeSigs_T_41 ? 4'h2 : _decodeSigs_T_357; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_359 = _decodeSigs_T_39 ? 4'h2 : _decodeSigs_T_358; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_360 = _decodeSigs_T_37 ? 4'h2 : _decodeSigs_T_359; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_361 = _decodeSigs_T_35 ? 4'h3 : _decodeSigs_T_360; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_362 = _decodeSigs_T_33 ? 4'h3 : _decodeSigs_T_361; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_363 = _decodeSigs_T_31 ? 4'h3 : _decodeSigs_T_362; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_364 = _decodeSigs_T_29 ? 4'h3 : _decodeSigs_T_363; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_365 = _decodeSigs_T_27 ? 4'h3 : _decodeSigs_T_364; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_366 = _decodeSigs_T_25 ? 4'h3 : _decodeSigs_T_365; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_367 = _decodeSigs_T_23 ? 4'h3 : _decodeSigs_T_366; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_368 = _decodeSigs_T_21 ? 4'h3 : _decodeSigs_T_367; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_369 = _decodeSigs_T_19 ? 4'h3 : _decodeSigs_T_368; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_370 = _decodeSigs_T_17 ? 4'h3 : _decodeSigs_T_369; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_371 = _decodeSigs_T_15 ? 4'h3 : _decodeSigs_T_370; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_372 = _decodeSigs_T_13 ? 4'h3 : _decodeSigs_T_371; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_373 = _decodeSigs_T_11 ? 4'h3 : _decodeSigs_T_372; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_374 = _decodeSigs_T_9 ? 4'h3 : _decodeSigs_T_373; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_375 = _decodeSigs_T_7 ? 4'h3 : _decodeSigs_T_374; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_376 = _decodeSigs_T_5 ? 4'h3 : _decodeSigs_T_375; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_377 = _decodeSigs_T_3 ? 4'h3 : _decodeSigs_T_376; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_378 = _decodeSigs_T_95 ? 3'h5 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_379 = _decodeSigs_T_93 ? 3'h5 : _decodeSigs_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_380 = _decodeSigs_T_91 ? 3'h5 : _decodeSigs_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_381 = _decodeSigs_T_89 ? 3'h0 : _decodeSigs_T_380; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_382 = _decodeSigs_T_87 ? 3'h0 : _decodeSigs_T_381; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_383 = _decodeSigs_T_85 ? 3'h0 : _decodeSigs_T_382; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_384 = _decodeSigs_T_83 ? 3'h0 : _decodeSigs_T_383; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_385 = _decodeSigs_T_81 ? 3'h0 : _decodeSigs_T_384; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_386 = _decodeSigs_T_79 ? 3'h0 : _decodeSigs_T_385; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_387 = _decodeSigs_T_77 ? 3'h0 : _decodeSigs_T_386; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_388 = _decodeSigs_T_75 ? 3'h0 : _decodeSigs_T_387; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_389 = _decodeSigs_T_73 ? 3'h4 : _decodeSigs_T_388; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_390 = _decodeSigs_T_71 ? 3'h0 : _decodeSigs_T_389; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_391 = _decodeSigs_T_69 ? 3'h2 : _decodeSigs_T_390; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_392 = _decodeSigs_T_67 ? 3'h2 : _decodeSigs_T_391; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_393 = _decodeSigs_T_65 ? 3'h2 : _decodeSigs_T_392; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_394 = _decodeSigs_T_63 ? 3'h2 : _decodeSigs_T_393; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_395 = _decodeSigs_T_61 ? 3'h2 : _decodeSigs_T_394; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_396 = _decodeSigs_T_59 ? 3'h2 : _decodeSigs_T_395; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_397 = _decodeSigs_T_57 ? 3'h3 : _decodeSigs_T_396; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_398 = _decodeSigs_T_55 ? 3'h0 : _decodeSigs_T_397; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_399 = _decodeSigs_T_53 ? 3'h0 : _decodeSigs_T_398; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_400 = _decodeSigs_T_51 ? 3'h0 : _decodeSigs_T_399; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_401 = _decodeSigs_T_49 ? 3'h0 : _decodeSigs_T_400; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_402 = _decodeSigs_T_47 ? 3'h0 : _decodeSigs_T_401; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_403 = _decodeSigs_T_45 ? 3'h0 : _decodeSigs_T_402; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_404 = _decodeSigs_T_43 ? 3'h0 : _decodeSigs_T_403; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_405 = _decodeSigs_T_41 ? 3'h0 : _decodeSigs_T_404; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_406 = _decodeSigs_T_39 ? 3'h0 : _decodeSigs_T_405; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_407 = _decodeSigs_T_37 ? 3'h0 : _decodeSigs_T_406; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_408 = _decodeSigs_T_35 ? 3'h1 : _decodeSigs_T_407; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_409 = _decodeSigs_T_33 ? 3'h1 : _decodeSigs_T_408; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_410 = _decodeSigs_T_31 ? 3'h1 : _decodeSigs_T_409; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_411 = _decodeSigs_T_29 ? 3'h3 : _decodeSigs_T_410; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_412 = _decodeSigs_T_27 ? 3'h0 : _decodeSigs_T_411; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_413 = _decodeSigs_T_25 ? 3'h0 : _decodeSigs_T_412; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_414 = _decodeSigs_T_23 ? 3'h0 : _decodeSigs_T_413; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_415 = _decodeSigs_T_21 ? 3'h0 : _decodeSigs_T_414; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_416 = _decodeSigs_T_19 ? 3'h0 : _decodeSigs_T_415; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_417 = _decodeSigs_T_17 ? 3'h0 : _decodeSigs_T_416; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_418 = _decodeSigs_T_15 ? 3'h0 : _decodeSigs_T_417; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_419 = _decodeSigs_T_13 ? 3'h0 : _decodeSigs_T_418; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_420 = _decodeSigs_T_11 ? 3'h0 : _decodeSigs_T_419; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_421 = _decodeSigs_T_9 ? 3'h0 : _decodeSigs_T_420; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_422 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_421; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_423 = _decodeSigs_T_5 ? 3'h0 : _decodeSigs_T_422; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_424 = _decodeSigs_T_3 ? 3'h0 : _decodeSigs_T_423; // @[Lookup.scala 34:39]
  wire [2:0] decodeSigs_6 = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_424; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_425 = _decodeSigs_T_95 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_426 = _decodeSigs_T_93 ? 1'h0 : _decodeSigs_T_425; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_427 = _decodeSigs_T_91 ? 1'h0 : _decodeSigs_T_426; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_428 = _decodeSigs_T_89 ? 1'h0 : _decodeSigs_T_427; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_429 = _decodeSigs_T_87 ? 1'h0 : _decodeSigs_T_428; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_430 = _decodeSigs_T_85 ? 1'h0 : _decodeSigs_T_429; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_431 = _decodeSigs_T_83 ? 1'h0 : _decodeSigs_T_430; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_432 = _decodeSigs_T_81 ? 1'h0 : _decodeSigs_T_431; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_433 = _decodeSigs_T_79 ? 1'h0 : _decodeSigs_T_432; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_434 = _decodeSigs_T_77 ? 1'h0 : _decodeSigs_T_433; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_436 = _decodeSigs_T_73 ? 1'h0 : _decodeSigs_T_75 | _decodeSigs_T_434; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_444 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_59 | (_decodeSigs_T_61 | (_decodeSigs_T_63 | (
    _decodeSigs_T_65 | (_decodeSigs_T_67 | (_decodeSigs_T_69 | (_decodeSigs_T_71 | _decodeSigs_T_436)))))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_445 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_444; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_446 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_445; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_447 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_446; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_448 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_447; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_449 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_448; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_450 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_449; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_451 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_450; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_452 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_451; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_453 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_452; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_454 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_453; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_458 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_31 | (_decodeSigs_T_33 | (_decodeSigs_T_35 |
    _decodeSigs_T_454)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_462 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 |
    _decodeSigs_T_458)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_466 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 |
    _decodeSigs_T_462)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_468 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_11 | _decodeSigs_T_466; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_469 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_468; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_478 = _decodeSigs_T_83 ? 1'h0 : _decodeSigs_T_85 | (_decodeSigs_T_87 | (_decodeSigs_T_89 | (
    _decodeSigs_T_91 | (_decodeSigs_T_93 | _decodeSigs_T_95)))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_479 = _decodeSigs_T_81 ? 1'h0 : _decodeSigs_T_478; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_480 = _decodeSigs_T_79 ? 1'h0 : _decodeSigs_T_479; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_481 = _decodeSigs_T_77 ? 1'h0 : _decodeSigs_T_480; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_482 = _decodeSigs_T_75 ? 1'h0 : _decodeSigs_T_481; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_485 = _decodeSigs_T_69 ? 1'h0 : _decodeSigs_T_71 | (_decodeSigs_T_73 | _decodeSigs_T_482); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_486 = _decodeSigs_T_67 ? 1'h0 : _decodeSigs_T_485; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_487 = _decodeSigs_T_65 ? 1'h0 : _decodeSigs_T_486; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_488 = _decodeSigs_T_63 ? 1'h0 : _decodeSigs_T_487; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_489 = _decodeSigs_T_61 ? 1'h0 : _decodeSigs_T_488; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_490 = _decodeSigs_T_59 ? 1'h0 : _decodeSigs_T_489; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_502 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_37 | (_decodeSigs_T_39 | (_decodeSigs_T_41 | (
    _decodeSigs_T_43 | (_decodeSigs_T_45 | (_decodeSigs_T_47 | (_decodeSigs_T_49 | (_decodeSigs_T_51 | (_decodeSigs_T_53
     | (_decodeSigs_T_55 | (_decodeSigs_T_57 | _decodeSigs_T_490)))))))))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_503 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_502; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_504 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_503; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_520 = _decodeSigs_T_93 ? 3'h4 : _decodeSigs_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_521 = _decodeSigs_T_91 ? 3'h3 : _decodeSigs_T_520; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_522 = _decodeSigs_T_89 ? 3'h5 : _decodeSigs_T_521; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_523 = _decodeSigs_T_87 ? 3'h4 : _decodeSigs_T_522; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_524 = _decodeSigs_T_85 ? 3'h3 : _decodeSigs_T_523; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_525 = _decodeSigs_T_83 ? 3'h0 : _decodeSigs_T_524; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_526 = _decodeSigs_T_81 ? 3'h0 : _decodeSigs_T_525; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_527 = _decodeSigs_T_79 ? 3'h0 : _decodeSigs_T_526; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_528 = _decodeSigs_T_77 ? 3'h0 : _decodeSigs_T_527; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_529 = _decodeSigs_T_75 ? 3'h0 : _decodeSigs_T_528; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_530 = _decodeSigs_T_73 ? 3'h0 : _decodeSigs_T_529; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_531 = _decodeSigs_T_71 ? 3'h0 : _decodeSigs_T_530; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_532 = _decodeSigs_T_69 ? 3'h0 : _decodeSigs_T_531; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_533 = _decodeSigs_T_67 ? 3'h0 : _decodeSigs_T_532; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_534 = _decodeSigs_T_65 ? 3'h0 : _decodeSigs_T_533; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_535 = _decodeSigs_T_63 ? 3'h0 : _decodeSigs_T_534; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_536 = _decodeSigs_T_61 ? 3'h0 : _decodeSigs_T_535; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_537 = _decodeSigs_T_59 ? 3'h0 : _decodeSigs_T_536; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_538 = _decodeSigs_T_57 ? 3'h0 : _decodeSigs_T_537; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_539 = _decodeSigs_T_55 ? 3'h0 : _decodeSigs_T_538; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_540 = _decodeSigs_T_53 ? 3'h0 : _decodeSigs_T_539; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_541 = _decodeSigs_T_51 ? 3'h0 : _decodeSigs_T_540; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_542 = _decodeSigs_T_49 ? 3'h0 : _decodeSigs_T_541; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_543 = _decodeSigs_T_47 ? 3'h0 : _decodeSigs_T_542; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_544 = _decodeSigs_T_45 ? 3'h0 : _decodeSigs_T_543; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_545 = _decodeSigs_T_43 ? 3'h0 : _decodeSigs_T_544; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_546 = _decodeSigs_T_41 ? 3'h0 : _decodeSigs_T_545; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_547 = _decodeSigs_T_39 ? 3'h0 : _decodeSigs_T_546; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_548 = _decodeSigs_T_37 ? 3'h0 : _decodeSigs_T_547; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_549 = _decodeSigs_T_35 ? 3'h0 : _decodeSigs_T_548; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_550 = _decodeSigs_T_33 ? 3'h0 : _decodeSigs_T_549; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_551 = _decodeSigs_T_31 ? 3'h0 : _decodeSigs_T_550; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_552 = _decodeSigs_T_29 ? 3'h0 : _decodeSigs_T_551; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_553 = _decodeSigs_T_27 ? 3'h0 : _decodeSigs_T_552; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_554 = _decodeSigs_T_25 ? 3'h0 : _decodeSigs_T_553; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_555 = _decodeSigs_T_23 ? 3'h0 : _decodeSigs_T_554; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_556 = _decodeSigs_T_21 ? 3'h0 : _decodeSigs_T_555; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_557 = _decodeSigs_T_19 ? 3'h0 : _decodeSigs_T_556; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_558 = _decodeSigs_T_17 ? 3'h0 : _decodeSigs_T_557; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_559 = _decodeSigs_T_15 ? 3'h0 : _decodeSigs_T_558; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_560 = _decodeSigs_T_13 ? 3'h0 : _decodeSigs_T_559; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_561 = _decodeSigs_T_11 ? 3'h0 : _decodeSigs_T_560; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_562 = _decodeSigs_T_9 ? 3'h0 : _decodeSigs_T_561; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_563 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_562; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_564 = _decodeSigs_T_5 ? 3'h0 : _decodeSigs_T_563; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_565 = _decodeSigs_T_3 ? 3'h0 : _decodeSigs_T_564; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_566 = _decodeSigs_T_95 ? 4'h0 : 4'h5; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_567 = _decodeSigs_T_93 ? 4'h0 : _decodeSigs_T_566; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_568 = _decodeSigs_T_91 ? 4'h0 : _decodeSigs_T_567; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_569 = _decodeSigs_T_89 ? 4'h0 : _decodeSigs_T_568; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_570 = _decodeSigs_T_87 ? 4'h0 : _decodeSigs_T_569; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_571 = _decodeSigs_T_85 ? 4'h0 : _decodeSigs_T_570; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_572 = _decodeSigs_T_83 ? 4'h3 : _decodeSigs_T_571; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_573 = _decodeSigs_T_81 ? 4'h4 : _decodeSigs_T_572; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_574 = _decodeSigs_T_79 ? 4'h2 : _decodeSigs_T_573; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_575 = _decodeSigs_T_77 ? 4'h1 : _decodeSigs_T_574; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_576 = _decodeSigs_T_75 ? 4'h0 : _decodeSigs_T_575; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_577 = _decodeSigs_T_73 ? 4'h0 : _decodeSigs_T_576; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_578 = _decodeSigs_T_71 ? 4'h0 : _decodeSigs_T_577; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_579 = _decodeSigs_T_69 ? 4'h0 : _decodeSigs_T_578; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_580 = _decodeSigs_T_67 ? 4'h0 : _decodeSigs_T_579; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_581 = _decodeSigs_T_65 ? 4'h0 : _decodeSigs_T_580; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_582 = _decodeSigs_T_63 ? 4'h0 : _decodeSigs_T_581; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_583 = _decodeSigs_T_61 ? 4'h0 : _decodeSigs_T_582; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_584 = _decodeSigs_T_59 ? 4'h0 : _decodeSigs_T_583; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_585 = _decodeSigs_T_57 ? 4'h0 : _decodeSigs_T_584; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_586 = _decodeSigs_T_55 ? 4'h0 : _decodeSigs_T_585; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_587 = _decodeSigs_T_53 ? 4'h0 : _decodeSigs_T_586; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_588 = _decodeSigs_T_51 ? 4'h0 : _decodeSigs_T_587; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_589 = _decodeSigs_T_49 ? 4'h0 : _decodeSigs_T_588; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_590 = _decodeSigs_T_47 ? 4'h0 : _decodeSigs_T_589; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_591 = _decodeSigs_T_45 ? 4'h0 : _decodeSigs_T_590; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_592 = _decodeSigs_T_43 ? 4'h0 : _decodeSigs_T_591; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_593 = _decodeSigs_T_41 ? 4'h0 : _decodeSigs_T_592; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_594 = _decodeSigs_T_39 ? 4'h0 : _decodeSigs_T_593; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_595 = _decodeSigs_T_37 ? 4'h0 : _decodeSigs_T_594; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_596 = _decodeSigs_T_35 ? 4'h0 : _decodeSigs_T_595; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_597 = _decodeSigs_T_33 ? 4'h0 : _decodeSigs_T_596; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_598 = _decodeSigs_T_31 ? 4'h0 : _decodeSigs_T_597; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_599 = _decodeSigs_T_29 ? 4'h0 : _decodeSigs_T_598; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_600 = _decodeSigs_T_27 ? 4'h0 : _decodeSigs_T_599; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_601 = _decodeSigs_T_25 ? 4'h0 : _decodeSigs_T_600; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_602 = _decodeSigs_T_23 ? 4'h0 : _decodeSigs_T_601; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_603 = _decodeSigs_T_21 ? 4'h0 : _decodeSigs_T_602; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_604 = _decodeSigs_T_19 ? 4'h0 : _decodeSigs_T_603; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_605 = _decodeSigs_T_17 ? 4'h0 : _decodeSigs_T_604; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_606 = _decodeSigs_T_15 ? 4'h0 : _decodeSigs_T_605; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_607 = _decodeSigs_T_13 ? 4'h0 : _decodeSigs_T_606; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_608 = _decodeSigs_T_11 ? 4'h0 : _decodeSigs_T_607; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_609 = _decodeSigs_T_9 ? 4'h0 : _decodeSigs_T_608; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_610 = _decodeSigs_T_7 ? 4'h0 : _decodeSigs_T_609; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_611 = _decodeSigs_T_5 ? 4'h0 : _decodeSigs_T_610; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_612 = _decodeSigs_T_3 ? 4'h0 : _decodeSigs_T_611; // @[Lookup.scala 34:39]
  assign io_out_isBranch = _decodeSigs_T_1 ? 1'h0 : _decodeSigs_T_142; // @[Lookup.scala 34:39]
  assign io_out_resultSrc = _decodeSigs_T_1 ? 2'h1 : _decodeSigs_T_189; // @[Lookup.scala 34:39]
  assign io_out_aluOpSel = _decodeSigs_T_1 ? 4'h0 : _decodeSigs_T_283; // @[Lookup.scala 34:39]
  assign io_out_lsuOp = _decodeSigs_T_1 ? 5'h1 : _decodeSigs_T_236; // @[Lookup.scala 34:39]
  assign io_out_aluSrc1 = _decodeSigs_T_1 ? 4'h1 : _decodeSigs_T_330; // @[Lookup.scala 34:39]
  assign io_out_aluSrc2 = _decodeSigs_T_1 ? 4'h3 : _decodeSigs_T_377; // @[Lookup.scala 34:39]
  assign io_out_immSrc = decodeSigs_6[1:0]; // @[Decoder.scala 225:19]
  assign io_out_immSign = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | _decodeSigs_T_469)); // @[Lookup.scala 34:39]
  assign io_out_regWrEn = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | (_decodeSigs_T_7 | (_decodeSigs_T_9 |
    (_decodeSigs_T_11 | (_decodeSigs_T_13 | (_decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 | (
    _decodeSigs_T_21 | (_decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 | (_decodeSigs_T_29 | _decodeSigs_T_504
    )))))))))))))); // @[Lookup.scala 34:39]
  assign io_out_csrOp = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_565; // @[Lookup.scala 34:39]
  assign io_out_excType = _decodeSigs_T_1 ? 4'h0 : _decodeSigs_T_612; // @[Lookup.scala 34:39]
endmodule
module CtrlUnit(
  output        io_out_isBranch,
  output        io_out_isJump,
  output [1:0]  io_out_resultSrc,
  output [3:0]  io_out_aluOpSel,
  output [4:0]  io_out_lsuOp,
  output [3:0]  io_out_aluSrc1,
  output [3:0]  io_out_aluSrc2,
  output [1:0]  io_out_immSrc,
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
  wire [1:0] decoder_io_out_immSrc; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_immSign; // @[CtrlUnit.scala 59:25]
  wire  decoder_io_out_regWrEn; // @[CtrlUnit.scala 59:25]
  wire [2:0] decoder_io_out_csrOp; // @[CtrlUnit.scala 59:25]
  wire [3:0] decoder_io_out_excType; // @[CtrlUnit.scala 59:25]
  wire [6:0] opcode = io_in_inst[6:0]; // @[util.scala 43:34]
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
module ImmGen(
  input  [31:0] io_inst,
  input  [2:0]  io_immSrc,
  input         io_immSign,
  output [31:0] io_imm
);
  wire [31:0] immI = {{20'd0}, io_inst[31:20]}; // @[util.scala 31:36]
  wire [11:0] _immS_T_2 = {io_inst[31:25],io_inst[11:7]}; // @[Cat.scala 33:92]
  wire [31:0] immS = {{20'd0}, _immS_T_2}; // @[util.scala 31:36]
  wire [12:0] _immB_T_4 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] immB = {{19'd0}, _immB_T_4}; // @[util.scala 31:36]
  wire [31:0] immU = {io_inst[31:12], 12'h0}; // @[ImmGen.scala 26:36]
  wire [19:0] _immJ_T_4 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[Cat.scala 33:92]
  wire [31:0] immJ = {{12'd0}, _immJ_T_4}; // @[util.scala 31:36]
  wire [11:0] _immI_S_T_1 = io_inst[31:20]; // @[util.scala 20:20]
  wire  immI_S_signBit = _immI_S_T_1[11]; // @[util.scala 11:27]
  wire [9:0] immI_S_out_lo = {immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit,
    immI_S_signBit,immI_S_signBit,immI_S_signBit,immI_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immI_S_out_T_1 = io_inst[31:20]; // @[util.scala 15:75]
  wire [31:0] immI_S = {immI_S_out_lo,immI_S_out_lo,_immI_S_out_T_1}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_T_3 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 20:20]
  wire  immS_S_signBit = _immS_S_T_3[11]; // @[util.scala 11:27]
  wire [9:0] immS_S_out_lo = {immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit,
    immS_S_signBit,immS_S_signBit,immS_S_signBit,immS_S_signBit}; // @[Cat.scala 33:92]
  wire [11:0] _immS_S_out_T_1 = {io_inst[31:25],io_inst[11:7]}; // @[util.scala 15:75]
  wire [31:0] immS_S = {immS_S_out_lo,immS_S_out_lo,_immS_S_out_T_1}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_T_5 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 20:20]
  wire  immB_S_signBit = _immB_S_T_5[12]; // @[util.scala 11:27]
  wire [9:0] immB_S_out_hi = {immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [18:0] _immB_S_out_T = {immB_S_out_hi,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit,
    immB_S_signBit,immB_S_signBit,immB_S_signBit,immB_S_signBit}; // @[Cat.scala 33:92]
  wire [12:0] _immB_S_out_T_1 = {io_inst[31],io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[util.scala 15:75]
  wire [31:0] immB_S = {_immB_S_out_T,_immB_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] immU_S = {io_inst[31:12], 12'h0}; // @[util.scala 13:18]
  wire [19:0] _immJ_S_T_5 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[util.scala 20:20]
  wire  immJ_S_signBit = _immJ_S_T_5[19]; // @[util.scala 11:27]
  wire [5:0] immJ_S_out_lo = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit}
    ; // @[Cat.scala 33:92]
  wire [19:0] _immJ_S_out_T_1 = {io_inst[31],io_inst[19:12],io_inst[20],io_inst[30:21]}; // @[util.scala 15:75]
  wire [31:0] immJ_S = {immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,immJ_S_signBit,
    immJ_S_out_lo,_immJ_S_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] _out_T_3 = 3'h1 == io_immSrc ? immS_S : immI_S; // @[Mux.scala 81:58]
  wire [31:0] _out_T_5 = 3'h2 == io_immSrc ? immB_S : _out_T_3; // @[Mux.scala 81:58]
  wire [31:0] _out_T_7 = 3'h3 == io_immSrc ? immU_S : _out_T_5; // @[Mux.scala 81:58]
  wire [31:0] _out_T_9 = 3'h4 == io_immSrc ? immJ_S : _out_T_7; // @[Mux.scala 81:58]
  wire [31:0] _out_T_13 = 3'h1 == io_immSrc ? immS : immI; // @[Mux.scala 81:58]
  wire [31:0] _out_T_15 = 3'h2 == io_immSrc ? immB : _out_T_13; // @[Mux.scala 81:58]
  wire [31:0] _out_T_17 = 3'h3 == io_immSrc ? immU : _out_T_15; // @[Mux.scala 81:58]
  wire [31:0] _out_T_19 = 3'h4 == io_immSrc ? immJ : _out_T_17; // @[Mux.scala 81:58]
  wire [31:0] _GEN_0 = io_immSign ? _out_T_9 : _out_T_19; // @[ImmGen.scala 37:19 38:13 46:13]
  wire [31:0] out_out = {{27'd0}, io_inst[19:15]}; // @[util.scala 31:36]
  assign io_imm = io_immSrc == 3'h5 ? out_out : _GEN_0; // @[ImmGen.scala 55:30 56:13]
endmodule
module Decode(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_isBranch,
  output        io_out_bits_isJump,
  output [1:0]  io_out_bits_resultSrc,
  output [4:0]  io_out_bits_lsuOp,
  output [3:0]  io_out_bits_aluOpSel,
  output        io_out_bits_immSign,
  output        io_out_bits_regWrEn,
  output        io_out_bits_pcAddReg,
  output [31:0] io_out_bits_pcNext4,
  output [31:0] io_out_bits_aluIn1,
  output [31:0] io_out_bits_aluIn2,
  output        io_out_bits_aluIn1IsReg,
  output        io_out_bits_aluIn2IsReg,
  output [31:0] io_out_bits_imm,
  output [31:0] io_out_bits_data2,
  output [3:0]  io_out_bits_excType,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  input         io_hazard_in_stall,
  output [4:0]  io_regfile_rs1,
  output [4:0]  io_regfile_rs2,
  input  [31:0] io_regfile_rdata1,
  input  [31:0] io_regfile_rdata2,
  input         io_ctrl_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlUnit_io_out_isBranch; // @[2_Decode.scala 120:29]
  wire  ctrlUnit_io_out_isJump; // @[2_Decode.scala 120:29]
  wire [1:0] ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 120:29]
  wire [3:0] ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 120:29]
  wire [4:0] ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 120:29]
  wire [3:0] ctrlUnit_io_out_aluSrc1; // @[2_Decode.scala 120:29]
  wire [3:0] ctrlUnit_io_out_aluSrc2; // @[2_Decode.scala 120:29]
  wire [1:0] ctrlUnit_io_out_immSrc; // @[2_Decode.scala 120:29]
  wire  ctrlUnit_io_out_immSign; // @[2_Decode.scala 120:29]
  wire  ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 120:29]
  wire  ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 120:29]
  wire [2:0] ctrlUnit_io_out_csrOp; // @[2_Decode.scala 120:29]
  wire [3:0] ctrlUnit_io_out_excType; // @[2_Decode.scala 120:29]
  wire [31:0] ctrlUnit_io_in_inst; // @[2_Decode.scala 120:29]
  wire [31:0] immGen_io_inst; // @[2_Decode.scala 147:24]
  wire [2:0] immGen_io_immSrc; // @[2_Decode.scala 147:24]
  wire  immGen_io_immSign; // @[2_Decode.scala 147:24]
  wire [31:0] immGen_io_imm; // @[2_Decode.scala 147:24]
  wire  _io_in_ready_T = ~io_hazard_in_stall; // @[2_Decode.scala 80:36]
  wire  decodeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg [31:0] stageReg_pcNext4; // @[2_Decode.scala 83:27]
  reg  stageReg_instState_commit; // @[2_Decode.scala 83:27]
  reg [31:0] stageReg_instState_pc; // @[2_Decode.scala 83:27]
  reg [31:0] stageReg_instState_inst; // @[2_Decode.scala 83:27]
  wire [4:0] rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  wire [31:0] io_out_bits_aluIn1_out = {{27'd0}, rs1}; // @[util.scala 31:36]
  wire [31:0] _io_out_bits_aluIn1_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc1 ? io_regfile_rdata2 : _io_out_bits_aluIn1_T_1; // @[Mux.scala 81:58]
  wire [31:0] imm = immGen_io_imm; // @[2_Decode.scala 97:19 151:25]
  wire [31:0] _io_out_bits_aluIn1_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc1 ? imm : _io_out_bits_aluIn1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc1 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn1_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn1_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc1 ? stageReg_instState_pc :
    _io_out_bits_aluIn1_T_7; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_1 = 4'h1 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata1 : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_3 = 4'h2 == ctrlUnit_io_out_aluSrc2 ? io_regfile_rdata2 : _io_out_bits_aluIn2_T_1; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_5 = 4'h3 == ctrlUnit_io_out_aluSrc2 ? imm : _io_out_bits_aluIn2_T_3; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_7 = 4'h6 == ctrlUnit_io_out_aluSrc2 ? io_out_bits_aluIn1_out :
    _io_out_bits_aluIn2_T_5; // @[Mux.scala 81:58]
  wire [31:0] _io_out_bits_aluIn2_T_9 = 4'h7 == ctrlUnit_io_out_aluSrc2 ? stageReg_instState_pc :
    _io_out_bits_aluIn2_T_7; // @[Mux.scala 81:58]
  CtrlUnit ctrlUnit ( // @[2_Decode.scala 120:29]
    .io_out_isBranch(ctrlUnit_io_out_isBranch),
    .io_out_isJump(ctrlUnit_io_out_isJump),
    .io_out_resultSrc(ctrlUnit_io_out_resultSrc),
    .io_out_aluOpSel(ctrlUnit_io_out_aluOpSel),
    .io_out_lsuOp(ctrlUnit_io_out_lsuOp),
    .io_out_aluSrc1(ctrlUnit_io_out_aluSrc1),
    .io_out_aluSrc2(ctrlUnit_io_out_aluSrc2),
    .io_out_immSrc(ctrlUnit_io_out_immSrc),
    .io_out_immSign(ctrlUnit_io_out_immSign),
    .io_out_regWrEn(ctrlUnit_io_out_regWrEn),
    .io_out_pcAddReg(ctrlUnit_io_out_pcAddReg),
    .io_out_csrOp(ctrlUnit_io_out_csrOp),
    .io_out_excType(ctrlUnit_io_out_excType),
    .io_in_inst(ctrlUnit_io_in_inst)
  );
  ImmGen immGen ( // @[2_Decode.scala 147:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_ready = io_out_ready & ~io_hazard_in_stall; // @[2_Decode.scala 80:33]
  assign io_out_valid = io_out_ready & _io_in_ready_T; // @[2_Decode.scala 189:34]
  assign io_out_bits_isBranch = ctrlUnit_io_out_isBranch; // @[2_Decode.scala 155:29]
  assign io_out_bits_isJump = ctrlUnit_io_out_isJump; // @[2_Decode.scala 156:29]
  assign io_out_bits_resultSrc = ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 157:29]
  assign io_out_bits_lsuOp = ctrlUnit_io_out_lsuOp; // @[2_Decode.scala 161:29]
  assign io_out_bits_aluOpSel = ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 162:29]
  assign io_out_bits_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 165:29]
  assign io_out_bits_regWrEn = ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 164:29]
  assign io_out_bits_pcAddReg = ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 163:29]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[2_Decode.scala 181:29]
  assign io_out_bits_aluIn1 = 4'h8 == ctrlUnit_io_out_aluSrc1 ? 32'h4 : _io_out_bits_aluIn1_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn2 = 4'h8 == ctrlUnit_io_out_aluSrc2 ? 32'h4 : _io_out_bits_aluIn2_T_9; // @[Mux.scala 81:58]
  assign io_out_bits_aluIn1IsReg = ctrlUnit_io_out_aluSrc1 == 4'h1 | ctrlUnit_io_out_aluSrc1 == 4'h2; // @[2_Decode.scala 176:54]
  assign io_out_bits_aluIn2IsReg = ctrlUnit_io_out_aluSrc2 == 4'h1 | ctrlUnit_io_out_aluSrc2 == 4'h2; // @[2_Decode.scala 177:54]
  assign io_out_bits_imm = immGen_io_imm; // @[2_Decode.scala 97:19 151:25]
  assign io_out_bits_data2 = io_regfile_rdata2; // @[2_Decode.scala 145:15 99:29]
  assign io_out_bits_excType = ctrlUnit_io_out_excType; // @[2_Decode.scala 170:29]
  assign io_out_bits_csrOp = ctrlUnit_io_out_csrOp; // @[2_Decode.scala 169:29]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[2_Decode.scala 182:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[2_Decode.scala 182:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[2_Decode.scala 182:27]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign io_regfile_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_regfile_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign ctrlUnit_io_in_inst = stageReg_instState_inst; // @[2_Decode.scala 138:25]
  assign immGen_io_inst = stageReg_instState_inst; // @[2_Decode.scala 148:25]
  assign immGen_io_immSrc = {{1'd0}, ctrlUnit_io_out_immSrc}; // @[2_Decode.scala 149:25]
  assign immGen_io_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 150:25]
  always @(posedge clock) begin
    if (reset) begin // @[2_Decode.scala 83:27]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 83:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 91:17]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 91:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 84:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[2_Decode.scala 85:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 86:23]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 87:18]
    end
    if (reset) begin // @[2_Decode.scala 83:27]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 83:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 91:17]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 91:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 84:23]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[2_Decode.scala 85:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 86:23]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 87:18]
    end
    if (reset) begin // @[2_Decode.scala 83:27]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 83:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 91:17]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 91:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 84:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[2_Decode.scala 85:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 86:23]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 87:18]
    end
    if (reset) begin // @[2_Decode.scala 83:27]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 83:27]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 91:17]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 91:28]
    end else if (decodeLatch) begin // @[2_Decode.scala 84:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[2_Decode.scala 85:18]
    end else if (_io_in_ready_T) begin // @[2_Decode.scala 86:23]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 87:18]
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
  stageReg_pcNext4 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [3:0]  io_opSel,
  output [31:0] io_out,
  output        io_zero
);
  wire [31:0] _sum_T_2 = 32'h0 - io_in2; // @[Alu.scala 25:41]
  wire [31:0] _sum_T_3 = io_opSel[0] ? _sum_T_2 : io_in2; // @[Alu.scala 25:27]
  wire [31:0] sum = io_in1 + _sum_T_3; // @[Alu.scala 25:22]
  wire [4:0] shamt = io_in2[4:0]; // @[Alu.scala 28:23]
  wire [31:0] _shiftr_T_1 = io_in1 >> shamt; // @[Alu.scala 30:32]
  wire [31:0] _shiftr_T_4 = $signed(io_in1) >>> shamt; // @[Alu.scala 31:49]
  wire [31:0] shiftr = io_opSel[1] ? _shiftr_T_1 : _shiftr_T_4; // @[Alu.scala 29:21]
  wire [62:0] _GEN_5 = {{31'd0}, io_in1}; // @[Alu.scala 33:25]
  wire [62:0] shiftl = _GEN_5 << shamt; // @[Alu.scala 33:25]
  wire [31:0] _shout_T_3 = io_opSel == 4'hb | io_opSel == 4'hc ? shiftr : 32'h0; // @[Alu.scala 34:20]
  wire [62:0] _shout_T_5 = io_opSel == 4'ha ? shiftl : 63'h0; // @[Alu.scala 35:20]
  wire [62:0] _GEN_2 = {{31'd0}, _shout_T_3}; // @[Alu.scala 34:80]
  wire [62:0] shout = _GEN_2 | _shout_T_5; // @[Alu.scala 34:80]
  wire [31:0] _logic_T = io_in1 & io_in2; // @[Alu.scala 40:40]
  wire [31:0] _logic_T_1 = io_in1 | io_in2; // @[Alu.scala 41:40]
  wire [31:0] _logic_T_2 = io_in1 ^ io_in2; // @[Alu.scala 42:40]
  wire [31:0] _logic_T_4 = 4'h2 == io_opSel ? _logic_T : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _logic_T_6 = 4'h3 == io_opSel ? _logic_T_1 : _logic_T_4; // @[Mux.scala 81:58]
  wire [31:0] logic_ = 4'h4 == io_opSel ? _logic_T_2 : _logic_T_6; // @[Mux.scala 81:58]
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[Alu.scala 48:48]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[Alu.scala 49:41]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[Alu.scala 50:41]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[Alu.scala 51:41]
  wire  _cmp_T_8 = $signed(io_in1) >= $signed(io_in2); // @[Alu.scala 52:48]
  wire  _cmp_T_9 = io_in1 >= io_in2; // @[Alu.scala 53:42]
  wire  _cmp_T_13 = 4'h9 == io_opSel ? _cmp_T_3 : 4'h8 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_15 = 4'h5 == io_opSel ? _cmp_T_4 : _cmp_T_13; // @[Mux.scala 81:58]
  wire  _cmp_T_17 = 4'h6 == io_opSel ? _cmp_T_5 : _cmp_T_15; // @[Mux.scala 81:58]
  wire  _cmp_T_19 = 4'h7 == io_opSel ? _cmp_T_8 : _cmp_T_17; // @[Mux.scala 81:58]
  wire  cmp = 4'hf == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
  wire [31:0] _GEN_3 = {{31'd0}, cmp}; // @[Alu.scala 62:66]
  wire [31:0] _io_out_T_3 = _GEN_3 | logic_; // @[Alu.scala 62:66]
  wire [62:0] _GEN_4 = {{31'd0}, _io_out_T_3}; // @[Alu.scala 62:74]
  wire [62:0] _io_out_T_4 = _GEN_4 | shout; // @[Alu.scala 62:74]
  wire [62:0] _io_out_T_5 = io_opSel == 4'h0 | io_opSel == 4'h1 ? {{31'd0}, sum} : _io_out_T_4; // @[Alu.scala 62:22]
  wire [62:0] _GEN_0 = io_opSel == 4'he ? {{31'd0}, io_in2} : _io_out_T_5; // @[Alu.scala 59:33 60:16 62:16]
  wire [62:0] _GEN_1 = io_opSel == 4'hd ? {{31'd0}, io_in1} : _GEN_0; // @[Alu.scala 57:27 58:16]
  assign io_out = _GEN_1[31:0];
  assign io_zero = 4'hf == io_opSel ? _cmp_T_9 : _cmp_T_19; // @[Mux.scala 81:58]
endmodule
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
  wire [31:0] alu_io_in1; // @[3_Execute.scala 102:21]
  wire [31:0] alu_io_in2; // @[3_Execute.scala 102:21]
  wire [3:0] alu_io_opSel; // @[3_Execute.scala 102:21]
  wire [31:0] alu_io_out; // @[3_Execute.scala 102:21]
  wire  alu_io_zero; // @[3_Execute.scala 102:21]
  wire  executeLatch = io_in_ready & io_in_valid; // @[Decoupled.scala 51:35]
  reg  stageReg_isBranch; // @[3_Execute.scala 89:27]
  reg  stageReg_isJump; // @[3_Execute.scala 89:27]
  reg [1:0] stageReg_resultSrc; // @[3_Execute.scala 89:27]
  reg [4:0] stageReg_lsuOp; // @[3_Execute.scala 89:27]
  reg [3:0] stageReg_aluOpSel; // @[3_Execute.scala 89:27]
  reg  stageReg_immSign; // @[3_Execute.scala 89:27]
  reg  stageReg_regWrEn; // @[3_Execute.scala 89:27]
  reg  stageReg_pcAddReg; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_pcNext4; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_aluIn1; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_aluIn2; // @[3_Execute.scala 89:27]
  reg  stageReg_aluIn1IsReg; // @[3_Execute.scala 89:27]
  reg  stageReg_aluIn2IsReg; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_imm; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_data2; // @[3_Execute.scala 89:27]
  reg [3:0] stageReg_excType; // @[3_Execute.scala 89:27]
  reg [2:0] stageReg_csrOp; // @[3_Execute.scala 89:27]
  reg  stageReg_instState_commit; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_instState_pc; // @[3_Execute.scala 89:27]
  reg [31:0] stageReg_instState_inst; // @[3_Execute.scala 89:27]
  wire  _GEN_20 = executeLatch & io_in_bits_isBranch; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_21 = executeLatch & io_in_bits_isJump; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_25 = executeLatch & io_in_bits_immSign; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_26 = executeLatch & io_in_bits_regWrEn; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_27 = executeLatch & io_in_bits_pcAddReg; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_31 = executeLatch & io_in_bits_aluIn1IsReg; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_32 = executeLatch & io_in_bits_aluIn2IsReg; // @[3_Execute.scala 90:24 91:18]
  wire  _GEN_37 = executeLatch & io_in_bits_instState_commit; // @[3_Execute.scala 90:24 91:18]
  wire [31:0] _hazardData1_T_3 = 2'h1 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValM : stageReg_aluIn1; // @[Mux.scala 81:58]
  wire [31:0] hazardData1 = 2'h2 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValW : _hazardData1_T_3; // @[Mux.scala 81:58]
  wire [31:0] _hazardData2_T_3 = 2'h1 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValM : stageReg_aluIn2; // @[Mux.scala 81:58]
  wire [31:0] hazardData2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _hazardData2_T_3; // @[Mux.scala 81:58]
  wire  aluZero = alu_io_zero; // @[3_Execute.scala 123:13 98:23]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_5 = $signed(stageReg_imm) + $signed(stageReg_instState_pc); // @[3_Execute.scala 130:98]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_7 = stageReg_imm + stageReg_instState_pc; // @[3_Execute.scala 131:58]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_8 = stageReg_immSign ? _io_out_fetch_bits_targetAddr_T_5 :
    _io_out_fetch_bits_targetAddr_T_7; // @[3_Execute.scala 129:44]
  wire [31:0] _io_out_memory_bits_data2_T_3 = io_hazard_in_aluSrc2 == 2'h2 ? io_hazard_in_rdValW : stageReg_data2; // @[3_Execute.scala 145:40]
  wire [31:0] _io_out_memory_bits_data2_T_4 = io_hazard_in_aluSrc2 == 2'h1 ? io_hazard_in_rdValM :
    _io_out_memory_bits_data2_T_3; // @[3_Execute.scala 144:40]
  wire [11:0] csrAddr = stageReg_instState_inst[31:20]; // @[util.scala 47:36]
  ALU alu ( // @[3_Execute.scala 102:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out),
    .io_zero(alu_io_zero)
  );
  assign io_in_ready = io_out_fetch_ready; // @[3_Execute.scala 87:40]
  assign io_out_memory_bits_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 148:16 137:34]
  assign io_out_memory_bits_lsuOp = stageReg_lsuOp; // @[3_Execute.scala 148:16 141:30]
  assign io_out_memory_bits_regWrEn = stageReg_regWrEn; // @[3_Execute.scala 148:16 142:32]
  assign io_out_memory_bits_aluOut = alu_io_out; // @[3_Execute.scala 148:16 136:31]
  assign io_out_memory_bits_data2 = io_hazard_in_aluSrc2 == 2'h0 ? stageReg_data2 : _io_out_memory_bits_data2_T_4; // @[3_Execute.scala 143:36]
  assign io_out_memory_bits_pcNext4 = stageReg_pcNext4; // @[3_Execute.scala 148:16 146:32]
  assign io_out_memory_bits_csrOp = stageReg_csrOp; // @[3_Execute.scala 156:35]
  assign io_out_memory_bits_csrWrEn = stageReg_csrOp != 3'h0 & io_csrRead_valid; // @[3_Execute.scala 157:65]
  assign io_out_memory_bits_csrValid = io_csrRead_valid; // @[3_Execute.scala 158:35]
  assign io_out_memory_bits_csrWrData = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 110:21]
  assign io_out_memory_bits_csrAddr = {{20'd0}, csrAddr}; // @[3_Execute.scala 161:35]
  assign io_out_memory_bits_excType = stageReg_excType; // @[3_Execute.scala 162:35]
  assign io_out_memory_bits_instState_commit = stageReg_instState_commit; // @[3_Execute.scala 174:34]
  assign io_out_memory_bits_instState_pc = stageReg_instState_pc; // @[3_Execute.scala 174:34]
  assign io_out_memory_bits_instState_inst = stageReg_instState_inst; // @[3_Execute.scala 174:34]
  assign io_out_fetch_bits_brTaken = stageReg_isBranch & aluZero | stageReg_isJump; // @[3_Execute.scala 126:65]
  assign io_out_fetch_bits_targetAddr = stageReg_pcAddReg ? alu_io_out : _io_out_fetch_bits_targetAddr_T_8; // @[3_Execute.scala 127:40]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign io_hazard_out_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 170:29]
  assign io_hazard_out_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_csrRead_op = stageReg_csrOp; // @[3_Execute.scala 155:21]
  assign io_csrRead_addr = stageReg_instState_inst[31:20]; // @[util.scala 47:36]
  assign alu_io_in1 = stageReg_aluIn1IsReg ? hazardData1 : stageReg_aluIn1; // @[3_Execute.scala 110:21]
  assign alu_io_in2 = stageReg_aluIn2IsReg ? hazardData2 : stageReg_aluIn2; // @[3_Execute.scala 119:22]
  assign alu_io_opSel = stageReg_aluOpSel; // @[3_Execute.scala 122:18]
  always @(posedge clock) begin
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_isBranch <= _GEN_20;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_isJump <= _GEN_21;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_lsuOp <= 5'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_lsuOp <= 5'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluOpSel <= io_in_bits_aluOpSel; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_aluOpSel <= 4'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_immSign <= _GEN_25;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_regWrEn <= _GEN_26;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_pcAddReg <= _GEN_27;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_aluIn1 <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn1 <= io_in_bits_aluIn1; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_aluIn1 <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_aluIn2 <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_aluIn2 <= io_in_bits_aluIn2; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_aluIn2 <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_aluIn1IsReg <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_aluIn1IsReg <= _GEN_31;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_aluIn2IsReg <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_aluIn2IsReg <= _GEN_32;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_imm <= io_in_bits_imm; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_imm <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_data2 <= io_in_bits_data2; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_data2 <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_excType <= 4'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_excType <= io_in_bits_excType; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_excType <= 4'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_csrOp <= 3'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_csrOp <= io_in_bits_csrOp; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 96:28]
    end else begin
      stageReg_instState_commit <= _GEN_37;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[3_Execute.scala 89:27]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 89:27]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 96:17]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 96:28]
    end else if (executeLatch) begin // @[3_Execute.scala 90:24]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[3_Execute.scala 91:18]
    end else begin
      stageReg_instState_inst <= 32'h0;
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
module LSU(
  input         clock,
  input         reset,
  input  [31:0] io_addr,
  input  [31:0] io_wdata,
  output [31:0] io_data,
  input  [4:0]  io_lsuOp,
  output        io_excp_storeUnalign
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  ram_clock; // @[LSU.scala 75:21]
  wire  ram_reset; // @[LSU.scala 75:21]
  wire  ram_wen; // @[LSU.scala 75:21]
  wire [31:0] ram_waddr; // @[LSU.scala 75:21]
  wire [31:0] ram_wdata; // @[LSU.scala 75:21]
  wire [3:0] ram_wmask; // @[LSU.scala 75:21]
  wire [31:0] ram_raddr; // @[LSU.scala 75:21]
  wire [31:0] ram_rdata; // @[LSU.scala 75:21]
  reg  signedReg; // @[LSU.scala 80:24]
  wire  _T_1 = 5'h1 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_3 = 5'h2 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_5 = 5'h3 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_7 = 5'h4 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_9 = 5'h5 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_11 = 5'h6 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h7 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h8 == io_lsuOp; // @[Lookup.scala 31:38]
  wire  en = _T_1 | (_T_3 | (_T_5 | (_T_7 | (_T_9 | (_T_11 | (_T_13 | _T_15)))))); // @[Lookup.scala 34:39]
  wire  _T_30 = _T_9 ? 1'h0 : _T_11 | (_T_13 | _T_15); // @[Lookup.scala 34:39]
  wire  _T_31 = _T_7 ? 1'h0 : _T_30; // @[Lookup.scala 34:39]
  wire  _T_32 = _T_5 ? 1'h0 : _T_31; // @[Lookup.scala 34:39]
  wire  _T_33 = _T_3 ? 1'h0 : _T_32; // @[Lookup.scala 34:39]
  wire  wen = _T_1 ? 1'h0 : _T_33; // @[Lookup.scala 34:39]
  wire [1:0] _T_43 = _T_15 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_44 = _T_13 ? 2'h1 : _T_43; // @[Lookup.scala 34:39]
  wire [1:0] _T_45 = _T_11 ? 2'h0 : _T_44; // @[Lookup.scala 34:39]
  wire [1:0] _T_46 = _T_9 ? 2'h1 : _T_45; // @[Lookup.scala 34:39]
  wire [1:0] _T_47 = _T_7 ? 2'h0 : _T_46; // @[Lookup.scala 34:39]
  wire [1:0] _T_48 = _T_5 ? 2'h2 : _T_47; // @[Lookup.scala 34:39]
  wire [1:0] _T_49 = _T_3 ? 2'h1 : _T_48; // @[Lookup.scala 34:39]
  wire [1:0] width = _T_1 ? 2'h0 : _T_49; // @[Lookup.scala 34:39]
  wire  signed_ = _T_1 | (_T_3 | (_T_5 | _T_31)); // @[Lookup.scala 34:39]
  reg [1:0] blockIdx; // @[LSU.scala 86:23]
  wire  _io_excp_storeUnalign_T = blockIdx == 2'h3; // @[LSU.scala 97:63]
  wire  _io_excp_storeUnalign_T_1 = blockIdx != 2'h0; // @[LSU.scala 98:63]
  wire  _io_excp_storeUnalign_T_5 = 2'h2 == width ? _io_excp_storeUnalign_T_1 : 2'h1 == width & _io_excp_storeUnalign_T; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T = 4'h1 << blockIdx; // @[OneHot.scala 57:35]
  wire [2:0] _ram_io_wmask_T_4 = 2'h1 == blockIdx ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_6 = 2'h2 == blockIdx ? 4'hc : {{1'd0}, _ram_io_wmask_T_4}; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_8 = 2'h0 == width ? _ram_io_wmask_T : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_10 = 2'h1 == width ? _ram_io_wmask_T_6 : _ram_io_wmask_T_8; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_2 = {8'h0,ram_rdata[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_5 = {16'h0,ram_rdata[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_8 = {24'h0,ram_rdata[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_10 = 2'h1 == blockIdx ? _ramRdData_T_2 : ram_rdata; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_12 = 2'h2 == blockIdx ? _ramRdData_T_5 : _ramRdData_T_10; // @[Mux.scala 81:58]
  wire [31:0] ramRdData = 2'h3 == blockIdx ? _ramRdData_T_8 : _ramRdData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_data_T_1 = ramRdData[7:0]; // @[LSU.scala 138:83]
  wire  io_data_signBit = _io_data_T_1[7]; // @[util.scala 11:27]
  wire [5:0] io_data_out_lo_lo = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_data_out_lo = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit,io_data_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_data_out_T_1 = ramRdData[7:0]; // @[util.scala 15:75]
  wire [31:0] io_data_out = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit,io_data_out_lo_lo,io_data_out_lo,_io_data_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] _io_data_T_2 = signedReg ? io_data_out : ramRdData; // @[LSU.scala 138:48]
  wire [15:0] _io_data_T_4 = ramRdData[15:0]; // @[LSU.scala 139:84]
  wire  io_data_signBit_1 = _io_data_T_4[15]; // @[util.scala 11:27]
  wire [7:0] io_data_out_lo_1 = {io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,
    io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_data_out_T_3 = ramRdData[15:0]; // @[util.scala 15:75]
  wire [31:0] io_data_out_1 = {io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1
    ,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_out_lo_1,_io_data_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] _io_data_T_5 = signedReg ? io_data_out_1 : ramRdData; // @[LSU.scala 139:48]
  wire [31:0] _io_data_T_8 = 2'h3 == blockIdx ? _ramRdData_T_8 : _ramRdData_T_12; // @[util.scala 13:18]
  wire [31:0] _io_data_T_9 = signedReg ? _io_data_T_8 : ramRdData; // @[LSU.scala 140:48]
  wire [31:0] _io_data_T_11 = 2'h0 == width ? _io_data_T_2 : ramRdData; // @[Mux.scala 81:58]
  wire [31:0] _io_data_T_13 = 2'h1 == width ? _io_data_T_5 : _io_data_T_11; // @[Mux.scala 81:58]
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) ram ( // @[LSU.scala 75:21]
    .clock(ram_clock),
    .reset(ram_reset),
    .wen(ram_wen),
    .waddr(ram_waddr),
    .wdata(ram_wdata),
    .wmask(ram_wmask),
    .raddr(ram_raddr),
    .rdata(ram_rdata)
  );
  assign io_data = 2'h2 == width ? _io_data_T_9 : _io_data_T_13; // @[Mux.scala 81:58]
  assign io_excp_storeUnalign = wen & _io_excp_storeUnalign_T_5; // @[LSU.scala 95:15 92:26 96:30]
  assign ram_clock = clock; // @[LSU.scala 76:18]
  assign ram_reset = reset; // @[LSU.scala 77:18]
  assign ram_wen = wen & ~io_excp_storeUnalign; // @[LSU.scala 112:23]
  assign ram_waddr = io_addr - 32'h2000; // @[LSU.scala 113:29]
  assign ram_wdata = io_wdata; // @[LSU.scala 114:18]
  assign ram_wmask = 2'h2 == width ? 4'hf : _ram_io_wmask_T_10; // @[Mux.scala 81:58]
  assign ram_raddr = io_addr - 32'h2000; // @[LSU.scala 128:29]
  always @(posedge clock) begin
    if (en) begin // @[LSU.scala 87:14]
      signedReg <= signed_; // @[LSU.scala 89:19]
    end
    if (en) begin // @[LSU.scala 87:14]
      blockIdx <= io_addr[1:0]; // @[LSU.scala 88:18]
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
  signedReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  blockIdx = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mem(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input  [4:0]  io_in_bits_lsuOp,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input         io_in_bits_csrValid,
  input  [31:0] io_in_bits_csrWrData,
  input  [31:0] io_in_bits_csrAddr,
  input  [3:0]  io_in_bits_excType,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_aluOut,
  output [31:0] io_out_bits_pcNext4,
  output [2:0]  io_out_bits_csrOp,
  output        io_out_bits_csrWrEn,
  output [31:0] io_out_bits_csrWrData,
  output [11:0] io_out_bits_csrAddr,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [31:0] io_ramData,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  input         io_ctrl_flush,
  output        io_excp_valid,
  output        io_excp_bits_isMret,
  output        io_excp_bits_isSret,
  output [30:0] io_excp_bits_excCause,
  output [31:0] io_excp_bits_excPc,
  input         io_csrBusy,
  input  [1:0]  io_csrMode
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
`endif // RANDOMIZE_REG_INIT
  wire  lsu_clock; // @[4_Mem.scala 116:21]
  wire  lsu_reset; // @[4_Mem.scala 116:21]
  wire [31:0] lsu_io_addr; // @[4_Mem.scala 116:21]
  wire [31:0] lsu_io_wdata; // @[4_Mem.scala 116:21]
  wire [31:0] lsu_io_data; // @[4_Mem.scala 116:21]
  wire [4:0] lsu_io_lsuOp; // @[4_Mem.scala 116:21]
  wire  lsu_io_excp_storeUnalign; // @[4_Mem.scala 116:21]
  reg [1:0] stageReg_resultSrc; // @[4_Mem.scala 61:27]
  reg [4:0] stageReg_lsuOp; // @[4_Mem.scala 61:27]
  reg  stageReg_regWrEn; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_aluOut; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_data2; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_pcNext4; // @[4_Mem.scala 61:27]
  reg [2:0] stageReg_csrOp; // @[4_Mem.scala 61:27]
  reg  stageReg_csrWrEn; // @[4_Mem.scala 61:27]
  reg  stageReg_csrValid; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_csrWrData; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_csrAddr; // @[4_Mem.scala 61:27]
  reg [3:0] stageReg_excType; // @[4_Mem.scala 61:27]
  reg  stageReg_instState_commit; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_instState_pc; // @[4_Mem.scala 61:27]
  reg [31:0] stageReg_instState_inst; // @[4_Mem.scala 61:27]
  wire  _GEN_18 = io_in_ready & io_in_bits_regWrEn; // @[4_Mem.scala 62:23 63:18]
  wire  _GEN_23 = io_in_ready & io_in_bits_csrWrEn; // @[4_Mem.scala 62:23 63:18]
  wire  _GEN_24 = io_in_ready & io_in_bits_csrValid; // @[4_Mem.scala 62:23 63:18]
  wire  _GEN_29 = io_in_ready & io_in_bits_instState_commit; // @[4_Mem.scala 62:23 63:18]
  wire  _illgSret_T = stageReg_excType == 4'h3; // @[4_Mem.scala 72:38]
  wire  _illgSret_T_1 = io_csrMode == 2'h0; // @[4_Mem.scala 72:65]
  wire  illgSret = stageReg_excType == 4'h3 & io_csrMode == 2'h0; // @[4_Mem.scala 72:51]
  wire  _illgMret_T = stageReg_excType == 4'h4; // @[4_Mem.scala 73:38]
  wire  illgMret = stageReg_excType == 4'h4 & io_csrMode != 2'h3; // @[4_Mem.scala 73:51]
  wire  illgSpriv = stageReg_excType == 4'ha & _illgSret_T_1; // @[4_Mem.scala 74:52]
  wire  _instIllg_T_1 = stageReg_excType == 4'h5 | illgSret; // @[4_Mem.scala 77:52]
  wire  instIllg = _instIllg_T_1 | illgMret | illgSpriv; // @[4_Mem.scala 78:42]
  wire  _excOther_T_1 = stageReg_excType == 4'h2; // @[4_Mem.scala 80:38]
  wire  _excOther_T_2 = stageReg_excType == 4'h1 | _excOther_T_1; // @[4_Mem.scala 79:51]
  wire  _excOther_T_4 = _excOther_T_2 | _illgSret_T; // @[4_Mem.scala 80:51]
  wire  excOther = _excOther_T_4 | _illgMret_T; // @[4_Mem.scala 81:51]
  wire  hasTrap = (instIllg | excOther) & stageReg_instState_inst != 32'h0; // @[4_Mem.scala 83:42]
  wire [30:0] _cause_T_2 = io_csrMode == 2'h1 ? 31'h9 : 31'hb; // @[4_Mem.scala 87:28]
  wire [30:0] _cause_T_3 = _illgSret_T_1 ? 31'h8 : _cause_T_2; // @[4_Mem.scala 86:28]
  wire [30:0] _cause_T_5 = 4'h1 == stageReg_excType ? _cause_T_3 : 31'h0; // @[Mux.scala 81:58]
  wire [30:0] cause = 4'h2 == stageReg_excType ? 31'h3 : _cause_T_5; // @[Mux.scala 81:58]
  LSU lsu ( // @[4_Mem.scala 116:21]
    .clock(lsu_clock),
    .reset(lsu_reset),
    .io_addr(lsu_io_addr),
    .io_wdata(lsu_io_wdata),
    .io_data(lsu_io_data),
    .io_lsuOp(lsu_io_lsuOp),
    .io_excp_storeUnalign(lsu_io_excp_storeUnalign)
  );
  assign io_in_ready = 1'h1; // @[4_Mem.scala 59:33]
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Mem.scala 133:27]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 134:25]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Mem.scala 136:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Mem.scala 137:25]
  assign io_out_bits_csrOp = stageReg_csrOp; // @[4_Mem.scala 98:23]
  assign io_out_bits_csrWrEn = stageReg_csrWrEn; // @[4_Mem.scala 99:25]
  assign io_out_bits_csrWrData = stageReg_csrWrData; // @[4_Mem.scala 101:27]
  assign io_out_bits_csrAddr = stageReg_csrAddr[11:0]; // @[4_Mem.scala 102:25]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Mem.scala 138:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Mem.scala 138:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Mem.scala 138:27]
  assign io_ramData = lsu_io_data; // @[4_Mem.scala 122:16]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Mem.scala 144:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Mem.scala 143:23]
  assign io_excp_valid = ~io_csrBusy & hasTrap; // @[4_Mem.scala 92:34]
  assign io_excp_bits_isMret = stageReg_excType == 4'h4; // @[4_Mem.scala 95:45]
  assign io_excp_bits_isSret = stageReg_excType == 4'h3; // @[4_Mem.scala 96:45]
  assign io_excp_bits_excCause = stageReg_csrWrEn & ~stageReg_csrValid ? 31'h2 : cause; // @[4_Mem.scala 90:33]
  assign io_excp_bits_excPc = stageReg_instState_pc; // @[4_Mem.scala 93:24]
  assign lsu_clock = clock;
  assign lsu_reset = reset;
  assign lsu_io_addr = stageReg_aluOut; // @[4_Mem.scala 118:17]
  assign lsu_io_wdata = stageReg_data2; // @[4_Mem.scala 119:18]
  assign lsu_io_lsuOp = stageReg_lsuOp; // @[4_Mem.scala 121:18]
  always @(posedge clock) begin
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_resultSrc <= 2'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_lsuOp <= 5'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_lsuOp <= io_in_bits_lsuOp; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_lsuOp <= 5'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_regWrEn <= 1'h0; // @[4_Mem.scala 68:28]
    end else begin
      stageReg_regWrEn <= _GEN_18;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_aluOut <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_aluOut <= io_in_bits_aluOut; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_data2 <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_data2 <= io_in_bits_data2; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_data2 <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_pcNext4 <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_csrOp <= 3'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_csrOp <= io_in_bits_csrOp; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_csrWrEn <= 1'h0; // @[4_Mem.scala 68:28]
    end else begin
      stageReg_csrWrEn <= _GEN_23;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_csrValid <= 1'h0; // @[4_Mem.scala 68:28]
    end else begin
      stageReg_csrValid <= _GEN_24;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_csrWrData <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_csrAddr <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_csrAddr <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_excType <= 4'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_excType <= io_in_bits_excType; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_excType <= 4'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_instState_commit <= 1'h0; // @[4_Mem.scala 68:28]
    end else begin
      stageReg_instState_commit <= _GEN_29;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_instState_pc <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[4_Mem.scala 61:27]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 61:27]
    end else if (io_ctrl_flush) begin // @[4_Mem.scala 68:17]
      stageReg_instState_inst <= 32'h0; // @[4_Mem.scala 68:28]
    end else if (io_in_ready) begin // @[4_Mem.scala 62:23]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[4_Mem.scala 63:18]
    end else begin
      stageReg_instState_inst <= 32'h0;
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
  stageReg_resultSrc = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_lsuOp = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_data2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_csrValid = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_excType = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_14[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WriteBack(
  input         clock,
  input         reset,
  output        io_in_ready,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input  [2:0]  io_in_bits_csrOp,
  input         io_in_bits_csrWrEn,
  input  [31:0] io_in_bits_csrWrData,
  input  [11:0] io_in_bits_csrAddr,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output        io_instState_commit,
  output [31:0] io_instState_pc,
  output [31:0] io_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn,
  output [4:0]  io_regfile_rd,
  output        io_regfile_regWrEn,
  output [31:0] io_regfile_regWrData,
  output [2:0]  io_csrWrite_op,
  output [11:0] io_csrWrite_addr,
  output [31:0] io_csrWrite_data,
  output        io_csrWrite_retired,
  input  [31:0] io_ramData
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stageReg_resultSrc; // @[5_WriteBack.scala 52:27]
  reg  stageReg_regWrEn; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_aluOut; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_pcNext4; // @[5_WriteBack.scala 52:27]
  reg [2:0] stageReg_csrOp; // @[5_WriteBack.scala 52:27]
  reg  stageReg_csrWrEn; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_csrWrData; // @[5_WriteBack.scala 52:27]
  reg [11:0] stageReg_csrAddr; // @[5_WriteBack.scala 52:27]
  reg  stageReg_instState_commit; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_instState_pc; // @[5_WriteBack.scala 52:27]
  reg [31:0] stageReg_instState_inst; // @[5_WriteBack.scala 52:27]
  wire  _GEN_13 = io_in_ready & io_in_bits_regWrEn; // @[5_WriteBack.scala 53:26 54:18]
  wire  _GEN_17 = io_in_ready & io_in_bits_csrWrEn; // @[5_WriteBack.scala 53:26 54:18]
  wire  _GEN_21 = io_in_ready & io_in_bits_instState_commit; // @[5_WriteBack.scala 53:26 54:18]
  wire [31:0] _rdVal_T_3 = 2'h1 == stageReg_resultSrc ? io_ramData : stageReg_aluOut; // @[Mux.scala 81:58]
  assign io_in_ready = 1'h1; // @[5_WriteBack.scala 50:20]
  assign io_instState_commit = stageReg_instState_commit; // @[5_WriteBack.scala 78:18]
  assign io_instState_pc = stageReg_instState_pc; // @[5_WriteBack.scala 78:18]
  assign io_instState_inst = stageReg_instState_inst; // @[5_WriteBack.scala 78:18]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 83:23]
  assign io_regfile_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_regfile_regWrEn = stageReg_regWrEn; // @[5_WriteBack.scala 70:24]
  assign io_regfile_regWrData = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _rdVal_T_3; // @[Mux.scala 81:58]
  assign io_csrWrite_op = stageReg_csrWrEn ? stageReg_csrOp : 3'h1; // @[5_WriteBack.scala 75:28]
  assign io_csrWrite_addr = stageReg_csrAddr; // @[5_WriteBack.scala 73:22]
  assign io_csrWrite_data = stageReg_csrWrData; // @[5_WriteBack.scala 74:22]
  assign io_csrWrite_retired = stageReg_instState_commit; // @[5_WriteBack.scala 76:54]
  always @(posedge clock) begin
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_resultSrc <= 2'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_resultSrc <= 2'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_regWrEn <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_regWrEn <= _GEN_13;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_aluOut <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_aluOut <= io_in_bits_aluOut; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_aluOut <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_pcNext4 <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_pcNext4 <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrOp <= 3'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrOp <= io_in_bits_csrOp; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrOp <= 3'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrWrEn <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_csrWrEn <= _GEN_17;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrWrData <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrWrData <= io_in_bits_csrWrData; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrWrData <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_csrAddr <= 12'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_csrAddr <= io_in_bits_csrAddr; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_csrAddr <= 12'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_commit <= 1'h0; // @[5_WriteBack.scala 52:27]
    end else begin
      stageReg_instState_commit <= _GEN_21;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_pc <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_instState_pc <= 32'h0;
    end
    if (reset) begin // @[5_WriteBack.scala 52:27]
      stageReg_instState_inst <= 32'h0; // @[5_WriteBack.scala 52:27]
    end else if (io_in_ready) begin // @[5_WriteBack.scala 53:26]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[5_WriteBack.scala 54:18]
    end else begin
      stageReg_instState_inst <= 32'h0;
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
  stageReg_resultSrc = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_csrOp = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_csrWrEn = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_csrWrData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_csrAddr = _RAND_7[11:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipelineCtrl(
  input   io_in_brTaken,
  input   io_in_excpValid,
  output  io_out_decode_flush,
  output  io_out_execute_flush,
  output  io_out_memory_flush
);
  assign io_out_decode_flush = io_in_brTaken | io_in_excpValid; // @[PipelineCtrl.scala 35:38]
  assign io_out_execute_flush = io_in_brTaken | io_in_excpValid; // @[PipelineCtrl.scala 36:40]
  assign io_out_memory_flush = io_in_excpValid; // @[PipelineCtrl.scala 38:25]
endmodule
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
module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_r_0_addr,
  output [31:0] io_r_0_data,
  input  [4:0]  io_r_1_addr,
  output [31:0] io_r_1_data,
  input  [4:0]  io_w_0_addr,
  input         io_w_0_en,
  input  [31:0] io_w_0_data,
  output [31:0] io_state_regState_0,
  output [31:0] io_state_regState_1,
  output [31:0] io_state_regState_2,
  output [31:0] io_state_regState_3,
  output [31:0] io_state_regState_4,
  output [31:0] io_state_regState_5,
  output [31:0] io_state_regState_6,
  output [31:0] io_state_regState_7,
  output [31:0] io_state_regState_8,
  output [31:0] io_state_regState_9,
  output [31:0] io_state_regState_10,
  output [31:0] io_state_regState_11,
  output [31:0] io_state_regState_12,
  output [31:0] io_state_regState_13,
  output [31:0] io_state_regState_14,
  output [31:0] io_state_regState_15,
  output [31:0] io_state_regState_16,
  output [31:0] io_state_regState_17,
  output [31:0] io_state_regState_18,
  output [31:0] io_state_regState_19,
  output [31:0] io_state_regState_20,
  output [31:0] io_state_regState_21,
  output [31:0] io_state_regState_22,
  output [31:0] io_state_regState_23,
  output [31:0] io_state_regState_24,
  output [31:0] io_state_regState_25,
  output [31:0] io_state_regState_26,
  output [31:0] io_state_regState_27,
  output [31:0] io_state_regState_28,
  output [31:0] io_state_regState_29,
  output [31:0] io_state_regState_30,
  output [31:0] io_state_regState_31
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
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs_0; // @[RegFile.scala 40:17]
  reg [31:0] regs_1; // @[RegFile.scala 40:17]
  reg [31:0] regs_2; // @[RegFile.scala 40:17]
  reg [31:0] regs_3; // @[RegFile.scala 40:17]
  reg [31:0] regs_4; // @[RegFile.scala 40:17]
  reg [31:0] regs_5; // @[RegFile.scala 40:17]
  reg [31:0] regs_6; // @[RegFile.scala 40:17]
  reg [31:0] regs_7; // @[RegFile.scala 40:17]
  reg [31:0] regs_8; // @[RegFile.scala 40:17]
  reg [31:0] regs_9; // @[RegFile.scala 40:17]
  reg [31:0] regs_10; // @[RegFile.scala 40:17]
  reg [31:0] regs_11; // @[RegFile.scala 40:17]
  reg [31:0] regs_12; // @[RegFile.scala 40:17]
  reg [31:0] regs_13; // @[RegFile.scala 40:17]
  reg [31:0] regs_14; // @[RegFile.scala 40:17]
  reg [31:0] regs_15; // @[RegFile.scala 40:17]
  reg [31:0] regs_16; // @[RegFile.scala 40:17]
  reg [31:0] regs_17; // @[RegFile.scala 40:17]
  reg [31:0] regs_18; // @[RegFile.scala 40:17]
  reg [31:0] regs_19; // @[RegFile.scala 40:17]
  reg [31:0] regs_20; // @[RegFile.scala 40:17]
  reg [31:0] regs_21; // @[RegFile.scala 40:17]
  reg [31:0] regs_22; // @[RegFile.scala 40:17]
  reg [31:0] regs_23; // @[RegFile.scala 40:17]
  reg [31:0] regs_24; // @[RegFile.scala 40:17]
  reg [31:0] regs_25; // @[RegFile.scala 40:17]
  reg [31:0] regs_26; // @[RegFile.scala 40:17]
  reg [31:0] regs_27; // @[RegFile.scala 40:17]
  reg [31:0] regs_28; // @[RegFile.scala 40:17]
  reg [31:0] regs_29; // @[RegFile.scala 40:17]
  reg [31:0] regs_30; // @[RegFile.scala 40:17]
  reg [31:0] regs_31; // @[RegFile.scala 40:17]
  wire [31:0] _GEN_1 = reset ? 32'h0 : regs_1; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_2 = reset ? 32'h0 : regs_2; // @[RegFile.scala 41:22 46:11 40:17]
  wire [31:0] _GEN_3 = reset ? 32'h0 : regs_3; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_4 = reset ? 32'h0 : regs_4; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_5 = reset ? 32'h0 : regs_5; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_6 = reset ? 32'h0 : regs_6; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_7 = reset ? 32'h0 : regs_7; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_8 = reset ? 32'h0 : regs_8; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_9 = reset ? 32'h0 : regs_9; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_10 = reset ? 32'h0 : regs_10; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_11 = reset ? 32'h0 : regs_11; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_12 = reset ? 32'h0 : regs_12; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_13 = reset ? 32'h0 : regs_13; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_14 = reset ? 32'h0 : regs_14; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_15 = reset ? 32'h0 : regs_15; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_16 = reset ? 32'h0 : regs_16; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_17 = reset ? 32'h0 : regs_17; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_18 = reset ? 32'h0 : regs_18; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_19 = reset ? 32'h0 : regs_19; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_20 = reset ? 32'h0 : regs_20; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_21 = reset ? 32'h0 : regs_21; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_22 = reset ? 32'h0 : regs_22; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_23 = reset ? 32'h0 : regs_23; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_24 = reset ? 32'h0 : regs_24; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_25 = reset ? 32'h0 : regs_25; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_26 = reset ? 32'h0 : regs_26; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_27 = reset ? 32'h0 : regs_27; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_28 = reset ? 32'h0 : regs_28; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_29 = reset ? 32'h0 : regs_29; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_30 = reset ? 32'h0 : regs_30; // @[RegFile.scala 40:17 41:22 43:9]
  wire [31:0] _GEN_31 = reset ? 32'h0 : regs_31; // @[RegFile.scala 40:17 41:22 43:9]
  wire  _writeBypassVec_T_2 = io_w_0_addr != 5'h0; // @[RegFile.scala 54:67]
  wire  writeBypassVec_0 = io_w_0_en & io_r_0_addr == io_w_0_addr & io_w_0_addr != 5'h0; // @[RegFile.scala 54:51]
  wire  writeBypassVec_1 = io_w_0_en & io_r_1_addr == io_w_0_addr & io_w_0_addr != 5'h0; // @[RegFile.scala 54:51]
  wire [31:0] _GEN_33 = 5'h1 == io_r_0_addr ? regs_1 : regs_0; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_34 = 5'h2 == io_r_0_addr ? regs_2 : _GEN_33; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_35 = 5'h3 == io_r_0_addr ? regs_3 : _GEN_34; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_36 = 5'h4 == io_r_0_addr ? regs_4 : _GEN_35; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_37 = 5'h5 == io_r_0_addr ? regs_5 : _GEN_36; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_38 = 5'h6 == io_r_0_addr ? regs_6 : _GEN_37; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_39 = 5'h7 == io_r_0_addr ? regs_7 : _GEN_38; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_40 = 5'h8 == io_r_0_addr ? regs_8 : _GEN_39; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_41 = 5'h9 == io_r_0_addr ? regs_9 : _GEN_40; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_42 = 5'ha == io_r_0_addr ? regs_10 : _GEN_41; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_43 = 5'hb == io_r_0_addr ? regs_11 : _GEN_42; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_44 = 5'hc == io_r_0_addr ? regs_12 : _GEN_43; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_45 = 5'hd == io_r_0_addr ? regs_13 : _GEN_44; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_46 = 5'he == io_r_0_addr ? regs_14 : _GEN_45; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_47 = 5'hf == io_r_0_addr ? regs_15 : _GEN_46; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_48 = 5'h10 == io_r_0_addr ? regs_16 : _GEN_47; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_49 = 5'h11 == io_r_0_addr ? regs_17 : _GEN_48; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_50 = 5'h12 == io_r_0_addr ? regs_18 : _GEN_49; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_51 = 5'h13 == io_r_0_addr ? regs_19 : _GEN_50; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_52 = 5'h14 == io_r_0_addr ? regs_20 : _GEN_51; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_53 = 5'h15 == io_r_0_addr ? regs_21 : _GEN_52; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_54 = 5'h16 == io_r_0_addr ? regs_22 : _GEN_53; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_55 = 5'h17 == io_r_0_addr ? regs_23 : _GEN_54; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_56 = 5'h18 == io_r_0_addr ? regs_24 : _GEN_55; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_57 = 5'h19 == io_r_0_addr ? regs_25 : _GEN_56; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_58 = 5'h1a == io_r_0_addr ? regs_26 : _GEN_57; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_59 = 5'h1b == io_r_0_addr ? regs_27 : _GEN_58; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_60 = 5'h1c == io_r_0_addr ? regs_28 : _GEN_59; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_61 = 5'h1d == io_r_0_addr ? regs_29 : _GEN_60; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_62 = 5'h1e == io_r_0_addr ? regs_30 : _GEN_61; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_63 = 5'h1f == io_r_0_addr ? regs_31 : _GEN_62; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_67 = 5'h1 == io_r_1_addr ? regs_1 : regs_0; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_68 = 5'h2 == io_r_1_addr ? regs_2 : _GEN_67; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_69 = 5'h3 == io_r_1_addr ? regs_3 : _GEN_68; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_70 = 5'h4 == io_r_1_addr ? regs_4 : _GEN_69; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_71 = 5'h5 == io_r_1_addr ? regs_5 : _GEN_70; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_72 = 5'h6 == io_r_1_addr ? regs_6 : _GEN_71; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_73 = 5'h7 == io_r_1_addr ? regs_7 : _GEN_72; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_74 = 5'h8 == io_r_1_addr ? regs_8 : _GEN_73; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_75 = 5'h9 == io_r_1_addr ? regs_9 : _GEN_74; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_76 = 5'ha == io_r_1_addr ? regs_10 : _GEN_75; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_77 = 5'hb == io_r_1_addr ? regs_11 : _GEN_76; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_78 = 5'hc == io_r_1_addr ? regs_12 : _GEN_77; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_79 = 5'hd == io_r_1_addr ? regs_13 : _GEN_78; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_80 = 5'he == io_r_1_addr ? regs_14 : _GEN_79; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_81 = 5'hf == io_r_1_addr ? regs_15 : _GEN_80; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_82 = 5'h10 == io_r_1_addr ? regs_16 : _GEN_81; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_83 = 5'h11 == io_r_1_addr ? regs_17 : _GEN_82; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_84 = 5'h12 == io_r_1_addr ? regs_18 : _GEN_83; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_85 = 5'h13 == io_r_1_addr ? regs_19 : _GEN_84; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_86 = 5'h14 == io_r_1_addr ? regs_20 : _GEN_85; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_87 = 5'h15 == io_r_1_addr ? regs_21 : _GEN_86; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_88 = 5'h16 == io_r_1_addr ? regs_22 : _GEN_87; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_89 = 5'h17 == io_r_1_addr ? regs_23 : _GEN_88; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_90 = 5'h18 == io_r_1_addr ? regs_24 : _GEN_89; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_91 = 5'h19 == io_r_1_addr ? regs_25 : _GEN_90; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_92 = 5'h1a == io_r_1_addr ? regs_26 : _GEN_91; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_93 = 5'h1b == io_r_1_addr ? regs_27 : _GEN_92; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_94 = 5'h1c == io_r_1_addr ? regs_28 : _GEN_93; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_95 = 5'h1d == io_r_1_addr ? regs_29 : _GEN_94; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_96 = 5'h1e == io_r_1_addr ? regs_30 : _GEN_95; // @[RegFile.scala 62:{22,22}]
  wire [31:0] _GEN_97 = 5'h1f == io_r_1_addr ? regs_31 : _GEN_96; // @[RegFile.scala 62:{22,22}]
  assign io_r_0_data = writeBypassVec_0 ? io_w_0_data : _GEN_63; // @[RegFile.scala 59:31 60:22 62:22]
  assign io_r_1_data = writeBypassVec_1 ? io_w_0_data : _GEN_97; // @[RegFile.scala 59:31 60:22 62:22]
  assign io_state_regState_0 = regs_0; // @[RegFile.scala 81:61]
  assign io_state_regState_1 = regs_1; // @[RegFile.scala 81:61]
  assign io_state_regState_2 = regs_2; // @[RegFile.scala 81:61]
  assign io_state_regState_3 = regs_3; // @[RegFile.scala 81:61]
  assign io_state_regState_4 = regs_4; // @[RegFile.scala 81:61]
  assign io_state_regState_5 = regs_5; // @[RegFile.scala 81:61]
  assign io_state_regState_6 = regs_6; // @[RegFile.scala 81:61]
  assign io_state_regState_7 = regs_7; // @[RegFile.scala 81:61]
  assign io_state_regState_8 = regs_8; // @[RegFile.scala 81:61]
  assign io_state_regState_9 = regs_9; // @[RegFile.scala 81:61]
  assign io_state_regState_10 = regs_10; // @[RegFile.scala 81:61]
  assign io_state_regState_11 = regs_11; // @[RegFile.scala 81:61]
  assign io_state_regState_12 = regs_12; // @[RegFile.scala 81:61]
  assign io_state_regState_13 = regs_13; // @[RegFile.scala 81:61]
  assign io_state_regState_14 = regs_14; // @[RegFile.scala 81:61]
  assign io_state_regState_15 = regs_15; // @[RegFile.scala 81:61]
  assign io_state_regState_16 = regs_16; // @[RegFile.scala 81:61]
  assign io_state_regState_17 = regs_17; // @[RegFile.scala 81:61]
  assign io_state_regState_18 = regs_18; // @[RegFile.scala 81:61]
  assign io_state_regState_19 = regs_19; // @[RegFile.scala 81:61]
  assign io_state_regState_20 = regs_20; // @[RegFile.scala 81:61]
  assign io_state_regState_21 = regs_21; // @[RegFile.scala 81:61]
  assign io_state_regState_22 = regs_22; // @[RegFile.scala 81:61]
  assign io_state_regState_23 = regs_23; // @[RegFile.scala 81:61]
  assign io_state_regState_24 = regs_24; // @[RegFile.scala 81:61]
  assign io_state_regState_25 = regs_25; // @[RegFile.scala 81:61]
  assign io_state_regState_26 = regs_26; // @[RegFile.scala 81:61]
  assign io_state_regState_27 = regs_27; // @[RegFile.scala 81:61]
  assign io_state_regState_28 = regs_28; // @[RegFile.scala 81:61]
  assign io_state_regState_29 = regs_29; // @[RegFile.scala 81:61]
  assign io_state_regState_30 = regs_30; // @[RegFile.scala 81:61]
  assign io_state_regState_31 = regs_31; // @[RegFile.scala 81:61]
  always @(posedge clock) begin
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h0 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_0 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_0 <= 32'h0; // @[RegFile.scala 49:11]
      end
    end else begin
      regs_0 <= 32'h0; // @[RegFile.scala 49:11]
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_1 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_1 <= _GEN_1;
      end
    end else begin
      regs_1 <= _GEN_1;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h2 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_2 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_2 <= _GEN_2;
      end
    end else begin
      regs_2 <= _GEN_2;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h3 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_3 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_3 <= _GEN_3;
      end
    end else begin
      regs_3 <= _GEN_3;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h4 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_4 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_4 <= _GEN_4;
      end
    end else begin
      regs_4 <= _GEN_4;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h5 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_5 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_5 <= _GEN_5;
      end
    end else begin
      regs_5 <= _GEN_5;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h6 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_6 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_6 <= _GEN_6;
      end
    end else begin
      regs_6 <= _GEN_6;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h7 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_7 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_7 <= _GEN_7;
      end
    end else begin
      regs_7 <= _GEN_7;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h8 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_8 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_8 <= _GEN_8;
      end
    end else begin
      regs_8 <= _GEN_8;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h9 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_9 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_9 <= _GEN_9;
      end
    end else begin
      regs_9 <= _GEN_9;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'ha == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_10 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_10 <= _GEN_10;
      end
    end else begin
      regs_10 <= _GEN_10;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hb == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_11 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_11 <= _GEN_11;
      end
    end else begin
      regs_11 <= _GEN_11;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hc == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_12 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_12 <= _GEN_12;
      end
    end else begin
      regs_12 <= _GEN_12;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hd == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_13 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_13 <= _GEN_13;
      end
    end else begin
      regs_13 <= _GEN_13;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'he == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_14 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_14 <= _GEN_14;
      end
    end else begin
      regs_14 <= _GEN_14;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'hf == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_15 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_15 <= _GEN_15;
      end
    end else begin
      regs_15 <= _GEN_15;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h10 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_16 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_16 <= _GEN_16;
      end
    end else begin
      regs_16 <= _GEN_16;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h11 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_17 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_17 <= _GEN_17;
      end
    end else begin
      regs_17 <= _GEN_17;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h12 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_18 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_18 <= _GEN_18;
      end
    end else begin
      regs_18 <= _GEN_18;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h13 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_19 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_19 <= _GEN_19;
      end
    end else begin
      regs_19 <= _GEN_19;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h14 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_20 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_20 <= _GEN_20;
      end
    end else begin
      regs_20 <= _GEN_20;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h15 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_21 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_21 <= _GEN_21;
      end
    end else begin
      regs_21 <= _GEN_21;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h16 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_22 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_22 <= _GEN_22;
      end
    end else begin
      regs_22 <= _GEN_22;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h17 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_23 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_23 <= _GEN_23;
      end
    end else begin
      regs_23 <= _GEN_23;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h18 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_24 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_24 <= _GEN_24;
      end
    end else begin
      regs_24 <= _GEN_24;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h19 == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_25 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_25 <= _GEN_25;
      end
    end else begin
      regs_25 <= _GEN_25;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1a == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_26 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_26 <= _GEN_26;
      end
    end else begin
      regs_26 <= _GEN_26;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1b == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_27 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_27 <= _GEN_27;
      end
    end else begin
      regs_27 <= _GEN_27;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1c == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_28 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_28 <= _GEN_28;
      end
    end else begin
      regs_28 <= _GEN_28;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1d == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_29 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_29 <= _GEN_29;
      end
    end else begin
      regs_29 <= _GEN_29;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1e == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_30 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_30 <= _GEN_30;
      end
    end else begin
      regs_30 <= _GEN_30;
    end
    if (io_w_0_en & _writeBypassVec_T_2) begin // @[RegFile.scala 69:44]
      if (5'h1f == io_w_0_addr) begin // @[RegFile.scala 70:24]
        regs_31 <= io_w_0_data; // @[RegFile.scala 70:24]
      end else begin
        regs_31 <= _GEN_31;
      end
    end else begin
      regs_31 <= _GEN_31;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(regs_0 == 32'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: zero reg must be 0 !\n    at RegFile.scala:50 assert(regs(0).asUInt === 0.U, \"zero reg must be 0 !\")\n"
            ); // @[RegFile.scala 50:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(regs_0 == 32'h0) & ~reset) begin
          $fatal; // @[RegFile.scala 50:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  regs_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CsrFile(
  input         clock,
  input         reset,
  input  [2:0]  io_read_op,
  output        io_read_valid,
  input  [11:0] io_read_addr,
  output [31:0] io_read_data,
  input  [2:0]  io_write_op,
  input  [11:0] io_write_addr,
  input  [31:0] io_write_data,
  input         io_write_retired,
  input         io_except_valid,
  input         io_except_bits_isMret,
  input         io_except_bits_isSret,
  input  [30:0] io_except_bits_excCause,
  input  [31:0] io_except_bits_excPc,
  input  [31:0] io_except_bits_excValue,
  output [1:0]  io_mode,
  output        io_busy,
  output [31:0] io_mepc,
  output [31:0] io_trapVec
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
`endif // RANDOMIZE_REG_INIT
  reg  mcause_int; // @[CsrFile.scala 66:28]
  reg [30:0] mcause_code; // @[CsrFile.scala 66:28]
  reg  mstatus_sum; // @[CsrFile.scala 67:28]
  reg [1:0] mstatus_mpp; // @[CsrFile.scala 67:28]
  reg  mstatus_spp; // @[CsrFile.scala 67:28]
  reg  mstatus_mpie; // @[CsrFile.scala 67:28]
  reg  mstatus_spie; // @[CsrFile.scala 67:28]
  reg  mstatus_mie; // @[CsrFile.scala 67:28]
  reg  mstatus_sie; // @[CsrFile.scala 67:28]
  reg [29:0] mtvec_base; // @[CsrFile.scala 68:28]
  reg [1:0] mtvec_mode; // @[CsrFile.scala 68:28]
  reg [31:0] medeleg_data; // @[CsrFile.scala 69:28]
  reg [31:0] mideleg_data; // @[CsrFile.scala 70:28]
  reg [31:0] mepc_data; // @[CsrFile.scala 71:28]
  reg  satp_mode; // @[CsrFile.scala 72:28]
  reg [21:0] satp_ppn; // @[CsrFile.scala 72:28]
  reg [31:0] mtval_data; // @[CsrFile.scala 73:28]
  wire [31:0] _T = {mcause_int,mcause_code}; // @[CsrFile.scala 83:49]
  wire [10:0] lo = {2'h0,mstatus_spp,mstatus_mpie,1'h0,mstatus_spie,1'h0,mstatus_mie,1'h0,mstatus_sie,1'h0}; // @[CsrFile.scala 84:50]
  wire [31:0] _T_1 = {13'h0,mstatus_sum,1'h0,2'h0,2'h0,mstatus_mpp,lo}; // @[CsrFile.scala 84:50]
  wire [31:0] _T_2 = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 85:48]
  wire [31:0] _T_3 = {satp_mode,9'h0,satp_ppn}; // @[CsrFile.scala 89:47]
  wire  _T_5 = 12'hf14 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_7 = 12'h342 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_11 = 12'h305 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_13 = 12'h302 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_15 = 12'h303 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_17 = 12'h341 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_19 = 12'h180 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_21 = 12'h343 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_23 = 12'h3a0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_25 = 12'h3a1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_27 = 12'h3a2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_29 = 12'h3a3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_31 = 12'h3b0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_33 = 12'h3b1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_35 = 12'h3b2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_37 = 12'h3b3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_39 = 12'h3b4 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_41 = 12'h3b5 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_43 = 12'h3b6 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_45 = 12'h3b7 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_47 = 12'h3b8 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_49 = 12'h3b9 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_51 = 12'h3ba == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_53 = 12'h3bb == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_55 = 12'h3bc == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_57 = 12'h3bd == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_59 = 12'h3be == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_61 = 12'h3bf == io_read_addr; // @[Lookup.scala 31:38]
  wire [31:0] _T_82 = _T_21 ? mtval_data : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _T_83 = _T_19 ? _T_3 : _T_82; // @[Lookup.scala 34:39]
  wire [31:0] _T_84 = _T_17 ? mepc_data : _T_83; // @[Lookup.scala 34:39]
  wire [31:0] _T_85 = _T_15 ? mideleg_data : _T_84; // @[Lookup.scala 34:39]
  wire [31:0] _T_86 = _T_13 ? medeleg_data : _T_85; // @[Lookup.scala 34:39]
  wire [31:0] _T_87 = _T_11 ? _T_2 : _T_86; // @[Lookup.scala 34:39]
  wire [31:0] _T_88 = _T_7 ? _T_1 : _T_87; // @[Lookup.scala 34:39]
  wire [31:0] _T_89 = _T_7 ? _T : _T_88; // @[Lookup.scala 34:39]
  wire  readable = _T_5 | (_T_7 | (_T_7 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27
     | (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (
    _T_53 | (_T_55 | (_T_57 | (_T_59 | _T_61))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  writable = _T_5 ? 1'h0 : _T_7 | (_T_7 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 |
    (_T_27 | (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51
     | (_T_53 | (_T_55 | (_T_57 | (_T_59 | _T_61)))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _readValid_T = readable & writable; // @[CsrFile.scala 123:30]
  wire  _readValid_T_6 = 3'h2 == io_read_op ? writable : 3'h1 == io_read_op & readable; // @[Mux.scala 81:58]
  wire  _readValid_T_8 = 3'h3 == io_read_op ? _readValid_T : _readValid_T_6; // @[Mux.scala 81:58]
  wire  _readValid_T_10 = 3'h4 == io_read_op ? _readValid_T : _readValid_T_8; // @[Mux.scala 81:58]
  wire  _csrData_T_1 = 12'hf14 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_3 = 12'h342 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_7 = 12'h305 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_9 = 12'h302 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_11 = 12'h303 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_13 = 12'h341 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_15 = 12'h180 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_17 = 12'h343 == io_write_addr; // @[Lookup.scala 31:38]
  wire [31:0] _csrData_T_78 = _csrData_T_17 ? mtval_data : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_79 = _csrData_T_15 ? _T_3 : _csrData_T_78; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_80 = _csrData_T_13 ? mepc_data : _csrData_T_79; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_81 = _csrData_T_11 ? mideleg_data : _csrData_T_80; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_82 = _csrData_T_9 ? medeleg_data : _csrData_T_81; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_83 = _csrData_T_7 ? _T_2 : _csrData_T_82; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_84 = _csrData_T_3 ? _T_1 : _csrData_T_83; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_85 = _csrData_T_3 ? _T : _csrData_T_84; // @[Lookup.scala 34:39]
  wire [31:0] csrData = _csrData_T_1 ? 32'h0 : _csrData_T_85; // @[Lookup.scala 34:39]
  wire  writeEn = io_write_op != 3'h0 & io_write_op != 3'h1; // @[CsrFile.scala 133:43]
  wire [31:0] _writeData_T = csrData | io_write_data; // @[CsrFile.scala 137:29]
  wire [31:0] _writeData_T_1 = ~io_write_data; // @[CsrFile.scala 138:31]
  wire [31:0] _writeData_T_2 = csrData & _writeData_T_1; // @[CsrFile.scala 138:29]
  wire [31:0] _writeData_T_4 = 3'h2 == io_write_op ? io_write_data : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_6 = 3'h3 == io_write_op ? io_write_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_8 = 3'h4 == io_write_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [31:0] writeData = 3'h5 == io_write_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [6:0] medeleg_data_lo = {writeData[6],1'h0,writeData[4:2],1'h0,writeData[0]}; // @[Cat.scala 33:92]
  wire [15:0] _medeleg_data_T_6 = {writeData[15],1'h0,writeData[13:12],2'h0,writeData[9:8],1'h0,medeleg_data_lo}; // @[Cat.scala 33:92]
  wire [11:0] _mideleg_data_T_3 = {2'h0,writeData[9],3'h0,writeData[5],3'h0,writeData[1],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _mepc_data_T_1 = {writeData[31:2],2'h0}; // @[Cat.scala 33:92]
  wire  _GEN_0 = _csrData_T_15 ? writeData[31] : satp_mode; // @[CsrFile.scala 143:31 CSR.scala 187:11 CsrFile.scala 72:28]
  wire [21:0] _GEN_1 = _csrData_T_15 ? writeData[21:0] : satp_ppn; // @[CsrFile.scala 143:31 CSR.scala 188:11 CsrFile.scala 72:28]
  wire [31:0] _GEN_2 = _csrData_T_13 ? _mepc_data_T_1 : mepc_data; // @[CsrFile.scala 143:31 CSR.scala 369:11 CsrFile.scala 71:28]
  wire  _GEN_3 = _csrData_T_13 ? satp_mode : _GEN_0; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_4 = _csrData_T_13 ? satp_ppn : _GEN_1; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _GEN_5 = _csrData_T_11 ? {{20'd0}, _mideleg_data_T_3} : mideleg_data; // @[CsrFile.scala 143:31 CSR.scala 271:11 CsrFile.scala 70:28]
  wire [31:0] _GEN_6 = _csrData_T_11 ? mepc_data : _GEN_2; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_7 = _csrData_T_11 ? satp_mode : _GEN_3; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_8 = _csrData_T_11 ? satp_ppn : _GEN_4; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _GEN_9 = _csrData_T_9 ? {{16'd0}, _medeleg_data_T_6} : medeleg_data; // @[CsrFile.scala 143:31 CSR.scala 256:11 CsrFile.scala 69:28]
  wire [31:0] _GEN_10 = _csrData_T_9 ? mideleg_data : _GEN_5; // @[CsrFile.scala 143:31 70:28]
  wire [31:0] _GEN_11 = _csrData_T_9 ? mepc_data : _GEN_6; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_12 = _csrData_T_9 ? satp_mode : _GEN_7; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_13 = _csrData_T_9 ? satp_ppn : _GEN_8; // @[CsrFile.scala 143:31 72:28]
  wire [29:0] _GEN_14 = _csrData_T_7 ? writeData[31:2] : mtvec_base; // @[CsrFile.scala 143:31 CSR.scala 345:11 CsrFile.scala 68:28]
  wire [1:0] _GEN_15 = _csrData_T_7 ? {{1'd0}, writeData[0]} : mtvec_mode; // @[CsrFile.scala 143:31 CSR.scala 346:11 CsrFile.scala 68:28]
  wire [31:0] _GEN_16 = _csrData_T_7 ? medeleg_data : _GEN_9; // @[CsrFile.scala 143:31 69:28]
  wire [31:0] _GEN_17 = _csrData_T_7 ? mideleg_data : _GEN_10; // @[CsrFile.scala 143:31 70:28]
  wire [31:0] _GEN_18 = _csrData_T_7 ? mepc_data : _GEN_11; // @[CsrFile.scala 143:31 71:28]
  wire  _GEN_19 = _csrData_T_7 ? satp_mode : _GEN_12; // @[CsrFile.scala 143:31 72:28]
  wire [21:0] _GEN_20 = _csrData_T_7 ? satp_ppn : _GEN_13; // @[CsrFile.scala 143:31 72:28]
  wire [31:0] _T_153 = {1'h0,io_except_bits_excCause}; // @[Cat.scala 33:92]
  wire [31:0] _mepc_data_T_3 = {io_except_bits_excPc[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_read_valid = 3'h5 == io_read_op ? _readValid_T : _readValid_T_10; // @[Mux.scala 81:58]
  assign io_read_data = _T_5 ? 32'h0 : _T_89; // @[Lookup.scala 34:39]
  assign io_mode = 2'h3; // @[CsrFile.scala 161:13]
  assign io_busy = io_write_op != 3'h0 & io_write_op != 3'h1; // @[CsrFile.scala 133:43]
  assign io_mepc = mepc_data; // @[CsrFile.scala 163:13]
  assign io_trapVec = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 164:25]
  always @(posedge clock) begin
    if (reset) begin // @[CsrFile.scala 66:28]
      mcause_int <= 1'h0; // @[CsrFile.scala 66:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 143:31]
        mcause_int <= writeData[31]; // @[CSR.scala 384:11]
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mcause_int <= _T_153[31]; // @[CSR.scala 384:11]
    end
    if (reset) begin // @[CsrFile.scala 66:28]
      mcause_code <= 31'h0; // @[CsrFile.scala 66:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 143:31]
        mcause_code <= {{27'd0}, writeData[3:0]}; // @[CSR.scala 385:11]
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mcause_code <= {{27'd0}, _T_153[3:0]}; // @[CSR.scala 385:11]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_sum <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_sum <= writeData[18]; // @[CSR.scala 222:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mpp <= 2'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mpp <= writeData[12:11]; // @[CSR.scala 223:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mpp <= 2'h3; // @[CsrFile.scala 158:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_spp <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_spp <= writeData[8]; // @[CSR.scala 224:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mpie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mpie <= writeData[7]; // @[CSR.scala 225:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mpie <= mstatus_mie; // @[CsrFile.scala 156:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_spie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_spie <= writeData[5]; // @[CSR.scala 226:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_mie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_mie <= writeData[3]; // @[CSR.scala 227:11]
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mstatus_mie <= 1'h0; // @[CsrFile.scala 157:22]
    end
    if (reset) begin // @[CsrFile.scala 67:28]
      mstatus_sie <= 1'h0; // @[CsrFile.scala 67:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 143:31]
          mstatus_sie <= writeData[1]; // @[CSR.scala 228:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 68:28]
      mtvec_base <= 30'h0; // @[CsrFile.scala 68:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mtvec_base <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 68:28]
      mtvec_mode <= 2'h0; // @[CsrFile.scala 68:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mtvec_mode <= _GEN_15;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 69:28]
      medeleg_data <= 32'h0; // @[CsrFile.scala 69:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          medeleg_data <= _GEN_16;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mideleg_data <= 32'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mideleg_data <= _GEN_17;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 71:28]
      mepc_data <= 32'h0; // @[CsrFile.scala 71:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          mepc_data <= _GEN_18;
        end
      end
    end else if (io_except_valid) begin // @[CsrFile.scala 152:33]
      mepc_data <= _mepc_data_T_3; // @[CSR.scala 369:11]
    end
    if (reset) begin // @[CsrFile.scala 72:28]
      satp_mode <= 1'h0; // @[CsrFile.scala 72:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          satp_mode <= _GEN_19;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 72:28]
      satp_ppn <= 22'h0; // @[CsrFile.scala 72:28]
    end else if (writeEn) begin // @[CsrFile.scala 142:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 143:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 143:31]
          satp_ppn <= _GEN_20;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 73:28]
      mtval_data <= 32'h0; // @[CsrFile.scala 73:28]
    end else if (!(writeEn)) begin // @[CsrFile.scala 142:19]
      if (io_except_valid) begin // @[CsrFile.scala 152:33]
        mtval_data <= io_except_bits_excValue; // @[CSR.scala 17:10]
      end
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
  mcause_int = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mcause_code = _RAND_1[30:0];
  _RAND_2 = {1{`RANDOM}};
  mstatus_sum = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  mstatus_mpp = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  mstatus_spp = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mstatus_mpie = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  mstatus_spie = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  mstatus_mie = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mstatus_sie = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  mtvec_base = _RAND_9[29:0];
  _RAND_10 = {1{`RANDOM}};
  mtvec_mode = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  medeleg_data = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mideleg_data = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  mepc_data = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  satp_mode = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  satp_ppn = _RAND_15[21:0];
  _RAND_16 = {1{`RANDOM}};
  mtval_data = _RAND_16[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Arbiter_2(
  input   io_in_0_valid,
  output  io_out_valid
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 45:78]
  assign io_out_valid = ~grant_1; // @[Arbiter.scala 147:19]
endmodule
module BusCrossBar(
  output  io_masterFace_out_0_valid
);
  wire  masterArbs_0_io_in_0_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_0_io_out_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_in_0_valid; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_out_valid; // @[TLBus.scala 191:50]
  Arbiter_2 masterArbs_0 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_0_io_in_0_valid),
    .io_out_valid(masterArbs_0_io_out_valid)
  );
  Arbiter_2 masterArbs_1 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_1_io_in_0_valid),
    .io_out_valid(masterArbs_1_io_out_valid)
  );
  assign io_masterFace_out_0_valid = masterArbs_0_io_out_valid; // @[TLBus.scala 199:30]
  assign masterArbs_0_io_in_0_valid = 1'h1; // @[TLBus.scala 194:57]
  assign masterArbs_1_io_in_0_valid = 1'h0; // @[TLBus.scala 194:57]
endmodule
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
  wire  ife_io_rom_resp_valid; // @[Core.scala 37:21]
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
  wire [31:0] mem_io_ramData; // @[Core.scala 55:21]
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
  wire [31:0] wb_io_ramData; // @[Core.scala 61:20]
  wire  pipelineCtrl_io_in_brTaken; // @[Core.scala 67:30]
  wire  pipelineCtrl_io_in_excpValid; // @[Core.scala 67:30]
  wire  pipelineCtrl_io_out_decode_flush; // @[Core.scala 67:30]
  wire  pipelineCtrl_io_out_execute_flush; // @[Core.scala 67:30]
  wire  pipelineCtrl_io_out_memory_flush; // @[Core.scala 67:30]
  wire [4:0] hazardU_io_in_decode_rs1; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_decode_rs2; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_execute_rs1; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_execute_rs2; // @[Core.scala 77:25]
  wire [1:0] hazardU_io_in_execute_resultSrc; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_execute_rd; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_memory_rd; // @[Core.scala 77:25]
  wire [31:0] hazardU_io_in_memory_rdVal; // @[Core.scala 77:25]
  wire  hazardU_io_in_memory_regWrEn; // @[Core.scala 77:25]
  wire [4:0] hazardU_io_in_writeback_rd; // @[Core.scala 77:25]
  wire [31:0] hazardU_io_in_writeback_rdVal; // @[Core.scala 77:25]
  wire  hazardU_io_in_writeback_regWrEn; // @[Core.scala 77:25]
  wire [1:0] hazardU_io_out_execute_aluSrc1; // @[Core.scala 77:25]
  wire [1:0] hazardU_io_out_execute_aluSrc2; // @[Core.scala 77:25]
  wire [31:0] hazardU_io_out_execute_rdValM; // @[Core.scala 77:25]
  wire [31:0] hazardU_io_out_execute_rdValW; // @[Core.scala 77:25]
  wire  hazardU_io_out_decode_stall; // @[Core.scala 77:25]
  wire  regFile_clock; // @[Core.scala 86:25]
  wire  regFile_reset; // @[Core.scala 86:25]
  wire [4:0] regFile_io_r_0_addr; // @[Core.scala 86:25]
  wire [31:0] regFile_io_r_0_data; // @[Core.scala 86:25]
  wire [4:0] regFile_io_r_1_addr; // @[Core.scala 86:25]
  wire [31:0] regFile_io_r_1_data; // @[Core.scala 86:25]
  wire [4:0] regFile_io_w_0_addr; // @[Core.scala 86:25]
  wire  regFile_io_w_0_en; // @[Core.scala 86:25]
  wire [31:0] regFile_io_w_0_data; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_0; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_1; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_2; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_3; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_4; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_5; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_6; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_7; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_8; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_9; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_10; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_11; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_12; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_13; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_14; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_15; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_16; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_17; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_18; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_19; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_20; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_21; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_22; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_23; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_24; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_25; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_26; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_27; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_28; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_29; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_30; // @[Core.scala 86:25]
  wire [31:0] regFile_io_state_regState_31; // @[Core.scala 86:25]
  wire  csrFile_clock; // @[Core.scala 98:25]
  wire  csrFile_reset; // @[Core.scala 98:25]
  wire [2:0] csrFile_io_read_op; // @[Core.scala 98:25]
  wire  csrFile_io_read_valid; // @[Core.scala 98:25]
  wire [11:0] csrFile_io_read_addr; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_read_data; // @[Core.scala 98:25]
  wire [2:0] csrFile_io_write_op; // @[Core.scala 98:25]
  wire [11:0] csrFile_io_write_addr; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_write_data; // @[Core.scala 98:25]
  wire  csrFile_io_write_retired; // @[Core.scala 98:25]
  wire  csrFile_io_except_valid; // @[Core.scala 98:25]
  wire  csrFile_io_except_bits_isMret; // @[Core.scala 98:25]
  wire  csrFile_io_except_bits_isSret; // @[Core.scala 98:25]
  wire [30:0] csrFile_io_except_bits_excCause; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_except_bits_excPc; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_except_bits_excValue; // @[Core.scala 98:25]
  wire [1:0] csrFile_io_mode; // @[Core.scala 98:25]
  wire  csrFile_io_busy; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_mepc; // @[Core.scala 98:25]
  wire [31:0] csrFile_io_trapVec; // @[Core.scala 98:25]
  wire  busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 114:29]
  wire  rom_clock; // @[Core.scala 120:21]
  wire  rom_reset; // @[Core.scala 120:21]
  wire  rom_wen; // @[Core.scala 120:21]
  wire [31:0] rom_waddr; // @[Core.scala 120:21]
  wire [31:0] rom_wdata; // @[Core.scala 120:21]
  wire [3:0] rom_wmask; // @[Core.scala 120:21]
  wire [31:0] rom_raddr; // @[Core.scala 120:21]
  wire [31:0] rom_rdata; // @[Core.scala 120:21]
  reg  ife_io_in_start_REG; // @[Core.scala 38:31]
  reg  io_out_state_instState_REG_commit; // @[Core.scala 110:38]
  reg [31:0] io_out_state_instState_REG_pc; // @[Core.scala 110:38]
  reg [31:0] io_out_state_instState_REG_inst; // @[Core.scala 110:38]
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
    .io_rom_resp_valid(ife_io_rom_resp_valid),
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
    .io_ramData(mem_io_ramData),
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
    .io_ramData(wb_io_ramData)
  );
  PipelineCtrl pipelineCtrl ( // @[Core.scala 67:30]
    .io_in_brTaken(pipelineCtrl_io_in_brTaken),
    .io_in_excpValid(pipelineCtrl_io_in_excpValid),
    .io_out_decode_flush(pipelineCtrl_io_out_decode_flush),
    .io_out_execute_flush(pipelineCtrl_io_out_execute_flush),
    .io_out_memory_flush(pipelineCtrl_io_out_memory_flush)
  );
  HazardUnit hazardU ( // @[Core.scala 77:25]
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
  RegFile regFile ( // @[Core.scala 86:25]
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
  CsrFile csrFile ( // @[Core.scala 98:25]
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
  BusCrossBar busCrossBar ( // @[Core.scala 114:29]
    .io_masterFace_out_0_valid(busCrossBar_io_masterFace_out_0_valid)
  );
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) rom ( // @[Core.scala 120:21]
    .clock(rom_clock),
    .reset(rom_reset),
    .wen(rom_wen),
    .waddr(rom_waddr),
    .wdata(rom_wdata),
    .wmask(rom_wmask),
    .raddr(rom_raddr),
    .rdata(rom_rdata)
  );
  assign io_out_state_intRegState_regState_0 = regFile_io_state_regState_0; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_1 = regFile_io_state_regState_1; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_2 = regFile_io_state_regState_2; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_3 = regFile_io_state_regState_3; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_4 = regFile_io_state_regState_4; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_5 = regFile_io_state_regState_5; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_6 = regFile_io_state_regState_6; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_7 = regFile_io_state_regState_7; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_8 = regFile_io_state_regState_8; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_9 = regFile_io_state_regState_9; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_10 = regFile_io_state_regState_10; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_11 = regFile_io_state_regState_11; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_12 = regFile_io_state_regState_12; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_13 = regFile_io_state_regState_13; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_14 = regFile_io_state_regState_14; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_15 = regFile_io_state_regState_15; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_16 = regFile_io_state_regState_16; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_17 = regFile_io_state_regState_17; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_18 = regFile_io_state_regState_18; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_19 = regFile_io_state_regState_19; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_20 = regFile_io_state_regState_20; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_21 = regFile_io_state_regState_21; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_22 = regFile_io_state_regState_22; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_23 = regFile_io_state_regState_23; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_24 = regFile_io_state_regState_24; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_25 = regFile_io_state_regState_25; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_26 = regFile_io_state_regState_26; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_27 = regFile_io_state_regState_27; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_28 = regFile_io_state_regState_28; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_29 = regFile_io_state_regState_29; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_30 = regFile_io_state_regState_30; // @[Core.scala 111:30]
  assign io_out_state_intRegState_regState_31 = regFile_io_state_regState_31; // @[Core.scala 111:30]
  assign io_out_state_instState_commit = io_out_state_instState_REG_commit; // @[Core.scala 110:28]
  assign io_out_state_instState_pc = io_out_state_instState_REG_pc; // @[Core.scala 110:28]
  assign io_out_state_instState_inst = io_out_state_instState_REG_inst; // @[Core.scala 110:28]
  assign ife_clock = clock;
  assign ife_reset = reset;
  assign ife_io_in_start = ife_io_in_start_REG; // @[Core.scala 38:21]
  assign ife_io_in_execute_bits_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 52:23]
  assign ife_io_in_execute_bits_targetAddr = exe_io_out_fetch_bits_targetAddr; // @[Core.scala 52:23]
  assign ife_io_out_ready = dec_io_in_ready; // @[Core.scala 46:15]
  assign ife_io_rom_resp_valid = busCrossBar_io_masterFace_out_0_valid; // @[Core.scala 117:21]
  assign ife_io_trapVec = csrFile_io_trapVec; // @[Core.scala 105:13 33:23]
  assign ife_io_mepc = csrFile_io_mepc; // @[Core.scala 106:10 34:20]
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
  assign dec_io_hazard_in_stall = hazardU_io_out_decode_stall; // @[Core.scala 31:24 83:14]
  assign dec_io_regfile_rdata1 = regFile_io_r_0_data; // @[Core.scala 91:27]
  assign dec_io_regfile_rdata2 = regFile_io_r_1_data; // @[Core.scala 92:27]
  assign dec_io_ctrl_flush = pipelineCtrl_io_out_decode_flush; // @[Core.scala 71:17]
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
  assign exe_io_out_fetch_ready = ife_io_in_execute_ready; // @[Core.scala 52:23]
  assign exe_io_hazard_in_aluSrc1 = hazardU_io_out_execute_aluSrc1; // @[Core.scala 82:28]
  assign exe_io_hazard_in_aluSrc2 = hazardU_io_out_execute_aluSrc2; // @[Core.scala 82:28]
  assign exe_io_hazard_in_rdValM = hazardU_io_out_execute_rdValM; // @[Core.scala 82:28]
  assign exe_io_hazard_in_rdValW = hazardU_io_out_execute_rdValW; // @[Core.scala 82:28]
  assign exe_io_ctrl_flush = pipelineCtrl_io_out_execute_flush; // @[Core.scala 72:17]
  assign exe_io_csrRead_valid = csrFile_io_read_valid; // @[Core.scala 101:21]
  assign mem_clock = clock;
  assign mem_reset = reset;
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
  assign mem_io_ctrl_flush = pipelineCtrl_io_out_memory_flush; // @[Core.scala 73:17]
  assign mem_io_csrBusy = csrFile_io_busy; // @[Core.scala 103:20]
  assign mem_io_csrMode = csrFile_io_mode; // @[Core.scala 104:20]
  assign wb_clock = clock;
  assign wb_reset = reset;
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
  assign wb_io_ramData = mem_io_ramData; // @[Core.scala 63:19]
  assign pipelineCtrl_io_in_brTaken = exe_io_out_fetch_bits_brTaken; // @[Core.scala 69:32]
  assign pipelineCtrl_io_in_excpValid = mem_io_excp_valid; // @[Core.scala 68:34]
  assign hazardU_io_in_decode_rs1 = dec_io_hazard_out_rs1; // @[Core.scala 78:26]
  assign hazardU_io_in_decode_rs2 = dec_io_hazard_out_rs2; // @[Core.scala 78:26]
  assign hazardU_io_in_execute_rs1 = exe_io_hazard_out_rs1; // @[Core.scala 79:27]
  assign hazardU_io_in_execute_rs2 = exe_io_hazard_out_rs2; // @[Core.scala 79:27]
  assign hazardU_io_in_execute_resultSrc = exe_io_hazard_out_resultSrc; // @[Core.scala 79:27]
  assign hazardU_io_in_execute_rd = exe_io_hazard_out_rd; // @[Core.scala 79:27]
  assign hazardU_io_in_memory_rd = mem_io_hazard_rd; // @[Core.scala 80:26]
  assign hazardU_io_in_memory_rdVal = mem_io_hazard_rdVal; // @[Core.scala 80:26]
  assign hazardU_io_in_memory_regWrEn = mem_io_hazard_regWrEn; // @[Core.scala 80:26]
  assign hazardU_io_in_writeback_rd = wb_io_hazard_rd; // @[Core.scala 81:29]
  assign hazardU_io_in_writeback_rdVal = wb_io_hazard_rdVal; // @[Core.scala 81:29]
  assign hazardU_io_in_writeback_regWrEn = wb_io_hazard_regWrEn; // @[Core.scala 81:29]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = dec_io_regfile_rs1; // @[Core.scala 89:26]
  assign regFile_io_r_1_addr = dec_io_regfile_rs2; // @[Core.scala 90:26]
  assign regFile_io_w_0_addr = wb_io_regfile_rd; // @[Core.scala 94:26]
  assign regFile_io_w_0_en = wb_io_regfile_regWrEn; // @[Core.scala 93:24]
  assign regFile_io_w_0_data = wb_io_regfile_regWrData; // @[Core.scala 95:26]
  assign csrFile_clock = clock;
  assign csrFile_reset = reset;
  assign csrFile_io_read_op = exe_io_csrRead_op; // @[Core.scala 101:21]
  assign csrFile_io_read_addr = exe_io_csrRead_addr; // @[Core.scala 101:21]
  assign csrFile_io_write_op = wb_io_csrWrite_op; // @[Core.scala 102:22]
  assign csrFile_io_write_addr = wb_io_csrWrite_addr; // @[Core.scala 102:22]
  assign csrFile_io_write_data = wb_io_csrWrite_data; // @[Core.scala 102:22]
  assign csrFile_io_write_retired = wb_io_csrWrite_retired; // @[Core.scala 102:22]
  assign csrFile_io_except_valid = mem_io_excp_valid; // @[Core.scala 100:23]
  assign csrFile_io_except_bits_isMret = mem_io_excp_bits_isMret; // @[Core.scala 100:23]
  assign csrFile_io_except_bits_isSret = mem_io_excp_bits_isSret; // @[Core.scala 100:23]
  assign csrFile_io_except_bits_excCause = mem_io_excp_bits_excCause; // @[Core.scala 100:23]
  assign csrFile_io_except_bits_excPc = mem_io_excp_bits_excPc; // @[Core.scala 100:23]
  assign csrFile_io_except_bits_excValue = 32'h0; // @[Core.scala 100:23]
  assign rom_clock = clock; // @[Core.scala 121:18]
  assign rom_reset = reset; // @[Core.scala 122:18]
  assign rom_wen = 1'h0; // @[Core.scala 134:56]
  assign rom_waddr = 32'h0; // @[Core.scala 137:18]
  assign rom_wdata = 32'h0; // @[Core.scala 136:18]
  assign rom_wmask = 4'hf; // @[Core.scala 135:18]
  assign rom_raddr = 32'h0; // @[Core.scala 138:18]
  always @(posedge clock) begin
    ife_io_in_start_REG <= io_in_start; // @[Core.scala 38:31]
    io_out_state_instState_REG_commit <= wb_io_instState_commit; // @[Core.scala 110:38]
    io_out_state_instState_REG_pc <= wb_io_instState_pc; // @[Core.scala 110:38]
    io_out_state_instState_REG_inst <= wb_io_instState_inst; // @[Core.scala 110:38]
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
