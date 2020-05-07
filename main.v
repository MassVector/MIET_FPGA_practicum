`timescale 1ns/1ps
module dev(
  input CLK_i,
  input RST_i, 
  input KEY_i,
  input [9:0] SW_i,
  output [9:0] LEDR_o,
  output [6:0] HEX_o,
  output reg [1:0] HEX_on_o
    );       

//-----------------------
reg  [2:0] button_sync;
wire key_press;

always @(posedge CLK_i) 
  begin
    button_sync[0] <= KEY_i;
    button_sync[1] <= button_sync[0];
    button_sync[2] <= button_sync[1];
  end

assign key_press = ~button_sync[2] & button_sync[1];

//-----------------------
reg [7:0] counter;
always @(posedge CLK_i or posedge RST_i) 
  begin
    if (RST_i == 1) counter <= 8'd0;
    else if (key_press && (SW_i > 10'd20))
        counter = counter + 1;
  end
  
//-----------------------
reg [9:0] register;
assign LEDR_o = register;

always @(posedge CLK_i or posedge RST_i) begin
  if (RST_i == 1'b1)
    register <= 10'd0;
  else if (key_press) 
    register <= SW_i;
end

//-----------------------
reg [3:0] HEX_reg;
hex hex (.in(HEX_reg), .out(HEX_o));

reg hex_counter;
always @(posedge CLK_i or posedge RST_i) begin
  if (RST_i == 1)
    hex_counter <= 0;
  else
    hex_counter <= hex_counter + 1;
end

always @(*) begin
  if (hex_counter) begin
    HEX_on_o <= 2'b10;
    HEX_reg <= counter[7:4];
  end
  else begin
    HEX_on_o <= 2'b01;
    HEX_reg <= counter[3:0];
  end
end    

endmodule