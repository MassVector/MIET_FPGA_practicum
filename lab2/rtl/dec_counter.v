`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.05.2020 16:40:52
// Design Name: 
// Module Name: dec_counter
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


module dec_counter(
  input [7:0] data_i,
  
  output [3:0] data_0_o,
  output [3:0] data_1_o
);
  reg  [3:0] data0;
  reg  [3:0] data1;
  reg        out_of_range;
  
  always@(*) begin
    out_of_range <= 0;
    if(data_i > 'd99) out_of_range <= 1'b1;
    if(out_of_range) begin
    
    end else begin
      if(
      
      
    end
  end

endmodule
