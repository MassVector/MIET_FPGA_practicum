`timescale  1ns / 1ps

module tb_decoder;

  // decoder parameter
  parameter PERIOD = 20;
  

  // decoder input
  reg  [3:0]  counter_data = 0;

  // decoder output
  wire [6:0]  hex;


  decoder  DUT (
    .counter_i               ( counter_data  [3:0] ),

    .hex_o                   ( hex           [6:0] )
  );

  initial begin
    #( PERIOD / 2 ) counter_data = 4'h1;
    #( PERIOD / 2 ) counter_data = 4'h2;
    #( PERIOD / 2 ) counter_data = 4'h3;
    #( PERIOD / 2 ) counter_data = 4'h4;
    #( PERIOD / 2 ) counter_data = 4'h5;
    #( PERIOD / 2 ) counter_data = 4'h6;
    #( PERIOD / 2 ) counter_data = 4'h7;
    #( PERIOD / 2 ) counter_data = 4'h8;
    #( PERIOD / 2 ) counter_data = 4'h9;
    #( PERIOD / 2 ) counter_data = 4'hA;
    #( PERIOD / 2 ) counter_data = 4'hB;
    #( PERIOD / 2 ) counter_data = 4'hC;
    #( PERIOD / 2 ) counter_data = 4'hD;
    #( PERIOD / 2 ) counter_data = 4'hE;
    #( PERIOD / 2 ) counter_data = 4'hF;
    #( PERIOD / 2 ) $finish;
  end

endmodule
