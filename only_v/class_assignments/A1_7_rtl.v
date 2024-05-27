module dec24g (
    output [3:0] y,
    input [1:0] d, input e
);
    
    wire dbar[1:0];
    not n1 (dbar[0],d[0]);
    not n2 (dbar[1],d[1]);
    
    and a1 (y[0],dbar[1],dbar[0],e);
    and a2 (y[1],dbar[1],d[0],e);
    and a3 (y[2],d[1],dbar[0],e);
    and a4 (y[3],d[1],d[0],e);
    
endmodule

module dec38s (
    output [7:0] y,
    input [2:0] d
);
    wire d0bar;
    not n1 (d0bar,d[0]);
    
    dec24g dec1 (y[3:0],d[2:1],d0bar);
    dec24g dec2 (y[7:4],d[2:1],d[0]);

endmodule

module A1_7_rtl (
    output [7:0] y,
    input [2:0] d
);

    dec38s dec1 (.*);
    
endmodule