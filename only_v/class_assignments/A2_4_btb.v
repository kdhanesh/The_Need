`timescale 1ns/1ps
module A2_4_btb ();
    wire qlatch,qff;
    reg reset,clk,en,d;
    integer i;

    A2_4_rtl A2_4 (.*);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("A2_4.vcd");
        $dumpvars();
    end

    initial begin
        for (i=0;i<16;i++) begin 
            {reset,en,d} = i; #5;
            $display("%t time, %b", $time,reset,en,d);
        end
    end

    initial begin
        #300 $finish;
    end
endmodule