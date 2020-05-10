`timescale 1ns / 1ps

module key_handler(
  // External clock source
  input  clk_i,
  
  // Data input
  input [1:0]  key_i,
  
  // Data output
  output keypress0_event_o
  );
  
  // Data on pressed KEY0
  reg keypress_event_data;
  
  always @( posedge clk_i or negedge key_i[1] ) begin
    if( key_i[1] )
      keypress_event_data <= ~key_i[0];
  end
  
  assign keypress0_event_o = keypress_event_data;

endmodule
