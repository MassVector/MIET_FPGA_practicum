`timescale 1ns / 1ps

module button_debounce(
  input  clk_i,
  input  btn_i,
  output ondn_o);

reg [1:0] sync;

always @( posedge clk_i ) begin
  sync[0] <= btn_i;
  sync[1] <= sync[0];
end

assign ondn_o = ~sync[1] & sync[0];

endmodule