module SRAMArray_2P_9(
  input        clock,
  input        reset,
  input  [6:0] io_r_addr,
  output [1:0] io_r_data_0,
  output [1:0] io_r_data_1,
  output [1:0] io_r_data_2,
  output [1:0] io_r_data_3,
  output [1:0] io_r_data_4,
  output [1:0] io_r_data_5,
  output [1:0] io_r_data_6,
  output [1:0] io_r_data_7,
  input        io_w_en,
  input  [6:0] io_w_addr,
  input  [7:0] io_w_maskOH
);
  wire  brams_0_clock; // @[SRAM_1.scala 202:38]
  wire  brams_0_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_0_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_0_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_0_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_0_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_1_clock; // @[SRAM_1.scala 202:38]
  wire  brams_1_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_1_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_1_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_1_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_1_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_2_clock; // @[SRAM_1.scala 202:38]
  wire  brams_2_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_2_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_2_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_2_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_2_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_3_clock; // @[SRAM_1.scala 202:38]
  wire  brams_3_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_3_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_3_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_3_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_3_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_4_clock; // @[SRAM_1.scala 202:38]
  wire  brams_4_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_4_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_4_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_4_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_4_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_5_clock; // @[SRAM_1.scala 202:38]
  wire  brams_5_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_5_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_5_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_5_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_5_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_6_clock; // @[SRAM_1.scala 202:38]
  wire  brams_6_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_6_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_6_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_6_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_6_io_w_addr; // @[SRAM_1.scala 202:38]
  wire  brams_7_clock; // @[SRAM_1.scala 202:38]
  wire  brams_7_reset; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_7_io_r_addr; // @[SRAM_1.scala 202:38]
  wire [1:0] brams_7_io_r_data; // @[SRAM_1.scala 202:38]
  wire  brams_7_io_w_en; // @[SRAM_1.scala 202:38]
  wire [6:0] brams_7_io_w_addr; // @[SRAM_1.scala 202:38]
  BankRAM_2P_72 brams_0 ( // @[SRAM_1.scala 202:38]
    .clock(brams_0_clock),
    .reset(brams_0_reset),
    .io_r_addr(brams_0_io_r_addr),
    .io_r_data(brams_0_io_r_data),
    .io_w_en(brams_0_io_w_en),
    .io_w_addr(brams_0_io_w_addr)
  );
  BankRAM_2P_72 brams_1 ( // @[SRAM_1.scala 202:38]
    .clock(brams_1_clock),
    .reset(brams_1_reset),
    .io_r_addr(brams_1_io_r_addr),
    .io_r_data(brams_1_io_r_data),
    .io_w_en(brams_1_io_w_en),
    .io_w_addr(brams_1_io_w_addr)
  );
  BankRAM_2P_72 brams_2 ( // @[SRAM_1.scala 202:38]
    .clock(brams_2_clock),
    .reset(brams_2_reset),
    .io_r_addr(brams_2_io_r_addr),
    .io_r_data(brams_2_io_r_data),
    .io_w_en(brams_2_io_w_en),
    .io_w_addr(brams_2_io_w_addr)
  );
  BankRAM_2P_72 brams_3 ( // @[SRAM_1.scala 202:38]
    .clock(brams_3_clock),
    .reset(brams_3_reset),
    .io_r_addr(brams_3_io_r_addr),
    .io_r_data(brams_3_io_r_data),
    .io_w_en(brams_3_io_w_en),
    .io_w_addr(brams_3_io_w_addr)
  );
  BankRAM_2P_72 brams_4 ( // @[SRAM_1.scala 202:38]
    .clock(brams_4_clock),
    .reset(brams_4_reset),
    .io_r_addr(brams_4_io_r_addr),
    .io_r_data(brams_4_io_r_data),
    .io_w_en(brams_4_io_w_en),
    .io_w_addr(brams_4_io_w_addr)
  );
  BankRAM_2P_72 brams_5 ( // @[SRAM_1.scala 202:38]
    .clock(brams_5_clock),
    .reset(brams_5_reset),
    .io_r_addr(brams_5_io_r_addr),
    .io_r_data(brams_5_io_r_data),
    .io_w_en(brams_5_io_w_en),
    .io_w_addr(brams_5_io_w_addr)
  );
  BankRAM_2P_72 brams_6 ( // @[SRAM_1.scala 202:38]
    .clock(brams_6_clock),
    .reset(brams_6_reset),
    .io_r_addr(brams_6_io_r_addr),
    .io_r_data(brams_6_io_r_data),
    .io_w_en(brams_6_io_w_en),
    .io_w_addr(brams_6_io_w_addr)
  );
  BankRAM_2P_72 brams_7 ( // @[SRAM_1.scala 202:38]
    .clock(brams_7_clock),
    .reset(brams_7_reset),
    .io_r_addr(brams_7_io_r_addr),
    .io_r_data(brams_7_io_r_data),
    .io_w_en(brams_7_io_w_en),
    .io_w_addr(brams_7_io_w_addr)
  );
  assign io_r_data_0 = brams_0_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_1 = brams_1_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_2 = brams_2_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_3 = brams_3_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_4 = brams_4_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_5 = brams_5_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_6 = brams_6_io_r_data; // @[SRAM_1.scala 207:22]
  assign io_r_data_7 = brams_7_io_r_data; // @[SRAM_1.scala 207:22]
  assign brams_0_clock = clock;
  assign brams_0_reset = reset;
  assign brams_0_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_0_io_w_en = io_w_en & io_w_maskOH[0]; // @[SRAM_1.scala 209:37]
  assign brams_0_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_1_clock = clock;
  assign brams_1_reset = reset;
  assign brams_1_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_1_io_w_en = io_w_en & io_w_maskOH[1]; // @[SRAM_1.scala 209:37]
  assign brams_1_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_2_clock = clock;
  assign brams_2_reset = reset;
  assign brams_2_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_2_io_w_en = io_w_en & io_w_maskOH[2]; // @[SRAM_1.scala 209:37]
  assign brams_2_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_3_clock = clock;
  assign brams_3_reset = reset;
  assign brams_3_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_3_io_w_en = io_w_en & io_w_maskOH[3]; // @[SRAM_1.scala 209:37]
  assign brams_3_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_4_clock = clock;
  assign brams_4_reset = reset;
  assign brams_4_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_4_io_w_en = io_w_en & io_w_maskOH[4]; // @[SRAM_1.scala 209:37]
  assign brams_4_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_5_clock = clock;
  assign brams_5_reset = reset;
  assign brams_5_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_5_io_w_en = io_w_en & io_w_maskOH[5]; // @[SRAM_1.scala 209:37]
  assign brams_5_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_6_clock = clock;
  assign brams_6_reset = reset;
  assign brams_6_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_6_io_w_en = io_w_en & io_w_maskOH[6]; // @[SRAM_1.scala 209:37]
  assign brams_6_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
  assign brams_7_clock = clock;
  assign brams_7_reset = reset;
  assign brams_7_io_r_addr = io_r_addr; // @[SRAM_1.scala 206:28]
  assign brams_7_io_w_en = io_w_en & io_w_maskOH[7]; // @[SRAM_1.scala 209:37]
  assign brams_7_io_w_addr = io_w_addr; // @[SRAM_1.scala 210:28]
endmodule
