`timescale 1ns / 1ps
module counter#(
  parameter DATA_WIDTH = 8
  )
 (
  input         clk100_i,
  input         rstn_i,
  input  [10:0] sw_i,
  input  [1:0]  key_i,
  output [9:0]  ledr_o, 
  output [6:0]  hex1_o,
  output [6:0]  hex0_o
  );
  
  reg  [7:0] counter_i;
  reg  [2:0] counter_ind;
  
  wire        but_done;
  wire bwp;
  
Debounce deb(
  .clk100_i   ( clk100_i ),
  .rstn_i     ( key_i[1] ),
  .en_i       ( !key_i[0] ),
  .en_down_o  ( bwp ) 
  );


always @( posedge clk100_i or negedge key_i[1] ) begin //negedge 0 to 1
  if ( !key_i[1] ) begin
     counter_i <= {DATA_WIDTH{1'b0}};
  end
  else
      if( but_done ) begin
        if( sw_i[10] == 1 ) begin
          counter_i <= counter_i + 1;
        end
        else begin
              counter_i <= counter_i - 1;
        end
      end
end
  
  
always @( posedge clk100_i or negedge key_i[1] ) begin //negedge 0 to 1
  if ( !key_i[1] ) begin
    counter_ind <= 0;
  end
  else begin
      if( bwp ) begin
        counter_ind <= counter_ind + 1;
      end
      else if( counter_ind == 3 ) begin 
          counter_ind <= 0;
      end
  end
end

assign but_done = ( counter_ind == 3 );

  REG_TEN reg_ten(
  .clk100_i   ( clk100_i     ),
  .rstn_i     ( key_i    [1] ),
  .sw_i       ( sw_i         ),
  .key_i      ( bwp          ),
  .led_o      ( ledr_o       )
  );
  
  decoder_hex decoder_0(
  .kod_i  ( counter_i   [3:0] ),
  .hex_o  ( hex0_o      [6:0] )
  );  
  
  decoder_hex decoder_1(
  .kod_i  ( counter_i [7:4] ),
  .hex_o  ( hex1_o    [6:0] )
  );  
  
     
endmodule