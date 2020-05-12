`timescale 1ns / 1ps

module counter(
  input         clk100_i,
  input         rstn_i,
  input  [11:0] sw_i,
  input  [1:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

wire bt_down;
reg [1:0] indc;
reg [7:0] ind_out;
reg [7:0] cnt1;
reg [7:0] cnt2;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
  cnt1 <= 8'h0;
  cnt2 <= 8'h0;
  indc <= 8'b0;
  end
  else begin
    if( bt_down )
    indc <= indc + 1;
  end
end

always @( * ) begin
  if ( indc==3 ) begin
    indc <= 0;
    if( cnt2 < 8'hFF )
      cnt2  <= cnt2 + 1;
    else
      cnt2  <= ~cnt2;
    if( cnt1 != 8'h0 )
      cnt1  <= cnt1 - 1;
    else
      cnt1  <= ~cnt1;
  end
  if( !sw_i[11] )
    ind_out <= cnt1;
  else
    ind_out <= cnt2;
end

reg_to_ledr secmod
( .sw_i       ( sw_i      ),
  .bt_down    ( bt_down   ),
  .rst_i      ( key_i[1]  ),
  .ledr_o     ( ledr_o    ),
  .clk100_i   ( clk100_i  ));

ccccounter thirdmod
( .bt_down    ( bt_down   ),
  .hex1_o     ( hex1_o    ),
  .rst_i      ( key_i[1]  ),
  .hex0_o     ( hex0_o    ),
  .clk100_i   ( clk100_i  ));

button_fix butt0
( .key_i      ( !key_i[0] ),
  .ondn_o     ( bt_down   ),
  .reset_i    ( key_i[1]  ),
  .clk100_i   ( clk100_i  ));

dec_hex ind1
(.in       ( ind_out[7:4] ),
 .out      ( hex0_o       ));

dec_hex ind0
(.in       ( ind_out[3:0] ),
 .out      ( hex1_o       ));

endmodule