module sync_fifo_ctrl 
  (input  we, clk, reset,
   input  wr,rd, // enable signals
   output [$clog2(DEPTH)-1:0] w_addr,
   output [$clog2(DEPTH)-1:0] r_addr,
   output  reg full, empty);

   parameter DEPTH = 1024;
  
  //constarining the addreesing to sequential
  reg  [$clog2(DEPTH)-1:0] w_ptr, w_ptr_next;
  reg [$clog2(DEPTH)-1:0] r_ptr, r_ptr_next;
  
  //full and empty status compuatation
  //limiting the memory size of fifo
  reg full_next;
  reg empty_next;
  
  //state intiliazation
  always @ (posedge clk or posedge reset)
    begin
      if(reset)
        begin
          w_ptr <= 0;
          r_ptr <= 0;
          empty <= 1;
          full <= 0;
        end
      else
        begin
          w_ptr <= w_ptr_next;
          r_ptr <= r_ptr_next;
          empty <= empty_next;
          full <= full_next;
        end
    end
  
  //next state computation
  always @ (*)
    begin
    
      //defaults keep the addr same and status same
      w_ptr_next = w_ptr;
      r_ptr_next = r_ptr;
      empty_next = empty;
      full_next = full;
      // states are represented a binary to make readable 		//can make enum specified
    
  
      case({wr,rd}) 
        //00 default, 01 read, 10 write, 11   		
        // read write simultanious
        
        // this is write ctrl
        2'b10: begin 
          //update w_ptr, empty
          if (!full) 
            begin
              w_ptr_next = w_ptr + 1;
              empty_next = 1'b0; // makes sure that the fifo is not empty after writing
            end
               //if next write is at read ptr, empty next will be 1
              if (w_ptr_next == r_ptr)
                full_next = 1'b1;
           
        end

        //this is read ctrl
        2'b01: begin // read
          //upadte r_ptr, full
          if(!empty)
            begin
            // if written then make sure 
              r_ptr_next = r_ptr + 1;
              full_next = 1'b0;
            end
          
               //if next read is at wirte 
              //empty next will be 1
              if (r_ptr_next == w_ptr)
                empty_next = 1'b1;
            
        end
        
        
        
        2'b11: 
        begin
   //if both read and write happens at same time
    //if empty nothing changes in the next_ptr
      //write happens for tht loc and same loc read happens
    //if not empty its as usual
    //if full coz the logic is read then write so the loc - default take cares
        //will be read earsed then written into it
          if(empty) begin
            w_ptr_next = w_ptr;
            r_ptr_next = r_ptr;
          end
          
          
          else begin
            w_ptr_next = w_ptr + 1;
            r_ptr_next = r_ptr + 1;
          end
          
        end
      endcase
    end
  
  assign {w_addr, r_addr} = {w_ptr,r_ptr};
  
endmodule