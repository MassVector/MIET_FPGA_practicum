`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 14:40:35
// Design Name: 
// Module Name: counter_tb
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


module counter_tb(

    );

    reg            clk50_i;      
    reg            en_i;        
    reg            arst_i;
    reg            sw_event_i;
    wire   [7:0]   counter_o;

    counter DUT (
        .clk50_i    (clk50_i),
        .en_i       (en_i),
        .arst_i     (arst_i),
        .sw_event_i (sw_event_i),
        .counter_o  (counter_o)
    );

    initial begin
        en_i       = 1'b0;
        arst_i     = 1'b1;
        sw_event_i = 1'b0;
        #20
        arst_i = 1'b0;
        #45
        en_i    = 1'b1;
        #20
        en_i    = 1'b0;
        #50
        sw_event_i = 1'b1;
        #10
        en_i = 1'b1;
        #20
        en_i = 1'b0;
        #50
        arst_i = 1'b1;
    end


    always begin 
        clk50_i = 1'b1;
        #10;
        clk50_i = 1'b0;
        #10;
    end
endmodule
