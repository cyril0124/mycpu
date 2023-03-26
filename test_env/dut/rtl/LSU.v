module LSU(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_wdata,
  input  [4:0]  io_req_bits_lsuOp,
  output        io_resp_valid,
  output [31:0] io_resp_bits_rdata,
  output        io_excp_storeUnalign,
  input         io_ram_req_ready,
  output        io_ram_req_valid,
  output [2:0]  io_ram_req_bits_opcode,
  output [31:0] io_ram_req_bits_address,
  output [3:0]  io_ram_req_bits_mask,
  output [31:0] io_ram_req_bits_data,
  output        io_ram_resp_ready,
  input         io_ram_resp_valid,
  input  [31:0] io_ram_resp_bits_data
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
`endif // RANDOMIZE_REG_INIT
  reg  s0_ready; // @[LSU.scala 75:27]
  wire  s0_latch = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_wdata; // @[Reg.scala 19:16]
  reg [4:0] s0_reqReg_lsuOp; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = s0_latch ? io_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_1 = s0_latch ? io_req_bits_wdata : s0_reqReg_wdata; // @[Reg.scala 19:16 20:{18,22}]
  wire [4:0] _GEN_2 = s0_latch ? io_req_bits_lsuOp : s0_reqReg_lsuOp; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] s0_offset = _GEN_0[1:0]; // @[LSU.scala 80:32]
  reg  s1_ready; // @[LSU.scala 81:28]
  wire  _GEN_4 = s0_latch & ~(_GEN_2 == 5'h0 | _GEN_2 == 5'h14) ? 1'h0 : s0_ready; // @[LSU.scala 85:80 86:18 75:27]
  wire  _T_5 = io_ram_req_ready & io_ram_req_valid; // @[Decoupled.scala 51:35]
  wire  _T_11 = 5'h1 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h2 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h3 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_17 = 5'h4 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_19 = 5'h5 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_21 = 5'h6 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_23 = 5'h7 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_25 = 5'h8 == _GEN_2; // @[Lookup.scala 31:38]
  wire  en = _T_11 | (_T_13 | (_T_15 | (_T_17 | (_T_19 | (_T_21 | (_T_23 | _T_25)))))); // @[Lookup.scala 34:39]
  wire  s0_en = en; // @[Lookup.scala 34:39]
  wire  _GEN_5 = _T_5 & s0_en & s1_ready | ~s0_en | _GEN_4; // @[LSU.scala 90:62 91:18]
  wire  _T_40 = _T_19 ? 1'h0 : _T_21 | (_T_23 | _T_25); // @[Lookup.scala 34:39]
  wire  _T_41 = _T_17 ? 1'h0 : _T_40; // @[Lookup.scala 34:39]
  wire  _T_42 = _T_15 ? 1'h0 : _T_41; // @[Lookup.scala 34:39]
  wire  _T_43 = _T_13 ? 1'h0 : _T_42; // @[Lookup.scala 34:39]
  wire  wen = _T_11 ? 1'h0 : _T_43; // @[Lookup.scala 34:39]
  wire [1:0] _T_53 = _T_25 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_54 = _T_23 ? 2'h1 : _T_53; // @[Lookup.scala 34:39]
  wire [1:0] _T_55 = _T_21 ? 2'h0 : _T_54; // @[Lookup.scala 34:39]
  wire [1:0] _T_56 = _T_19 ? 2'h1 : _T_55; // @[Lookup.scala 34:39]
  wire [1:0] _T_57 = _T_17 ? 2'h0 : _T_56; // @[Lookup.scala 34:39]
  wire [1:0] _T_58 = _T_15 ? 2'h2 : _T_57; // @[Lookup.scala 34:39]
  wire [1:0] _T_59 = _T_13 ? 2'h1 : _T_58; // @[Lookup.scala 34:39]
  wire [1:0] width = _T_11 ? 2'h0 : _T_59; // @[Lookup.scala 34:39]
  wire  signed_ = _T_11 | (_T_13 | (_T_15 | _T_41)); // @[Lookup.scala 34:39]
  wire  _io_excp_storeUnalign_T_1 = s0_offset == 2'h3; // @[LSU.scala 105:88]
  wire  _io_excp_storeUnalign_T_3 = s0_offset != 2'h0; // @[LSU.scala 106:88]
  wire  _io_excp_storeUnalign_T_7 = 2'h2 == width ? _io_excp_storeUnalign_T_3 : 2'h1 == width &
    _io_excp_storeUnalign_T_1; // @[Mux.scala 81:58]
  wire [4:0] _io_ram_req_bits_data_T = {s0_offset, 3'h0}; // @[LSU.scala 122:56]
  wire [62:0] _GEN_3 = {{31'd0}, _GEN_1}; // @[LSU.scala 122:42]
  wire [62:0] _io_ram_req_bits_data_T_1 = _GEN_3 << _io_ram_req_bits_data_T; // @[LSU.scala 122:42]
  wire [3:0] _io_ram_req_bits_mask_T_1 = 4'h1 << s0_offset; // @[OneHot.scala 57:35]
  wire [2:0] _io_ram_req_bits_mask_T_6 = 2'h1 == s0_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_8 = 2'h2 == s0_offset ? 4'hc : {{1'd0}, _io_ram_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_10 = 2'h0 == width ? _io_ram_req_bits_mask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_12 = 2'h1 == width ? _io_ram_req_bits_mask_T_8 : _io_ram_req_bits_mask_T_10; // @[Mux.scala 81:58]
  wire  s0_valid = io_ram_req_ready & io_ram_req_valid; // @[Decoupled.scala 51:35]
  wire  s1_latch = _T_5 & s1_ready; // @[LSU.scala 146:30]
  reg  s1_signed; // @[Reg.scala 19:16]
  reg [1:0] s1_width; // @[Reg.scala 19:16]
  reg [1:0] s1_offset; // @[Reg.scala 19:16]
  reg [4:0] s1_lsuOp; // @[Reg.scala 19:16]
  wire  _GEN_12 = s1_latch ? 1'h0 : s1_ready; // @[LSU.scala 151:20 152:19 81:28]
  wire  _GEN_13 = s1_latch | _GEN_5; // @[LSU.scala 151:20 154:18]
  wire  _T_69 = io_ram_resp_ready & io_ram_resp_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_respReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_22 = _T_69 ? io_ram_resp_bits_data : s1_respReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _ramRdData_T_2 = {8'h0,_GEN_22[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_5 = {16'h0,_GEN_22[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_8 = {24'h0,_GEN_22[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_10 = 2'h1 == s1_offset ? _ramRdData_T_2 : _GEN_22; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_12 = 2'h2 == s1_offset ? _ramRdData_T_5 : _ramRdData_T_10; // @[Mux.scala 81:58]
  wire [31:0] ramRdData = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_resp_bits_rdata_T_1 = ramRdData[7:0]; // @[LSU.scala 174:83]
  wire  io_resp_bits_rdata_signBit = _io_resp_bits_rdata_T_1[7]; // @[util.scala 20:27]
  wire [5:0] io_resp_bits_rdata_out_lo_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_resp_bits_rdata_out_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_resp_bits_rdata_out_T_1 = ramRdData[7:0]; // @[util.scala 24:75]
  wire [31:0] io_resp_bits_rdata_out = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit
    ,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_out_lo_lo,
    io_resp_bits_rdata_out_lo,_io_resp_bits_rdata_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_1 = {{24'd0}, ramRdData[7:0]}; // @[util.scala 40:36]
  wire [31:0] _io_resp_bits_rdata_T_3 = s1_signed ? io_resp_bits_rdata_out : io_resp_bits_rdata_out_1; // @[LSU.scala 174:48]
  wire [15:0] _io_resp_bits_rdata_T_5 = ramRdData[15:0]; // @[LSU.scala 175:84]
  wire  io_resp_bits_rdata_signBit_1 = _io_resp_bits_rdata_T_5[15]; // @[util.scala 20:27]
  wire [7:0] io_resp_bits_rdata_out_lo_1 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_resp_bits_rdata_out_T_3 = ramRdData[15:0]; // @[util.scala 24:75]
  wire [31:0] io_resp_bits_rdata_out_2 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_out_lo_1,_io_resp_bits_rdata_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_3 = {{16'd0}, ramRdData[15:0]}; // @[util.scala 40:36]
  wire [31:0] _io_resp_bits_rdata_T_7 = s1_signed ? io_resp_bits_rdata_out_2 : io_resp_bits_rdata_out_3; // @[LSU.scala 175:48]
  wire [31:0] _io_resp_bits_rdata_T_10 = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[util.scala 22:18]
  wire [31:0] _io_resp_bits_rdata_T_12 = s1_signed ? _io_resp_bits_rdata_T_10 : ramRdData; // @[LSU.scala 176:48]
  wire [31:0] _io_resp_bits_rdata_T_14 = 2'h0 == s1_width ? _io_resp_bits_rdata_T_3 : ramRdData; // @[Mux.scala 81:58]
  wire [31:0] _io_resp_bits_rdata_T_16 = 2'h1 == s1_width ? _io_resp_bits_rdata_T_7 : _io_resp_bits_rdata_T_14; // @[Mux.scala 81:58]
  wire  _GEN_23 = _T_69 | _GEN_12; // @[LSU.scala 181:{28,39}]
  assign io_req_ready = s0_ready; // @[LSU.scala 83:18]
  assign io_resp_valid = _T_69 & s1_lsuOp != 5'h0 & s1_lsuOp != 5'h14 | s1_lsuOp == 5'h0 | s1_lsuOp == 5'h14; // @[LSU.scala 180:114]
  assign io_resp_bits_rdata = 2'h2 == s1_width ? _io_resp_bits_rdata_T_12 : _io_resp_bits_rdata_T_16; // @[Mux.scala 81:58]
  assign io_excp_storeUnalign = wen & _io_excp_storeUnalign_T_7; // @[LSU.scala 103:15 100:26 104:30]
  assign io_ram_req_valid = ~io_excp_storeUnalign & s0_en & s1_ready; // @[LSU.scala 120:56]
  assign io_ram_req_bits_opcode = wen ? 3'h2 : 3'h4; // @[LSU.scala 123:34]
  assign io_ram_req_bits_address = s0_latch ? io_req_bits_addr : s0_reqReg_addr; // @[LSU.scala 79:21]
  assign io_ram_req_bits_mask = 2'h2 == width ? 4'hf : _io_ram_req_bits_mask_T_12; // @[Mux.scala 81:58]
  assign io_ram_req_bits_data = _io_ram_req_bits_data_T_1[31:0]; // @[LSU.scala 122:26]
  assign io_ram_resp_ready = 1'h1; // @[LSU.scala 162:23]
  always @(posedge clock) begin
    s0_ready <= reset | _GEN_13; // @[LSU.scala 75:{27,27}]
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_wdata <= io_req_bits_wdata; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
    end
    s1_ready <= reset | _GEN_23; // @[LSU.scala 81:{28,28}]
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_signed <= signed_; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (_T_11) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h0;
      end else if (_T_13) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h1;
      end else if (_T_15) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h2;
      end else begin
        s1_width <= _T_57;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_offset <= s0_offset; // @[Reg.scala 20:22]
    end
    if (~_T_5 & _T_69) begin // @[LSU.scala 157:41]
      s1_lsuOp <= 5'h0; // @[LSU.scala 157:52]
    end else if (s1_latch) begin // @[Reg.scala 20:18]
      if (s0_latch) begin // @[Reg.scala 20:18]
        s1_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
      end else begin
        s1_lsuOp <= s0_reqReg_lsuOp; // @[Reg.scala 19:16]
      end
    end
    if (_T_69) begin // @[Reg.scala 20:18]
      s1_respReg_data <= io_ram_resp_bits_data; // @[Reg.scala 20:22]
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
  s0_ready = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s0_reqReg_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s0_reqReg_wdata = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s0_reqReg_lsuOp = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  s1_ready = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_signed = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_width = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  s1_offset = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  s1_lsuOp = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  s1_respReg_data = _RAND_9[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
