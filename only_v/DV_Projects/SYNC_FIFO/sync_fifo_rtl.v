module sync_fifo_rtl
  (input  wr,rd,reset,clk,
   input  [D_WIDTH-1:0] w_data,
  
   output  [D_WIDTH-1:0] r_data,
   output  full, empty);

parameter DEPTH=1024, D_WIDTH=8;
  
  wire [$clog2(DEPTH)-1:0] w_addr;
  wire [$clog2(DEPTH)-1:0] r_addr;
  
  wire we;
  
  assign we = wr&&(!full);
  
  sync_fifo_mem #(DEPTH,D_WIDTH) mem1 (.w_addr(w_addr), .r_addr(r_addr), .*);
  sync_fifo_ctrl #(DEPTH) ctrl1 (.w_addr(w_addr), .r_addr(r_addr), .we(we), .*);
  
endmodule