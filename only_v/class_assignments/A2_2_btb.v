module A2_2_btb ();
    wire [3:0] y;
    reg [15:0] d;
    //reg e;
    integer i;

    A2_2_rtl A2_2 (.*);

    initial begin
        $dumpfile("A2_2_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<30; i=i+1)
            begin
                d = $random%65536; #5;
                //$display("%t time, %b", $time,d); 
                $write ("Input %b in binary %d in decimal Output:%b in binary %b in decimal \n", d,d,y,y);   
            end 
    end        
endmodule