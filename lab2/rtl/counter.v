`timescale 1ns / 1ps


module counter(
  input         clk100_i,
  input         rstn_i,
  input  [9:0]  sw_i,
  input  [2:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o
);

reg   [7:0] counter;
reg   [9:0] q;
wire        bt_click0;
wire        bt_click1;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
    q       <= 10'b0;
    counter <= 8'd55;
  end
  else begin
    if( bt_click0 ) begin
      q       <= sw_i;
      counter <= counter + 1;
    end
    if (bt_click2 ) begin
      counter <= 8'd0;
    end
  end
end

assign ledr_o = q;

dec_hex dec0(
  .in ( counter[7:4] ),
  .out( hex0_o       )
);

dec_hex dec1(
  .in ( counter[3:0] ),
  .out( hex1_o       )
);

button_deb bt0(
  .btn_i   ( !key_i[0]    ),
  .ondn_o  ( bt_click0    ),
  .rst_i   ( key_i[1]     ),
  .clk_i   ( clk100_i     )
); 

button_deb bt2(
  .btn_i   ( !key_i[2]    ),
  .ondn_o  ( bt_click2    ),
  .rst_i   ( key_i[1]     ),
  .clk_i   ( clk100_i     )
); 
endmodule