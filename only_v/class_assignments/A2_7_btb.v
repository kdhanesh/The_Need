module A2_7_btb ();
    wire [15:0] zeros,ones,xs,zs; //16 bits 65536 max storage
    reg [N-1:0] ip;
    parameter N = 30;

    A2_7 #(N) A2_7_1 (.*);

    initial begin
        $dumpfile("A2_7_btb.vcd");
        $dumpvars();
    end

    initial begin
        ip = 30'b101010101111000101011100010101;#5;
        ip = 30'b10?010?01111000?0101110001010?;#5;
    end

endmodule