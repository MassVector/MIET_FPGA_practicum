`timescale 1ns / 1ps

module counter#(
  parameter DATA_WIDTH = 8
  )
  (
  input                       clk_i,
  input                       arstn_i,
  
  input                       key_i,
  input      [9:0]            sw_i,
  
  output reg [DATA_WIDTH-1:0] counter_o
    );
    
   reg sw_event;
   
  always @( posedge clk_i or negedge arstn_i ) begin
    if ( !arstn_i ) 
      counter_o <= {DATA_WIDTH{1'b0}};
    else 
      if( key_i && sw_event ) 
        counter_o <= counter_o + 1;
  end
  
  always @( posedge clk_i or negedge arstn_i ) begin
    if ( !arstn_i )
      sw_event <= 1'b0;
    else 
      if (( sw_i[0] + sw_i[1] + sw_i[2] + sw_i[3] + sw_i[4] + sw_i[5] + sw_i[6] + sw_i[7] + sw_i[8] + sw_i[9]) > 4'd3 )
        sw_event <= 1'b1;
      else 
        sw_event <= 1'b0;
  end
endmodule
