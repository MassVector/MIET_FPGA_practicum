`timescale 1ns / 1ps



module Labrab2(
   input  clk100_i,
   input  rstn_i,
   input  [9:0] sw_i,
   input  [1:0] key_i, 
   output [9:0] ledr_o,
   output [6:0] hex0_o,
   output [6:0] hex1_o
   );
    
 reg [9:0] Q       = 10'b0;
 reg [7:0] Labrab2 = 8'd0;
    
 always @( posedge clk100_i ) begin
    if ( key_i[0] ) begin
       Q <= sw_i;
       Labrab2 <= Labrab2 + 1;
    end
    
    
    else
       if ( key_i[1] ) begin
         Q <= 10'b0;
         Labrab2 <= 8'd0;
       end
  end
  
  assign ledr_o = Q;
  
  dc_hex dec0
  ( .in(Labrab2[7:4]),
    .out(hex0_o));
    
  dc_hex dec1
  ( .in(Labrab2[3:0]),
    .out(hex1_o));  
  
    
endmodule
