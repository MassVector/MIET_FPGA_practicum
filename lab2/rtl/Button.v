`timescale 1ns / 1ps

module Button(
  input         clk100_i,
  input         arstn_i,
  input         en_i, 
  output        en_down_o
  );

reg [2:0] sync;

always @( posedge clk100_i ) begin
  sync[0] <= en_i;
  sync[1] <= sync[0];
  sync[2] <= sync[1];
end

assign en_down_o = ~sync[2] & sync[1];


endmodule