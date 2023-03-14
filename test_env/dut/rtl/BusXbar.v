module BusXbar(
  input         clock,
  input  [31:0] io_masterFace_in_0_bits_address,
  input         io_masterFace_in_1_valid,
  input  [2:0]  io_masterFace_in_1_bits_opcode,
  input  [31:0] io_masterFace_in_1_bits_address,
  input  [3:0]  io_masterFace_in_1_bits_mask,
  input  [31:0] io_masterFace_in_1_bits_data,
  output        io_masterFace_out_0_valid,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_masterFace_out_1_valid,
  output [31:0] io_masterFace_out_1_bits_data,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output        io_slaveFace_in_0_bits_source,
  output [31:0] io_slaveFace_in_0_bits_address,
  output [31:0] io_slaveFace_in_0_bits_data,
  output        io_slaveFace_in_1_valid,
  output [2:0]  io_slaveFace_in_1_bits_opcode,
  output        io_slaveFace_in_1_bits_source,
  output [31:0] io_slaveFace_in_1_bits_address,
  output [3:0]  io_slaveFace_in_1_bits_mask,
  output [31:0] io_slaveFace_in_1_bits_data,
  input         io_slaveFace_out_0_bits_source,
  input  [31:0] io_slaveFace_out_0_bits_data,
  input         io_slaveFace_out_1_bits_source,
  input  [31:0] io_slaveFace_out_1_bits_data
);
  wire  masterArb_clock; // @[TLBus.scala 113:27]
  wire [31:0] masterArb_io_in_0_bits_address; // @[TLBus.scala 113:27]
  wire  masterArb_io_in_1_valid; // @[TLBus.scala 113:27]
  wire [2:0] masterArb_io_in_1_bits_opcode; // @[TLBus.scala 113:27]
  wire [31:0] masterArb_io_in_1_bits_address; // @[TLBus.scala 113:27]
  wire [3:0] masterArb_io_in_1_bits_mask; // @[TLBus.scala 113:27]
  wire [31:0] masterArb_io_in_1_bits_data; // @[TLBus.scala 113:27]
  wire  masterArb_io_out_ready; // @[TLBus.scala 113:27]
  wire  masterArb_io_out_valid; // @[TLBus.scala 113:27]
  wire [2:0] masterArb_io_out_bits_opcode; // @[TLBus.scala 113:27]
  wire  masterArb_io_out_bits_source; // @[TLBus.scala 113:27]
  wire [31:0] masterArb_io_out_bits_address; // @[TLBus.scala 113:27]
  wire [3:0] masterArb_io_out_bits_mask; // @[TLBus.scala 113:27]
  wire [31:0] masterArb_io_out_bits_data; // @[TLBus.scala 113:27]
  wire  masterArb_io_chosen; // @[TLBus.scala 113:27]
  wire  slaveArb_clock; // @[TLBus.scala 132:26]
  wire  slaveArb_io_in_0_bits_source; // @[TLBus.scala 132:26]
  wire [31:0] slaveArb_io_in_0_bits_data; // @[TLBus.scala 132:26]
  wire  slaveArb_io_in_1_bits_source; // @[TLBus.scala 132:26]
  wire [31:0] slaveArb_io_in_1_bits_data; // @[TLBus.scala 132:26]
  wire  slaveArb_io_out_ready; // @[TLBus.scala 132:26]
  wire  slaveArb_io_out_valid; // @[TLBus.scala 132:26]
  wire  slaveArb_io_out_bits_source; // @[TLBus.scala 132:26]
  wire [31:0] slaveArb_io_out_bits_data; // @[TLBus.scala 132:26]
  wire  slaveArb_io_chosen; // @[TLBus.scala 132:26]
  wire  valid = masterArb_io_out_bits_address < 32'h2000; // @[TLBus.scala 95:42]
  wire  valid_1 = masterArb_io_out_bits_address >= 32'h2000 & masterArb_io_out_bits_address < 32'h4000; // @[TLBus.scala 95:31]
  wire  _GEN_3 = valid_1 & masterArb_io_out_valid; // @[TLBus.scala 106:25 108:25 124:81]
  wire [1:0] slaveChosenVec = 2'h1 << slaveArb_io_out_bits_source; // @[OneHot.scala 57:35]
  RRArbiter masterArb ( // @[TLBus.scala 113:27]
    .clock(masterArb_clock),
    .io_in_0_bits_address(masterArb_io_in_0_bits_address),
    .io_in_1_valid(masterArb_io_in_1_valid),
    .io_in_1_bits_opcode(masterArb_io_in_1_bits_opcode),
    .io_in_1_bits_address(masterArb_io_in_1_bits_address),
    .io_in_1_bits_mask(masterArb_io_in_1_bits_mask),
    .io_in_1_bits_data(masterArb_io_in_1_bits_data),
    .io_out_ready(masterArb_io_out_ready),
    .io_out_valid(masterArb_io_out_valid),
    .io_out_bits_opcode(masterArb_io_out_bits_opcode),
    .io_out_bits_source(masterArb_io_out_bits_source),
    .io_out_bits_address(masterArb_io_out_bits_address),
    .io_out_bits_mask(masterArb_io_out_bits_mask),
    .io_out_bits_data(masterArb_io_out_bits_data),
    .io_chosen(masterArb_io_chosen)
  );
  RRArbiter_1 slaveArb ( // @[TLBus.scala 132:26]
    .clock(slaveArb_clock),
    .io_in_0_bits_source(slaveArb_io_in_0_bits_source),
    .io_in_0_bits_data(slaveArb_io_in_0_bits_data),
    .io_in_1_bits_source(slaveArb_io_in_1_bits_source),
    .io_in_1_bits_data(slaveArb_io_in_1_bits_data),
    .io_out_ready(slaveArb_io_out_ready),
    .io_out_valid(slaveArb_io_out_valid),
    .io_out_bits_source(slaveArb_io_out_bits_source),
    .io_out_bits_data(slaveArb_io_out_bits_data),
    .io_chosen(slaveArb_io_chosen)
  );
  assign io_masterFace_out_0_valid = slaveChosenVec[0]; // @[TLBus.scala 138:36]
  assign io_masterFace_out_0_bits_data = slaveArb_io_out_bits_data; // @[TLBus.scala 140:18]
  assign io_masterFace_out_1_valid = slaveChosenVec[1]; // @[TLBus.scala 138:36]
  assign io_masterFace_out_1_bits_data = slaveArb_io_out_bits_data; // @[TLBus.scala 140:18]
  assign io_slaveFace_in_0_valid = valid & masterArb_io_out_valid; // @[TLBus.scala 106:25 121:75]
  assign io_slaveFace_in_0_bits_opcode = masterArb_io_out_bits_opcode; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_0_bits_source = masterArb_io_out_bits_source; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_0_bits_address = masterArb_io_out_bits_address; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_0_bits_data = masterArb_io_out_bits_data; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_1_valid = valid ? 1'h0 : _GEN_3; // @[TLBus.scala 108:25 121:75]
  assign io_slaveFace_in_1_bits_opcode = masterArb_io_out_bits_opcode; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_1_bits_source = masterArb_io_out_bits_source; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_1_bits_address = masterArb_io_out_bits_address; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_1_bits_mask = masterArb_io_out_bits_mask; // @[TLBus.scala 119:16]
  assign io_slaveFace_in_1_bits_data = masterArb_io_out_bits_data; // @[TLBus.scala 119:16]
  assign masterArb_clock = clock;
  assign masterArb_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[TLBus.scala 115:73]
  assign masterArb_io_in_1_valid = io_masterFace_in_1_valid; // @[TLBus.scala 115:73]
  assign masterArb_io_in_1_bits_opcode = io_masterFace_in_1_bits_opcode; // @[TLBus.scala 115:73]
  assign masterArb_io_in_1_bits_address = io_masterFace_in_1_bits_address; // @[TLBus.scala 115:73]
  assign masterArb_io_in_1_bits_mask = io_masterFace_in_1_bits_mask; // @[TLBus.scala 115:73]
  assign masterArb_io_in_1_bits_data = io_masterFace_in_1_bits_data; // @[TLBus.scala 115:73]
  assign masterArb_io_out_ready = valid | valid_1; // @[TLBus.scala 121:75 123:23]
  assign slaveArb_clock = clock;
  assign slaveArb_io_in_0_bits_source = io_slaveFace_out_0_bits_source; // @[TLBus.scala 134:72]
  assign slaveArb_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[TLBus.scala 134:72]
  assign slaveArb_io_in_1_bits_source = io_slaveFace_out_1_bits_source; // @[TLBus.scala 134:72]
  assign slaveArb_io_in_1_bits_data = io_slaveFace_out_1_bits_data; // @[TLBus.scala 134:72]
  assign slaveArb_io_out_ready = slaveChosenVec[1]; // @[TLBus.scala 139:53]
endmodule
