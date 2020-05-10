`timescale  1ns / 1ps    

module tb_key_handler;   

  // key_handler Parameters
  localparam CLK_FREQ_MHZ   = 50;
  localparam CLK_PERIOD     = 1000 / CLK_FREQ_MHZ;
  localparam CLK_SEMIPERIOD = 1000 / 2  / CLK_FREQ_MHZ;
  
  // Clock
  reg          clk50m;

  // key_handler input
  reg   [1:0]  key;
  
  // key_handler output
  wire  keypress0_event;
  
  
  initial begin
    clk50m = 1;
    forever
      #CLK_SEMIPERIOD clk50m = ~clk50m;
  end
  
  key_handler  DUT (
    .clk_i                   ( clk50m                 ),
    
    .key_i                   ( key              [1:0] ),
  
    .keypress0_event_o       ( keypress0_event        )
    );
  
  initial begin
    repeat ( 2 ) begin
      key = 0;
      #CLK_PERIOD key = 1;
      #CLK_PERIOD key = 2;
      #CLK_PERIOD key = 3;
      #CLK_PERIOD;
    end
    
    $finish;
  end
  
endmodule