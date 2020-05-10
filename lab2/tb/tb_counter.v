`timescale  1ns / 1ps

module tb_counter;

  // counter parameters
  localparam CLK_FREQ_MHZ   = 50;
  localparam CLK_PERIOD     = 1000 / CLK_FREQ_MHZ;
  localparam CLK_SEMIPERIOD = 1000 / 2  / CLK_FREQ_MHZ;


  // Clock
  reg          clk50m;
  
  // counter inputs
  reg   [9:0]  sw;
  reg   [1:0]  key;

  // counter outputs
  wire  [9:0]  ledr;
  wire  [6:0]  hex1;
  wire  [6:0]  hex0;


  initial begin
    clk50m = 1;
    forever
      #CLK_SEMIPERIOD clk50m = ~clk50m;
  end

  initial begin
    key[1] = 0;
    #CLK_SEMIPERIOD key[1] = 1;
  end

  counter  DUT (
    .clk_i                   ( clk50m        ),
    
    .sw_i                    ( sw      [9:0] ),
    .key_i                   ( key     [1:0] ),

    .ledr_o                  ( ledr    [9:0] ),
    .hex1_o                  ( hex1    [6:0] ),
    .hex0_o                  ( hex0    [6:0] )
    );

  initial begin
    key[0] = 0;
    repeat ( 4 ) begin
      sw = $random();
      #CLK_PERIOD key[0] = 1;
      #CLK_PERIOD key[0] = 0;
      #CLK_PERIOD key[0] = 1;
      #CLK_PERIOD key[0] = 0;
    end
    
    key[1] = 0;
    #CLK_PERIOD;
    key[1] = 1;
    
    repeat ( 4 ) begin
      sw = $random();
      #CLK_PERIOD key[0] = 1;
      #CLK_PERIOD key[0] = 0;
      #CLK_PERIOD key[0] = 1;
      #CLK_PERIOD key[0] = 0;
    end
    
    $finish;
  end

endmodule
