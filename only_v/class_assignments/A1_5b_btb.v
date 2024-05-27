module A1_5b_btb ();
    wire y; 
    reg [7:0] d;
    reg [2:0] s;
    integer i;

    A1_5b_rtl A1_5b (.*);

    initial begin
        $dumpfile("A1_5b_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<30; i=i+1)
            begin
                {s,d} = $random%2048; #5;
                $display("%t time, %b %b", $time,s,d);    
            end 
    end        
endmodule