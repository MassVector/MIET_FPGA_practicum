`timescale 1ns / 1ps
module counter_tb(
);
localparam CLK_FREQ_MHZ   = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ) / 2;     

reg  [9:0]    sw_i;
wire [9:0]    ledr_o;
wire [2:0]    key_i;
reg           clk100_i;
wire [6:0]    hex1_o;
wire [6:0]    hex0_o;
  
counter DUT (
  .sw_i     ( sw_i    ),
  .ledr_o   ( ledr_o  ),
  .clk100_i ( clk100_i),
  .key_i    ( key_i   ),
  .hex1_o   ( hex1_o  ),
  .hex0_o   ( hex0_o  )
);

reg [2:0] sw = 3'b111;

//assign key_i[1] = 1;
//assign key_i[0] = 1;
//assign key_i[0] = $random();

initial begin
  clk100_i = 1'b1;
  forever begin
    #CLK_SEMIPERIOD clk100_i =~ clk100_i;
    //sw_i[11:10] = $random();
  end
end

initial begin
  sw_i[9:0] = 10'd1;
  //repeat(16)begin
  forever begin
    #(CLK_SEMIPERIOD - 1);
    sw_i[9:0] = $random();
  end
end

initial begin
  repeat(16)
  begin
    //sw[1] = 1;
    sw[2]   = 1;
    #50;
    sw[1:0] = $random();
    #50;
    sw[0]   = 0;
  end
end

assign key_i = sw;

endmodule