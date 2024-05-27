module sync_fifo_mem 
  (input  we, clk,
   input  [D_WIDTH-1:0] w_data, 
   input  [$clog2(DEPTH)-1:0] w_addr,
   input  [$clog2(DEPTH)-1:0] r_addr,
   output  [D_WIDTH-1:0] r_data);

  parameter DEPTH = 1024, D_WIDTH = 8;

  reg [D_WIDTH-1:0] mem [0:DEPTH-1];
  
  always @ (posedge clk)
    begin
      
      // write first we_a is active high
      if (we)
        mem[w_addr] <= w_data;
      
    end

  // read operation is similar to feed through
  assign r_data = mem[r_addr];

  
endmodule