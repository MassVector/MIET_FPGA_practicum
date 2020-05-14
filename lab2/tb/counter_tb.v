`timescale 1ns / 1ps

module counter_tb(
);
localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;     

//reg       rstn_i;
reg       clk100_i;
reg [11:0] sw_i;

wire [9:0] ledr_o;
wire [1:0] key_i;
wire [6:0] hex1_o;
wire [6:0] hex0_o;
  
counter DUT (
  .sw_i     ( sw_i    ),
  //.rstn_i   (rstn_i  ),
  .ledr_o   ( ledr_o  ),
  .clk100_i ( clk100_i),
  .key_i    ( key_i   ),
  .hex1_o   ( hex1_o  ),
  .hex0_o   ( hex0_o  )
);

reg [1:0] sw = 2'b11;

initial begin
  clk100_i = 1'b1;
  forever begin
            #CLK_SEMIPERIOD clk100_i=~clk100_i;
          end
end

initial begin
  sw_i[9:0] = 10'd1;
  sw_i[11:10] = 2'b10;
  forever begin
            #50;
            sw_i[9:0] = $random();
            sw_i[11:10] = 2'b00;
          end
        end

initial begin
          repeat(16)
          begin
            #50;
            sw = $random();
            //sw_i[9:0] = 10'b1111111111;
            sw_i[11:10] = 2'b10;
            #50;
            sw = $random();
            //sw_i[9:0] = 10'b0000000000;
            sw_i[11:10] = 2'b00;
          end
        end

assign key_i = sw;

endmodule