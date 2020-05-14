`timescale 1ns / 1ps

module REG_TEN#(
  parameter DATA_WIDTH = 10
  )
  (
  input                         clk100_i,
  input                         rstn_i,
  
  input       [DATA_WIDTH-1:0]  sw_i,
  input                         key_i,
  
  output  reg [DATA_WIDTH-1:0]  led_o
  );
 
always @( posedge clk100_i or negedge rstn_i ) begin
  if ( !rstn_i ) begin
    led_o[DATA_WIDTH-1:0]  <= {DATA_WIDTH{1'b0}};
  end
  else 
      if ( key_i ) begin
        led_o[DATA_WIDTH-1:0] <= ( sw_i & ( -sw_i ) );
      end
end
  
endmodule