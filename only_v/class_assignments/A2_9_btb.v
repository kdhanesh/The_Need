module A2_9_btb ();

    wire prime,even;
    reg unsigned [7:0] num;
    integer i;

    A2_9 A2_9_1 (.*);

    initial begin
        $dumpfile("A2_9_btb.vcd");
        $dumpvars();
    end

    initial begin
        //num = 22;
        for (i=0;i<16;i++) begin 
            num = $random%100; #5;
            $display("%t time, %d", $time,num);
        end
    end

endmodule