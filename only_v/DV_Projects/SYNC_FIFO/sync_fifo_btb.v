module sync_fifo_btb();
  
  localparam DEPTH = 8;
  localparam D_WIDTH = 8;
  localparam T = 10;
  
  reg wr,rd,reset,clk;
  reg [D_WIDTH-1:0] w_data;
  wire [D_WIDTH-1:0] r_data;
  wire full, empty;
  
  sync_fifo_rtl  #(DEPTH,D_WIDTH) fifo1 (.*);
  
  initial begin
    clk = 1'b0;
    forever #(T/2) clk = ~clk;
  end
  
    
  
  initial
    begin
      $dumpfile("sync_fifo_btb.vcd");
      $dumpvars();
    end
  
  //reset for the first half cycle
  initial
    begin
      reset = 1'b1;
      rd = 1'b0;
      wr = 1'b0;
      @(negedge clk);
      reset = 1'b0;
    end
  
  initial
    begin
      //empty
      //write
      @(negedge clk);
      w_data = 8'h5;
      wr = 1'b1;
      @(negedge clk);
      wr = 1'b0;
      
      repeat(4) begin
        
        @(negedge clk);
        w_data = 8'h6;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        
      end
      
      repeat(1)@(negedge clk);
      w_data = 8'h2;
      wr = 1'b1;
      @(negedge clk);
      wr = 1'b0;
      
      repeat(1) @(negedge clk);
      rd = 1'b1; //need to get r_data = 2
      @(negedge clk); // bit doesnt matter coz r_data independen
      rd = 1'b0;
      
      repeat(4) begin
        
        @(negedge clk);
        w_data = 8'h3;
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        
      end
      
      #10
      $finish;
    end
endmodule
      