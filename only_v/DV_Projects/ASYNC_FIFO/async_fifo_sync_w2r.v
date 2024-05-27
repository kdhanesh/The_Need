module async_fifo_sync_w2r
  // see the next pointer wht it indicates 
(
  input   rclk, rrst_n,
  input   [$clog2(DEPTH):0] wptr,
  output reg [$clog2(DEPTH):0] rq2_wptr
);

parameter DEPTH = 16;

  reg [$clog2(DEPTH):0] rq1_wptr;

  always @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      {rq2_wptr,rq1_wptr} <= 0;
    else
      {rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};

endmodule