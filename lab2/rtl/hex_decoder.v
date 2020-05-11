`timescale 1ns / 1ps

module hex_decoder (
     input      [3:0] data_i,
     output reg [6:0] data_o 
     );

always @( * ) begin
case ( data_i )
  4'h0:    data_o = 7'b1000000;
  4'h1:    data_o = 7'b1111001;
  4'h2:    data_o = 7'b0100100;
  4'h3:    data_o = 7'b0110000;
  4'h4:    data_o = 7'b0011001;
  4'h5:    data_o = 7'b0010010;
  4'h6:    data_o = 7'b0000010;
  4'h7:    data_o = 7'b1111000;
  4'h8:    data_o = 7'b0000000;
  4'h9:    data_o = 7'b0010000;
  4'ha:    data_o = 7'b0001000;
  4'hb:    data_o = 7'b0000011;
  4'hc:    data_o = 7'b1000110;
  4'hd:    data_o = 7'b0100001;
  4'he:    data_o = 7'b0000110;
  4'hf:    data_o = 7'b0001110; 
  default: data_o = 7'b1111111;
endcase
end
endmodule		 
