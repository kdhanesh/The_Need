module penc42d (
    output [1:0] y,
    input [3:0] d
);

    assign y[0] = d[3] | (d[1]&(~d[2]));
    assign y[1] = d[3] | d[2];
    
endmodule

module A1_9_rtl (
    output [1:0] y,
    input [3:0] d
);

    penc42d e1 (.*);
    
endmodule