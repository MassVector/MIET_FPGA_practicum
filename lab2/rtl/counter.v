`timescale 1ns / 1ps

module counter(

  input         clk100_i,
  input   [9:0] sw_i,
  input   [1:0] key_i,
  
  output  [9:0] ledr_o,
  output  [6:0] hex1_o,
  output  [6:0] hex0_o
  
  
);
  
  reg  [7:0] counter;
  reg  [3:0] hex0;
  reg  [3:0] hex1;
  
  wire       key_pressed;
  wire       key_released;
  
  reg        out_of_range;
  wire       signal;
  
  assign signal = key_released;
  
  always @( posedge clk100_i or negedge key_i[1] ) begin
    if( !key_i[1] ) begin
      counter <= 0;
      hex0 <= 0;
      hex1 <= 0;
      out_of_range <=0;
    end else if( signal ) begin
      if ( counter > 'd99) out_of_range <= 1'b1;
      else begin
       counter <= counter + 1;
       if (hex0 == 'd9) begin 
         hex1 <= hex1 + 1;
         hex0 <= 0;
       end else
         hex0 <= hex0 +1;
      end
      if ( out_of_range ) begin
        hex0 = 'd14;
        hex1 = 'd14;
      end 
    end
  end
  
  
  
debounce d(
  .clk_i        ( clk100_i     ),
  .rst_i        ( !key_i   [1] ),
  .en_i         ( key_i    [0] ),
  .en_down_o    ( key_pressed  ), 
  .en_up_o      ( key_released )
);
  
  
register r(
  .clk_i        ( clk100_i     ),
  .rstn_i       ( !key_i[1]    ),
  .en_i         ( signal       ),
  .data_i       ( sw_i         ),

  .data_o       ( ledr_o       )
);


dec_to_hex dtx0(
  .clk_i  ( clk100_i        ),
  .key_i  ( key_i     [1]   ),
  .data_i ( hex0            ),
  .data_o ( hex0_o          )
);


dec_to_hex dtx1(
  .clk_i  ( clk100_i        ),
  .key_i  ( key_i     [1]   ),
  .data_i ( hex1            ),
  .data_o ( hex1_o          )
);


endmodule
