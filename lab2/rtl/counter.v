`timescale 1ns / 1ps

module counter(
  input        clk100_i,
  input        rstn_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o);

wire bt_down;

reg_to_ledr secmod
( .sw_i       ( sw_i     ),
  .bt_down    ( bt_down  ),
  .rst_i      ( key_i[1] ),
  .ledr_o     ( ledr_o   ),
  .clk100_i   ( clk100_i ));

ccccounter thirdmod
( .bt_down    ( bt_down  ),
  .hex1_o     ( hex1_o   ),
  .rst_i      ( key_i[1] ),
  .hex0_o     ( hex0_o   ),
  .clk100_i   ( clk100_i ));

button_fix butt0
( .key_i      ( !key_i[0]  ),
  .ondn_o     ( bt_down    ),
  .reset_i    ( key_i[1]   ),
  .clk100_i   ( clk100_i   ));

endmodule