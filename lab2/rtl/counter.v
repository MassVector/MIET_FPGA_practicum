`timescale 1ns / 1ps


module counter (
  // External clock source
  input          clk100_i,
  
  // Data inputs
  input   [9:0]  sw_i,
  input   [1:0]  key_i,
  
  // Data outputs
  output  [9:0]  ledr_o,
  output  [6:0]  hex1_o,
  output  [6:0]  hex0_o
  );
  
  
  // Counter, register, HEX0 and HEX1 data
  reg   [7:0]  counter_data;
  reg   [9:0]  register_data;
  
  wire  [6:0]  hex0_data;
  wire  [6:0]  hex1_data;
  
  // Key press event handler
  reg          keypress0_event_data;
  
  always @( negedge key_i[0] ) begin
    keypress0_event_data <= 1;
  end
  
  always @( negedge key_i[1] ) begin
    counter_data         <= 0;
    register_data        <= 0;
    keypress0_event_data <= 0;
  end
  
  always @( posedge clk100_i ) begin
    if ( keypress0_event_data ) begin
      counter_data         <= counter_data + 1;
      register_data        <= sw_i;
      keypress0_event_data <= 0;
    end
  end
  
  // Decodes data for output to HEX0
  decoder decoder0(
    .counter_i             ( counter_data  [3:0] ),
    .hex_o                 ( hex0_data           )
  );
  
  // Decodes data for output to HEX1
  decoder decoder1(
    .counter_i             ( counter_data  [7:4] ),
    .hex_o                 ( hex1_data           )
  );
  
  
  // Data output to LEDR, HEX0 and HEX1
  assign ledr_o = register_data;
  assign hex0_o = hex0_data;
  assign hex1_o = hex1_data;

endmodule
