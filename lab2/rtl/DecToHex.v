`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2020 18:48:22
// Design Name: 
// Module Name: DecToHex
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


module dec_to_hex(
  input            clk_i,
  input            key_i,
  input      [3:0] data_i,
  
  output     [6:0] data_o 
);
  
  reg [6:0] data; 
  
  always@( posedge clk_i or negedge key_i ) begin
    if( !key_i ) data = 7'b1000000;
      
    case( data_i[3:0] )
      4'd0 :  data = 7'b100_0000;
      4'd1 :  data = 7'b111_1001;
      4'd2 :  data = 7'b010_0100;
      4'd3 :  data = 7'b011_0000;
      4'd4 :  data = 7'b001_1001;
      4'd5 :  data = 7'b001_0010;
      4'd6 :  data = 7'b000_0010;
      4'd7 :  data = 7'b111_1000;
      4'd8 :  data = 7'b000_0000;
      4'd9 :  data = 7'b001_0000;
      4'd10:  data = 7'b000_1000;
      4'd11:  data = 7'b000_0011;
      4'd12:  data = 7'b100_0110;
      4'd13:  data = 7'b010_0001;
      4'd14:  data = 7'b000_0110;
      4'd15:  data = 7'b000_1110; 
    endcase    
  end
  
  assign data_o = data;
endmodule
