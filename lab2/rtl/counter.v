`timescale 1ns / 1ps

module counter(
  input         clk100_i,
  input         rstn_i,
  input  [11:0] sw_i,
  input  [2:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

reg  [7:0] counter;
reg  [7:0] counter1;
reg  [9:0] q;

wire bt0_down;
wire bt2_down;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
    q        <= 10'b0;
    counter  <= 8'h0;
    counter1 <= 8'h0;
  end
  else begin
    if( bt_down0 ) begin
      q <= sw_i[9:0];
      if( counter < 8'hFF )
        counter <= counter + 1;
      else
        counter <= ~counter;
      if( counter1 != 8'h0 )
        counter1 <= counter1 - 1;
      else
        counter1 <= ~counter1;
    end
    if( bt_down2 ) begin
      counter  <= 8'h0;
      counter1 <= 8'h0;
    end
  end
end

reg  [7:0] switch;
always @( * ) begin
  if( sw_i[11] )
    switch <= counter1;
  else
    switch <= counter;
end

assign ledr_o = q;

dec_hex dec1(
  .in ( switch[7:4] ),
  .out( hex1_o      )
);

dec_hex dec0(
  .in ( switch[3:0] ),
  .out( hex0_o      )
);

button_debounce bt0(
  .btn_i   ( !key_i[0]  ),
  .ondn_o  ( bt_down0   ),
  .rst_i   ( key_i[1]   ),
  .clk_i   ( clk100_i   )
);

button_debounce bt2(
  .btn_i   ( !key_i[2]  ),
  .ondn_o  ( bt_down2   ),
  .rst_i   ( key_i[1]   ),
  .clk_i   ( clk100_i   )
);

endmodule