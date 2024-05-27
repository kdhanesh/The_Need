module A2_7 (
    output reg [15:0] zeros,ones,xs,zs,
    input [N-1:0] ip 
);
    parameter N = 20;
    integer i;
    always @ (*) begin
        zeros = 1'b0;
        ones = 1'b0;
        xs = 1'b0;
        zs = 1'b0;

        for (i=0;i<N;i++) begin
            if(ip[i]==1'b0) begin
                zeros = zeros + 1;
            end

            else if(ip[i]==1'b1) begin
                ones = ones + 1;
            end

            else if(ip[i]==1'b?) begin
                xs = xs + 1;
            end

            else if(ip[i]==1'bZ) begin
                zs = zs + 1;
            end
        end

        $display ("%d,%d,%d",zeros,ones,xs,zs);
    end
endmodule