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
  reg  s1_ready; // @[LSU.scala 82:28]
  wire  _GEN_4 = s0_latch & ~(_GEN_2 == 5'h0 | _GEN_2 == 5'h14) ? 1'h0 : s0_ready; // @[LSU.scala 86:80 87:18 75:27]
  wire  _T_6 = 5'h1 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_8 = 5'h2 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_10 = 5'h3 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_12 = 5'h4 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_14 = 5'h5 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_16 = 5'h6 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_18 = 5'h7 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_20 = 5'h8 == _GEN_2; // @[Lookup.scala 31:38]
  wire  en = _T_6 | (_T_8 | (_T_10 | (_T_12 | (_T_14 | (_T_16 | (_T_18 | _T_20)))))); // @[Lookup.scala 34:39]
  wire  _T_35 = _T_14 ? 1'h0 : _T_16 | (_T_18 | _T_20); // @[Lookup.scala 34:39]
  wire  _T_36 = _T_12 ? 1'h0 : _T_35; // @[Lookup.scala 34:39]
  wire  _T_37 = _T_10 ? 1'h0 : _T_36; // @[Lookup.scala 34:39]
  wire  _T_38 = _T_8 ? 1'h0 : _T_37; // @[Lookup.scala 34:39]
  wire  wen = _T_6 ? 1'h0 : _T_38; // @[Lookup.scala 34:39]
  wire [1:0] _T_48 = _T_20 ? 2'h2 : 2'h0; // @[Lookup.scala 34:39]
  wire [1:0] _T_49 = _T_18 ? 2'h1 : _T_48; // @[Lookup.scala 34:39]
  wire [1:0] _T_50 = _T_16 ? 2'h0 : _T_49; // @[Lookup.scala 34:39]
  wire [1:0] _T_51 = _T_14 ? 2'h1 : _T_50; // @[Lookup.scala 34:39]
  wire [1:0] _T_52 = _T_12 ? 2'h0 : _T_51; // @[Lookup.scala 34:39]
  wire [1:0] _T_53 = _T_10 ? 2'h2 : _T_52; // @[Lookup.scala 34:39]
  wire [1:0] _T_54 = _T_8 ? 2'h1 : _T_53; // @[Lookup.scala 34:39]
  wire [1:0] width = _T_6 ? 2'h0 : _T_54; // @[Lookup.scala 34:39]
  wire  signed_ = _T_6 | (_T_8 | (_T_10 | _T_36)); // @[Lookup.scala 34:39]
  wire  _io_excp_storeUnalign_T_1 = s0_offset == 2'h3; // @[LSU.scala 101:88]
  wire  _io_excp_storeUnalign_T_3 = s0_offset != 2'h0; // @[LSU.scala 102:88]
  wire  _io_excp_storeUnalign_T_7 = 2'h2 == width ? _io_excp_storeUnalign_T_3 : 2'h1 == width &
    _io_excp_storeUnalign_T_1; // @[Mux.scala 81:58]
  wire [4:0] _io_ram_req_bits_data_T = {s0_offset, 3'h0}; // @[LSU.scala 118:56]
  wire [62:0] _GEN_3 = {{31'd0}, _GEN_1}; // @[LSU.scala 118:42]
  wire [62:0] _io_ram_req_bits_data_T_1 = _GEN_3 << _io_ram_req_bits_data_T; // @[LSU.scala 118:42]
  wire [3:0] _io_ram_req_bits_mask_T_1 = 4'h1 << s0_offset; // @[OneHot.scala 57:35]
  wire [2:0] _io_ram_req_bits_mask_T_6 = 2'h1 == s0_offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_8 = 2'h2 == s0_offset ? 4'hc : {{1'd0}, _io_ram_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_10 = 2'h0 == width ? _io_ram_req_bits_mask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_12 = 2'h1 == width ? _io_ram_req_bits_mask_T_8 : _io_ram_req_bits_mask_T_10; // @[Mux.scala 81:58]
  wire  _s0_valid_T = io_ram_req_ready & io_ram_req_valid; // @[Decoupled.scala 51:35]
  wire  s0_valid = _s0_valid_T & ~s0_ready; // @[LSU.scala 134:33]
  wire  s1_latch = s0_valid & s1_ready; // @[LSU.scala 142:30]
  reg  s1_signed; // @[Reg.scala 19:16]
  reg [1:0] s1_width; // @[Reg.scala 19:16]
  reg [1:0] s1_offset; // @[Reg.scala 19:16]
  wire  _GEN_10 = s1_latch ? 1'h0 : s1_ready; // @[LSU.scala 147:20 148:19 82:28]
  wire  _GEN_11 = s1_latch | _GEN_4; // @[LSU.scala 147:20 149:18]
  wire  _s1_respReg_T = io_ram_resp_ready & io_ram_resp_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_respReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_19 = _s1_respReg_T ? io_ram_resp_bits_data : s1_respReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _ramRdData_T_2 = {8'h0,_GEN_19[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_5 = {16'h0,_GEN_19[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_8 = {24'h0,_GEN_19[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_10 = 2'h1 == s1_offset ? _ramRdData_T_2 : _GEN_19; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_12 = 2'h2 == s1_offset ? _ramRdData_T_5 : _ramRdData_T_10; // @[Mux.scala 81:58]
  wire [31:0] ramRdData = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_resp_bits_rdata_T_1 = ramRdData[7:0]; // @[LSU.scala 169:83]
  wire  io_resp_bits_rdata_signBit = _io_resp_bits_rdata_T_1[7]; // @[util.scala 28:27]
  wire [5:0] io_resp_bits_rdata_out_lo_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_resp_bits_rdata_out_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_resp_bits_rdata_out_T_1 = ramRdData[7:0]; // @[util.scala 32:75]
  wire [31:0] io_resp_bits_rdata_out = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit
    ,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_out_lo_lo,
    io_resp_bits_rdata_out_lo,_io_resp_bits_rdata_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_1 = {{24'd0}, ramRdData[7:0]}; // @[util.scala 48:36]
  wire [31:0] _io_resp_bits_rdata_T_3 = s1_signed ? io_resp_bits_rdata_out : io_resp_bits_rdata_out_1; // @[LSU.scala 169:48]
  wire [15:0] _io_resp_bits_rdata_T_5 = ramRdData[15:0]; // @[LSU.scala 170:84]
  wire  io_resp_bits_rdata_signBit_1 = _io_resp_bits_rdata_T_5[15]; // @[util.scala 28:27]
  wire [7:0] io_resp_bits_rdata_out_lo_1 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_resp_bits_rdata_out_T_3 = ramRdData[15:0]; // @[util.scala 32:75]
  wire [31:0] io_resp_bits_rdata_out_2 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_out_lo_1,_io_resp_bits_rdata_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_3 = {{16'd0}, ramRdData[15:0]}; // @[util.scala 48:36]
  wire [31:0] _io_resp_bits_rdata_T_7 = s1_signed ? io_resp_bits_rdata_out_2 : io_resp_bits_rdata_out_3; // @[LSU.scala 170:48]
  wire [31:0] _io_resp_bits_rdata_T_10 = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[util.scala 30:18]
  wire [31:0] _io_resp_bits_rdata_T_12 = s1_signed ? _io_resp_bits_rdata_T_10 : ramRdData; // @[LSU.scala 171:48]
  wire [31:0] _io_resp_bits_rdata_T_14 = 2'h0 == s1_width ? _io_resp_bits_rdata_T_3 : ramRdData; // @[Mux.scala 81:58]
  wire [31:0] _io_resp_bits_rdata_T_16 = 2'h1 == s1_width ? _io_resp_bits_rdata_T_7 : _io_resp_bits_rdata_T_14; // @[Mux.scala 81:58]
  wire  _GEN_20 = _s1_respReg_T | _GEN_10; // @[LSU.scala 179:20 180:18]
  wire  s0_en = en; // @[Lookup.scala 34:39]
  assign io_req_ready = s0_ready; // @[LSU.scala 84:18]
  assign io_resp_valid = io_ram_resp_ready & io_ram_resp_valid; // @[Decoupled.scala 51:35]
  assign io_resp_bits_rdata = 2'h2 == s1_width ? _io_resp_bits_rdata_T_12 : _io_resp_bits_rdata_T_16; // @[Mux.scala 81:58]
  assign io_excp_storeUnalign = wen & _io_excp_storeUnalign_T_7; // @[LSU.scala 99:15 100:30 96:26]
  assign io_ram_req_valid = ~io_excp_storeUnalign & en & s1_ready; // @[LSU.scala 116:53]
  assign io_ram_req_bits_opcode = wen ? 3'h2 : 3'h4; // @[LSU.scala 119:34]
  assign io_ram_req_bits_address = s0_latch ? io_req_bits_addr : s0_reqReg_addr; // @[LSU.scala 79:21]
  assign io_ram_req_bits_mask = 2'h2 == width ? 4'hf : _io_ram_req_bits_mask_T_12; // @[Mux.scala 81:58]
  assign io_ram_req_bits_data = _io_ram_req_bits_data_T_1[31:0]; // @[LSU.scala 118:26]
  assign io_ram_resp_ready = 1'h1; // @[LSU.scala 157:23]
  always @(posedge clock) begin
    s0_ready <= reset | _GEN_11; // @[LSU.scala 75:{27,27}]
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_wdata <= io_req_bits_wdata; // @[Reg.scala 20:22]
    end
    if (s0_latch) begin // @[Reg.scala 20:18]
      s0_reqReg_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
    end
    s1_ready <= reset | _GEN_20; // @[LSU.scala 82:{28,28}]
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_signed <= signed_; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      if (_T_6) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h0;
      end else if (_T_8) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h1;
      end else if (_T_10) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h2;
      end else begin
        s1_width <= _T_52;
      end
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_offset <= s0_offset; // @[Reg.scala 20:22]
    end
    if (_s1_respReg_T) begin // @[Reg.scala 20:18]
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
  s1_respReg_data = _RAND_8[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
