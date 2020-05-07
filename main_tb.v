`timescale 1ns/1ps
module dev_tb(
);

localparam CLK_FREQ = 50;
localparam CLK_SEMIPERIOD = (1000/CLK_FREQ)/2;     

reg [9:0] SW_i;
wire [9:0] LEDR_o;
reg KEY_i;
reg RST_i;
reg CLK_i;
wire [6:0] HEX_o;
wire [1:0] HEX_on_o;

dev DUT (.CLK_i(CLK_i),.RST_i(RST_i),.KEY_i(KEY_i),.SW_i(SW_i),.LEDR_o(LEDR_o),.HEX_o(HEX_o),.HEX_on_o(HEX_on_o));
//-----------------------
initial begin
    CLK_i = 1'b1;
    forever begin
      #CLK_SEMIPERIOD CLK_i=~CLK_i;
    end
end
//-----------------------
initial begin
    SW_i [9:0] = 10'b0;
    KEY_i = 1'b0;
repeat(40)begin
    #(CLK_SEMIPERIOD - 1);
    SW_i[9:0] = $random();
    #(3*CLK_SEMIPERIOD);
    KEY_i = 1'b1;
    #(3*CLK_SEMIPERIOD);
    KEY_i = 1'b0;
end
end
//-----------------------
initial begin
    RST_i = 1'b0;
    #20 RST_i = 1'b1;
    #40 RST_i = 1'b0;
end  

endmodule