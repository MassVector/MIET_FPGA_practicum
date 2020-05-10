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
reg [9:0] ledr    = 10'b0;
reg [7:0] counter =  8'd0;
always @( posedge clk100_i or negedge key_i[1] ) begin
  if ( key_i[1] ) begin
    ledr    <=  10'b0;
    counter <=  8'd0;
  end  
  else
   if ( key_i[0] ) begin
     ledr    <= sw_i;
     counter <= counter + 1;
   end 
end

assign ledr_o = counter;
hex dec0
( .in ( counter[7:4] ),
  .out ( hex0_o ) );
hex dec1
( .in ( counter[3:0] ),
  .out ( hex1_o ) );
endmodule
