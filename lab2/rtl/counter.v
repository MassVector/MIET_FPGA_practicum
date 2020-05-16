`timescale 1ns / 1ps

module counter (
  input        clk100_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
  );
  
  reg  [7:0] counter;
  reg  [9:0] register;
  reg  [2:0] sync;
  wire       key_event;
  
  assign key_event = sync[1] & ~sync[2];
  assign ledr_o = ( ( register | ( register - 1 ) ) + 1 ) & register;
  
  always @( posedge clk100_i ) begin 
    sync[0] <= ~key_i[0];
    sync[1] <=  sync[0];
    sync[2] <=  sync[1];
  end  
  
  always @( posedge clk100_i or negedge key_i[1] ) begin
    if ( ~key_i[1] ) begin
      counter  <=  8'b00101100;
      register <= 0;
    end
    else if ( key_event ) begin
      counter  <= counter << 1;
      register <= sw_i;
    end
  end
  
  dc_hex dc_hex1(
    .data_i ( counter [7:4] ),
    .hex_o  ( hex1_o        )
  );
  
  dc_hex dc_hex0(
    .data_i ( counter [3:0] ),
    .hex_o  ( hex0_o        )
  );
endmodule
