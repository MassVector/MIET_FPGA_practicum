`timescale 1ns / 1ps

module ten_reg#(
  parameter DATA_WIDTH = 10
  )
  (
  input                         clk100_i,
  input                         rstn_i,
  
  input       [DATA_WIDTH-1:0]  sw_i,
  input                         key_i,
  
  output  reg [DATA_WIDTH-1:0]  ledr_o
  );
  
  
always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i )
    ledr_o[DATA_WIDTH-1:0] <= {DATA_WIDTH{1'b0}};
  else 
      if ( key_i )
        ledr_o[DATA_WIDTH-1:0] <= sw_i[DATA_WIDTH-1:0];
  end
  
endmodule