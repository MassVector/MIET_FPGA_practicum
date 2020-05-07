`timescale 1ns / 1ps


module main_tb(

    );
    
    
    

localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMI = ( 1000 / CLK_FREQ_MHZ) / 2;


    reg         clk;
    reg         arstn;
    reg         en;
    
    reg   [9:0] sw;
    reg         key;

    wire  [9:0] led;
    wire  [6:0] hex;

main DUT (
  .clk_i      ( clk  ),
  .arstn_i    ( arstn ),
  .sw_i       ( sw    ),
  .key_i      ( key   ),
  .led_o      (   led ),
  .hex_o      ( hex ),
  .en_i       ( en  )
 );

  initial begin
    clk = 1'b1;
    forever begin
      #CLK_SEMI clk = ~clk;
    end
  end

  // rst gen
  initial begin
    arstn = 1;
    #(4*CLK_SEMI);
    arstn = 0;
    #(4*CLK_SEMI);
    arstn = 1;
    #(4*CLK_SEMI);
    arstn = 0;
  end

  initial begin
  sw  = 0;
  key = 0;
  en = 1;
  repeat(40)begin
      #(CLK_SEMI*2);
      sw[9:0] = $random();
      #(CLK_SEMI*4);
      key = 1;
      #(CLK_SEMI*3);
      key = 0;
  end
end



endmodule
