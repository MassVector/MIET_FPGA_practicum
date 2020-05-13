`timescale 1ns / 1ps

module registerrrrr(
  input            clk100_i,
  input            rstn_i ,
  input            in,
  input      [9:0] data_i,
  output reg [9:0] data_o
);

  always@(posedge clk100_i or negedge rstn_i) begin
    if (!rstn_i) 
      data_o <= 0;
    else if (!in) 
      data_o <= (!data_i & (data_i + 1));
  end
  
endmodule
