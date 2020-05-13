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

//sw_i to led and stuff
reg     [9:0]     ledr = 10'b0000000000;
reg               one = 1'b0;

// magic
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

//num and stuff
reg  [7:0] num;
reg        sw_event = 1; // dont have exersices

always @(posedge clk100_i or negedge key_i[1])
  begin
    if( ~(key_i[1]) ) num <= 0;
    else if ( key_p && sw_event ) num <= num + 1;
  end


  //hex section


  reg   [6:0]  meh0;
  reg   [6:0]  meh1;

  assign hex0_o = meh0;
  assign hex1_o = meh1;

  always @ (*) begin
    case (num[3:0])
      4'h0 : meh0 = 7'b1000000;
      4'h1 : meh0 = 7'b1111001;
      4'h2 : meh0 = 7'b0100100;
      4'h3 : meh0 = 7'b0110000;
      4'h4 : meh0 = 7'b0011001;
      4'h5 : meh0 = 7'b0010010;
      4'h6 : meh0 = 7'b0000010;
      4'h7 : meh0 = 7'b1111000;
      4'h8 : meh0 = 7'b0000000;
      4'h9 : meh0 = 7'b0010000;
      4'ha : meh0 = 7'b0001000;
      4'hb : meh0 = 7'b0000011;
      4'hc : meh0 = 7'b1000110;
      4'hd : meh0 = 7'b0100001;
      4'he : meh0 = 7'b0000110;
      4'hf : meh0 = 7'b0001110;
      default: meh0 = 7'b1010101;
    endcase

    case (num[7:4])
      4'h0 : meh1 = 7'b1000000;
      4'h1 : meh1 = 7'b1111001;
      4'h2 : meh1 = 7'b0100100;
      4'h3 : meh1 = 7'b0110000;
      4'h4 : meh1 = 7'b0011001;
      4'h5 : meh1 = 7'b0010010;
      4'h6 : meh1 = 7'b0000010;
      4'h7 : meh1 = 7'b1111000;
      4'h8 : meh1 = 7'b0000000;
      4'h9 : meh1 = 7'b0010000;
      4'ha : meh1 = 7'b0001000;
      4'hb : meh1 = 7'b0000011;
      4'hc : meh1 = 7'b1000110;
      4'hd : meh1 = 7'b0100001;
      4'he : meh1 = 7'b0000110;
      4'hf : meh1 = 7'b0001110;
      default: meh1 = 7'b1010101;
    endcase
  end


endmodule
