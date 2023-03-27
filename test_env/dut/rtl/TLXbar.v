module TLXbar(
  input         clock,
  input         reset,
  output        io_masterFace_in_0_ready,
  input         io_masterFace_in_0_valid,
  input  [2:0]  io_masterFace_in_0_bits_opcode,
  input  [31:0] io_masterFace_in_0_bits_size,
  input  [31:0] io_masterFace_in_0_bits_address,
  input  [31:0] io_masterFace_in_0_bits_data,
  output        io_masterFace_in_1_ready,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_size,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [31:0] io_masterFace_in_1_bits_data,
  output        io_masterFace_out_0_valid,
  output [2:0]  io_masterFace_out_0_bits_opcode,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [2:0]  io_masterFace_out_1_bits_opcode,
  output [31:0] io_masterFace_out_1_bits_data,
  input         io_slaveFace_in_0_ready,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output [31:0] io_slaveFace_in_0_bits_size,
  output [31:0] io_slaveFace_in_0_bits_address,
  output [31:0] io_slaveFace_in_0_bits_data,
  output        io_slaveFace_out_0_ready,
  input         io_slaveFace_out_0_valid,
  input  [2:0]  io_slaveFace_out_0_bits_opcode,
  input  [31:0] io_slaveFace_out_0_bits_data
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
`endif // RANDOMIZE_REG_INIT
  wire  reqArb_clock; // @[Bus.scala 191:24]
  wire  reqArb_reset; // @[Bus.scala 191:24]
  wire  reqArb_io_reqs_1; // @[Bus.scala 191:24]
  wire [1:0] reqArb_io_grantOH; // @[Bus.scala 191:24]
  wire  reqMux_io_in_0_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_in_0_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_in_0_bits_opcode; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_0_bits_size; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_0_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_0_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_in_1_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_in_1_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_in_1_bits_opcode; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_1_bits_size; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_1_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_in_1_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_out_ready; // @[Bus.scala 194:24]
  wire  reqMux_io_out_valid; // @[Bus.scala 194:24]
  wire [2:0] reqMux_io_out_bits_opcode; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_out_bits_size; // @[Bus.scala 194:24]
  wire  reqMux_io_out_bits_source; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_out_bits_address; // @[Bus.scala 194:24]
  wire [31:0] reqMux_io_out_bits_data; // @[Bus.scala 194:24]
  wire  reqMux_io_choseOH_0; // @[Bus.scala 194:24]
  wire  reqMux_io_choseOH_1; // @[Bus.scala 194:24]
  wire  buf__clock; // @[Bus.scala 200:21]
  wire  buf__reset; // @[Bus.scala 200:21]
  wire  buf__io_enq_ready; // @[Bus.scala 200:21]
  wire  buf__io_enq_valid; // @[Bus.scala 200:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[Bus.scala 200:21]
  wire [31:0] buf__io_enq_bits_size; // @[Bus.scala 200:21]
  wire  buf__io_enq_bits_source; // @[Bus.scala 200:21]
  wire [31:0] buf__io_enq_bits_address; // @[Bus.scala 200:21]
  wire [31:0] buf__io_enq_bits_data; // @[Bus.scala 200:21]
  wire  buf__io_deq_ready; // @[Bus.scala 200:21]
  wire  buf__io_deq_valid; // @[Bus.scala 200:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[Bus.scala 200:21]
  wire [31:0] buf__io_deq_bits_size; // @[Bus.scala 200:21]
  wire  buf__io_deq_bits_source; // @[Bus.scala 200:21]
  wire [31:0] buf__io_deq_bits_address; // @[Bus.scala 200:21]
  wire [31:0] buf__io_deq_bits_data; // @[Bus.scala 200:21]
  wire [31:0] addrDec_io_addr; // @[Bus.scala 221:25]
  wire  addrDec_io_choseOH_0; // @[Bus.scala 221:25]
  wire  addrDec_io_choseOH_1; // @[Bus.scala 221:25]
  wire  slaveMux_io_in_0_ready; // @[Bus.scala 262:26]
  wire  slaveMux_io_in_0_valid; // @[Bus.scala 262:26]
  wire [2:0] slaveMux_io_in_0_bits_opcode; // @[Bus.scala 262:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[Bus.scala 262:26]
  wire  slaveMux_io_out_ready; // @[Bus.scala 262:26]
  wire  slaveMux_io_out_valid; // @[Bus.scala 262:26]
  wire [2:0] slaveMux_io_out_bits_opcode; // @[Bus.scala 262:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[Bus.scala 262:26]
  wire  slaveMux_io_choseOH_0; // @[Bus.scala 262:26]
  wire [1:0] _WIRE_1 = reqArb_io_grantOH; // @[Bus.scala 196:{52,52}]
  reg  s1_full; // @[Bus.scala 207:26]
  wire  s1_latch = buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
  reg [2:0] s1_req_opcode; // @[Reg.scala 19:16]
  reg [31:0] s1_req_size; // @[Reg.scala 19:16]
  reg  s1_req_source; // @[Reg.scala 19:16]
  reg [31:0] s1_req_address; // @[Reg.scala 19:16]
  reg [31:0] s1_req_data; // @[Reg.scala 19:16]
  wire [29:0] s1_beatSize = s1_req_size[31:2]; // @[Bus.scala 213:35]
  reg  s2_full; // @[Bus.scala 250:26]
  reg [2:0] s2_opcode; // @[Reg.scala 19:16]
  wire [1:0] s2_masterRecvVec = {io_masterFace_out_1_valid,io_masterFace_out_0_valid}; // @[Cat.scala 33:92]
  reg [1:0] s2_chosenMasterOH; // @[Reg.scala 19:16]
  wire [1:0] _s2_masterRecv_T = s2_masterRecvVec & s2_chosenMasterOH; // @[Bus.scala 274:43]
  wire  s2_masterRecv = |_s2_masterRecv_T; // @[Bus.scala 274:64]
  reg  s2_masterRecvHold_holdReg; // @[Reg.scala 19:16]
  wire  s2_masterRecvHold = s2_masterRecv ? s2_masterRecv : s2_masterRecvHold_holdReg; // @[util.scala 12:12]
  reg [3:0] s2_beatCounter_value; // @[Counter.scala 61:40]
  reg [29:0] s2_beatSize; // @[Reg.scala 19:16]
  wire [29:0] _s2_lastBeat_T_1 = s2_beatSize - 30'h1; // @[Bus.scala 276:60]
  wire [29:0] _GEN_29 = {{26'd0}, s2_beatCounter_value}; // @[Bus.scala 276:44]
  wire  s2_lastBeat = _GEN_29 == _s2_lastBeat_T_1; // @[Bus.scala 276:44]
  wire  _s2_valid_T_4 = s2_opcode == 3'h4 & s2_masterRecvHold & s2_lastBeat; // @[Bus.scala 285:56]
  wire  s2_fire = s2_opcode == 3'h2 & s2_masterRecvHold | _s2_valid_T_4; // @[Bus.scala 284:65]
  wire  s2_ready = ~s2_full | s2_fire; // @[Bus.scala 258:26]
  wire  _s1_slaveRecVec_T = io_slaveFace_in_0_ready & io_slaveFace_in_0_valid; // @[Decoupled.scala 51:35]
  wire [1:0] s1_slaveRecVec = {1'h0,_s1_slaveRecVec_T}; // @[Cat.scala 33:92]
  wire [1:0] _s1_slaveRecv_T = {addrDec_io_choseOH_1,addrDec_io_choseOH_0}; // @[Bus.scala 232:59]
  wire [1:0] _s1_slaveRecv_T_1 = s1_slaveRecVec & _s1_slaveRecv_T; // @[Bus.scala 232:40]
  wire  s1_slaveRecv = |_s1_slaveRecv_T_1; // @[Bus.scala 232:67]
  reg  s1_slaveRecvHold_holdReg; // @[Reg.scala 19:16]
  wire  s1_slaveRecvHold = s1_slaveRecv ? s1_slaveRecv : s1_slaveRecvHold_holdReg; // @[util.scala 12:12]
  reg [3:0] s1_beatCounter_value; // @[Counter.scala 61:40]
  wire [29:0] _s1_lastBeat_T_1 = s1_beatSize - 30'h1; // @[Bus.scala 234:60]
  wire [29:0] _GEN_30 = {{26'd0}, s1_beatCounter_value}; // @[Bus.scala 234:44]
  wire  s1_lastBeat = _GEN_30 == _s1_lastBeat_T_1; // @[Bus.scala 234:44]
  wire  _s1_valid_T_4 = s1_slaveRecvHold & s1_req_opcode == 3'h4; // @[Bus.scala 243:54]
  wire  s1_valid = s1_slaveRecvHold & s1_lastBeat & s1_req_opcode == 3'h2 | _s1_valid_T_4; // @[Bus.scala 242:78]
  wire  s1_fire = s2_ready & s1_valid; // @[Bus.scala 245:25]
  wire  _GEN_8 = s1_full & s1_fire ? 1'h0 : s1_full; // @[Bus.scala 207:26 219:{35,45}]
  wire  _GEN_9 = s1_latch | _GEN_8; // @[Bus.scala 218:{20,30}]
  wire  wrap = s1_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_1 = s1_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  reg  s2_chosenSlaveOH_0; // @[Reg.scala 19:16]
  wire [1:0] _s2_chosenMasterOH_T = 2'h1 << s1_req_source; // @[OneHot.scala 57:35]
  wire  _GEN_20 = s2_full & s2_fire ? 1'h0 : s2_full; // @[Bus.scala 250:26 260:{35,45}]
  wire  _GEN_21 = s1_fire | _GEN_20; // @[Bus.scala 259:{20,30}]
  wire  wrap_1 = s2_beatCounter_value == 4'h9; // @[Counter.scala 73:24]
  wire [3:0] _value_T_3 = s2_beatCounter_value + 4'h1; // @[Counter.scala 77:24]
  reg  idle; // @[Bus.scala 290:23]
  wire  _GEN_27 = s2_fire | idle; // @[Bus.scala 294:26 295:14 290:23]
  wire  _GEN_28 = s1_latch | s1_fire ? 1'h0 : _GEN_27; // @[Bus.scala 292:32 293:14]
  TLBusArbiter reqArb ( // @[Bus.scala 191:24]
    .clock(reqArb_clock),
    .reset(reqArb_reset),
    .io_reqs_1(reqArb_io_reqs_1),
    .io_grantOH(reqArb_io_grantOH)
  );
  TLBusMux reqMux ( // @[Bus.scala 194:24]
    .io_in_0_ready(reqMux_io_in_0_ready),
    .io_in_0_valid(reqMux_io_in_0_valid),
    .io_in_0_bits_opcode(reqMux_io_in_0_bits_opcode),
    .io_in_0_bits_size(reqMux_io_in_0_bits_size),
    .io_in_0_bits_address(reqMux_io_in_0_bits_address),
    .io_in_0_bits_data(reqMux_io_in_0_bits_data),
    .io_in_1_ready(reqMux_io_in_1_ready),
    .io_in_1_valid(reqMux_io_in_1_valid),
    .io_in_1_bits_opcode(reqMux_io_in_1_bits_opcode),
    .io_in_1_bits_size(reqMux_io_in_1_bits_size),
    .io_in_1_bits_address(reqMux_io_in_1_bits_address),
    .io_in_1_bits_data(reqMux_io_in_1_bits_data),
    .io_out_ready(reqMux_io_out_ready),
    .io_out_valid(reqMux_io_out_valid),
    .io_out_bits_opcode(reqMux_io_out_bits_opcode),
    .io_out_bits_size(reqMux_io_out_bits_size),
    .io_out_bits_source(reqMux_io_out_bits_source),
    .io_out_bits_address(reqMux_io_out_bits_address),
    .io_out_bits_data(reqMux_io_out_bits_data),
    .io_choseOH_0(reqMux_io_choseOH_0),
    .io_choseOH_1(reqMux_io_choseOH_1)
  );
  Queue buf_ ( // @[Bus.scala 200:21]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_enq_ready(buf__io_enq_ready),
    .io_enq_valid(buf__io_enq_valid),
    .io_enq_bits_opcode(buf__io_enq_bits_opcode),
    .io_enq_bits_size(buf__io_enq_bits_size),
    .io_enq_bits_source(buf__io_enq_bits_source),
    .io_enq_bits_address(buf__io_enq_bits_address),
    .io_enq_bits_data(buf__io_enq_bits_data),
    .io_deq_ready(buf__io_deq_ready),
    .io_deq_valid(buf__io_deq_valid),
    .io_deq_bits_opcode(buf__io_deq_bits_opcode),
    .io_deq_bits_size(buf__io_deq_bits_size),
    .io_deq_bits_source(buf__io_deq_bits_source),
    .io_deq_bits_address(buf__io_deq_bits_address),
    .io_deq_bits_data(buf__io_deq_bits_data)
  );
  TLAddrDecode addrDec ( // @[Bus.scala 221:25]
    .io_addr(addrDec_io_addr),
    .io_choseOH_0(addrDec_io_choseOH_0),
    .io_choseOH_1(addrDec_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[Bus.scala 262:26]
    .io_in_0_ready(slaveMux_io_in_0_ready),
    .io_in_0_valid(slaveMux_io_in_0_valid),
    .io_in_0_bits_opcode(slaveMux_io_in_0_bits_opcode),
    .io_in_0_bits_data(slaveMux_io_in_0_bits_data),
    .io_out_ready(slaveMux_io_out_ready),
    .io_out_valid(slaveMux_io_out_valid),
    .io_out_bits_opcode(slaveMux_io_out_bits_opcode),
    .io_out_bits_data(slaveMux_io_out_bits_data),
    .io_choseOH_0(slaveMux_io_choseOH_0)
  );
  assign io_masterFace_in_0_ready = reqMux_io_in_0_ready; // @[Bus.scala 195:58]
  assign io_masterFace_in_1_ready = reqMux_io_in_1_ready; // @[Bus.scala 195:58]
  assign io_masterFace_out_0_valid = slaveMux_io_out_valid & s2_chosenMasterOH[0] & s2_full; // @[Bus.scala 268:67]
  assign io_masterFace_out_0_bits_opcode = slaveMux_io_out_bits_opcode; // @[Bus.scala 267:17]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 267:17]
  assign io_masterFace_out_1_valid = slaveMux_io_out_valid & s2_chosenMasterOH[1] & s2_full; // @[Bus.scala 268:67]
  assign io_masterFace_out_1_bits_opcode = slaveMux_io_out_bits_opcode; // @[Bus.scala 267:17]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[Bus.scala 267:17]
  assign io_slaveFace_in_0_valid = addrDec_io_choseOH_0 & s1_full; // @[Bus.scala 227:41]
  assign io_slaveFace_in_0_bits_opcode = s1_req_opcode; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_size = s1_req_size; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_address = s1_req_address; // @[Bus.scala 226:18]
  assign io_slaveFace_in_0_bits_data = s1_req_data; // @[Bus.scala 226:18]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[Bus.scala 263:20]
  assign reqArb_clock = clock;
  assign reqArb_reset = reset;
  assign reqArb_io_reqs_1 = io_masterFace_in_1_valid; // @[Bus.scala 192:58]
  assign reqMux_io_in_0_valid = io_masterFace_in_0_valid; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_opcode = io_masterFace_in_0_bits_opcode; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_size = io_masterFace_in_0_bits_size; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[Bus.scala 195:58]
  assign reqMux_io_in_0_bits_data = io_masterFace_in_0_bits_data; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_valid = io_masterFace_in_1_valid; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_size = io_masterFace_in_1_bits_size; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[Bus.scala 195:58]
  assign reqMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[Bus.scala 195:58]
  assign reqMux_io_out_ready = buf__io_enq_ready; // @[Bus.scala 201:16]
  assign reqMux_io_choseOH_0 = _WIRE_1[0]; // @[Bus.scala 196:52]
  assign reqMux_io_choseOH_1 = _WIRE_1[1]; // @[Bus.scala 196:52]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = reqMux_io_out_valid; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_opcode = reqMux_io_out_bits_opcode; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_size = reqMux_io_out_bits_size; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_source = reqMux_io_out_bits_source; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_address = reqMux_io_out_bits_address; // @[Bus.scala 201:16]
  assign buf__io_enq_bits_data = reqMux_io_out_bits_data; // @[Bus.scala 201:16]
  assign buf__io_deq_ready = ~s1_full | s1_fire; // @[Bus.scala 217:26]
  assign addrDec_io_addr = s1_req_address; // @[Bus.scala 223:21]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[Bus.scala 263:20]
  assign slaveMux_io_in_0_bits_opcode = io_slaveFace_out_0_bits_opcode; // @[Bus.scala 263:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[Bus.scala 263:20]
  assign slaveMux_io_out_ready = s2_chosenMasterOH[0] | s2_chosenMasterOH[1]; // @[Mux.scala 27:73]
  assign slaveMux_io_choseOH_0 = s2_chosenSlaveOH_0; // @[Bus.scala 264:25]
  always @(posedge clock) begin
    if (reset) begin // @[Bus.scala 207:26]
      s1_full <= 1'h0; // @[Bus.scala 207:26]
    end else begin
      s1_full <= _GEN_9;
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
      s1_req_data <= buf__io_deq_bits_data; // @[Reg.scala 20:22]
    end
    if (reset) begin // @[Bus.scala 250:26]
      s2_full <= 1'h0; // @[Bus.scala 250:26]
    end else begin
      s2_full <= _GEN_21;
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_opcode <= s1_req_opcode; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenMasterOH <= _s2_chosenMasterOH_T; // @[Reg.scala 20:22]
    end
    if (s2_fire) begin // @[util.scala 11:21]
      s2_masterRecvHold_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (s2_masterRecv) begin // @[util.scala 12:12]
      s2_masterRecvHold_holdReg <= s2_masterRecv;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s1_fire) begin // @[Bus.scala 280:20]
      s2_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s2_masterRecv & ~s2_lastBeat) begin // @[Bus.scala 277:41]
      if (wrap_1) begin // @[Counter.scala 87:20]
        s2_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s2_beatCounter_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_beatSize <= s1_beatSize; // @[Reg.scala 20:22]
    end
    if (s1_fire) begin // @[util.scala 11:21]
      s1_slaveRecvHold_holdReg <= 1'h0; // @[util.scala 11:31]
    end else if (s1_slaveRecv) begin // @[util.scala 12:12]
      s1_slaveRecvHold_holdReg <= s1_slaveRecv;
    end
    if (reset) begin // @[Counter.scala 61:40]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (s1_latch) begin // @[Bus.scala 238:20]
      s1_beatCounter_value <= 4'h0; // @[Counter.scala 98:11]
    end else if (s1_slaveRecv & ~s1_lastBeat) begin // @[Bus.scala 235:40]
      if (wrap) begin // @[Counter.scala 87:20]
        s1_beatCounter_value <= 4'h0; // @[Counter.scala 87:28]
      end else begin
        s1_beatCounter_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (s1_fire) begin // @[Reg.scala 20:18]
      s2_chosenSlaveOH_0 <= addrDec_io_choseOH_0; // @[Reg.scala 20:22]
    end
    idle <= reset | _GEN_28; // @[Bus.scala 290:{23,23}]
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
  s1_full = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_req_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  s1_req_size = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_source = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s1_req_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  s1_req_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  s2_full = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_opcode = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  s2_chosenMasterOH = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  s2_masterRecvHold_holdReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s2_beatCounter_value = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  s2_beatSize = _RAND_11[29:0];
  _RAND_12 = {1{`RANDOM}};
  s1_slaveRecvHold_holdReg = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_beatCounter_value = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  s2_chosenSlaveOH_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  idle = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
