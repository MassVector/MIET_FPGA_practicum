`timescale 1ns / 1ps


module counter(
  input              clk100_i,
  input              rstn_i,
  input      [10:0]  sw_i,                     
  input      [2:0]   key_i,                    
  
                
  output     [9:0]   ledr_o,                    
  output     [6:0]   hex0_o,                    
  output     [6:0]   hex1_o 
    );

wire [7:0] counter_value; 
wire btn_sync;

debouncer make_it_synced(
  .btn0_i            ( key_i[0] ),
  .btn2_i            ( key_i[2] ),
  .rstn_i            ( key_i[1] ),
  .clk_i             ( clk100_i ),
  .synced_signal_o   ( btn_sync )   
);

counter_logic counter_logic_elem(
  .clk_i            ( clk100_i      ),
  .rstn_i           ( key_i[1]      ),
  .sw_i             ( sw_i[9:0]     ),
  .oper_i           ( sw_i[10]      ),
  .btn_is_pressed_i ( btn_sync      ),
  .counter_o        ( counter_value )
);

reg_10_bit register(
  .data_i           ( sw_i[9:0] ),
  .clk_i            ( clk100_i  ),
  .rstn_i           ( key_i[1]  ),
  .btn_is_pressed_i ( btn_sync  ),
  .register_o       ( ledr_o    )
);

decoder dec0(
  .dec_i ( counter_value [3:0] ),
  .hex_o (  hex0_o             )
);

decoder dec1(
  .dec_i ( counter_value [7:4] ),
  .hex_o ( hex1_o              )
);




endmodule
