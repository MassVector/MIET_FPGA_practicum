`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2020 18:43:53
// Design Name: 
// Module Name: register
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
    input      [9:0] d_i,             
    input            clk50_i,           
    input            arst_i,           
    input            en_i,            
    output reg [9:0] register_o       
    );
  

  always @(posedge clk50_i or posedge arst_i) begin
      if (arst_i) register_o <= 0;
      else if (en_i) register_o <= d_i;
  end 
  
endmodule