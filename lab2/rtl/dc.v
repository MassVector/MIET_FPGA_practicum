`timescale 1ns / 1ps

module dc(
         // KEY1 (async reset) and counter data input
         input            key1_i,
         input      [3:0] counter_data_i,

         // HEX output
         output reg [6:0] hex_o
       );

always@(*) begin
  case (counter_data_i[3:0])
    0  : hex_o = 7'b1000000;
    1  : hex_o = 7'b1111001;
    2  : hex_o = 7'b0100100;
    3  : hex_o = 7'b0110000;
    4  : hex_o = 7'b0011001;
    5  : hex_o = 7'b0010010;
    6  : hex_o = 7'b0000010;
    7  : hex_o = 7'b1111000;
    8  : hex_o = 7'b0000000;
    9  : hex_o = 7'b0010000;
    10 : hex_o = 7'b0001000;
    11 : hex_o = 7'b0000011;
    12 : hex_o = 7'b1000110;
    13 : hex_o = 7'b0100001;
    14 : hex_o = 7'b0000110;
    15 : hex_o = 7'b0001110;
  endcase
end

always@(posedge key1_i) begin
  if (key1_i)
    hex_o <= 0;
end
endmodule
