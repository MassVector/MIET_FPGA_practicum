`timescale 1ns / 1ps



module dff(
   input  clk100_i,
   input  rstn_i,
   input  [9:0] sw_i,
   input  [1:0] key_i, 
   output [9:0] ledr_o,
   output [6:0] hex0_o,
   output [6:0] hex1_o
   );

 reg [9:0] Q       = 10'b0;
 reg [7:0] dff = 8'd0;

 always @( posedge clk100_i ) begin
    if ( key_i[0] ) begin
       Q <= sw_i;
       dff <= dff + 1;
    end


    else
       if ( key_i[1] ) begin
         Q <= 10'b0;
         dff <= 8'd0;
       end
  end

  assign ledr_o = Q;

  decoder dec0
  ( .in(dff[7:4]),
    .out(hex0_o));

 decoder dec1
  ( .in(dff[3:0]),
    .out(hex1_o));  


endmodule


