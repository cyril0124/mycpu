module TLXbar(
  input         clock,
  input         reset,
  output        io_masterFace_in_0_ready,
  input         io_masterFace_in_0_valid,
  input  [31:0] io_masterFace_in_0_bits_address,
  output        io_masterFace_in_1_ready,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [3:0]  io_masterFace_in_1_bits_mask,
  input  [31:0] io_masterFace_in_1_bits_data,
  output        io_masterFace_out_0_valid,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [31:0] io_masterFace_out_1_bits_data,
  input         io_slaveFace_in_0_ready,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output [31:0] io_slaveFace_in_0_bits_address,
  output [31:0] io_slaveFace_in_0_bits_data,
  input         io_slaveFace_in_1_ready,
  output        io_slaveFace_in_1_valid,
  output [2:0]  io_slaveFace_in_1_bits_opcode,
  output [31:0] io_slaveFace_in_1_bits_address,
  output [3:0]  io_slaveFace_in_1_bits_mask,
  output [31:0] io_slaveFace_in_1_bits_data,
  output        io_slaveFace_out_0_ready,
  input         io_slaveFace_out_0_valid,
  input  [31:0] io_slaveFace_out_0_bits_data,
  output        io_slaveFace_out_1_ready,
  input         io_slaveFace_out_1_valid,
  input  [31:0] io_slaveFace_out_1_bits_data
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
  wire  reqArb_clock; // @[Bus.scala 177:24]
  wire  reqArb_reset; // @[Bus.scala 177:24]
  wire  reqArb_io_reqs_1; // @[Bus.scala 177:24]
  wire [1:0] reqArb_io_grantOH; // @[Bus.scala 177:24]
  wire  reqMux_io_in_0_valid; // @[Bus.scala 180:24]
  wire [31:0] reqMux_io_in_0_bits_address; // @[Bus.scala 180:24]
  wire  reqMux_io_in_1_valid; // @[Bus.scala 180:24]
  wire [2:0] reqMux_io_in_1_bits_opcode; // @[Bus.scala 180:24]
  wire [31:0] reqMux_io_in_1_bits_address; // @[Bus.scala 180:24]
  wire [3:0] reqMux_io_in_1_bits_mask; // @[Bus.scala 180:24]
  wire [31:0] reqMux_io_in_1_bits_data; // @[Bus.scala 180:24]
  wire  reqMux_io_out_valid; // @[Bus.scala 180:24]
  wire [2:0] reqMux_io_out_bits_opcode; // @[Bus.scala 180:24]
  wire  reqMux_io_out_bits_source; // @[Bus.scala 180:24]
  wire [31:0] reqMux_io_out_bits_address; // @[Bus.scala 180:24]
  wire [3:0] reqMux_io_out_bits_mask; // @[Bus.scala 180:24]
  wire [31:0] reqMux_io_out_bits_data; // @[Bus.scala 180:24]
  wire  reqMux_io_choseOH_0; // @[Bus.scala 180:24]
  wire  reqMux_io_choseOH_1; // @[Bus.scala 180:24]
  wire  buf__clock; // @[Bus.scala 184:21]
  wire  buf__reset; // @[Bus.scala 184:21]
  wire  buf__io_enq_ready; // @[Bus.scala 184:21]
  wire  buf__io_enq_valid; // @[Bus.scala 184:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[Bus.scala 184:21]
  wire  buf__io_enq_bits_source; // @[Bus.scala 184:21]
  wire [31:0] buf__io_enq_bits_address; // @[Bus.scala 184:21]
  wire [3:0] buf__io_enq_bits_mask; // @[Bus.scala 184:21]
  wire [31:0] buf__io_enq_bits_data; // @[Bus.scala 184:21]
  wire  buf__io_deq_ready; // @[Bus.scala 184:21]
  wire  buf__io_deq_valid; // @[Bus.scala 184:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[Bus.scala 184:21]
  wire  buf__io_deq_bits_source; // @[Bus.scala 184:21]
  wire [31:0] buf__io_deq_bits_address; // @[Bus.scala 184:21]
  wire [3:0] buf__io_deq_bits_mask; // @[Bus.scala 184:21]
  wire [31:0] buf__io_deq_bits_data; // @[Bus.scala 184:21]
  wire [31:0] addrDec_io_addr; // @[Bus.scala 196:25]
  wire  addrDec_io_choseOH_0; // @[Bus.scala 196:25]
  wire  addrDec_io_choseOH_1; // @[Bus.scala 196:25]
  wire  slaveMux_io_in_0_ready; // @[Bus.scala 216:26]
  wire  slaveMux_io_in_0_valid; // @[Bus.scala 216:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[Bus.scala 216:26]
  wire  slaveMux_io_in_1_ready; // @[Bus.scala 216:26]
  wire  slaveMux_io_in_1_valid; // @[Bus.scala 216:26]
  wire [31:0] slaveMux_io_in_1_bits_data; // @[Bus.scala 216:26]
  wire  slaveMux_io_out_ready; // @[Bus.scala 216:26]
  wire  slaveMux_io_out_valid; // @[Bus.scala 216:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[Bus.scala 216:26]
  wire  slaveMux_io_choseOH_0; // @[Bus.scala 216:26]
  wire  slaveMux_io_choseOH_1; // @[Bus.scala 216:26]
  wire [1:0] _WIRE_1 = reqArb_io_grantOH; // @[Bus.scala 182:{52,52}]
  wire  _bufData_T = buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
  reg [2:0] bufData_r_opcode; // @[Reg.scala 19:16]
  reg  bufData_r_source; // @[Reg.scala 19:16]
  reg [31:0] bufData_r_address; // @[Reg.scala 19:16]
  reg [3:0] bufData_r_mask; // @[Reg.scala 19:16]
  reg [31:0] bufData_r_data; // @[Reg.scala 19:16]
  wire  _GEN_3 = _bufData_T ? buf__io_deq_bits_source : bufData_r_source; // @[Reg.scala 19:16 20:{18,22}]
  reg  bufValidReg; // @[Reg.scala 35:20]
  wire  _GEN_8 = _bufData_T | bufValidReg; // @[Reg.scala 36:18 35:20 36:22]
  wire [1:0] pendingMasterOH = 2'h1 << _GEN_3; // @[OneHot.scala 64:12]
  reg  pendingReq; // @[Bus.scala 194:29]
  wire  slaveRecVec_0 = io_slaveFace_in_0_ready & io_slaveFace_in_0_valid; // @[Decoupled.scala 51:35]
  wire  slaveRecVec_1 = io_slaveFace_in_1_ready & io_slaveFace_in_1_valid; // @[Decoupled.scala 51:35]
  wire  _slaveRecv_T = addrDec_io_choseOH_0 & slaveRecVec_0; // @[Bus.scala 201:79]
  wire  _slaveRecv_T_1 = addrDec_io_choseOH_1 & slaveRecVec_1; // @[Bus.scala 201:79]
  wire [1:0] _slaveRecv_T_2 = {_slaveRecv_T,_slaveRecv_T_1}; // @[Cat.scala 33:92]
  wire  slaveRecv = |_slaveRecv_T_2; // @[Bus.scala 201:87]
  wire  _GEN_9 = _bufData_T | pendingReq; // @[Bus.scala 202:27 194:29 202:40]
  wire [1:0] masterRecvVec = {io_masterFace_out_1_valid,io_masterFace_out_0_valid}; // @[Cat.scala 33:92]
  wire [1:0] _pendingFree_T = masterRecvVec & pendingMasterOH; // @[Bus.scala 206:38]
  wire  pendingFree = |_pendingFree_T; // @[Bus.scala 206:57]
  TLBusArbiter reqArb ( // @[Bus.scala 177:24]
    .clock(reqArb_clock),
    .reset(reqArb_reset),
    .io_reqs_1(reqArb_io_reqs_1),
    .io_grantOH(reqArb_io_grantOH)
  );
  TLBusMux reqMux ( // @[Bus.scala 180:24]
    .io_in_0_valid(reqMux_io_in_0_valid),
    .io_in_0_bits_address(reqMux_io_in_0_bits_address),
    .io_in_1_valid(reqMux_io_in_1_valid),
    .io_in_1_bits_opcode(reqMux_io_in_1_bits_opcode),
    .io_in_1_bits_address(reqMux_io_in_1_bits_address),
    .io_in_1_bits_mask(reqMux_io_in_1_bits_mask),
    .io_in_1_bits_data(reqMux_io_in_1_bits_data),
    .io_out_valid(reqMux_io_out_valid),
    .io_out_bits_opcode(reqMux_io_out_bits_opcode),
    .io_out_bits_source(reqMux_io_out_bits_source),
    .io_out_bits_address(reqMux_io_out_bits_address),
    .io_out_bits_mask(reqMux_io_out_bits_mask),
    .io_out_bits_data(reqMux_io_out_bits_data),
    .io_choseOH_0(reqMux_io_choseOH_0),
    .io_choseOH_1(reqMux_io_choseOH_1)
  );
  Queue buf_ ( // @[Bus.scala 184:21]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_enq_ready(buf__io_enq_ready),
    .io_enq_valid(buf__io_enq_valid),
    .io_enq_bits_opcode(buf__io_enq_bits_opcode),
    .io_enq_bits_source(buf__io_enq_bits_source),
    .io_enq_bits_address(buf__io_enq_bits_address),
    .io_enq_bits_mask(buf__io_enq_bits_mask),
    .io_enq_bits_data(buf__io_enq_bits_data),
    .io_deq_ready(buf__io_deq_ready),
    .io_deq_valid(buf__io_deq_valid),
    .io_deq_bits_opcode(buf__io_deq_bits_opcode),
    .io_deq_bits_source(buf__io_deq_bits_source),
    .io_deq_bits_address(buf__io_deq_bits_address),
    .io_deq_bits_mask(buf__io_deq_bits_mask),
    .io_deq_bits_data(buf__io_deq_bits_data)
  );
  TLAddrDecode addrDec ( // @[Bus.scala 196:25]
    .io_addr(addrDec_io_addr),
    .io_choseOH_0(addrDec_io_choseOH_0),
    .io_choseOH_1(addrDec_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[Bus.scala 216:26]
    .io_in_0_ready(slaveMux_io_in_0_ready),
    .io_in_0_valid(slaveMux_io_in_0_valid),
    .io_in_0_bits_data(slaveMux_io_in_0_bits_data),
    .io_in_1_ready(slaveMux_io_in_1_ready),
    .io_in_1_valid(slaveMux_io_in_1_valid),
    .io_in_1_bits_data(slaveMux_io_in_1_bits_data),
    .io_out_ready(slaveMux_io_out_ready),
    .io_out_valid(slaveMux_io_out_valid),
    .io_out_bits_data(slaveMux_io_out_bits_data),
    .io_choseOH_0(slaveMux_io_choseOH_0),
    .io_choseOH_1(slaveMux_io_choseOH_1)
  );
  assign io_masterFace_in_0_ready = buf__io_enq_ready & reqMux_io_choseOH_0; // @[Bus.scala 186:93]
  assign io_masterFace_in_1_ready = buf__io_enq_ready & reqMux_io_choseOH_1; // @[Bus.scala 186:93]
  assign io_masterFace_out_0_valid = slaveMux_io_out_valid & pendingMasterOH[0]; // @[Bus.scala 222:43]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 221:17]
  assign io_masterFace_out_1_valid = slaveMux_io_out_valid & pendingMasterOH[1]; // @[Bus.scala 222:43]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 221:17]
  assign io_slaveFace_in_0_valid = _GEN_8 & addrDec_io_choseOH_0; // @[Bus.scala 213:30]
  assign io_slaveFace_in_0_bits_opcode = _bufData_T ? buf__io_deq_bits_opcode : bufData_r_opcode; // @[Bus.scala 188:22]
  assign io_slaveFace_in_0_bits_address = _bufData_T ? buf__io_deq_bits_address : bufData_r_address; // @[Bus.scala 188:22]
  assign io_slaveFace_in_0_bits_data = _bufData_T ? buf__io_deq_bits_data : bufData_r_data; // @[Bus.scala 188:22]
  assign io_slaveFace_in_1_valid = _GEN_8 & addrDec_io_choseOH_1; // @[Bus.scala 213:30]
  assign io_slaveFace_in_1_bits_opcode = _bufData_T ? buf__io_deq_bits_opcode : bufData_r_opcode; // @[Bus.scala 188:22]
  assign io_slaveFace_in_1_bits_address = _bufData_T ? buf__io_deq_bits_address : bufData_r_address; // @[Bus.scala 188:22]
  assign io_slaveFace_in_1_bits_mask = _bufData_T ? buf__io_deq_bits_mask : bufData_r_mask; // @[Bus.scala 188:22]
  assign io_slaveFace_in_1_bits_data = _bufData_T ? buf__io_deq_bits_data : bufData_r_data; // @[Bus.scala 188:22]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[Bus.scala 217:20]
  assign io_slaveFace_out_1_ready = slaveMux_io_in_1_ready; // @[Bus.scala 217:20]
  assign reqArb_clock = clock;
  assign reqArb_reset = reset;
  assign reqArb_io_reqs_1 = io_masterFace_in_1_valid; // @[Bus.scala 178:58]
  assign reqMux_io_in_0_valid = io_masterFace_in_0_valid; // @[Bus.scala 181:58]
  assign reqMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[Bus.scala 181:58]
  assign reqMux_io_in_1_valid = io_masterFace_in_1_valid; // @[Bus.scala 181:58]
  assign reqMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[Bus.scala 181:58]
  assign reqMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[Bus.scala 181:58]
  assign reqMux_io_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[Bus.scala 181:58]
  assign reqMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[Bus.scala 181:58]
  assign reqMux_io_choseOH_0 = _WIRE_1[0]; // @[Bus.scala 182:52]
  assign reqMux_io_choseOH_1 = _WIRE_1[1]; // @[Bus.scala 182:52]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = reqMux_io_out_valid; // @[Bus.scala 185:16]
  assign buf__io_enq_bits_opcode = reqMux_io_out_bits_opcode; // @[Bus.scala 185:16]
  assign buf__io_enq_bits_source = reqMux_io_out_bits_source; // @[Bus.scala 185:16]
  assign buf__io_enq_bits_address = reqMux_io_out_bits_address; // @[Bus.scala 185:16]
  assign buf__io_enq_bits_mask = reqMux_io_out_bits_mask; // @[Bus.scala 185:16]
  assign buf__io_enq_bits_data = reqMux_io_out_bits_data; // @[Bus.scala 185:16]
  assign buf__io_deq_ready = ~pendingReq; // @[Bus.scala 209:25]
  assign addrDec_io_addr = _bufData_T ? buf__io_deq_bits_address : bufData_r_address; // @[Bus.scala 188:22]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[Bus.scala 217:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[Bus.scala 217:20]
  assign slaveMux_io_in_1_valid = io_slaveFace_out_1_valid; // @[Bus.scala 217:20]
  assign slaveMux_io_in_1_bits_data = io_slaveFace_out_1_bits_data; // @[Bus.scala 217:20]
  assign slaveMux_io_out_ready = pendingMasterOH[0] | pendingMasterOH[1]; // @[Mux.scala 27:73]
  assign slaveMux_io_choseOH_0 = addrDec_io_choseOH_0; // @[Bus.scala 218:25]
  assign slaveMux_io_choseOH_1 = addrDec_io_choseOH_1; // @[Bus.scala 218:25]
  always @(posedge clock) begin
    if (_bufData_T) begin // @[Reg.scala 20:18]
      bufData_r_opcode <= buf__io_deq_bits_opcode; // @[Reg.scala 20:22]
    end
    if (_bufData_T) begin // @[Reg.scala 20:18]
      bufData_r_source <= buf__io_deq_bits_source; // @[Reg.scala 20:22]
    end
    if (_bufData_T) begin // @[Reg.scala 20:18]
      bufData_r_address <= buf__io_deq_bits_address; // @[Reg.scala 20:22]
    end
    if (_bufData_T) begin // @[Reg.scala 20:18]
      bufData_r_mask <= buf__io_deq_bits_mask; // @[Reg.scala 20:22]
    end
    if (_bufData_T) begin // @[Reg.scala 20:18]
      bufData_r_data <= buf__io_deq_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Reg.scala 35:20]
      bufValidReg <= 1'h0; // @[Reg.scala 35:20]
    end else if (slaveRecv) begin // @[Bus.scala 203:21]
      bufValidReg <= 1'h0; // @[Bus.scala 203:36]
    end else begin
      bufValidReg <= _GEN_8;
    end
    if (reset) begin // @[Bus.scala 194:29]
      pendingReq <= 1'h0; // @[Bus.scala 194:29]
    end else if (pendingFree) begin // @[Bus.scala 207:22]
      pendingReq <= 1'h0; // @[Bus.scala 207:35]
    end else begin
      pendingReq <= _GEN_9;
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
  bufData_r_opcode = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  bufData_r_source = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  bufData_r_address = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  bufData_r_mask = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  bufData_r_data = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  bufValidReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  pendingReq = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
