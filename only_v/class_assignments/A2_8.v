module A2_8 ();

    integer a,b,c,d,e,f,g;
    //swapping method 1 - using blking, no 3rd variable
    initial begin
        a = 10; b = 20;
        $display ("Before swap of a = %0d, b = %0d", a,b);
        a = a^b; 
        b = a^b; // a^b^b = a
        a = a^b; // a^b^a = b
        $display ("After swap using m1 of a = %0d, b = %0d", a,b);
    end

    //swapping method 2 : non blocking, no 2nd variable
    initial begin
        c = 16; d = 14;
        $display ("Before swap of c = %0d, d = %0d", c,d);
        c <= d; 
        d <= c; #1;
        $display ("After swap using m2 nb of c = %0d, d = %0d", c,d);
    end

    //swapping using 3rd nd blocking
    initial begin
            e = 23; f = 28;
            $display ("Before swap of e = %0d, f = %0d", e,f);
            g = e; 
            e = f; 
            f = g; 
            $display ("After swap using m3 of e = %0d, f = %0d", e,f);
        end

endmodule