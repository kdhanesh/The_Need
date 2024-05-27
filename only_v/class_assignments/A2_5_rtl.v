module dlatchsrb (
    output reg q,
    input reset,clk,d
);
    always @ (*) begin
        if(clk) begin
            if (reset)
            q = 0;
            else 
            q = d;
        end
    end
endmodule

module dffsrb (
    output reg q,
    input reset,clk,d
);
    always @ (clk) begin
        if(clk) begin
            if (reset)
            q = 0;
            else 
            q = d;
        end
    end
endmodule

module dffasrb (
    output reg q,
    input reset,clk,d
);
    always @ (clk,reset) begin
        if (reset) begin
            q = 0;
        end
        else if (clk) begin 
            q = d;
        end
    end
endmodule

module dffpeasrb (
    output reg q,
    input reset,clk,d
);
    always @ (posedge clk,reset) begin
        if (reset) begin
            q <= 0;
        end
        else begin 
            q <= d;
        end
    end
endmodule

module A2_5_rtl (
    output qdlatchsr,qdffsr,qdffasr,qdffpeasr,
    input reset,clk,d
);
  dlatchsrb dlac1 (.q(qdlatchsr),.*);
  dffsrb dff1 (.q(qdffsr),.*);
  dffasrb dff2 (.q(qdffasr),.*);
  dffpeasrb dff3 (.q(qdffpeasr),.*);  
endmodule
