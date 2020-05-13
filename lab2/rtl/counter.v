`timescale 1ns / 1ps

module counter(
  input            clk100_i,
  input            rstn_i,
  input      [9:0] sw_i,
  input      [1:0] key_i,
  
  output     [9:0] ledr_o,
  output reg [6:0] hex0_o,
  output reg [6:0] hex1_o
  );
  
  wire btn_was_pressed;
  
  keypress kp(
    .clk_i             ( clk100_i            ),
    .rstn_i            ( key_i           [1] ),
    .en_i              ( key_i           [0] ),
    .btn_was_pressed_o ( btn_was_pressed     ) 
  );
 
  register r(
    .data_i          ( sw_i            [9:0] ),
    .clk_i           ( clk100_i              ),
    .rstn_i          ( key_i           [1]   ),
    .en_i            ( key_i           [0]   ), 
    .data_o          ( ledr_o          [9:0] ),
    .btn_was_pressed ( btn_was_pressed       )
  );
  
  reg [9:0] counter;
 
  always @( posedge clk100_i or negedge key_i[1] )begin
    if( !key_i[1] ) 
      counter <= 0;
    else if( btn_was_pressed ) 
      counter <= counter + 1;
  end
            
  always @( * ) begin
    case( counter [3:0] )
      4'd0:   hex0_o = 7'b100_0000;
      4'd1:   hex0_o = 7'b111_1001;
      4'd2:   hex0_o = 7'b010_0100;
      4'd3:   hex0_o = 7'b011_0000;
      4'd4:   hex0_o = 7'b001_1001;
      4'd5:   hex0_o = 7'b001_0010;
      4'd6:   hex0_o = 7'b000_0010;
      4'd7:   hex0_o = 7'b111_1000;
      4'd8:   hex0_o = 7'b000_0000;
      4'd9:   hex0_o = 7'b001_0000;
      4'd10:  hex0_o = 7'b000_1000;
      4'd11:  hex0_o = 7'b000_0011;
      4'd12:  hex0_o = 7'b100_0110;
      4'd13:  hex0_o = 7'b010_0001;
      4'd14:  hex0_o = 7'b000_0110;
      4'd15:  hex0_o = 7'b000_1110; 
    endcase
  end
  
  always @( * ) begin
    case( counter [7:4] )
      4'd0:   hex1_o = 7'b100_0000;
      4'd1:   hex1_o = 7'b111_1001;
      4'd2:   hex1_o = 7'b010_0100;
      4'd3:   hex1_o = 7'b011_0000;
      4'd4:   hex1_o = 7'b001_1001;
      4'd5:   hex1_o = 7'b001_0010;
      4'd6:   hex1_o = 7'b000_0010;
      4'd7:   hex1_o = 7'b111_1000;
      4'd8:   hex1_o = 7'b000_0000;
      4'd9:   hex1_o = 7'b001_0000;
      4'd10:  hex1_o = 7'b000_1000;
      4'd11:  hex1_o = 7'b000_0011;
      4'd12:  hex1_o = 7'b100_0110;
      4'd13:  hex1_o = 7'b010_0001;
      4'd14:  hex1_o = 7'b000_0110;
      4'd15:  hex1_o = 7'b000_1110; 
    endcase
  end  
  
  
endmodule
