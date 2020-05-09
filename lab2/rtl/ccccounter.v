`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 15:12:05
// Design Name: 
// Module Name: ccccounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ccccounter(
    input        clk100_i,
    input        rstn_i,
    input  [1:0] key_i,
    output [6:0] hex1_o,
    output [6:0] hex0_o
    );
    reg  [7:0] counter = 8'd0 ;

always @ (posedge clk100_i) begin				
    if  ( key_i[1] ) begin //тут прописываем сброс в дефолт
        counter = 8'd0;
    end
    else if ( key_i[0] ) begin //тут увеличиваем counter
            counter = counter +1;
         end
end

dec_hex dec0
( .in(counter[7:4]),
 .OUT(hex0_o));
 
dec_hex dec1
( .in(counter[3:0]),
  .OUT(hex1_o));
  
endmodule
