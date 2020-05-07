module counter(
    input clk_i,
    input [9:0] sw_i,
    input [1:0] key_i,
    output [9:0] ledr_o
    //output [6:0] hex1_o,
    //output [6:0] hex0_o
);

  reg [9:0] rg10;
 
     
  always@ ( posedge clk_i or negedge key_i[1] ) begin
  
    if ( !key_i[1] )
    begin
      rg10 <= {10{1'b0}};
    end
    else if ( key_i[0] )
    begin
      rg10 [9:0] <= sw_i [9:0];
    end
  end  
  
  assign  ledr_o [9:0] =  rg10 [9:0]; 

endmodule