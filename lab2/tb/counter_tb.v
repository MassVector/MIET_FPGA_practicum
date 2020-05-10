`timescale 1ns / 1ps

module counter_tb(
  );
  
  reg  [9:0] sw;
  reg  [1:0] key;
  reg        clk;
  wire [9:0] led;
  wire [6:0] hex0;
  wire [6:0] hex1;
  
  localparam CLK_FREQ_MHZ   = 50;
  localparam CLK_SEMIPERIOD = ( 500 / CLK_FREQ_MHZ ) / 2;
    
  counter DUT(
 
    .clk100_i ( clk        ),
    .sw_i     ( sw   [9:0] ),
    .key_i    ( key  [1:0] ),
  
    .ledr_o   ( led  [9:0] ),
    .hex1_o   ( hex1 [6:0] ),
    .hex0_o   ( hex0 [6:0] )
  );

  //CLK gen
    initial begin 
      clk=1'b0;
      forever #(CLK_SEMIPERIOD/2) clk=~clk;
    end
  
  //RST gen
    initial begin
      key[1] <= 1'b0;
     #(3*CLK_SEMIPERIOD+1)  key[1] <= ~key[1];
    end
    
  //EN gen
    initial begin
      key[0] <= 1'b1;
      forever #(1.5*CLK_SEMIPERIOD+2)
      key[0] <= ~key[0];
    end
  
  //SW gen
    initial begin
     sw [9:0]=10'd0;
      forever #(10*CLK_SEMIPERIOD+2)
        sw [9:0] <= $random();
    end
     
endmodule
