module BusXbar_1(
  input         clock,
  input         reset,
  output        io_masterFace_in_0_ready,
  input  [31:0] io_masterFace_in_0_bits_address,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [3:0]  io_masterFace_in_1_bits_mask,
  input  [31:0] io_masterFace_in_1_bits_data,
  input         io_masterFace_out_0_ready,
  output        io_masterFace_out_0_valid,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [31:0] io_masterFace_out_1_bits_data,
  input         io_slaveFace_in_0_ready,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output [2:0]  io_slaveFace_in_0_bits_param,
  output [1:0]  io_slaveFace_in_0_bits_size,
  output        io_slaveFace_in_0_bits_source,
  output [31:0] io_slaveFace_in_0_bits_address,
  output [3:0]  io_slaveFace_in_0_bits_mask,
  output        io_slaveFace_in_0_bits_corrupt,
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
  input  [31:0] io_slaveFace_out_1_bits_data,
  output        io_slaveFace_cs_0,
  output        io_slaveFace_cs_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  masterArb_clock; // @[TLBus.scala 104:27]
  wire  masterArb_reset; // @[TLBus.scala 104:27]
  wire  masterArb_io_reqs_1; // @[TLBus.scala 104:27]
  wire [1:0] masterArb_io_grantOH; // @[TLBus.scala 104:27]
  wire  masterMux_io_in_0_ready; // @[TLBus.scala 107:27]
  wire [31:0] masterMux_io_in_0_bits_address; // @[TLBus.scala 107:27]
  wire  masterMux_io_in_1_valid; // @[TLBus.scala 107:27]
  wire [2:0] masterMux_io_in_1_bits_opcode; // @[TLBus.scala 107:27]
  wire [31:0] masterMux_io_in_1_bits_address; // @[TLBus.scala 107:27]
  wire [3:0] masterMux_io_in_1_bits_mask; // @[TLBus.scala 107:27]
  wire [31:0] masterMux_io_in_1_bits_data; // @[TLBus.scala 107:27]
  wire  masterMux_io_out_ready; // @[TLBus.scala 107:27]
  wire  masterMux_io_out_valid; // @[TLBus.scala 107:27]
  wire [2:0] masterMux_io_out_bits_opcode; // @[TLBus.scala 107:27]
  wire  masterMux_io_out_bits_source; // @[TLBus.scala 107:27]
  wire [31:0] masterMux_io_out_bits_address; // @[TLBus.scala 107:27]
  wire [3:0] masterMux_io_out_bits_mask; // @[TLBus.scala 107:27]
  wire  masterMux_io_out_bits_corrupt; // @[TLBus.scala 107:27]
  wire [31:0] masterMux_io_out_bits_data; // @[TLBus.scala 107:27]
  wire  masterMux_io_choseOH_0; // @[TLBus.scala 107:27]
  wire  masterMux_io_choseOH_1; // @[TLBus.scala 107:27]
  wire  buf__clock; // @[TLBus.scala 111:21]
  wire  buf__reset; // @[TLBus.scala 111:21]
  wire  buf__io_enq_ready; // @[TLBus.scala 111:21]
  wire  buf__io_enq_valid; // @[TLBus.scala 111:21]
  wire [2:0] buf__io_enq_bits_opcode; // @[TLBus.scala 111:21]
  wire  buf__io_enq_bits_source; // @[TLBus.scala 111:21]
  wire [31:0] buf__io_enq_bits_address; // @[TLBus.scala 111:21]
  wire [3:0] buf__io_enq_bits_mask; // @[TLBus.scala 111:21]
  wire  buf__io_enq_bits_corrupt; // @[TLBus.scala 111:21]
  wire [31:0] buf__io_enq_bits_data; // @[TLBus.scala 111:21]
  wire  buf__io_deq_ready; // @[TLBus.scala 111:21]
  wire  buf__io_deq_valid; // @[TLBus.scala 111:21]
  wire [2:0] buf__io_deq_bits_opcode; // @[TLBus.scala 111:21]
  wire [2:0] buf__io_deq_bits_param; // @[TLBus.scala 111:21]
  wire [1:0] buf__io_deq_bits_size; // @[TLBus.scala 111:21]
  wire  buf__io_deq_bits_source; // @[TLBus.scala 111:21]
  wire [31:0] buf__io_deq_bits_address; // @[TLBus.scala 111:21]
  wire [3:0] buf__io_deq_bits_mask; // @[TLBus.scala 111:21]
  wire  buf__io_deq_bits_corrupt; // @[TLBus.scala 111:21]
  wire [31:0] buf__io_deq_bits_data; // @[TLBus.scala 111:21]
  wire [31:0] addrDecode_io_addr; // @[TLBus.scala 122:28]
  wire  addrDecode_io_choseOH_0; // @[TLBus.scala 122:28]
  wire  addrDecode_io_choseOH_1; // @[TLBus.scala 122:28]
  wire  slaveMux_io_in_0_ready; // @[TLBus.scala 135:26]
  wire  slaveMux_io_in_0_valid; // @[TLBus.scala 135:26]
  wire [31:0] slaveMux_io_in_0_bits_data; // @[TLBus.scala 135:26]
  wire  slaveMux_io_in_1_ready; // @[TLBus.scala 135:26]
  wire  slaveMux_io_in_1_valid; // @[TLBus.scala 135:26]
  wire [31:0] slaveMux_io_in_1_bits_data; // @[TLBus.scala 135:26]
  wire  slaveMux_io_out_ready; // @[TLBus.scala 135:26]
  wire  slaveMux_io_out_valid; // @[TLBus.scala 135:26]
  wire [31:0] slaveMux_io_out_bits_data; // @[TLBus.scala 135:26]
  wire  slaveMux_io_choseOH_0; // @[TLBus.scala 135:26]
  wire  slaveMux_io_choseOH_1; // @[TLBus.scala 135:26]
  wire [1:0] _WIRE_1 = masterArb_io_grantOH; // @[TLBus.scala 109:{58,58}]
  reg  bufSource_REG; // @[TLBus.scala 113:62]
  reg  bufSource; // @[Reg.scala 19:16]
  wire [1:0] _T_2 = {addrDecode_io_choseOH_1,addrDecode_io_choseOH_0}; // @[TLBus.scala 124:44]
  wire [1:0] sourceChoseOH_choseOH = 2'h1 << bufSource; // @[OneHot.scala 64:12]
  wire  sourceChoseOH_0 = sourceChoseOH_choseOH[0]; // @[TLBus.scala 138:48]
  wire  sourceChoseOH_1 = sourceChoseOH_choseOH[1]; // @[TLBus.scala 138:48]
  wire  _GEN_2 = sourceChoseOH_0 & io_masterFace_out_0_ready; // @[TLBus.scala 140:27 143:32 145:35]
  TLBusArbiter masterArb ( // @[TLBus.scala 104:27]
    .clock(masterArb_clock),
    .reset(masterArb_reset),
    .io_reqs_1(masterArb_io_reqs_1),
    .io_grantOH(masterArb_io_grantOH)
  );
  TLBusMux masterMux ( // @[TLBus.scala 107:27]
    .io_in_0_ready(masterMux_io_in_0_ready),
    .io_in_0_bits_address(masterMux_io_in_0_bits_address),
    .io_in_1_valid(masterMux_io_in_1_valid),
    .io_in_1_bits_opcode(masterMux_io_in_1_bits_opcode),
    .io_in_1_bits_address(masterMux_io_in_1_bits_address),
    .io_in_1_bits_mask(masterMux_io_in_1_bits_mask),
    .io_in_1_bits_data(masterMux_io_in_1_bits_data),
    .io_out_ready(masterMux_io_out_ready),
    .io_out_valid(masterMux_io_out_valid),
    .io_out_bits_opcode(masterMux_io_out_bits_opcode),
    .io_out_bits_source(masterMux_io_out_bits_source),
    .io_out_bits_address(masterMux_io_out_bits_address),
    .io_out_bits_mask(masterMux_io_out_bits_mask),
    .io_out_bits_corrupt(masterMux_io_out_bits_corrupt),
    .io_out_bits_data(masterMux_io_out_bits_data),
    .io_choseOH_0(masterMux_io_choseOH_0),
    .io_choseOH_1(masterMux_io_choseOH_1)
  );
  Queue buf_ ( // @[TLBus.scala 111:21]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_enq_ready(buf__io_enq_ready),
    .io_enq_valid(buf__io_enq_valid),
    .io_enq_bits_opcode(buf__io_enq_bits_opcode),
    .io_enq_bits_source(buf__io_enq_bits_source),
    .io_enq_bits_address(buf__io_enq_bits_address),
    .io_enq_bits_mask(buf__io_enq_bits_mask),
    .io_enq_bits_corrupt(buf__io_enq_bits_corrupt),
    .io_enq_bits_data(buf__io_enq_bits_data),
    .io_deq_ready(buf__io_deq_ready),
    .io_deq_valid(buf__io_deq_valid),
    .io_deq_bits_opcode(buf__io_deq_bits_opcode),
    .io_deq_bits_param(buf__io_deq_bits_param),
    .io_deq_bits_size(buf__io_deq_bits_size),
    .io_deq_bits_source(buf__io_deq_bits_source),
    .io_deq_bits_address(buf__io_deq_bits_address),
    .io_deq_bits_mask(buf__io_deq_bits_mask),
    .io_deq_bits_corrupt(buf__io_deq_bits_corrupt),
    .io_deq_bits_data(buf__io_deq_bits_data)
  );
  TLAddrDecode addrDecode ( // @[TLBus.scala 122:28]
    .io_addr(addrDecode_io_addr),
    .io_choseOH_0(addrDecode_io_choseOH_0),
    .io_choseOH_1(addrDecode_io_choseOH_1)
  );
  TLBusMux_1 slaveMux ( // @[TLBus.scala 135:26]
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
  assign io_masterFace_in_0_ready = masterMux_io_in_0_ready; // @[TLBus.scala 108:21]
  assign io_masterFace_out_0_valid = slaveMux_io_out_valid; // @[TLBus.scala 143:32 144:22]
  assign io_masterFace_out_0_bits_data = slaveMux_io_out_bits_data; // @[TLBus.scala 142:17]
  assign io_masterFace_out_1_valid = slaveMux_io_out_valid; // @[TLBus.scala 143:32 144:22]
  assign io_masterFace_out_1_bits_data = slaveMux_io_out_bits_data; // @[TLBus.scala 142:17]
  assign io_slaveFace_in_0_valid = buf__io_deq_valid; // @[TLBus.scala 119:18]
  assign io_slaveFace_in_0_bits_opcode = buf__io_deq_bits_opcode; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_param = buf__io_deq_bits_param; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_size = buf__io_deq_bits_size; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_source = buf__io_deq_bits_source; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_address = buf__io_deq_bits_address; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_mask = buf__io_deq_bits_mask; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_corrupt = buf__io_deq_bits_corrupt; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_0_bits_data = buf__io_deq_bits_data; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_1_valid = buf__io_deq_valid; // @[TLBus.scala 119:18]
  assign io_slaveFace_in_1_bits_opcode = buf__io_deq_bits_opcode; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_1_bits_address = buf__io_deq_bits_address; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_1_bits_mask = buf__io_deq_bits_mask; // @[TLBus.scala 118:17]
  assign io_slaveFace_in_1_bits_data = buf__io_deq_bits_data; // @[TLBus.scala 118:17]
  assign io_slaveFace_out_0_ready = slaveMux_io_in_0_ready; // @[TLBus.scala 136:20]
  assign io_slaveFace_out_1_ready = slaveMux_io_in_1_ready; // @[TLBus.scala 136:20]
  assign io_slaveFace_cs_0 = _T_2[0]; // @[TLBus.scala 124:44]
  assign io_slaveFace_cs_1 = _T_2[1]; // @[TLBus.scala 124:44]
  assign masterArb_clock = clock;
  assign masterArb_reset = reset;
  assign masterArb_io_reqs_1 = io_masterFace_in_1_valid; // @[TLBus.scala 105:62]
  assign masterMux_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[TLBus.scala 108:21]
  assign masterMux_io_in_1_valid = io_masterFace_in_1_valid; // @[TLBus.scala 108:21]
  assign masterMux_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[TLBus.scala 108:21]
  assign masterMux_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[TLBus.scala 108:21]
  assign masterMux_io_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[TLBus.scala 108:21]
  assign masterMux_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[TLBus.scala 108:21]
  assign masterMux_io_out_ready = buf__io_enq_ready; // @[TLBus.scala 115:16]
  assign masterMux_io_choseOH_0 = _WIRE_1[0]; // @[TLBus.scala 109:58]
  assign masterMux_io_choseOH_1 = _WIRE_1[1]; // @[TLBus.scala 109:58]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_enq_valid = masterMux_io_out_valid; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_opcode = masterMux_io_out_bits_opcode; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_source = masterMux_io_out_bits_source; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_address = masterMux_io_out_bits_address; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_mask = masterMux_io_out_bits_mask; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_corrupt = masterMux_io_out_bits_corrupt; // @[TLBus.scala 115:16]
  assign buf__io_enq_bits_data = masterMux_io_out_bits_data; // @[TLBus.scala 115:16]
  assign buf__io_deq_ready = io_slaveFace_cs_0 & io_slaveFace_in_0_ready | io_slaveFace_cs_1 & io_slaveFace_in_1_ready; // @[Mux.scala 27:73]
  assign addrDecode_io_addr = buf__io_deq_bits_address; // @[TLBus.scala 123:24]
  assign slaveMux_io_in_0_valid = io_slaveFace_out_0_valid; // @[TLBus.scala 136:20]
  assign slaveMux_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[TLBus.scala 136:20]
  assign slaveMux_io_in_1_valid = io_slaveFace_out_1_valid; // @[TLBus.scala 136:20]
  assign slaveMux_io_in_1_bits_data = io_slaveFace_out_1_bits_data; // @[TLBus.scala 136:20]
  assign slaveMux_io_out_ready = sourceChoseOH_1 | _GEN_2; // @[TLBus.scala 143:32 145:35]
  assign slaveMux_io_choseOH_0 = _T_2[0]; // @[TLBus.scala 137:58]
  assign slaveMux_io_choseOH_1 = _T_2[1]; // @[TLBus.scala 137:58]
  always @(posedge clock) begin
    bufSource_REG <= buf__io_deq_ready & buf__io_deq_valid; // @[Decoupled.scala 51:35]
    if (bufSource_REG) begin // @[Reg.scala 20:18]
      bufSource <= buf__io_deq_bits_source; // @[Reg.scala 20:22]
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
  bufSource_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bufSource = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
