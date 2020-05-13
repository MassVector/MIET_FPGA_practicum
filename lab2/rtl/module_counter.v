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


always @( posedge clk_i or negedge arst_i) begin
  if ( ~arst_i ) 
    data <= { DATA_WIDTH { 1'b0 } };
  else if ( ~en_i )
    data <= data + 1;
end

assign data_o = data;

endmodule
