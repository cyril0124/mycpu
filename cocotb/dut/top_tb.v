`timescale 1ns/1ns
module top_tb (
  input         clock,
  input         reset,
  input         io_in_start,
  // input  [31:0] io_in_csrStateIn_mcycle,
  output [31:0] io_out_state_intRegState_regState_0,
  output [31:0] io_out_state_intRegState_regState_1,
  output [31:0] io_out_state_intRegState_regState_2,
  output [31:0] io_out_state_intRegState_regState_3,
  output [31:0] io_out_state_intRegState_regState_4,
  output [31:0] io_out_state_intRegState_regState_5,
  output [31:0] io_out_state_intRegState_regState_6,
  output [31:0] io_out_state_intRegState_regState_7,
  output [31:0] io_out_state_intRegState_regState_8,
  output [31:0] io_out_state_intRegState_regState_9,
  output [31:0] io_out_state_intRegState_regState_10,
  output [31:0] io_out_state_intRegState_regState_11,
  output [31:0] io_out_state_intRegState_regState_12,
  output [31:0] io_out_state_intRegState_regState_13,
  output [31:0] io_out_state_intRegState_regState_14,
  output [31:0] io_out_state_intRegState_regState_15,
  output [31:0] io_out_state_intRegState_regState_16,
  output [31:0] io_out_state_intRegState_regState_17,
  output [31:0] io_out_state_intRegState_regState_18,
  output [31:0] io_out_state_intRegState_regState_19,
  output [31:0] io_out_state_intRegState_regState_20,
  output [31:0] io_out_state_intRegState_regState_21,
  output [31:0] io_out_state_intRegState_regState_22,
  output [31:0] io_out_state_intRegState_regState_23,
  output [31:0] io_out_state_intRegState_regState_24,
  output [31:0] io_out_state_intRegState_regState_25,
  output [31:0] io_out_state_intRegState_regState_26,
  output [31:0] io_out_state_intRegState_regState_27,
  output [31:0] io_out_state_intRegState_regState_28,
  output [31:0] io_out_state_intRegState_regState_29,
  output [31:0] io_out_state_intRegState_regState_30,
  output [31:0] io_out_state_intRegState_regState_31,
  output        io_out_state_instState_commit,
  output [31:0] io_out_state_instState_pc,
  output [31:0] io_out_state_instState_inst,
  output [31:0] io_out_state_csrState_mcycle,
  output [31:0] io_out_state_csrState_mcycleh
);

// reg clock;
// initial clock = 0;
// always #5 clock <= ~clock;

Core core_inst (
    .clock(clock),
    .reset(reset),
    .io_in_start(io_in_start),
    .val(),
    // .io_in_csrStateIn_mcycle(io_in_csrStateIn_mcycle),
    // .io_in_csrStateIn_mcycleh(io_in_csrStateIn_mcycle),
    // int reg state
    .io_out_state_intRegState_regState_0( io_out_state_intRegState_regState_0 ),
    .io_out_state_intRegState_regState_1( io_out_state_intRegState_regState_1 ),
    .io_out_state_intRegState_regState_2( io_out_state_intRegState_regState_2 ),
    .io_out_state_intRegState_regState_3( io_out_state_intRegState_regState_3 ),
    .io_out_state_intRegState_regState_4( io_out_state_intRegState_regState_4 ),
    .io_out_state_intRegState_regState_5( io_out_state_intRegState_regState_5 ),
    .io_out_state_intRegState_regState_6( io_out_state_intRegState_regState_6 ),
    .io_out_state_intRegState_regState_7( io_out_state_intRegState_regState_7 ),
    .io_out_state_intRegState_regState_8( io_out_state_intRegState_regState_8 ),
    .io_out_state_intRegState_regState_9( io_out_state_intRegState_regState_9 ),
    .io_out_state_intRegState_regState_10( io_out_state_intRegState_regState_10 ),
    .io_out_state_intRegState_regState_11( io_out_state_intRegState_regState_11 ),
    .io_out_state_intRegState_regState_12( io_out_state_intRegState_regState_12 ),
    .io_out_state_intRegState_regState_13( io_out_state_intRegState_regState_13 ),
    .io_out_state_intRegState_regState_14( io_out_state_intRegState_regState_14 ),
    .io_out_state_intRegState_regState_15( io_out_state_intRegState_regState_15 ),
    .io_out_state_intRegState_regState_16( io_out_state_intRegState_regState_16 ),
    .io_out_state_intRegState_regState_17( io_out_state_intRegState_regState_17 ),
    .io_out_state_intRegState_regState_18( io_out_state_intRegState_regState_18 ),
    .io_out_state_intRegState_regState_19( io_out_state_intRegState_regState_19 ),
    .io_out_state_intRegState_regState_20( io_out_state_intRegState_regState_20 ),
    .io_out_state_intRegState_regState_21( io_out_state_intRegState_regState_21 ),
    .io_out_state_intRegState_regState_22( io_out_state_intRegState_regState_22 ),
    .io_out_state_intRegState_regState_23( io_out_state_intRegState_regState_23 ),
    .io_out_state_intRegState_regState_24( io_out_state_intRegState_regState_24 ),
    .io_out_state_intRegState_regState_25( io_out_state_intRegState_regState_25 ),
    .io_out_state_intRegState_regState_26( io_out_state_intRegState_regState_26 ),
    .io_out_state_intRegState_regState_27( io_out_state_intRegState_regState_27 ),
    .io_out_state_intRegState_regState_28( io_out_state_intRegState_regState_28 ),
    .io_out_state_intRegState_regState_29( io_out_state_intRegState_regState_29 ),
    .io_out_state_intRegState_regState_30( io_out_state_intRegState_regState_30 ),
    .io_out_state_intRegState_regState_31( io_out_state_intRegState_regState_31 ),
    // instruction state
    .io_out_state_instState_commit( io_out_state_instState_commit ),
    .io_out_state_instState_pc( io_out_state_instState_pc ),
    .io_out_state_instState_inst( io_out_state_instState_inst ),
    // csr state
    .io_out_state_csrState_mcycle( io_out_state_csrState_mcycle ),
    .io_out_state_csrState_mcycleh( io_out_state_csrState_mcycleh )
);

task initMem;
    $display("[top_tb.v] init memory!\n");
    $readmemh("/home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex", core_inst.rom.mem);
endtask

initial begin
    $display("[top_tb.v] hello from top_tb()\n");
    initMem();
end



// reg [63:0] count;
// always @(posedge clock) begin
//   if(reset) count <= 0;
//   else count <= count + 'd1;
// end


always @(posedge reset) begin
  initMem();
end

// `ifdef COCOTB_SIM
// initial begin
//   $dumpfile("top_tb.vcd");
//   $dumpvars(0, top_tb);
// end
// `endif


endmodule