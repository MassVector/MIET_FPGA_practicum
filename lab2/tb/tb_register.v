`timescale  1ns / 1ps

module tb_register;

// register Parameters
parameter PERIOD  = 20;


// register Inputs
reg   clk_i                                = 0 ;
reg   key0_i                               = 0 ;
reg   key1_i                               = 0 ;
reg   [9:0]  sw_i                          = 0 ;

// register Outputs
wire  [9:0]  register_o                    ;


initial begin
  forever
    #(PERIOD/2) clk_i = ~clk_i;
end

register  u_register (
            .clk_i                   ( clk_i             ),
            .key0_i                  ( key0_i            ),
            .key1_i                  ( key1_i            ),
            .sw_i                    ( sw_i        [9:0] ),

            .register_o              ( register_o  [9:0] )
          );

initial begin
  key0_i = 0;
  key1_i = 0;
  
  sw_i = 0;
  #(PERIOD/2) key0_i = 1;
  #(PERIOD/2) key0_i = 0;
  #(PERIOD/2) key1_i = 1;
  #(PERIOD/2) key1_i = 0;
  
  #(PERIOD/2) sw_i = 513;
  #(PERIOD/2) key0_i = 1;
  #(PERIOD/2) key0_i = 0;
  #(PERIOD/2) key1_i = 1;
  #(PERIOD/2) key1_i = 0;
  
  #(PERIOD/2) sw_i = 1023;
  #(PERIOD/2) key0_i = 1;
  #(PERIOD/2) key0_i = 0;
  #(PERIOD/2) key1_i = 1;
  #(PERIOD/2) key1_i = 0;
  #(PERIOD/2);
  $finish;
end

endmodule
