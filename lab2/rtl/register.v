`timescale 1ns / 1ps

module register(
         // Clock input
         input            clk_i,
         
         // KEY0, KEY1 (async reset) and SW inputs
         input            key0_i,
         input            key1_i,
         input      [9:0] sw_i,
         
         // Register data output
         output reg [9:0] register_o
       );

always@(posedge clk_i or posedge key1_i) begin
  if (key0_i)
    register_o <= sw_i;
  if (key1_i)
    register_o <= 0;
end
endmodule
