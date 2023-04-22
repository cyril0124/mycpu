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
  output [31:0] io_mepc,
  output [31:0] io_trapVec,
  output [31:0] csrState_0_mcycle,
  output [31:0] csrState_0_mcycleh
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
  reg [63:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  reg  mcause_int; // @[CsrFile.scala 69:28]
  reg [30:0] mcause_code; // @[CsrFile.scala 69:28]
  reg  mstatus_sum; // @[CsrFile.scala 70:28]
  reg [1:0] mstatus_mpp; // @[CsrFile.scala 70:28]
  reg  mstatus_spp; // @[CsrFile.scala 70:28]
  reg  mstatus_mpie; // @[CsrFile.scala 70:28]
  reg  mstatus_spie; // @[CsrFile.scala 70:28]
  reg  mstatus_mie; // @[CsrFile.scala 70:28]
  reg  mstatus_sie; // @[CsrFile.scala 70:28]
  reg [29:0] mtvec_base; // @[CsrFile.scala 71:28]
  reg [1:0] mtvec_mode; // @[CsrFile.scala 71:28]
  reg [31:0] medeleg_data; // @[CsrFile.scala 72:28]
  reg [31:0] mideleg_data; // @[CsrFile.scala 73:28]
  reg [31:0] mepc_data; // @[CsrFile.scala 74:28]
  reg  satp_mode; // @[CsrFile.scala 75:28]
  reg [21:0] satp_ppn; // @[CsrFile.scala 75:28]
  reg [63:0] mcycle_data; // @[CsrFile.scala 77:28]
  wire [31:0] _T = {mcause_int,mcause_code}; // @[CsrFile.scala 88:49]
  wire [10:0] lo = {2'h0,mstatus_spp,mstatus_mpie,1'h0,mstatus_spie,1'h0,mstatus_mie,1'h0,mstatus_sie,1'h0}; // @[CsrFile.scala 89:50]
  wire [31:0] _T_1 = {13'h0,mstatus_sum,1'h0,2'h0,2'h0,mstatus_mpp,lo}; // @[CsrFile.scala 89:50]
  wire [31:0] _T_2 = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 90:48]
  wire [31:0] _T_3 = {satp_mode,9'h0,satp_ppn}; // @[CsrFile.scala 94:47]
  wire  _T_7 = 12'hf14 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_9 = 12'h342 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_13 = 12'h305 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_15 = 12'h302 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_17 = 12'h303 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_19 = 12'h341 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_21 = 12'h180 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_23 = 12'h343 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_25 = 12'hb00 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_27 = 12'hb80 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_29 = 12'h3a0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_31 = 12'h3a1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_33 = 12'h3a2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_35 = 12'h3a3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_37 = 12'h3b0 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_39 = 12'h3b1 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_41 = 12'h3b2 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_43 = 12'h3b3 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_45 = 12'h3b4 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_47 = 12'h3b5 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_49 = 12'h3b6 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_51 = 12'h3b7 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_53 = 12'h3b8 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_55 = 12'h3b9 == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_57 = 12'h3ba == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_59 = 12'h3bb == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_61 = 12'h3bc == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_63 = 12'h3bd == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_65 = 12'h3be == io_read_addr; // @[Lookup.scala 31:38]
  wire  _T_67 = 12'h3bf == io_read_addr; // @[Lookup.scala 31:38]
  wire [31:0] _T_88 = _T_27 ? mcycle_data[63:32] : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _T_89 = _T_25 ? mcycle_data[31:0] : _T_88; // @[Lookup.scala 34:39]
  wire [31:0] _T_90 = _T_23 ? 32'h0 : _T_89; // @[Lookup.scala 34:39]
  wire [31:0] _T_91 = _T_21 ? _T_3 : _T_90; // @[Lookup.scala 34:39]
  wire [31:0] _T_92 = _T_19 ? mepc_data : _T_91; // @[Lookup.scala 34:39]
  wire [31:0] _T_93 = _T_17 ? mideleg_data : _T_92; // @[Lookup.scala 34:39]
  wire [31:0] _T_94 = _T_15 ? medeleg_data : _T_93; // @[Lookup.scala 34:39]
  wire [31:0] _T_95 = _T_13 ? _T_2 : _T_94; // @[Lookup.scala 34:39]
  wire [31:0] _T_96 = _T_9 ? _T_1 : _T_95; // @[Lookup.scala 34:39]
  wire [31:0] _T_97 = _T_9 ? _T : _T_96; // @[Lookup.scala 34:39]
  wire  readable = _T_7 | (_T_9 | (_T_9 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 | (_T_29
     | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (_T_53 | (
    _T_55 | (_T_57 | (_T_59 | (_T_61 | (_T_63 | (_T_65 | _T_67))))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  writable = _T_7 ? 1'h0 : _T_9 | (_T_9 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | (_T_25 | (_T_27 |
    (_T_29 | (_T_31 | (_T_33 | (_T_35 | (_T_37 | (_T_39 | (_T_41 | (_T_43 | (_T_45 | (_T_47 | (_T_49 | (_T_51 | (_T_53
     | (_T_55 | (_T_57 | (_T_59 | (_T_61 | (_T_63 | (_T_65 | _T_67)))))))))))))))))))))))))))); // @[Lookup.scala 34:39]
  wire  _readValid_T = readable & writable; // @[CsrFile.scala 130:30]
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
  wire  _csrData_T_19 = 12'hb00 == io_write_addr; // @[Lookup.scala 31:38]
  wire  _csrData_T_21 = 12'hb80 == io_write_addr; // @[Lookup.scala 31:38]
  wire [31:0] _csrData_T_82 = _csrData_T_21 ? mcycle_data[63:32] : 32'h0; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_83 = _csrData_T_19 ? mcycle_data[31:0] : _csrData_T_82; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_84 = _csrData_T_17 ? 32'h0 : _csrData_T_83; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_85 = _csrData_T_15 ? _T_3 : _csrData_T_84; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_86 = _csrData_T_13 ? mepc_data : _csrData_T_85; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_87 = _csrData_T_11 ? mideleg_data : _csrData_T_86; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_88 = _csrData_T_9 ? medeleg_data : _csrData_T_87; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_89 = _csrData_T_7 ? _T_2 : _csrData_T_88; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_90 = _csrData_T_3 ? _T_1 : _csrData_T_89; // @[Lookup.scala 34:39]
  wire [31:0] _csrData_T_91 = _csrData_T_3 ? _T : _csrData_T_90; // @[Lookup.scala 34:39]
  wire [31:0] csrData = _csrData_T_1 ? 32'h0 : _csrData_T_91; // @[Lookup.scala 34:39]
  wire  writeEn = io_write_op != 3'h0 & io_write_op != 3'h1; // @[CsrFile.scala 140:43]
  wire [31:0] _writeData_T = csrData | io_write_data; // @[CsrFile.scala 144:29]
  wire [31:0] _writeData_T_1 = ~io_write_data; // @[CsrFile.scala 145:31]
  wire [31:0] _writeData_T_2 = csrData & _writeData_T_1; // @[CsrFile.scala 145:29]
  wire [31:0] _writeData_T_4 = 3'h2 == io_write_op ? io_write_data : 32'h0; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_6 = 3'h3 == io_write_op ? io_write_data : _writeData_T_4; // @[Mux.scala 81:58]
  wire [31:0] _writeData_T_8 = 3'h4 == io_write_op ? _writeData_T : _writeData_T_6; // @[Mux.scala 81:58]
  wire [31:0] writeData = 3'h5 == io_write_op ? _writeData_T_2 : _writeData_T_8; // @[Mux.scala 81:58]
  wire [63:0] _mcycle_data_T_1 = mcycle_data + 64'h1; // @[CsrFile.scala 148:32]
  wire [6:0] medeleg_data_lo = {writeData[6],1'h0,writeData[4:2],1'h0,writeData[0]}; // @[Cat.scala 33:92]
  wire [15:0] _medeleg_data_T_6 = {writeData[15],1'h0,writeData[13:12],2'h0,writeData[9:8],1'h0,medeleg_data_lo}; // @[Cat.scala 33:92]
  wire [11:0] _mideleg_data_T_3 = {2'h0,writeData[9],3'h0,writeData[5],3'h0,writeData[1],1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _mepc_data_T_1 = {writeData[31:2],2'h0}; // @[Cat.scala 33:92]
  wire [63:0] _mcycle_data_T_3 = {mcycle_data[63:32],writeData}; // @[Cat.scala 33:92]
  wire [63:0] _mcycle_data_T_5 = {writeData,mcycle_data[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _GEN_0 = _csrData_T_21 ? _mcycle_data_T_5 : _mcycle_data_T_1; // @[CsrFile.scala 148:17 151:31 160:43]
  wire [63:0] _GEN_1 = _csrData_T_19 ? _mcycle_data_T_3 : _GEN_0; // @[CsrFile.scala 151:31 159:43]
  wire  _GEN_2 = _csrData_T_15 ? writeData[31] : satp_mode; // @[CsrFile.scala 151:31 CSR.scala 187:11 CsrFile.scala 75:28]
  wire [21:0] _GEN_3 = _csrData_T_15 ? writeData[21:0] : satp_ppn; // @[CsrFile.scala 151:31 CSR.scala 188:11 CsrFile.scala 75:28]
  wire [63:0] _GEN_4 = _csrData_T_15 ? _mcycle_data_T_1 : _GEN_1; // @[CsrFile.scala 148:17 151:31]
  wire [31:0] _GEN_5 = _csrData_T_13 ? _mepc_data_T_1 : mepc_data; // @[CsrFile.scala 151:31 CSR.scala 369:11 CsrFile.scala 74:28]
  wire  _GEN_6 = _csrData_T_13 ? satp_mode : _GEN_2; // @[CsrFile.scala 151:31 75:28]
  wire [21:0] _GEN_7 = _csrData_T_13 ? satp_ppn : _GEN_3; // @[CsrFile.scala 151:31 75:28]
  wire [63:0] _GEN_8 = _csrData_T_13 ? _mcycle_data_T_1 : _GEN_4; // @[CsrFile.scala 148:17 151:31]
  wire [31:0] _GEN_9 = _csrData_T_11 ? {{20'd0}, _mideleg_data_T_3} : mideleg_data; // @[CsrFile.scala 151:31 CSR.scala 271:11 CsrFile.scala 73:28]
  wire [31:0] _GEN_10 = _csrData_T_11 ? mepc_data : _GEN_5; // @[CsrFile.scala 151:31 74:28]
  wire  _GEN_11 = _csrData_T_11 ? satp_mode : _GEN_6; // @[CsrFile.scala 151:31 75:28]
  wire [21:0] _GEN_12 = _csrData_T_11 ? satp_ppn : _GEN_7; // @[CsrFile.scala 151:31 75:28]
  wire [63:0] _GEN_13 = _csrData_T_11 ? _mcycle_data_T_1 : _GEN_8; // @[CsrFile.scala 148:17 151:31]
  wire [31:0] _GEN_14 = _csrData_T_9 ? {{16'd0}, _medeleg_data_T_6} : medeleg_data; // @[CsrFile.scala 151:31 CSR.scala 256:11 CsrFile.scala 72:28]
  wire [31:0] _GEN_15 = _csrData_T_9 ? mideleg_data : _GEN_9; // @[CsrFile.scala 151:31 73:28]
  wire [31:0] _GEN_16 = _csrData_T_9 ? mepc_data : _GEN_10; // @[CsrFile.scala 151:31 74:28]
  wire  _GEN_17 = _csrData_T_9 ? satp_mode : _GEN_11; // @[CsrFile.scala 151:31 75:28]
  wire [21:0] _GEN_18 = _csrData_T_9 ? satp_ppn : _GEN_12; // @[CsrFile.scala 151:31 75:28]
  wire [63:0] _GEN_19 = _csrData_T_9 ? _mcycle_data_T_1 : _GEN_13; // @[CsrFile.scala 148:17 151:31]
  wire [29:0] _GEN_20 = _csrData_T_7 ? writeData[31:2] : mtvec_base; // @[CsrFile.scala 151:31 CSR.scala 345:11 CsrFile.scala 71:28]
  wire [1:0] _GEN_21 = _csrData_T_7 ? {{1'd0}, writeData[0]} : mtvec_mode; // @[CsrFile.scala 151:31 CSR.scala 346:11 CsrFile.scala 71:28]
  wire [31:0] _GEN_22 = _csrData_T_7 ? medeleg_data : _GEN_14; // @[CsrFile.scala 151:31 72:28]
  wire [31:0] _GEN_23 = _csrData_T_7 ? mideleg_data : _GEN_15; // @[CsrFile.scala 151:31 73:28]
  wire [31:0] _GEN_24 = _csrData_T_7 ? mepc_data : _GEN_16; // @[CsrFile.scala 151:31 74:28]
  wire  _GEN_25 = _csrData_T_7 ? satp_mode : _GEN_17; // @[CsrFile.scala 151:31 75:28]
  wire [21:0] _GEN_26 = _csrData_T_7 ? satp_ppn : _GEN_18; // @[CsrFile.scala 151:31 75:28]
  wire [63:0] _GEN_27 = _csrData_T_7 ? _mcycle_data_T_1 : _GEN_19; // @[CsrFile.scala 148:17 151:31]
  wire [31:0] csrState_mcycle = mcycle_data[31:0]; // @[CsrFile.scala 179:29]
  wire [31:0] csrState_mcycleh = mcycle_data[63:32]; // @[CsrFile.scala 180:30]
  assign io_read_valid = 3'h5 == io_read_op ? _readValid_T : _readValid_T_10; // @[Mux.scala 81:58]
  assign io_read_data = _T_7 ? 32'h0 : _T_97; // @[Lookup.scala 34:39]
  assign io_mepc = mepc_data; // @[CsrFile.scala 173:13]
  assign io_trapVec = {mtvec_base,mtvec_mode}; // @[CsrFile.scala 174:25]
  assign csrState_0_mcycle = csrState_mcycle;
  assign csrState_0_mcycleh = csrState_mcycleh;
  always @(posedge clock) begin
    if (reset) begin // @[CsrFile.scala 69:28]
      mcause_int <= 1'h0; // @[CsrFile.scala 69:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 151:31]
        mcause_int <= writeData[31]; // @[CSR.scala 384:11]
      end
    end
    if (reset) begin // @[CsrFile.scala 69:28]
      mcause_code <= 31'h0; // @[CsrFile.scala 69:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 151:31]
        mcause_code <= {{27'd0}, writeData[3:0]}; // @[CSR.scala 385:11]
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_sum <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_sum <= writeData[18]; // @[CSR.scala 222:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_mpp <= 2'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_mpp <= writeData[12:11]; // @[CSR.scala 223:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_spp <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_spp <= writeData[8]; // @[CSR.scala 224:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_mpie <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_mpie <= writeData[7]; // @[CSR.scala 225:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_spie <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_spie <= writeData[5]; // @[CSR.scala 226:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_mie <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_mie <= writeData[3]; // @[CSR.scala 227:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 70:28]
      mstatus_sie <= 1'h0; // @[CsrFile.scala 70:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
          mstatus_sie <= writeData[1]; // @[CSR.scala 228:11]
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 71:28]
      mtvec_base <= 30'h0; // @[CsrFile.scala 71:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          mtvec_base <= _GEN_20;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 71:28]
      mtvec_mode <= 2'h0; // @[CsrFile.scala 71:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          mtvec_mode <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 72:28]
      medeleg_data <= 32'h0; // @[CsrFile.scala 72:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          medeleg_data <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 73:28]
      mideleg_data <= 32'h0; // @[CsrFile.scala 73:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          mideleg_data <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 74:28]
      mepc_data <= 32'h0; // @[CsrFile.scala 74:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          mepc_data <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 75:28]
      satp_mode <= 1'h0; // @[CsrFile.scala 75:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          satp_mode <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 75:28]
      satp_ppn <= 22'h0; // @[CsrFile.scala 75:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (!(_csrData_T_3)) begin // @[CsrFile.scala 151:31]
        if (!(12'h300 == io_write_addr)) begin // @[CsrFile.scala 151:31]
          satp_ppn <= _GEN_26;
        end
      end
    end
    if (reset) begin // @[CsrFile.scala 77:28]
      mcycle_data <= 64'h0; // @[CsrFile.scala 77:28]
    end else if (writeEn) begin // @[CsrFile.scala 150:19]
      if (_csrData_T_3) begin // @[CsrFile.scala 151:31]
        mcycle_data <= _mcycle_data_T_1; // @[CsrFile.scala 148:17]
      end else if (12'h300 == io_write_addr) begin // @[CsrFile.scala 151:31]
        mcycle_data <= _mcycle_data_T_1; // @[CsrFile.scala 148:17]
      end else begin
        mcycle_data <= _GEN_27;
      end
    end else begin
      mcycle_data <= _mcycle_data_T_1; // @[CsrFile.scala 148:17]
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
  _RAND_16 = {2{`RANDOM}};
  mcycle_data = _RAND_16[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
