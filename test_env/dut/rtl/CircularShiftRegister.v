module CircularShiftRegister(
  input        clock,
  input        reset,
  input        io_shiftLeft,
  output [2:0] io_out,
  input        io_reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] register; // @[CircularShifRegister.scala 15:27]
  wire [2:0] _register_T_2 = {register[1:0],register[2]}; // @[Cat.scala 33:92]
  assign io_out = register; // @[CircularShifRegister.scala 30:12]
  always @(posedge clock) begin
    if (reset) begin // @[CircularShifRegister.scala 15:27]
      register <= 3'h5; // @[CircularShifRegister.scala 15:27]
    end else if (io_reset) begin // @[CircularShifRegister.scala 26:20]
      register <= 3'h5; // @[CircularShifRegister.scala 27:18]
    end else if (io_shiftLeft) begin // @[CircularShifRegister.scala 17:24]
      register <= _register_T_2; // @[CircularShifRegister.scala 18:18]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  register = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
