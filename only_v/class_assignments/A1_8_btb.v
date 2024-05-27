module A1_8_btb ();
    wire [15:0] y416;
    wire [3:0] y24;
    reg [3:0] d; reg e;

    integer i;

    A1_8_rtl A1_8 (.*);

    initial begin
        $dumpfile("A1_8_btb.vcd");
        $dumpvars();        
    end

    initial begin
        //e=1'b1;
        for (i=0; i<16; i=i+1)
            begin
                d = i;
                e = i[2]; #5;
                $display("%t time, %b", $time,d,e);    
            end 
    end        
endmodule