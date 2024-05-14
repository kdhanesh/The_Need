module tb;
  reg a,b,c,d,s0,s1;
  wire out;
  integer i;
  
  gmux4to1 dut(.*);
  
  initial begin
  	$dumpfile("gmux4to1.vcd");
  	$dumpvars();
  end
  

  initial begin
  	  
      $monitor("s0=%b s1=%b a=%b b=%b c=%b d=%b out=%b",s0,s1,a,b,c,d,out);
      for (i=0; i<15; i++)
      	#5 {s0,s1,a,b,c,d} = i;
      #10
      $finish;
    end
endmodule
