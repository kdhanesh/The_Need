// Code your testbench here
// or browse Examples
module async_fifo_svtb;

  parameter D_WIDTH = 8;
  parameter DEPTH = 16;

  wire [D_WIDTH-1:0] rdata;
  wire wfull;
  wire rempty;
  reg [D_WIDTH-1:0] wdata;
  reg winc, wclk, wrst_n;
  reg rinc, rclk, rrst_n;

  // Model a queue for checking data
  reg [D_WIDTH-1:0] verif_data_q[$];
  reg [D_WIDTH-1:0] verif_wdata;


  // Instantiate the FIFO
  async_fifo1 #(D_WIDTH, $clog2(DEPTH)) dut (.*);

  initial begin
    wclk = 1'b0;
    rclk = 1'b0;

    fork
      forever #10ns wclk = ~wclk;
      forever #35ns rclk = ~rclk;
    join
  end

  initial begin
    winc = 1'b0;
    wdata = '0;
    wrst_n = 1'b0;
    repeat(5) @(posedge wclk);
    wrst_n = 1'b1;

    for (int iter=0; iter<2; iter++) begin
      for (int i=0; i<32; i++) begin
        @(posedge wclk iff !wfull);
        winc = (i%2 == 0)? 1'b1 : 1'b0;
        if (winc) begin
          wdata = $urandom;
          verif_data_q.push_front(wdata);
        end
      end
      #1us;
    end
  end

  initial begin
    rinc = 1'b0;

    rrst_n = 1'b0;
    repeat(8) @(posedge rclk);
    rrst_n = 1'b1;

    for (int iter=0; iter<2; iter++) begin
      for (int i=0; i<32; i++) begin
        @(posedge rclk iff !rempty)
        rinc = (i%2 == 0)? 1'b1 : 1'b0;
        if (rinc) begin
          verif_wdata = verif_data_q.pop_back();
          // Check the rdata against modeled wdata
          $display("Checking rdata: expected wdata = %h, rdata = %h", verif_wdata, rdata);
          assert(rdata === verif_wdata) else $error("Checking failed: expected wdata = %h, rdata = %h", verif_wdata, rdata);
        end
      end
      #1us;
    end

    $finish;
  end

endmodule