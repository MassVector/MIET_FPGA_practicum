`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 14:40:35
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );

  reg          clk100_i;
  reg          rstn_i;
  reg   [11:0] sw_i;
  reg   [2:0]  key_i;
  wire  [9:0]  ledr_o;
  wire  [6:0]  hex1_o;
  wire  [6:0]  hex0_o;

    counter DUT (
      .clk100_i  ( clk100_i ),
      .rstn_i    ( rstn_i   ),
      .sw_i      ( sw_i     ),
      .key_i     ( key_i    ),
      .ledr_o    ( ledr_o   ),
      .hex1_o    ( hex1_o   ),
      .hex0_o    ( hex0_o   )
    );

    initial begin
    
      sw_i[7:0] = 8'b10101010;
      sw_i[11:7] = 3'b000;
      key_i[2:0] = 3'b111;
      #55
      key_i[1] = 1'b0;
      #40
      key_i[1] = 1'b1;
      #40
      sw_i[7:0] = 8'b00001111;
      #40
      key_i[0] = 1'b0;
      #40
      key_i[0] = 1'b1;
      #40
      key_i[0] = 1'b0;
      #40
      key_i[0] = 1'b1;
      #40
      sw_i[11] = 1'b1;
      #40
      key_i[0] = 1'b0;
      #40
      key_i[0] = 1'b1;
      #40
      key_i[2] = 1'b0;
      #40
      key_i[2] = 1'b1;
      #40
      sw_i[7:0] = 8'b00001111;
      #40
      key_i[0] = 1'b0;
      #40
      key_i[0] = 1'b1;
      
      
      
    end


    always begin 
      clk100_i = 1'b1;
      #10;
      clk100_i = 1'b0;
      #10;
    end
endmodule
