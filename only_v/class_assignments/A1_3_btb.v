// more about random
//https://circuitcove.com/system-tasks-random/

module A1_3_btb ();
    parameter bits_4 = 4;
    parameter bits_8 = 8;

    wire cout_4; wire [bits_4-1:0] sum_4;
    reg [bits_4-1:0] a_4,b_4; reg cin_4;

    wire cout_8; wire [bits_8-1:0] sum_8;
    reg [bits_8-1:0] a_8,b_8; reg cin_8;
    
    integer i;

    //seed = $random%10;

    A1_3_rtl #(bits_4) A1_3_b4 (cout_4,sum_4,a_4,b_4,cin_4);
    A1_3_rtl #(bits_8) A1_3_b8 (cout_8,sum_8,a_8,b_8,cin_8);

    initial begin
        //seed = $random%10;
        //$display("%d",seed);
        $dumpfile("A1_3_btb.vcd");
        $dumpvars();
    end

    initial begin
        for (i=0; i<16; i=i+1)
            begin
                a_4=$random%8; 
                b_4=$random%8;
                cin_4=$random%2; #5;
                $display("A4:%b, B4:%b, Cin4:%b", a_4,b_4,cin_4);    
            end
            //#5; 
    end

    

    initial begin
        for (i=0; i<20; i=i+1)
            begin
                a_8=$random%255; 
                b_8=$random%255;
                cin_8=$random%2; #5;
                $display("A_8:%b, B_8: %b, Cin_8: %b", a_8,b_8,cin_8);    
            end 
    end
    
endmodule
  
  
  
  
  
  
