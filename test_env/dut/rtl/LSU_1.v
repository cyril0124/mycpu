module LSU_1(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_wdata,
  input  [4:0]  io_req_bits_lsuOp,
  output        io_resp_valid,
  output [31:0] io_resp_bits_rdata,
  input         io_cache_read_req_ready,
  output        io_cache_read_req_valid,
  output [31:0] io_cache_read_req_bits_addr,
  output        io_cache_read_resp_ready,
  input         io_cache_read_resp_valid,
  input  [31:0] io_cache_read_resp_bits_data,
  input         io_cache_write_req_ready,
  output        io_cache_write_req_valid,
  output [31:0] io_cache_write_req_bits_addr,
  output [31:0] io_cache_write_req_bits_data,
  output [3:0]  io_cache_write_req_bits_mask,
  output        io_cache_write_resp_ready,
  input         io_cache_write_resp_valid
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
`endif // RANDOMIZE_REG_INIT
  reg  s0_full; // @[LSU.scala 206:26]
  wire  s0_latch = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  wire  _s0_valid_T = io_cache_read_req_ready & io_cache_read_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_holdReg; // @[Reg.scala 19:16]
  wire  _s0_valid_T_1 = _s0_valid_T | s0_valid_holdReg; // @[util.scala 26:12]
  reg [4:0] s0_reqReg_lsuOp; // @[Reg.scala 19:16]
  wire [4:0] s0_req_lsuOp = s0_latch ? io_req_bits_lsuOp : s0_reqReg_lsuOp; // @[LSU.scala 211:21]
  wire  _T_7 = 5'h1 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_9 = 5'h2 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_11 = 5'h3 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h4 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h5 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_17 = 5'h6 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_19 = 5'h7 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  _T_21 = 5'h8 == s0_req_lsuOp; // @[Lookup.scala 31:38]
  wire  load = _T_7 | (_T_9 | (_T_11 | (_T_13 | _T_15))); // @[Lookup.scala 34:39]
  wire  _s0_valid_T_3 = io_cache_write_req_ready & io_cache_write_req_valid; // @[Decoupled.scala 51:35]
  reg  s0_valid_holdReg_1; // @[Reg.scala 19:16]
  wire  _s0_valid_T_4 = _s0_valid_T_3 | s0_valid_holdReg_1; // @[util.scala 26:12]
  wire  _T_36 = _T_15 ? 1'h0 : _T_17 | (_T_19 | _T_21); // @[Lookup.scala 34:39]
  wire  _T_37 = _T_13 ? 1'h0 : _T_36; // @[Lookup.scala 34:39]
  wire  _T_38 = _T_11 ? 1'h0 : _T_37; // @[Lookup.scala 34:39]
  wire  _T_39 = _T_9 ? 1'h0 : _T_38; // @[Lookup.scala 34:39]
  wire  wen = _T_7 ? 1'h0 : _T_39; // @[Lookup.scala 34:39]
  wire  s0_valid = _s0_valid_T_1 & load | _s0_valid_T_4 & wen; // @[LSU.scala 265:73]
  reg  s1_full; // @[LSU.scala 272:26]
  wire  s1_ready = ~s1_full; // @[LSU.scala 279:17]
  wire  s0_fire = s0_valid & s1_ready; // @[LSU.scala 208:28]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_wdata; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_1 = s0_latch ? io_req_bits_wdata : s0_reqReg_wdata; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] s0_offset = _GEN_0[1:0]; // @[LSU.scala 212:32]
  wire  _GEN_4 = s0_full & s0_fire ? 1'h0 : s0_full; // @[LSU.scala 206:26 217:{35,45}]
  wire  _GEN_5 = s0_latch & ~(s0_req_lsuOp == 5'h0 | s0_req_lsuOp == 5'h14) | _GEN_4; // @[LSU.scala 216:{80,90}]
  wire  en = _T_7 | (_T_9 | (_T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | _T_21)))))); // @[Lookup.scala 34:39]
  wire [1:0] _T_49 = _T_21 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_50 = _T_19 ? 2'h1 : _T_49; // @[Lookup.scala 34:39]
  wire [1:0] _T_51 = _T_17 ? 2'h0 : _T_50; // @[Lookup.scala 34:39]
  wire [1:0] _T_52 = _T_15 ? 2'h1 : _T_51; // @[Lookup.scala 34:39]
  wire [1:0] _T_53 = _T_13 ? 2'h0 : _T_52; // @[Lookup.scala 34:39]
  wire [1:0] _T_54 = _T_11 ? 2'h2 : _T_53; // @[Lookup.scala 34:39]
  wire [1:0] _T_55 = _T_9 ? 2'h1 : _T_54; // @[Lookup.scala 34:39]
  wire [1:0] width = _T_7 ? 2'h0 : _T_55; // @[Lookup.scala 34:39]
  wire  signed_ = _T_7 | (_T_9 | (_T_11 | _T_37)); // @[Lookup.scala 34:39]
  wire  _s0_reqSend_T_2 = _s0_valid_T | _s0_valid_T_3; // @[LSU.scala 243:72]
  reg  s0_reqSend; // @[Reg.scala 35:20]
  wire  _GEN_8 = _s0_reqSend_T_2 | s0_reqSend; // @[Reg.scala 36:18 35:20 36:22]
  wire  _io_cache_read_req_valid_T_1 = ~s0_reqSend; // @[LSU.scala 245:51]
  wire [4:0] _io_cache_write_req_bits_data_T = {s0_offset, 3'h0}; // @[LSU.scala 250:64]
  wire [62:0] _GEN_2 = {{31'd0}, _GEN_1}; // @[LSU.scala 250:50]
  wire [62:0] _io_cache_write_req_bits_data_T_1 = _GEN_2 << _io_cache_write_req_bits_data_T; // @[LSU.scala 250:50]
  wire [3:0] _s0_storeMask_T_1 = 4'h1 << s0_offset; // @[OneHot.scala 57:35]
  wire [2:0] _s0_storeMask_T_6 = 2'h1 == s0_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_8 = 2'h2 == s0_offset ? 4'hc : {{1'd0}, _s0_storeMask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_10 = 2'h0 == width ? _s0_storeMask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _s0_storeMask_T_12 = 2'h1 == width ? _s0_storeMask_T_8 : _s0_storeMask_T_10; // @[Mux.scala 81:58]
  reg  s1_signed; // @[Reg.scala 19:16]
  reg [1:0] s1_width; // @[Reg.scala 19:16]
  reg [1:0] s1_offset; // @[Reg.scala 19:16]
  wire  _s1_loadRespValid_T = io_cache_read_resp_ready & io_cache_read_resp_valid; // @[Decoupled.scala 51:35]
  reg  s1_loadRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s1_loadRespValid = _s1_loadRespValid_T ? io_cache_read_resp_valid : s1_loadRespValid_holdReg; // @[util.scala 26:12]
  wire  _s1_storeRespValid_T = io_cache_write_resp_ready & io_cache_write_resp_valid; // @[Decoupled.scala 51:35]
  reg  s1_storeRespValid_holdReg; // @[Reg.scala 19:16]
  wire  s1_storeRespValid = _s1_storeRespValid_T ? io_cache_write_resp_valid : s1_storeRespValid_holdReg; // @[util.scala 26:12]
  wire  s1_fire = s1_full & (s1_loadRespValid | s1_storeRespValid); // @[LSU.scala 306:25]
  wire  _GEN_17 = s1_full & s1_fire ? 1'h0 : s1_full; // @[LSU.scala 272:26 281:{35,45}]
  wire  _GEN_18 = s0_fire | _GEN_17; // @[LSU.scala 280:{20,30}]
  reg [31:0] s1_loadResp_holdReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_21 = _s1_loadRespValid_T ? io_cache_read_resp_bits_data : s1_loadResp_holdReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _s1_loadData_T_2 = {8'h0,_GEN_21[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_5 = {16'h0,_GEN_21[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_8 = {24'h0,_GEN_21[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _s1_loadData_T_10 = 2'h1 == s1_offset ? _s1_loadData_T_2 : _GEN_21; // @[Mux.scala 81:58]
  wire [31:0] _s1_loadData_T_12 = 2'h2 == s1_offset ? _s1_loadData_T_5 : _s1_loadData_T_10; // @[Mux.scala 81:58]
  wire [31:0] s1_loadData = 2'h3 == s1_offset ? _s1_loadData_T_8 : _s1_loadData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_resp_bits_rdata_T_1 = s1_loadData[7:0]; // @[LSU.scala 300:85]
  wire  io_resp_bits_rdata_signBit = _io_resp_bits_rdata_T_1[7]; // @[util.scala 42:27]
  wire [5:0] io_resp_bits_rdata_out_lo_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_resp_bits_rdata_out_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_resp_bits_rdata_out_T_1 = s1_loadData[7:0]; // @[util.scala 46:75]
  wire [31:0] io_resp_bits_rdata_out = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit
    ,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_out_lo_lo,
    io_resp_bits_rdata_out_lo,_io_resp_bits_rdata_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_1 = {{24'd0}, s1_loadData[7:0]}; // @[util.scala 62:36]
  wire [31:0] _io_resp_bits_rdata_T_3 = s1_signed ? io_resp_bits_rdata_out : io_resp_bits_rdata_out_1; // @[LSU.scala 300:48]
  wire [15:0] _io_resp_bits_rdata_T_5 = s1_loadData[15:0]; // @[LSU.scala 301:86]
  wire  io_resp_bits_rdata_signBit_1 = _io_resp_bits_rdata_T_5[15]; // @[util.scala 42:27]
  wire [7:0] io_resp_bits_rdata_out_lo_1 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_resp_bits_rdata_out_T_3 = s1_loadData[15:0]; // @[util.scala 46:75]
  wire [31:0] io_resp_bits_rdata_out_2 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_out_lo_1,_io_resp_bits_rdata_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_3 = {{16'd0}, s1_loadData[15:0]}; // @[util.scala 62:36]
  wire [31:0] _io_resp_bits_rdata_T_7 = s1_signed ? io_resp_bits_rdata_out_2 : io_resp_bits_rdata_out_3; // @[LSU.scala 301:48]
  wire [31:0] _io_resp_bits_rdata_T_10 = 2'h3 == s1_offset ? _s1_loadData_T_8 : _s1_loadData_T_12; // @[util.scala 44:18]
  wire [31:0] _io_resp_bits_rdata_T_12 = s1_signed ? _io_resp_bits_rdata_T_10 : s1_loadData; // @[LSU.scala 302:48]
  wire [31:0] _io_resp_bits_rdata_T_14 = 2'h0 == s1_width ? _io_resp_bits_rdata_T_3 : s1_loadData; // @[Mux.scala 81:58]
  wire [31:0] _io_resp_bits_rdata_T_16 = 2'h1 == s1_width ? _io_resp_bits_rdata_T_7 : _io_resp_bits_rdata_T_14; // @[Mux.scala 81:58]
  wire  s0_en = en; // @[Lookup.scala 34:39]
  assign io_req_ready = ~s0_full; // @[LSU.scala 214:21]
  assign io_resp_valid = s1_full & (s1_loadRespValid | s1_storeRespValid); // @[LSU.scala 306:25]
  assign io_resp_bits_rdata = 2'h2 == s1_width ? _io_resp_bits_rdata_T_12 : _io_resp_bits_rdata_T_16; // @[Mux.scala 81:58]
  assign io_cache_read_req_valid = load & s0_full & ~s0_reqSend; // @[LSU.scala 245:48]
  assign io_cache_read_req_bits_addr = {_GEN_0[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_read_resp_ready = 1'h1; // @[LSU.scala 283:30]
  assign io_cache_write_req_valid = wen & s0_full & _io_cache_read_req_valid_T_1; // @[LSU.scala 248:48]
  assign io_cache_write_req_bits_addr = {_GEN_0[31:2],2'h0}; // @[Cat.scala 33:92]
  assign io_cache_write_req_bits_data = _io_cache_write_req_bits_data_T_1[31:0]; // @[LSU.scala 250:34]
  assign io_cache_write_req_bits_mask = 2'h2 == width ? 4'hf : _s0_storeMask_T_12; // @[Mux.scala 81:58]
  assign io_cache_write_resp_ready = 1'h1; // @[LSU.scala 284:31]
  always @(posedge clock) begin
    if (reset) begin // @[LSU.scala 206:26]
      s0_full <= 1'h0; // @[LSU.scala 206:26]
    end else begin
      s0_full <= _GEN_5;
    end
    if (s0_fire) begin // @[util.scala 25:21]
      s0_valid_holdReg <= 1'h0; // @[util.scala 25:31]
    end else begin
      s0_valid_holdReg <= _s0_valid_T_1;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[util.scala 25:21]
      s0_valid_holdReg_1 <= 1'h0; // @[util.scala 25:31]
    end else begin
      s0_valid_holdReg_1 <= _s0_valid_T_4;
    end
    if (reset) begin // @[LSU.scala 272:26]
      s1_full <= 1'h0; // @[LSU.scala 272:26]
    end else begin
      s1_full <= _GEN_18;
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_wdata <= io_req_bits_wdata; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      s0_reqSend <= 1'h0; // @[Reg.scala 35:20]
    end else if (s0_fire) begin // @[LSU.scala 244:19]
      s0_reqSend <= 1'h0; // @[LSU.scala 244:32]
    end else begin
      s0_reqSend <= _GEN_8;
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_signed <= signed_; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      if (_T_7) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h0;
      end else if (_T_9) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h1;
      end else if (_T_11) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h2;
      end else begin
        s1_width <= _T_53;
      end
    end
    if (s0_fire) begin // @[Reg.scala 20:18]
      s1_offset <= s0_offset; // @[Reg.scala 20:22]
    end
    if (s0_fire) begin // @[util.scala 25:21]
      s1_loadRespValid_holdReg <= 1'h0; // @[util.scala 25:31]
    end else if (_s1_loadRespValid_T) begin // @[util.scala 26:12]
      s1_loadRespValid_holdReg <= io_cache_read_resp_valid;
    end
    if (s0_fire) begin // @[util.scala 25:21]
      s1_storeRespValid_holdReg <= 1'h0; // @[util.scala 25:31]
    end else if (_s1_storeRespValid_T) begin // @[util.scala 26:12]
      s1_storeRespValid_holdReg <= io_cache_write_resp_valid;
    end
    if (s0_fire) begin // @[util.scala 25:21]
      s1_loadResp_holdReg_data <= 32'h0; // @[util.scala 25:31]
    end else if (_s1_loadRespValid_T) begin // @[Reg.scala 20:18]
      s1_loadResp_holdReg_data <= io_cache_read_resp_bits_data; // @[Reg.scala 20:22]
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
  s0_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s0_valid_holdReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s0_reqReg_lsuOp = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  s0_valid_holdReg_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_full = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s0_reqReg_wdata = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  s0_reqSend = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s1_signed = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_width = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  s1_offset = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s1_loadRespValid_holdReg = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s1_storeRespValid_holdReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_loadResp_holdReg_data = _RAND_13[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
