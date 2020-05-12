`timescale 1ns / 1ps



module key_pres(
input         clk100_i,
input         rstn_i,
input         ev_i, 

output        ev_o
    );
    
reg [1:0] key_check;

always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i )
    key_check <= 2'b0;
  else
   begin
      key_check[0] <= ev_i;
      key_check[1] <= key_check[0];
    end
end

assign ev_o = ~key_check[1] & key_check[0];
endmodule

