`timescale 1ns / 1ps


module counter_logic(
  input            clk_i,
  input            rstn_i,
  input      [9:0] sw_i,
  input            oper_i,
  input            btn_is_pressed_i,

  output reg [7:0] counter_o
  );
    
 

always @( posedge clk_i or negedge rstn_i ) begin
  if ( !rstn_i ) 
    counter_o <= 0; 
  else if ( btn_is_pressed_i ) begin 
    if ( oper_i )
      counter_o <= counter_o + 1;
    else 
      counter_o <= counter_o - 1;
  end
end

endmodule



