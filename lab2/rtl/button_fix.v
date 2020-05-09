`timescale 1ns / 1ps


module button_fix(
  input clk100_i,
  input key_i,
  output reg state_o=0,
  output ondn_o,
  output onup_o);

reg sync_0 = 0, sync_1 = 0;


always @(posedge clk100_i) sync_0 <= key_i;
always @(posedge clk100_i) sync_1 <= sync_0;

reg [1:0] counter = 2'd0;

wire idle = (state_o == sync_1);
wire max  = &counter;

always @(posedge clk100_i)
  begin
    if (idle)
        counter <= 0;
    else
      begin
        counter <= counter + 1;
          if (max)
            state_o <= ~state_o;
     end
  end

assign ondn_o = ~idle & max & ~state_o;
assign onup_o = ~idle & max & state_o;

endmodule