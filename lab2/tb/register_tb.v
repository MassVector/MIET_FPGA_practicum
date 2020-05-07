`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 14:17:03
// Design Name: 
// Module Name: register_tb
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


module register_tb(
    );
    
    reg  [9:0]     d_i;         
    reg            clk50_i;           
    reg            arst_i;          
    reg            en_i;           
    wire [9:0]     register_o;  

    register DUT(
        .d_i        (d_i),
        .clk50_i    (clk50_i),
        .arst_i     (arst_i),
        .en_i       (en_i),
        .register_o (register_o)      
    );

    initial begin
        d_i     =   10'b0000000000;
        arst_i  =   1'b0;
        en_i    =   1'b0;
        #45
        d_i     =   10'b0000000111;
        #33
        en_i    =   1'b1;
        #50
        en_i    =   1'b0;
        #50
        arst_i  =   1'b1;
        #50
        arst_i  =   1'b0;
    end


    always begin 
        clk50_i = 1'b1;
        #10;
        clk50_i = 1'b0;
        #10;
    end

endmodule
