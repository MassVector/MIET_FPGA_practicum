`timescale 1ns / 1ps


module main#(
  parameter DATA_WIDTH = 10
  )(
  input                             clk_50m,
  input       [DATA_WIDTH-1:0]      sw,
  input       [1:0]                 key,
  output      [DATA_WIDTH-1:0]      ledr,
  output  reg [6:0]                 hex,
  output  reg [1:0]                 hex_on
    );
    
  wire [DATA_WIDTH-1:0] led_reg;
  assign ledr = led_reg;
  
  wire [13:0] dec;
  wire [7:0] count;
  reg [1:0] HEX_ON;
  
  ten_reg ten_reg(
    .clk_i      ( clk_50m    ),
    .arstn_i    ( key[1]     ),
    
    .sw_i       ( sw         ),
    .key_i      ( key[0]     ),
    
    .ledr_o     ( led_reg    )
  );
  
  counter counter(
    .clk_i      ( clk_50m    ),
    .arstn_i    ( key[1]     ),
    
    .key_i      ( key[0]     ),
    .sw_i       ( sw[9:0]    ),
    
    .counter_o  ( count[7:0] )
    );
  
  decoder_hex decoder_0(
    .arstn_i    ( key[1]     ),
    
    .kod_i      ( count[3:0] ),
    
    .hex_o      ( dec[6:0]   )
  );

  decoder_hex decoder_1(
    .arstn_i    ( key[1]     ),
    
    .kod_i      ( count[7:4] ),
    
    .hex_o      ( dec[13:7]  )
   );

  always @( posedge clk_50m or negedge key[1] ) begin
    if ( !key[1] ) 
      HEX_ON <= 2'b10;
    else begin
      hex_on <= HEX_ON;
      if ( HEX_ON == 2'b10 )begin
        hex[6:0] <= dec[6:0];
        HEX_ON <= 2'b01;
       end
      if ( HEX_ON == 2'b01 )begin
        hex[6:0] <= dec[13:7];
        HEX_ON <= 2'b10;
      end
    end
  end

endmodule
