module A2_1_btb ();
    wire [2:0] y;
    reg [7:0] d;
    //reg e;
    integer i;

    A2_1_rtl A2_1 (.*);

    initial begin
        $dumpfile("A2_1_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<20; i=i+1)
            begin
                d = $random%256; #5;
                $display("%t time, %b", $time,d);    
            end 
    end        
endmodule