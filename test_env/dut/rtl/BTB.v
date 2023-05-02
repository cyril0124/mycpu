module BTB(
  input         clock,
  input         reset,
  input         io_write_valid,
  input  [31:0] io_write_bits_pc,
  input         io_write_bits_jump,
  input  [31:0] io_write_bits_target,
  input  [31:0] io_read_req_bits_pc,
  output        io_read_resp_hit,
  output [31:0] io_read_resp_target,
  output        io_read_resp_jump
);
  wire  entries_clock; // @[SRAM_1.scala 256:31]
  wire [7:0] entries_io_r_addr; // @[SRAM_1.scala 256:31]
  wire [65:0] entries_io_r_data_0; // @[SRAM_1.scala 256:31]
  wire  entries_io_w_en; // @[SRAM_1.scala 256:31]
  wire [7:0] entries_io_w_addr; // @[SRAM_1.scala 256:31]
  wire [65:0] entries_io_w_data_0; // @[SRAM_1.scala 256:31]
  wire [7:0] wrIdx = io_write_bits_pc[9:2]; // @[BTB.scala 42:33]
  wire [21:0] wrPc = io_write_bits_pc[31:10]; // @[BTB.scala 43:32]
  wire [31:0] wrEntry_pc = {{10'd0}, wrPc}; // @[BTB.scala 45:27 47:16]
  wire  wrEntry_jump = io_write_bits_jump; // @[BTB.scala 45:27 46:18]
  wire [32:0] lo = {wrEntry_pc,wrEntry_jump}; // @[BTB.scala 51:38]
  wire  wrEntry_valid = io_write_valid; // @[BTB.scala 45:27 49:19]
  wire [31:0] wrEntry_target = io_write_bits_target; // @[BTB.scala 45:27 48:20]
  wire [32:0] hi = {wrEntry_valid,wrEntry_target}; // @[BTB.scala 51:38]
  wire [7:0] rdIdx = io_read_req_bits_pc[9:2]; // @[BTB.scala 54:36]
  wire [21:0] rdPc = io_read_req_bits_pc[31:10]; // @[BTB.scala 55:35]
  wire [65:0] _rdEntry_WIRE = entries_io_r_data_0; // @[BTB.scala 57:{37,37}]
  wire [31:0] rdEntry_pc = _rdEntry_WIRE[32:1]; // @[BTB.scala 57:37]
  wire  rdEntry_valid = _rdEntry_WIRE[65]; // @[BTB.scala 57:37]
  wire [31:0] _GEN_4 = {{10'd0}, rdPc}; // @[BTB.scala 58:28]
  SRAMArray_2P_10 entries ( // @[SRAM_1.scala 256:31]
    .clock(entries_clock),
    .io_r_addr(entries_io_r_addr),
    .io_r_data_0(entries_io_r_data_0),
    .io_w_en(entries_io_w_en),
    .io_w_addr(entries_io_w_addr),
    .io_w_data_0(entries_io_w_data_0)
  );
  assign io_read_resp_hit = rdEntry_pc == _GEN_4 & rdEntry_valid; // @[BTB.scala 58:37]
  assign io_read_resp_target = _rdEntry_WIRE[64:33]; // @[BTB.scala 57:37]
  assign io_read_resp_jump = _rdEntry_WIRE[0]; // @[BTB.scala 57:37]
  assign entries_clock = clock;
  assign entries_io_r_addr = rdIdx; // @[SRAM_1.scala 245:19]
  assign entries_io_w_en = io_write_valid; // @[BTB.scala 50:25 SRAM_1.scala 217:17 237:17]
  assign entries_io_w_addr = wrIdx; // @[BTB.scala 50:25 SRAM_1.scala 238:19]
  assign entries_io_w_data_0 = {hi,lo}; // @[BTB.scala 51:38]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~1'h1 & (io_write_valid & ~reset)) begin
          $fatal; // @[SRAM_1.scala 236:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
