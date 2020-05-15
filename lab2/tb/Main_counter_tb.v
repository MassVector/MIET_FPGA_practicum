`timescale 1ns / 1ps

module counter_tb(
    );
  localparam CLK_FREQ_MHZ = 50;
  localparam CLK_SEMIPERIOD =( 1000 / CLK_FREQ_MHZ ) / 2;
  
  reg         CLK;
  reg  [1:0]  key_i;
  reg  [10:0] sw_i;
  wire [9:0]  ledr_o;
  wire [6:0]  hex1_on;
  wire [6:0]  hex0_on;
  
  counter DUT(
   .clk100_i  ( CLK     ),
   .sw_i      ( sw_i    ),
   .key_i     ( key_i   ),
   .ledr_o    ( ledr_o  ),
   .hex1_o    ( hex1_on ),
   .hex0_o    ( hex0_on )
   );
   
 //Clock gen
 initial begin
    CLK = 1'b1;
    forever begin
      #CLK_SEMIPERIOD CLK = ~CLK;
    end
 end
 //Reset gen
 initial begin
      key_i[1] = 1'b0;
      forever begin
        #( 15   * CLK_SEMIPERIOD ) key_i[1] = 1'b1;
        #( 20  * CLK_SEMIPERIOD ) key_i[1] = 1'b0;
      end
 end
 //Signals gen
 initial begin
     key_i[0]   = 1'b0;
     sw_i [10:0] = 11'b0000000000;
     forever begin
        #( 7 * CLK_SEMIPERIOD ) 
        key_i[0]  = 1'b1;
        #( 7 * CLK_SEMIPERIOD ) 
        key_i[0]  = 1'b0;
        sw_i[10:0] = $random%2048;
     end
 end
endmodule
