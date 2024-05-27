module penc83b ( //MSB needs priority
    output reg [2:0] y,
    input [7:0]  d
);


always @ (*) begin
    casez (d) // casez is not supporting by iverilog simulator
        8'b1??????? : y=7; //using casez needs to represent dont care with ? not x.
        8'b01?????? : y=6;
        8'b001????? : y=5;
        8'b0001???? : y=4;
        8'b00001??? : y=3;
        8'b0000001? : y=1;
        8'b00000001 : y=0;
        default     : y=3'bx;
    endcase
end
    
endmodule

module A2_1_rtl (
    output [2:0] y,
    input [7:0] d
);

    penc83b e1 (.*);
    
endmodule