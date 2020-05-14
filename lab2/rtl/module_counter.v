`timescale 1ns / 1ps

module module_counter #(
parameter DATA_WIDTH = 8
)
(
  input                       clk_i,       
  input                       en_i,        
  input                       arst_i,
  input                       counter_rst,
  
  output [ DATA_WIDTH - 1:0 ] data_o  
);
reg      [ DATA_WIDTH-1:0 ]   data = 8'b0010_1100;


always @( posedge clk_i or negedge arst_i ) begin
  if ( ~arst_i ) 
    data = 8'b0010_1100;
  else if ( counter_rst )
    data = 8'b0010_1100;
  else if ( en_i )
    data[7:0] = { data[6:0] , data[7] };
end

assign data_o = data;

endmodule
