`timescale 1ns / 1ps


module main(
    input            clk_i,
    input            arstn_i,
    input            en_i,

    input    [9:0]   sw_i,
    input            key_i,

    output   [9:0]   led_o,
    output   [6:0]   hex_o

    );
//se to led
reg [9:0] ledr;
assign led_o = ledr;
always @( posedge clk_i or posedge arstn_i )
  begin
    if ( arstn_i ) ledr <= 0;
    else if ( key_i ) ledr <= sw_i;
end


counter2 C (
    .clk_i ( clk_i ),
    .en_i  ( en_i  ),
    .arstn_i (arstn_i ),
    .key_i   ( key_i),
    .hex    ( hex_o )
)  ;



endmodule
