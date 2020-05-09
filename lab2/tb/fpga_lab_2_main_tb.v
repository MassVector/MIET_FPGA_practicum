`timescale 1ns / 1ps

module fpga_lab_2_main_tb();

localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;   

reg         clk;
reg         rstn;
    
reg   [9:0] sw;
reg         key;
    
wire  [9:0] led;
wire  [6:0] hex1;
wire  [6:0] hex0;


fpga_lab_2_main DUT (
  .clk_i    ( clk  ),
  .rstn_i   ( rstn ),
  
  .sw_i     ( sw   ),
  .key_i    ( key  ),
  
  .led_o    ( led  ),
  .hex1_o   ( hex1 ),
  .hex0_o   ( hex0 )
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
  rstn = 1;
  #(4*CLK_SEMIPERIOD);
  rstn = 0;
  #(4*CLK_SEMIPERIOD);
  rstn = 1;
end

initial begin
  sw  = 10'b0;
  key = 0;
  repeat(40)begin
      #(6*CLK_SEMIPERIOD);
      sw[9:0] = $random();
      #(3*CLK_SEMIPERIOD);
      key = 1;
      #(3*CLK_SEMIPERIOD);
      key = 0;
  end
end    

endmodule
