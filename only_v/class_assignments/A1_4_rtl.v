module mux21 (
    output y,
    input [1:0] d, input s
);
    wire [1:0] w; wire sbar;
    not n1 (sbar,s);
    
    and a1 (w[0],sbar,d[0]);
    and a2 (w[1],s,d[1]);

    or o1 (y,w[1],w[0]);

endmodule

module A1_4_rtl (
    output y,
    input [1:0] d, input s
);
    mux21 m1 (.*);
    
endmodule