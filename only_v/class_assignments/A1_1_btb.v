// Testbench for Full_Adder

`timescale 1ns/1ns

module A1_1_btb;	// No need for Ports

  reg  a, b, cin;
  reg true;
  reg [1:0]asum   ;// variables
  wire sum, cout;  // wires
  integer i;
  // Instantiate the module to be tested
  A1_1_rtl A1_1 (.*);

  initial begin	   // initial block
    $dumpfile("A1_1_btb.vcd");
    $dumpvars();
  end

  initial begin
    for (i = 0; i < 8; i++) begin
       {a, b, cin} = i; #5;
       asum = a+b+cin;
       
       $display("%t carry is %b, sum is %b, actual sum is %b",$time,cout,sum,asum); 

       if({cout,sum}==asum) begin
        true=1'b1;
       end
       else begin
       true=1'b0;
       end
       
    end
    $finish;
  end

//     initial begin
//         $monitor("%t carry is %b, sum is %b, actual sum is %b",$time,cout,sum,asum);
//   end	// end of initial block
endmodule
