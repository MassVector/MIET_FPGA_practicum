`timescale 1ns / 1ps


module main(
  input               clk_i,
  input               rstn_i, 
  input               btn_i,
  input        [9:0]  sw_i,
  output       [9:0]  led_o,
  output       [6:0]  hex_o,
  output  reg  [1:0]  hex_on_o
    );       

reg  [2:0]     button_sync;
wire      key_pressed_true;

always @( posedge clk_i ) 
  begin
    button_sync[0] <= btn_i;
    button_sync[1] <= button_sync[0];
    button_sync[2] <= button_sync[1];
  end

assign key_pressed_true = ~button_sync[2] & button_sync[1];

reg [9:0] reg_mass;

assign    led_o = reg_mass;

always @( posedge clk_i or posedge rstn_i ) 
  begin
    if ( rstn_i == 1'b0 ) reg_mass <= 10'd0;
    else if ( key_pressed_true ) reg_mass <= sw_i;
  end

reg [7:0] counter;
always @( posedge clk_i or posedge rstn_i ) 
  begin
    if ( rstn_i == 0 ) counter <= 8'd0;
    else if ( key_pressed_true && ( sw_i > 10'd20 ) )
        counter = counter + 1;
  end

reg [3:0] hex_reg;

hex hex
( .in(hex_reg),
  .out(hex_o) 
);

reg hex_counter;

always @(posedge clk_i or posedge rstn_i ) 
    begin
        if ( rstn_i == 0 )
            hex_counter <= 0;
        else
            hex_counter <= hex_counter + 1;
    end

always @( * ) 
    begin
        if ( hex_counter ) begin
            hex_on_o <= 2'b10;
            hex_reg <= counter[7:4];
    end
    else begin
        hex_on_o <= 2'b01;
        hex_reg <= counter[3:0];
    end
end    

endmodule
