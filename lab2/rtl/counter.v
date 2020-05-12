`timescale 1ns / 1ps

module counter(
  input         clk100_i,
  input  [1:0]  key_i, 
  
  input  [9:0]  sw_i, 
  output [9:0]  ledr_o,
    
  output [6:0]  hex0_o,
  output [6:0]  hex1_o,
  output [6:0]  hex2_o,
  output [6:0]  hex3_o
);

wire  [6:0]      hex0_d;
wire  [6:0]      hex1_d;
wire  [6:0]      hex2_d;
wire  [6:0]      hex3_d;

assign  hex0_o = hex0_d;
assign  hex1_o = hex1_d;
assign  hex2_o = hex2_d;
assign  hex3_o = hex3_d;

reg   [2:0]  button_sync;
wire         key_pressed_true;

always @( posedge clk100_i ) 
  begin
    button_sync[0] <= ~key_i[0];
    button_sync[1] <= button_sync[0];
    button_sync[2] <= button_sync[1];
  end

assign key_pressed_true = ~button_sync[2] & button_sync[1];

reg  [9:0]      reg_mass;
assign ledr_o = reg_mass;

reg  [15:0]     counter;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( ~key_i[1] )
      begin
        counter  <= 10'd0; 
        reg_mass <= 10'd0;
      end
    else if ( key_pressed_true )
      begin
        counter  <= counter + 1; 
        reg_mass <= sw_i & (sw_i-1);
      end
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
  .out ( hex2_o       )
 ); 
 
 hex hex3 ( 
  .in  ( counter[15:12] ),
  .out ( hex3_o       )
 );
  
endmodule
