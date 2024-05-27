module A1_5_btb ();
    wire y1,y0; // y1 is realized by ternary, y0 is realized by 21
    reg [3:0] d;
    reg [1:0] s;
    integer i;

    A1_5_rtl A1_5 (.*);

    initial begin
        $dumpfile("A1_5_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<30; i=i+1)
            begin
                {s,d} = $random%64; #5;
                $display("%t time, %b %b", $time,s,d);    
            end 
    end        
endmodule