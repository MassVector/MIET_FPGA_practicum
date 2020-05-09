`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:05:30
// Design Name: 
// Module Name: test_clk_tb
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


module main_tb(
    );
  reg        clk50_i;  
  reg  [9:0] sw_i;
  reg  [1:0] key_i;
  wire [9:0] ledr_o;
  wire [6:0]  hex1_o;
  wire [6:0]  hex0_on;
    
  main DUT (
  .clk50_i  (clk50_i),
  .sw_i     (sw_i),
  .key_i    (key_i),
  .ledr_o   (ledr_o),
  .hex1_o    (hex_o),
  .hex0_o   (hex_on)
  );

 initial begin
      sw_i[9:0] = 10'b0000000000;
      key_i = 2'b00;
      #15
      key_i[1] = 1'b1;
      #20
      key_i[1] = 1'b0;
      #30
      sw_i[9:0] = 10'b0000000111;
      #20
      key_i[0] = 1'b1;
      #20
      key_i[0] = 1'b0;
      #20
      sw_i[9:0] = 10'b0000001111;
      #20
      key_i[0] = 1'b1;
      #20
      key_i[0] = 1'b0;
      #20
      key_i[1] = 1'b1;
      #20
      key_i[1] = 1'b0;
      #50
      key_i[0] = 1'b1;
      #30
      key_i[0] = 1'b0;
      #30
      sw_i[9:0] = 10'b0011111111;
      #50
      key_i[0] = 1'b1;
      #30
      key_i[0] = 1'b0;
 end 
 
 always begin 
    clk50_i = 1'b1;
    #10;
    clk50_i = 1'b0;
    #10;
 end
    
endmodule
