module DataBank(
  input         clock,
  input         reset,
  input         io_w_en,
  input  [5:0]  io_w_set,
  input  [3:0]  io_w_way,
  input  [31:0] io_w_data,
  input  [3:0]  io_w_mask,
  input  [5:0]  io_r_set,
  output [31:0] io_r_data_0,
  output [31:0] io_r_data_1,
  output [31:0] io_r_data_2,
  output [31:0] io_r_data_3
);
  wire  bankRam_0_clock; // @[DataBank.scala 34:41]
  wire  bankRam_0_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_0_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_0_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_0_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_0_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_0_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_0_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_1_clock; // @[DataBank.scala 34:41]
  wire  bankRam_1_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_1_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_1_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_1_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_1_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_1_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_1_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_2_clock; // @[DataBank.scala 34:41]
  wire  bankRam_2_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_2_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_2_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_2_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_2_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_2_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_2_io_w_mask; // @[DataBank.scala 34:41]
  wire  bankRam_3_clock; // @[DataBank.scala 34:41]
  wire  bankRam_3_reset; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_3_io_r_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_3_io_r_data; // @[DataBank.scala 34:41]
  wire  bankRam_3_io_w_en; // @[DataBank.scala 34:41]
  wire [5:0] bankRam_3_io_w_addr; // @[DataBank.scala 34:41]
  wire [31:0] bankRam_3_io_w_data; // @[DataBank.scala 34:41]
  wire [3:0] bankRam_3_io_w_mask; // @[DataBank.scala 34:41]
  SRAMTemplate bankRam_0 ( // @[DataBank.scala 34:41]
    .clock(bankRam_0_clock),
    .reset(bankRam_0_reset),
    .io_r_addr(bankRam_0_io_r_addr),
    .io_r_data(bankRam_0_io_r_data),
    .io_w_en(bankRam_0_io_w_en),
    .io_w_addr(bankRam_0_io_w_addr),
    .io_w_data(bankRam_0_io_w_data),
    .io_w_mask(bankRam_0_io_w_mask)
  );
  SRAMTemplate bankRam_1 ( // @[DataBank.scala 34:41]
    .clock(bankRam_1_clock),
    .reset(bankRam_1_reset),
    .io_r_addr(bankRam_1_io_r_addr),
    .io_r_data(bankRam_1_io_r_data),
    .io_w_en(bankRam_1_io_w_en),
    .io_w_addr(bankRam_1_io_w_addr),
    .io_w_data(bankRam_1_io_w_data),
    .io_w_mask(bankRam_1_io_w_mask)
  );
  SRAMTemplate bankRam_2 ( // @[DataBank.scala 34:41]
    .clock(bankRam_2_clock),
    .reset(bankRam_2_reset),
    .io_r_addr(bankRam_2_io_r_addr),
    .io_r_data(bankRam_2_io_r_data),
    .io_w_en(bankRam_2_io_w_en),
    .io_w_addr(bankRam_2_io_w_addr),
    .io_w_data(bankRam_2_io_w_data),
    .io_w_mask(bankRam_2_io_w_mask)
  );
  SRAMTemplate bankRam_3 ( // @[DataBank.scala 34:41]
    .clock(bankRam_3_clock),
    .reset(bankRam_3_reset),
    .io_r_addr(bankRam_3_io_r_addr),
    .io_r_data(bankRam_3_io_r_data),
    .io_w_en(bankRam_3_io_w_en),
    .io_w_addr(bankRam_3_io_w_addr),
    .io_w_data(bankRam_3_io_w_data),
    .io_w_mask(bankRam_3_io_w_mask)
  );
  assign io_r_data_0 = bankRam_0_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_1 = bankRam_1_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_2 = bankRam_2_io_r_data; // @[DataBank.scala 57:22]
  assign io_r_data_3 = bankRam_3_io_r_data; // @[DataBank.scala 57:22]
  assign bankRam_0_clock = clock;
  assign bankRam_0_reset = reset;
  assign bankRam_0_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_0_io_w_en = io_w_way[0] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_0_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_0_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_0_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_1_clock = clock;
  assign bankRam_1_reset = reset;
  assign bankRam_1_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_1_io_w_en = io_w_way[1] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_1_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_1_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_1_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_2_clock = clock;
  assign bankRam_2_reset = reset;
  assign bankRam_2_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_2_io_w_en = io_w_way[2] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_2_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_2_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_2_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
  assign bankRam_3_clock = clock;
  assign bankRam_3_reset = reset;
  assign bankRam_3_io_r_addr = io_r_set; // @[DataBank.scala 53:30]
  assign bankRam_3_io_w_en = io_w_way[3] & io_w_en; // @[DataBank.scala 39:43]
  assign bankRam_3_io_w_addr = io_w_set; // @[DataBank.scala 40:30]
  assign bankRam_3_io_w_data = io_w_data; // @[DataBank.scala 41:30]
  assign bankRam_3_io_w_mask = io_w_mask; // @[DataBank.scala 42:69]
endmodule
