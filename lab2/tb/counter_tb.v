`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2020 16:09:34
// Design Name: 
// Module Name: main_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_tb(

    );
    
localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;     

reg   [9:0]  sw_i;
wire  [9:0]  ledr_o;
reg   [2:0]  key_i;
reg          rstn_i;
reg          clk100_i;
wire  [6:0]  hex0_o;
wire  [6:0]  hex1_o;
wire  [6:0]  hex2_o;
wire  [6:0]  hex3_o;

counter DUT (
 .sw_i       (  sw_i      ),
 .ledr_o     (  ledr_o    ),
 .clk100_i   (  clk100_i  ),
 .key_i      (  key_i     ),
 .rstn_i     (  rstn_i    ),
 .hex0_o     (  hex0_o    ),
 .hex1_o     (  hex1_o    ),
 .hex2_o     (  hex2_o    ),
 .hex3_o     (  hex3_o    )
);

initial begin
  clk100_i = 1'b1;
  forever begin
    #CLK_SEMIPERIOD clk100_i=~clk100_i;
  end
end

initial begin
  rstn_i   = 1'b1;
  key_i[1] = 1'b1;
  #(4*CLK_SEMIPERIOD);
  key_i[1] = 1'b0;
  #(4*CLK_SEMIPERIOD);
  key_i[1] = 1'b1;
end

initial begin
  sw_i     = 10'b0;
  key_i[0] = 1'b1;
  key_i[2] = 1'b1;
  repeat(40)begin
    #(CLK_SEMIPERIOD - 1);
    sw_i     = $random();
    #(3*CLK_SEMIPERIOD);
    key_i[0] = 1'b0;
    #(12*CLK_SEMIPERIOD);
    key_i[2] = 1'b0;
    #(3*CLK_SEMIPERIOD);
    key_i[0] = 1'b1;
    #(12*CLK_SEMIPERIOD);
    key_i[2] = 1'b1;
  end
end    
    
endmodule

