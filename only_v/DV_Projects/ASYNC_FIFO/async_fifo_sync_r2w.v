//
// Read pointer to write clock synchronizer
//
module async_fifo_sync_r2w
   
(
  input   wclk, wrst_n,
  input   [$clog2(DEPTH):0] rptr,
  output reg  [$clog2(DEPTH):0] wq2_rptr//readpointer with write side
);

parameter DEPTH = 16;

  reg [$clog2(DEPTH):0] wq1_rptr;

  always @(posedge wclk or negedge wrst_n)
    if (!wrst_n) {wq2_rptr,wq1_rptr} <= 0;
    else {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};

endmodule