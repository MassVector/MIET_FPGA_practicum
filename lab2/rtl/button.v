`timescale 1ns / 1ps
module button(
  input  in,
  input  clk,
  output button_was_pressed
);
reg [2:0] button_syncroniser;
always @( posedge clk ) begin
    button_syncroniser    <= in;
    button_syncroniser[1] <= button_syncroniser[0]; 
    button_syncroniser[2] <= button_syncroniser[1];
end
assign button_was_pressed = ~button_syncroniser[2] & button_syncroniser[1];
endmodule