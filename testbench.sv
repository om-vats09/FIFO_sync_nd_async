// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module fifo_tb();
  
    logic clk;
    logic rst;
    logic w_en;
   logic r_en;
    logic [7:0] data_in;
   logic [7:0] data_out;
  logic full;          
   logic empty;
  
  
  fifo uut(
    .clk(clk),
    .rst(rst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );
  
  initial 
    begin 
      
      $dumpfile("fifo_tb.vcd");
      $dumpvars(0,fifo_tb);
      
    end 
  
  always #10 clk = ~clk;
  
  initial 
    begin 
     clk = 0; 
    rst = 0;     
    w_en = 0; 
    r_en = 0; 
    data_in = 0;
      
       #15 rst = 1; 
      
       @(posedge clk);  
    data_in = 8'hAA;
    w_en = 1;       
    @(posedge clk);  
    w_en = 0;        
    
  
    @(posedge clk);
    data_in = 8'hBB;
    w_en = 1;
    @(posedge clk);
    w_en = 0;

    #20;            

    
    @(posedge clk);
    r_en = 1;        
    @(posedge clk);
    r_en = 0;       

  
    @(posedge clk);
    r_en = 1;
    @(posedge clk);
    r_en = 0;
  
      #100
      
      $finish;
    end 
endmodule 