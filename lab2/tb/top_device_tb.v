`timescale 1ns / 1ps

module top_device_tb(
  );
  
  reg  [9:0] sw;
  reg  [1:0] btn;
  reg        clk;
  wire [9:0] led;
  wire [6:0] hex0;
  wire [6:0] hex1;
 
  localparam CLK_FREQ_MHZ   = 50;
  localparam CLK_SEMIPERIOD = ( 500 / CLK_FREQ_MHZ ) / 2;
    
  top_device DUT(
    .sw_i      ( sw    [9:0] ),
    .btn_i     ( btn   [1:0] ),
    .clk_50MHZ ( clk         ),
    .led_o     ( led   [9:0] ),
    .hex0_o    ( hex0  [6:0] ),
    .hex1_o    ( hex1  [6:0] )
  );
  
  //CLK gen
    initial begin 
      clk=1'b0;
      forever begin
        #CLK_SEMIPERIOD 
        clk=~clk;
      end
    end
  
  //RST gen
    initial begin
      btn[1] = 1'b1;
      #CLK_SEMIPERIOD;
      btn[1] = 1'b0;
      #(3*CLK_FREQ_MHZ);
      btn[1] = 1'b1;
      #CLK_SEMIPERIOD;
      btn[1] = 1'b0;
    end
    
  //EN gen
    initial begin
      btn[0] = 1'b1;
      repeat(10) begin
        #(1.5*CLK_SEMIPERIOD)
        btn[0] = ~btn[0];
      end
    end
  
  //SW gen
    initial begin
     repeat(10) begin
        #(5*CLK_FREQ_MHZ);
        sw[9:0]=$random();
      end
    end
     
endmodule
