// implementing FA using HA
// HA is gate level
// FA is structural - instanstiation of HA

module HA (
    output s,c,
    input a,b
);
  xor x1 (s,a,b);
  and a1 (c,a,b);  
endmodule

module FA (
    input a,b,cin,
    output sum,cout
);
  wire w1,w2,w3; // intermediate values of s0 and c0,c1
  HA ha1 (w1,w2,a,b);
  HA ha2 (sum,w3,w1,cin);
  or o1 (cout,w3,w2);
endmodule

//top module
module A1_1_rtl (
    input a,b,cin,
    output sum,cout
);
  FA fa1 (.*);
endmodule