module counter (
    input         clk100_i,
    input         rstn_i,
    input  [9:0]  sw_i,
    input  [1:0]  key_i,
    output [9:0]  ledr_o,
    output [6:0]  hex1_o,
    output [6:0]  hex0_o
);

reg  [9:0] data;
reg  [7:0] counter;
wire [1:0] key_pressed;

always @( posedge clk100_i or posedge key_pressed[1] ) begin
  if ( key_pressed[1] ) begin
    data    <= 10'b0;
    counter <= 8'h0;
  end
  else
    if ( key_pressed[0] ) begin
     data    <= sw_i;
     counter <= counter+1;
    end
end

assign ledr_o = data;

debounce key0(
  .btn_i   ( !key_i[0]      ),
  .ondn_o  ( key_pressed[0] ),
  .clk_i   ( clk100_i       )
);

debounce key1(
  .btn_i   ( !key_i[1]      ),
  .ondn_o  ( key_pressed[1] ),
  .clk_i   ( clk100_i       )
);

dec_hex HEX0 (
  .in ( counter [7:4] ),
  .ex ( hex0_o        )
);

dec_hex HEX1 (
  .in ( counter [3:0] ),
  .ex ( hex1_o        )
);

endmodule