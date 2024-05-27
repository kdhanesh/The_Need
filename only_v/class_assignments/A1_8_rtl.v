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

module dec416sft (
    output [15:0] y,
    input [3:0] d
);
    assign y = 1<<(d);
    
endmodule

module A1_8_rtl (
    output [15:0] y416,output [3:0] y24,
    input [3:0] d, input e
);
    dec24g d1 (y24,d[1:0],e);
    dec416sft d2 (y416,d);
    
endmodule