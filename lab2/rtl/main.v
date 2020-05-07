`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2020 18:35:28
// Design Name: 
// Module Name: main
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


module main(
    input       [9:0]   sw_i,
    input       [1:0]   key_i,
    input               clk50_i,
    output      [9:0]   ledr_o,
    output reg  [6:0]   hex_o,
    output reg  [7:0]   hex_on
    );
    
    wire     [7:0]      count_data;
    wire     [9:0]      register_data;
    reg                 sw_event_o;
    
    assign ledr_o = register_data;
    
    counter u1(
        .clk50_i(clk50_i),
        .arst_i(key_i[1]),
        .en_i(key_i[0]),
        .counter_o(count_data[7:0]),
        .sw_event_i(sw_event_o)
    );

    register u2(
        .d_i(sw_i),
        .clk50_i(clk50_i),
        .arst_i(key_i[1]),
        .en_i(key_i[0]),
        .register_o(register_data[9:0])
    );

    always@(*)
    begin
        hex_on <= 8'b1111_1110;  
        case (count_data[3:0])      
              4'd0 : hex_o = 7'b100_0000;
              4'd1 : hex_o = 7'b111_1001;
              4'd2 : hex_o = 7'b010_0100;
              4'd3 : hex_o = 7'b011_0000;
              4'd4 : hex_o = 7'b001_1001;
              4'd5 : hex_o = 7'b001_0010;
              4'd6 : hex_o = 7'b000_0010;
              4'd7 : hex_o = 7'b111_1000;
              4'd8 : hex_o = 7'b000_0000;
              4'd9 : hex_o = 7'b001_0000;
              4'd10 : hex_o = 7'b000_1000;
              4'd11 : hex_o = 7'b000_0011;
              4'd12 : hex_o = 7'b100_0110;
              4'd13 : hex_o = 7'b010_0001;
              4'd14 : hex_o = 7'b000_0110;
              4'd15 : hex_o = 7'b000_1110;
          endcase
        #20 hex_on <= 8'b1111_1101;
        case (count_data[7:4])        
              4'd0 : hex_o = 7'b100_0000;
              4'd1 : hex_o = 7'b111_1001;
              4'd2 : hex_o = 7'b010_0100;
              4'd3 : hex_o = 7'b011_0000;
              4'd4 : hex_o = 7'b001_1001;
              4'd5 : hex_o = 7'b001_0010;
              4'd6 : hex_o = 7'b000_0010;
              4'd7 : hex_o = 7'b111_1000;
              4'd8 : hex_o = 7'b000_0000;
              4'd9 : hex_o = 7'b001_0000;
              4'd10 : hex_o = 7'b000_1000;
              4'd11 : hex_o = 7'b000_0011;
              4'd12 : hex_o = 7'b100_0110;
              4'd13 : hex_o = 7'b010_0001;
              4'd14 : hex_o = 7'b000_0110;
              4'd15 : hex_o = 7'b000_1110;
          endcase
    end

    always@(sw_i) begin
        if ((sw_i[0] + sw_i[1] + sw_i[2] + sw_i[3] + sw_i[4]
        + sw_i[5] + sw_i[6] + sw_i[7] + sw_i[8] + sw_i[9]) > 4'd3)
            sw_event_o <= 1'b1;
        else
            sw_event_o <= 1'b0;
    end

endmodule


