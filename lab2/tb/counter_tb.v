`timescale 1ns / 1ps
module counter_tb(

    );
    
  localparam CLK_FREQ_MHZ   = 100;
  localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2; 
    
  reg        clk100_i;
  reg  [1:0] key_i;
  reg  [9:0] sw_i;
  wire [9:0] ledr_o;
  wire [6:0] hex0_o;
  wire [6:0] hex1_o;
  
  counter DUT
  ( 
    .clk100_i(clk100_i),
    .sw_i    (sw_i[9:0]),
    .ledr_o  (ledr_o[9:0]),
    .key_i   (key_i),
    .hex0_o  (hex0_o[6:0]),
    .hex1_o  (hex1_o[6:0])
  );
  
  initial begin
    
  end
  
  initial begin
    clk100_i = 1'b1;
    forever begin
        #CLK_SEMIPERIOD clk100_i=~clk100_i;
    end
  end
  
  initial begin
    sw_i [9:0] = 10'b0;
    key_i[0]   = 1'b0;
    repeat(40)begin
        #(CLK_SEMIPERIOD - 1);
        sw_i[9:0] = $random();
        #(5*CLK_SEMIPERIOD);
        key_i[0] = 1'b1;
        #(10*CLK_SEMIPERIOD);
        key_i[0] = 1'b0;
    end
  end
  
  initial begin
    key_i[1] = 1'b1;
    #(4*CLK_SEMIPERIOD);
    key_i[1] = 1'b0;
    #(4*CLK_SEMIPERIOD);
    key_i[1] = 1'b1;
  end
  
endmodule
