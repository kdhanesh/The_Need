module A2_9 (
    output reg prime,even,
    input [7:0] num
);
    integer i;
    always @ (num) begin
        //prime 
        prime = 1'b1;
        for (i=2;i<= (num*0.5);i++) begin : break
            if (num%i==0) begin
                prime = 1'b0;
                disable break;
            end
        end

        $display("prime = %b %d", prime,num);
        //even
        even = 1'b0;
        if (num%2==0) even = 1'b1;
        else even = 1'b0;
        $display("even = %b", even);
    end
endmodule