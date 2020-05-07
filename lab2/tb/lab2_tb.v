`timescale 1ns / 1ps

module lab2_tb(
    );
    
<<<<<<< Updated upstream
localparam CLK_FREQ_MHZ = 50;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ ) /2;
    
reg        clk100_i;
reg  [9:0] data_i;
reg  [1:0] key_i;
=======
localparam CLK_FREQ_MHZ = 100;
localparam CLK_SEMIPERIOD = ( 1000 / CLK_FREQ_MHZ ) /2;
    
reg        clk100_i;
reg  [9:0]  data_i;
reg  [1:0]  key_i;
>>>>>>> Stashed changes
wire [9:0] ledr_o;
wire [6:0] hex0; 
wire [6:0] hex1; 

main DUT(
  .clk50_i ( clk100_i ),
  .key_i   ( key_i ),
  .sw_i    ( data_i ),
  .ledr_o  ( ledr_o ),
  .hex0_o  ( hex0 ),
  .hex1_o  ( hex1 )
);

//Clock gen
initial begin
  clk100_i = 1'b1;
  forever begin
    #CLK_SEMIPERIOD clk100_i = ~clk100_i;
  end
end
    

 
<<<<<<< Updated upstream
 //Signals gen
 initial begin
   forever begin
     #(2*CLK_SEMIPERIOD);
     data_i = $random();
   end
=======
//Signals gen
initial begin
  forever begin
     #(2*CLK_SEMIPERIOD);
     data_i = $random();
  end
>>>>>>> Stashed changes
end

//key_i gen
initial begin
#(5*CLK_SEMIPERIOD);
key_i[0] = 1'b0;
key_i[1] = 1'b1;
#(15*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
key_i[1] = ~key_i[1];
#(15*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
key_i[1] = ~key_i[1];
#(15*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
key_i[1] = ~key_i[1];
<<<<<<< Updated upstream
#(15*CLK_SEMIPERIOD);
key_i[0] = 1'b0;
key_i[1] = 1'b0;
#(18*CLK_SEMIPERIOD);
key_i[0] = 1'b0;
key_i[1] = 1'b1;
#(15*CLK_SEMIPERIOD);
key_i[0] = ~key_i[0];
key_i[1] = ~key_i[1];
=======
>>>>>>> Stashed changes



end
endmodule
