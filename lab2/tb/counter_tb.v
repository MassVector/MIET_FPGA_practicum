`timescale 1ns / 1ps

module counter_tb();

localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;   

reg         clk;
reg         rstn;
    
reg   [9:0] sw;
reg   [1:0] key;
    
wire  [9:0] led;
wire  [6:0] hex1;
wire  [6:0] hex0;


counter DUT (
  .clk100_i ( clk  ),
  .rstn_i   ( rstn ),
  
  .sw_i     ( sw   ),
  .key_i    ( key  ),
  
  .ledr_o   ( led  ),
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
  key[1] = 1;
  #(4*CLK_SEMIPERIOD);
  key[1] = 0;
  #(4*CLK_SEMIPERIOD);
  key[1] = 1;
end

initial begin
  sw  = 10'b0;
  key[0] = 1;
  repeat(110)begin
      #(6*CLK_SEMIPERIOD);
      sw[9:0] = $random();
      #(3*CLK_SEMIPERIOD);
      key[0] = 0;
      #(10*CLK_SEMIPERIOD);
      key[0] = 1;
  end
end    

endmodule
