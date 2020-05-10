`timescale 1ns / 1ps


module main(
  input               clk_i,
  input               arstn_i, 
  input               btn_i,
  input        [9:0]  sw_i,
  output       [9:0]  led_o,
  output       [6:0]  hex0_o,
  output       [6:0]  hex1_o
    );       

//описание сихронизации кнопки
reg  [2:0]  button_sync;
wire        key_pressed_true;

always @( posedge clk_i or negedge arstn_i ) 
  begin
    if ( !arstn_i )
      button_sync <= 3'b0;
    else
      button_sync[0] <= btn_i;
      button_sync[1] <= button_sync[0];
      button_sync[2] <= button_sync[1];
  end

assign key_pressed_true = ~button_sync[2] & button_sync[1];

reg [9:0] reg_mass;

assign led_o = reg_mass;

always @( posedge clk_i or negedge arstn_i ) 
  begin
    if ( !arstn_i ) 
      reg_mass <= 10'd0;
    else if ( key_pressed_true ) 
      reg_mass <= sw_i;
  end

reg  [7:0]  counter;
always @( posedge clk_i or negedge arstn_i ) 
  begin
    if ( !arstn_i )
      counter <= 8'd0;
    else if ( key_pressed_true && ( sw_i > 10'd20 ) )
      counter = counter + 1;
  end

hex hex0 ( 
  .in  ( counter[3:0] ),
  .out ( hex0_o       )
 );

hex hex1 ( 
  .in  ( counter[7:4] ),
  .out ( hex1_o       )
 );     

endmodule