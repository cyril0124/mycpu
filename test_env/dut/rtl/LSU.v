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
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  ram_clock; // @[LSU.scala 59:21]
  wire  ram_reset; // @[LSU.scala 59:21]
  wire  ram_wen; // @[LSU.scala 59:21]
  wire [31:0] ram_waddr; // @[LSU.scala 59:21]
  wire [31:0] ram_wdata; // @[LSU.scala 59:21]
  wire [3:0] ram_wmask; // @[LSU.scala 59:21]
  wire [31:0] ram_raddr; // @[LSU.scala 59:21]
  wire [31:0] ram_rdata; // @[LSU.scala 59:21]
  reg  signedReg; // @[LSU.scala 64:24]
  reg [1:0] widthReg; // @[LSU.scala 65:23]
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
  reg [1:0] offserReg; // @[LSU.scala 70:24]
  wire [1:0] offset = io_addr[1:0]; // @[LSU.scala 71:25]
  wire  _io_excp_storeUnalign_T_1 = offset == 2'h3; // @[LSU.scala 85:84]
  wire  _io_excp_storeUnalign_T_3 = offset != 2'h0; // @[LSU.scala 86:84]
  wire  _io_excp_storeUnalign_T_7 = 2'h2 == width ? _io_excp_storeUnalign_T_3 : 2'h1 == width &
    _io_excp_storeUnalign_T_1; // @[Mux.scala 81:58]
  wire [4:0] _ram_io_wdata_T = {offset, 3'h0}; // @[LSU.scala 102:41]
  wire [62:0] _GEN_4 = {{31'd0}, io_wdata}; // @[LSU.scala 102:30]
  wire [62:0] _ram_io_wdata_T_1 = _GEN_4 << _ram_io_wdata_T; // @[LSU.scala 102:30]
  wire [3:0] _ram_io_wmask_T_1 = 4'h1 << offset; // @[OneHot.scala 57:35]
  wire [2:0] _ram_io_wmask_T_6 = 2'h1 == offset ? 3'h6 : 3'h3; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_8 = 2'h2 == offset ? 4'hc : {{1'd0}, _ram_io_wmask_T_6}; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_10 = 2'h0 == width ? _ram_io_wmask_T_1 : 4'hf; // @[Mux.scala 81:58]
  wire [3:0] _ram_io_wmask_T_12 = 2'h1 == width ? _ram_io_wmask_T_8 : _ram_io_wmask_T_10; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_2 = {8'h0,ram_rdata[31:8]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_5 = {16'h0,ram_rdata[31:16]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_8 = {24'h0,ram_rdata[31:24]}; // @[Cat.scala 33:92]
  wire [31:0] _ramRdData_T_10 = 2'h1 == offserReg ? _ramRdData_T_2 : ram_rdata; // @[Mux.scala 81:58]
  wire [31:0] _ramRdData_T_12 = 2'h2 == offserReg ? _ramRdData_T_5 : _ramRdData_T_10; // @[Mux.scala 81:58]
  wire [31:0] ramRdData = 2'h3 == offserReg ? _ramRdData_T_8 : _ramRdData_T_12; // @[Mux.scala 81:58]
  wire [7:0] _io_data_T_1 = ramRdData[7:0]; // @[LSU.scala 146:83]
  wire  io_data_signBit = _io_data_T_1[7]; // @[util.scala 11:27]
  wire [5:0] io_data_out_lo_lo = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit}; // @[Cat.scala 33:92]
  wire [11:0] io_data_out_lo = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit,io_data_out_lo_lo}; // @[Cat.scala 33:92]
  wire [7:0] _io_data_out_T_1 = ramRdData[7:0]; // @[util.scala 15:75]
  wire [31:0] io_data_out = {io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,io_data_signBit,
    io_data_signBit,io_data_out_lo_lo,io_data_out_lo,_io_data_out_T_1}; // @[Cat.scala 33:92]
  wire [31:0] io_data_out_1 = {{24'd0}, ramRdData[7:0]}; // @[util.scala 31:36]
  wire [31:0] _io_data_T_3 = signedReg ? io_data_out : io_data_out_1; // @[LSU.scala 146:48]
  wire [15:0] _io_data_T_5 = ramRdData[15:0]; // @[LSU.scala 147:84]
  wire  io_data_signBit_1 = _io_data_T_5[15]; // @[util.scala 11:27]
  wire [7:0] io_data_out_lo_1 = {io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,
    io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1}; // @[Cat.scala 33:92]
  wire [15:0] _io_data_out_T_3 = ramRdData[15:0]; // @[util.scala 15:75]
  wire [31:0] io_data_out_2 = {io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1
    ,io_data_signBit_1,io_data_signBit_1,io_data_signBit_1,io_data_out_lo_1,_io_data_out_T_3}; // @[Cat.scala 33:92]
  wire [31:0] io_data_out_3 = {{16'd0}, ramRdData[15:0]}; // @[util.scala 31:36]
  wire [31:0] _io_data_T_7 = signedReg ? io_data_out_2 : io_data_out_3; // @[LSU.scala 147:48]
  wire [31:0] _io_data_T_10 = 2'h3 == offserReg ? _ramRdData_T_8 : _ramRdData_T_12; // @[util.scala 13:18]
  wire [31:0] _io_data_T_12 = signedReg ? _io_data_T_10 : ramRdData; // @[LSU.scala 148:48]
  wire [31:0] _io_data_T_14 = 2'h0 == widthReg ? _io_data_T_3 : ramRdData; // @[Mux.scala 81:58]
  wire [31:0] _io_data_T_16 = 2'h1 == widthReg ? _io_data_T_7 : _io_data_T_14; // @[Mux.scala 81:58]
  ROM #(.XLEN(32), .BLOCK_BYTES(4), .MEM_SIZE(1024), .MEM_WIDTH(10)) ram ( // @[LSU.scala 59:21]
    .clock(ram_clock),
    .reset(ram_reset),
    .wen(ram_wen),
    .waddr(ram_waddr),
    .wdata(ram_wdata),
    .wmask(ram_wmask),
    .raddr(ram_raddr),
    .rdata(ram_rdata)
  );
  assign io_data = 2'h2 == widthReg ? _io_data_T_12 : _io_data_T_16; // @[Mux.scala 81:58]
  assign io_excp_storeUnalign = wen & _io_excp_storeUnalign_T_7; // @[LSU.scala 83:15 80:26 84:30]
  assign ram_clock = clock; // @[LSU.scala 60:18]
  assign ram_reset = reset; // @[LSU.scala 61:18]
  assign ram_wen = wen & ~io_excp_storeUnalign; // @[LSU.scala 100:23]
  assign ram_waddr = io_addr - 32'h2000; // @[LSU.scala 101:29]
  assign ram_wdata = _ram_io_wdata_T_1[31:0]; // @[LSU.scala 102:18]
  assign ram_wmask = 2'h2 == width ? 4'hf : _ram_io_wmask_T_12; // @[Mux.scala 81:58]
  assign ram_raddr = io_addr - 32'h2000; // @[LSU.scala 136:29]
  always @(posedge clock) begin
    if (en) begin // @[LSU.scala 74:14]
      signedReg <= signed_; // @[LSU.scala 76:19]
    end
    if (en) begin // @[LSU.scala 74:14]
      if (_T_1) begin // @[Lookup.scala 34:39]
        widthReg <= 2'h0;
      end else if (_T_3) begin // @[Lookup.scala 34:39]
        widthReg <= 2'h1;
      end else if (_T_5) begin // @[Lookup.scala 34:39]
        widthReg <= 2'h2;
      end else begin
        widthReg <= _T_47;
      end
    end
    if (en) begin // @[LSU.scala 74:14]
      offserReg <= offset; // @[LSU.scala 75:19]
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
  widthReg = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  offserReg = _RAND_2[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
