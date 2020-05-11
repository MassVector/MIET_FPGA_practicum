`timescale 1ns / 1ps
module counter#(
  parameter DATA_WIDTH = 8
  )
 (
  input        clk100_i,
  input        rstn_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
  );
  
  reg  [7:0] counter_i;
  wire bwp;
  
Debounce deb(
  .clk100_i   ( clk100_i ),
  .rstn_i     ( key_i[1] ),
  .en_i       ( !key_i[0] ),
  .en_down_o  ( bwp ) 
  );

always @( posedge clk100_i or negedge key_i[1] ) begin
  if ( !key_i[1] ) begin
    counter_i <= {DATA_WIDTH{1'b0}};
  end
  else 
      if( bwp ) begin
        counter_i <= counter_i + 1;
      end
end

  REG_TEN reg_ten(
  .clk100_i   ( clk100_i       ),
  .rstn_i     ( key_i    [1]   ),
  .sw_i       ( sw_i           ),
  .key_i      ( key_i    [0]   ),
  .led_o      ( ledr_o         )
  );
  
  decoder_hex decoder_0(
  .kod_i      ( counter_i   [3:0] ),
  .hex_o      ( hex0_o      [6:0] )
  );  
  
  decoder_hex decoder_1(
  .kod_i  ( counter_i       [7:4] ),
  .hex_o  ( hex1_o          [6:0] )
  );  
  
     
endmodule