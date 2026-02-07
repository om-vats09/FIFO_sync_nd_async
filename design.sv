// Code your design here
module fifo(
  input  logic clk,
  input  logic rst,
  input  logic w_en,
  input  logic r_en,
  input  logic [7:0] data_in,
  output logic [7:0] data_out,
  output logic full,           
  output logic empty
);

  
  logic [3:0] wptr;
  logic [3:0] rptr;
  logic [4:0] count;          
  logic [7:0] mem [15:0];     
  
  

  assign full  = (count == 16);
  assign empty = (count == 0);
  
 
  always @(posedge clk or negedge rst)
  begin
      if(!rst) begin
          wptr  <= 0;
          rptr  <= 0;
          count <= 0;
          data_out <= 0;
      end 
      else begin
         
          if (w_en == 1 && full == 0) begin 
              mem[wptr] <= data_in;
              wptr      <= wptr + 1;
          end 
          
        
          if (r_en == 1 && empty == 0) begin 
              data_out <= mem[rptr];
              rptr     <= rptr + 1;
          end
          
         
          if (w_en && !full && !(r_en && !empty))
              count <= count + 1;
          else if (r_en && !empty && !(w_en && !full))
              count <= count - 1;
      end 
  end

endmodule
