module penc164b (
    output reg [3:0] y,
    input [15:0]  d
);

    always @(*) begin
        if (d[15]) begin
            y = 4'd15;
        end
        else if (d[14]) begin
            y = 4'd14;
        end 
        else if (d[13]) begin
            y = 4'd13;
        end 
        else if (d[12]) begin
            y = 4'd12;
        end
        else if (d[11]) begin
            y = 4'd11;
        end
        else if (d[10]) begin
            y = 4'd10;
        end 
        else if (d[9]) begin
            y = 4'd9;
        end
        else if (d[8]) begin
            y = 4'd8;
        end
        else if (d[7]) begin
            y = 4'd7;
        end
        else if (d[6]) begin
            y = 4'd6;
        end
        else if (d[5]) begin
            y = 4'd5;
        end
        else if (d[4]) begin
            y = 4'd4;
        end
        else if (d[3]) begin
            y = 4'd3;
        end
        else if (d[2]) begin
            y = 4'd2;
        end
        else if (d[1]) begin
            y = 4'd1;
        end 
        else if (d[0]) begin
            y = 4'd0;
        end
        else begin
            y = 4'dx;
        end
    end
    
endmodule

module A2_2_rtl (
    output [3:0] y,
    input [15:0]  d
);
    penc164b e1 (.*);


endmodule