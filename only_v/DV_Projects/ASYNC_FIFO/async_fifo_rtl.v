// Top level wrapper
//
module async_fifo_rtl

(
  input   winc, wclk, wrst_n,//winc write enable signal
  input   rinc, rclk, rrst_n,//rinc read enable signal
  input   [D_WIDTH-1:0] wdata,

  output  [D_WIDTH-1:0] rdata,
  output  wfull,
  output  rempty
);


  parameter D_WIDTH = 8,DEPTH = 16;

  wire [$clog2(DEPTH)-1:0] waddr, raddr;
  wire [$clog2(DEPTH):0] wptr, rptr, wq2_rptr, rq2_wptr;

  sync_r2w sync_r2w (.*);
  sync_w2r sync_w2r (.*);
  fifomem #(D_WIDTH, $clog2(DEPTH)) fifomem (.*);
  rptr_empty #($clog2(DEPTH)) rptr_empty (.*);
  wptr_full #($clog2(DEPTH)) wptr_full (.*);

endmodule