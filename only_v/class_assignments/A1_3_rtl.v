module A1_3_rtl (
    output cout, output [bits-1:0] sum,
    input [bits-1:0] a,b, input cin
);
parameter bits = 4;

assign {cout,sum} = a+b+cin;

endmodule