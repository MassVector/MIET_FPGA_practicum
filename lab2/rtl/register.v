`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2020 17:30:28
// Design Name: 
// Module Name: Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register(
  input            clk_i ,
  input            rstn_i ,
  input            en_i,
  input      [9:0] data_i,

  output reg [9:0] data_o
  );
  
  always@( posedge clk_i or negedge rstn_i ) begin
    if ( rstn_i ) 
      data_o <= 0;
    else if ( en_i) 
      data_o <= data_i;
  end
  
endmodule