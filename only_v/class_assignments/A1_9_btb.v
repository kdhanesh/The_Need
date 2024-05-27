module A1_9_btb ();
    wire [1:0] y;
    reg [3:0] d;
    //reg e;
    integer i;

    A1_9_rtl A1_9 (.*);

    initial begin
        $dumpfile("A1_9_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<16; i=i+1)
            begin
                d = i; #5;
                $display("%t time, %b", $time,d);    
            end 
    end        
endmodule