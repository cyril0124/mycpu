module RAM(
  input         clock,
  input         reset,
  input         io_wen,
  input  [31:0] io_waddr,
  input  [31:0] io_wdata,
  input  [31:0] io_raddr,
  output [31:0] io_rdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[ROM.scala 26:26]
  wire  mem_io_rdata_MPORT_en; // @[ROM.scala 26:26]
  wire [9:0] mem_io_rdata_MPORT_addr; // @[ROM.scala 26:26]
  wire [31:0] mem_io_rdata_MPORT_data; // @[ROM.scala 26:26]
  wire [31:0] mem_MPORT_data; // @[ROM.scala 26:26]
  wire [9:0] mem_MPORT_addr; // @[ROM.scala 26:26]
  wire  mem_MPORT_mask; // @[ROM.scala 26:26]
  wire  mem_MPORT_en; // @[ROM.scala 26:26]
  reg  mem_io_rdata_MPORT_en_pipe_0;
  reg [9:0] mem_io_rdata_MPORT_addr_pipe_0;
  wire  _T_2 = io_wen & io_waddr == io_raddr; // @[ROM.scala 30:28]
  assign mem_io_rdata_MPORT_en = mem_io_rdata_MPORT_en_pipe_0;
  assign mem_io_rdata_MPORT_addr = mem_io_rdata_MPORT_addr_pipe_0;
  assign mem_io_rdata_MPORT_data = mem[mem_io_rdata_MPORT_addr]; // @[ROM.scala 26:26]
  assign mem_MPORT_data = io_wdata;
  assign mem_MPORT_addr = io_waddr[11:2];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wen;
  assign io_rdata = io_wen & io_waddr == io_raddr ? io_wdata : mem_io_rdata_MPORT_data; // @[ROM.scala 30:54 31:18 33:18]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[ROM.scala 26:26]
    end
    if (_T_2) begin
      mem_io_rdata_MPORT_en_pipe_0 <= 1'h0;
    end else begin
      mem_io_rdata_MPORT_en_pipe_0 <= 1'h1;
    end
    if (_T_2 ? 1'h0 : 1'h1) begin
      mem_io_rdata_MPORT_addr_pipe_0 <= io_raddr[11:2];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_wen & ~reset) begin
          $fwrite(32'h80000002,"RAM [write] addr: %d data: %d\n",io_waddr,io_wdata); // @[RAM.scala 12:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdata_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdata_MPORT_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
