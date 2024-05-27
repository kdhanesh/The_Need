//only concern of addresses wht is next address and 
// if mem is full or not
// no need to know wht is data and whts happening with tht
module async_wptr_wfull
(
  input   winc, wclk, wrst_n,
  input   [$clog2(DEPTH) :0] wq2_rptr,
  output reg  wfull,
  output  [$clog2(DEPTH)-1:0] waddr, //binary addr
  output reg [$clog2(DEPTH) :0] wptr //gray addr
);
parameter DEPTH = 16;
   reg [$clog2(DEPTH):0] wbin; // binary addr
  wire [$clog2(DEPTH):0] wgraynext, wbinnext;

  // GRAYSTYLE2 pointer
  always @(posedge wclk or negedge wrst_n)
    if (!wrst_n)
      {wbin, wptr} <= '0;
    else
      {wbin, wptr} <= {wbinnext, wgraynext};

  // Memory write-address pointer (okay to use binary to address memory)
  assign waddr = wbin[$clog2(DEPTH)-1:0];
  assign wbinnext = wbin + (winc & ~wfull);
  assign wgraynext = (wbinnext>>1) ^ wbinnext;

  //------------------------------------------------------------------
  // Simplified version of the three necessary full-tests:
  // assign wfull_val=((wgnext[$clog2(DEPTH)] !=wq2_rptr[$clog2(DEPTH)] ) &&
  // (wgnext[$clog2(DEPTH)-1] !=wq2_rptr[$clog2(DEPTH)-1]) &&
  // (wgnext[$clog2(DEPTH)-2:0]==wq2_rptr[$clog2(DEPTH)-2:0]));
  //------------------------------------------------------------------
  assign wfull_val = (wgraynext=={~wq2_rptr[$clog2(DEPTH):$clog2(DEPTH)-1], wq2_rptr[$clog2(DEPTH)-2:0]});

  always_ff @(posedge wclk or negedge wrst_n)
    if (!wrst_n)
      wfull <= 1'b0;
    else
      wfull <= wfull_val;

endmodule