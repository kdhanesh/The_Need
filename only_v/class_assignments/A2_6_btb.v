//dont forget to assign values to s not just for d
module A2_6_btb ();
    wire cout,sum;
    wire ymux;
    wire [7:0] ydec;
    reg a,b,cin;
    reg [3:0] dmux;
    reg [1:0] s;
    reg [2:0] ddec;
    integer i;

    A2_6_rtl A2_6 (.*);
    
    initial begin
        $dumpfile("A2_6_btb.vcd");
        $dumpvars();        
    end

    initial begin
        for (i=0; i<8; i=i+1)
            begin
                {a,b,cin} = i; #5;
                $display("%t time, a,b,cin - %b%b%b", $time,a,b,cin);    
            end 
    end

    initial begin
        for (i=0; i<32; i=i+1)
            begin
                {s,dmux} = $random%64; #5;
                $display("%t time, d - %b", $time,dmux);    
            end 
    end

    initial begin
        for (i=0; i<8; i=i+1)
            begin
                ddec = i;#5;
                $display("%t time, d - %b", $time,ddec);    
            end 
    end
endmodule