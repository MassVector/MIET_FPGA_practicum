`timescale 1ns / 1ps

module counter (
  // External clock source
  input          clk100_i,
  
  // Data inputs
  input   [9:0]  sw_i,
  input   [1:0]  key_i,
  
  // Data outputs
  output  [9:0]  ledr_o,
  
  output  [6:0]  hex3_o,
  output  [6:0]  hex2_o,
  output  [6:0]  hex1_o,
  output  [6:0]  hex0_o
  );
  
  // Counter and register data
  reg   [15:0]  counter_data;
  reg   [ 9:0]  register_data;
  
  // HEX'es data
  wire   [6:0]  hex3_data;
  wire   [6:0]  hex2_data;
  wire   [6:0]  hex1_data;
  wire   [6:0]  hex0_data;
  
  // Key press event handler
  reg    [2:0]  key_sync_data;
  wire          keypress0_event_data;
  
  always @( posedge clk100_i ) begin 
    key_sync_data[0] <= ~key_i[0];
    key_sync_data[1] <=  key_sync_data[0];
    key_sync_data[2] <=  key_sync_data[1];
  end
  
  assign keypress0_event_data = key_sync_data[1] & ~key_sync_data[2];
  
  always @( posedge clk100_i or negedge key_i[1] ) begin
    if ( ~key_i[1] ) begin
      counter_data  <= 0;
      register_data <= 0;
    end
    else if ( keypress0_event_data ) begin
      counter_data  <=  counter_data + 1;
      register_data <= ~sw_i & ( sw_i + 1 );
    end
  end
  
  // Decodes data for output to HEX3
  decoder decoder3(
    .counter_i             ( counter_data  [15:12] ),
    .hex_o                 ( hex3_data             )
  );
  
  // Decodes data for output to HEX2
  decoder decoder2(
    .counter_i             ( counter_data   [11:8] ),
    .hex_o                 ( hex2_data             )
  );
  
  // Decodes data for output to HEX1
  decoder decoder1(
    .counter_i             ( counter_data    [7:4] ),
    .hex_o                 ( hex1_data             )
  );
  
  // Decodes data for output to HEX0
  decoder decoder0(
    .counter_i             ( counter_data    [3:0] ),
    .hex_o                 ( hex0_data             )
  );
  
  // Data output to LEDR and HEX'es
  assign ledr_o = register_data;
  
  assign hex3_o = hex3_data;
  assign hex2_o = hex2_data;
  assign hex1_o = hex1_data;
  assign hex0_o = hex0_data;
  
endmodule
