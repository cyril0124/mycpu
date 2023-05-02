module SRAMArray_2P_10(
  input         clock,
  input  [7:0]  io_r_addr,
  output [65:0] io_r_data_0,
  input         io_w_en,
  input  [7:0]  io_w_addr,
  input  [65:0] io_w_data_0
);
  wire  brams_0_clock; // @[SRAM_1.scala 202:38]
  wire [7:0] brams_0_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [65:0] brams_0_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_0_io_w_en; // @[SRAM_1.scala 202:38]
  wire [7:0] brams_0_io_w_addr; // @[SRAM_1.scala 202:38]
  wire [65:0] brams_0_io_w_data; // @[SRAM_1.scala 202:38]
  BankRAM_2P_80 brams_0 ( // @[SRAM_1.scala 202:38]
    .clock(brams_0_clock),
    .io_r_addr(brams_0_io_r_addr),
    .io_r_data(brams_0_io_r_data),
    .io_w_en(brams_0_io_w_en),
    .io_w_addr(brams_0_io_w_addr),
    .io_w_data(brams_0_io_w_data)
  );
  assign io_r_data_0 = brams_0_io_r_data; // @[SRAM_1.scala 207:22]
  assign brams_0_clock = clock;
  assign brams_0_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_0_io_w_en = io_w_en; // @[SRAM_1.scala 209:37]
  assign brams_0_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_0_io_w_data = io_w_data_0; // @[SRAM_1.scala 211:28]
endmodule
