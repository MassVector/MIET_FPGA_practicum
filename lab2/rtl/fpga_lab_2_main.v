`timescale 1ns / 1ps

module fpga_lab_2_main(
    input            clk_i,
    input            rstn_i,
    
    input      [9:0] sw_i,
    input            key_i,
    
    output     [9:0] led_o,
    output     [6:0] hex1_o,
    output     [6:0] hex0_o
    );
    
// synchronize key press
reg [2:0] button_syncroniser;
wire key_was_pressed;

always @( posedge clk_i ) 
  begin
    button_syncroniser[0] <= key_i;
    button_syncroniser[1] <= button_syncroniser[0];
    button_syncroniser[2] <= button_syncroniser[1];
  end
assign key_was_pressed = ~button_syncroniser[2]
& button_syncroniser[1];

// led register logic
reg [9:0] register;
assign led_o = register;
    always @( posedge clk_i or negedge rstn_i ) 
  begin
    if ( ~rstn_i ) 
      register <= 10'd0;
    else if ( key_was_pressed ) 
      register <= sw_i;
  end

// hex counter logic
reg [7:0] counter;
    always @( posedge clk_i or negedge rstn_i ) 
  begin
    if ( ~rstn_i ) 
      counter <= 8'd0;
    else if ( key_was_pressed && ( sw_i > 10'd500 ) )
      counter = counter + 1;
  end

hex_decoder dec1 ( 
  .data_i( counter[7:4] ),
  .data_o( hex1_o       )
  );
  
hex_decoder dec0 ( 
  .data_i( counter[3:0] ),
  .data_o( hex0_o       )
  );

endmodule
