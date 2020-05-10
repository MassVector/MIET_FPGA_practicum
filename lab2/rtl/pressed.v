`timescale 1ns / 1ps

module pressed(
    input  clk100_i,
    input  rst_i,
    input  bt_i,
    output btnd_o
    );
    
reg [1:0] synch;

always @ (posedge clk100_i or negedge rst_i) begin
    if (!rst_i)
      synch <= 2'b0;
    else
      begin
        synch[0] <= bt_i;
        synch[1] <= synch[0];
      end
    end
    
assign btnd_o = synch[0] & ~synch[0];
    
    
endmodule
