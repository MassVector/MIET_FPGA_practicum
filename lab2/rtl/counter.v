`timescale 1ns / 1ps

module counter(

  input         clk100_i,
  input   [9:0] sw_i,
  input   [1:0] key_i,
  
  output  [9:0] ledr_o,
  output  [6:0] hex1_o,
  output  [6:0] hex0_o
  
  
);

  reg  [7:0] counter;
  

  wire       key_pressed;
  
  
  always @( posedge clk100_i or negedge key_i[1] ) begin
    if( !key_i[1] )
      counter <= 0;
    else if( key_pressed ) begin
      counter <= counter + 1;
    end
  end
  
  
  
debounce d(
  .clk_i        ( clk100_i     ),
  .rst_i        ( !key_i   [1] ),
  .en_i         ( key_i    [0] ),
  .en_down_o    ( key_pressed  ), 
  .en_up_o      (              )
);
  
  
register r(
  .clk_i        ( clk100_i    ),
  .rstn_i       ( key_i[1]    ),
  .en_i         ( key_pressed ),
  .data_i       ( sw_i        ),

  .data_o       ( ledr_o      )
);


dec_to_hex dtx0(
  .clk_i  ( clk100_i        ),
  .key_i  ( key_i     [1]   ),
  .data_i ( counter   [3:0] ),
  .data_o ( hex0_o          )
);


dec_to_hex dtx1(
  .clk_i  ( clk100_i        ),
  .key_i  ( key_i     [1]   ),
  .data_i ( counter   [7:4] ),
  .data_o ( hex1_o          )
);


endmodule
