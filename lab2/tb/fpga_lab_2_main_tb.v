`timescale 1ns / 1ps

module fpga_lab_2_main_tb();

localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;   

reg         clk;
reg         rstn;
    
reg   [9:0] sw;
reg         key;
    
wire  [9:0] led;
wire  [6:0] hex;
wire  [1:0] hex_on;


fpga_lab_2_main DUT (
  .clk_i    ( clk    ),
  .rstn_i   ( rstn   ),
  
  .sw_i     ( sw     ),
  .key_i    ( key    ),
  
  .led_o    ( led    ),
  .hex_o    ( hex    ),
  .hex_on_o ( hex_on )
);

// clock gen
initial begin
  clk = 1'b1;
  forever begin
    #CLK_SEMIPERIOD clk = ~clk;
  end
end

// rst gen
initial begin
  rstn = 1'b1;
  #( 4*CLK_SEMIPERIOD );
  rstn = 1'b0;
  #( 4*CLK_SEMIPERIOD );
  rstn = 1'b1;
end

initial begin
  sw  = 10'b0;
  key = 1'b0;
    repeat( 40 )begin
      #( 6*CLK_SEMIPERIOD );
      sw[9:0] = $random();
      #( 3*CLK_SEMIPERIOD );
      key = 1'b1;
      #( 3*CLK_SEMIPERIOD );
      key = 1'b0;
  end
end    

endmodule
