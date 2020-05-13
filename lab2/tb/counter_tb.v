`timescale 1ns / 1ps

module counter_tb(
    );
    
localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = 1000 / CLK_FREQ_MHZ /2;
    
reg            clk100_i;
reg  [9:0]     data_i;
reg  [1:0]     key_i;
wire [9:0]     ledr_o;
wire [6:0]     hex0; 
wire [6:0]     hex1; 

counter DUT(
  .clk100_i ( clk100_i ),
  .key_i ( key_i ),
  .rstn_i ( key_i[1] ),
  .sw_i ( data_i ),
  .ledr_o ( ledr_o ),
  .hex0_o ( hex0 ),
  .hex1_o ( hex1 )
);

//Clock gen
initial begin
  clk100_i = 1'b1;
  forever begin
    #CLK_SEMIPERIOD clk100_i = ~clk100_i;
    end
end
    

 
  //Signals gen
initial begin
  forever begin
    #(2*CLK_SEMIPERIOD);
    data_i = $random();
    end
end

//key_i gen
initial begin
#(5*CLK_SEMIPERIOD);
key_i[1] = 1'b0;
#(10*CLK_SEMIPERIOD);
key_i[0] = 1'b1;
#(10*CLK_SEMIPERIOD);
key_i[1] = ~key_i[1];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(10*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
#(20*CLK_SEMIPERIOD);
key_i[1] = ~key_i[1];
#(3*CLK_SEMIPERIOD);
key_i[1] = ~key_i[1];
end
endmodule

