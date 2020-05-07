`timescale 1ns / 1ps

module ten_reg#(
  parameter DATA_WIDTH = 10
  )
  (
  input                       clk_i,
  input                       arstn_i,
  
  input      [DATA_WIDTH-1:0] sw_i,
  input                       key_i,

  output reg [DATA_WIDTH-1:0] ledr_o
    );
    
  always @ ( posedge clk_i or negedge arstn_i ) begin
    if( !arstn_i ) 
      ledr_o<={DATA_WIDTH{1'b0}};
    else 
      if( key_i ) begin
        ledr_o[DATA_WIDTH-1:0] <= sw_i[DATA_WIDTH-1:0];
      end
  end;
  
  

endmodule
