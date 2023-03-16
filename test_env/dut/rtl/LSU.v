module LSU(
  input         clock,
  output        io_req_ready,
  input         io_req_valid,
  input  [31:0] io_req_bits_addr,
  input  [31:0] io_req_bits_wdata,
  input  [4:0]  io_req_bits_lsuOp,
  output        io_resp_valid,
  output [31:0] io_resp_bits_rdata,
  output        io_excp_storeUnalign,
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
`endif // RANDOMIZE_REG_INIT
  wire  _s0_reqReg_T = io_req_ready & io_req_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s0_reqReg_addr; // @[Reg.scala 19:16]
  reg [31:0] s0_reqReg_wdata; // @[Reg.scala 19:16]
  reg [4:0] s0_reqReg_lsuOp; // @[Reg.scala 19:16]
  wire [31:0] _GEN_0 = _s0_reqReg_T ? io_req_bits_addr : s0_reqReg_addr; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _GEN_1 = _s0_reqReg_T ? io_req_bits_wdata : s0_reqReg_wdata; // @[Reg.scala 19:16 20:{18,22}]
  wire [4:0] _GEN_2 = _s0_reqReg_T ? io_req_bits_lsuOp : s0_reqReg_lsuOp; // @[Reg.scala 19:16 20:{18,22}]
  wire [1:0] offset = _GEN_0[1:0]; // @[LSU.scala 74:29]
  wire  _T_1 = 5'h1 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_3 = 5'h2 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_5 = 5'h3 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_7 = 5'h4 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_9 = 5'h5 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_11 = 5'h6 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_13 = 5'h7 == _GEN_2; // @[Lookup.scala 31:38]
  wire  _T_15 = 5'h8 == _GEN_2; // @[Lookup.scala 31:38]
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
  wire  _io_excp_storeUnalign_T_1 = offset == 2'h3; // @[LSU.scala 89:88]
  wire  _io_excp_storeUnalign_T_3 = offset != 2'h0; // @[LSU.scala 90:88]
  wire  _io_excp_storeUnalign_T_7 = 2'h2 == width ? _io_excp_storeUnalign_T_3 : 2'h1 == width &
    _io_excp_storeUnalign_T_1; // @[Mux.scala 81:58]
  wire [4:0] _io_ram_req_bits_data_T = {offset, 3'h0}; // @[LSU.scala 106:53]
  wire [62:0] _GEN_3 = {{31'd0}, _GEN_1}; // @[LSU.scala 106:42]
  wire [62:0] _io_ram_req_bits_data_T_1 = _GEN_3 << _io_ram_req_bits_data_T; // @[LSU.scala 106:42]
  wire [3:0] _io_ram_req_bits_mask_T_1 = 4'h1 << offset; // @[OneHot.scala 57:35]
  wire [2:0] _io_ram_req_bits_mask_T_6 = 2'h1 == offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_8 = 2'h2 == offset ? 4'hc : {{1'd0}, _io_ram_req_bits_mask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_10 = 2'h0 == width ? _io_ram_req_bits_mask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _io_ram_req_bits_mask_T_12 = 2'h1 == width ? _io_ram_req_bits_mask_T_8 : _io_ram_req_bits_mask_T_10; // @[Mux.scala 81:58]
  reg  s1_signed; // @[LSU.scala 122:24]
  reg [1:0] s1_width; // @[LSU.scala 123:24]
  reg [1:0] s1_offset; // @[LSU.scala 124:24]
  wire  _s1_respReg_T = io_ram_resp_ready & io_ram_resp_valid; // @[Decoupled.scala 51:35]
  reg [31:0] s1_respReg_data; // @[Reg.scala 19:16]
  wire [31:0] _GEN_16 = _s1_respReg_T ? io_ram_resp_bits_data : s1_respReg_data; // @[Reg.scala 19:16 20:{18,22}]
  wire [31:0] _ramRdData_T_2 = {8'h0,_GEN_16[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_5 = {16'h0,_GEN_16[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_8 = {24'h0,_GEN_16[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_10 = 2'h1 == s1_offset ? _ramRdData_T_2 : _GEN_16; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_12 = 2'h2 == s1_offset ? _ramRdData_T_5 : _ramRdData_T_10; // @[Mux.scala 81:58]
  wire [31:0] ramRdData = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_resp_bits_rdata_T_1 = ramRdData[7:0]; // @[LSU.scala 145:83]
  wire  io_resp_bits_rdata_signBit = _io_resp_bits_rdata_T_1[7]; // @[util.scala 11:27]
  wire [5:0] io_resp_bits_rdata_out_lo_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_resp_bits_rdata_out_lo = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,
    io_resp_bits_rdata_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_resp_bits_rdata_out_T_1 = ramRdData[7:0]; // @[util.scala 15:75]
  wire [31:0] io_resp_bits_rdata_out = {io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit
    ,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_signBit,io_resp_bits_rdata_out_lo_lo,
    io_resp_bits_rdata_out_lo,_io_resp_bits_rdata_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_1 = {{24'd0}, ramRdData[7:0]}; // @[util.scala 31:36]
  wire [31:0] _io_resp_bits_rdata_T_3 = s1_signed ? io_resp_bits_rdata_out : io_resp_bits_rdata_out_1; // @[LSU.scala 145:48]
  wire [15:0] _io_resp_bits_rdata_T_5 = ramRdData[15:0]; // @[LSU.scala 146:84]
  wire  io_resp_bits_rdata_signBit_1 = _io_resp_bits_rdata_T_5[15]; // @[util.scala 11:27]
  wire [7:0] io_resp_bits_rdata_out_lo_1 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_resp_bits_rdata_out_T_3 = ramRdData[15:0]; // @[util.scala 15:75]
  wire [31:0] io_resp_bits_rdata_out_2 = {io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,
    io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_signBit_1,io_resp_bits_rdata_out_lo_1,_io_resp_bits_rdata_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_resp_bits_rdata_out_3 = {{16'd0}, ramRdData[15:0]}; // @[util.scala 31:36]
  wire [31:0] _io_resp_bits_rdata_T_7 = s1_signed ? io_resp_bits_rdata_out_2 : io_resp_bits_rdata_out_3; // @[LSU.scala 146:48]
  wire [31:0] _io_resp_bits_rdata_T_10 = 2'h3 == s1_offset ? _ramRdData_T_8 : _ramRdData_T_12; // @[util.scala 13:18]
  wire [31:0] _io_resp_bits_rdata_T_12 = s1_signed ? _io_resp_bits_rdata_T_10 : ramRdData; // @[LSU.scala 147:48]
  wire [31:0] _io_resp_bits_rdata_T_14 = 2'h0 == s1_width ? _io_resp_bits_rdata_T_3 : ramRdData; // @[Mux.scala 81:58]
  wire [31:0] _io_resp_bits_rdata_T_16 = 2'h1 == s1_width ? _io_resp_bits_rdata_T_7 : _io_resp_bits_rdata_T_14; // @[Mux.scala 81:58]
  assign io_req_ready = 1'h1; // @[LSU.scala 77:21]
  assign io_resp_valid = io_ram_resp_valid; // @[LSU.scala 151:19]
  assign io_resp_bits_rdata = 2'h2 == s1_width ? _io_resp_bits_rdata_T_12 : _io_resp_bits_rdata_T_16; // @[Mux.scala 81:58]
  assign io_excp_storeUnalign = wen & _io_excp_storeUnalign_T_7; // @[LSU.scala 87:15 84:26 88:30]
  assign io_ram_req_valid = ~io_excp_storeUnalign & en; // @[LSU.scala 104:47]
  assign io_ram_req_bits_opcode = wen ? 3'h2 : 3'h4; // @[LSU.scala 107:34]
  assign io_ram_req_bits_address = _s0_reqReg_T ? io_req_bits_addr : s0_reqReg_addr; // @[LSU.scala 73:21]
  assign io_ram_req_bits_mask = 2'h2 == width ? 4'hf : _io_ram_req_bits_mask_T_12; // @[Mux.scala 81:58]
  assign io_ram_req_bits_data = _io_ram_req_bits_data_T_1[31:0]; // @[LSU.scala 106:26]
  assign io_ram_resp_ready = 1'h1; // @[LSU.scala 134:23]
  always @(posedge clock) begin
    if (_s0_reqReg_T) begin // @[Reg.scala 20:18]
      s0_reqReg_addr <= io_req_bits_addr; // @[Reg.scala 20:22]
    end
    if (_s0_reqReg_T) begin // @[Reg.scala 20:18]
      s0_reqReg_wdata <= io_req_bits_wdata; // @[Reg.scala 20:22]
    end
    if (_s0_reqReg_T) begin // @[Reg.scala 20:18]
      s0_reqReg_lsuOp <= io_req_bits_lsuOp; // @[Reg.scala 20:22]
    end
    if (en) begin // @[LSU.scala 125:20]
      s1_signed <= signed_; // @[LSU.scala 126:19]
    end
    if (en) begin // @[LSU.scala 125:20]
      if (_T_1) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h0;
      end else if (_T_3) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h1;
      end else if (_T_5) begin // @[Lookup.scala 34:39]
        s1_width <= 2'h2;
      end else begin
        s1_width <= _T_47;
      end
    end
    if (en) begin // @[LSU.scala 125:20]
      s1_offset <= offset; // @[LSU.scala 127:19]
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
  s0_reqReg_addr = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  s0_reqReg_wdata = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s0_reqReg_lsuOp = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  s1_signed = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_width = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  s1_offset = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  s1_respReg_data = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
