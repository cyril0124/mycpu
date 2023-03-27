module BankRam1P_1_10(
  input        clock,
  input        reset,
  input  [5:0] io_addr,
  input        io_rw,
  input  [7:0] io_wdata,
  input  [3:0] io_wmask,
  output [7:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] ram_0 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_0_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_0_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_0_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_0_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_0_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_1 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_1_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_1_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_1_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_1_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_1_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_2 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_2_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_2_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_2_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_2_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_2_io_rdata_MPORT_addr_pipe_0;
  reg [1:0] ram_3 [0:63]; // @[SRAM.scala 36:26]
  wire  ram_3_io_rdata_MPORT_en; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_io_rdata_MPORT_addr; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_io_rdata_MPORT_data; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_1_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_1_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_2_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_2_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_3_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_3_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_4_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_4_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_5_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_5_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_6_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_6_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_7_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_7_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_8_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_8_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_9_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_9_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_10_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_10_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_11_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_11_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_12_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_12_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_13_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_13_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_14_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_14_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_15_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_15_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_16_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_16_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_17_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_17_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_18_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_18_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_19_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_19_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_20_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_20_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_21_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_21_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_22_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_22_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_23_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_23_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_24_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_24_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_25_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_25_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_26_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_26_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_27_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_27_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_28_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_28_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_29_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_29_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_30_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_30_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_31_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_31_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_32_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_32_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_33_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_33_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_34_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_34_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_35_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_35_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_36_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_36_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_37_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_37_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_38_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_38_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_39_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_39_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_40_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_40_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_41_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_41_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_42_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_42_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_43_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_43_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_44_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_44_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_45_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_45_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_46_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_46_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_47_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_47_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_48_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_48_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_49_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_49_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_50_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_50_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_51_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_51_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_52_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_52_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_53_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_53_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_54_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_54_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_55_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_55_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_56_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_56_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_57_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_57_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_58_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_58_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_59_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_59_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_60_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_60_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_61_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_61_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_62_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_62_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_63_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_63_en; // @[SRAM.scala 36:26]
  wire [1:0] ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
  wire [5:0] ram_3_MPORT_64_addr; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_mask; // @[SRAM.scala 36:26]
  wire  ram_3_MPORT_64_en; // @[SRAM.scala 36:26]
  reg  ram_3_io_rdata_MPORT_en_pipe_0;
  reg [5:0] ram_3_io_rdata_MPORT_addr_pipe_0;
  wire [3:0] io_rdata_lo = {ram_1_io_rdata_MPORT_data,ram_0_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  wire [3:0] io_rdata_hi = {ram_3_io_rdata_MPORT_data,ram_2_io_rdata_MPORT_data}; // @[SRAM.scala 75:39]
  assign ram_0_io_rdata_MPORT_en = ram_0_io_rdata_MPORT_en_pipe_0;
  assign ram_0_io_rdata_MPORT_addr = ram_0_io_rdata_MPORT_addr_pipe_0;
  assign ram_0_io_rdata_MPORT_data = ram_0[ram_0_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_0_MPORT_data = 2'h0;
  assign ram_0_MPORT_addr = 6'h0;
  assign ram_0_MPORT_mask = 1'h1;
  assign ram_0_MPORT_en = reset;
  assign ram_0_MPORT_1_data = 2'h0;
  assign ram_0_MPORT_1_addr = 6'h1;
  assign ram_0_MPORT_1_mask = 1'h1;
  assign ram_0_MPORT_1_en = reset;
  assign ram_0_MPORT_2_data = 2'h0;
  assign ram_0_MPORT_2_addr = 6'h2;
  assign ram_0_MPORT_2_mask = 1'h1;
  assign ram_0_MPORT_2_en = reset;
  assign ram_0_MPORT_3_data = 2'h0;
  assign ram_0_MPORT_3_addr = 6'h3;
  assign ram_0_MPORT_3_mask = 1'h1;
  assign ram_0_MPORT_3_en = reset;
  assign ram_0_MPORT_4_data = 2'h0;
  assign ram_0_MPORT_4_addr = 6'h4;
  assign ram_0_MPORT_4_mask = 1'h1;
  assign ram_0_MPORT_4_en = reset;
  assign ram_0_MPORT_5_data = 2'h0;
  assign ram_0_MPORT_5_addr = 6'h5;
  assign ram_0_MPORT_5_mask = 1'h1;
  assign ram_0_MPORT_5_en = reset;
  assign ram_0_MPORT_6_data = 2'h0;
  assign ram_0_MPORT_6_addr = 6'h6;
  assign ram_0_MPORT_6_mask = 1'h1;
  assign ram_0_MPORT_6_en = reset;
  assign ram_0_MPORT_7_data = 2'h0;
  assign ram_0_MPORT_7_addr = 6'h7;
  assign ram_0_MPORT_7_mask = 1'h1;
  assign ram_0_MPORT_7_en = reset;
  assign ram_0_MPORT_8_data = 2'h0;
  assign ram_0_MPORT_8_addr = 6'h8;
  assign ram_0_MPORT_8_mask = 1'h1;
  assign ram_0_MPORT_8_en = reset;
  assign ram_0_MPORT_9_data = 2'h0;
  assign ram_0_MPORT_9_addr = 6'h9;
  assign ram_0_MPORT_9_mask = 1'h1;
  assign ram_0_MPORT_9_en = reset;
  assign ram_0_MPORT_10_data = 2'h0;
  assign ram_0_MPORT_10_addr = 6'ha;
  assign ram_0_MPORT_10_mask = 1'h1;
  assign ram_0_MPORT_10_en = reset;
  assign ram_0_MPORT_11_data = 2'h0;
  assign ram_0_MPORT_11_addr = 6'hb;
  assign ram_0_MPORT_11_mask = 1'h1;
  assign ram_0_MPORT_11_en = reset;
  assign ram_0_MPORT_12_data = 2'h0;
  assign ram_0_MPORT_12_addr = 6'hc;
  assign ram_0_MPORT_12_mask = 1'h1;
  assign ram_0_MPORT_12_en = reset;
  assign ram_0_MPORT_13_data = 2'h0;
  assign ram_0_MPORT_13_addr = 6'hd;
  assign ram_0_MPORT_13_mask = 1'h1;
  assign ram_0_MPORT_13_en = reset;
  assign ram_0_MPORT_14_data = 2'h0;
  assign ram_0_MPORT_14_addr = 6'he;
  assign ram_0_MPORT_14_mask = 1'h1;
  assign ram_0_MPORT_14_en = reset;
  assign ram_0_MPORT_15_data = 2'h0;
  assign ram_0_MPORT_15_addr = 6'hf;
  assign ram_0_MPORT_15_mask = 1'h1;
  assign ram_0_MPORT_15_en = reset;
  assign ram_0_MPORT_16_data = 2'h0;
  assign ram_0_MPORT_16_addr = 6'h10;
  assign ram_0_MPORT_16_mask = 1'h1;
  assign ram_0_MPORT_16_en = reset;
  assign ram_0_MPORT_17_data = 2'h0;
  assign ram_0_MPORT_17_addr = 6'h11;
  assign ram_0_MPORT_17_mask = 1'h1;
  assign ram_0_MPORT_17_en = reset;
  assign ram_0_MPORT_18_data = 2'h0;
  assign ram_0_MPORT_18_addr = 6'h12;
  assign ram_0_MPORT_18_mask = 1'h1;
  assign ram_0_MPORT_18_en = reset;
  assign ram_0_MPORT_19_data = 2'h0;
  assign ram_0_MPORT_19_addr = 6'h13;
  assign ram_0_MPORT_19_mask = 1'h1;
  assign ram_0_MPORT_19_en = reset;
  assign ram_0_MPORT_20_data = 2'h0;
  assign ram_0_MPORT_20_addr = 6'h14;
  assign ram_0_MPORT_20_mask = 1'h1;
  assign ram_0_MPORT_20_en = reset;
  assign ram_0_MPORT_21_data = 2'h0;
  assign ram_0_MPORT_21_addr = 6'h15;
  assign ram_0_MPORT_21_mask = 1'h1;
  assign ram_0_MPORT_21_en = reset;
  assign ram_0_MPORT_22_data = 2'h0;
  assign ram_0_MPORT_22_addr = 6'h16;
  assign ram_0_MPORT_22_mask = 1'h1;
  assign ram_0_MPORT_22_en = reset;
  assign ram_0_MPORT_23_data = 2'h0;
  assign ram_0_MPORT_23_addr = 6'h17;
  assign ram_0_MPORT_23_mask = 1'h1;
  assign ram_0_MPORT_23_en = reset;
  assign ram_0_MPORT_24_data = 2'h0;
  assign ram_0_MPORT_24_addr = 6'h18;
  assign ram_0_MPORT_24_mask = 1'h1;
  assign ram_0_MPORT_24_en = reset;
  assign ram_0_MPORT_25_data = 2'h0;
  assign ram_0_MPORT_25_addr = 6'h19;
  assign ram_0_MPORT_25_mask = 1'h1;
  assign ram_0_MPORT_25_en = reset;
  assign ram_0_MPORT_26_data = 2'h0;
  assign ram_0_MPORT_26_addr = 6'h1a;
  assign ram_0_MPORT_26_mask = 1'h1;
  assign ram_0_MPORT_26_en = reset;
  assign ram_0_MPORT_27_data = 2'h0;
  assign ram_0_MPORT_27_addr = 6'h1b;
  assign ram_0_MPORT_27_mask = 1'h1;
  assign ram_0_MPORT_27_en = reset;
  assign ram_0_MPORT_28_data = 2'h0;
  assign ram_0_MPORT_28_addr = 6'h1c;
  assign ram_0_MPORT_28_mask = 1'h1;
  assign ram_0_MPORT_28_en = reset;
  assign ram_0_MPORT_29_data = 2'h0;
  assign ram_0_MPORT_29_addr = 6'h1d;
  assign ram_0_MPORT_29_mask = 1'h1;
  assign ram_0_MPORT_29_en = reset;
  assign ram_0_MPORT_30_data = 2'h0;
  assign ram_0_MPORT_30_addr = 6'h1e;
  assign ram_0_MPORT_30_mask = 1'h1;
  assign ram_0_MPORT_30_en = reset;
  assign ram_0_MPORT_31_data = 2'h0;
  assign ram_0_MPORT_31_addr = 6'h1f;
  assign ram_0_MPORT_31_mask = 1'h1;
  assign ram_0_MPORT_31_en = reset;
  assign ram_0_MPORT_32_data = 2'h0;
  assign ram_0_MPORT_32_addr = 6'h20;
  assign ram_0_MPORT_32_mask = 1'h1;
  assign ram_0_MPORT_32_en = reset;
  assign ram_0_MPORT_33_data = 2'h0;
  assign ram_0_MPORT_33_addr = 6'h21;
  assign ram_0_MPORT_33_mask = 1'h1;
  assign ram_0_MPORT_33_en = reset;
  assign ram_0_MPORT_34_data = 2'h0;
  assign ram_0_MPORT_34_addr = 6'h22;
  assign ram_0_MPORT_34_mask = 1'h1;
  assign ram_0_MPORT_34_en = reset;
  assign ram_0_MPORT_35_data = 2'h0;
  assign ram_0_MPORT_35_addr = 6'h23;
  assign ram_0_MPORT_35_mask = 1'h1;
  assign ram_0_MPORT_35_en = reset;
  assign ram_0_MPORT_36_data = 2'h0;
  assign ram_0_MPORT_36_addr = 6'h24;
  assign ram_0_MPORT_36_mask = 1'h1;
  assign ram_0_MPORT_36_en = reset;
  assign ram_0_MPORT_37_data = 2'h0;
  assign ram_0_MPORT_37_addr = 6'h25;
  assign ram_0_MPORT_37_mask = 1'h1;
  assign ram_0_MPORT_37_en = reset;
  assign ram_0_MPORT_38_data = 2'h0;
  assign ram_0_MPORT_38_addr = 6'h26;
  assign ram_0_MPORT_38_mask = 1'h1;
  assign ram_0_MPORT_38_en = reset;
  assign ram_0_MPORT_39_data = 2'h0;
  assign ram_0_MPORT_39_addr = 6'h27;
  assign ram_0_MPORT_39_mask = 1'h1;
  assign ram_0_MPORT_39_en = reset;
  assign ram_0_MPORT_40_data = 2'h0;
  assign ram_0_MPORT_40_addr = 6'h28;
  assign ram_0_MPORT_40_mask = 1'h1;
  assign ram_0_MPORT_40_en = reset;
  assign ram_0_MPORT_41_data = 2'h0;
  assign ram_0_MPORT_41_addr = 6'h29;
  assign ram_0_MPORT_41_mask = 1'h1;
  assign ram_0_MPORT_41_en = reset;
  assign ram_0_MPORT_42_data = 2'h0;
  assign ram_0_MPORT_42_addr = 6'h2a;
  assign ram_0_MPORT_42_mask = 1'h1;
  assign ram_0_MPORT_42_en = reset;
  assign ram_0_MPORT_43_data = 2'h0;
  assign ram_0_MPORT_43_addr = 6'h2b;
  assign ram_0_MPORT_43_mask = 1'h1;
  assign ram_0_MPORT_43_en = reset;
  assign ram_0_MPORT_44_data = 2'h0;
  assign ram_0_MPORT_44_addr = 6'h2c;
  assign ram_0_MPORT_44_mask = 1'h1;
  assign ram_0_MPORT_44_en = reset;
  assign ram_0_MPORT_45_data = 2'h0;
  assign ram_0_MPORT_45_addr = 6'h2d;
  assign ram_0_MPORT_45_mask = 1'h1;
  assign ram_0_MPORT_45_en = reset;
  assign ram_0_MPORT_46_data = 2'h0;
  assign ram_0_MPORT_46_addr = 6'h2e;
  assign ram_0_MPORT_46_mask = 1'h1;
  assign ram_0_MPORT_46_en = reset;
  assign ram_0_MPORT_47_data = 2'h0;
  assign ram_0_MPORT_47_addr = 6'h2f;
  assign ram_0_MPORT_47_mask = 1'h1;
  assign ram_0_MPORT_47_en = reset;
  assign ram_0_MPORT_48_data = 2'h0;
  assign ram_0_MPORT_48_addr = 6'h30;
  assign ram_0_MPORT_48_mask = 1'h1;
  assign ram_0_MPORT_48_en = reset;
  assign ram_0_MPORT_49_data = 2'h0;
  assign ram_0_MPORT_49_addr = 6'h31;
  assign ram_0_MPORT_49_mask = 1'h1;
  assign ram_0_MPORT_49_en = reset;
  assign ram_0_MPORT_50_data = 2'h0;
  assign ram_0_MPORT_50_addr = 6'h32;
  assign ram_0_MPORT_50_mask = 1'h1;
  assign ram_0_MPORT_50_en = reset;
  assign ram_0_MPORT_51_data = 2'h0;
  assign ram_0_MPORT_51_addr = 6'h33;
  assign ram_0_MPORT_51_mask = 1'h1;
  assign ram_0_MPORT_51_en = reset;
  assign ram_0_MPORT_52_data = 2'h0;
  assign ram_0_MPORT_52_addr = 6'h34;
  assign ram_0_MPORT_52_mask = 1'h1;
  assign ram_0_MPORT_52_en = reset;
  assign ram_0_MPORT_53_data = 2'h0;
  assign ram_0_MPORT_53_addr = 6'h35;
  assign ram_0_MPORT_53_mask = 1'h1;
  assign ram_0_MPORT_53_en = reset;
  assign ram_0_MPORT_54_data = 2'h0;
  assign ram_0_MPORT_54_addr = 6'h36;
  assign ram_0_MPORT_54_mask = 1'h1;
  assign ram_0_MPORT_54_en = reset;
  assign ram_0_MPORT_55_data = 2'h0;
  assign ram_0_MPORT_55_addr = 6'h37;
  assign ram_0_MPORT_55_mask = 1'h1;
  assign ram_0_MPORT_55_en = reset;
  assign ram_0_MPORT_56_data = 2'h0;
  assign ram_0_MPORT_56_addr = 6'h38;
  assign ram_0_MPORT_56_mask = 1'h1;
  assign ram_0_MPORT_56_en = reset;
  assign ram_0_MPORT_57_data = 2'h0;
  assign ram_0_MPORT_57_addr = 6'h39;
  assign ram_0_MPORT_57_mask = 1'h1;
  assign ram_0_MPORT_57_en = reset;
  assign ram_0_MPORT_58_data = 2'h0;
  assign ram_0_MPORT_58_addr = 6'h3a;
  assign ram_0_MPORT_58_mask = 1'h1;
  assign ram_0_MPORT_58_en = reset;
  assign ram_0_MPORT_59_data = 2'h0;
  assign ram_0_MPORT_59_addr = 6'h3b;
  assign ram_0_MPORT_59_mask = 1'h1;
  assign ram_0_MPORT_59_en = reset;
  assign ram_0_MPORT_60_data = 2'h0;
  assign ram_0_MPORT_60_addr = 6'h3c;
  assign ram_0_MPORT_60_mask = 1'h1;
  assign ram_0_MPORT_60_en = reset;
  assign ram_0_MPORT_61_data = 2'h0;
  assign ram_0_MPORT_61_addr = 6'h3d;
  assign ram_0_MPORT_61_mask = 1'h1;
  assign ram_0_MPORT_61_en = reset;
  assign ram_0_MPORT_62_data = 2'h0;
  assign ram_0_MPORT_62_addr = 6'h3e;
  assign ram_0_MPORT_62_mask = 1'h1;
  assign ram_0_MPORT_62_en = reset;
  assign ram_0_MPORT_63_data = 2'h0;
  assign ram_0_MPORT_63_addr = 6'h3f;
  assign ram_0_MPORT_63_mask = 1'h1;
  assign ram_0_MPORT_63_en = reset;
  assign ram_0_MPORT_64_data = io_wdata[1:0];
  assign ram_0_MPORT_64_addr = io_addr;
  assign ram_0_MPORT_64_mask = io_wmask[0];
  assign ram_0_MPORT_64_en = io_rw;
  assign ram_1_io_rdata_MPORT_en = ram_1_io_rdata_MPORT_en_pipe_0;
  assign ram_1_io_rdata_MPORT_addr = ram_1_io_rdata_MPORT_addr_pipe_0;
  assign ram_1_io_rdata_MPORT_data = ram_1[ram_1_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_1_MPORT_data = 2'h0;
  assign ram_1_MPORT_addr = 6'h0;
  assign ram_1_MPORT_mask = 1'h1;
  assign ram_1_MPORT_en = reset;
  assign ram_1_MPORT_1_data = 2'h0;
  assign ram_1_MPORT_1_addr = 6'h1;
  assign ram_1_MPORT_1_mask = 1'h1;
  assign ram_1_MPORT_1_en = reset;
  assign ram_1_MPORT_2_data = 2'h0;
  assign ram_1_MPORT_2_addr = 6'h2;
  assign ram_1_MPORT_2_mask = 1'h1;
  assign ram_1_MPORT_2_en = reset;
  assign ram_1_MPORT_3_data = 2'h0;
  assign ram_1_MPORT_3_addr = 6'h3;
  assign ram_1_MPORT_3_mask = 1'h1;
  assign ram_1_MPORT_3_en = reset;
  assign ram_1_MPORT_4_data = 2'h0;
  assign ram_1_MPORT_4_addr = 6'h4;
  assign ram_1_MPORT_4_mask = 1'h1;
  assign ram_1_MPORT_4_en = reset;
  assign ram_1_MPORT_5_data = 2'h0;
  assign ram_1_MPORT_5_addr = 6'h5;
  assign ram_1_MPORT_5_mask = 1'h1;
  assign ram_1_MPORT_5_en = reset;
  assign ram_1_MPORT_6_data = 2'h0;
  assign ram_1_MPORT_6_addr = 6'h6;
  assign ram_1_MPORT_6_mask = 1'h1;
  assign ram_1_MPORT_6_en = reset;
  assign ram_1_MPORT_7_data = 2'h0;
  assign ram_1_MPORT_7_addr = 6'h7;
  assign ram_1_MPORT_7_mask = 1'h1;
  assign ram_1_MPORT_7_en = reset;
  assign ram_1_MPORT_8_data = 2'h0;
  assign ram_1_MPORT_8_addr = 6'h8;
  assign ram_1_MPORT_8_mask = 1'h1;
  assign ram_1_MPORT_8_en = reset;
  assign ram_1_MPORT_9_data = 2'h0;
  assign ram_1_MPORT_9_addr = 6'h9;
  assign ram_1_MPORT_9_mask = 1'h1;
  assign ram_1_MPORT_9_en = reset;
  assign ram_1_MPORT_10_data = 2'h0;
  assign ram_1_MPORT_10_addr = 6'ha;
  assign ram_1_MPORT_10_mask = 1'h1;
  assign ram_1_MPORT_10_en = reset;
  assign ram_1_MPORT_11_data = 2'h0;
  assign ram_1_MPORT_11_addr = 6'hb;
  assign ram_1_MPORT_11_mask = 1'h1;
  assign ram_1_MPORT_11_en = reset;
  assign ram_1_MPORT_12_data = 2'h0;
  assign ram_1_MPORT_12_addr = 6'hc;
  assign ram_1_MPORT_12_mask = 1'h1;
  assign ram_1_MPORT_12_en = reset;
  assign ram_1_MPORT_13_data = 2'h0;
  assign ram_1_MPORT_13_addr = 6'hd;
  assign ram_1_MPORT_13_mask = 1'h1;
  assign ram_1_MPORT_13_en = reset;
  assign ram_1_MPORT_14_data = 2'h0;
  assign ram_1_MPORT_14_addr = 6'he;
  assign ram_1_MPORT_14_mask = 1'h1;
  assign ram_1_MPORT_14_en = reset;
  assign ram_1_MPORT_15_data = 2'h0;
  assign ram_1_MPORT_15_addr = 6'hf;
  assign ram_1_MPORT_15_mask = 1'h1;
  assign ram_1_MPORT_15_en = reset;
  assign ram_1_MPORT_16_data = 2'h0;
  assign ram_1_MPORT_16_addr = 6'h10;
  assign ram_1_MPORT_16_mask = 1'h1;
  assign ram_1_MPORT_16_en = reset;
  assign ram_1_MPORT_17_data = 2'h0;
  assign ram_1_MPORT_17_addr = 6'h11;
  assign ram_1_MPORT_17_mask = 1'h1;
  assign ram_1_MPORT_17_en = reset;
  assign ram_1_MPORT_18_data = 2'h0;
  assign ram_1_MPORT_18_addr = 6'h12;
  assign ram_1_MPORT_18_mask = 1'h1;
  assign ram_1_MPORT_18_en = reset;
  assign ram_1_MPORT_19_data = 2'h0;
  assign ram_1_MPORT_19_addr = 6'h13;
  assign ram_1_MPORT_19_mask = 1'h1;
  assign ram_1_MPORT_19_en = reset;
  assign ram_1_MPORT_20_data = 2'h0;
  assign ram_1_MPORT_20_addr = 6'h14;
  assign ram_1_MPORT_20_mask = 1'h1;
  assign ram_1_MPORT_20_en = reset;
  assign ram_1_MPORT_21_data = 2'h0;
  assign ram_1_MPORT_21_addr = 6'h15;
  assign ram_1_MPORT_21_mask = 1'h1;
  assign ram_1_MPORT_21_en = reset;
  assign ram_1_MPORT_22_data = 2'h0;
  assign ram_1_MPORT_22_addr = 6'h16;
  assign ram_1_MPORT_22_mask = 1'h1;
  assign ram_1_MPORT_22_en = reset;
  assign ram_1_MPORT_23_data = 2'h0;
  assign ram_1_MPORT_23_addr = 6'h17;
  assign ram_1_MPORT_23_mask = 1'h1;
  assign ram_1_MPORT_23_en = reset;
  assign ram_1_MPORT_24_data = 2'h0;
  assign ram_1_MPORT_24_addr = 6'h18;
  assign ram_1_MPORT_24_mask = 1'h1;
  assign ram_1_MPORT_24_en = reset;
  assign ram_1_MPORT_25_data = 2'h0;
  assign ram_1_MPORT_25_addr = 6'h19;
  assign ram_1_MPORT_25_mask = 1'h1;
  assign ram_1_MPORT_25_en = reset;
  assign ram_1_MPORT_26_data = 2'h0;
  assign ram_1_MPORT_26_addr = 6'h1a;
  assign ram_1_MPORT_26_mask = 1'h1;
  assign ram_1_MPORT_26_en = reset;
  assign ram_1_MPORT_27_data = 2'h0;
  assign ram_1_MPORT_27_addr = 6'h1b;
  assign ram_1_MPORT_27_mask = 1'h1;
  assign ram_1_MPORT_27_en = reset;
  assign ram_1_MPORT_28_data = 2'h0;
  assign ram_1_MPORT_28_addr = 6'h1c;
  assign ram_1_MPORT_28_mask = 1'h1;
  assign ram_1_MPORT_28_en = reset;
  assign ram_1_MPORT_29_data = 2'h0;
  assign ram_1_MPORT_29_addr = 6'h1d;
  assign ram_1_MPORT_29_mask = 1'h1;
  assign ram_1_MPORT_29_en = reset;
  assign ram_1_MPORT_30_data = 2'h0;
  assign ram_1_MPORT_30_addr = 6'h1e;
  assign ram_1_MPORT_30_mask = 1'h1;
  assign ram_1_MPORT_30_en = reset;
  assign ram_1_MPORT_31_data = 2'h0;
  assign ram_1_MPORT_31_addr = 6'h1f;
  assign ram_1_MPORT_31_mask = 1'h1;
  assign ram_1_MPORT_31_en = reset;
  assign ram_1_MPORT_32_data = 2'h0;
  assign ram_1_MPORT_32_addr = 6'h20;
  assign ram_1_MPORT_32_mask = 1'h1;
  assign ram_1_MPORT_32_en = reset;
  assign ram_1_MPORT_33_data = 2'h0;
  assign ram_1_MPORT_33_addr = 6'h21;
  assign ram_1_MPORT_33_mask = 1'h1;
  assign ram_1_MPORT_33_en = reset;
  assign ram_1_MPORT_34_data = 2'h0;
  assign ram_1_MPORT_34_addr = 6'h22;
  assign ram_1_MPORT_34_mask = 1'h1;
  assign ram_1_MPORT_34_en = reset;
  assign ram_1_MPORT_35_data = 2'h0;
  assign ram_1_MPORT_35_addr = 6'h23;
  assign ram_1_MPORT_35_mask = 1'h1;
  assign ram_1_MPORT_35_en = reset;
  assign ram_1_MPORT_36_data = 2'h0;
  assign ram_1_MPORT_36_addr = 6'h24;
  assign ram_1_MPORT_36_mask = 1'h1;
  assign ram_1_MPORT_36_en = reset;
  assign ram_1_MPORT_37_data = 2'h0;
  assign ram_1_MPORT_37_addr = 6'h25;
  assign ram_1_MPORT_37_mask = 1'h1;
  assign ram_1_MPORT_37_en = reset;
  assign ram_1_MPORT_38_data = 2'h0;
  assign ram_1_MPORT_38_addr = 6'h26;
  assign ram_1_MPORT_38_mask = 1'h1;
  assign ram_1_MPORT_38_en = reset;
  assign ram_1_MPORT_39_data = 2'h0;
  assign ram_1_MPORT_39_addr = 6'h27;
  assign ram_1_MPORT_39_mask = 1'h1;
  assign ram_1_MPORT_39_en = reset;
  assign ram_1_MPORT_40_data = 2'h0;
  assign ram_1_MPORT_40_addr = 6'h28;
  assign ram_1_MPORT_40_mask = 1'h1;
  assign ram_1_MPORT_40_en = reset;
  assign ram_1_MPORT_41_data = 2'h0;
  assign ram_1_MPORT_41_addr = 6'h29;
  assign ram_1_MPORT_41_mask = 1'h1;
  assign ram_1_MPORT_41_en = reset;
  assign ram_1_MPORT_42_data = 2'h0;
  assign ram_1_MPORT_42_addr = 6'h2a;
  assign ram_1_MPORT_42_mask = 1'h1;
  assign ram_1_MPORT_42_en = reset;
  assign ram_1_MPORT_43_data = 2'h0;
  assign ram_1_MPORT_43_addr = 6'h2b;
  assign ram_1_MPORT_43_mask = 1'h1;
  assign ram_1_MPORT_43_en = reset;
  assign ram_1_MPORT_44_data = 2'h0;
  assign ram_1_MPORT_44_addr = 6'h2c;
  assign ram_1_MPORT_44_mask = 1'h1;
  assign ram_1_MPORT_44_en = reset;
  assign ram_1_MPORT_45_data = 2'h0;
  assign ram_1_MPORT_45_addr = 6'h2d;
  assign ram_1_MPORT_45_mask = 1'h1;
  assign ram_1_MPORT_45_en = reset;
  assign ram_1_MPORT_46_data = 2'h0;
  assign ram_1_MPORT_46_addr = 6'h2e;
  assign ram_1_MPORT_46_mask = 1'h1;
  assign ram_1_MPORT_46_en = reset;
  assign ram_1_MPORT_47_data = 2'h0;
  assign ram_1_MPORT_47_addr = 6'h2f;
  assign ram_1_MPORT_47_mask = 1'h1;
  assign ram_1_MPORT_47_en = reset;
  assign ram_1_MPORT_48_data = 2'h0;
  assign ram_1_MPORT_48_addr = 6'h30;
  assign ram_1_MPORT_48_mask = 1'h1;
  assign ram_1_MPORT_48_en = reset;
  assign ram_1_MPORT_49_data = 2'h0;
  assign ram_1_MPORT_49_addr = 6'h31;
  assign ram_1_MPORT_49_mask = 1'h1;
  assign ram_1_MPORT_49_en = reset;
  assign ram_1_MPORT_50_data = 2'h0;
  assign ram_1_MPORT_50_addr = 6'h32;
  assign ram_1_MPORT_50_mask = 1'h1;
  assign ram_1_MPORT_50_en = reset;
  assign ram_1_MPORT_51_data = 2'h0;
  assign ram_1_MPORT_51_addr = 6'h33;
  assign ram_1_MPORT_51_mask = 1'h1;
  assign ram_1_MPORT_51_en = reset;
  assign ram_1_MPORT_52_data = 2'h0;
  assign ram_1_MPORT_52_addr = 6'h34;
  assign ram_1_MPORT_52_mask = 1'h1;
  assign ram_1_MPORT_52_en = reset;
  assign ram_1_MPORT_53_data = 2'h0;
  assign ram_1_MPORT_53_addr = 6'h35;
  assign ram_1_MPORT_53_mask = 1'h1;
  assign ram_1_MPORT_53_en = reset;
  assign ram_1_MPORT_54_data = 2'h0;
  assign ram_1_MPORT_54_addr = 6'h36;
  assign ram_1_MPORT_54_mask = 1'h1;
  assign ram_1_MPORT_54_en = reset;
  assign ram_1_MPORT_55_data = 2'h0;
  assign ram_1_MPORT_55_addr = 6'h37;
  assign ram_1_MPORT_55_mask = 1'h1;
  assign ram_1_MPORT_55_en = reset;
  assign ram_1_MPORT_56_data = 2'h0;
  assign ram_1_MPORT_56_addr = 6'h38;
  assign ram_1_MPORT_56_mask = 1'h1;
  assign ram_1_MPORT_56_en = reset;
  assign ram_1_MPORT_57_data = 2'h0;
  assign ram_1_MPORT_57_addr = 6'h39;
  assign ram_1_MPORT_57_mask = 1'h1;
  assign ram_1_MPORT_57_en = reset;
  assign ram_1_MPORT_58_data = 2'h0;
  assign ram_1_MPORT_58_addr = 6'h3a;
  assign ram_1_MPORT_58_mask = 1'h1;
  assign ram_1_MPORT_58_en = reset;
  assign ram_1_MPORT_59_data = 2'h0;
  assign ram_1_MPORT_59_addr = 6'h3b;
  assign ram_1_MPORT_59_mask = 1'h1;
  assign ram_1_MPORT_59_en = reset;
  assign ram_1_MPORT_60_data = 2'h0;
  assign ram_1_MPORT_60_addr = 6'h3c;
  assign ram_1_MPORT_60_mask = 1'h1;
  assign ram_1_MPORT_60_en = reset;
  assign ram_1_MPORT_61_data = 2'h0;
  assign ram_1_MPORT_61_addr = 6'h3d;
  assign ram_1_MPORT_61_mask = 1'h1;
  assign ram_1_MPORT_61_en = reset;
  assign ram_1_MPORT_62_data = 2'h0;
  assign ram_1_MPORT_62_addr = 6'h3e;
  assign ram_1_MPORT_62_mask = 1'h1;
  assign ram_1_MPORT_62_en = reset;
  assign ram_1_MPORT_63_data = 2'h0;
  assign ram_1_MPORT_63_addr = 6'h3f;
  assign ram_1_MPORT_63_mask = 1'h1;
  assign ram_1_MPORT_63_en = reset;
  assign ram_1_MPORT_64_data = io_wdata[3:2];
  assign ram_1_MPORT_64_addr = io_addr;
  assign ram_1_MPORT_64_mask = io_wmask[1];
  assign ram_1_MPORT_64_en = io_rw;
  assign ram_2_io_rdata_MPORT_en = ram_2_io_rdata_MPORT_en_pipe_0;
  assign ram_2_io_rdata_MPORT_addr = ram_2_io_rdata_MPORT_addr_pipe_0;
  assign ram_2_io_rdata_MPORT_data = ram_2[ram_2_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_2_MPORT_data = 2'h0;
  assign ram_2_MPORT_addr = 6'h0;
  assign ram_2_MPORT_mask = 1'h1;
  assign ram_2_MPORT_en = reset;
  assign ram_2_MPORT_1_data = 2'h0;
  assign ram_2_MPORT_1_addr = 6'h1;
  assign ram_2_MPORT_1_mask = 1'h1;
  assign ram_2_MPORT_1_en = reset;
  assign ram_2_MPORT_2_data = 2'h0;
  assign ram_2_MPORT_2_addr = 6'h2;
  assign ram_2_MPORT_2_mask = 1'h1;
  assign ram_2_MPORT_2_en = reset;
  assign ram_2_MPORT_3_data = 2'h0;
  assign ram_2_MPORT_3_addr = 6'h3;
  assign ram_2_MPORT_3_mask = 1'h1;
  assign ram_2_MPORT_3_en = reset;
  assign ram_2_MPORT_4_data = 2'h0;
  assign ram_2_MPORT_4_addr = 6'h4;
  assign ram_2_MPORT_4_mask = 1'h1;
  assign ram_2_MPORT_4_en = reset;
  assign ram_2_MPORT_5_data = 2'h0;
  assign ram_2_MPORT_5_addr = 6'h5;
  assign ram_2_MPORT_5_mask = 1'h1;
  assign ram_2_MPORT_5_en = reset;
  assign ram_2_MPORT_6_data = 2'h0;
  assign ram_2_MPORT_6_addr = 6'h6;
  assign ram_2_MPORT_6_mask = 1'h1;
  assign ram_2_MPORT_6_en = reset;
  assign ram_2_MPORT_7_data = 2'h0;
  assign ram_2_MPORT_7_addr = 6'h7;
  assign ram_2_MPORT_7_mask = 1'h1;
  assign ram_2_MPORT_7_en = reset;
  assign ram_2_MPORT_8_data = 2'h0;
  assign ram_2_MPORT_8_addr = 6'h8;
  assign ram_2_MPORT_8_mask = 1'h1;
  assign ram_2_MPORT_8_en = reset;
  assign ram_2_MPORT_9_data = 2'h0;
  assign ram_2_MPORT_9_addr = 6'h9;
  assign ram_2_MPORT_9_mask = 1'h1;
  assign ram_2_MPORT_9_en = reset;
  assign ram_2_MPORT_10_data = 2'h0;
  assign ram_2_MPORT_10_addr = 6'ha;
  assign ram_2_MPORT_10_mask = 1'h1;
  assign ram_2_MPORT_10_en = reset;
  assign ram_2_MPORT_11_data = 2'h0;
  assign ram_2_MPORT_11_addr = 6'hb;
  assign ram_2_MPORT_11_mask = 1'h1;
  assign ram_2_MPORT_11_en = reset;
  assign ram_2_MPORT_12_data = 2'h0;
  assign ram_2_MPORT_12_addr = 6'hc;
  assign ram_2_MPORT_12_mask = 1'h1;
  assign ram_2_MPORT_12_en = reset;
  assign ram_2_MPORT_13_data = 2'h0;
  assign ram_2_MPORT_13_addr = 6'hd;
  assign ram_2_MPORT_13_mask = 1'h1;
  assign ram_2_MPORT_13_en = reset;
  assign ram_2_MPORT_14_data = 2'h0;
  assign ram_2_MPORT_14_addr = 6'he;
  assign ram_2_MPORT_14_mask = 1'h1;
  assign ram_2_MPORT_14_en = reset;
  assign ram_2_MPORT_15_data = 2'h0;
  assign ram_2_MPORT_15_addr = 6'hf;
  assign ram_2_MPORT_15_mask = 1'h1;
  assign ram_2_MPORT_15_en = reset;
  assign ram_2_MPORT_16_data = 2'h0;
  assign ram_2_MPORT_16_addr = 6'h10;
  assign ram_2_MPORT_16_mask = 1'h1;
  assign ram_2_MPORT_16_en = reset;
  assign ram_2_MPORT_17_data = 2'h0;
  assign ram_2_MPORT_17_addr = 6'h11;
  assign ram_2_MPORT_17_mask = 1'h1;
  assign ram_2_MPORT_17_en = reset;
  assign ram_2_MPORT_18_data = 2'h0;
  assign ram_2_MPORT_18_addr = 6'h12;
  assign ram_2_MPORT_18_mask = 1'h1;
  assign ram_2_MPORT_18_en = reset;
  assign ram_2_MPORT_19_data = 2'h0;
  assign ram_2_MPORT_19_addr = 6'h13;
  assign ram_2_MPORT_19_mask = 1'h1;
  assign ram_2_MPORT_19_en = reset;
  assign ram_2_MPORT_20_data = 2'h0;
  assign ram_2_MPORT_20_addr = 6'h14;
  assign ram_2_MPORT_20_mask = 1'h1;
  assign ram_2_MPORT_20_en = reset;
  assign ram_2_MPORT_21_data = 2'h0;
  assign ram_2_MPORT_21_addr = 6'h15;
  assign ram_2_MPORT_21_mask = 1'h1;
  assign ram_2_MPORT_21_en = reset;
  assign ram_2_MPORT_22_data = 2'h0;
  assign ram_2_MPORT_22_addr = 6'h16;
  assign ram_2_MPORT_22_mask = 1'h1;
  assign ram_2_MPORT_22_en = reset;
  assign ram_2_MPORT_23_data = 2'h0;
  assign ram_2_MPORT_23_addr = 6'h17;
  assign ram_2_MPORT_23_mask = 1'h1;
  assign ram_2_MPORT_23_en = reset;
  assign ram_2_MPORT_24_data = 2'h0;
  assign ram_2_MPORT_24_addr = 6'h18;
  assign ram_2_MPORT_24_mask = 1'h1;
  assign ram_2_MPORT_24_en = reset;
  assign ram_2_MPORT_25_data = 2'h0;
  assign ram_2_MPORT_25_addr = 6'h19;
  assign ram_2_MPORT_25_mask = 1'h1;
  assign ram_2_MPORT_25_en = reset;
  assign ram_2_MPORT_26_data = 2'h0;
  assign ram_2_MPORT_26_addr = 6'h1a;
  assign ram_2_MPORT_26_mask = 1'h1;
  assign ram_2_MPORT_26_en = reset;
  assign ram_2_MPORT_27_data = 2'h0;
  assign ram_2_MPORT_27_addr = 6'h1b;
  assign ram_2_MPORT_27_mask = 1'h1;
  assign ram_2_MPORT_27_en = reset;
  assign ram_2_MPORT_28_data = 2'h0;
  assign ram_2_MPORT_28_addr = 6'h1c;
  assign ram_2_MPORT_28_mask = 1'h1;
  assign ram_2_MPORT_28_en = reset;
  assign ram_2_MPORT_29_data = 2'h0;
  assign ram_2_MPORT_29_addr = 6'h1d;
  assign ram_2_MPORT_29_mask = 1'h1;
  assign ram_2_MPORT_29_en = reset;
  assign ram_2_MPORT_30_data = 2'h0;
  assign ram_2_MPORT_30_addr = 6'h1e;
  assign ram_2_MPORT_30_mask = 1'h1;
  assign ram_2_MPORT_30_en = reset;
  assign ram_2_MPORT_31_data = 2'h0;
  assign ram_2_MPORT_31_addr = 6'h1f;
  assign ram_2_MPORT_31_mask = 1'h1;
  assign ram_2_MPORT_31_en = reset;
  assign ram_2_MPORT_32_data = 2'h0;
  assign ram_2_MPORT_32_addr = 6'h20;
  assign ram_2_MPORT_32_mask = 1'h1;
  assign ram_2_MPORT_32_en = reset;
  assign ram_2_MPORT_33_data = 2'h0;
  assign ram_2_MPORT_33_addr = 6'h21;
  assign ram_2_MPORT_33_mask = 1'h1;
  assign ram_2_MPORT_33_en = reset;
  assign ram_2_MPORT_34_data = 2'h0;
  assign ram_2_MPORT_34_addr = 6'h22;
  assign ram_2_MPORT_34_mask = 1'h1;
  assign ram_2_MPORT_34_en = reset;
  assign ram_2_MPORT_35_data = 2'h0;
  assign ram_2_MPORT_35_addr = 6'h23;
  assign ram_2_MPORT_35_mask = 1'h1;
  assign ram_2_MPORT_35_en = reset;
  assign ram_2_MPORT_36_data = 2'h0;
  assign ram_2_MPORT_36_addr = 6'h24;
  assign ram_2_MPORT_36_mask = 1'h1;
  assign ram_2_MPORT_36_en = reset;
  assign ram_2_MPORT_37_data = 2'h0;
  assign ram_2_MPORT_37_addr = 6'h25;
  assign ram_2_MPORT_37_mask = 1'h1;
  assign ram_2_MPORT_37_en = reset;
  assign ram_2_MPORT_38_data = 2'h0;
  assign ram_2_MPORT_38_addr = 6'h26;
  assign ram_2_MPORT_38_mask = 1'h1;
  assign ram_2_MPORT_38_en = reset;
  assign ram_2_MPORT_39_data = 2'h0;
  assign ram_2_MPORT_39_addr = 6'h27;
  assign ram_2_MPORT_39_mask = 1'h1;
  assign ram_2_MPORT_39_en = reset;
  assign ram_2_MPORT_40_data = 2'h0;
  assign ram_2_MPORT_40_addr = 6'h28;
  assign ram_2_MPORT_40_mask = 1'h1;
  assign ram_2_MPORT_40_en = reset;
  assign ram_2_MPORT_41_data = 2'h0;
  assign ram_2_MPORT_41_addr = 6'h29;
  assign ram_2_MPORT_41_mask = 1'h1;
  assign ram_2_MPORT_41_en = reset;
  assign ram_2_MPORT_42_data = 2'h0;
  assign ram_2_MPORT_42_addr = 6'h2a;
  assign ram_2_MPORT_42_mask = 1'h1;
  assign ram_2_MPORT_42_en = reset;
  assign ram_2_MPORT_43_data = 2'h0;
  assign ram_2_MPORT_43_addr = 6'h2b;
  assign ram_2_MPORT_43_mask = 1'h1;
  assign ram_2_MPORT_43_en = reset;
  assign ram_2_MPORT_44_data = 2'h0;
  assign ram_2_MPORT_44_addr = 6'h2c;
  assign ram_2_MPORT_44_mask = 1'h1;
  assign ram_2_MPORT_44_en = reset;
  assign ram_2_MPORT_45_data = 2'h0;
  assign ram_2_MPORT_45_addr = 6'h2d;
  assign ram_2_MPORT_45_mask = 1'h1;
  assign ram_2_MPORT_45_en = reset;
  assign ram_2_MPORT_46_data = 2'h0;
  assign ram_2_MPORT_46_addr = 6'h2e;
  assign ram_2_MPORT_46_mask = 1'h1;
  assign ram_2_MPORT_46_en = reset;
  assign ram_2_MPORT_47_data = 2'h0;
  assign ram_2_MPORT_47_addr = 6'h2f;
  assign ram_2_MPORT_47_mask = 1'h1;
  assign ram_2_MPORT_47_en = reset;
  assign ram_2_MPORT_48_data = 2'h0;
  assign ram_2_MPORT_48_addr = 6'h30;
  assign ram_2_MPORT_48_mask = 1'h1;
  assign ram_2_MPORT_48_en = reset;
  assign ram_2_MPORT_49_data = 2'h0;
  assign ram_2_MPORT_49_addr = 6'h31;
  assign ram_2_MPORT_49_mask = 1'h1;
  assign ram_2_MPORT_49_en = reset;
  assign ram_2_MPORT_50_data = 2'h0;
  assign ram_2_MPORT_50_addr = 6'h32;
  assign ram_2_MPORT_50_mask = 1'h1;
  assign ram_2_MPORT_50_en = reset;
  assign ram_2_MPORT_51_data = 2'h0;
  assign ram_2_MPORT_51_addr = 6'h33;
  assign ram_2_MPORT_51_mask = 1'h1;
  assign ram_2_MPORT_51_en = reset;
  assign ram_2_MPORT_52_data = 2'h0;
  assign ram_2_MPORT_52_addr = 6'h34;
  assign ram_2_MPORT_52_mask = 1'h1;
  assign ram_2_MPORT_52_en = reset;
  assign ram_2_MPORT_53_data = 2'h0;
  assign ram_2_MPORT_53_addr = 6'h35;
  assign ram_2_MPORT_53_mask = 1'h1;
  assign ram_2_MPORT_53_en = reset;
  assign ram_2_MPORT_54_data = 2'h0;
  assign ram_2_MPORT_54_addr = 6'h36;
  assign ram_2_MPORT_54_mask = 1'h1;
  assign ram_2_MPORT_54_en = reset;
  assign ram_2_MPORT_55_data = 2'h0;
  assign ram_2_MPORT_55_addr = 6'h37;
  assign ram_2_MPORT_55_mask = 1'h1;
  assign ram_2_MPORT_55_en = reset;
  assign ram_2_MPORT_56_data = 2'h0;
  assign ram_2_MPORT_56_addr = 6'h38;
  assign ram_2_MPORT_56_mask = 1'h1;
  assign ram_2_MPORT_56_en = reset;
  assign ram_2_MPORT_57_data = 2'h0;
  assign ram_2_MPORT_57_addr = 6'h39;
  assign ram_2_MPORT_57_mask = 1'h1;
  assign ram_2_MPORT_57_en = reset;
  assign ram_2_MPORT_58_data = 2'h0;
  assign ram_2_MPORT_58_addr = 6'h3a;
  assign ram_2_MPORT_58_mask = 1'h1;
  assign ram_2_MPORT_58_en = reset;
  assign ram_2_MPORT_59_data = 2'h0;
  assign ram_2_MPORT_59_addr = 6'h3b;
  assign ram_2_MPORT_59_mask = 1'h1;
  assign ram_2_MPORT_59_en = reset;
  assign ram_2_MPORT_60_data = 2'h0;
  assign ram_2_MPORT_60_addr = 6'h3c;
  assign ram_2_MPORT_60_mask = 1'h1;
  assign ram_2_MPORT_60_en = reset;
  assign ram_2_MPORT_61_data = 2'h0;
  assign ram_2_MPORT_61_addr = 6'h3d;
  assign ram_2_MPORT_61_mask = 1'h1;
  assign ram_2_MPORT_61_en = reset;
  assign ram_2_MPORT_62_data = 2'h0;
  assign ram_2_MPORT_62_addr = 6'h3e;
  assign ram_2_MPORT_62_mask = 1'h1;
  assign ram_2_MPORT_62_en = reset;
  assign ram_2_MPORT_63_data = 2'h0;
  assign ram_2_MPORT_63_addr = 6'h3f;
  assign ram_2_MPORT_63_mask = 1'h1;
  assign ram_2_MPORT_63_en = reset;
  assign ram_2_MPORT_64_data = io_wdata[5:4];
  assign ram_2_MPORT_64_addr = io_addr;
  assign ram_2_MPORT_64_mask = io_wmask[2];
  assign ram_2_MPORT_64_en = io_rw;
  assign ram_3_io_rdata_MPORT_en = ram_3_io_rdata_MPORT_en_pipe_0;
  assign ram_3_io_rdata_MPORT_addr = ram_3_io_rdata_MPORT_addr_pipe_0;
  assign ram_3_io_rdata_MPORT_data = ram_3[ram_3_io_rdata_MPORT_addr]; // @[SRAM.scala 36:26]
  assign ram_3_MPORT_data = 2'h0;
  assign ram_3_MPORT_addr = 6'h0;
  assign ram_3_MPORT_mask = 1'h1;
  assign ram_3_MPORT_en = reset;
  assign ram_3_MPORT_1_data = 2'h0;
  assign ram_3_MPORT_1_addr = 6'h1;
  assign ram_3_MPORT_1_mask = 1'h1;
  assign ram_3_MPORT_1_en = reset;
  assign ram_3_MPORT_2_data = 2'h0;
  assign ram_3_MPORT_2_addr = 6'h2;
  assign ram_3_MPORT_2_mask = 1'h1;
  assign ram_3_MPORT_2_en = reset;
  assign ram_3_MPORT_3_data = 2'h0;
  assign ram_3_MPORT_3_addr = 6'h3;
  assign ram_3_MPORT_3_mask = 1'h1;
  assign ram_3_MPORT_3_en = reset;
  assign ram_3_MPORT_4_data = 2'h0;
  assign ram_3_MPORT_4_addr = 6'h4;
  assign ram_3_MPORT_4_mask = 1'h1;
  assign ram_3_MPORT_4_en = reset;
  assign ram_3_MPORT_5_data = 2'h0;
  assign ram_3_MPORT_5_addr = 6'h5;
  assign ram_3_MPORT_5_mask = 1'h1;
  assign ram_3_MPORT_5_en = reset;
  assign ram_3_MPORT_6_data = 2'h0;
  assign ram_3_MPORT_6_addr = 6'h6;
  assign ram_3_MPORT_6_mask = 1'h1;
  assign ram_3_MPORT_6_en = reset;
  assign ram_3_MPORT_7_data = 2'h0;
  assign ram_3_MPORT_7_addr = 6'h7;
  assign ram_3_MPORT_7_mask = 1'h1;
  assign ram_3_MPORT_7_en = reset;
  assign ram_3_MPORT_8_data = 2'h0;
  assign ram_3_MPORT_8_addr = 6'h8;
  assign ram_3_MPORT_8_mask = 1'h1;
  assign ram_3_MPORT_8_en = reset;
  assign ram_3_MPORT_9_data = 2'h0;
  assign ram_3_MPORT_9_addr = 6'h9;
  assign ram_3_MPORT_9_mask = 1'h1;
  assign ram_3_MPORT_9_en = reset;
  assign ram_3_MPORT_10_data = 2'h0;
  assign ram_3_MPORT_10_addr = 6'ha;
  assign ram_3_MPORT_10_mask = 1'h1;
  assign ram_3_MPORT_10_en = reset;
  assign ram_3_MPORT_11_data = 2'h0;
  assign ram_3_MPORT_11_addr = 6'hb;
  assign ram_3_MPORT_11_mask = 1'h1;
  assign ram_3_MPORT_11_en = reset;
  assign ram_3_MPORT_12_data = 2'h0;
  assign ram_3_MPORT_12_addr = 6'hc;
  assign ram_3_MPORT_12_mask = 1'h1;
  assign ram_3_MPORT_12_en = reset;
  assign ram_3_MPORT_13_data = 2'h0;
  assign ram_3_MPORT_13_addr = 6'hd;
  assign ram_3_MPORT_13_mask = 1'h1;
  assign ram_3_MPORT_13_en = reset;
  assign ram_3_MPORT_14_data = 2'h0;
  assign ram_3_MPORT_14_addr = 6'he;
  assign ram_3_MPORT_14_mask = 1'h1;
  assign ram_3_MPORT_14_en = reset;
  assign ram_3_MPORT_15_data = 2'h0;
  assign ram_3_MPORT_15_addr = 6'hf;
  assign ram_3_MPORT_15_mask = 1'h1;
  assign ram_3_MPORT_15_en = reset;
  assign ram_3_MPORT_16_data = 2'h0;
  assign ram_3_MPORT_16_addr = 6'h10;
  assign ram_3_MPORT_16_mask = 1'h1;
  assign ram_3_MPORT_16_en = reset;
  assign ram_3_MPORT_17_data = 2'h0;
  assign ram_3_MPORT_17_addr = 6'h11;
  assign ram_3_MPORT_17_mask = 1'h1;
  assign ram_3_MPORT_17_en = reset;
  assign ram_3_MPORT_18_data = 2'h0;
  assign ram_3_MPORT_18_addr = 6'h12;
  assign ram_3_MPORT_18_mask = 1'h1;
  assign ram_3_MPORT_18_en = reset;
  assign ram_3_MPORT_19_data = 2'h0;
  assign ram_3_MPORT_19_addr = 6'h13;
  assign ram_3_MPORT_19_mask = 1'h1;
  assign ram_3_MPORT_19_en = reset;
  assign ram_3_MPORT_20_data = 2'h0;
  assign ram_3_MPORT_20_addr = 6'h14;
  assign ram_3_MPORT_20_mask = 1'h1;
  assign ram_3_MPORT_20_en = reset;
  assign ram_3_MPORT_21_data = 2'h0;
  assign ram_3_MPORT_21_addr = 6'h15;
  assign ram_3_MPORT_21_mask = 1'h1;
  assign ram_3_MPORT_21_en = reset;
  assign ram_3_MPORT_22_data = 2'h0;
  assign ram_3_MPORT_22_addr = 6'h16;
  assign ram_3_MPORT_22_mask = 1'h1;
  assign ram_3_MPORT_22_en = reset;
  assign ram_3_MPORT_23_data = 2'h0;
  assign ram_3_MPORT_23_addr = 6'h17;
  assign ram_3_MPORT_23_mask = 1'h1;
  assign ram_3_MPORT_23_en = reset;
  assign ram_3_MPORT_24_data = 2'h0;
  assign ram_3_MPORT_24_addr = 6'h18;
  assign ram_3_MPORT_24_mask = 1'h1;
  assign ram_3_MPORT_24_en = reset;
  assign ram_3_MPORT_25_data = 2'h0;
  assign ram_3_MPORT_25_addr = 6'h19;
  assign ram_3_MPORT_25_mask = 1'h1;
  assign ram_3_MPORT_25_en = reset;
  assign ram_3_MPORT_26_data = 2'h0;
  assign ram_3_MPORT_26_addr = 6'h1a;
  assign ram_3_MPORT_26_mask = 1'h1;
  assign ram_3_MPORT_26_en = reset;
  assign ram_3_MPORT_27_data = 2'h0;
  assign ram_3_MPORT_27_addr = 6'h1b;
  assign ram_3_MPORT_27_mask = 1'h1;
  assign ram_3_MPORT_27_en = reset;
  assign ram_3_MPORT_28_data = 2'h0;
  assign ram_3_MPORT_28_addr = 6'h1c;
  assign ram_3_MPORT_28_mask = 1'h1;
  assign ram_3_MPORT_28_en = reset;
  assign ram_3_MPORT_29_data = 2'h0;
  assign ram_3_MPORT_29_addr = 6'h1d;
  assign ram_3_MPORT_29_mask = 1'h1;
  assign ram_3_MPORT_29_en = reset;
  assign ram_3_MPORT_30_data = 2'h0;
  assign ram_3_MPORT_30_addr = 6'h1e;
  assign ram_3_MPORT_30_mask = 1'h1;
  assign ram_3_MPORT_30_en = reset;
  assign ram_3_MPORT_31_data = 2'h0;
  assign ram_3_MPORT_31_addr = 6'h1f;
  assign ram_3_MPORT_31_mask = 1'h1;
  assign ram_3_MPORT_31_en = reset;
  assign ram_3_MPORT_32_data = 2'h0;
  assign ram_3_MPORT_32_addr = 6'h20;
  assign ram_3_MPORT_32_mask = 1'h1;
  assign ram_3_MPORT_32_en = reset;
  assign ram_3_MPORT_33_data = 2'h0;
  assign ram_3_MPORT_33_addr = 6'h21;
  assign ram_3_MPORT_33_mask = 1'h1;
  assign ram_3_MPORT_33_en = reset;
  assign ram_3_MPORT_34_data = 2'h0;
  assign ram_3_MPORT_34_addr = 6'h22;
  assign ram_3_MPORT_34_mask = 1'h1;
  assign ram_3_MPORT_34_en = reset;
  assign ram_3_MPORT_35_data = 2'h0;
  assign ram_3_MPORT_35_addr = 6'h23;
  assign ram_3_MPORT_35_mask = 1'h1;
  assign ram_3_MPORT_35_en = reset;
  assign ram_3_MPORT_36_data = 2'h0;
  assign ram_3_MPORT_36_addr = 6'h24;
  assign ram_3_MPORT_36_mask = 1'h1;
  assign ram_3_MPORT_36_en = reset;
  assign ram_3_MPORT_37_data = 2'h0;
  assign ram_3_MPORT_37_addr = 6'h25;
  assign ram_3_MPORT_37_mask = 1'h1;
  assign ram_3_MPORT_37_en = reset;
  assign ram_3_MPORT_38_data = 2'h0;
  assign ram_3_MPORT_38_addr = 6'h26;
  assign ram_3_MPORT_38_mask = 1'h1;
  assign ram_3_MPORT_38_en = reset;
  assign ram_3_MPORT_39_data = 2'h0;
  assign ram_3_MPORT_39_addr = 6'h27;
  assign ram_3_MPORT_39_mask = 1'h1;
  assign ram_3_MPORT_39_en = reset;
  assign ram_3_MPORT_40_data = 2'h0;
  assign ram_3_MPORT_40_addr = 6'h28;
  assign ram_3_MPORT_40_mask = 1'h1;
  assign ram_3_MPORT_40_en = reset;
  assign ram_3_MPORT_41_data = 2'h0;
  assign ram_3_MPORT_41_addr = 6'h29;
  assign ram_3_MPORT_41_mask = 1'h1;
  assign ram_3_MPORT_41_en = reset;
  assign ram_3_MPORT_42_data = 2'h0;
  assign ram_3_MPORT_42_addr = 6'h2a;
  assign ram_3_MPORT_42_mask = 1'h1;
  assign ram_3_MPORT_42_en = reset;
  assign ram_3_MPORT_43_data = 2'h0;
  assign ram_3_MPORT_43_addr = 6'h2b;
  assign ram_3_MPORT_43_mask = 1'h1;
  assign ram_3_MPORT_43_en = reset;
  assign ram_3_MPORT_44_data = 2'h0;
  assign ram_3_MPORT_44_addr = 6'h2c;
  assign ram_3_MPORT_44_mask = 1'h1;
  assign ram_3_MPORT_44_en = reset;
  assign ram_3_MPORT_45_data = 2'h0;
  assign ram_3_MPORT_45_addr = 6'h2d;
  assign ram_3_MPORT_45_mask = 1'h1;
  assign ram_3_MPORT_45_en = reset;
  assign ram_3_MPORT_46_data = 2'h0;
  assign ram_3_MPORT_46_addr = 6'h2e;
  assign ram_3_MPORT_46_mask = 1'h1;
  assign ram_3_MPORT_46_en = reset;
  assign ram_3_MPORT_47_data = 2'h0;
  assign ram_3_MPORT_47_addr = 6'h2f;
  assign ram_3_MPORT_47_mask = 1'h1;
  assign ram_3_MPORT_47_en = reset;
  assign ram_3_MPORT_48_data = 2'h0;
  assign ram_3_MPORT_48_addr = 6'h30;
  assign ram_3_MPORT_48_mask = 1'h1;
  assign ram_3_MPORT_48_en = reset;
  assign ram_3_MPORT_49_data = 2'h0;
  assign ram_3_MPORT_49_addr = 6'h31;
  assign ram_3_MPORT_49_mask = 1'h1;
  assign ram_3_MPORT_49_en = reset;
  assign ram_3_MPORT_50_data = 2'h0;
  assign ram_3_MPORT_50_addr = 6'h32;
  assign ram_3_MPORT_50_mask = 1'h1;
  assign ram_3_MPORT_50_en = reset;
  assign ram_3_MPORT_51_data = 2'h0;
  assign ram_3_MPORT_51_addr = 6'h33;
  assign ram_3_MPORT_51_mask = 1'h1;
  assign ram_3_MPORT_51_en = reset;
  assign ram_3_MPORT_52_data = 2'h0;
  assign ram_3_MPORT_52_addr = 6'h34;
  assign ram_3_MPORT_52_mask = 1'h1;
  assign ram_3_MPORT_52_en = reset;
  assign ram_3_MPORT_53_data = 2'h0;
  assign ram_3_MPORT_53_addr = 6'h35;
  assign ram_3_MPORT_53_mask = 1'h1;
  assign ram_3_MPORT_53_en = reset;
  assign ram_3_MPORT_54_data = 2'h0;
  assign ram_3_MPORT_54_addr = 6'h36;
  assign ram_3_MPORT_54_mask = 1'h1;
  assign ram_3_MPORT_54_en = reset;
  assign ram_3_MPORT_55_data = 2'h0;
  assign ram_3_MPORT_55_addr = 6'h37;
  assign ram_3_MPORT_55_mask = 1'h1;
  assign ram_3_MPORT_55_en = reset;
  assign ram_3_MPORT_56_data = 2'h0;
  assign ram_3_MPORT_56_addr = 6'h38;
  assign ram_3_MPORT_56_mask = 1'h1;
  assign ram_3_MPORT_56_en = reset;
  assign ram_3_MPORT_57_data = 2'h0;
  assign ram_3_MPORT_57_addr = 6'h39;
  assign ram_3_MPORT_57_mask = 1'h1;
  assign ram_3_MPORT_57_en = reset;
  assign ram_3_MPORT_58_data = 2'h0;
  assign ram_3_MPORT_58_addr = 6'h3a;
  assign ram_3_MPORT_58_mask = 1'h1;
  assign ram_3_MPORT_58_en = reset;
  assign ram_3_MPORT_59_data = 2'h0;
  assign ram_3_MPORT_59_addr = 6'h3b;
  assign ram_3_MPORT_59_mask = 1'h1;
  assign ram_3_MPORT_59_en = reset;
  assign ram_3_MPORT_60_data = 2'h0;
  assign ram_3_MPORT_60_addr = 6'h3c;
  assign ram_3_MPORT_60_mask = 1'h1;
  assign ram_3_MPORT_60_en = reset;
  assign ram_3_MPORT_61_data = 2'h0;
  assign ram_3_MPORT_61_addr = 6'h3d;
  assign ram_3_MPORT_61_mask = 1'h1;
  assign ram_3_MPORT_61_en = reset;
  assign ram_3_MPORT_62_data = 2'h0;
  assign ram_3_MPORT_62_addr = 6'h3e;
  assign ram_3_MPORT_62_mask = 1'h1;
  assign ram_3_MPORT_62_en = reset;
  assign ram_3_MPORT_63_data = 2'h0;
  assign ram_3_MPORT_63_addr = 6'h3f;
  assign ram_3_MPORT_63_mask = 1'h1;
  assign ram_3_MPORT_63_en = reset;
  assign ram_3_MPORT_64_data = io_wdata[7:6];
  assign ram_3_MPORT_64_addr = io_addr;
  assign ram_3_MPORT_64_mask = io_wmask[3];
  assign ram_3_MPORT_64_en = io_rw;
  assign io_rdata = {io_rdata_hi,io_rdata_lo}; // @[SRAM.scala 75:39]
  always @(posedge clock) begin
    if (ram_0_MPORT_en & ram_0_MPORT_mask) begin
      ram_0[ram_0_MPORT_addr] <= ram_0_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_1_en & ram_0_MPORT_1_mask) begin
      ram_0[ram_0_MPORT_1_addr] <= ram_0_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_2_en & ram_0_MPORT_2_mask) begin
      ram_0[ram_0_MPORT_2_addr] <= ram_0_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_3_en & ram_0_MPORT_3_mask) begin
      ram_0[ram_0_MPORT_3_addr] <= ram_0_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_4_en & ram_0_MPORT_4_mask) begin
      ram_0[ram_0_MPORT_4_addr] <= ram_0_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_5_en & ram_0_MPORT_5_mask) begin
      ram_0[ram_0_MPORT_5_addr] <= ram_0_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_6_en & ram_0_MPORT_6_mask) begin
      ram_0[ram_0_MPORT_6_addr] <= ram_0_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_7_en & ram_0_MPORT_7_mask) begin
      ram_0[ram_0_MPORT_7_addr] <= ram_0_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_8_en & ram_0_MPORT_8_mask) begin
      ram_0[ram_0_MPORT_8_addr] <= ram_0_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_9_en & ram_0_MPORT_9_mask) begin
      ram_0[ram_0_MPORT_9_addr] <= ram_0_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_10_en & ram_0_MPORT_10_mask) begin
      ram_0[ram_0_MPORT_10_addr] <= ram_0_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_11_en & ram_0_MPORT_11_mask) begin
      ram_0[ram_0_MPORT_11_addr] <= ram_0_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_12_en & ram_0_MPORT_12_mask) begin
      ram_0[ram_0_MPORT_12_addr] <= ram_0_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_13_en & ram_0_MPORT_13_mask) begin
      ram_0[ram_0_MPORT_13_addr] <= ram_0_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_14_en & ram_0_MPORT_14_mask) begin
      ram_0[ram_0_MPORT_14_addr] <= ram_0_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_15_en & ram_0_MPORT_15_mask) begin
      ram_0[ram_0_MPORT_15_addr] <= ram_0_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_16_en & ram_0_MPORT_16_mask) begin
      ram_0[ram_0_MPORT_16_addr] <= ram_0_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_17_en & ram_0_MPORT_17_mask) begin
      ram_0[ram_0_MPORT_17_addr] <= ram_0_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_18_en & ram_0_MPORT_18_mask) begin
      ram_0[ram_0_MPORT_18_addr] <= ram_0_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_19_en & ram_0_MPORT_19_mask) begin
      ram_0[ram_0_MPORT_19_addr] <= ram_0_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_20_en & ram_0_MPORT_20_mask) begin
      ram_0[ram_0_MPORT_20_addr] <= ram_0_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_21_en & ram_0_MPORT_21_mask) begin
      ram_0[ram_0_MPORT_21_addr] <= ram_0_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_22_en & ram_0_MPORT_22_mask) begin
      ram_0[ram_0_MPORT_22_addr] <= ram_0_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_23_en & ram_0_MPORT_23_mask) begin
      ram_0[ram_0_MPORT_23_addr] <= ram_0_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_24_en & ram_0_MPORT_24_mask) begin
      ram_0[ram_0_MPORT_24_addr] <= ram_0_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_25_en & ram_0_MPORT_25_mask) begin
      ram_0[ram_0_MPORT_25_addr] <= ram_0_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_26_en & ram_0_MPORT_26_mask) begin
      ram_0[ram_0_MPORT_26_addr] <= ram_0_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_27_en & ram_0_MPORT_27_mask) begin
      ram_0[ram_0_MPORT_27_addr] <= ram_0_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_28_en & ram_0_MPORT_28_mask) begin
      ram_0[ram_0_MPORT_28_addr] <= ram_0_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_29_en & ram_0_MPORT_29_mask) begin
      ram_0[ram_0_MPORT_29_addr] <= ram_0_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_30_en & ram_0_MPORT_30_mask) begin
      ram_0[ram_0_MPORT_30_addr] <= ram_0_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_31_en & ram_0_MPORT_31_mask) begin
      ram_0[ram_0_MPORT_31_addr] <= ram_0_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_32_en & ram_0_MPORT_32_mask) begin
      ram_0[ram_0_MPORT_32_addr] <= ram_0_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_33_en & ram_0_MPORT_33_mask) begin
      ram_0[ram_0_MPORT_33_addr] <= ram_0_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_34_en & ram_0_MPORT_34_mask) begin
      ram_0[ram_0_MPORT_34_addr] <= ram_0_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_35_en & ram_0_MPORT_35_mask) begin
      ram_0[ram_0_MPORT_35_addr] <= ram_0_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_36_en & ram_0_MPORT_36_mask) begin
      ram_0[ram_0_MPORT_36_addr] <= ram_0_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_37_en & ram_0_MPORT_37_mask) begin
      ram_0[ram_0_MPORT_37_addr] <= ram_0_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_38_en & ram_0_MPORT_38_mask) begin
      ram_0[ram_0_MPORT_38_addr] <= ram_0_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_39_en & ram_0_MPORT_39_mask) begin
      ram_0[ram_0_MPORT_39_addr] <= ram_0_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_40_en & ram_0_MPORT_40_mask) begin
      ram_0[ram_0_MPORT_40_addr] <= ram_0_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_41_en & ram_0_MPORT_41_mask) begin
      ram_0[ram_0_MPORT_41_addr] <= ram_0_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_42_en & ram_0_MPORT_42_mask) begin
      ram_0[ram_0_MPORT_42_addr] <= ram_0_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_43_en & ram_0_MPORT_43_mask) begin
      ram_0[ram_0_MPORT_43_addr] <= ram_0_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_44_en & ram_0_MPORT_44_mask) begin
      ram_0[ram_0_MPORT_44_addr] <= ram_0_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_45_en & ram_0_MPORT_45_mask) begin
      ram_0[ram_0_MPORT_45_addr] <= ram_0_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_46_en & ram_0_MPORT_46_mask) begin
      ram_0[ram_0_MPORT_46_addr] <= ram_0_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_47_en & ram_0_MPORT_47_mask) begin
      ram_0[ram_0_MPORT_47_addr] <= ram_0_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_48_en & ram_0_MPORT_48_mask) begin
      ram_0[ram_0_MPORT_48_addr] <= ram_0_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_49_en & ram_0_MPORT_49_mask) begin
      ram_0[ram_0_MPORT_49_addr] <= ram_0_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_50_en & ram_0_MPORT_50_mask) begin
      ram_0[ram_0_MPORT_50_addr] <= ram_0_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_51_en & ram_0_MPORT_51_mask) begin
      ram_0[ram_0_MPORT_51_addr] <= ram_0_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_52_en & ram_0_MPORT_52_mask) begin
      ram_0[ram_0_MPORT_52_addr] <= ram_0_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_53_en & ram_0_MPORT_53_mask) begin
      ram_0[ram_0_MPORT_53_addr] <= ram_0_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_54_en & ram_0_MPORT_54_mask) begin
      ram_0[ram_0_MPORT_54_addr] <= ram_0_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_55_en & ram_0_MPORT_55_mask) begin
      ram_0[ram_0_MPORT_55_addr] <= ram_0_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_56_en & ram_0_MPORT_56_mask) begin
      ram_0[ram_0_MPORT_56_addr] <= ram_0_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_57_en & ram_0_MPORT_57_mask) begin
      ram_0[ram_0_MPORT_57_addr] <= ram_0_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_58_en & ram_0_MPORT_58_mask) begin
      ram_0[ram_0_MPORT_58_addr] <= ram_0_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_59_en & ram_0_MPORT_59_mask) begin
      ram_0[ram_0_MPORT_59_addr] <= ram_0_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_60_en & ram_0_MPORT_60_mask) begin
      ram_0[ram_0_MPORT_60_addr] <= ram_0_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_61_en & ram_0_MPORT_61_mask) begin
      ram_0[ram_0_MPORT_61_addr] <= ram_0_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_62_en & ram_0_MPORT_62_mask) begin
      ram_0[ram_0_MPORT_62_addr] <= ram_0_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_63_en & ram_0_MPORT_63_mask) begin
      ram_0[ram_0_MPORT_63_addr] <= ram_0_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_0_MPORT_64_en & ram_0_MPORT_64_mask) begin
      ram_0[ram_0_MPORT_64_addr] <= ram_0_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_0_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_0_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_1_MPORT_en & ram_1_MPORT_mask) begin
      ram_1[ram_1_MPORT_addr] <= ram_1_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_1_en & ram_1_MPORT_1_mask) begin
      ram_1[ram_1_MPORT_1_addr] <= ram_1_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_2_en & ram_1_MPORT_2_mask) begin
      ram_1[ram_1_MPORT_2_addr] <= ram_1_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_3_en & ram_1_MPORT_3_mask) begin
      ram_1[ram_1_MPORT_3_addr] <= ram_1_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_4_en & ram_1_MPORT_4_mask) begin
      ram_1[ram_1_MPORT_4_addr] <= ram_1_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_5_en & ram_1_MPORT_5_mask) begin
      ram_1[ram_1_MPORT_5_addr] <= ram_1_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_6_en & ram_1_MPORT_6_mask) begin
      ram_1[ram_1_MPORT_6_addr] <= ram_1_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_7_en & ram_1_MPORT_7_mask) begin
      ram_1[ram_1_MPORT_7_addr] <= ram_1_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_8_en & ram_1_MPORT_8_mask) begin
      ram_1[ram_1_MPORT_8_addr] <= ram_1_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_9_en & ram_1_MPORT_9_mask) begin
      ram_1[ram_1_MPORT_9_addr] <= ram_1_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_10_en & ram_1_MPORT_10_mask) begin
      ram_1[ram_1_MPORT_10_addr] <= ram_1_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_11_en & ram_1_MPORT_11_mask) begin
      ram_1[ram_1_MPORT_11_addr] <= ram_1_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_12_en & ram_1_MPORT_12_mask) begin
      ram_1[ram_1_MPORT_12_addr] <= ram_1_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_13_en & ram_1_MPORT_13_mask) begin
      ram_1[ram_1_MPORT_13_addr] <= ram_1_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_14_en & ram_1_MPORT_14_mask) begin
      ram_1[ram_1_MPORT_14_addr] <= ram_1_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_15_en & ram_1_MPORT_15_mask) begin
      ram_1[ram_1_MPORT_15_addr] <= ram_1_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_16_en & ram_1_MPORT_16_mask) begin
      ram_1[ram_1_MPORT_16_addr] <= ram_1_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_17_en & ram_1_MPORT_17_mask) begin
      ram_1[ram_1_MPORT_17_addr] <= ram_1_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_18_en & ram_1_MPORT_18_mask) begin
      ram_1[ram_1_MPORT_18_addr] <= ram_1_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_19_en & ram_1_MPORT_19_mask) begin
      ram_1[ram_1_MPORT_19_addr] <= ram_1_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_20_en & ram_1_MPORT_20_mask) begin
      ram_1[ram_1_MPORT_20_addr] <= ram_1_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_21_en & ram_1_MPORT_21_mask) begin
      ram_1[ram_1_MPORT_21_addr] <= ram_1_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_22_en & ram_1_MPORT_22_mask) begin
      ram_1[ram_1_MPORT_22_addr] <= ram_1_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_23_en & ram_1_MPORT_23_mask) begin
      ram_1[ram_1_MPORT_23_addr] <= ram_1_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_24_en & ram_1_MPORT_24_mask) begin
      ram_1[ram_1_MPORT_24_addr] <= ram_1_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_25_en & ram_1_MPORT_25_mask) begin
      ram_1[ram_1_MPORT_25_addr] <= ram_1_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_26_en & ram_1_MPORT_26_mask) begin
      ram_1[ram_1_MPORT_26_addr] <= ram_1_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_27_en & ram_1_MPORT_27_mask) begin
      ram_1[ram_1_MPORT_27_addr] <= ram_1_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_28_en & ram_1_MPORT_28_mask) begin
      ram_1[ram_1_MPORT_28_addr] <= ram_1_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_29_en & ram_1_MPORT_29_mask) begin
      ram_1[ram_1_MPORT_29_addr] <= ram_1_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_30_en & ram_1_MPORT_30_mask) begin
      ram_1[ram_1_MPORT_30_addr] <= ram_1_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_31_en & ram_1_MPORT_31_mask) begin
      ram_1[ram_1_MPORT_31_addr] <= ram_1_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_32_en & ram_1_MPORT_32_mask) begin
      ram_1[ram_1_MPORT_32_addr] <= ram_1_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_33_en & ram_1_MPORT_33_mask) begin
      ram_1[ram_1_MPORT_33_addr] <= ram_1_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_34_en & ram_1_MPORT_34_mask) begin
      ram_1[ram_1_MPORT_34_addr] <= ram_1_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_35_en & ram_1_MPORT_35_mask) begin
      ram_1[ram_1_MPORT_35_addr] <= ram_1_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_36_en & ram_1_MPORT_36_mask) begin
      ram_1[ram_1_MPORT_36_addr] <= ram_1_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_37_en & ram_1_MPORT_37_mask) begin
      ram_1[ram_1_MPORT_37_addr] <= ram_1_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_38_en & ram_1_MPORT_38_mask) begin
      ram_1[ram_1_MPORT_38_addr] <= ram_1_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_39_en & ram_1_MPORT_39_mask) begin
      ram_1[ram_1_MPORT_39_addr] <= ram_1_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_40_en & ram_1_MPORT_40_mask) begin
      ram_1[ram_1_MPORT_40_addr] <= ram_1_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_41_en & ram_1_MPORT_41_mask) begin
      ram_1[ram_1_MPORT_41_addr] <= ram_1_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_42_en & ram_1_MPORT_42_mask) begin
      ram_1[ram_1_MPORT_42_addr] <= ram_1_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_43_en & ram_1_MPORT_43_mask) begin
      ram_1[ram_1_MPORT_43_addr] <= ram_1_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_44_en & ram_1_MPORT_44_mask) begin
      ram_1[ram_1_MPORT_44_addr] <= ram_1_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_45_en & ram_1_MPORT_45_mask) begin
      ram_1[ram_1_MPORT_45_addr] <= ram_1_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_46_en & ram_1_MPORT_46_mask) begin
      ram_1[ram_1_MPORT_46_addr] <= ram_1_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_47_en & ram_1_MPORT_47_mask) begin
      ram_1[ram_1_MPORT_47_addr] <= ram_1_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_48_en & ram_1_MPORT_48_mask) begin
      ram_1[ram_1_MPORT_48_addr] <= ram_1_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_49_en & ram_1_MPORT_49_mask) begin
      ram_1[ram_1_MPORT_49_addr] <= ram_1_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_50_en & ram_1_MPORT_50_mask) begin
      ram_1[ram_1_MPORT_50_addr] <= ram_1_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_51_en & ram_1_MPORT_51_mask) begin
      ram_1[ram_1_MPORT_51_addr] <= ram_1_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_52_en & ram_1_MPORT_52_mask) begin
      ram_1[ram_1_MPORT_52_addr] <= ram_1_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_53_en & ram_1_MPORT_53_mask) begin
      ram_1[ram_1_MPORT_53_addr] <= ram_1_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_54_en & ram_1_MPORT_54_mask) begin
      ram_1[ram_1_MPORT_54_addr] <= ram_1_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_55_en & ram_1_MPORT_55_mask) begin
      ram_1[ram_1_MPORT_55_addr] <= ram_1_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_56_en & ram_1_MPORT_56_mask) begin
      ram_1[ram_1_MPORT_56_addr] <= ram_1_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_57_en & ram_1_MPORT_57_mask) begin
      ram_1[ram_1_MPORT_57_addr] <= ram_1_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_58_en & ram_1_MPORT_58_mask) begin
      ram_1[ram_1_MPORT_58_addr] <= ram_1_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_59_en & ram_1_MPORT_59_mask) begin
      ram_1[ram_1_MPORT_59_addr] <= ram_1_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_60_en & ram_1_MPORT_60_mask) begin
      ram_1[ram_1_MPORT_60_addr] <= ram_1_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_61_en & ram_1_MPORT_61_mask) begin
      ram_1[ram_1_MPORT_61_addr] <= ram_1_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_62_en & ram_1_MPORT_62_mask) begin
      ram_1[ram_1_MPORT_62_addr] <= ram_1_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_63_en & ram_1_MPORT_63_mask) begin
      ram_1[ram_1_MPORT_63_addr] <= ram_1_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_1_MPORT_64_en & ram_1_MPORT_64_mask) begin
      ram_1[ram_1_MPORT_64_addr] <= ram_1_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_1_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_1_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_2_MPORT_en & ram_2_MPORT_mask) begin
      ram_2[ram_2_MPORT_addr] <= ram_2_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_1_en & ram_2_MPORT_1_mask) begin
      ram_2[ram_2_MPORT_1_addr] <= ram_2_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_2_en & ram_2_MPORT_2_mask) begin
      ram_2[ram_2_MPORT_2_addr] <= ram_2_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_3_en & ram_2_MPORT_3_mask) begin
      ram_2[ram_2_MPORT_3_addr] <= ram_2_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_4_en & ram_2_MPORT_4_mask) begin
      ram_2[ram_2_MPORT_4_addr] <= ram_2_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_5_en & ram_2_MPORT_5_mask) begin
      ram_2[ram_2_MPORT_5_addr] <= ram_2_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_6_en & ram_2_MPORT_6_mask) begin
      ram_2[ram_2_MPORT_6_addr] <= ram_2_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_7_en & ram_2_MPORT_7_mask) begin
      ram_2[ram_2_MPORT_7_addr] <= ram_2_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_8_en & ram_2_MPORT_8_mask) begin
      ram_2[ram_2_MPORT_8_addr] <= ram_2_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_9_en & ram_2_MPORT_9_mask) begin
      ram_2[ram_2_MPORT_9_addr] <= ram_2_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_10_en & ram_2_MPORT_10_mask) begin
      ram_2[ram_2_MPORT_10_addr] <= ram_2_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_11_en & ram_2_MPORT_11_mask) begin
      ram_2[ram_2_MPORT_11_addr] <= ram_2_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_12_en & ram_2_MPORT_12_mask) begin
      ram_2[ram_2_MPORT_12_addr] <= ram_2_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_13_en & ram_2_MPORT_13_mask) begin
      ram_2[ram_2_MPORT_13_addr] <= ram_2_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_14_en & ram_2_MPORT_14_mask) begin
      ram_2[ram_2_MPORT_14_addr] <= ram_2_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_15_en & ram_2_MPORT_15_mask) begin
      ram_2[ram_2_MPORT_15_addr] <= ram_2_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_16_en & ram_2_MPORT_16_mask) begin
      ram_2[ram_2_MPORT_16_addr] <= ram_2_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_17_en & ram_2_MPORT_17_mask) begin
      ram_2[ram_2_MPORT_17_addr] <= ram_2_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_18_en & ram_2_MPORT_18_mask) begin
      ram_2[ram_2_MPORT_18_addr] <= ram_2_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_19_en & ram_2_MPORT_19_mask) begin
      ram_2[ram_2_MPORT_19_addr] <= ram_2_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_20_en & ram_2_MPORT_20_mask) begin
      ram_2[ram_2_MPORT_20_addr] <= ram_2_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_21_en & ram_2_MPORT_21_mask) begin
      ram_2[ram_2_MPORT_21_addr] <= ram_2_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_22_en & ram_2_MPORT_22_mask) begin
      ram_2[ram_2_MPORT_22_addr] <= ram_2_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_23_en & ram_2_MPORT_23_mask) begin
      ram_2[ram_2_MPORT_23_addr] <= ram_2_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_24_en & ram_2_MPORT_24_mask) begin
      ram_2[ram_2_MPORT_24_addr] <= ram_2_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_25_en & ram_2_MPORT_25_mask) begin
      ram_2[ram_2_MPORT_25_addr] <= ram_2_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_26_en & ram_2_MPORT_26_mask) begin
      ram_2[ram_2_MPORT_26_addr] <= ram_2_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_27_en & ram_2_MPORT_27_mask) begin
      ram_2[ram_2_MPORT_27_addr] <= ram_2_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_28_en & ram_2_MPORT_28_mask) begin
      ram_2[ram_2_MPORT_28_addr] <= ram_2_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_29_en & ram_2_MPORT_29_mask) begin
      ram_2[ram_2_MPORT_29_addr] <= ram_2_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_30_en & ram_2_MPORT_30_mask) begin
      ram_2[ram_2_MPORT_30_addr] <= ram_2_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_31_en & ram_2_MPORT_31_mask) begin
      ram_2[ram_2_MPORT_31_addr] <= ram_2_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_32_en & ram_2_MPORT_32_mask) begin
      ram_2[ram_2_MPORT_32_addr] <= ram_2_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_33_en & ram_2_MPORT_33_mask) begin
      ram_2[ram_2_MPORT_33_addr] <= ram_2_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_34_en & ram_2_MPORT_34_mask) begin
      ram_2[ram_2_MPORT_34_addr] <= ram_2_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_35_en & ram_2_MPORT_35_mask) begin
      ram_2[ram_2_MPORT_35_addr] <= ram_2_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_36_en & ram_2_MPORT_36_mask) begin
      ram_2[ram_2_MPORT_36_addr] <= ram_2_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_37_en & ram_2_MPORT_37_mask) begin
      ram_2[ram_2_MPORT_37_addr] <= ram_2_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_38_en & ram_2_MPORT_38_mask) begin
      ram_2[ram_2_MPORT_38_addr] <= ram_2_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_39_en & ram_2_MPORT_39_mask) begin
      ram_2[ram_2_MPORT_39_addr] <= ram_2_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_40_en & ram_2_MPORT_40_mask) begin
      ram_2[ram_2_MPORT_40_addr] <= ram_2_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_41_en & ram_2_MPORT_41_mask) begin
      ram_2[ram_2_MPORT_41_addr] <= ram_2_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_42_en & ram_2_MPORT_42_mask) begin
      ram_2[ram_2_MPORT_42_addr] <= ram_2_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_43_en & ram_2_MPORT_43_mask) begin
      ram_2[ram_2_MPORT_43_addr] <= ram_2_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_44_en & ram_2_MPORT_44_mask) begin
      ram_2[ram_2_MPORT_44_addr] <= ram_2_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_45_en & ram_2_MPORT_45_mask) begin
      ram_2[ram_2_MPORT_45_addr] <= ram_2_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_46_en & ram_2_MPORT_46_mask) begin
      ram_2[ram_2_MPORT_46_addr] <= ram_2_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_47_en & ram_2_MPORT_47_mask) begin
      ram_2[ram_2_MPORT_47_addr] <= ram_2_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_48_en & ram_2_MPORT_48_mask) begin
      ram_2[ram_2_MPORT_48_addr] <= ram_2_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_49_en & ram_2_MPORT_49_mask) begin
      ram_2[ram_2_MPORT_49_addr] <= ram_2_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_50_en & ram_2_MPORT_50_mask) begin
      ram_2[ram_2_MPORT_50_addr] <= ram_2_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_51_en & ram_2_MPORT_51_mask) begin
      ram_2[ram_2_MPORT_51_addr] <= ram_2_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_52_en & ram_2_MPORT_52_mask) begin
      ram_2[ram_2_MPORT_52_addr] <= ram_2_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_53_en & ram_2_MPORT_53_mask) begin
      ram_2[ram_2_MPORT_53_addr] <= ram_2_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_54_en & ram_2_MPORT_54_mask) begin
      ram_2[ram_2_MPORT_54_addr] <= ram_2_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_55_en & ram_2_MPORT_55_mask) begin
      ram_2[ram_2_MPORT_55_addr] <= ram_2_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_56_en & ram_2_MPORT_56_mask) begin
      ram_2[ram_2_MPORT_56_addr] <= ram_2_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_57_en & ram_2_MPORT_57_mask) begin
      ram_2[ram_2_MPORT_57_addr] <= ram_2_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_58_en & ram_2_MPORT_58_mask) begin
      ram_2[ram_2_MPORT_58_addr] <= ram_2_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_59_en & ram_2_MPORT_59_mask) begin
      ram_2[ram_2_MPORT_59_addr] <= ram_2_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_60_en & ram_2_MPORT_60_mask) begin
      ram_2[ram_2_MPORT_60_addr] <= ram_2_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_61_en & ram_2_MPORT_61_mask) begin
      ram_2[ram_2_MPORT_61_addr] <= ram_2_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_62_en & ram_2_MPORT_62_mask) begin
      ram_2[ram_2_MPORT_62_addr] <= ram_2_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_63_en & ram_2_MPORT_63_mask) begin
      ram_2[ram_2_MPORT_63_addr] <= ram_2_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_2_MPORT_64_en & ram_2_MPORT_64_mask) begin
      ram_2[ram_2_MPORT_64_addr] <= ram_2_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_2_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_2_io_rdata_MPORT_addr_pipe_0 <= io_addr;
    end
    if (ram_3_MPORT_en & ram_3_MPORT_mask) begin
      ram_3[ram_3_MPORT_addr] <= ram_3_MPORT_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_1_en & ram_3_MPORT_1_mask) begin
      ram_3[ram_3_MPORT_1_addr] <= ram_3_MPORT_1_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_2_en & ram_3_MPORT_2_mask) begin
      ram_3[ram_3_MPORT_2_addr] <= ram_3_MPORT_2_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_3_en & ram_3_MPORT_3_mask) begin
      ram_3[ram_3_MPORT_3_addr] <= ram_3_MPORT_3_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_4_en & ram_3_MPORT_4_mask) begin
      ram_3[ram_3_MPORT_4_addr] <= ram_3_MPORT_4_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_5_en & ram_3_MPORT_5_mask) begin
      ram_3[ram_3_MPORT_5_addr] <= ram_3_MPORT_5_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_6_en & ram_3_MPORT_6_mask) begin
      ram_3[ram_3_MPORT_6_addr] <= ram_3_MPORT_6_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_7_en & ram_3_MPORT_7_mask) begin
      ram_3[ram_3_MPORT_7_addr] <= ram_3_MPORT_7_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_8_en & ram_3_MPORT_8_mask) begin
      ram_3[ram_3_MPORT_8_addr] <= ram_3_MPORT_8_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_9_en & ram_3_MPORT_9_mask) begin
      ram_3[ram_3_MPORT_9_addr] <= ram_3_MPORT_9_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_10_en & ram_3_MPORT_10_mask) begin
      ram_3[ram_3_MPORT_10_addr] <= ram_3_MPORT_10_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_11_en & ram_3_MPORT_11_mask) begin
      ram_3[ram_3_MPORT_11_addr] <= ram_3_MPORT_11_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_12_en & ram_3_MPORT_12_mask) begin
      ram_3[ram_3_MPORT_12_addr] <= ram_3_MPORT_12_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_13_en & ram_3_MPORT_13_mask) begin
      ram_3[ram_3_MPORT_13_addr] <= ram_3_MPORT_13_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_14_en & ram_3_MPORT_14_mask) begin
      ram_3[ram_3_MPORT_14_addr] <= ram_3_MPORT_14_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_15_en & ram_3_MPORT_15_mask) begin
      ram_3[ram_3_MPORT_15_addr] <= ram_3_MPORT_15_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_16_en & ram_3_MPORT_16_mask) begin
      ram_3[ram_3_MPORT_16_addr] <= ram_3_MPORT_16_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_17_en & ram_3_MPORT_17_mask) begin
      ram_3[ram_3_MPORT_17_addr] <= ram_3_MPORT_17_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_18_en & ram_3_MPORT_18_mask) begin
      ram_3[ram_3_MPORT_18_addr] <= ram_3_MPORT_18_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_19_en & ram_3_MPORT_19_mask) begin
      ram_3[ram_3_MPORT_19_addr] <= ram_3_MPORT_19_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_20_en & ram_3_MPORT_20_mask) begin
      ram_3[ram_3_MPORT_20_addr] <= ram_3_MPORT_20_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_21_en & ram_3_MPORT_21_mask) begin
      ram_3[ram_3_MPORT_21_addr] <= ram_3_MPORT_21_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_22_en & ram_3_MPORT_22_mask) begin
      ram_3[ram_3_MPORT_22_addr] <= ram_3_MPORT_22_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_23_en & ram_3_MPORT_23_mask) begin
      ram_3[ram_3_MPORT_23_addr] <= ram_3_MPORT_23_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_24_en & ram_3_MPORT_24_mask) begin
      ram_3[ram_3_MPORT_24_addr] <= ram_3_MPORT_24_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_25_en & ram_3_MPORT_25_mask) begin
      ram_3[ram_3_MPORT_25_addr] <= ram_3_MPORT_25_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_26_en & ram_3_MPORT_26_mask) begin
      ram_3[ram_3_MPORT_26_addr] <= ram_3_MPORT_26_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_27_en & ram_3_MPORT_27_mask) begin
      ram_3[ram_3_MPORT_27_addr] <= ram_3_MPORT_27_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_28_en & ram_3_MPORT_28_mask) begin
      ram_3[ram_3_MPORT_28_addr] <= ram_3_MPORT_28_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_29_en & ram_3_MPORT_29_mask) begin
      ram_3[ram_3_MPORT_29_addr] <= ram_3_MPORT_29_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_30_en & ram_3_MPORT_30_mask) begin
      ram_3[ram_3_MPORT_30_addr] <= ram_3_MPORT_30_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_31_en & ram_3_MPORT_31_mask) begin
      ram_3[ram_3_MPORT_31_addr] <= ram_3_MPORT_31_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_32_en & ram_3_MPORT_32_mask) begin
      ram_3[ram_3_MPORT_32_addr] <= ram_3_MPORT_32_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_33_en & ram_3_MPORT_33_mask) begin
      ram_3[ram_3_MPORT_33_addr] <= ram_3_MPORT_33_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_34_en & ram_3_MPORT_34_mask) begin
      ram_3[ram_3_MPORT_34_addr] <= ram_3_MPORT_34_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_35_en & ram_3_MPORT_35_mask) begin
      ram_3[ram_3_MPORT_35_addr] <= ram_3_MPORT_35_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_36_en & ram_3_MPORT_36_mask) begin
      ram_3[ram_3_MPORT_36_addr] <= ram_3_MPORT_36_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_37_en & ram_3_MPORT_37_mask) begin
      ram_3[ram_3_MPORT_37_addr] <= ram_3_MPORT_37_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_38_en & ram_3_MPORT_38_mask) begin
      ram_3[ram_3_MPORT_38_addr] <= ram_3_MPORT_38_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_39_en & ram_3_MPORT_39_mask) begin
      ram_3[ram_3_MPORT_39_addr] <= ram_3_MPORT_39_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_40_en & ram_3_MPORT_40_mask) begin
      ram_3[ram_3_MPORT_40_addr] <= ram_3_MPORT_40_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_41_en & ram_3_MPORT_41_mask) begin
      ram_3[ram_3_MPORT_41_addr] <= ram_3_MPORT_41_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_42_en & ram_3_MPORT_42_mask) begin
      ram_3[ram_3_MPORT_42_addr] <= ram_3_MPORT_42_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_43_en & ram_3_MPORT_43_mask) begin
      ram_3[ram_3_MPORT_43_addr] <= ram_3_MPORT_43_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_44_en & ram_3_MPORT_44_mask) begin
      ram_3[ram_3_MPORT_44_addr] <= ram_3_MPORT_44_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_45_en & ram_3_MPORT_45_mask) begin
      ram_3[ram_3_MPORT_45_addr] <= ram_3_MPORT_45_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_46_en & ram_3_MPORT_46_mask) begin
      ram_3[ram_3_MPORT_46_addr] <= ram_3_MPORT_46_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_47_en & ram_3_MPORT_47_mask) begin
      ram_3[ram_3_MPORT_47_addr] <= ram_3_MPORT_47_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_48_en & ram_3_MPORT_48_mask) begin
      ram_3[ram_3_MPORT_48_addr] <= ram_3_MPORT_48_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_49_en & ram_3_MPORT_49_mask) begin
      ram_3[ram_3_MPORT_49_addr] <= ram_3_MPORT_49_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_50_en & ram_3_MPORT_50_mask) begin
      ram_3[ram_3_MPORT_50_addr] <= ram_3_MPORT_50_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_51_en & ram_3_MPORT_51_mask) begin
      ram_3[ram_3_MPORT_51_addr] <= ram_3_MPORT_51_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_52_en & ram_3_MPORT_52_mask) begin
      ram_3[ram_3_MPORT_52_addr] <= ram_3_MPORT_52_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_53_en & ram_3_MPORT_53_mask) begin
      ram_3[ram_3_MPORT_53_addr] <= ram_3_MPORT_53_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_54_en & ram_3_MPORT_54_mask) begin
      ram_3[ram_3_MPORT_54_addr] <= ram_3_MPORT_54_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_55_en & ram_3_MPORT_55_mask) begin
      ram_3[ram_3_MPORT_55_addr] <= ram_3_MPORT_55_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_56_en & ram_3_MPORT_56_mask) begin
      ram_3[ram_3_MPORT_56_addr] <= ram_3_MPORT_56_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_57_en & ram_3_MPORT_57_mask) begin
      ram_3[ram_3_MPORT_57_addr] <= ram_3_MPORT_57_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_58_en & ram_3_MPORT_58_mask) begin
      ram_3[ram_3_MPORT_58_addr] <= ram_3_MPORT_58_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_59_en & ram_3_MPORT_59_mask) begin
      ram_3[ram_3_MPORT_59_addr] <= ram_3_MPORT_59_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_60_en & ram_3_MPORT_60_mask) begin
      ram_3[ram_3_MPORT_60_addr] <= ram_3_MPORT_60_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_61_en & ram_3_MPORT_61_mask) begin
      ram_3[ram_3_MPORT_61_addr] <= ram_3_MPORT_61_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_62_en & ram_3_MPORT_62_mask) begin
      ram_3[ram_3_MPORT_62_addr] <= ram_3_MPORT_62_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_63_en & ram_3_MPORT_63_mask) begin
      ram_3[ram_3_MPORT_63_addr] <= ram_3_MPORT_63_data; // @[SRAM.scala 36:26]
    end
    if (ram_3_MPORT_64_en & ram_3_MPORT_64_mask) begin
      ram_3[ram_3_MPORT_64_addr] <= ram_3_MPORT_64_data; // @[SRAM.scala 36:26]
    end
    if (io_rw) begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      ram_3_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (io_rw ? 1'h0 : 1'h1) begin
      ram_3_io_rdata_MPORT_addr_pipe_0 <= io_addr;
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_0[initvar] = _RAND_0[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_1[initvar] = _RAND_3[1:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_2[initvar] = _RAND_6[1:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    ram_3[initvar] = _RAND_9[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ram_0_io_rdata_MPORT_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ram_1_io_rdata_MPORT_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ram_2_io_rdata_MPORT_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ram_3_io_rdata_MPORT_addr_pipe_0 = _RAND_11[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
