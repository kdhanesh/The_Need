// need to add reset, asyn neg edge - reset the memeory - figure it out

// RAM with synchronous - posedge dual port write first, 
// only high w_en, no r_en
// parameterized depth and data width
// based on vivado synthesis guide

module dpram_rtl
  (input  we_a, we_b,clk,
   input [D_WIDTH-1:0] d_in_a, d_in_b,
   input  [$clog2(DEPTH)-1:0] addr_a, addr_b,
   output reg [D_WIDTH-1:0] d_out_a, d_out_b);

   parameter DEPTH = 1024, D_WIDTH = 8; 
  
  // RAM creation based on characters
  //LSB - deepest loc and msb on top 
  // this confg is how comp arch mem allocation 'stack' 
  reg [D_WIDTH-1:0] mem [0:DEPTH-1];
  
  always @ (posedge clk)
    begin
      // port A
      // write first we_a is active low basedon ram chips
      if (we_a)
        mem[addr_a] <= d_in_a;
      // read operation when we_a is high
       else
      	d_out_a <= mem[addr_a];
      
    end
  
  always @ (posedge clk)
    begin

      // port B
      // write first we_b is active low basedon ram chips
      if (we_b)
        mem[addr_b] <= d_in_b;
      // read operation when we_b is high
     else
        d_out_b <= mem[addr_b];
      
    end
  
endmodule
    
      
      
           