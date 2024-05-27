// more about random
//https://circuitcove.com/system-tasks-random/

module A1_2_btb ();

    wire cout_8,cout_4,cout_1,sum_1; 
    wire [7:0] sum_8; 
    wire [3:0] sum_4;
    reg [7:0] a,b;
    reg cin;
    integer i;

    //seed = $random%10;

    A1_2_rtl A1_2_dut (.*);

    initial begin
        //seed = $random%10;
        //$display("%d",seed);
        $dumpfile("A1_2_btb.vcd");
        $dumpvars();
    end

    initial begin
        for (i=0; i<20; i=i+1)
            begin
                a=$random%255; 
                b=$random%255;
                cin=$random%2; #5;
                $display("A %b, B: %b, Cin: %b", a,b,cin);    
            end 
    end
endmodule
  
  
  
  
  
  
