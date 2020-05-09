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


module main(
  input        [9:0]  sw_i,
  input               btn_i,
  input               clk50_i,
  input               rstn_i,  
  output       [9:0]  led_o,
  output       [6:0]  hex0_o,
  output       [6:0]  hex1_o
    );       

reg [2:0] button_syncroniser;
wire key_was_pressed;

always @( posedge clk50_i ) 
  begin
    button_syncroniser[0] <= btn_i;
    button_syncroniser[1] <= button_syncroniser[0];
    button_syncroniser[2] <= button_syncroniser[1];
  end
  
assign key_was_pressed = ~button_syncroniser[2] & button_syncroniser[1];

reg [9:0] q;

assign led_o = q;

always @( posedge clk50_i or negedge rstn_i ) 
  begin
    if ( !rstn_i ) 
        q <= 10'd0;
    else if ( key_was_pressed ) 
        q <= sw_i;
  end

reg [7:0] counter;
always @( posedge clk50_i or negedge rstn_i ) 
  begin
    if ( !rstn_i ) 
        counter <= 8'd0;
    else if ( key_was_pressed && ( sw_i > 10'd20 ) ) // для примера событие является на sw_i число больше 20
        counter = counter + 1;
  end
  
hex hex0 ( 
  .in( counter[3:0] ),
  .out( hex0_o      )
  );
  
hex hex1 ( 
  .in( counter[7:4] ),
  .out( hex1_o      )
  );  
              
endmodule
