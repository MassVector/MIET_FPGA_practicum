`timescale 1ns / 1ps

module key_handler(
  // External clock source
  input        clk100_i,
  
  // Data input
  input [1:0]  key_i,
  
  // Data output
  output       keypress0_event_o
  );
  
  // Data on pressed keys
  reg [1:0] keypress_event_data;

  always @( posedge clk100_i or negedge key_i[1] ) begin
    if( key_i[1] ) begin
      keypress_event_data[0] <=  key_i[0];
      keypress_event_data[1] <= ~keypress_event_data[0];
    end
    else
      keypress_event_data    <=  2;
  end
  
  assign keypress0_event_o = keypress_event_data[0] & keypress_event_data[1];

endmodule
