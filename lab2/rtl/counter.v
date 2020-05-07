`timescale 1ns / 1ps

module counter(
    input            clk50_i,       
    input            en_i,        
    input            arst_i,
    input            sw_event_i,       
    output reg [7:0] counter_o    
    );
    
    always @(posedge clk50_i or posedge arst_i) begin
        if (arst_i) counter_o <= 0;
        else if (en_i && sw_event_i) counter_o <= counter_o + 1;
    end
    
endmodule
