module mux21teop (
    output y,
    input [1:0] d, input s
);
    assign y = s?d[1]:d[0];
endmodule

module mux41teop (
    output y,
    input [3:0] d, input [1:0]s
);
    assign y = s[1]?(s[0]?d[3]:d[2]):(s[0]?d[1]:d[0]);
endmodule

module A1_5_rtl (
    output y1,y0, // y1 is realized by ternary, y0 is realized by 21
    input [3:0] d, input [1:0]s
);
    wire [1:0] w;
    mux21teop mux1 (w[0],d[1:0],s[0]);
    mux21teop mux2 (w[1],d[3:2],s[0]);
    mux21teop mux3 (y0,w,s[1]);

    mux41teop mux4 (.y(y1),.*);
endmodule