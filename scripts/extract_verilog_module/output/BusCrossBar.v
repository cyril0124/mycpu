module BusCrossBar(
  input  [31:0] io_masterFace_in_0_bits_address,
  output        io_masterFace_out_0_valid,
  output [31:0] io_masterFace_out_0_bits_data,
  output        io_slaveFace_in_0_valid,
  output [2:0]  io_slaveFace_in_0_bits_opcode,
  output [31:0] io_slaveFace_in_0_bits_address,
  input  [31:0] io_slaveFace_out_0_bits_data
);
  wire  slaveArbs_0_io_in_0_valid; // @[TLBus.scala 179:48]
  wire [31:0] slaveArbs_0_io_in_0_bits_address; // @[TLBus.scala 179:48]
  wire  slaveArbs_0_io_out_valid; // @[TLBus.scala 179:48]
  wire [2:0] slaveArbs_0_io_out_bits_opcode; // @[TLBus.scala 179:48]
  wire [31:0] slaveArbs_0_io_out_bits_address; // @[TLBus.scala 179:48]
  wire  slaveArbs_1_io_in_0_valid; // @[TLBus.scala 179:48]
  wire [31:0] slaveArbs_1_io_in_0_bits_address; // @[TLBus.scala 179:48]
  wire  slaveArbs_1_io_out_valid; // @[TLBus.scala 179:48]
  wire [2:0] slaveArbs_1_io_out_bits_opcode; // @[TLBus.scala 179:48]
  wire [31:0] slaveArbs_1_io_out_bits_address; // @[TLBus.scala 179:48]
  wire  masterArbs_0_io_in_0_valid; // @[TLBus.scala 191:50]
  wire [31:0] masterArbs_0_io_in_0_bits_data; // @[TLBus.scala 191:50]
  wire  masterArbs_0_io_out_valid; // @[TLBus.scala 191:50]
  wire [31:0] masterArbs_0_io_out_bits_data; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_in_0_valid; // @[TLBus.scala 191:50]
  wire [31:0] masterArbs_1_io_in_0_bits_data; // @[TLBus.scala 191:50]
  wire  masterArbs_1_io_out_valid; // @[TLBus.scala 191:50]
  wire [31:0] masterArbs_1_io_out_bits_data; // @[TLBus.scala 191:50]
  wire  masterChose_valid = io_masterFace_in_0_bits_address < 32'h1000; // @[TLBus.scala 149:42]
  wire  masterChose_valid_1 = io_masterFace_in_0_bits_address >= 32'h1000 & io_masterFace_in_0_bits_address < 32'h2000; // @[TLBus.scala 149:31]
  wire [1:0] _GEN_2 = masterChose_valid_1 ? 2'h2 : 2'h1; // @[TLBus.scala 161:72 162:21 164:21]
  wire [1:0] masterChose_choseOH = masterChose_valid ? 2'h1 : _GEN_2; // @[TLBus.scala 159:66 160:21]
  Arbiter slaveArbs_0 ( // @[TLBus.scala 179:48]
    .io_in_0_valid(slaveArbs_0_io_in_0_valid),
    .io_in_0_bits_address(slaveArbs_0_io_in_0_bits_address),
    .io_out_valid(slaveArbs_0_io_out_valid),
    .io_out_bits_opcode(slaveArbs_0_io_out_bits_opcode),
    .io_out_bits_address(slaveArbs_0_io_out_bits_address)
  );
  Arbiter slaveArbs_1 ( // @[TLBus.scala 179:48]
    .io_in_0_valid(slaveArbs_1_io_in_0_valid),
    .io_in_0_bits_address(slaveArbs_1_io_in_0_bits_address),
    .io_out_valid(slaveArbs_1_io_out_valid),
    .io_out_bits_opcode(slaveArbs_1_io_out_bits_opcode),
    .io_out_bits_address(slaveArbs_1_io_out_bits_address)
  );
  Arbiter_2 masterArbs_0 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_0_io_in_0_valid),
    .io_in_0_bits_data(masterArbs_0_io_in_0_bits_data),
    .io_out_valid(masterArbs_0_io_out_valid),
    .io_out_bits_data(masterArbs_0_io_out_bits_data)
  );
  Arbiter_2 masterArbs_1 ( // @[TLBus.scala 191:50]
    .io_in_0_valid(masterArbs_1_io_in_0_valid),
    .io_in_0_bits_data(masterArbs_1_io_in_0_bits_data),
    .io_out_valid(masterArbs_1_io_out_valid),
    .io_out_bits_data(masterArbs_1_io_out_bits_data)
  );
  assign io_masterFace_out_0_valid = masterArbs_0_io_out_valid; // @[TLBus.scala 199:30]
  assign io_masterFace_out_0_bits_data = masterArbs_0_io_out_bits_data; // @[TLBus.scala 199:30]
  assign io_slaveFace_in_0_valid = slaveArbs_0_io_out_valid; // @[TLBus.scala 187:29]
  assign io_slaveFace_in_0_bits_opcode = slaveArbs_0_io_out_bits_opcode; // @[TLBus.scala 187:29]
  assign io_slaveFace_in_0_bits_address = slaveArbs_0_io_out_bits_address; // @[TLBus.scala 187:29]
  assign slaveArbs_0_io_in_0_valid = masterChose_choseOH[0]; // @[TLBus.scala 182:60]
  assign slaveArbs_0_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[TLBus.scala 183:21]
  assign slaveArbs_1_io_in_0_valid = masterChose_choseOH[1]; // @[TLBus.scala 182:60]
  assign slaveArbs_1_io_in_0_bits_address = io_masterFace_in_0_bits_address; // @[TLBus.scala 183:21]
  assign masterArbs_0_io_in_0_valid = 1'h1; // @[TLBus.scala 194:57]
  assign masterArbs_0_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[TLBus.scala 195:21]
  assign masterArbs_1_io_in_0_valid = 1'h0; // @[TLBus.scala 194:57]
  assign masterArbs_1_io_in_0_bits_data = io_slaveFace_out_0_bits_data; // @[TLBus.scala 195:21]
endmodule
