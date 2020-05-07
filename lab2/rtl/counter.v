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
  
reg_to_ledr secmod
( .sw_i(sw_i),
  .ledr_o(ledr_o));
  
ccccounter thirdmod
( .key_i(key_i),
  .hex1_o(hex1_o),
  .hex0_o(hex0_o));
 
endmodule
