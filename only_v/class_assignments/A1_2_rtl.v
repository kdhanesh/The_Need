// all are implemented with dataflow modeling style

module FA_1_bit (
    output cout,sum,
    input a,b,cin
);
  assign {cout,sum} = a+b+cin;  
endmodule

module FA_4_bit (
    output cout, output [3:0] sum,
    input [3:0] a,b, input cin
);
    assign {cout,sum} = a+b+cin; 
endmodule

module FA_8_bit (
    output cout, output [7:0] sum,
    input [7:0] a,b, input cin
);
    assign {cout,sum} = a+b+cin; 
endmodule

module A1_2_rtl (
    output cout_8,cout_4,cout_1,sum_1, output [7:0] sum_8, output [3:0] sum_4,
    input [7:0] a,b, input cin
);
    FA_8_bit FA8 (.*,.cout(cout_8),.sum(sum_8));
    FA_4_bit FA4 (cout_4,sum_4,a[3:0],b[3:0],cin);
    FA_1_bit FA1 (cout_1,sum_1,a[0],b[0],cin); 
endmodule