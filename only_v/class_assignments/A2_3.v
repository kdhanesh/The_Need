// Learnt that 1/Freq is not executed giving 0. in iverilog
// need to sperate the tools for each block
`timescale 1ns/1ps
module A2_3 ();

    integer i;
    reg [4:0] clk;
    parameter FREQ = 50;
    parameter DC = 0.5; // frequency in Mhz, TP in ns
    
    real TP = 1/(0.001*(FREQ)); // TP in ns; 
     
    
    initial begin
        clk = 5'b00000;
    end

    //method 1 : of clk generation - clk[0] - TP = 20ns, Freq = 50 Mhz
    always #10 clk[0] = ~clk[0];

    initial begin
        //method 2 : of clk generation - clk[1] - TP = 20ns, Freq = 50 Mhz
        forever #10 clk[1] = ~clk[1];
    end

    initial begin
        //method 3 : of clk generation - clk[3] - TP = 20ns, Freq = 50 Mhz
        while (1) begin
            #10 clk[2] = ~clk[2];
        end
    end

    initial begin
        //method 4 : of clk generation - clk[4] - TP = 20ns, Freq = 50 Mhz
        for (i=0;i>=0;i++) begin // for if true goes into
            #10 clk[3] = ~clk[3];
        end
    end
    
    initial begin
        //Parameterized clk - in this case, Freq = 50 MHz, DC = 50%
        forever begin
            #(TP/2) clk[4] = ~clk[4];
        end
    end

initial begin
    $dumpfile("A2_3.vcd");
    $dumpvars();
end

initial #300 $finish;

endmodule