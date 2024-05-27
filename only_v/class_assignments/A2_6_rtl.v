//dont forget to make outputs reg for behavioral model 
module FAb (
    output reg cout,sum,
    input a,b,cin
);
    always @ (*) begin
        {cout,sum} = a+b+cin;
    end
endmodule

module mux41b (
    output reg y,
    input [3:0] d, input [1:0] s
);
    always @ (*) begin
        case (s)
            2'd0: y = d[0];
            2'd1: y = d[1];
            2'd2: y = d[2];
            2'd3: y = d[3];
            default: y = 1'bx;
        endcase
    end
endmodule

module dec38b (
    output reg [7:0] y,
    input [2:0] d
);
    always @ (*) begin
        y = 8'd0;
        case (d)
            3'b000: y[0]=1'b1;
            3'b001: y[1]=1'b1;
            3'b010: y[2]=1'b1;
            3'b011: y[3]=1'b1;
            3'b100: y[4]=1'b1;
            3'b101: y[5]=1'b1;
            3'b110: y[6]=1'b1;
            3'b111: y[7]=1'b1;
            default: y=8'd0;
        endcase
    end

endmodule

module A2_6_rtl (
    output cout,sum,output ymux,output [7:0] ydec,
    input a,b,cin,input [3:0] dmux, input [1:0] s,
    input [2:0] ddec
);
    FAb fa1 (.*);
    mux41b mux1 (.d(dmux),.y(ymux),.*);
    dec38b dec1 (.d(ddec),.y(ydec));
endmodule