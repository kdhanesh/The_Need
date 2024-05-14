module gdec2to4(en,a,b,y);
    input en,a,b;
    output [3:0]y;
    wire enb,na,nb;
    not n0(enb,en);
    not n1(na,a);
    not n2(nb,b);

    and n3(y[0],enb,na,nb);
    and n4(y[1],enb,a,nb);
    and n5(y[2],enb,na,b);
    and n6(y[3],enb,a,b);

endmodule
