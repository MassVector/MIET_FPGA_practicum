`timescale 1ns / 1ps
module main_tb(

    );
    
  localparam CLK_FREQ_MHZ   = 100;
  localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2; 
    
  reg clk_i;
  reg btn_i;
  reg rstn_i;
  reg [9:0] sw;
  wire [9:0] led_o;
  wire [6:0] hex;
  wire [1:0] hex_on;
  
  main DUT
  ( 
    .clk_i(clk_i),
    .sw(sw[9:0]),
    .led_o(led_o[9:0]),
    .btn_i(btn_i),
    .rstn_i(rstn_i),
    .hex(hex[6:0]),
    .hex_on(hex_on[1:0])
  );
  
  initial begin
    
  end
  
  initial begin
    clk_i = 1'b1;
    forever begin
        #CLK_SEMIPERIOD clk_i=~clk_i;
    end
  end
  
  initial begin
    sw  [9:0] = 10'b0;
    btn_i     = 1'b0;
    repeat(40)begin
        #(CLK_SEMIPERIOD - 1);
        sw[9:0] = $random();
        #(5*CLK_SEMIPERIOD);
        btn_i = 1'b1;
        #(10*CLK_SEMIPERIOD);
        btn_i = 1'b0;
    end
  end
  
  initial begin
    rstn_i = 1'b1;
    #(4*CLK_SEMIPERIOD);
    rstn_i = 1'b0;
    #(4*CLK_SEMIPERIOD);
    rstn_i = 1'b1;
  end
  
endmodule
