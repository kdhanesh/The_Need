module A1_6_btb ();
    wire y; 
    reg a,b;
    integer i;

    A1_6_rtl A1_6 (.*);

    initial begin
        $dumpfile("A1_6_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<4; i=i+1)
            begin
                {a,b} = i; #5;
                $display("%t time, %b%b", $time,a,b);    
            end 
    end        
endmodule