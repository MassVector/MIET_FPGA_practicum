`timescale 1ns / 1ps
module counter(
    input         clk100_i,
    input         rstn_i,
    input  [9:0]  sw_i,
    input  [1:0]  key_i, 
    output [9:0]  ledr_o,
    output [6:0]  hex1_o,
    output [6:0]  hex0_o
);
 reg [9:0] save;
 reg [7:0] counter;
 
 wire bwp;
 
 key bt(
  .btn_i      ( !key_i[0] ),
  .rst_i      ( key_i[1]  ),
  .btn_down_o ( bwp       ),
  .clk_i      ( clk100_i  )
);

 always @( posedge clk100_i or negedge key_i[1] ) begin
   if ( !key_i[1] ) begin
     save    <= 10'b0;
     counter <= 8'd0;
   end
   else
     if ( bwp ) begin
       save    <= sw_i;
       counter <= counter + 1;
     end
  end
  
  assign ledr_o = save;
  
  dc_hex dec0
  ( .in(counter[3:0]),
    .out(hex0_o     ));
    
  dc_hex dec1
  ( .in(counter[7:4]),
    .out(hex1_o     ));  
    
endmodule