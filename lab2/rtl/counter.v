`timescale 1ns / 1ps
module counter(
  input        clk100_i,
  input        rstn_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
);
  reg  [7:0] count   =  8'd0;
  wire       btn_pr;
button btn1( 
  .in                 ( key_i[0] ),
  .rstn               ( key_i[1] ),
  .clk                ( clk100_i ),
  .button_was_pressed ( btn_pr   )
);
register reg_10( 
  .in                 ( key_i   [0]   ),
  .rstn               ( key_i   [1]   ),
  .clk                ( clk100_i      ),
  .data_i             ( sw_i    [9:0] ),
  .data_o             ( ledr_o  [9:0] )
);
  always @( posedge clk100_i or negedge key_i[1] ) begin
    if ( !key_i[1] ) begin
      count <= 8'd0;
    end
    else
      if ( btn_pr ) begin
        count <= count + 1;
      end 
  end
hex dec0(
  .in  ( count  [3:0] ),
  .out ( hex0_o       ) 
);
hex dec1(
  .in  ( count  [7:4] ),
  .out ( hex1_o       ) 
);
endmodule
