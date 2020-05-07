module counter(
    input clk100_i,
    input rstn_i,
    input [9:0] sw_i,
    input [1:0] key_i,
    output [9:0] ledr_o,
    output [6:0] hex1_o,
    output [6:0] hex0_o
);
reg [9:0] data= 10'b0000000000;
reg [7:0] counter=8'h0;
  always@( posedge clk100_i ) begin
    if( key_i[1] )begin
      data <= 10'b0000000000;
      counter<=8'h0;
      
    end
    else
     if( key_i[0] )begin
      data <= sw_i;
      counter<=counter+1;
    end
    
  end

  assign ledr_o=data;
  
  dec_hex HEX0
( .in(counter[7:4]),
 .EX(hex0_o));
 
dec_hex HEX1
( .in(counter[3:0]),
  .EX(hex1_o));
   
  
  
endmodule