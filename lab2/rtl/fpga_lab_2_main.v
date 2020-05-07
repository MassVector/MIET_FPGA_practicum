`timescale 1ns / 1ps

module fpga_lab_2_main(
    input            clk_i,
    input            rstn_i,
    
    input      [9:0] sw_i,
    input            key_i,
    
    output     [9:0] led_o,
    output     [6:0] hex_o,
    output reg [1:0] hex_on_o
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
always @( posedge clk_i or posedge rstn_i ) 
  begin
    if ( rstn_i == 1'b0 ) register <= 10'd0;
    else if ( key_was_pressed ) register <= sw_i;
  end

// hex counter logic
reg [7:0] counter;
always @( posedge clk_i or posedge rstn_i ) 
  begin
    if ( rstn_i == 0 ) counter <= 8'd0;
    else if ( key_was_pressed && ( sw_i > 10'd500 ) )
        counter = counter + 1;
  end

reg [3:0] hex_reg;
hex_decoder dec ( 
  .data_i( hex_reg ),
  .data_o( hex_o )
  );

// hex display switcher 
reg anode_counter;
always @( posedge clk_i or posedge rstn_i )
  begin
    if ( rstn_i == 0 ) 
      anode_counter <= 1'b0;
    else
      anode_counter <= anode_counter + 1'b1;
  end
always @( * ) 
  begin
    if ( anode_counter )
      begin
        hex_on_o <= 2'b01;
        hex_reg <= counter[7:4];
      end
    else
      begin
        hex_on_o <= 2'b10;
        hex_reg <= counter[3:0];
      end
  end

endmodule
