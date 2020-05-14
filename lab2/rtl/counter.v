`timescale 1ns / 1ps

module counter(
  input          clk100_i,
  input          rstn_i,
  
  input  [9:0]   sw_i,
  input  [2:0]   key_i,
  
  output [9:0]   ledr_o,
  output [6:0]   hex1_o,
  output [6:0]   hex0_o
);
reg      [6:0]   hex1;
reg      [6:0]   hex0;

wire     [7:0]   data_count;
wire     [9:0]   data_reg;
wire             press;

module_counter u1(
  .clk_i       ( clk100_i    ),
  .en_i        ( press       ),
  .arst_i      ( key_i[1]    ),
  .data_o      ( data_count  ),
  .counter_rst ( press2      )
);

module_register u2(
  .clk_i     ( clk100_i   ),
  .en_i      ( press      ),
  .arst_i    ( key_i[1]   ),
  .data_i    ( sw_i[9:0]  ),
  .data_o    ( data_reg   )
);

Button u3(
  .clk100_i    ( clk100_i  ),
  .en_i        ( key_i [0] ),
  .en_down_o   ( press     ) 
  );
  
  Button u4(
  .clk100_i    ( clk100_i  ),
  .en_i        ( key_i [2] ),
  .en_down_o   ( press2    ) 
  );

always @(*) begin
  case (data_count[7:4])
    4'd0:  hex1 = 7'b100_0000;
    4'd1:  hex1 = 7'b111_1001;
    4'd2:  hex1 = 7'b010_0100;
    4'd3:  hex1 = 7'b011_0000;
    4'd4:  hex1 = 7'b001_1001;
    4'd5:  hex1 = 7'b001_0010;
    4'd6:  hex1 = 7'b000_0010;
    4'd7:  hex1 = 7'b111_1000;
    4'd8:  hex1 = 7'b000_0000;
    4'd9:  hex1 = 7'b001_0000;
    4'd10: hex1 = 7'b000_1000;
    4'd11: hex1 = 7'b000_0011;
    4'd12: hex1 = 7'b100_0110;
    4'd13: hex1 = 7'b010_0001;
    4'd14: hex1 = 7'b000_0110;
    4'd15: hex1 = 7'b000_1110;
          endcase
  case (data_count[3:0])
    4'd0:  hex0 = 7'b100_0000;
    4'd1:  hex0 = 7'b111_1001;
    4'd2:  hex0 = 7'b010_0100;
    4'd3:  hex0 = 7'b011_0000;
    4'd4:  hex0 = 7'b001_1001;
    4'd5:  hex0 = 7'b001_0010;
    4'd6:  hex0 = 7'b000_0010;
    4'd7:  hex0 = 7'b111_1000;
    4'd8:  hex0 = 7'b000_0000;
    4'd9:  hex0 = 7'b001_0000;
    4'd10: hex0 = 7'b000_1000;
    4'd11: hex0 = 7'b000_0011;
    4'd12: hex0 = 7'b100_0110;
    4'd13: hex0 = 7'b010_0001;
    4'd14: hex0 = 7'b000_0110;
    4'd15: hex0 = 7'b000_1110;
          endcase
  
end

assign ledr_o = data_reg;
assign hex1_o = hex1;
assign hex0_o = hex0;

endmodule