module PipelineCtrl(
  input   io_in_brTaken,
  input   io_in_excpValid,
  output  io_out_decode_flush,
  output  io_out_execute_flush,
  output  io_out_memory_flush
);
  assign io_out_decode_flush = io_in_brTaken | io_in_excpValid; // @[PipelineCtrl.scala 35:38]
  assign io_out_execute_flush = io_in_brTaken | io_in_excpValid; // @[PipelineCtrl.scala 36:40]
  assign io_out_memory_flush = io_in_excpValid; // @[PipelineCtrl.scala 38:25]
endmodule
