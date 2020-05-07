`timescale 1ns / 1ps

module fpga_lab_2_main_tb();

parameter SEMI_PERIOD_CLK = 5;

reg        t_clk;
reg        t_reset;
reg  [9:0] t_sw;
reg        t_key;

wire [6:0] t_hex0;
wire [6:0] t_hex1;
wire [9:0] t_led;

fpga_lab_2_main DUT(
    .clk   ( t_clk   ),
    .reset ( t_reset ),
    .sw_i  ( t_sw    ),
    .key   ( t_key   ),
    
    .hex0  ( t_hex0  ),
    .hex1  ( t_hex1  ),
    .led_o ( t_led   )
    );
    
initial begin
    t_clk = 1'b0;
    forever begin
        #SEMI_PERIOD_CLK t_clk = ~t_clk;
    end
end

initial begin
    t_reset = 1'b1;
    #(4*SEMI_PERIOD_CLK);
    t_reset = 1'b0;
end

initial begin
    t_key = 1'b0;
    t_sw = 1'b0;
    repeat(1024) begin
        #100;
      //  t_sw = $random();
        t_sw = t_sw + 1;
        #100;
        t_key = 1'b1;
        #100;
        t_key = 1'b0;
    end
end
 
endmodule
