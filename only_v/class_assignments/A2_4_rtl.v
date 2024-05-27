module dlatcharb (
    output reg q,
    input reset,en,d
);
    always @ (*) begin
        if(reset) begin
            q = 0;
        end
        else if (en) begin
            q = d;
        end
        // else is not required as it inferes latch which we wnt
        // it is ok if u write just to be consistent
    end
endmodule

module dffpesrb (
    output reg q,
    input reset,clk,d
);
    always @(posedge clk ) begin
        if(reset) begin
            q <= 0;
        end
        else q <= d;
    end
endmodule

module A2_4_rtl (
    output qlatch,qff,
    input reset,clk,en,d
);
    dlatcharb dla1 (.q(qlatch),.*);
    dffpesrb dff1 (.q(qff),.*);
endmodule