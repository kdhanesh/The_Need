module A1_7_btb ();
    wire [7:0] y;
    reg [2:0] d;
    //reg e;
    integer i;

    A1_7_rtl A1_7 (.*);

    initial begin
        $dumpfile("A1_7_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<8; i=i+1)
            begin
                d = $random%256; #5;
                $display("%t time, %b", $time,d);    
            end 
    end        
endmodule