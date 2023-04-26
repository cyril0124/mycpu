module LSUQueue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_decInfo_en,
  input         io_enq_bits_decInfo_wen,
  input         io_enq_bits_decInfo_load,
  input  [1:0]  io_enq_bits_decInfo_wd,
  input         io_enq_bits_decInfo_signed,
  input  [31:0] io_enq_bits_addr,
  input  [31:0] io_enq_bits_rs2Val,
  input  [7:0]  io_enq_bits_id,
  input  [4:0]  io_enq_bits_rd,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_decInfo_en,
  output        io_deq_bits_decInfo_wen,
  output        io_deq_bits_decInfo_load,
  output [1:0]  io_deq_bits_decInfo_wd,
  output        io_deq_bits_decInfo_signed,
  output [31:0] io_deq_bits_addr,
  output [31:0] io_deq_bits_rs2Val,
  output [7:0]  io_deq_bits_id,
  output [4:0]  io_deq_bits_rd,
  input  [7:0]  io_rob_bits_id,
  input         io_flush
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
`endif // RANDOMIZE_REG_INIT
  reg  entries_0_busy; // @[LSUQueue.scala 43:22]
  reg  entries_0_ready; // @[LSUQueue.scala 43:22]
  reg  entries_0_decInfo_en; // @[LSUQueue.scala 43:22]
  reg  entries_0_decInfo_wen; // @[LSUQueue.scala 43:22]
  reg  entries_0_decInfo_load; // @[LSUQueue.scala 43:22]
  reg [1:0] entries_0_decInfo_wd; // @[LSUQueue.scala 43:22]
  reg  entries_0_decInfo_signed; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_0_addr; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_0_rs2Val; // @[LSUQueue.scala 43:22]
  reg [7:0] entries_0_id; // @[LSUQueue.scala 43:22]
  reg [4:0] entries_0_rd; // @[LSUQueue.scala 43:22]
  reg  entries_1_busy; // @[LSUQueue.scala 43:22]
  reg  entries_1_ready; // @[LSUQueue.scala 43:22]
  reg  entries_1_decInfo_en; // @[LSUQueue.scala 43:22]
  reg  entries_1_decInfo_wen; // @[LSUQueue.scala 43:22]
  reg  entries_1_decInfo_load; // @[LSUQueue.scala 43:22]
  reg [1:0] entries_1_decInfo_wd; // @[LSUQueue.scala 43:22]
  reg  entries_1_decInfo_signed; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_1_addr; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_1_rs2Val; // @[LSUQueue.scala 43:22]
  reg [7:0] entries_1_id; // @[LSUQueue.scala 43:22]
  reg [4:0] entries_1_rd; // @[LSUQueue.scala 43:22]
  reg  entries_2_busy; // @[LSUQueue.scala 43:22]
  reg  entries_2_ready; // @[LSUQueue.scala 43:22]
  reg  entries_2_decInfo_en; // @[LSUQueue.scala 43:22]
  reg  entries_2_decInfo_wen; // @[LSUQueue.scala 43:22]
  reg  entries_2_decInfo_load; // @[LSUQueue.scala 43:22]
  reg [1:0] entries_2_decInfo_wd; // @[LSUQueue.scala 43:22]
  reg  entries_2_decInfo_signed; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_2_addr; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_2_rs2Val; // @[LSUQueue.scala 43:22]
  reg [7:0] entries_2_id; // @[LSUQueue.scala 43:22]
  reg [4:0] entries_2_rd; // @[LSUQueue.scala 43:22]
  reg  entries_3_busy; // @[LSUQueue.scala 43:22]
  reg  entries_3_ready; // @[LSUQueue.scala 43:22]
  reg  entries_3_decInfo_en; // @[LSUQueue.scala 43:22]
  reg  entries_3_decInfo_wen; // @[LSUQueue.scala 43:22]
  reg  entries_3_decInfo_load; // @[LSUQueue.scala 43:22]
  reg [1:0] entries_3_decInfo_wd; // @[LSUQueue.scala 43:22]
  reg  entries_3_decInfo_signed; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_3_addr; // @[LSUQueue.scala 43:22]
  reg [31:0] entries_3_rs2Val; // @[LSUQueue.scala 43:22]
  reg [7:0] entries_3_id; // @[LSUQueue.scala 43:22]
  reg [4:0] entries_3_rd; // @[LSUQueue.scala 43:22]
  reg [1:0] head; // @[LSUQueue.scala 44:23]
  reg [1:0] tail; // @[LSUQueue.scala 45:23]
  reg [2:0] count; // @[LSUQueue.scala 47:24]
  wire  full = count == 3'h4; // @[LSUQueue.scala 48:22]
  wire  _GEN_1 = 2'h1 == tail ? entries_1_busy : entries_0_busy; // @[LSUQueue.scala 51:{30,30}]
  wire  _GEN_2 = 2'h2 == tail ? entries_2_busy : _GEN_1; // @[LSUQueue.scala 51:{30,30}]
  wire  _GEN_3 = 2'h3 == tail ? entries_3_busy : _GEN_2; // @[LSUQueue.scala 51:{30,30}]
  wire  _GEN_5 = 2'h1 == head ? entries_1_busy : entries_0_busy; // @[LSUQueue.scala 52:{40,40}]
  wire  _GEN_6 = 2'h2 == head ? entries_2_busy : _GEN_5; // @[LSUQueue.scala 52:{40,40}]
  wire  _GEN_7 = 2'h3 == head ? entries_3_busy : _GEN_6; // @[LSUQueue.scala 52:{40,40}]
  wire  _GEN_9 = 2'h1 == head ? entries_1_ready : entries_0_ready; // @[LSUQueue.scala 52:{40,40}]
  wire  _GEN_10 = 2'h2 == head ? entries_2_ready : _GEN_9; // @[LSUQueue.scala 52:{40,40}]
  wire  _GEN_11 = 2'h3 == head ? entries_3_ready : _GEN_10; // @[LSUQueue.scala 52:{40,40}]
  wire [31:0] _GEN_13 = 2'h1 == head ? entries_1_addr : entries_0_addr; // @[LSUQueue.scala 53:{22,22}]
  wire [31:0] _GEN_14 = 2'h2 == head ? entries_2_addr : _GEN_13; // @[LSUQueue.scala 53:{22,22}]
  wire  _GEN_17 = 2'h1 == head ? entries_1_decInfo_en : entries_0_decInfo_en; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_18 = 2'h2 == head ? entries_2_decInfo_en : _GEN_17; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_21 = 2'h1 == head ? entries_1_decInfo_wen : entries_0_decInfo_wen; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_22 = 2'h2 == head ? entries_2_decInfo_wen : _GEN_21; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_25 = 2'h1 == head ? entries_1_decInfo_load : entries_0_decInfo_load; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_26 = 2'h2 == head ? entries_2_decInfo_load : _GEN_25; // @[LSUQueue.scala 54:{25,25}]
  wire [1:0] _GEN_29 = 2'h1 == head ? entries_1_decInfo_wd : entries_0_decInfo_wd; // @[LSUQueue.scala 54:{25,25}]
  wire [1:0] _GEN_30 = 2'h2 == head ? entries_2_decInfo_wd : _GEN_29; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_33 = 2'h1 == head ? entries_1_decInfo_signed : entries_0_decInfo_signed; // @[LSUQueue.scala 54:{25,25}]
  wire  _GEN_34 = 2'h2 == head ? entries_2_decInfo_signed : _GEN_33; // @[LSUQueue.scala 54:{25,25}]
  wire [7:0] _GEN_37 = 2'h1 == head ? entries_1_id : entries_0_id; // @[LSUQueue.scala 55:{20,20}]
  wire [7:0] _GEN_38 = 2'h2 == head ? entries_2_id : _GEN_37; // @[LSUQueue.scala 55:{20,20}]
  wire [4:0] _GEN_41 = 2'h1 == head ? entries_1_rd : entries_0_rd; // @[LSUQueue.scala 56:{20,20}]
  wire [4:0] _GEN_42 = 2'h2 == head ? entries_2_rd : _GEN_41; // @[LSUQueue.scala 56:{20,20}]
  wire [31:0] _GEN_45 = 2'h1 == head ? entries_1_rs2Val : entries_0_rs2Val; // @[LSUQueue.scala 57:{24,24}]
  wire [31:0] _GEN_46 = 2'h2 == head ? entries_2_rs2Val : _GEN_45; // @[LSUQueue.scala 57:{24,24}]
  wire  _T = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_48 = 2'h0 == tail | entries_0_busy; // @[LSUQueue.scala 43:22 61:{28,28}]
  wire  _GEN_49 = 2'h1 == tail | entries_1_busy; // @[LSUQueue.scala 43:22 61:{28,28}]
  wire  _GEN_50 = 2'h2 == tail | entries_2_busy; // @[LSUQueue.scala 43:22 61:{28,28}]
  wire  _GEN_51 = 2'h3 == tail | entries_3_busy; // @[LSUQueue.scala 43:22 61:{28,28}]
  wire  _entries_ready_T = io_enq_bits_decInfo_wen ? 1'h0 : 1'h1; // @[LSUQueue.scala 67:35]
  wire  _GEN_88 = 2'h0 == tail ? _entries_ready_T : entries_0_ready; // @[LSUQueue.scala 43:22 67:{29,29}]
  wire  _GEN_89 = 2'h1 == tail ? _entries_ready_T : entries_1_ready; // @[LSUQueue.scala 43:22 67:{29,29}]
  wire  _GEN_90 = 2'h2 == tail ? _entries_ready_T : entries_2_ready; // @[LSUQueue.scala 43:22 67:{29,29}]
  wire  _GEN_91 = 2'h3 == tail ? _entries_ready_T : entries_3_ready; // @[LSUQueue.scala 43:22 67:{29,29}]
  wire [1:0] _tail_T_2 = tail + 2'h1; // @[LSUQueue.scala 69:60]
  wire  _GEN_92 = _T ? _GEN_48 : entries_0_busy; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_93 = _T ? _GEN_49 : entries_1_busy; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_94 = _T ? _GEN_50 : entries_2_busy; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_95 = _T ? _GEN_51 : entries_3_busy; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_132 = _T ? _GEN_88 : entries_0_ready; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_133 = _T ? _GEN_89 : entries_1_ready; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_134 = _T ? _GEN_90 : entries_2_ready; // @[LSUQueue.scala 43:22 59:24]
  wire  _GEN_135 = _T ? _GEN_91 : entries_3_ready; // @[LSUQueue.scala 43:22 59:24]
  wire  _T_1 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  _GEN_141 = 2'h0 == head ? 1'h0 : _GEN_132; // @[LSUQueue.scala 74:{29,29}]
  wire  _GEN_142 = 2'h1 == head ? 1'h0 : _GEN_133; // @[LSUQueue.scala 74:{29,29}]
  wire  _GEN_143 = 2'h2 == head ? 1'h0 : _GEN_134; // @[LSUQueue.scala 74:{29,29}]
  wire  _GEN_144 = 2'h3 == head ? 1'h0 : _GEN_135; // @[LSUQueue.scala 74:{29,29}]
  wire [1:0] _head_T_2 = head + 2'h1; // @[LSUQueue.scala 76:60]
  wire  _GEN_149 = _T_1 ? _GEN_141 : _GEN_132; // @[LSUQueue.scala 72:24]
  wire  _GEN_150 = _T_1 ? _GEN_142 : _GEN_133; // @[LSUQueue.scala 72:24]
  wire  _GEN_151 = _T_1 ? _GEN_143 : _GEN_134; // @[LSUQueue.scala 72:24]
  wire  _GEN_152 = _T_1 ? _GEN_144 : _GEN_135; // @[LSUQueue.scala 72:24]
  wire [2:0] _count_T_1 = count + 3'h1; // @[LSUQueue.scala 81:28]
  wire [2:0] _GEN_154 = _T ? _count_T_1 : count; // @[LSUQueue.scala 80:27 81:19 47:24]
  wire [2:0] _count_T_3 = count - 3'h1; // @[LSUQueue.scala 84:28]
  wire  _GEN_157 = io_rob_bits_id == entries_0_id | _GEN_149; // @[LSUQueue.scala 92:62 93:29]
  wire  _GEN_160 = io_rob_bits_id == entries_1_id | _GEN_150; // @[LSUQueue.scala 92:62 93:29]
  wire  _GEN_163 = io_rob_bits_id == entries_2_id | _GEN_151; // @[LSUQueue.scala 92:62 93:29]
  wire  _GEN_166 = io_rob_bits_id == entries_3_id | _GEN_152; // @[LSUQueue.scala 92:62 93:29]
  assign io_enq_ready = ~full & ~_GEN_3; // @[LSUQueue.scala 51:27]
  assign io_deq_valid = _GEN_7 & _GEN_11; // @[LSUQueue.scala 52:40]
  assign io_deq_bits_decInfo_en = 2'h3 == head ? entries_3_decInfo_en : _GEN_18; // @[LSUQueue.scala 54:{25,25}]
  assign io_deq_bits_decInfo_wen = 2'h3 == head ? entries_3_decInfo_wen : _GEN_22; // @[LSUQueue.scala 54:{25,25}]
  assign io_deq_bits_decInfo_load = 2'h3 == head ? entries_3_decInfo_load : _GEN_26; // @[LSUQueue.scala 54:{25,25}]
  assign io_deq_bits_decInfo_wd = 2'h3 == head ? entries_3_decInfo_wd : _GEN_30; // @[LSUQueue.scala 54:{25,25}]
  assign io_deq_bits_decInfo_signed = 2'h3 == head ? entries_3_decInfo_signed : _GEN_34; // @[LSUQueue.scala 54:{25,25}]
  assign io_deq_bits_addr = 2'h3 == head ? entries_3_addr : _GEN_14; // @[LSUQueue.scala 53:{22,22}]
  assign io_deq_bits_rs2Val = 2'h3 == head ? entries_3_rs2Val : _GEN_46; // @[LSUQueue.scala 57:{24,24}]
  assign io_deq_bits_id = 2'h3 == head ? entries_3_id : _GEN_38; // @[LSUQueue.scala 55:{20,20}]
  assign io_deq_bits_rd = 2'h3 == head ? entries_3_rd : _GEN_42; // @[LSUQueue.scala 56:{20,20}]
  always @(posedge clock) begin
    if (io_flush) begin // @[LSUQueue.scala 99:21]
      entries_0_busy <= 1'h0; // @[LSUQueue.scala 100:37]
    end else if (_T_1) begin // @[LSUQueue.scala 72:24]
      if (2'h0 == head) begin // @[LSUQueue.scala 73:28]
        entries_0_busy <= 1'h0; // @[LSUQueue.scala 73:28]
      end else begin
        entries_0_busy <= _GEN_92;
      end
    end else begin
      entries_0_busy <= _GEN_92;
    end
    if (entries_0_busy) begin // @[LSUQueue.scala 89:22]
      if (~entries_0_ready) begin // @[LSUQueue.scala 90:28]
        entries_0_ready <= _GEN_157;
      end else begin
        entries_0_ready <= _GEN_149;
      end
    end else begin
      entries_0_ready <= _GEN_149;
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 63:31]
        entries_0_decInfo_en <= io_enq_bits_decInfo_en; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 63:31]
        entries_0_decInfo_wen <= io_enq_bits_decInfo_wen; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 63:31]
        entries_0_decInfo_load <= io_enq_bits_decInfo_load; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 63:31]
        entries_0_decInfo_wd <= io_enq_bits_decInfo_wd; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 63:31]
        entries_0_decInfo_signed <= io_enq_bits_decInfo_signed; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 62:28]
        entries_0_addr <= io_enq_bits_addr; // @[LSUQueue.scala 62:28]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 66:30]
        entries_0_rs2Val <= io_enq_bits_rs2Val; // @[LSUQueue.scala 66:30]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 64:26]
        entries_0_id <= io_enq_bits_id; // @[LSUQueue.scala 64:26]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h0 == tail) begin // @[LSUQueue.scala 65:26]
        entries_0_rd <= io_enq_bits_rd; // @[LSUQueue.scala 65:26]
      end
    end
    if (io_flush) begin // @[LSUQueue.scala 99:21]
      entries_1_busy <= 1'h0; // @[LSUQueue.scala 100:37]
    end else if (_T_1) begin // @[LSUQueue.scala 72:24]
      if (2'h1 == head) begin // @[LSUQueue.scala 73:28]
        entries_1_busy <= 1'h0; // @[LSUQueue.scala 73:28]
      end else begin
        entries_1_busy <= _GEN_93;
      end
    end else begin
      entries_1_busy <= _GEN_93;
    end
    if (entries_1_busy) begin // @[LSUQueue.scala 89:22]
      if (~entries_1_ready) begin // @[LSUQueue.scala 90:28]
        entries_1_ready <= _GEN_160;
      end else begin
        entries_1_ready <= _GEN_150;
      end
    end else begin
      entries_1_ready <= _GEN_150;
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 63:31]
        entries_1_decInfo_en <= io_enq_bits_decInfo_en; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 63:31]
        entries_1_decInfo_wen <= io_enq_bits_decInfo_wen; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 63:31]
        entries_1_decInfo_load <= io_enq_bits_decInfo_load; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 63:31]
        entries_1_decInfo_wd <= io_enq_bits_decInfo_wd; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 63:31]
        entries_1_decInfo_signed <= io_enq_bits_decInfo_signed; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 62:28]
        entries_1_addr <= io_enq_bits_addr; // @[LSUQueue.scala 62:28]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 66:30]
        entries_1_rs2Val <= io_enq_bits_rs2Val; // @[LSUQueue.scala 66:30]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 64:26]
        entries_1_id <= io_enq_bits_id; // @[LSUQueue.scala 64:26]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h1 == tail) begin // @[LSUQueue.scala 65:26]
        entries_1_rd <= io_enq_bits_rd; // @[LSUQueue.scala 65:26]
      end
    end
    if (io_flush) begin // @[LSUQueue.scala 99:21]
      entries_2_busy <= 1'h0; // @[LSUQueue.scala 100:37]
    end else if (_T_1) begin // @[LSUQueue.scala 72:24]
      if (2'h2 == head) begin // @[LSUQueue.scala 73:28]
        entries_2_busy <= 1'h0; // @[LSUQueue.scala 73:28]
      end else begin
        entries_2_busy <= _GEN_94;
      end
    end else begin
      entries_2_busy <= _GEN_94;
    end
    if (entries_2_busy) begin // @[LSUQueue.scala 89:22]
      if (~entries_2_ready) begin // @[LSUQueue.scala 90:28]
        entries_2_ready <= _GEN_163;
      end else begin
        entries_2_ready <= _GEN_151;
      end
    end else begin
      entries_2_ready <= _GEN_151;
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 63:31]
        entries_2_decInfo_en <= io_enq_bits_decInfo_en; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 63:31]
        entries_2_decInfo_wen <= io_enq_bits_decInfo_wen; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 63:31]
        entries_2_decInfo_load <= io_enq_bits_decInfo_load; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 63:31]
        entries_2_decInfo_wd <= io_enq_bits_decInfo_wd; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 63:31]
        entries_2_decInfo_signed <= io_enq_bits_decInfo_signed; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 62:28]
        entries_2_addr <= io_enq_bits_addr; // @[LSUQueue.scala 62:28]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 66:30]
        entries_2_rs2Val <= io_enq_bits_rs2Val; // @[LSUQueue.scala 66:30]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 64:26]
        entries_2_id <= io_enq_bits_id; // @[LSUQueue.scala 64:26]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h2 == tail) begin // @[LSUQueue.scala 65:26]
        entries_2_rd <= io_enq_bits_rd; // @[LSUQueue.scala 65:26]
      end
    end
    if (io_flush) begin // @[LSUQueue.scala 99:21]
      entries_3_busy <= 1'h0; // @[LSUQueue.scala 100:37]
    end else if (_T_1) begin // @[LSUQueue.scala 72:24]
      if (2'h3 == head) begin // @[LSUQueue.scala 73:28]
        entries_3_busy <= 1'h0; // @[LSUQueue.scala 73:28]
      end else begin
        entries_3_busy <= _GEN_95;
      end
    end else begin
      entries_3_busy <= _GEN_95;
    end
    if (entries_3_busy) begin // @[LSUQueue.scala 89:22]
      if (~entries_3_ready) begin // @[LSUQueue.scala 90:28]
        entries_3_ready <= _GEN_166;
      end else begin
        entries_3_ready <= _GEN_152;
      end
    end else begin
      entries_3_ready <= _GEN_152;
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 63:31]
        entries_3_decInfo_en <= io_enq_bits_decInfo_en; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 63:31]
        entries_3_decInfo_wen <= io_enq_bits_decInfo_wen; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 63:31]
        entries_3_decInfo_load <= io_enq_bits_decInfo_load; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 63:31]
        entries_3_decInfo_wd <= io_enq_bits_decInfo_wd; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 63:31]
        entries_3_decInfo_signed <= io_enq_bits_decInfo_signed; // @[LSUQueue.scala 63:31]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 62:28]
        entries_3_addr <= io_enq_bits_addr; // @[LSUQueue.scala 62:28]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 66:30]
        entries_3_rs2Val <= io_enq_bits_rs2Val; // @[LSUQueue.scala 66:30]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 64:26]
        entries_3_id <= io_enq_bits_id; // @[LSUQueue.scala 64:26]
      end
    end
    if (_T) begin // @[LSUQueue.scala 59:24]
      if (2'h3 == tail) begin // @[LSUQueue.scala 65:26]
        entries_3_rd <= io_enq_bits_rd; // @[LSUQueue.scala 65:26]
      end
    end
    if (reset) begin // @[LSUQueue.scala 44:23]
      head <= 2'h0; // @[LSUQueue.scala 44:23]
    end else if (io_flush) begin // @[LSUQueue.scala 99:21]
      head <= 2'h0; // @[LSUQueue.scala 101:14]
    end else if (_T_1) begin // @[LSUQueue.scala 72:24]
      if (head == 2'h3) begin // @[LSUQueue.scala 76:20]
        head <= 2'h0;
      end else begin
        head <= _head_T_2;
      end
    end
    if (reset) begin // @[LSUQueue.scala 45:23]
      tail <= 2'h0; // @[LSUQueue.scala 45:23]
    end else if (io_flush) begin // @[LSUQueue.scala 99:21]
      tail <= 2'h0; // @[LSUQueue.scala 102:14]
    end else if (_T) begin // @[LSUQueue.scala 59:24]
      if (tail == 2'h3) begin // @[LSUQueue.scala 69:20]
        tail <= 2'h0;
      end else begin
        tail <= _tail_T_2;
      end
    end
    if (reset) begin // @[LSUQueue.scala 47:24]
      count <= 3'h0; // @[LSUQueue.scala 47:24]
    end else if (io_flush) begin // @[LSUQueue.scala 99:21]
      count <= 3'h0; // @[LSUQueue.scala 103:15]
    end else if (~(_T_1 & _T)) begin // @[LSUQueue.scala 79:43]
      if (_T_1) begin // @[LSUQueue.scala 83:27]
        count <= _count_T_3; // @[LSUQueue.scala 84:19]
      end else begin
        count <= _GEN_154;
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
  entries_0_busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  entries_0_ready = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  entries_0_decInfo_en = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  entries_0_decInfo_wen = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entries_0_decInfo_load = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entries_0_decInfo_wd = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  entries_0_decInfo_signed = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entries_0_addr = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  entries_0_rs2Val = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  entries_0_id = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  entries_0_rd = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  entries_1_busy = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  entries_1_ready = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  entries_1_decInfo_en = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  entries_1_decInfo_wen = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  entries_1_decInfo_load = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  entries_1_decInfo_wd = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  entries_1_decInfo_signed = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  entries_1_addr = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  entries_1_rs2Val = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  entries_1_id = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  entries_1_rd = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  entries_2_busy = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  entries_2_ready = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  entries_2_decInfo_en = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  entries_2_decInfo_wen = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  entries_2_decInfo_load = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  entries_2_decInfo_wd = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  entries_2_decInfo_signed = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  entries_2_addr = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  entries_2_rs2Val = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  entries_2_id = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  entries_2_rd = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  entries_3_busy = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  entries_3_ready = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  entries_3_decInfo_en = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  entries_3_decInfo_wen = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  entries_3_decInfo_load = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  entries_3_decInfo_wd = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  entries_3_decInfo_signed = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  entries_3_addr = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  entries_3_rs2Val = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  entries_3_id = _RAND_42[7:0];
  _RAND_43 = {1{`RANDOM}};
  entries_3_rd = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  head = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  tail = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  count = _RAND_46[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
