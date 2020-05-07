`timescale  1ns / 1ps

module tb_dc;

// dc Inputs
reg   key1_i                               = 0 ;
reg   [3:0]  counter_data_i                = 0 ;

// dc Outputs
wire  [6:0]  hex_o                         ;

dc  u_dc (
      .key1_i                  ( key1_i                ),
      .counter_data_i          ( counter_data_i  [3:0] ),

      .hex_o                   ( hex_o           [6:0] )
    );

initial begin
  #5 counter_data_i[7:0] = 8'h0;
  counter_data_i[9:8] = 2'b11;
  #5 counter_data_i[3:0] = 4'h1;
  #5 counter_data_i[3:0] = 4'h2;
  #5 counter_data_i[3:0] = 4'h3;
  #5 counter_data_i[3:0] = 4'h4;
  #5 counter_data_i[3:0] = 4'h5;
  #5 counter_data_i[3:0] = 4'h6;
  #5 counter_data_i[3:0] = 4'h7;
  #5 counter_data_i[3:0] = 4'h8;
  #5 counter_data_i[3:0] = 4'h9;
  #5 counter_data_i[3:0] = 4'hA;
  #5 counter_data_i[3:0] = 4'hB;
  #5 counter_data_i[3:0] = 4'hC;
  #5 counter_data_i[3:0] = 4'hD;
  #5 counter_data_i[3:0] = 4'hE;
  #5 counter_data_i[3:0] = 4'hF;
  $finish;
end

endmodule
