`timescale 1ns / 1ps

module module_counter #(
parameter DATA_WIDTH = 8
)
(
  input                       clk_i,       
  input                       en_i,        
  input                       arst_i,
  
  output [ DATA_WIDTH - 1:0 ] data_o  
);
reg      [ DATA_WIDTH-1:0 ]   data;


always @( negedge arst_i) begin
  data <= { DATA_WIDTH { 1'b0 } };
end
 always @( negedge en_i) begin
  data <= data + 1;
end

assign data_o = data;

endmodule
