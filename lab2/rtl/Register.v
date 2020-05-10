`timescale 1ns / 1ps

module register(
  input   [9:0]  data_i,             
  input          clk_i,           
  input          rstn_i,           
  input          en_i,
  input          btn_was_pressed,  
    
  output  [9:0]  register_o       
  );
  
  reg [9:0] data;
  reg [2:0] btn_sync;
  
  always @( posedge clk_i or negedge rstn_i ) begin
    if ( !rstn_i )
      btn_sync <= 3'b0;
    else  
      btn_sync[0] <= ~en_i;
      btn_sync[1] <= btn_sync[0];
      btn_sync[2] <= btn_sync[1];
  end
  
  assign btn_was_pressed = ~btn_sync[2] & btn_sync[1];
  
  always @( posedge clk_i or negedge rstn_i ) begin
    if ( !rstn_i ) 
      data <= 0;
    else if ( btn_was_pressed ) 
      data <= data_i;
  end 
  
  assign register_o = data;
  
endmodule