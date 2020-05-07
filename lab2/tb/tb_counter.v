`timescale  1ns / 1ps

module tb_counter;

// counter Parameters
parameter PERIOD  = 20;

// counter Inputs
reg   clk_i                                = 0 ;
reg   key0_i                               = 0 ;
reg   key1_i                               = 0 ;
reg   sw_event_i                           = 0 ;

// counter Outputs
wire  [7:0]  counter_o                     ;

initial begin
  forever
    #(PERIOD/2)  clk_i=~clk_i;
end

counter  u_counter (
           .clk_i                   ( clk_i             ),
           .key0_i                  ( key0_i            ),
           .key1_i                  ( key1_i            ),
           .sw_event_i              ( sw_event_i        ),

           .counter_o               ( counter_o   [7:0] )
         );

initial begin
  key0_i = 0;
  key1_i = 1;
  
  sw_event_i = 0;
  #(PERIOD/2) key1_i = 0;
  #(PERIOD/2) key0_i = 1;
  #(PERIOD/2) key0_i = 0;
  #(PERIOD/2);
  
  sw_event_i = 1;
  #(PERIOD/2) key0_i = 1;
  #(PERIOD/2) key0_i = 0;
  #(PERIOD/2) key1_i = 1;
  #(PERIOD/2);
  $finish;
end

endmodule
