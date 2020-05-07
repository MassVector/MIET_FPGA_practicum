`timescale 1ns / 1ps


module counter2_tb(

    );
localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMI = ( 1000 / CLK_FREQ_MHZ) / 2; 

    reg        clk;
    reg        en;
    reg        arstn;
    reg        key;
    wire [6:0] hex;

counter2 DUT(
  .clk_i    ( clk ),
  .en_i     ( en  ),
  .arstn_i  ( arstn ),
  .key_i    ( key ),
  .hex      ( hex )
  );
//clk generation
initial begin
    clk = 1'b1;
      forever begin
        #CLK_SEMI clk = ~clk;
    end
end
//arstn generation
initial begin 
  en = 1'b0;
  arstn = 1'b0;
  #CLK_SEMI;
  en = 1'b1;
  #CLK_SEMI;
  arstn <= 1'b1;
  #CLK_SEMI;
  arstn = 1'b0;
end

//key generation
initial begin 
key <= 1'b0;
  forever begin
    key = ~key;
    #CLK_SEMI;
  end
end
endmodule
