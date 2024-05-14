module tb;
  reg a,b,en;
  wire [3:0]y;
  gdec2to4 dut(en,a,b,y);
  
  initial begin
  $dumpfile("gdec2to4.vcd");
  $dumpvars();
  end
  

  initial begin
      $monitor("en=%b a=%b b=%b y=%b",en,a,b,y);
      en=1;a=1'bx;b=1'bx;#5
      en=0;a=0;b=0;#5
      en=0;a=0;b=1;#5
      en=0;a=1;b=0;#5
      en=0;a=1;b=1;#5
      $finish;
    end
endmodule
