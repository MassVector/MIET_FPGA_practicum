`timescale 1ns / 1ps

module counter(
  input        clk100_i,
  input        rstn_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
  );
    
  reg [7:0] cntr = 8'd0;  
  wire bt_down;
  
  pressed btdown(
    .bt_i     (!key_i[0]),
    .rst_i    (key_i[1]),
    .clk100_i (clk100_i),
    .btnd_o   (bt_down)
    );

  register reg_01( 
    .in        (key_i [0]),
    .rstn_i    (key_i [1]),
    .clk100_i  (clk100_i),
    .data_i    (sw_i   [9:0]),
    .data_o    (ledr_o [9:0])
); 
 
  always @(posedge clk100_i or negedge key_i[1]) begin         
    if (!key_i[1]) begin
         cntr <= 8'd55;
    end
    else
      if (bt_down) begin
         cntr <= cntr + 1;
    end
  end
  
  dectohex dec0
    ( .dec(cntr[7:4]),
      .hex(hex0_o)
    );
    
  dectohex dec1
    ( .dec(cntr[3:0]),
      .hex(hex1_o)
    );
    
endmodule
