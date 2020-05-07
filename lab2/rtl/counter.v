`timescale 1ns / 1ps

module counter(
  input        clk_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
  );
    
  reg [9:0] register = 10'b0;
  reg [7:0] counter = 8'd0;
  
  always @(posedge clk_i) begin
  
    if (key_i[0]) begin
        register = sw_i;
        counter = counter + 1;
    end
    
    if (key_i[1]) begin
        register = 10'b0;
        counter = 8'd0;
    end
    
  end
    
  assign ledr_o = register;
  
  dectohex dec0
    ( .dec(counter[7:4]),
      .hex(hex0_o)
    );
    
  dectohex dec1
    ( .dec(counter[3:0]),
      .hex(hex1_o)
    );
    
endmodule
