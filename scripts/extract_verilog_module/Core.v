module ROM(
  input         clock,
  input  [31:0] io_raddr,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[ROM.scala 26:26]
  wire  mem_io_rdata_MPORT_en; // @[ROM.scala 26:26]
  wire [9:0] mem_io_rdata_MPORT_addr; // @[ROM.scala 26:26]
  wire [31:0] mem_io_rdata_MPORT_data; // @[ROM.scala 26:26]
  wire [31:0] mem_MPORT_data; // @[ROM.scala 26:26]
  wire [9:0] mem_MPORT_addr; // @[ROM.scala 26:26]
  wire  mem_MPORT_mask; // @[ROM.scala 26:26]
  wire  mem_MPORT_en; // @[ROM.scala 26:26]
  reg  mem_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_en = mem_io_rdata_MPORT_en_pipe_0;
  assign mem_io_rdata_MPORT_addr = mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_data = mem[mem_io_rdata_MPORT_addr]; // @[ROM.scala 26:26]
  assign mem_MPORT_data = 32'h0;
  assign mem_MPORT_addr = 10'h0;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = 1'h0;
  assign io_rdata = mem_io_rdata_MPORT_data; // @[ROM.scala 30:54 31:18 33:18]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[ROM.scala 26:26]
    end
    mem_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      mem_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
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
  input         io_rom_resp_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  instMem_clock; // @[1_Fetch.scala 45:25]
  wire [31:0] instMem_io_raddr; // @[1_Fetch.scala 45:25]
  wire [31:0] instMem_io_rdata; // @[1_Fetch.scala 45:25]
  reg [31:0] pcReg; // @[1_Fetch.scala 40:24]
  wire  commit = io_rom_resp_valid & io_in_start; // @[1_Fetch.scala 50:36]
  wire [31:0] pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 52:25]
  wire [31:0] pcNext = io_in_execute_bits_brTaken ? io_in_execute_bits_targetAddr : pcNext4; // @[1_Fetch.scala 66:18]
  ROM instMem ( // @[1_Fetch.scala 45:25]
    .clock(instMem_clock),
    .io_raddr(instMem_io_raddr),
    .io_rdata(instMem_io_rdata)
  );
  assign io_in_execute_ready = io_in_start; // @[1_Fetch.scala 38:40]
  assign io_out_valid = (io_out_ready | io_in_start) & commit; // @[1_Fetch.scala 80:63]
  assign io_out_bits_pcNext4 = pcReg + 32'h4; // @[1_Fetch.scala 52:25]
  assign io_out_bits_instState_commit = io_rom_resp_valid & io_in_start; // @[1_Fetch.scala 50:36]
  assign io_out_bits_instState_pc = pcReg; // @[1_Fetch.scala 77:30]
  assign io_out_bits_instState_inst = instMem_io_rdata; // @[1_Fetch.scala 42:24 48:10]
  assign instMem_clock = clock;
  assign instMem_io_raddr = commit ? pcNext : pcReg; // @[1_Fetch.scala 68:14]
  always @(posedge clock) begin
    if (reset) begin // @[1_Fetch.scala 40:24]
      pcReg <= 32'h0; // @[1_Fetch.scala 40:24]
    end else if (commit) begin // @[1_Fetch.scala 68:14]
      if (io_in_execute_bits_brTaken) begin // @[1_Fetch.scala 66:18]
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
  output        io_out_memWrEn,
  output [2:0]  io_out_memType,
  output [3:0]  io_out_aluOpSel,
  output        io_out_aluSrc,
  output [1:0]  io_out_immSrc,
  output        io_out_immSign,
  output        io_out_regWrEn
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
  wire  _decodeSigs_T_75 = 32'h73 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_77 = 32'h100073 == io_inst; // @[Lookup.scala 31:38]
  wire  _decodeSigs_T_88 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_59 | (_decodeSigs_T_61 | (_decodeSigs_T_63 | (
    _decodeSigs_T_65 | (_decodeSigs_T_67 | _decodeSigs_T_69)))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_89 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_88; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_90 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_89; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_91 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_90; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_92 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_91; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_93 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_92; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_94 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_93; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_95 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_94; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_96 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_95; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_97 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_96; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_98 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_97; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_99 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_98; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_100 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_99; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_101 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_100; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_102 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_101; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_103 = _decodeSigs_T_27 ? 1'h0 : _decodeSigs_T_102; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_104 = _decodeSigs_T_25 ? 1'h0 : _decodeSigs_T_103; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_105 = _decodeSigs_T_23 ? 1'h0 : _decodeSigs_T_104; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_106 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_105; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_107 = _decodeSigs_T_19 ? 1'h0 : _decodeSigs_T_106; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_108 = _decodeSigs_T_17 ? 1'h0 : _decodeSigs_T_107; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_109 = _decodeSigs_T_15 ? 1'h0 : _decodeSigs_T_108; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_110 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_109; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_111 = _decodeSigs_T_11 ? 1'h0 : _decodeSigs_T_110; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_112 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_111; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_113 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_112; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_114 = _decodeSigs_T_5 ? 1'h0 : _decodeSigs_T_113; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_115 = _decodeSigs_T_3 ? 1'h0 : _decodeSigs_T_114; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_118 = _decodeSigs_T_73 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_119 = _decodeSigs_T_71 ? 2'h2 : _decodeSigs_T_118; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_120 = _decodeSigs_T_69 ? 2'h0 : _decodeSigs_T_119; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_121 = _decodeSigs_T_67 ? 2'h0 : _decodeSigs_T_120; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_122 = _decodeSigs_T_65 ? 2'h0 : _decodeSigs_T_121; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_123 = _decodeSigs_T_63 ? 2'h0 : _decodeSigs_T_122; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_124 = _decodeSigs_T_61 ? 2'h0 : _decodeSigs_T_123; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_125 = _decodeSigs_T_59 ? 2'h0 : _decodeSigs_T_124; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_126 = _decodeSigs_T_57 ? 2'h0 : _decodeSigs_T_125; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_127 = _decodeSigs_T_55 ? 2'h0 : _decodeSigs_T_126; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_128 = _decodeSigs_T_53 ? 2'h0 : _decodeSigs_T_127; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_129 = _decodeSigs_T_51 ? 2'h0 : _decodeSigs_T_128; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_130 = _decodeSigs_T_49 ? 2'h0 : _decodeSigs_T_129; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_131 = _decodeSigs_T_47 ? 2'h0 : _decodeSigs_T_130; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_132 = _decodeSigs_T_45 ? 2'h0 : _decodeSigs_T_131; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_133 = _decodeSigs_T_43 ? 2'h0 : _decodeSigs_T_132; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_134 = _decodeSigs_T_41 ? 2'h0 : _decodeSigs_T_133; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_135 = _decodeSigs_T_39 ? 2'h0 : _decodeSigs_T_134; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_136 = _decodeSigs_T_37 ? 2'h0 : _decodeSigs_T_135; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_137 = _decodeSigs_T_35 ? 2'h0 : _decodeSigs_T_136; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_138 = _decodeSigs_T_33 ? 2'h0 : _decodeSigs_T_137; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_139 = _decodeSigs_T_31 ? 2'h0 : _decodeSigs_T_138; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_140 = _decodeSigs_T_29 ? 2'h0 : _decodeSigs_T_139; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_141 = _decodeSigs_T_27 ? 2'h0 : _decodeSigs_T_140; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_142 = _decodeSigs_T_25 ? 2'h0 : _decodeSigs_T_141; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_143 = _decodeSigs_T_23 ? 2'h0 : _decodeSigs_T_142; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_144 = _decodeSigs_T_21 ? 2'h0 : _decodeSigs_T_143; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_145 = _decodeSigs_T_19 ? 2'h0 : _decodeSigs_T_144; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_146 = _decodeSigs_T_17 ? 2'h0 : _decodeSigs_T_145; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_147 = _decodeSigs_T_15 ? 2'h0 : _decodeSigs_T_146; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_148 = _decodeSigs_T_13 ? 2'h0 : _decodeSigs_T_147; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_149 = _decodeSigs_T_11 ? 2'h0 : _decodeSigs_T_148; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_150 = _decodeSigs_T_9 ? 2'h1 : _decodeSigs_T_149; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_151 = _decodeSigs_T_7 ? 2'h1 : _decodeSigs_T_150; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_152 = _decodeSigs_T_5 ? 2'h1 : _decodeSigs_T_151; // @[Lookup.scala 34:39]
  wire [1:0] _decodeSigs_T_153 = _decodeSigs_T_3 ? 2'h1 : _decodeSigs_T_152; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_178 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_31 | (_decodeSigs_T_33 | _decodeSigs_T_35); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_179 = _decodeSigs_T_27 ? 1'h0 : _decodeSigs_T_178; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_180 = _decodeSigs_T_25 ? 1'h0 : _decodeSigs_T_179; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_181 = _decodeSigs_T_23 ? 1'h0 : _decodeSigs_T_180; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_182 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_181; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_183 = _decodeSigs_T_19 ? 1'h0 : _decodeSigs_T_182; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_184 = _decodeSigs_T_17 ? 1'h0 : _decodeSigs_T_183; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_185 = _decodeSigs_T_15 ? 1'h0 : _decodeSigs_T_184; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_186 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_185; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_187 = _decodeSigs_T_11 ? 1'h0 : _decodeSigs_T_186; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_188 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_187; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_189 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_188; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_190 = _decodeSigs_T_5 ? 1'h0 : _decodeSigs_T_189; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_191 = _decodeSigs_T_3 ? 1'h0 : _decodeSigs_T_190; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_252 = _decodeSigs_T_33 ? 3'h1 : 3'h2; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_253 = _decodeSigs_T_31 ? 3'h0 : _decodeSigs_T_252; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_254 = _decodeSigs_T_29 ? 3'h2 : _decodeSigs_T_253; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_255 = _decodeSigs_T_27 ? 3'h2 : _decodeSigs_T_254; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_256 = _decodeSigs_T_25 ? 3'h2 : _decodeSigs_T_255; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_257 = _decodeSigs_T_23 ? 3'h2 : _decodeSigs_T_256; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_258 = _decodeSigs_T_21 ? 3'h2 : _decodeSigs_T_257; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_259 = _decodeSigs_T_19 ? 3'h2 : _decodeSigs_T_258; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_260 = _decodeSigs_T_17 ? 3'h2 : _decodeSigs_T_259; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_261 = _decodeSigs_T_15 ? 3'h2 : _decodeSigs_T_260; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_262 = _decodeSigs_T_13 ? 3'h2 : _decodeSigs_T_261; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_263 = _decodeSigs_T_11 ? 3'h2 : _decodeSigs_T_262; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_264 = _decodeSigs_T_9 ? 3'h1 : _decodeSigs_T_263; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_265 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_264; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_266 = _decodeSigs_T_5 ? 3'h2 : _decodeSigs_T_265; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_267 = _decodeSigs_T_3 ? 3'h1 : _decodeSigs_T_266; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_272 = _decodeSigs_T_69 ? 4'h7 : 4'h0; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_273 = _decodeSigs_T_67 ? 4'h8 : _decodeSigs_T_272; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_274 = _decodeSigs_T_65 ? 4'h7 : _decodeSigs_T_273; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_275 = _decodeSigs_T_63 ? 4'h8 : _decodeSigs_T_274; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_276 = _decodeSigs_T_61 ? 4'h6 : _decodeSigs_T_275; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_277 = _decodeSigs_T_59 ? 4'h5 : _decodeSigs_T_276; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_278 = _decodeSigs_T_57 ? 4'he : _decodeSigs_T_277; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_279 = _decodeSigs_T_55 ? 4'h2 : _decodeSigs_T_278; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_280 = _decodeSigs_T_53 ? 4'h3 : _decodeSigs_T_279; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_281 = _decodeSigs_T_51 ? 4'hc : _decodeSigs_T_280; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_282 = _decodeSigs_T_49 ? 4'hb : _decodeSigs_T_281; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_283 = _decodeSigs_T_47 ? 4'h4 : _decodeSigs_T_282; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_284 = _decodeSigs_T_45 ? 4'h9 : _decodeSigs_T_283; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_285 = _decodeSigs_T_43 ? 4'h8 : _decodeSigs_T_284; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_286 = _decodeSigs_T_41 ? 4'ha : _decodeSigs_T_285; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_287 = _decodeSigs_T_39 ? 4'h1 : _decodeSigs_T_286; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_288 = _decodeSigs_T_37 ? 4'h0 : _decodeSigs_T_287; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_289 = _decodeSigs_T_35 ? 4'h0 : _decodeSigs_T_288; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_290 = _decodeSigs_T_33 ? 4'h0 : _decodeSigs_T_289; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_291 = _decodeSigs_T_31 ? 4'h0 : _decodeSigs_T_290; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_292 = _decodeSigs_T_29 ? 4'h0 : _decodeSigs_T_291; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_293 = _decodeSigs_T_27 ? 4'h2 : _decodeSigs_T_292; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_294 = _decodeSigs_T_25 ? 4'h3 : _decodeSigs_T_293; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_295 = _decodeSigs_T_23 ? 4'hc : _decodeSigs_T_294; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_296 = _decodeSigs_T_21 ? 4'hb : _decodeSigs_T_295; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_297 = _decodeSigs_T_19 ? 4'h4 : _decodeSigs_T_296; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_298 = _decodeSigs_T_17 ? 4'h9 : _decodeSigs_T_297; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_299 = _decodeSigs_T_15 ? 4'h8 : _decodeSigs_T_298; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_300 = _decodeSigs_T_13 ? 4'ha : _decodeSigs_T_299; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_301 = _decodeSigs_T_11 ? 4'h0 : _decodeSigs_T_300; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_302 = _decodeSigs_T_9 ? 4'h0 : _decodeSigs_T_301; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_303 = _decodeSigs_T_7 ? 4'h0 : _decodeSigs_T_302; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_304 = _decodeSigs_T_5 ? 4'h0 : _decodeSigs_T_303; // @[Lookup.scala 34:39]
  wire [3:0] _decodeSigs_T_305 = _decodeSigs_T_3 ? 4'h0 : _decodeSigs_T_304; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_310 = _decodeSigs_T_69 ? 1'h0 : _decodeSigs_T_71 | _decodeSigs_T_73; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_311 = _decodeSigs_T_67 ? 1'h0 : _decodeSigs_T_310; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_312 = _decodeSigs_T_65 ? 1'h0 : _decodeSigs_T_311; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_313 = _decodeSigs_T_63 ? 1'h0 : _decodeSigs_T_312; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_314 = _decodeSigs_T_61 ? 1'h0 : _decodeSigs_T_313; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_315 = _decodeSigs_T_59 ? 1'h0 : _decodeSigs_T_314; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_317 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_57 | _decodeSigs_T_315; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_318 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_317; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_319 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_318; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_320 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_319; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_321 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_320; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_322 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_321; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_323 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_322; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_324 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_323; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_325 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_324; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_326 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_325; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_346 = _decodeSigs_T_73 ? 3'h4 : 3'h0; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_347 = _decodeSigs_T_71 ? 3'h0 : _decodeSigs_T_346; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_348 = _decodeSigs_T_69 ? 3'h2 : _decodeSigs_T_347; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_349 = _decodeSigs_T_67 ? 3'h2 : _decodeSigs_T_348; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_350 = _decodeSigs_T_65 ? 3'h2 : _decodeSigs_T_349; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_351 = _decodeSigs_T_63 ? 3'h2 : _decodeSigs_T_350; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_352 = _decodeSigs_T_61 ? 3'h2 : _decodeSigs_T_351; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_353 = _decodeSigs_T_59 ? 3'h2 : _decodeSigs_T_352; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_354 = _decodeSigs_T_57 ? 3'h3 : _decodeSigs_T_353; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_355 = _decodeSigs_T_55 ? 3'h0 : _decodeSigs_T_354; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_356 = _decodeSigs_T_53 ? 3'h0 : _decodeSigs_T_355; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_357 = _decodeSigs_T_51 ? 3'h0 : _decodeSigs_T_356; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_358 = _decodeSigs_T_49 ? 3'h0 : _decodeSigs_T_357; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_359 = _decodeSigs_T_47 ? 3'h0 : _decodeSigs_T_358; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_360 = _decodeSigs_T_45 ? 3'h0 : _decodeSigs_T_359; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_361 = _decodeSigs_T_43 ? 3'h0 : _decodeSigs_T_360; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_362 = _decodeSigs_T_41 ? 3'h0 : _decodeSigs_T_361; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_363 = _decodeSigs_T_39 ? 3'h0 : _decodeSigs_T_362; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_364 = _decodeSigs_T_37 ? 3'h0 : _decodeSigs_T_363; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_365 = _decodeSigs_T_35 ? 3'h1 : _decodeSigs_T_364; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_366 = _decodeSigs_T_33 ? 3'h1 : _decodeSigs_T_365; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_367 = _decodeSigs_T_31 ? 3'h1 : _decodeSigs_T_366; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_368 = _decodeSigs_T_29 ? 3'h3 : _decodeSigs_T_367; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_369 = _decodeSigs_T_27 ? 3'h0 : _decodeSigs_T_368; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_370 = _decodeSigs_T_25 ? 3'h0 : _decodeSigs_T_369; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_371 = _decodeSigs_T_23 ? 3'h0 : _decodeSigs_T_370; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_372 = _decodeSigs_T_21 ? 3'h0 : _decodeSigs_T_371; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_373 = _decodeSigs_T_19 ? 3'h0 : _decodeSigs_T_372; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_374 = _decodeSigs_T_17 ? 3'h0 : _decodeSigs_T_373; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_375 = _decodeSigs_T_15 ? 3'h0 : _decodeSigs_T_374; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_376 = _decodeSigs_T_13 ? 3'h0 : _decodeSigs_T_375; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_377 = _decodeSigs_T_11 ? 3'h0 : _decodeSigs_T_376; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_378 = _decodeSigs_T_9 ? 3'h0 : _decodeSigs_T_377; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_379 = _decodeSigs_T_7 ? 3'h0 : _decodeSigs_T_378; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_380 = _decodeSigs_T_5 ? 3'h0 : _decodeSigs_T_379; // @[Lookup.scala 34:39]
  wire [2:0] _decodeSigs_T_381 = _decodeSigs_T_3 ? 3'h0 : _decodeSigs_T_380; // @[Lookup.scala 34:39]
  wire [2:0] decodeSigs_7 = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_381; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_382 = _decodeSigs_T_77 ? 1'h0 : 1'h1; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_383 = _decodeSigs_T_75 ? 1'h0 : _decodeSigs_T_382; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_384 = _decodeSigs_T_73 ? 1'h0 : _decodeSigs_T_383; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_386 = _decodeSigs_T_69 ? 1'h0 : _decodeSigs_T_71 | _decodeSigs_T_384; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_387 = _decodeSigs_T_67 ? 1'h0 : _decodeSigs_T_386; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_390 = _decodeSigs_T_61 ? 1'h0 : _decodeSigs_T_63 | (_decodeSigs_T_65 | _decodeSigs_T_387); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_391 = _decodeSigs_T_59 ? 1'h0 : _decodeSigs_T_390; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_392 = _decodeSigs_T_57 ? 1'h0 : _decodeSigs_T_391; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_393 = _decodeSigs_T_55 ? 1'h0 : _decodeSigs_T_392; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_394 = _decodeSigs_T_53 ? 1'h0 : _decodeSigs_T_393; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_395 = _decodeSigs_T_51 ? 1'h0 : _decodeSigs_T_394; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_396 = _decodeSigs_T_49 ? 1'h0 : _decodeSigs_T_395; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_397 = _decodeSigs_T_47 ? 1'h0 : _decodeSigs_T_396; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_398 = _decodeSigs_T_45 ? 1'h0 : _decodeSigs_T_397; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_399 = _decodeSigs_T_43 ? 1'h0 : _decodeSigs_T_398; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_400 = _decodeSigs_T_41 ? 1'h0 : _decodeSigs_T_399; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_401 = _decodeSigs_T_39 ? 1'h0 : _decodeSigs_T_400; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_402 = _decodeSigs_T_37 ? 1'h0 : _decodeSigs_T_401; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_406 = _decodeSigs_T_29 ? 1'h0 : _decodeSigs_T_31 | (_decodeSigs_T_33 | (_decodeSigs_T_35 |
    _decodeSigs_T_402)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_410 = _decodeSigs_T_21 ? 1'h0 : _decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 |
    _decodeSigs_T_406)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_414 = _decodeSigs_T_13 ? 1'h0 : _decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 |
    _decodeSigs_T_410)); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_416 = _decodeSigs_T_9 ? 1'h0 : _decodeSigs_T_11 | _decodeSigs_T_414; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_417 = _decodeSigs_T_7 ? 1'h0 : _decodeSigs_T_416; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_418 = _decodeSigs_T_5 ? 1'h0 : _decodeSigs_T_417; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_419 = _decodeSigs_T_3 ? 1'h0 : _decodeSigs_T_418; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_441 = _decodeSigs_T_35 ? 1'h0 : _decodeSigs_T_37 | (_decodeSigs_T_39 | (_decodeSigs_T_41 | (
    _decodeSigs_T_43 | (_decodeSigs_T_45 | (_decodeSigs_T_47 | (_decodeSigs_T_49 | (_decodeSigs_T_51 | (_decodeSigs_T_53
     | (_decodeSigs_T_55 | (_decodeSigs_T_57 | _decodeSigs_T_315)))))))))); // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_442 = _decodeSigs_T_33 ? 1'h0 : _decodeSigs_T_441; // @[Lookup.scala 34:39]
  wire  _decodeSigs_T_443 = _decodeSigs_T_31 ? 1'h0 : _decodeSigs_T_442; // @[Lookup.scala 34:39]
  assign io_out_isBranch = _decodeSigs_T_1 ? 1'h0 : _decodeSigs_T_115; // @[Lookup.scala 34:39]
  assign io_out_resultSrc = _decodeSigs_T_1 ? 2'h1 : _decodeSigs_T_153; // @[Lookup.scala 34:39]
  assign io_out_memWrEn = _decodeSigs_T_1 ? 1'h0 : _decodeSigs_T_191; // @[Lookup.scala 34:39]
  assign io_out_memType = _decodeSigs_T_1 ? 3'h0 : _decodeSigs_T_267; // @[Lookup.scala 34:39]
  assign io_out_aluOpSel = _decodeSigs_T_1 ? 4'h0 : _decodeSigs_T_305; // @[Lookup.scala 34:39]
  assign io_out_aluSrc = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | (_decodeSigs_T_7 | (_decodeSigs_T_9 | (
    _decodeSigs_T_11 | (_decodeSigs_T_13 | (_decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 | (_decodeSigs_T_21
     | (_decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 | (_decodeSigs_T_29 | (_decodeSigs_T_31 | (
    _decodeSigs_T_33 | (_decodeSigs_T_35 | _decodeSigs_T_326))))))))))))))))); // @[Lookup.scala 34:39]
  assign io_out_immSrc = decodeSigs_7[1:0]; // @[Decoder.scala 131:19]
  assign io_out_immSign = _decodeSigs_T_1 ? 1'h0 : _decodeSigs_T_419; // @[Lookup.scala 34:39]
  assign io_out_regWrEn = _decodeSigs_T_1 | (_decodeSigs_T_3 | (_decodeSigs_T_5 | (_decodeSigs_T_7 | (_decodeSigs_T_9 |
    (_decodeSigs_T_11 | (_decodeSigs_T_13 | (_decodeSigs_T_15 | (_decodeSigs_T_17 | (_decodeSigs_T_19 | (
    _decodeSigs_T_21 | (_decodeSigs_T_23 | (_decodeSigs_T_25 | (_decodeSigs_T_27 | (_decodeSigs_T_29 | _decodeSigs_T_443
    )))))))))))))); // @[Lookup.scala 34:39]
endmodule
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
  wire  _T_7 = io_w_0_addr != 5'h0; // @[RegFile.scala 56:72]
  wire [31:0] _GEN_33 = 5'h1 == io_r_0_addr ? regs_1 : regs_0; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_34 = 5'h2 == io_r_0_addr ? regs_2 : _GEN_33; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_35 = 5'h3 == io_r_0_addr ? regs_3 : _GEN_34; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_36 = 5'h4 == io_r_0_addr ? regs_4 : _GEN_35; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_37 = 5'h5 == io_r_0_addr ? regs_5 : _GEN_36; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_38 = 5'h6 == io_r_0_addr ? regs_6 : _GEN_37; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_39 = 5'h7 == io_r_0_addr ? regs_7 : _GEN_38; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_40 = 5'h8 == io_r_0_addr ? regs_8 : _GEN_39; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_41 = 5'h9 == io_r_0_addr ? regs_9 : _GEN_40; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_42 = 5'ha == io_r_0_addr ? regs_10 : _GEN_41; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_43 = 5'hb == io_r_0_addr ? regs_11 : _GEN_42; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_44 = 5'hc == io_r_0_addr ? regs_12 : _GEN_43; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_45 = 5'hd == io_r_0_addr ? regs_13 : _GEN_44; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_46 = 5'he == io_r_0_addr ? regs_14 : _GEN_45; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_47 = 5'hf == io_r_0_addr ? regs_15 : _GEN_46; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_48 = 5'h10 == io_r_0_addr ? regs_16 : _GEN_47; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_49 = 5'h11 == io_r_0_addr ? regs_17 : _GEN_48; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_50 = 5'h12 == io_r_0_addr ? regs_18 : _GEN_49; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_51 = 5'h13 == io_r_0_addr ? regs_19 : _GEN_50; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_52 = 5'h14 == io_r_0_addr ? regs_20 : _GEN_51; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_53 = 5'h15 == io_r_0_addr ? regs_21 : _GEN_52; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_54 = 5'h16 == io_r_0_addr ? regs_22 : _GEN_53; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_55 = 5'h17 == io_r_0_addr ? regs_23 : _GEN_54; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_56 = 5'h18 == io_r_0_addr ? regs_24 : _GEN_55; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_57 = 5'h19 == io_r_0_addr ? regs_25 : _GEN_56; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_58 = 5'h1a == io_r_0_addr ? regs_26 : _GEN_57; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_59 = 5'h1b == io_r_0_addr ? regs_27 : _GEN_58; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_60 = 5'h1c == io_r_0_addr ? regs_28 : _GEN_59; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_61 = 5'h1d == io_r_0_addr ? regs_29 : _GEN_60; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_62 = 5'h1e == io_r_0_addr ? regs_30 : _GEN_61; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_63 = 5'h1f == io_r_0_addr ? regs_31 : _GEN_62; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_67 = 5'h1 == io_r_1_addr ? regs_1 : regs_0; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_68 = 5'h2 == io_r_1_addr ? regs_2 : _GEN_67; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_69 = 5'h3 == io_r_1_addr ? regs_3 : _GEN_68; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_70 = 5'h4 == io_r_1_addr ? regs_4 : _GEN_69; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_71 = 5'h5 == io_r_1_addr ? regs_5 : _GEN_70; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_72 = 5'h6 == io_r_1_addr ? regs_6 : _GEN_71; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_73 = 5'h7 == io_r_1_addr ? regs_7 : _GEN_72; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_74 = 5'h8 == io_r_1_addr ? regs_8 : _GEN_73; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_75 = 5'h9 == io_r_1_addr ? regs_9 : _GEN_74; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_76 = 5'ha == io_r_1_addr ? regs_10 : _GEN_75; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_77 = 5'hb == io_r_1_addr ? regs_11 : _GEN_76; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_78 = 5'hc == io_r_1_addr ? regs_12 : _GEN_77; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_79 = 5'hd == io_r_1_addr ? regs_13 : _GEN_78; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_80 = 5'he == io_r_1_addr ? regs_14 : _GEN_79; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_81 = 5'hf == io_r_1_addr ? regs_15 : _GEN_80; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_82 = 5'h10 == io_r_1_addr ? regs_16 : _GEN_81; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_83 = 5'h11 == io_r_1_addr ? regs_17 : _GEN_82; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_84 = 5'h12 == io_r_1_addr ? regs_18 : _GEN_83; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_85 = 5'h13 == io_r_1_addr ? regs_19 : _GEN_84; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_86 = 5'h14 == io_r_1_addr ? regs_20 : _GEN_85; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_87 = 5'h15 == io_r_1_addr ? regs_21 : _GEN_86; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_88 = 5'h16 == io_r_1_addr ? regs_22 : _GEN_87; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_89 = 5'h17 == io_r_1_addr ? regs_23 : _GEN_88; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_90 = 5'h18 == io_r_1_addr ? regs_24 : _GEN_89; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_91 = 5'h19 == io_r_1_addr ? regs_25 : _GEN_90; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_92 = 5'h1a == io_r_1_addr ? regs_26 : _GEN_91; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_93 = 5'h1b == io_r_1_addr ? regs_27 : _GEN_92; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_94 = 5'h1c == io_r_1_addr ? regs_28 : _GEN_93; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_95 = 5'h1d == io_r_1_addr ? regs_29 : _GEN_94; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_96 = 5'h1e == io_r_1_addr ? regs_30 : _GEN_95; // @[RegFile.scala 59:{22,22}]
  wire [31:0] _GEN_97 = 5'h1f == io_r_1_addr ? regs_31 : _GEN_96; // @[RegFile.scala 59:{22,22}]
  assign io_r_0_data = io_w_0_en & io_r_0_addr == io_w_0_addr & io_w_0_addr != 5'h0 ? io_w_0_data : _GEN_63; // @[RegFile.scala 56:81 57:22 59:22]
  assign io_r_1_data = io_w_0_en & io_r_1_addr == io_w_0_addr & io_w_0_addr != 5'h0 ? io_w_0_data : _GEN_97; // @[RegFile.scala 56:81 57:22 59:22]
  assign io_state_regState_0 = regs_0; // @[RegFile.scala 78:61]
  assign io_state_regState_1 = regs_1; // @[RegFile.scala 78:61]
  assign io_state_regState_2 = regs_2; // @[RegFile.scala 78:61]
  assign io_state_regState_3 = regs_3; // @[RegFile.scala 78:61]
  assign io_state_regState_4 = regs_4; // @[RegFile.scala 78:61]
  assign io_state_regState_5 = regs_5; // @[RegFile.scala 78:61]
  assign io_state_regState_6 = regs_6; // @[RegFile.scala 78:61]
  assign io_state_regState_7 = regs_7; // @[RegFile.scala 78:61]
  assign io_state_regState_8 = regs_8; // @[RegFile.scala 78:61]
  assign io_state_regState_9 = regs_9; // @[RegFile.scala 78:61]
  assign io_state_regState_10 = regs_10; // @[RegFile.scala 78:61]
  assign io_state_regState_11 = regs_11; // @[RegFile.scala 78:61]
  assign io_state_regState_12 = regs_12; // @[RegFile.scala 78:61]
  assign io_state_regState_13 = regs_13; // @[RegFile.scala 78:61]
  assign io_state_regState_14 = regs_14; // @[RegFile.scala 78:61]
  assign io_state_regState_15 = regs_15; // @[RegFile.scala 78:61]
  assign io_state_regState_16 = regs_16; // @[RegFile.scala 78:61]
  assign io_state_regState_17 = regs_17; // @[RegFile.scala 78:61]
  assign io_state_regState_18 = regs_18; // @[RegFile.scala 78:61]
  assign io_state_regState_19 = regs_19; // @[RegFile.scala 78:61]
  assign io_state_regState_20 = regs_20; // @[RegFile.scala 78:61]
  assign io_state_regState_21 = regs_21; // @[RegFile.scala 78:61]
  assign io_state_regState_22 = regs_22; // @[RegFile.scala 78:61]
  assign io_state_regState_23 = regs_23; // @[RegFile.scala 78:61]
  assign io_state_regState_24 = regs_24; // @[RegFile.scala 78:61]
  assign io_state_regState_25 = regs_25; // @[RegFile.scala 78:61]
  assign io_state_regState_26 = regs_26; // @[RegFile.scala 78:61]
  assign io_state_regState_27 = regs_27; // @[RegFile.scala 78:61]
  assign io_state_regState_28 = regs_28; // @[RegFile.scala 78:61]
  assign io_state_regState_29 = regs_29; // @[RegFile.scala 78:61]
  assign io_state_regState_30 = regs_30; // @[RegFile.scala 78:61]
  assign io_state_regState_31 = regs_31; // @[RegFile.scala 78:61]
  always @(posedge clock) begin
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h0 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_0 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_0 <= 32'h0; // @[RegFile.scala 49:11]
      end
    end else begin
      regs_0 <= 32'h0; // @[RegFile.scala 49:11]
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_1 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_1 <= _GEN_1;
      end
    end else begin
      regs_1 <= _GEN_1;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h2 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_2 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_2 <= _GEN_2;
      end
    end else begin
      regs_2 <= _GEN_2;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h3 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_3 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_3 <= _GEN_3;
      end
    end else begin
      regs_3 <= _GEN_3;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h4 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_4 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_4 <= _GEN_4;
      end
    end else begin
      regs_4 <= _GEN_4;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h5 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_5 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_5 <= _GEN_5;
      end
    end else begin
      regs_5 <= _GEN_5;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h6 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_6 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_6 <= _GEN_6;
      end
    end else begin
      regs_6 <= _GEN_6;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h7 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_7 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_7 <= _GEN_7;
      end
    end else begin
      regs_7 <= _GEN_7;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h8 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_8 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_8 <= _GEN_8;
      end
    end else begin
      regs_8 <= _GEN_8;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h9 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_9 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_9 <= _GEN_9;
      end
    end else begin
      regs_9 <= _GEN_9;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'ha == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_10 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_10 <= _GEN_10;
      end
    end else begin
      regs_10 <= _GEN_10;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hb == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_11 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_11 <= _GEN_11;
      end
    end else begin
      regs_11 <= _GEN_11;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hc == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_12 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_12 <= _GEN_12;
      end
    end else begin
      regs_12 <= _GEN_12;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hd == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_13 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_13 <= _GEN_13;
      end
    end else begin
      regs_13 <= _GEN_13;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'he == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_14 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_14 <= _GEN_14;
      end
    end else begin
      regs_14 <= _GEN_14;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'hf == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_15 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_15 <= _GEN_15;
      end
    end else begin
      regs_15 <= _GEN_15;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h10 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_16 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_16 <= _GEN_16;
      end
    end else begin
      regs_16 <= _GEN_16;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h11 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_17 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_17 <= _GEN_17;
      end
    end else begin
      regs_17 <= _GEN_17;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h12 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_18 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_18 <= _GEN_18;
      end
    end else begin
      regs_18 <= _GEN_18;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h13 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_19 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_19 <= _GEN_19;
      end
    end else begin
      regs_19 <= _GEN_19;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h14 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_20 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_20 <= _GEN_20;
      end
    end else begin
      regs_20 <= _GEN_20;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h15 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_21 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_21 <= _GEN_21;
      end
    end else begin
      regs_21 <= _GEN_21;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h16 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_22 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_22 <= _GEN_22;
      end
    end else begin
      regs_22 <= _GEN_22;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h17 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_23 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_23 <= _GEN_23;
      end
    end else begin
      regs_23 <= _GEN_23;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h18 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_24 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_24 <= _GEN_24;
      end
    end else begin
      regs_24 <= _GEN_24;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h19 == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_25 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_25 <= _GEN_25;
      end
    end else begin
      regs_25 <= _GEN_25;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1a == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_26 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_26 <= _GEN_26;
      end
    end else begin
      regs_26 <= _GEN_26;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1b == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_27 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_27 <= _GEN_27;
      end
    end else begin
      regs_27 <= _GEN_27;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1c == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_28 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_28 <= _GEN_28;
      end
    end else begin
      regs_28 <= _GEN_28;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1d == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_29 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_29 <= _GEN_29;
      end
    end else begin
      regs_29 <= _GEN_29;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1e == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_30 <= io_w_0_data; // @[RegFile.scala 67:24]
      end else begin
        regs_30 <= _GEN_30;
      end
    end else begin
      regs_30 <= _GEN_30;
    end
    if (io_w_0_en & _T_7) begin // @[RegFile.scala 66:44]
      if (5'h1f == io_w_0_addr) begin // @[RegFile.scala 67:24]
        regs_31 <= io_w_0_data; // @[RegFile.scala 67:24]
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
  wire [31:0] immU = {io_inst[31:12], 12'h0}; // @[ImmGen.scala 25:36]
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
  assign io_imm = io_immSign ? _out_T_9 : _out_T_19; // @[ImmGen.scala 36:19 37:13 45:13]
endmodule
module Decode(
  input         clock,
  input         reset,
  output        io_in_fetch_ready,
  input         io_in_fetch_valid,
  input  [31:0] io_in_fetch_bits_pcNext4,
  input         io_in_fetch_bits_instState_commit,
  input  [31:0] io_in_fetch_bits_instState_pc,
  input  [31:0] io_in_fetch_bits_instState_inst,
  input  [4:0]  io_in_writeback_bits_rd,
  input         io_in_writeback_bits_regWrEn,
  input  [31:0] io_in_writeback_bits_regWrData,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_isBranch,
  output        io_out_bits_isJump,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_memWrEn,
  output [2:0]  io_out_bits_memType,
  output        io_out_bits_memSign,
  output [3:0]  io_out_bits_aluOpSel,
  output        io_out_bits_immSign,
  output        io_out_bits_regWrEn,
  output        io_out_bits_pcAddReg,
  output        io_out_bits_aluSrc,
  output [31:0] io_out_bits_pcNext4,
  output [31:0] io_out_bits_data1,
  output [31:0] io_out_bits_data2,
  output [31:0] io_out_bits_imm,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [31:0] io_regState_regState_0,
  output [31:0] io_regState_regState_1,
  output [31:0] io_regState_regState_2,
  output [31:0] io_regState_regState_3,
  output [31:0] io_regState_regState_4,
  output [31:0] io_regState_regState_5,
  output [31:0] io_regState_regState_6,
  output [31:0] io_regState_regState_7,
  output [31:0] io_regState_regState_8,
  output [31:0] io_regState_regState_9,
  output [31:0] io_regState_regState_10,
  output [31:0] io_regState_regState_11,
  output [31:0] io_regState_regState_12,
  output [31:0] io_regState_regState_13,
  output [31:0] io_regState_regState_14,
  output [31:0] io_regState_regState_15,
  output [31:0] io_regState_regState_16,
  output [31:0] io_regState_regState_17,
  output [31:0] io_regState_regState_18,
  output [31:0] io_regState_regState_19,
  output [31:0] io_regState_regState_20,
  output [31:0] io_regState_regState_21,
  output [31:0] io_regState_regState_22,
  output [31:0] io_regState_regState_23,
  output [31:0] io_regState_regState_24,
  output [31:0] io_regState_regState_25,
  output [31:0] io_regState_regState_26,
  output [31:0] io_regState_regState_27,
  output [31:0] io_regState_regState_28,
  output [31:0] io_regState_regState_29,
  output [31:0] io_regState_regState_30,
  output [31:0] io_regState_regState_31,
  input         io_ctrl_flush
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlUnit_io_out_isBranch; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_isJump; // @[2_Decode.scala 74:26]
  wire [1:0] ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_memWrEn; // @[2_Decode.scala 74:26]
  wire [2:0] ctrlUnit_io_out_memType; // @[2_Decode.scala 74:26]
  wire [3:0] ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_aluSrc; // @[2_Decode.scala 74:26]
  wire [1:0] ctrlUnit_io_out_immSrc; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_immSign; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_memSign; // @[2_Decode.scala 74:26]
  wire  ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 74:26]
  wire [31:0] ctrlUnit_io_in_inst; // @[2_Decode.scala 74:26]
  wire  regFile_clock; // @[2_Decode.scala 95:25]
  wire  regFile_reset; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_r_0_addr; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_r_0_data; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_r_1_addr; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_r_1_data; // @[2_Decode.scala 95:25]
  wire [4:0] regFile_io_w_0_addr; // @[2_Decode.scala 95:25]
  wire  regFile_io_w_0_en; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_w_0_data; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_0; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_1; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_2; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_3; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_4; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_5; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_6; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_7; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_8; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_9; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_10; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_11; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_12; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_13; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_14; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_15; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_16; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_17; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_18; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_19; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_20; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_21; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_22; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_23; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_24; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_25; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_26; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_27; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_28; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_29; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_30; // @[2_Decode.scala 95:25]
  wire [31:0] regFile_io_state_regState_31; // @[2_Decode.scala 95:25]
  wire [31:0] immGen_io_inst; // @[2_Decode.scala 106:24]
  wire [2:0] immGen_io_immSrc; // @[2_Decode.scala 106:24]
  wire  immGen_io_immSign; // @[2_Decode.scala 106:24]
  wire [31:0] immGen_io_imm; // @[2_Decode.scala 106:24]
  wire  decodeLatch = io_out_ready & io_in_fetch_valid; // @[2_Decode.scala 59:36]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  CtrlUnit ctrlUnit ( // @[2_Decode.scala 74:26]
    .io_out_isBranch(ctrlUnit_io_out_isBranch),
    .io_out_isJump(ctrlUnit_io_out_isJump),
    .io_out_resultSrc(ctrlUnit_io_out_resultSrc),
    .io_out_memWrEn(ctrlUnit_io_out_memWrEn),
    .io_out_memType(ctrlUnit_io_out_memType),
    .io_out_aluOpSel(ctrlUnit_io_out_aluOpSel),
    .io_out_aluSrc(ctrlUnit_io_out_aluSrc),
    .io_out_immSrc(ctrlUnit_io_out_immSrc),
    .io_out_immSign(ctrlUnit_io_out_immSign),
    .io_out_regWrEn(ctrlUnit_io_out_regWrEn),
    .io_out_memSign(ctrlUnit_io_out_memSign),
    .io_out_pcAddReg(ctrlUnit_io_out_pcAddReg),
    .io_in_inst(ctrlUnit_io_in_inst)
  );
  RegFile regFile ( // @[2_Decode.scala 95:25]
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
  ImmGen immGen ( // @[2_Decode.scala 106:24]
    .io_inst(immGen_io_inst),
    .io_immSrc(immGen_io_immSrc),
    .io_immSign(immGen_io_immSign),
    .io_imm(immGen_io_imm)
  );
  assign io_in_fetch_ready = io_out_ready; // @[2_Decode.scala 56:39]
  assign io_out_valid = io_out_ready; // @[2_Decode.scala 139:34]
  assign io_out_bits_isBranch = ctrlUnit_io_out_isBranch; // @[2_Decode.scala 114:26]
  assign io_out_bits_isJump = ctrlUnit_io_out_isJump; // @[2_Decode.scala 115:24]
  assign io_out_bits_resultSrc = ctrlUnit_io_out_resultSrc; // @[2_Decode.scala 116:27]
  assign io_out_bits_memWrEn = ctrlUnit_io_out_memWrEn; // @[2_Decode.scala 117:25]
  assign io_out_bits_memType = ctrlUnit_io_out_memType; // @[2_Decode.scala 119:25]
  assign io_out_bits_memSign = ctrlUnit_io_out_memSign; // @[2_Decode.scala 120:25]
  assign io_out_bits_aluOpSel = ctrlUnit_io_out_aluOpSel; // @[2_Decode.scala 121:26]
  assign io_out_bits_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 124:25]
  assign io_out_bits_regWrEn = ctrlUnit_io_out_regWrEn; // @[2_Decode.scala 123:25]
  assign io_out_bits_pcAddReg = ctrlUnit_io_out_pcAddReg; // @[2_Decode.scala 122:26]
  assign io_out_bits_aluSrc = ctrlUnit_io_out_aluSrc; // @[2_Decode.scala 125:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[2_Decode.scala 130:25]
  assign io_out_bits_data1 = regFile_io_r_0_data; // @[2_Decode.scala 127:23]
  assign io_out_bits_data2 = regFile_io_r_1_data; // @[2_Decode.scala 128:23]
  assign io_out_bits_imm = immGen_io_imm; // @[2_Decode.scala 71:19 110:9]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[2_Decode.scala 132:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[2_Decode.scala 132:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[2_Decode.scala 132:27]
  assign io_regState_regState_0 = regFile_io_state_regState_0; // @[2_Decode.scala 133:17]
  assign io_regState_regState_1 = regFile_io_state_regState_1; // @[2_Decode.scala 133:17]
  assign io_regState_regState_2 = regFile_io_state_regState_2; // @[2_Decode.scala 133:17]
  assign io_regState_regState_3 = regFile_io_state_regState_3; // @[2_Decode.scala 133:17]
  assign io_regState_regState_4 = regFile_io_state_regState_4; // @[2_Decode.scala 133:17]
  assign io_regState_regState_5 = regFile_io_state_regState_5; // @[2_Decode.scala 133:17]
  assign io_regState_regState_6 = regFile_io_state_regState_6; // @[2_Decode.scala 133:17]
  assign io_regState_regState_7 = regFile_io_state_regState_7; // @[2_Decode.scala 133:17]
  assign io_regState_regState_8 = regFile_io_state_regState_8; // @[2_Decode.scala 133:17]
  assign io_regState_regState_9 = regFile_io_state_regState_9; // @[2_Decode.scala 133:17]
  assign io_regState_regState_10 = regFile_io_state_regState_10; // @[2_Decode.scala 133:17]
  assign io_regState_regState_11 = regFile_io_state_regState_11; // @[2_Decode.scala 133:17]
  assign io_regState_regState_12 = regFile_io_state_regState_12; // @[2_Decode.scala 133:17]
  assign io_regState_regState_13 = regFile_io_state_regState_13; // @[2_Decode.scala 133:17]
  assign io_regState_regState_14 = regFile_io_state_regState_14; // @[2_Decode.scala 133:17]
  assign io_regState_regState_15 = regFile_io_state_regState_15; // @[2_Decode.scala 133:17]
  assign io_regState_regState_16 = regFile_io_state_regState_16; // @[2_Decode.scala 133:17]
  assign io_regState_regState_17 = regFile_io_state_regState_17; // @[2_Decode.scala 133:17]
  assign io_regState_regState_18 = regFile_io_state_regState_18; // @[2_Decode.scala 133:17]
  assign io_regState_regState_19 = regFile_io_state_regState_19; // @[2_Decode.scala 133:17]
  assign io_regState_regState_20 = regFile_io_state_regState_20; // @[2_Decode.scala 133:17]
  assign io_regState_regState_21 = regFile_io_state_regState_21; // @[2_Decode.scala 133:17]
  assign io_regState_regState_22 = regFile_io_state_regState_22; // @[2_Decode.scala 133:17]
  assign io_regState_regState_23 = regFile_io_state_regState_23; // @[2_Decode.scala 133:17]
  assign io_regState_regState_24 = regFile_io_state_regState_24; // @[2_Decode.scala 133:17]
  assign io_regState_regState_25 = regFile_io_state_regState_25; // @[2_Decode.scala 133:17]
  assign io_regState_regState_26 = regFile_io_state_regState_26; // @[2_Decode.scala 133:17]
  assign io_regState_regState_27 = regFile_io_state_regState_27; // @[2_Decode.scala 133:17]
  assign io_regState_regState_28 = regFile_io_state_regState_28; // @[2_Decode.scala 133:17]
  assign io_regState_regState_29 = regFile_io_state_regState_29; // @[2_Decode.scala 133:17]
  assign io_regState_regState_30 = regFile_io_state_regState_30; // @[2_Decode.scala 133:17]
  assign io_regState_regState_31 = regFile_io_state_regState_31; // @[2_Decode.scala 133:17]
  assign ctrlUnit_io_in_inst = stageReg_instState_inst; // @[2_Decode.scala 92:25]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_r_0_addr = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign regFile_io_r_1_addr = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign regFile_io_w_0_addr = io_in_writeback_bits_rd; // @[2_Decode.scala 103:26]
  assign regFile_io_w_0_en = io_in_writeback_bits_regWrEn; // @[2_Decode.scala 102:56]
  assign regFile_io_w_0_data = io_in_writeback_bits_regWrData; // @[2_Decode.scala 104:26]
  assign immGen_io_inst = stageReg_instState_inst; // @[2_Decode.scala 107:20]
  assign immGen_io_immSrc = {{1'd0}, ctrlUnit_io_out_immSrc}; // @[2_Decode.scala 108:22]
  assign immGen_io_immSign = ctrlUnit_io_out_immSign; // @[2_Decode.scala 109:23]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_pcNext4 <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcNext4 <= io_in_fetch_bits_pcNext4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_commit <= 1'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_commit <= io_in_fetch_bits_instState_commit; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_pc <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_pc <= io_in_fetch_bits_instState_pc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[2_Decode.scala 62:17]
      stageReg_instState_inst <= 32'h0; // @[2_Decode.scala 63:18]
    end else if (decodeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_inst <= io_in_fetch_bits_instState_inst; // @[Reg.scala 36:22]
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
module Alu(
  input  [31:0] io_in1,
  input  [31:0] io_in2,
  input  [3:0]  io_opSel,
  output [31:0] io_out,
  output        io_zero
);
  wire [31:0] _sum_T_2 = 32'h0 - io_in2; // @[Alu.scala 28:41]
  wire [31:0] _sum_T_3 = io_opSel[0] ? _sum_T_2 : io_in2; // @[Alu.scala 28:27]
  wire [31:0] sum = io_in1 + _sum_T_3; // @[Alu.scala 28:22]
  wire [4:0] shamt = io_in2[4:0]; // @[Alu.scala 31:23]
  wire [31:0] _shiftr_T_1 = io_in1 >> shamt; // @[Alu.scala 33:32]
  wire [31:0] _shiftr_T_4 = $signed(io_in1) >>> shamt; // @[Alu.scala 34:49]
  wire [31:0] shiftr = io_opSel[1] ? _shiftr_T_1 : _shiftr_T_4; // @[Alu.scala 32:21]
  wire [62:0] _GEN_5 = {{31'd0}, io_in1}; // @[Alu.scala 36:25]
  wire [62:0] shiftl = _GEN_5 << shamt; // @[Alu.scala 36:25]
  wire [31:0] _shout_T_3 = io_opSel == 4'hb | io_opSel == 4'hc ? shiftr : 32'h0; // @[Alu.scala 37:20]
  wire [62:0] _shout_T_5 = io_opSel == 4'ha ? shiftl : 63'h0; // @[Alu.scala 38:20]
  wire [62:0] _GEN_2 = {{31'd0}, _shout_T_3}; // @[Alu.scala 37:72]
  wire [62:0] shout = _GEN_2 | _shout_T_5; // @[Alu.scala 37:72]
  wire [31:0] _logic_T = io_in1 & io_in2; // @[Alu.scala 43:36]
  wire [31:0] _logic_T_1 = io_in1 | io_in2; // @[Alu.scala 44:36]
  wire [31:0] _logic_T_2 = io_in1 ^ io_in2; // @[Alu.scala 45:36]
  wire [31:0] _logic_T_4 = 4'h2 == io_opSel ? _logic_T : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _logic_T_6 = 4'h3 == io_opSel ? _logic_T_1 : _logic_T_4; // @[Mux.scala 81:58]
  wire [31:0] logic_ = 4'h4 == io_opSel ? _logic_T_2 : _logic_T_6; // @[Mux.scala 81:58]
  wire  _cmp_T_2 = $signed(io_in1) < $signed(io_in2); // @[Alu.scala 51:44]
  wire  _cmp_T_3 = io_in1 < io_in2; // @[Alu.scala 52:37]
  wire  _cmp_T_4 = io_in1 == io_in2; // @[Alu.scala 53:37]
  wire  _cmp_T_5 = io_in1 != io_in2; // @[Alu.scala 54:37]
  wire  _cmp_T_6 = io_in1 >= io_in2; // @[Alu.scala 55:37]
  wire  _cmp_T_10 = 4'h9 == io_opSel ? _cmp_T_3 : 4'h8 == io_opSel & _cmp_T_2; // @[Mux.scala 81:58]
  wire  _cmp_T_12 = 4'h5 == io_opSel ? _cmp_T_4 : _cmp_T_10; // @[Mux.scala 81:58]
  wire  _cmp_T_14 = 4'h6 == io_opSel ? _cmp_T_5 : _cmp_T_12; // @[Mux.scala 81:58]
  wire  cmp = 4'h7 == io_opSel ? _cmp_T_6 : _cmp_T_14; // @[Mux.scala 81:58]
  wire [31:0] _GEN_3 = {{31'd0}, cmp}; // @[Alu.scala 67:58]
  wire [31:0] _io_out_T_3 = _GEN_3 | logic_; // @[Alu.scala 67:58]
  wire [62:0] _GEN_4 = {{31'd0}, _io_out_T_3}; // @[Alu.scala 67:66]
  wire [62:0] _io_out_T_4 = _GEN_4 | shout; // @[Alu.scala 67:66]
  wire [62:0] _io_out_T_5 = io_opSel == 4'h0 | io_opSel == 4'h1 ? {{31'd0}, sum} : _io_out_T_4; // @[Alu.scala 67:22]
  wire [62:0] _GEN_0 = io_opSel == 4'he ? {{31'd0}, io_in2} : _io_out_T_5; // @[Alu.scala 64:29 65:16 67:16]
  wire [62:0] _GEN_1 = io_opSel == 4'hd ? {{31'd0}, io_in1} : _GEN_0; // @[Alu.scala 62:23 63:16]
  assign io_out = _GEN_1[31:0];
  assign io_zero = 4'h7 == io_opSel ? _cmp_T_6 : _cmp_T_14; // @[Mux.scala 81:58]
endmodule
module Execute(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input         io_in_bits_isBranch,
  input         io_in_bits_isJump,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_memWrEn,
  input  [2:0]  io_in_bits_memType,
  input         io_in_bits_memSign,
  input  [3:0]  io_in_bits_aluOpSel,
  input         io_in_bits_immSign,
  input         io_in_bits_regWrEn,
  input         io_in_bits_pcAddReg,
  input         io_in_bits_aluSrc,
  input  [31:0] io_in_bits_pcNext4,
  input  [31:0] io_in_bits_data1,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_imm,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_memory_bits_resultSrc,
  output        io_out_memory_bits_memWrEn,
  output [2:0]  io_out_memory_bits_memType,
  output        io_out_memory_bits_memSign,
  output        io_out_memory_bits_regWrEn,
  output [31:0] io_out_memory_bits_aluOut,
  output [31:0] io_out_memory_bits_data2,
  output [31:0] io_out_memory_bits_pcNext4,
  output        io_out_memory_bits_instState_commit,
  output [31:0] io_out_memory_bits_instState_pc,
  output [31:0] io_out_memory_bits_instState_inst,
  input         io_out_fetch_ready,
  output        io_out_fetch_bits_brTaken,
  output [31:0] io_out_fetch_bits_targetAddr,
  output [4:0]  io_hazard_out_rs1,
  output [4:0]  io_hazard_out_rs2,
  input  [1:0]  io_hazard_in_aluSrc1,
  input  [1:0]  io_hazard_in_aluSrc2,
  input  [31:0] io_hazard_in_rdValM,
  input  [31:0] io_hazard_in_rdValW,
  input         io_ctrl_flush
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] alu_io_in1; // @[3_Execute.scala 81:21]
  wire [31:0] alu_io_in2; // @[3_Execute.scala 81:21]
  wire [3:0] alu_io_opSel; // @[3_Execute.scala 81:21]
  wire [31:0] alu_io_out; // @[3_Execute.scala 81:21]
  wire  alu_io_zero; // @[3_Execute.scala 81:21]
  wire  executeLatch = io_in_valid & io_out_fetch_ready; // @[3_Execute.scala 71:59]
  reg  stageReg_isBranch; // @[Reg.scala 35:20]
  reg  stageReg_isJump; // @[Reg.scala 35:20]
  reg [1:0] stageReg_resultSrc; // @[Reg.scala 35:20]
  reg  stageReg_memWrEn; // @[Reg.scala 35:20]
  reg [2:0] stageReg_memType; // @[Reg.scala 35:20]
  reg  stageReg_memSign; // @[Reg.scala 35:20]
  reg [3:0] stageReg_aluOpSel; // @[Reg.scala 35:20]
  reg  stageReg_immSign; // @[Reg.scala 35:20]
  reg  stageReg_regWrEn; // @[Reg.scala 35:20]
  reg  stageReg_pcAddReg; // @[Reg.scala 35:20]
  reg  stageReg_aluSrc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data1; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data2; // @[Reg.scala 35:20]
  reg [31:0] stageReg_imm; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  wire [31:0] _alu_io_in1_T_3 = 2'h1 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValM : stageReg_data1; // @[Mux.scala 81:58]
  wire [31:0] _data2_T_3 = 2'h1 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValM : stageReg_data2; // @[Mux.scala 81:58]
  wire [31:0] data2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _data2_T_3; // @[Mux.scala 81:58]
  wire  aluZero = alu_io_zero; // @[3_Execute.scala 78:23 99:13]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_5 = $signed(stageReg_imm) + $signed(stageReg_instState_pc); // @[3_Execute.scala 106:98]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_7 = stageReg_imm + stageReg_instState_pc; // @[3_Execute.scala 107:58]
  wire [31:0] _io_out_fetch_bits_targetAddr_T_8 = stageReg_immSign ? _io_out_fetch_bits_targetAddr_T_5 :
    _io_out_fetch_bits_targetAddr_T_7; // @[3_Execute.scala 105:44]
  Alu alu ( // @[3_Execute.scala 81:21]
    .io_in1(alu_io_in1),
    .io_in2(alu_io_in2),
    .io_opSel(alu_io_opSel),
    .io_out(alu_io_out),
    .io_zero(alu_io_zero)
  );
  assign io_in_ready = io_out_fetch_ready; // @[3_Execute.scala 70:40]
  assign io_out_memory_bits_resultSrc = stageReg_resultSrc; // @[3_Execute.scala 122:16 113:34]
  assign io_out_memory_bits_memWrEn = stageReg_memWrEn; // @[3_Execute.scala 122:16 114:32]
  assign io_out_memory_bits_memType = stageReg_memType; // @[3_Execute.scala 122:16 117:32]
  assign io_out_memory_bits_memSign = stageReg_memSign; // @[3_Execute.scala 122:16 116:32]
  assign io_out_memory_bits_regWrEn = stageReg_regWrEn; // @[3_Execute.scala 122:16 118:32]
  assign io_out_memory_bits_aluOut = alu_io_out; // @[3_Execute.scala 122:16 112:31]
  assign io_out_memory_bits_data2 = 2'h2 == io_hazard_in_aluSrc2 ? io_hazard_in_rdValW : _data2_T_3; // @[Mux.scala 81:58]
  assign io_out_memory_bits_pcNext4 = stageReg_pcNext4; // @[3_Execute.scala 122:16 120:32]
  assign io_out_memory_bits_instState_commit = stageReg_instState_commit; // @[3_Execute.scala 137:34]
  assign io_out_memory_bits_instState_pc = stageReg_instState_pc; // @[3_Execute.scala 137:34]
  assign io_out_memory_bits_instState_inst = stageReg_instState_inst; // @[3_Execute.scala 137:34]
  assign io_out_fetch_bits_brTaken = stageReg_isBranch & aluZero | stageReg_isJump; // @[3_Execute.scala 102:65]
  assign io_out_fetch_bits_targetAddr = stageReg_pcAddReg ? alu_io_out : _io_out_fetch_bits_targetAddr_T_8; // @[3_Execute.scala 103:40]
  assign io_hazard_out_rs1 = stageReg_instState_inst[19:15]; // @[util.scala 41:31]
  assign io_hazard_out_rs2 = stageReg_instState_inst[24:20]; // @[util.scala 42:31]
  assign alu_io_in1 = 2'h2 == io_hazard_in_aluSrc1 ? io_hazard_in_rdValW : _alu_io_in1_T_3; // @[Mux.scala 81:58]
  assign alu_io_in2 = stageReg_aluSrc ? stageReg_imm : data2; // @[3_Execute.scala 96:22]
  assign alu_io_opSel = stageReg_aluOpSel; // @[3_Execute.scala 98:18]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_isBranch <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_isBranch <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_isBranch <= io_in_bits_isBranch; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_isJump <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_isJump <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_isJump <= io_in_bits_isJump; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_resultSrc <= 2'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_resultSrc <= 2'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_resultSrc <= io_in_bits_resultSrc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memWrEn <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memWrEn <= io_in_bits_memWrEn; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memType <= 3'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memType <= 3'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memType <= io_in_bits_memType; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memSign <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_memSign <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_memSign <= io_in_bits_memSign; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluOpSel <= 4'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_aluOpSel <= 4'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_aluOpSel <= io_in_bits_aluOpSel; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_immSign <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_immSign <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_immSign <= io_in_bits_immSign; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_regWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_regWrEn <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_regWrEn <= io_in_bits_regWrEn; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcAddReg <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_pcAddReg <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcAddReg <= io_in_bits_pcAddReg; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluSrc <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_aluSrc <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_aluSrc <= io_in_bits_aluSrc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_pcNext4 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_pcNext4 <= io_in_bits_pcNext4; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data1 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_data1 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_data1 <= io_in_bits_data1; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data2 <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_data2 <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_data2 <= io_in_bits_data2; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_imm <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_imm <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_imm <= io_in_bits_imm; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_commit <= 1'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_commit <= io_in_bits_instState_commit; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_pc <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_pc <= io_in_bits_instState_pc; // @[Reg.scala 36:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else if (io_ctrl_flush) begin // @[3_Execute.scala 74:17]
      stageReg_instState_inst <= 32'h0; // @[3_Execute.scala 75:18]
    end else if (executeLatch) begin // @[Reg.scala 36:18]
      stageReg_instState_inst <= io_in_bits_instState_inst; // @[Reg.scala 36:22]
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
  stageReg_memWrEn = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_memType = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_memSign = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_aluOpSel = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_immSign = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stageReg_pcAddReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  stageReg_aluSrc = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  stageReg_data1 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  stageReg_data2 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  stageReg_imm = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_17[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RAM(
  input         clock,
  input         reset,
  input         io_wen,
  input  [31:0] io_waddr,
  input  [31:0] io_wdata,
  input  [31:0] io_raddr,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[ROM.scala 26:26]
  wire  mem_io_rdata_MPORT_en; // @[ROM.scala 26:26]
  wire [9:0] mem_io_rdata_MPORT_addr; // @[ROM.scala 26:26]
  wire [31:0] mem_io_rdata_MPORT_data; // @[ROM.scala 26:26]
  wire [31:0] mem_MPORT_data; // @[ROM.scala 26:26]
  wire [9:0] mem_MPORT_addr; // @[ROM.scala 26:26]
  wire  mem_MPORT_mask; // @[ROM.scala 26:26]
  wire  mem_MPORT_en; // @[ROM.scala 26:26]
  reg  mem_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_io_rdata_MPORT_addr_pipe_0;
  wire  _T_2 = io_wen & io_waddr == io_raddr; // @[ROM.scala 30:28]
  assign mem_io_rdata_MPORT_en = mem_io_rdata_MPORT_en_pipe_0;
  assign mem_io_rdata_MPORT_addr = mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_data = mem[mem_io_rdata_MPORT_addr]; // @[ROM.scala 26:26]
  assign mem_MPORT_data = io_wdata;
  assign mem_MPORT_addr = io_waddr[11:2];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wen;
  assign io_rdata = io_wen & io_waddr == io_raddr ? io_wdata : mem_io_rdata_MPORT_data; // @[ROM.scala 30:54 31:18 33:18]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[ROM.scala 26:26]
    end
    if (_T_2) begin
      mem_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      mem_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (_T_2 ? 1'h0 : 1'h1) begin
      mem_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_wen & ~reset) begin
          $fwrite(32'h80000002,"RAM [write] addr: %d data: %d\n",io_waddr,io_wdata); // @[RAM.scala 12:15]
        end
    `ifdef PRINTF_COND
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Memory(
  input         clock,
  input         reset,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_memWrEn,
  input  [2:0]  io_in_bits_memType,
  input         io_in_bits_memSign,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_data2,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [1:0]  io_out_bits_resultSrc,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_rdData,
  output [31:0] io_out_bits_aluOut,
  output [31:0] io_out_bits_pcNext4,
  output        io_out_bits_instState_commit,
  output [31:0] io_out_bits_instState_pc,
  output [31:0] io_out_bits_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn
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
  wire  dataMem_clock; // @[4_Memory.scala 58:25]
  wire  dataMem_reset; // @[4_Memory.scala 58:25]
  wire  dataMem_io_wen; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_waddr; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_wdata; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_raddr; // @[4_Memory.scala 58:25]
  wire [31:0] dataMem_io_rdata; // @[4_Memory.scala 58:25]
  reg [1:0] stageReg_resultSrc; // @[Reg.scala 35:20]
  reg  stageReg_memWrEn; // @[Reg.scala 35:20]
  reg [2:0] stageReg_memType; // @[Reg.scala 35:20]
  reg  stageReg_memSign; // @[Reg.scala 35:20]
  reg  stageReg_regWrEn; // @[Reg.scala 35:20]
  reg [31:0] stageReg_aluOut; // @[Reg.scala 35:20]
  reg [31:0] stageReg_data2; // @[Reg.scala 35:20]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  wire  _dataMemRdData_T = 3'h0 == stageReg_memType; // @[util.scala 61:21]
  wire  _dataMemRdData_out_T_1 = dataMem_io_rdata[7] & stageReg_memSign; // @[util.scala 63:60]
  wire [23:0] _dataMemRdData_out_T_3 = _dataMemRdData_out_T_1 ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _dataMemRdData_out_T_5 = {_dataMemRdData_out_T_3,dataMem_io_rdata[7:0]}; // @[Cat.scala 33:92]
  wire  _dataMemRdData_T_1 = 3'h1 == stageReg_memType; // @[util.scala 61:21]
  wire  _dataMemRdData_out_T_7 = dataMem_io_rdata[15] & stageReg_memSign; // @[util.scala 65:63]
  wire [15:0] _dataMemRdData_out_T_9 = _dataMemRdData_out_T_7 ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _dataMemRdData_out_T_11 = {_dataMemRdData_out_T_9,dataMem_io_rdata[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_24 = dataMem_io_rdata; // @[util.scala 60:13 61:21 69:25]
  wire [31:0] _GEN_25 = 3'h1 == stageReg_memType ? _dataMemRdData_out_T_11 : _GEN_24; // @[util.scala 61:21 65:32]
  wire [31:0] _dataMem_io_wdata_out_T_2 = {24'h0,stageReg_data2[7:0]}; // @[Cat.scala 33:92]
  wire [31:0] _dataMem_io_wdata_out_T_5 = {16'hffff,stageReg_data2[15:0]}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_28 = _dataMemRdData_T_1 ? _dataMem_io_wdata_out_T_5 : stageReg_data2; // @[util.scala 92:21 96:32]
  wire [31:0] dataMemRdData = 3'h0 == stageReg_memType ? _dataMemRdData_out_T_5 : _GEN_25; // @[util.scala 61:21 63:32]
  RAM dataMem ( // @[4_Memory.scala 58:25]
    .clock(dataMem_clock),
    .reset(dataMem_reset),
    .io_wen(dataMem_io_wen),
    .io_waddr(dataMem_io_waddr),
    .io_wdata(dataMem_io_wdata),
    .io_raddr(dataMem_io_raddr),
    .io_rdata(dataMem_io_rdata)
  );
  assign io_out_bits_resultSrc = stageReg_resultSrc; // @[4_Memory.scala 66:27]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[4_Memory.scala 67:25]
  assign io_out_bits_rdData = dataMemRdData; // @[4_Memory.scala 69:24]
  assign io_out_bits_aluOut = stageReg_aluOut; // @[4_Memory.scala 70:24]
  assign io_out_bits_pcNext4 = stageReg_pcNext4; // @[4_Memory.scala 71:25]
  assign io_out_bits_instState_commit = stageReg_instState_commit; // @[4_Memory.scala 73:27]
  assign io_out_bits_instState_pc = stageReg_instState_pc; // @[4_Memory.scala 73:27]
  assign io_out_bits_instState_inst = stageReg_instState_inst; // @[4_Memory.scala 73:27]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[4_Memory.scala 79:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[4_Memory.scala 78:23]
  assign dataMem_clock = clock;
  assign dataMem_reset = reset;
  assign dataMem_io_wen = stageReg_memWrEn; // @[4_Memory.scala 62:20]
  assign dataMem_io_waddr = stageReg_aluOut; // @[4_Memory.scala 61:22]
  assign dataMem_io_wdata = _dataMemRdData_T ? _dataMem_io_wdata_out_T_2 : _GEN_28; // @[util.scala 92:21 94:32]
  assign dataMem_io_raddr = stageReg_aluOut; // @[4_Memory.scala 60:22]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_resultSrc <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_resultSrc <= io_in_bits_resultSrc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memWrEn <= io_in_bits_memWrEn;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memType <= 3'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memType <= io_in_bits_memType;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_memSign <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_memSign <= io_in_bits_memSign;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_regWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_regWrEn <= io_in_bits_regWrEn;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluOut <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_aluOut <= io_in_bits_aluOut;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_data2 <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_data2 <= io_in_bits_data2;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_pcNext4 <= io_in_bits_pcNext4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_commit <= io_in_bits_instState_commit;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_pc <= io_in_bits_instState_pc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_inst <= io_in_bits_instState_inst;
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
  stageReg_memWrEn = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stageReg_memType = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_memSign = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_regWrEn = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_data2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_7[31:0];
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
module Writeback(
  input         clock,
  input         reset,
  input  [1:0]  io_in_bits_resultSrc,
  input         io_in_bits_regWrEn,
  input  [31:0] io_in_bits_rdData,
  input  [31:0] io_in_bits_aluOut,
  input  [31:0] io_in_bits_pcNext4,
  input         io_in_bits_instState_commit,
  input  [31:0] io_in_bits_instState_pc,
  input  [31:0] io_in_bits_instState_inst,
  output [4:0]  io_out_bits_rd,
  output        io_out_bits_regWrEn,
  output [31:0] io_out_bits_regWrData,
  output        io_instState_commit,
  output [31:0] io_instState_pc,
  output [31:0] io_instState_inst,
  output [4:0]  io_hazard_rd,
  output [31:0] io_hazard_rdVal,
  output        io_hazard_regWrEn
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stageReg_resultSrc; // @[Reg.scala 35:20]
  reg  stageReg_regWrEn; // @[Reg.scala 35:20]
  reg [31:0] stageReg_rdData; // @[Reg.scala 35:20]
  reg [31:0] stageReg_aluOut; // @[Reg.scala 35:20]
  reg [31:0] stageReg_pcNext4; // @[Reg.scala 35:20]
  reg  stageReg_instState_commit; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_pc; // @[Reg.scala 35:20]
  reg [31:0] stageReg_instState_inst; // @[Reg.scala 35:20]
  wire [31:0] _io_out_bits_regWrData_T_3 = 2'h1 == stageReg_resultSrc ? stageReg_rdData : stageReg_aluOut; // @[Mux.scala 81:58]
  assign io_out_bits_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_out_bits_regWrEn = stageReg_regWrEn; // @[5_Writeback.scala 54:25]
  assign io_out_bits_regWrData = 2'h2 == stageReg_resultSrc ? stageReg_pcNext4 : _io_out_bits_regWrData_T_3; // @[Mux.scala 81:58]
  assign io_instState_commit = stageReg_instState_commit; // @[5_Writeback.scala 56:18]
  assign io_instState_pc = stageReg_instState_pc; // @[5_Writeback.scala 56:18]
  assign io_instState_inst = stageReg_instState_inst; // @[5_Writeback.scala 56:18]
  assign io_hazard_rd = stageReg_instState_inst[11:7]; // @[util.scala 40:31]
  assign io_hazard_rdVal = stageReg_aluOut; // @[5_Writeback.scala 60:21]
  assign io_hazard_regWrEn = stageReg_regWrEn; // @[5_Writeback.scala 61:23]
  always @(posedge clock) begin
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_resultSrc <= 2'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_resultSrc <= io_in_bits_resultSrc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_regWrEn <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_regWrEn <= io_in_bits_regWrEn;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_rdData <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_rdData <= io_in_bits_rdData;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_aluOut <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_aluOut <= io_in_bits_aluOut;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_pcNext4 <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_pcNext4 <= io_in_bits_pcNext4;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_commit <= 1'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_commit <= io_in_bits_instState_commit;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_pc <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_pc <= io_in_bits_instState_pc;
    end
    if (reset) begin // @[Reg.scala 35:20]
      stageReg_instState_inst <= 32'h0; // @[Reg.scala 35:20]
    end else begin
      stageReg_instState_inst <= io_in_bits_instState_inst;
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
  stageReg_rdData = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  stageReg_aluOut = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  stageReg_pcNext4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  stageReg_instState_commit = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  stageReg_instState_pc = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  stageReg_instState_inst = _RAND_7[31:0];
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
  output  io_out_decode_flush,
  output  io_out_execute_flush
);
  assign io_out_decode_flush = io_in_brTaken; // @[PipelineCtrl.scala 30:35]
  assign io_out_execute_flush = io_in_brTaken; // @[PipelineCtrl.scala 30:35]
endmodule
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
