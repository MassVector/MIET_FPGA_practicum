`timescale 1ns / 1ps

module counter(
  input         clk100_i,
  input         rstn_i,
  input  [11:0] sw_i,
  input  [1:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

reg  [9:0] sw_event;

reg  [7:0] counter_increment;    
reg  [7:0] counter_decrement;

wire bt_down;

key_debouncer bt(
  .btn_i   ( !key_i[0] ),
  .rst_i   ( key_i[1]  ),
  .ondn_o  ( bt_down   ),
  .clk_i   ( clk100_i  )
);

always @( posedge clk100_i or negedge key_i[1] ) begin
  if  ( !key_i[1] ) begin
    sw_event           <= 10'b0;
    counter_increment  <= 8'h0;
    counter_decrement  <= 8'h0; 
  end
  else begin
    if ( bt_down ) begin
      sw_event          <= ~sw_i[9:0] & ( sw_i[9:0] + 1 );
      counter_increment <= counter_increment + 1;
      counter_decrement <= counter_decrement - 1;
    end
  end
end

wire  [7:0] switch;
assign switch = ( sw_i[11] == 0 ) ? ( counter_increment ):
                                    ( counter_decrement );

assign ledr_o = sw_event;

dec_hex dec0(
  .in   ( switch[3:0] ),
  .out  ( hex0_o      )
);

dec_hex dec1(
  .in   ( switch[7:4] ),
  .out  ( hex1_o      )
);

endmodule