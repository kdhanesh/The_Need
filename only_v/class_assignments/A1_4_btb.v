module A1_4_btb ();

    wire y;
    reg [1:0] d; 
    reg s;
    integer i;

    A1_4_rtl A1_4 (.*);

    initial begin
        $dumpfile("A1_4_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<8; i=i+1)
            begin
                {s,d} = i; #5;

                $display("%t time, %b %b", $time,s,d);    
            end         
    end
    
endmodule