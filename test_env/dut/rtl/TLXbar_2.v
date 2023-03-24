module TLXbar_2(
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
  wire  reqArb_clock; // @[Bus.scala 353:24]
  wire  reqArb_reset; // @[Bus.scala 353:24]
  wire  reqArb_io_reqs_1; // @[Bus.scala 353:24]
  wire [1:0] reqArb_io_grantOH; // @[Bus.scala 353:24]
  wire  reqMux_io_in_0_ready; // @[Bus.scala 356:24]
  wire  reqMux_io_in_0_valid; // @[Bus.scala 356:24]
  wire [31:0] reqMux_io_in_0_bits_address; // @[Bus.scala 356:24]
  wire  reqMux_io_in_1_ready; // @[Bus.scala 356:24]
  wire  reqMux_io_in_1_valid; // @[Bus.scala 356:24]
  wire [2:0] reqMux_io_in_1_bits_opcode; // @[Bus.scala 356:24]
  wire [31:0] reqMux_io_in_1_bits_address; // @[Bus.scala 356:24]
  wire [3:0] reqMux_io_in_1_bits_mask; // @[Bus.scala 356:24]
  wire [31:0] reqMux_io_in_1_bits_data; // @[Bus.scala 356:24]
  wire  reqMux_io_out_ready; // @[Bus.scala 356:24]
  wire  reqMux_io_out_valid; // @[Bus.scala 356:24]
  wire [2:0] reqMux_io_out_bits_opcode; // @[Bus.scala 356:24]
  wire [3:0] reqMux_io_out_bits_size; // @[Bus.scala 356:24]
  wire  reqMux_io_out_bits_source; // @[Bus.scala 356:24]
  wire [31:0] reqMux_io_out_bits_address; // @[Bus.scala 356:24]
  wire [3:0] reqMux_io_out_bits_mask; // @[Bus.scala 356:24]
  wire [31:0] reqMux_io_out_bits_data; // @[Bus.scala 356:24]
  wire  reqMux_io_choseOH_0; // @[Bus.scala 356:24]
  wire  reqMux_io_choseOH_1; // @[Bus.scala 356:24]
  wire  buf__clock; // @[Bus.scala 362:21]
  wire  buf__reset; // @[Bus.scala 362:21]
  wire  buf__io_enq_ready; // @[Bus.scala 362:21]
  wire  buf__io_enq_valid; // @[Bus.scala 362:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[Bus.scala 362:21]
  wire [3:0] buf__io_enq_bits_size; // @[Bus.scala 362:21]
  wire  buf__io_enq_bits_source; // @[Bus.scala 362:21]
  wire [31:0] buf__io_enq_bits_address; // @[Bus.scala 362:21]
  wire [3:0] buf__io_enq_bits_mask; // @[Bus.scala 362:21]
  wire [31:0] buf__io_enq_bits_data; // @[Bus.scala 362:21]
  wire  buf__io_deq_ready; // @[Bus.scala 362:21]
  wire  buf__io_deq_valid; // @[Bus.scala 362:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[Bus.scala 362:21]
  wire [3:0] buf__io_deq_bits_size; // @[Bus.scala 362:21]
  wire  buf__io_deq_bits_source; // @[Bus.scala 362:21]
  wire [31:0] buf__io_deq_bits_address; // @[Bus.scala 362:21]
  wire [3:0] buf__io_deq_bits_mask; // @[Bus.scala 362:21]
  wire [31:0] buf__io_deq_bits_data; // @[Bus.scala 362:21]
  wire [31:0] addrDec_io_addr; // @[Bus.scala 382:25]
  wire  addrDec_io_choseOH_0; // @[Bus.scala 382:25]
  wire  addrDec_io_choseOH_1; // @[Bus.scala 382:25]
  wire  slaveMux_io_in_0_ready; // @[Bus.scala 422:26]
  wire  slaveMux_io_in_0_valid; // @[Bus.scala 422:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[Bus.scala 422:26]
  wire  slaveMux_io_in_1_ready; // @[Bus.scala 422:26]
  wire  slaveMux_io_in_1_valid; // @[Bus.scala 422:26]
  wire [31:0] slaveMux_io_in_1_bits_data; // @[Bus.scala 422:26]
  wire  slaveMux_io_out_ready; // @[Bus.scala 422:26]
  wire  slaveMux_io_out_valid; // @[Bus.scala 422:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[Bus.scala 422:26]
  wire  slaveMux_io_choseOH_0; // @[Bus.scala 422:26]
  wire  slaveMux_io_choseOH_1; // @[Bus.scala 422:26]
  wire [1:0] _WIRE_1 = reqArb_io_grantOH; // @[Bus.scala 358:{52,52}]
  reg  s1_ready; // @[Bus.scala 369:27]
  wire  s1_latch = buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
  reg  s1_reqValid; // @[Reg.scala 35:20]
  wire  _GEN_0 = s1_latch | s1_reqValid; // @[Reg.scala 36:18 35:20 36:22]
  reg [2:0] s1_req_opcode; // @[Reg.scala 19:16]
  reg [3:0] s1_req_size; // @[Reg.scala 19:16]
  reg  s1_req_source; // @[Reg.scala 19:16]
  reg [31:0] s1_req_address; // @[Reg.scala 19:16]
  reg [3:0] s1_req_mask; // @[Reg.scala 19:16]
  reg [31:0] s1_req_data; // @[Reg.scala 19:16]
  wire [1:0] s1_beatSize = s1_req_size[3:2]; // @[Bus.scala 375:35]
  wire  _GEN_9 = s1_latch ? 1'h0 : s1_ready; // @[Bus.scala 378:20 379:18 369:27]
  reg [3:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire  _s1_slaveRecVec_T = io_slaveFace_in_0_ready & io_slaveFace_in_0_valid; // @[Decoupled.scala 51:35]
  wire  _s1_slaveRecVec_T_1 = io_slaveFace_in_1_ready & io_slaveFace_in_1_valid; // @[Decoupled.scala 51:35]
  wire [1:0] s1_slaveRecVec = {_s1_slaveRecVec_T_1,_s1_slaveRecVec_T}; // @[Cat.scala 33:92]
  wire [1:0] _s1_slaveRecv_T = {addrDec_io_choseOH_1,addrDec_io_choseOH_0}; // @[Bus.scala 393:59]
  wire [1:0] _s1_slaveRecv_T_1 = s1_slaveRecVec & _s1_slaveRecv_T; // @[Bus.scala 393:40]
  wire  s1_slaveRecv = |_s1_slaveRecv_T_1; // @[Bus.scala 393:67]
  wire [1:0] _s1_lastBeat_T_1 = s1_beatSize - 2'h1; // @[Bus.scala 394:60]
  wire [3:0] _GEN_2 = {{2'd0}, _s1_lastBeat_T_1}; // @[Bus.scala 394:44]
  wire  s1_lastBeat = s1_beatCounter_value == _GEN_2; // @[Bus.scala 394:44]
  wire  wrap = s1_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_1 = s1_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  wire  _s1_valid_T_4 = s1_slaveRecv & s1_req_opcode == 3'h4; // @[Bus.scala 400:50]
  wire  s1_valid = s1_reqValid & (s1_slaveRecv & s1_lastBeat & s1_req_opcode == 3'h2 | _s1_valid_T_4); // @[Bus.scala 399:32]
  reg  s2_ready; // @[Bus.scala 406:27]
  wire  s2_latch = s2_ready & s1_valid; // @[Bus.scala 407:29]
  reg  s2_reqValid; // @[Reg.scala 35:20]
  wire  _GEN_12 = s2_latch | s2_reqValid; // @[Reg.scala 36:18 35:20 36:22]
  reg  s2_chosenSlaveOH_0; // @[Reg.scala 19:16]
  reg  s2_chosenSlaveOH_1; // @[Reg.scala 19:16]
  reg [2:0] s2_opcode; // @[Reg.scala 19:16]
  reg [1:0] s2_beatSize; // @[Reg.scala 19:16]
  wire [1:0] _s2_chosenMasterOH_T = 2'h1 << s1_req_source; // @[OneHot.scala 57:35]
  reg [1:0] s2_chosenMasterOH; // @[Reg.scala 19:16]
  wire  _GEN_18 = s2_latch ? 1'h0 : s2_ready; // @[Bus.scala 414:20 415:18 406:27]
  wire  _GEN_19 = s2_latch | _GEN_9; // @[Bus.scala 414:20 417:18]
  reg [3:0] s2_beatCounter_value; // @[Counter.scala 61:40]
  wire [1:0] s2_masterRecvVec = {io_masterFace_out_1_valid,io_masterFace_out_0_valid}; // @[Cat.scala 33:92]
  wire [1:0] _s2_masterRecv_T = s2_masterRecvVec & s2_chosenMasterOH; // @[Bus.scala 434:43]
  wire  s2_masterRecv = |_s2_masterRecv_T; // @[Bus.scala 434:64]
  wire [1:0] _s2_lastBeat_T_1 = s2_beatSize - 2'h1; // @[Bus.scala 435:60]
  wire [3:0] _GEN_7 = {{2'd0}, _s2_lastBeat_T_1}; // @[Bus.scala 435:44]
  wire  s2_lastBeat = s2_beatCounter_value == _GEN_7; // @[Bus.scala 435:44]
  wire  wrap_1 = s2_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_3 = s2_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  wire  _s2_valid_T_4 = s2_opcode == 3'h4 & s2_masterRecv & s2_lastBeat; // @[Bus.scala 441:72]
  wire  s2_valid = s2_reqValid & (s2_opcode == 3'h2 & s2_masterRecv | _s2_valid_T_4); // @[Bus.scala 440:32]
  wire  _GEN_24 = s2_valid | _GEN_18; // @[Bus.scala 444:20 445:18]
  TLBusArbiter reqArb ( // @[Bus.scala 353:24]
    .clock(reqArb_clock),
    .reset(reqArb_reset),
    .io_reqs_1(reqArb_io_reqs_1),
    .io_grantOH(reqArb_io_grantOH)
  );
  TLBusMux reqMux ( // @[Bus.scala 356:24]
    .io_in_0_ready(reqMux_io_in_0_ready),
    .io_in_0_valid(reqMux_io_in_0_valid),
    .io_in_0_bits_address(reqMux_io_in_0_bits_address),
    .io_in_1_ready(reqMux_io_in_1_ready),
    .io_in_1_valid(reqMux_io_in_1_valid),
    .io_in_1_bits_opcode(reqMux_io_in_1_bits_opcode),
    .io_in_1_bits_address(reqMux_io_in_1_bits_address),
    .io_in_1_bits_mask(reqMux_io_in_1_bits_mask),
    .io_in_1_bits_data(reqMux_io_in_1_bits_data),
    .io_out_ready(reqMux_io_out_ready),
    .io_out_valid(reqMux_io_out_valid),
    .io_out_bits_opcode(reqMux_io_out_bits_opcode),
    .io_out_bits_size(reqMux_io_out_bits_size),
    .io_out_bits_source(reqMux_io_out_bits_source),
    .io_out_bits_address(reqMux_io_out_bits_address),
    .io_out_bits_mask(reqMux_io_out_bits_mask),
    .io_out_bits_data(reqMux_io_out_bits_data),
    .io_choseOH_0(reqMux_io_choseOH_0),
    .io_choseOH_1(reqMux_io_choseOH_1)
  );
  Queue buf_ ( // @[Bus.scala 362:21]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_enq_ready(buf__io_enq_ready),
    .io_enq_valid(buf__io_enq_valid),
    .io_enq_bits_opcode(buf__io_enq_bits_opcode),
    .io_enq_bits_size(buf__io_enq_bits_size),
    .io_enq_bits_source(buf__io_enq_bits_source),
    .io_enq_bits_address(buf__io_enq_bits_address),
    .io_enq_bits_mask(buf__io_enq_bits_mask),
    .io_enq_bits_data(buf__io_enq_bits_data),
    .io_deq_ready(buf__io_deq_ready),
    .io_deq_valid(buf__io_deq_valid),
    .io_deq_bits_opcode(buf__io_deq_bits_opcode),
    .io_deq_bits_size(buf__io_deq_bits_size),
    .io_deq_bits_source(buf__io_deq_bits_source),
    .io_deq_bits_address(buf__io_deq_bits_address),
    .io_deq_bits_mask(buf__io_deq_bits_mask),
    .io_deq_bits_data(buf__io_deq_bits_data)
  );
  TLAddrDecode addrDec ( // @[Bus.scala 382:25]
    .io_addr(addrDec_io_addr),
    .io_choseOH_0(addrDec_io_choseOH_0),
    .io_choseOH_1(addrDec_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[Bus.scala 422:26]
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
  assign io_masterFace_in_0_ready = reqMux_io_in_0_ready; // @[Bus.scala 357:58]
  assign io_masterFace_in_1_ready = reqMux_io_in_1_ready; // @[Bus.scala 357:58]
  assign io_masterFace_out_0_valid = slaveMux_io_out_valid & s2_chosenMasterOH[0] & s2_reqValid; // @[Bus.scala 428:67]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 427:17]
  assign io_masterFace_out_1_valid = slaveMux_io_out_valid & s2_chosenMasterOH[1] & s2_reqValid; // @[Bus.scala 428:67]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 427:17]
  assign io_slaveFace_in_0_valid = addrDec_io_choseOH_0 & s1_reqValid; // @[Bus.scala 388:41]
  assign io_slaveFace_in_0_bits_opcode = s1_req_opcode; // @[Bus.scala 387:18]
  assign io_slaveFace_in_0_bits_address = s1_req_address; // @[Bus.scala 387:18]
  assign io_slaveFace_in_0_bits_data = s1_req_data; // @[Bus.scala 387:18]
  assign io_slaveFace_in_1_valid = addrDec_io_choseOH_1 & s1_reqValid; // @[Bus.scala 388:41]
  assign io_slaveFace_in_1_bits_opcode = s1_req_opcode; // @[Bus.scala 387:18]
  assign io_slaveFace_in_1_bits_address = s1_req_address; // @[Bus.scala 387:18]
  assign io_slaveFace_in_1_bits_mask = s1_req_mask; // @[Bus.scala 387:18]
  assign io_slaveFace_in_1_bits_data = s1_req_data; // @[Bus.scala 387:18]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[Bus.scala 423:20]
  assign io_slaveFace_out_1_ready = slaveMux_io_in_1_ready; // @[Bus.scala 423:20]
  assign reqArb_clock = clock;
  assign reqArb_reset = reset;
  assign reqArb_io_reqs_1 = io_masterFace_in_1_valid; // @[Bus.scala 354:58]
  assign reqMux_io_in_0_valid = io_masterFace_in_0_valid; // @[Bus.scala 357:58]
  assign reqMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[Bus.scala 357:58]
  assign reqMux_io_in_1_valid = io_masterFace_in_1_valid; // @[Bus.scala 357:58]
  assign reqMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[Bus.scala 357:58]
  assign reqMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[Bus.scala 357:58]
  assign reqMux_io_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[Bus.scala 357:58]
  assign reqMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[Bus.scala 357:58]
  assign reqMux_io_out_ready = buf__io_enq_ready; // @[Bus.scala 363:16]
  assign reqMux_io_choseOH_0 = _WIRE_1[0]; // @[Bus.scala 358:52]
  assign reqMux_io_choseOH_1 = _WIRE_1[1]; // @[Bus.scala 358:52]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = reqMux_io_out_valid; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_opcode = reqMux_io_out_bits_opcode; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_size = reqMux_io_out_bits_size; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_source = reqMux_io_out_bits_source; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_address = reqMux_io_out_bits_address; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_mask = reqMux_io_out_bits_mask; // @[Bus.scala 363:16]
  assign buf__io_enq_bits_data = reqMux_io_out_bits_data; // @[Bus.scala 363:16]
  assign buf__io_deq_ready = s1_ready; // @[Bus.scala 371:22]
  assign addrDec_io_addr = s1_req_address; // @[Bus.scala 384:21]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[Bus.scala 423:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[Bus.scala 423:20]
  assign slaveMux_io_in_1_valid = io_slaveFace_out_1_valid; // @[Bus.scala 423:20]
  assign slaveMux_io_in_1_bits_data = io_slaveFace_out_1_bits_data; // @[Bus.scala 423:20]
  assign slaveMux_io_out_ready = s2_chosenMasterOH[0] | s2_chosenMasterOH[1]; // @[Mux.scala 27:73]
  assign slaveMux_io_choseOH_0 = s2_chosenSlaveOH_0; // @[Bus.scala 424:25]
  assign slaveMux_io_choseOH_1 = s2_chosenSlaveOH_1; // @[Bus.scala 424:25]
  always @(posedge clock) begin
    s1_ready <= reset | _GEN_19; // @[Bus.scala 369:{27,27}]
    if (reset) begin // @[Reg.scala 35:20]
      s1_reqValid <= 1'h0; // @[Reg.scala 35:20]
    end else if (s2_latch) begin // @[Bus.scala 414:20]
      s1_reqValid <= 1'h0; // @[Bus.scala 418:21]
    end else begin
      s1_reqValid <= _GEN_0;
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_opcode <= buf__io_deq_bits_opcode; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_size <= buf__io_deq_bits_size; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_source <= buf__io_deq_bits_source; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_address <= buf__io_deq_bits_address; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_mask <= buf__io_deq_bits_mask; // @[Reg.scala 20:22]
    end
    if (s1_latch) begin // @[Reg.scala 20:18]
      s1_req_data <= buf__io_deq_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s2_latch) begin // @[Bus.scala 414:20]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s1_slaveRecv) begin // @[Bus.scala 395:24]
      if (wrap) begin // @[Counter.scala 87:20]
        s1_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s1_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    s2_ready <= reset | _GEN_24; // @[Bus.scala 406:{27,27}]
    if (reset) begin // @[Reg.scala 35:20]
      s2_reqValid <= 1'h0; // @[Reg.scala 35:20]
    end else if (s2_valid) begin // @[Bus.scala 444:20]
      s2_reqValid <= 1'h0; // @[Bus.scala 446:21]
    end else begin
      s2_reqValid <= _GEN_12;
    end
    if (s2_latch) begin // @[Reg.scala 20:18]
      s2_chosenSlaveOH_0 <= addrDec_io_choseOH_0; // @[Reg.scala 20:22]
    end
    if (s2_latch) begin // @[Reg.scala 20:18]
      s2_chosenSlaveOH_1 <= addrDec_io_choseOH_1; // @[Reg.scala 20:22]
    end
    if (s2_latch) begin // @[Reg.scala 20:18]
      s2_opcode <= s1_req_opcode; // @[Reg.scala 20:22]
    end
    if (s2_latch) begin // @[Reg.scala 20:18]
      s2_beatSize <= s1_beatSize; // @[Reg.scala 20:22]
    end
    if (s2_latch) begin // @[Reg.scala 20:18]
      s2_chosenMasterOH <= _s2_chosenMasterOH_T; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Counter.scala 61:40]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s2_valid) begin // @[Bus.scala 444:20]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s2_masterRecv) begin // @[Bus.scala 436:25]
      if (wrap_1) begin // @[Counter.scala 87:20]
        s2_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s2_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
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
  s1_ready = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_reqValid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_req_opcode = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_size = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  s1_req_source = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_req_address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s1_req_mask = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  s1_req_data = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  s2_ready = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_reqValid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_chosenSlaveOH_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_chosenSlaveOH_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_opcode = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  s2_beatSize = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  s2_chosenMasterOH = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  s2_beatCounter_value = _RAND_16[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
