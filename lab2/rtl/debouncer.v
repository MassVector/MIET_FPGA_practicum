`timescale 1ns / 1ps



module debouncer(
  input en_i,
  input rstn_i,
  input clk_i,
  
  output synced_signal_o
  );
    
reg [1:0] button_syncroniser;

always @( posedge clk_i or negedge rstn_i ) begin
  if ( !rstn_i )
    button_syncroniser <= 2'b0;
  else begin
    button_syncroniser[0] <= ~en_i;
    button_syncroniser[1] <= button_syncroniser[0];
  end
end

assign synced_signal_o = ~button_syncroniser[1] & button_syncroniser[0];

endmodule
