`timescale  1ns / 1ps

module tb_main;

// main Parameters
parameter PERIOD  = 20;

// main Inputs
reg   clk_i                                = 0 ;
reg   [9:0]  sw_i                          = 0 ;
reg   [1:0]  key_i                         = 0 ;

// main Outputs
wire  [9:0]  ledr_o                        ;
wire  [6:0]  hex0_o                        ;
wire  [6:0]  hex1_o                        ;


initial begin
  forever
    #(PERIOD/2) clk_i=~clk_i;
end

main  u_main (
        .clk_i                   ( clk_i         ),
        .sw_i                    ( sw_i    [9:0] ),
        .key_i                   ( key_i   [1:0] ),

        .ledr_o                  ( ledr_o  [9:0] ),
        .hex0_o                  ( hex0_o  [6:0] ),
        .hex1_o                  ( hex1_o  [6:0] )
      );

initial begin
  key_i = 0;
  
  sw_i[9:0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2);
  
  sw_i[9:0] = 10'd3;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[1] = 0;
  #(PERIOD/2);
  
  sw_i[9:0] = 10'd15;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[1] = 0;
  #(PERIOD/2);
  
  sw_i[9:0] = 10'd63;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[1] = 0;
  #(PERIOD/2);
  
  sw_i[9:0] = 10'd255;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[1] = 0;
  #(PERIOD/2);
  
  sw_i[9:0] = 10'd1023;
  #(PERIOD/2) key_i[0] = 1;
  #(PERIOD/2) key_i[0] = 0;
  #(PERIOD/2) key_i[1] = 1;
  #(PERIOD/2) key_i[1] = 0;
  #(PERIOD/2);
  
  $finish;
end

endmodule
