`timescale  1ns / 1ps

module tb_decoder;

  // decoder parameter
  localparam PERIOD = 20;
  

  // decoder input
  reg  [3:0]  counter_data = 0;

  // decoder output
  wire [6:0]  hex;


  decoder  DUT (
    .counter_i               ( counter_data  [3:0] ),

    .hex_o                   ( hex           [6:0] )
  );

  initial begin
    #PERIOD counter_data = 4'h1;
    #PERIOD counter_data = 4'h2;
    #PERIOD counter_data = 4'h3;
    #PERIOD counter_data = 4'h4;
    #PERIOD counter_data = 4'h5;
    #PERIOD counter_data = 4'h6;
    #PERIOD counter_data = 4'h7;
    #PERIOD counter_data = 4'h8;
    #PERIOD counter_data = 4'h9;
    #PERIOD counter_data = 4'hA;
    #PERIOD counter_data = 4'hB;
    #PERIOD counter_data = 4'hC;
    #PERIOD counter_data = 4'hD;
    #PERIOD counter_data = 4'hE;
    #PERIOD counter_data = 4'hF;
    #PERIOD $finish;
  end

endmodule
