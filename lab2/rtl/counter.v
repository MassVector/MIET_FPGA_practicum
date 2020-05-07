`timescale 1ns / 1ps
module counter(
    input        clk100_i,
    input        rstn_i,
    
    input  [9:0] sw_i,
    input  [1:0] key_i,
    
    output [9:0] ledr_o,
    output [6:0] hex1_o,
    output [6:0] hex0_o
);
 reg [9:0] save    = 10'b0;
 reg [7:0] counter = 8'd0;

 always @( posedge clk100_i ) begin
   if ( key_i[0] ) begin
       save <= sw_i;
       counter <= counter + 1;
    end
   
    else
       if ( key_i[1] ) begin
         save <= 10'b0;
         counter <= 8'd0;
       end
  end
  
  assign ledr_o = save;
  
  dc_hex dec0
  ( .in(counter[7:4]),
    .out(hex0_o));
    
  dc_hex dec1
  ( .in(counter[3:0]),
    .out(hex1_o));  
endmodule