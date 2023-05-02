module InstBuffer(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_inst_0,
  input  [31:0] io_in_bits_inst_1,
  input  [31:0] io_in_bits_inst_2,
  input  [31:0] io_in_bits_inst_3,
  input  [31:0] io_in_bits_pc,
  input  [2:0]  io_in_bits_size,
  input         io_in_bits_predictBrTaken_0,
  input         io_in_bits_predictBrTaken_1,
  input         io_in_bits_predictBrTaken_2,
  input         io_in_bits_predictBrTaken_3,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_inst_0_inst,
  output        io_out_bits_inst_0_valid,
  output        io_out_bits_inst_0_predictBrTaken,
  output [31:0] io_out_bits_inst_1_inst,
  output        io_out_bits_inst_1_valid,
  output        io_out_bits_inst_1_predictBrTaken,
  output [31:0] io_out_bits_inst_2_inst,
  output        io_out_bits_inst_2_valid,
  output        io_out_bits_inst_2_predictBrTaken,
  output [31:0] io_out_bits_inst_3_inst,
  output        io_out_bits_inst_3_valid,
  output        io_out_bits_inst_3_predictBrTaken,
  output [31:0] io_out_bits_pc,
  output        io_status_backPressure,
  output        io_status_full,
  input         io_flush
);
  wire  entries_0_clock; // @[InstBuffer.scala 39:48]
  wire  entries_0_reset; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_enq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_enq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_0_io_enq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_enq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_enq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_deq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_deq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_0_io_deq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_deq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire [3:0] entries_0_io_count; // @[InstBuffer.scala 39:48]
  wire  entries_0_io_flush; // @[InstBuffer.scala 39:48]
  wire  entries_1_clock; // @[InstBuffer.scala 39:48]
  wire  entries_1_reset; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_enq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_enq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_1_io_enq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_enq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_enq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_deq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_deq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_1_io_deq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_deq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire [3:0] entries_1_io_count; // @[InstBuffer.scala 39:48]
  wire  entries_1_io_flush; // @[InstBuffer.scala 39:48]
  wire  entries_2_clock; // @[InstBuffer.scala 39:48]
  wire  entries_2_reset; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_enq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_enq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_2_io_enq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_enq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_enq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_deq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_deq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_2_io_deq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_deq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire [3:0] entries_2_io_count; // @[InstBuffer.scala 39:48]
  wire  entries_2_io_flush; // @[InstBuffer.scala 39:48]
  wire  entries_3_clock; // @[InstBuffer.scala 39:48]
  wire  entries_3_reset; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_enq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_enq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_3_io_enq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_enq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_enq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_deq_ready; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_deq_valid; // @[InstBuffer.scala 39:48]
  wire [31:0] entries_3_io_deq_bits_inst; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_deq_bits_valid; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 39:48]
  wire [3:0] entries_3_io_count; // @[InstBuffer.scala 39:48]
  wire  entries_3_io_flush; // @[InstBuffer.scala 39:48]
  wire  pcQueue_clock; // @[InstBuffer.scala 40:25]
  wire  pcQueue_reset; // @[InstBuffer.scala 40:25]
  wire  pcQueue_io_enq_ready; // @[InstBuffer.scala 40:25]
  wire  pcQueue_io_enq_valid; // @[InstBuffer.scala 40:25]
  wire [31:0] pcQueue_io_enq_bits; // @[InstBuffer.scala 40:25]
  wire  pcQueue_io_deq_ready; // @[InstBuffer.scala 40:25]
  wire  pcQueue_io_deq_valid; // @[InstBuffer.scala 40:25]
  wire [31:0] pcQueue_io_deq_bits; // @[InstBuffer.scala 40:25]
  wire  pcQueue_io_flush; // @[InstBuffer.scala 40:25]
  wire [2:0] _mask_T_2 = 3'h4 - io_in_bits_size; // @[InstBuffer.scala 50:56]
  wire [3:0] mask = 4'hf >> _mask_T_2; // @[InstBuffer.scala 50:37]
  Queue entries_0 ( // @[InstBuffer.scala 39:48]
    .clock(entries_0_clock),
    .reset(entries_0_reset),
    .io_enq_ready(entries_0_io_enq_ready),
    .io_enq_valid(entries_0_io_enq_valid),
    .io_enq_bits_inst(entries_0_io_enq_bits_inst),
    .io_enq_bits_valid(entries_0_io_enq_bits_valid),
    .io_enq_bits_predictBrTaken(entries_0_io_enq_bits_predictBrTaken),
    .io_deq_ready(entries_0_io_deq_ready),
    .io_deq_valid(entries_0_io_deq_valid),
    .io_deq_bits_inst(entries_0_io_deq_bits_inst),
    .io_deq_bits_valid(entries_0_io_deq_bits_valid),
    .io_deq_bits_predictBrTaken(entries_0_io_deq_bits_predictBrTaken),
    .io_count(entries_0_io_count),
    .io_flush(entries_0_io_flush)
  );
  Queue entries_1 ( // @[InstBuffer.scala 39:48]
    .clock(entries_1_clock),
    .reset(entries_1_reset),
    .io_enq_ready(entries_1_io_enq_ready),
    .io_enq_valid(entries_1_io_enq_valid),
    .io_enq_bits_inst(entries_1_io_enq_bits_inst),
    .io_enq_bits_valid(entries_1_io_enq_bits_valid),
    .io_enq_bits_predictBrTaken(entries_1_io_enq_bits_predictBrTaken),
    .io_deq_ready(entries_1_io_deq_ready),
    .io_deq_valid(entries_1_io_deq_valid),
    .io_deq_bits_inst(entries_1_io_deq_bits_inst),
    .io_deq_bits_valid(entries_1_io_deq_bits_valid),
    .io_deq_bits_predictBrTaken(entries_1_io_deq_bits_predictBrTaken),
    .io_count(entries_1_io_count),
    .io_flush(entries_1_io_flush)
  );
  Queue entries_2 ( // @[InstBuffer.scala 39:48]
    .clock(entries_2_clock),
    .reset(entries_2_reset),
    .io_enq_ready(entries_2_io_enq_ready),
    .io_enq_valid(entries_2_io_enq_valid),
    .io_enq_bits_inst(entries_2_io_enq_bits_inst),
    .io_enq_bits_valid(entries_2_io_enq_bits_valid),
    .io_enq_bits_predictBrTaken(entries_2_io_enq_bits_predictBrTaken),
    .io_deq_ready(entries_2_io_deq_ready),
    .io_deq_valid(entries_2_io_deq_valid),
    .io_deq_bits_inst(entries_2_io_deq_bits_inst),
    .io_deq_bits_valid(entries_2_io_deq_bits_valid),
    .io_deq_bits_predictBrTaken(entries_2_io_deq_bits_predictBrTaken),
    .io_count(entries_2_io_count),
    .io_flush(entries_2_io_flush)
  );
  Queue entries_3 ( // @[InstBuffer.scala 39:48]
    .clock(entries_3_clock),
    .reset(entries_3_reset),
    .io_enq_ready(entries_3_io_enq_ready),
    .io_enq_valid(entries_3_io_enq_valid),
    .io_enq_bits_inst(entries_3_io_enq_bits_inst),
    .io_enq_bits_valid(entries_3_io_enq_bits_valid),
    .io_enq_bits_predictBrTaken(entries_3_io_enq_bits_predictBrTaken),
    .io_deq_ready(entries_3_io_deq_ready),
    .io_deq_valid(entries_3_io_deq_valid),
    .io_deq_bits_inst(entries_3_io_deq_bits_inst),
    .io_deq_bits_valid(entries_3_io_deq_bits_valid),
    .io_deq_bits_predictBrTaken(entries_3_io_deq_bits_predictBrTaken),
    .io_count(entries_3_io_count),
    .io_flush(entries_3_io_flush)
  );
  Queue_4 pcQueue ( // @[InstBuffer.scala 40:25]
    .clock(pcQueue_clock),
    .reset(pcQueue_reset),
    .io_enq_ready(pcQueue_io_enq_ready),
    .io_enq_valid(pcQueue_io_enq_valid),
    .io_enq_bits(pcQueue_io_enq_bits),
    .io_deq_ready(pcQueue_io_deq_ready),
    .io_deq_valid(pcQueue_io_deq_valid),
    .io_deq_bits(pcQueue_io_deq_bits),
    .io_flush(pcQueue_io_flush)
  );
  assign io_in_ready = entries_0_io_enq_ready; // @[InstBuffer.scala 45:17]
  assign io_out_valid = entries_0_io_deq_valid; // @[InstBuffer.scala 46:18]
  assign io_out_bits_inst_0_inst = entries_0_io_deq_bits_inst; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_0_valid = entries_0_io_deq_bits_valid; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_0_predictBrTaken = entries_0_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_1_inst = entries_1_io_deq_bits_inst; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_1_valid = entries_1_io_deq_bits_valid; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_1_predictBrTaken = entries_1_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_2_inst = entries_2_io_deq_bits_inst; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_2_valid = entries_2_io_deq_bits_valid; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_2_predictBrTaken = entries_2_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_3_inst = entries_3_io_deq_bits_inst; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_3_valid = entries_3_io_deq_bits_valid; // @[InstBuffer.scala 59:29]
  assign io_out_bits_inst_3_predictBrTaken = entries_3_io_deq_bits_predictBrTaken; // @[InstBuffer.scala 59:29]
  assign io_out_bits_pc = pcQueue_io_deq_bits; // @[InstBuffer.scala 68:20]
  assign io_status_backPressure = entries_0_io_count >= 4'h5; // @[InstBuffer.scala 42:51]
  assign io_status_full = entries_0_io_count == 4'h6; // @[InstBuffer.scala 43:43]
  assign entries_0_clock = clock;
  assign entries_0_reset = reset;
  assign entries_0_io_enq_valid = io_in_valid; // @[InstBuffer.scala 52:33]
  assign entries_0_io_enq_bits_inst = io_in_bits_inst_0; // @[InstBuffer.scala 54:37]
  assign entries_0_io_enq_bits_valid = mask[0]; // @[InstBuffer.scala 56:45]
  assign entries_0_io_enq_bits_predictBrTaken = io_in_bits_predictBrTaken_0; // @[InstBuffer.scala 55:47]
  assign entries_0_io_deq_ready = io_out_ready; // @[InstBuffer.scala 58:33]
  assign entries_0_io_flush = io_flush; // @[InstBuffer.scala 61:33]
  assign entries_1_clock = clock;
  assign entries_1_reset = reset;
  assign entries_1_io_enq_valid = io_in_valid; // @[InstBuffer.scala 52:33]
  assign entries_1_io_enq_bits_inst = io_in_bits_inst_1; // @[InstBuffer.scala 54:37]
  assign entries_1_io_enq_bits_valid = mask[1]; // @[InstBuffer.scala 56:45]
  assign entries_1_io_enq_bits_predictBrTaken = io_in_bits_predictBrTaken_1; // @[InstBuffer.scala 55:47]
  assign entries_1_io_deq_ready = io_out_ready; // @[InstBuffer.scala 58:33]
  assign entries_1_io_flush = io_flush; // @[InstBuffer.scala 61:33]
  assign entries_2_clock = clock;
  assign entries_2_reset = reset;
  assign entries_2_io_enq_valid = io_in_valid; // @[InstBuffer.scala 52:33]
  assign entries_2_io_enq_bits_inst = io_in_bits_inst_2; // @[InstBuffer.scala 54:37]
  assign entries_2_io_enq_bits_valid = mask[2]; // @[InstBuffer.scala 56:45]
  assign entries_2_io_enq_bits_predictBrTaken = io_in_bits_predictBrTaken_2; // @[InstBuffer.scala 55:47]
  assign entries_2_io_deq_ready = io_out_ready; // @[InstBuffer.scala 58:33]
  assign entries_2_io_flush = io_flush; // @[InstBuffer.scala 61:33]
  assign entries_3_clock = clock;
  assign entries_3_reset = reset;
  assign entries_3_io_enq_valid = io_in_valid; // @[InstBuffer.scala 52:33]
  assign entries_3_io_enq_bits_inst = io_in_bits_inst_3; // @[InstBuffer.scala 54:37]
  assign entries_3_io_enq_bits_valid = mask[3]; // @[InstBuffer.scala 56:45]
  assign entries_3_io_enq_bits_predictBrTaken = io_in_bits_predictBrTaken_3; // @[InstBuffer.scala 55:47]
  assign entries_3_io_deq_ready = io_out_ready; // @[InstBuffer.scala 58:33]
  assign entries_3_io_flush = io_flush; // @[InstBuffer.scala 61:33]
  assign pcQueue_clock = clock;
  assign pcQueue_reset = reset;
  assign pcQueue_io_enq_valid = io_in_valid; // @[InstBuffer.scala 66:26]
  assign pcQueue_io_enq_bits = io_in_bits_pc; // @[InstBuffer.scala 65:25]
  assign pcQueue_io_deq_ready = io_out_ready; // @[InstBuffer.scala 69:26]
  assign pcQueue_io_flush = io_flush; // @[InstBuffer.scala 64:26]
endmodule
