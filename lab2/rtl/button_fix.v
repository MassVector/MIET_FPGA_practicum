`timescale 1ns / 1ps


module button_fix(
    input clk100_i,
    input  reset_i,
    input key_i,
    output ondn_o);

reg sync[1:0];

reg counter;

always @( posedge clk100_i or negedge reset_i ) begin
if( !reset_i )
begin
  sync[0] <= 2'b0;
  sync[1] <= 2'b0;
end
  else
  begin
  sync[0] <= key_i;
  sync[1] <= sync[0];
  end
end

assign ondn_o = ~sync[1] & sync[0];

endmodule