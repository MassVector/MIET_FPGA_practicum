`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2020 20:58:46
// Design Name: 
// Module Name: main
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


module counter(
  input   [9:0]  sw_i,
  input   [2:0]  key_i,
  input          clk100_i,
  input          rstn_i,  
  output  [9:0]  ledr_o,
  output  [6:0]  hex0_o,
  output  [6:0]  hex1_o,
  output  [6:0]  hex2_o,
  output  [6:0]  hex3_o
    );       

reg  [2:0] button_syncroniser;
wire       key_was_pressed;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] )
      button_syncroniser    <= 3'b0;
    else
      button_syncroniser[0] <= ~key_i[0] & ~key_i[2];
      button_syncroniser[1] <= button_syncroniser[0];
      button_syncroniser[2] <= button_syncroniser[1];
  end
  
assign key_was_pressed = ~button_syncroniser[2] & button_syncroniser[1];

reg [9:0] q;

assign ledr_o = q;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] ) 
      q <= 10'd0;
    else if ( key_was_pressed ) 
      q <= sw_i;
  end

reg [15:0] counter;
always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] ) 
      counter <= 16'd0;
    else if ( key_was_pressed && ( sw_i > 10'd20 ) ) // для примера событие является на sw_i число больше 20
      counter <= counter + 1;
  end
  
hex hex0 ( 
  .in  ( counter[3:0] ),
  .out ( hex0_o       )
  );
  
hex hex1 ( 
  .in  ( counter[7:4] ),
  .out ( hex1_o       )
  );
   
hex hex2 (
  .in  ( counter[11:8] ),
  .out ( hex2_o        )
  );

hex hex3 (
  .in  ( counter[15:12] ),
  .out ( hex3_o         )
  ); 
              
endmodule
