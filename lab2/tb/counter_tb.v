`timescale 1ns / 1ps


module counter_tb(

    );




localparam CLK_FREQ_MHZ   =     50;
localparam CLK_SEMI       =     ( 1000 / CLK_FREQ_MHZ) / 2;


    reg         clk;

    reg   [10:0] sw;
    reg   [1:0] key;

    wire  [9:0] led;
    wire  [6:0] hex0;
    wire  [6:0] hex1;

counter BUT(
  .clk100_i   (  clk  ),
  .sw_i       (  sw   ),
  .key_i      (  key  ),
  .led_o      (  led  ),
  .hex0_o     (  hex0 ),
  .hex1_o     (  hex1 )
 );

initial begin
  clk = 1'b1;
  forever begin
    #CLK_SEMI clk = ~clk;
  end
end


initial begin
  key[1] = 1;
  #(2*CLK_SEMI);
  key[1] = 0;
  #(2*CLK_SEMI);
  key[1] = 1;
  #(2*CLK_SEMI);
  key[1] = 0;
  #(2*CLK_SEMI);
  key[1] = 1;
end

initial begin
sw[9:0] = 10'b0100000010;
sw[10] = 1;
repeat(50)begin
    key[0] = 0;
    #(CLK_SEMI*7);
    key[0] = 1;
    #(CLK_SEMI*7);
    key[0] = 0;
  end
end



endmodule
