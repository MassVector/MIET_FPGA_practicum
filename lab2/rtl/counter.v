`timescale 1ns / 1ps


module counter(
    input clk100_i,
    input rstn_i,
    input [9:0] sw_i,
    input [1:0] key_i,
    output [9:0] ledr_o,
    output [6:0] hex1_o,
    output [6:0] hex0_o
);


reg  [2:0]  sync;
wire        key_p;

always @( posedge clk100_i or negedge key_i[1])
  begin
    if( ~key_i[1])
      sync <= 3'b0;
    else
    sync[0] <= ~key_i[0];
    sync[1] <= sync[0];
    sync[2] <= sync[1];
  end

assign key_p = ~sync[2] & sync[1];

//se to led and stuff
reg     [9:0]     ledr = 10'b0000000000;
reg               one = 1'b0;

// dont work coz i dont know
assign ledr_o = ledr;

reg   [3:0] i = 4'b0 ;


always @( posedge clk100_i or posedge key_i[1] )
  begin
    if ( ~(key_i[1]) ) ledr <= 0;
    else if ( key_p )
      begin
      ledr <= sw_i;
      end
end

//counter and stuff
reg  [7:0] counter;
reg        sw_event = 1; // dont have exersices

always @(posedge clk100_i or negedge key_i[1])
  begin
    if( ~(key_i[1]) ) counter <= 0;
    else if ( key_p && sw_event ) counter <= counter + 1;
  end

reg   [3:0]  show;
reg   [6:0]  hex;
reg   [6:0]  meh0;
reg   [6:0]  meh1;

assign hex0_o = meh0;
assign hex1_o = meh1;

//switching display
always @( posedge clk100_i ) begin
  show <= counter[3:0];
  meh0 <= hex;

end
// such lot of extra variables coz code was written for Artix PLD
always @( negedge clk100_i ) begin
  show <= counter[7:4];
  meh1 <= hex;
end

reg     [6:0]  hex;
//assign hex_o = hex;

always @ (*) begin
  case (show)
    4'h0 : hex = 7'b1000000;
    4'h1 : hex = 7'b1111001;
    4'h2 : hex = 7'b0100100;
    4'h3 : hex = 7'b0110000;
    4'h4 : hex = 7'b0011001;
    4'h5 : hex = 7'b0010010;
    4'h6 : hex = 7'b0000010;
    4'h7 : hex = 7'b1111000;
    4'h8 : hex = 7'b0010000;
    4'h9 : hex = 7'b0010000;
    4'ha : hex = 7'b0001000;
    4'hb : hex = 7'b0000011;
    4'hc : hex = 7'b1000110;
    4'hd : hex = 7'b0100001;
    4'he : hex = 7'b0000110;
    4'hf : hex = 7'b0001110;
    default: hex = 7'b1010101;
  endcase
end


endmodule
