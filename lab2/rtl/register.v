`timescale 1ns / 1ps
module register(
  input            clk ,
  input            rstn ,
  input            in,
  input      [9:0] data_i,

  output reg [9:0] data_o
);
  always@( posedge clk or negedge rstn ) begin
    if ( !rstn ) 
      data_o <= 0;
    else if ( !in ) 
      data_o <= data_i;
  end
endmodule
