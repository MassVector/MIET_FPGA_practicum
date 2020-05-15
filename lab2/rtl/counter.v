`timescale 1ns / 1ps

module counter (
  input         clk100_i,
  input         rstn_i,
  input  [9:0]  sw_i,
  input  [2:0]  key_i,
  output [9:0]  ledr_o,
  output [6:0]  hex3_o,
  output [6:0]  hex2_o,
  output [6:0]  hex1_o,
  output [6:0]  hex0_o);

reg  [9:0]  data;
reg  [15:0] counter;
wire        key0_pressed;
wire        key2_pressed;
reg         switch;

always @( posedge clk100_i or negedge key_i[1] ) begin
  if( !key_i[1] ) begin
    data    <= 10'b0;
    counter <= 16'h0;
    switch  <= 1'b0;
  end
  else begin
    if( key0_pressed && !key2_pressed )
      switch <= 1'b1;
    if( switch ) begin
      if( key2_pressed && !key0_pressed ) begin
        data    <= sw_i;
        counter <= counter + 1;
        switch  <= 1'b0;
      end
    end
  end
end

assign ledr_o = data;

debounce key0(
  .btn_i   ( !key_i[0]    ),
  .btn_o   ( key0_pressed ),
  .rst_i   ( key_i[1]     ),
  .clk_i   ( clk100_i     )
);

debounce key2(
  .btn_i   ( !key_i[2]    ),
  .btn_o   ( key2_pressed ),
  .rst_i   ( key_i[1]     ),
  .clk_i   ( clk100_i     )
);

dec_hex HEX3 (
  .in ( counter [15:12] ),
  .ex ( hex3_o          )
);

dec_hex HEX2 (
  .in ( counter [11:8] ),
  .ex ( hex2_o         )
);

dec_hex HEX1 (
  .in ( counter [7:4] ),
  .ex ( hex1_o        )
);

dec_hex HEX0 (
  .in ( counter [3:0] ),
  .ex ( hex0_o        )
);

endmodule