module PipelineCtrl(
  input   io_in_brTaken,
  output  io_out_decode_flush,
  output  io_out_execute_flush
);
  assign io_out_decode_flush = io_in_brTaken; // @[PipelineCtrl.scala 30:35]
  assign io_out_execute_flush = io_in_brTaken; // @[PipelineCtrl.scala 30:35]
endmodule
