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
