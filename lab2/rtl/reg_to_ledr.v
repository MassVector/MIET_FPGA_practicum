`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 14:02:46
// Design Name: 
// Module Name: reg_to_ledr
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


module reg_to_ledr(
    input        clk100_i,
    input        rstn_i,
    input  [9:0] sw_i,
    input  [1:0] key_i,
    output [9:0] ledr_o
    );
reg  [9:0] q = 10'b0;

always @ (posedge clk100_i) begin				
    if  ( key_i[1] ) begin //тут прописываем сброс в дефолт
        q = 10'b0;
    end
    else if ( key_i[0] ) begin //тут записываем данные с SW
            q = sw_i;
         end
end

assign ledr_o = q;

endmodule
