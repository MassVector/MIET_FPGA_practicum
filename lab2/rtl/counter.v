`timescale 1ns / 1ps

module counter(
  input         clk100_i,
  input         rstn_i,
  input  [11:0] sw_i,
  input  [1:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

wire       bt_down;
reg  [4:0] indc;
wire [7:0] ind_out;
reg  [7:0] cntdown;
reg  [7:0] cntup;
reg  [9:0] q;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
    cntdown <= 8'h0;
    cntup   <= 8'h0;
    indc    <= 4'b0;
    q       <= 10'b0;
  end
  else
    begin
      if( bt_down ) begin
        if( ( indc + 1 ) == 3 ) begin
          indc    <= 0;
          cntup   <= cntup + 1;
          cntdown <= cntdown - 1;
          q       <= sw_i[9:0];
        end
          else
            indc <= indc + 1;
      end
    end
end

assign ind_out = ( sw_i[11] ) ? ( cntdown ) : ( cntup );
assign ledr_o  = q; 

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