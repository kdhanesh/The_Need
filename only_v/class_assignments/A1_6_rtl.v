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

module mux41 (
    output y, 
    input [3:0] d, input [1:0]s
);
    wire [1:0] w;
    mux21 mux1 (w[0],d[1:0],s[0]);
    mux21 mux2 (w[1],d[3:2],s[0]);
    mux21 mux3 (y,w,s[1]);

endmodule

module A1_6_rtl (
    output y,
    input a,b
);

    mux41 mux1 (y,{1'b1,1'b0,1'b0,1'b1},{a,b});

endmodule