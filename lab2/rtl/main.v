`timescale 1ns / 1ps
module main(
  input        btn_i,
  input        clk_i,
  input        rstn_i,
  input  [9:0] sw,
  output [9:0] led_o,
  output [6:0] hex,
  output [1:0] hex_on
  );
  
  wire key;
  reg [2:0] btn_sync;
  reg [9:0] led;
  reg [7:0] counter;
  reg [6:0] out;
  reg [1:0] hex_on;
  reg       counter_for_second_hex; //Ќужен дл€ того, чтобы все значени€ отображались на hex_on[0] и hex_on[1]
  
  assign hex = out;
  assign led_o = led;
  assign key = ~btn_sync[2] & btn_sync[1];
  
  always @( posedge clk_i )
    begin 
      btn_sync[0] <= btn_i;
      btn_sync[1] <= btn_sync[0];
      btn_sync[2] <= btn_sync[1];
    end
    
  
  always @( posedge clk_i or posedge rstn_i )
    begin
      if ( rstn_i == 1'b0 )
        led <= 10'd0;
      else if ( key )
        led <= sw;
    end
    
  always @( posedge clk_i or posedge rstn_i )
    begin
      if ( rstn_i == 0 )
        counter <= 8'd0;
      else if ( key )
        counter = counter + 1;
    end
                
  always @(posedge clk_i or posedge rstn_i ) 
    begin
        if ( rstn_i == 0 )
            counter_for_second_hex <= 0;
        else
            counter_for_second_hex = counter_for_second_hex + 1;
    end
    
  always @( * )
    begin
      if (counter_for_second_hex)
        begin
          hex_on = 2'b10;
          case ( counter[7:4] )
            4'h0:    out = 7'b1000000;
            4'h1:    out = 7'b1111001;
            4'h2:    out = 7'b0100100;
            4'h3:    out = 7'b0110000;
            4'h4:    out = 7'b0011001;
            4'h5:    out = 7'b0010010;
            4'h6:    out = 7'b0000010;
            4'h7:    out = 7'b1111000;
            4'h8:    out = 7'b0000000;
            4'h9:    out = 7'b0010000;
            4'ha:    out = 7'b0001000;
            4'hb:    out = 7'b0000011;
            4'hc:    out = 7'b1000110;
            4'hd:    out = 7'b0100001;
            4'he:    out = 7'b0000110;
            4'hf:    out = 7'b0001110;
            default: out = 7'b1111111;
          endcase
        end
      else begin
          hex_on <= 2'b01;
          case ( counter[3:0] )
            4'h0:    out <= 7'b1000000;
            4'h1:    out <= 7'b1111001;
            4'h2:    out <= 7'b0100100;
            4'h3:    out <= 7'b0110000;
            4'h4:    out <= 7'b0011001;
            4'h5:    out <= 7'b0010010;
            4'h6:    out <= 7'b0000010;
            4'h7:    out <= 7'b1111000;
            4'h8:    out <= 7'b0000000;
            4'h9:    out <= 7'b0010000;
            4'ha:    out <= 7'b0001000;
            4'hb:    out <= 7'b0000011;
            4'hc:    out <= 7'b1000110;
            4'hd:    out <= 7'b0100001;
            4'he:    out <= 7'b0000110;
            4'hf:    out <= 7'b0001110;
            default: out <= 7'b1111111;
        endcase
      end
    end
endmodule
