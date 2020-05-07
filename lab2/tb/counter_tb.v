`timescale 1ns / 1ps


module counter_tb(

    );
    
  localparam CLK_FREQ_MHZ = 50;
  localparam CLK_SEMIPERIOD = (1000 / CLK_FREQ_MHZ)/2;
 
  reg clk_i;
  reg [9:0] sw_i;
  reg [1:0] key_i;
  wire [9:0] ledr_o;
  //wire [1:0] hex_o;
  
  
   counter DUT
   ( .clk_i  ( clk_i  ),
     .sw_i   ( sw_i   ),
     .key_i  ( key_i  ),
     .ledr_o ( ledr_o )
     //.hex_o  ( hex_o  )
   );
   
   
   initial begin
     clk_i = 1'b1;
     forever begin
       #CLK_SEMIPERIOD clk_i = ~clk_i;
     end
   end
   
   initial begin
     sw_i[9:0] = {10{1'b0}};
     key_i[1] = 1'b0;
     key_i[0] = 1'b1;
   end
   
   
   initial begin
     forever begin
       #CLK_SEMIPERIOD sw_i = $random();
       #(1.2*CLK_SEMIPERIOD) key_i[1] = ~key_i[1];
     end
   end
    
endmodule
