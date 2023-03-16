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
  output        io_masterFace_cs_0,
  output        io_masterFace_cs_1,
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
`endif // RANDOMIZE_REG_INIT
  wire  reqArb_clock; // @[Bus.scala 171:24]
  wire  reqArb_reset; // @[Bus.scala 171:24]
  wire  reqArb_io_reqs_1; // @[Bus.scala 171:24]
  wire [1:0] reqArb_io_grantOH; // @[Bus.scala 171:24]
  wire  reqMux_io_in_0_valid; // @[Bus.scala 174:24]
  wire [31:0] reqMux_io_in_0_bits_address; // @[Bus.scala 174:24]
  wire  reqMux_io_in_1_valid; // @[Bus.scala 174:24]
  wire [2:0] reqMux_io_in_1_bits_opcode; // @[Bus.scala 174:24]
  wire [31:0] reqMux_io_in_1_bits_address; // @[Bus.scala 174:24]
  wire [3:0] reqMux_io_in_1_bits_mask; // @[Bus.scala 174:24]
  wire [31:0] reqMux_io_in_1_bits_data; // @[Bus.scala 174:24]
  wire  reqMux_io_out_valid; // @[Bus.scala 174:24]
  wire [2:0] reqMux_io_out_bits_opcode; // @[Bus.scala 174:24]
  wire  reqMux_io_out_bits_source; // @[Bus.scala 174:24]
  wire [31:0] reqMux_io_out_bits_address; // @[Bus.scala 174:24]
  wire [3:0] reqMux_io_out_bits_mask; // @[Bus.scala 174:24]
  wire [31:0] reqMux_io_out_bits_data; // @[Bus.scala 174:24]
  wire  reqMux_io_choseOH_0; // @[Bus.scala 174:24]
  wire  reqMux_io_choseOH_1; // @[Bus.scala 174:24]
  wire  buf__clock; // @[Bus.scala 178:21]
  wire  buf__reset; // @[Bus.scala 178:21]
  wire  buf__io_enq_ready; // @[Bus.scala 178:21]
  wire  buf__io_enq_valid; // @[Bus.scala 178:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[Bus.scala 178:21]
  wire  buf__io_enq_bits_source; // @[Bus.scala 178:21]
  wire [31:0] buf__io_enq_bits_address; // @[Bus.scala 178:21]
  wire [3:0] buf__io_enq_bits_mask; // @[Bus.scala 178:21]
  wire [31:0] buf__io_enq_bits_data; // @[Bus.scala 178:21]
  wire  buf__io_deq_ready; // @[Bus.scala 178:21]
  wire  buf__io_deq_valid; // @[Bus.scala 178:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[Bus.scala 178:21]
  wire  buf__io_deq_bits_source; // @[Bus.scala 178:21]
  wire [31:0] buf__io_deq_bits_address; // @[Bus.scala 178:21]
  wire [3:0] buf__io_deq_bits_mask; // @[Bus.scala 178:21]
  wire [31:0] buf__io_deq_bits_data; // @[Bus.scala 178:21]
  wire [31:0] addressDec_io_addr; // @[Bus.scala 187:28]
  wire  addressDec_io_choseOH_0; // @[Bus.scala 187:28]
  wire  addressDec_io_choseOH_1; // @[Bus.scala 187:28]
  wire  reqAlloc_io_out_0_ready; // @[Bus.scala 196:26]
  wire  reqAlloc_io_out_0_valid; // @[Bus.scala 196:26]
  wire [2:0] reqAlloc_io_out_0_bits_opcode; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_out_0_bits_address; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_out_0_bits_data; // @[Bus.scala 196:26]
  wire  reqAlloc_io_out_1_ready; // @[Bus.scala 196:26]
  wire  reqAlloc_io_out_1_valid; // @[Bus.scala 196:26]
  wire [2:0] reqAlloc_io_out_1_bits_opcode; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_out_1_bits_address; // @[Bus.scala 196:26]
  wire [3:0] reqAlloc_io_out_1_bits_mask; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_out_1_bits_data; // @[Bus.scala 196:26]
  wire  reqAlloc_io_in_ready; // @[Bus.scala 196:26]
  wire  reqAlloc_io_in_valid; // @[Bus.scala 196:26]
  wire [2:0] reqAlloc_io_in_bits_opcode; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_in_bits_address; // @[Bus.scala 196:26]
  wire [3:0] reqAlloc_io_in_bits_mask; // @[Bus.scala 196:26]
  wire [31:0] reqAlloc_io_in_bits_data; // @[Bus.scala 196:26]
  wire  reqAlloc_io_choseOH_0; // @[Bus.scala 196:26]
  wire  reqAlloc_io_choseOH_1; // @[Bus.scala 196:26]
  wire  slaveMux_io_in_0_ready; // @[Bus.scala 207:26]
  wire  slaveMux_io_in_0_valid; // @[Bus.scala 207:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[Bus.scala 207:26]
  wire  slaveMux_io_in_1_ready; // @[Bus.scala 207:26]
  wire  slaveMux_io_in_1_valid; // @[Bus.scala 207:26]
  wire [31:0] slaveMux_io_in_1_bits_data; // @[Bus.scala 207:26]
  wire  slaveMux_io_out_ready; // @[Bus.scala 207:26]
  wire  slaveMux_io_out_valid; // @[Bus.scala 207:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[Bus.scala 207:26]
  wire  slaveMux_io_choseOH_0; // @[Bus.scala 207:26]
  wire  slaveMux_io_choseOH_1; // @[Bus.scala 207:26]
  wire [1:0] _WIRE_1 = reqArb_io_grantOH; // @[Bus.scala 176:{52,52}]
  wire  _lastSource_T = buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
  reg  lastSource; // @[Reg.scala 19:16]
  reg  lastSlaveOH_0; // @[Reg.scala 19:16]
  reg  lastSlaveOH_1; // @[Reg.scala 19:16]
  wire [1:0] sourceChoseOH_choseOH = 2'h1 << lastSource; // @[OneHot.scala 64:12]
  wire  sourceChoseOH_0 = sourceChoseOH_choseOH[0]; // @[Bus.scala 212:49]
  wire  sourceChoseOH_1 = sourceChoseOH_choseOH[1]; // @[Bus.scala 212:49]
  TLBusArbiter reqArb ( // @[Bus.scala 171:24]
    .clock(reqArb_clock),
    .reset(reqArb_reset),
    .io_reqs_1(reqArb_io_reqs_1),
    .io_grantOH(reqArb_io_grantOH)
  );
  TLBusMux reqMux ( // @[Bus.scala 174:24]
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
  Queue buf_ ( // @[Bus.scala 178:21]
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
  TLAddrDecode addressDec ( // @[Bus.scala 187:28]
    .io_addr(addressDec_io_addr),
    .io_choseOH_0(addressDec_io_choseOH_0),
    .io_choseOH_1(addressDec_io_choseOH_1)
  );
  TLBusAlloc reqAlloc ( // @[Bus.scala 196:26]
    .io_out_0_ready(reqAlloc_io_out_0_ready),
    .io_out_0_valid(reqAlloc_io_out_0_valid),
    .io_out_0_bits_opcode(reqAlloc_io_out_0_bits_opcode),
    .io_out_0_bits_address(reqAlloc_io_out_0_bits_address),
    .io_out_0_bits_data(reqAlloc_io_out_0_bits_data),
    .io_out_1_ready(reqAlloc_io_out_1_ready),
    .io_out_1_valid(reqAlloc_io_out_1_valid),
    .io_out_1_bits_opcode(reqAlloc_io_out_1_bits_opcode),
    .io_out_1_bits_address(reqAlloc_io_out_1_bits_address),
    .io_out_1_bits_mask(reqAlloc_io_out_1_bits_mask),
    .io_out_1_bits_data(reqAlloc_io_out_1_bits_data),
    .io_in_ready(reqAlloc_io_in_ready),
    .io_in_valid(reqAlloc_io_in_valid),
    .io_in_bits_opcode(reqAlloc_io_in_bits_opcode),
    .io_in_bits_address(reqAlloc_io_in_bits_address),
    .io_in_bits_mask(reqAlloc_io_in_bits_mask),
    .io_in_bits_data(reqAlloc_io_in_bits_data),
    .io_choseOH_0(reqAlloc_io_choseOH_0),
    .io_choseOH_1(reqAlloc_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[Bus.scala 207:26]
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
  assign io_masterFace_in_0_ready = buf__io_enq_ready & reqMux_io_choseOH_0; // @[Bus.scala 180:93]
  assign io_masterFace_in_1_ready = buf__io_enq_ready & reqMux_io_choseOH_1; // @[Bus.scala 180:93]
  assign io_masterFace_out_0_valid = sourceChoseOH_0 & slaveMux_io_out_valid; // @[Bus.scala 224:41]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 216:17]
  assign io_masterFace_out_1_valid = sourceChoseOH_1 & slaveMux_io_out_valid; // @[Bus.scala 225:41]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 216:17]
  assign io_masterFace_cs_0 = sourceChoseOH_choseOH[0]; // @[Bus.scala 212:49]
  assign io_masterFace_cs_1 = sourceChoseOH_choseOH[1]; // @[Bus.scala 212:49]
  assign io_slaveFace_in_0_valid = reqAlloc_io_out_0_valid; // @[Bus.scala 198:21]
  assign io_slaveFace_in_0_bits_opcode = reqAlloc_io_out_0_bits_opcode; // @[Bus.scala 198:21]
  assign io_slaveFace_in_0_bits_address = reqAlloc_io_out_0_bits_address; // @[Bus.scala 198:21]
  assign io_slaveFace_in_0_bits_data = reqAlloc_io_out_0_bits_data; // @[Bus.scala 198:21]
  assign io_slaveFace_in_1_valid = reqAlloc_io_out_1_valid; // @[Bus.scala 198:21]
  assign io_slaveFace_in_1_bits_opcode = reqAlloc_io_out_1_bits_opcode; // @[Bus.scala 198:21]
  assign io_slaveFace_in_1_bits_address = reqAlloc_io_out_1_bits_address; // @[Bus.scala 198:21]
  assign io_slaveFace_in_1_bits_mask = reqAlloc_io_out_1_bits_mask; // @[Bus.scala 198:21]
  assign io_slaveFace_in_1_bits_data = reqAlloc_io_out_1_bits_data; // @[Bus.scala 198:21]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[Bus.scala 208:20]
  assign io_slaveFace_out_1_ready = slaveMux_io_in_1_ready; // @[Bus.scala 208:20]
  assign reqArb_clock = clock;
  assign reqArb_reset = reset;
  assign reqArb_io_reqs_1 = io_masterFace_in_1_valid; // @[Bus.scala 172:58]
  assign reqMux_io_in_0_valid = io_masterFace_in_0_valid; // @[Bus.scala 175:58]
  assign reqMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[Bus.scala 175:58]
  assign reqMux_io_in_1_valid = io_masterFace_in_1_valid; // @[Bus.scala 175:58]
  assign reqMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[Bus.scala 175:58]
  assign reqMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[Bus.scala 175:58]
  assign reqMux_io_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[Bus.scala 175:58]
  assign reqMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[Bus.scala 175:58]
  assign reqMux_io_choseOH_0 = _WIRE_1[0]; // @[Bus.scala 176:52]
  assign reqMux_io_choseOH_1 = _WIRE_1[1]; // @[Bus.scala 176:52]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = reqMux_io_out_valid; // @[Bus.scala 179:16]
  assign buf__io_enq_bits_opcode = reqMux_io_out_bits_opcode; // @[Bus.scala 179:16]
  assign buf__io_enq_bits_source = reqMux_io_out_bits_source; // @[Bus.scala 179:16]
  assign buf__io_enq_bits_address = reqMux_io_out_bits_address; // @[Bus.scala 179:16]
  assign buf__io_enq_bits_mask = reqMux_io_out_bits_mask; // @[Bus.scala 179:16]
  assign buf__io_enq_bits_data = reqMux_io_out_bits_data; // @[Bus.scala 179:16]
  assign buf__io_deq_ready = reqAlloc_io_in_ready; // @[Bus.scala 197:20]
  assign addressDec_io_addr = buf__io_deq_bits_address; // @[Bus.scala 188:24]
  assign reqAlloc_io_out_0_ready = io_slaveFace_in_0_ready; // @[Bus.scala 198:21]
  assign reqAlloc_io_out_1_ready = io_slaveFace_in_1_ready; // @[Bus.scala 198:21]
  assign reqAlloc_io_in_valid = buf__io_deq_valid; // @[Bus.scala 197:20]
  assign reqAlloc_io_in_bits_opcode = buf__io_deq_bits_opcode; // @[Bus.scala 197:20]
  assign reqAlloc_io_in_bits_address = buf__io_deq_bits_address; // @[Bus.scala 197:20]
  assign reqAlloc_io_in_bits_mask = buf__io_deq_bits_mask; // @[Bus.scala 197:20]
  assign reqAlloc_io_in_bits_data = buf__io_deq_bits_data; // @[Bus.scala 197:20]
  assign reqAlloc_io_choseOH_0 = addressDec_io_choseOH_0; // @[Bus.scala 199:25]
  assign reqAlloc_io_choseOH_1 = addressDec_io_choseOH_1; // @[Bus.scala 199:25]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[Bus.scala 208:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[Bus.scala 208:20]
  assign slaveMux_io_in_1_valid = io_slaveFace_out_1_valid; // @[Bus.scala 208:20]
  assign slaveMux_io_in_1_bits_data = io_slaveFace_out_1_bits_data; // @[Bus.scala 208:20]
  assign slaveMux_io_out_ready = sourceChoseOH_1 | sourceChoseOH_0; // @[Bus.scala 217:32 219:35]
  assign slaveMux_io_choseOH_0 = lastSlaveOH_0; // @[Bus.scala 210:25]
  assign slaveMux_io_choseOH_1 = lastSlaveOH_1; // @[Bus.scala 210:25]
  always @(posedge clock) begin
    if (_lastSource_T) begin // @[Reg.scala 20:18]
      lastSource <= buf__io_deq_bits_source; // @[Reg.scala 20:22]
    end
    if (_lastSource_T) begin // @[Reg.scala 20:18]
      lastSlaveOH_0 <= addressDec_io_choseOH_0; // @[Reg.scala 20:22]
    end
    if (_lastSource_T) begin // @[Reg.scala 20:18]
      lastSlaveOH_1 <= addressDec_io_choseOH_1; // @[Reg.scala 20:22]
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
  lastSource = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lastSlaveOH_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lastSlaveOH_1 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
