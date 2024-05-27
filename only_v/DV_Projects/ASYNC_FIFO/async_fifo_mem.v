//
// FIFO memory
//
module async_fifo_mem
   
(
  input   winc, wfull, wclk,
  input   [$clog2(DEPTH)-1:0] waddr, raddr,
  input   [D_WIDTH-1:0] wdata,
  output  [D_WIDTH-1:0] rdata
);

parameter D_WIDTH = 8,DEPTH = 16 ; // Number of mem address bits

  // RTL Verilog memory model
  // localparam DEPTH = 1<<$clog2(DEPTH);//2*addsize

  reg [D_WIDTH-1:0] mem [DEPTH-1:0];
  
  //feed_through read 
  assign rdata = mem[raddr];

  //write only if the mem is not full and write is enabled which are ips
  always @(posedge wclk)
    if (winc && !wfull)
      mem[waddr] <= wdata;

endmodule