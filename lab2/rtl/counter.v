`timescale 1ns / 1ps

module counter(
         // Clock input
         input            clk_i,
         
         // KEY0, KEY1 (async reset) and SW event inputs
         input            key0_i,
         input            key1_i,
         input            sw_event_i,

         // Counter data output
         output reg [7:0] counter_o
       );

always@(posedge clk_i or posedge key1_i) begin
  if (key0_i && sw_event_i)
    counter_o <= counter_o + 1;
  if (key1_i)
    counter_o <= 0;
end
endmodule
