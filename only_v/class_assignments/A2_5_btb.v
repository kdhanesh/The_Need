`timescale 1ns/1ps
module A2_5_btb ();
    wire qdlatchsr,qdffsr,qdffasr,qdffpeasr;
    reg reset,clk,en,d;
    integer i;

    A2_5_rtl A2_5 (.*);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        $dumpfile("A2_5_btb.vcd");
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