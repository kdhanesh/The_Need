// Dual Port RAM testbench
`timescale 1ns/1ps

module dpram_btb;
  parameter DEPTH = 64, D_WIDTH =8;
  reg we_a, we_b,clk;
  reg [D_WIDTH-1:0] d_in_a, d_in_b;
  reg [$clog2(DEPTH)-1:0] addr_a, addr_b;
  wire [D_WIDTH-1:0] d_out_a, d_out_b;
  
  dpram_rtl #(DEPTH,D_WIDTH) dpr1(.*);
  
  initial
    begin
      $dumpfile("dpram_btb.vcd");
      $dumpvars(0, dpram_btb);       
      
      clk=1'b1;
      forever #5 clk = ~clk;
    end
  
  initial
   begin

    // can add more test cases
      d_in_a = 8'h33;
      addr_a = 6'h01;
      
      d_in_b = 8'h44;
      addr_b = 6'h02;
      
      we_a = 1'b1; //write to 1 and 2 address 
      we_b = 1'b1;
      
      #10;
      
      d_in_a = 8'h55;
      addr_a = 6'h03;
      
      addr_b = 6'h01;

      we_b = 1'b0; // write to 3 nd read from 1

      #10;
      
      d_in_a = 8'h44;
      addr_a = 6'h04;
      
      addr_b = 6'h04;

      

     // write to 4 nd read from 4 simultaneously
    end
  

  initial	
    #40 $finish;
  
endmodule