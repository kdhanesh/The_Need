module tb;
  reg a,b,s;
  wire out;
  integer i;
  
  mux2to1 dut(.*);
  
  initial begin
  	$dumpfile("mux2to1.vcd");
  	$dumpvars();
  end
  

  initial begin
  	  
      $monitor("s=%b a=%b b=%b out=%b",s,a,b,out);
      for (i=0; i<8; i++)
      	#5 {s,a,b} = i;
      #10
      $finish;
    end
endmodule
