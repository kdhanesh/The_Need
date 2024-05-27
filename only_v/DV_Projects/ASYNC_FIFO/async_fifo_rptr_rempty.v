module async_fifo_rptr_empty
(
  input   rinc, rclk, rrst_n,
  input   [$clog2(DEPTH) :0] rq2_wptr,
  output reg  rempty,
  output  [$clog2(DEPTH)-1:0] raddr,
  output reg [$clog2(DEPTH) :0] rptr
);

parameter DEPTH = 16;

  reg [$clog2(DEPTH):0] rbin;
  wire [$clog2(DEPTH):0] rgraynext, rbinnext;

  //-------------------
  // GRAYSTYLE2 pointer
  //-------------------
  always @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      {rbin, rptr} <= '0;
    else
      {rbin, rptr} <= {rbinnext, rgraynext};

  // Memory read-address pointer (okay to use binary to address memory)
  assign raddr = rbin[$clog2(DEPTH)-1:0];
  assign rbinnext = rbin + (rinc & ~rempty);
  assign rgraynext = (rbinnext>>1) ^ rbinnext;

  //---------------------------------------------------------------
  // FIFO empty when the next rptr == synchronized wptr or on reset
  //---------------------------------------------------------------
  assign rempty_val = (rgraynext == rq2_wptr);

  always @(posedge rclk or negedge rrst_n)
    if (!rrst_n)
      rempty <= 1'b1;
    else
      rempty <= rempty_val;

endmodule