module counter(
  input        clk100_i,
  input        rstn_i,
  input  [9:0] sw_i,
  input  [1:0] key_i,
  output [9:0] ledr_o,
  output [6:0] hex1_o,
  output [6:0] hex0_o
  );
  
  wire      key;
  reg [2:0] btn_sync;
  reg [9:0] led;
  reg [7:0] counter_i;
  reg [6:0] out;
  reg [1:0] counter_for_key;
  
  assign hex    = out;
  assign ledr_o = led;
  assign key    = ~btn_sync[2] & btn_sync[1];
  assign rstn_i = key_i[1];
  
  always @( posedge clk100_i )
    begin 
      btn_sync[0] <= ~key_i[0];
      btn_sync[1] <= btn_sync[0];
      btn_sync[2] <= btn_sync[1];
    end
    
  
  always @( posedge clk100_i or posedge rstn_i )
    begin
      if ( rstn_i == 1'b0 )
        led <= 10'd0;
      else if ( counter_for_key == 2'b11 )
        led <= sw_i;
    end
    
  always @( posedge clk100_i or posedge rstn_i )
    begin
      if ( rstn_i == 0 )
        begin
          counter_i <= 8'b0010_1100;
          counter_for_key <= 8'd0;
        end
      else if ( key )
        counter_for_key = counter_for_key + 1;
      else if ( counter_for_key == 2'b11 )
        begin
          counter_i[7:0] <= {counter_i[6:0], counter_i[7]};
          counter_for_key <= 8'd0;
        end
    end
  
  hex hex0
  (
    .hex_i( counter_i[3:0] ),
    .hex_o( hex0_o         )
  );
  
  hex hex1
  (
    .hex_i( counter_i[7:4] ),
    .hex_o( hex1_o         )
  );
  
endmodule