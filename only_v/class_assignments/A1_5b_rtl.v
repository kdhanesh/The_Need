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

module mux81 (
    output y, 
    input [7:0] d, input [2:0]s
);
    wire [1:0] w;
    mux41 mux1 (w[0],d[3:0],s[1:0]);
    mux41 mux2 (w[1],d[7:4],s[1:0]);
    mux21 mux3 (y,w,s[2]);

endmodule

module A1_5b_rtl (
    output y, 
    input [7:0] d, input [2:0]s    
);
    mux81 mux1 (.*);
    
endmodule