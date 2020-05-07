`timescale 1ns / 1ps

module main(
         // Clock input
         input            clk_i,

         // SW[9:0], KEY[0] and KEY[1] inputs
         input      [9:0] sw_i,
         input      [1:0] key_i,

         // LEDR[9:0], HEX0 and HEX1 outputs
         output     [9:0] ledr_o,
         output reg [6:0] hex0_o,
         output reg [6:0] hex1_o
       );

// counter and register data
wire [7:0] counter_data;
wire [9:0] register_data;

wire [6:0] hex0;
wire [6:0] hex1;

// Code from example individual task
///////////////////////////////////////////////////////////////////////////////////////////////////
reg sw_event;
always@(sw_i) begin
  if ((sw_i[0] + sw_i[1] + sw_i[2] + sw_i[3]
       + sw_i[4] + sw_i[5] + sw_i[6] + sw_i[7]
       + sw_i[8] + sw_i[9]) > 3)
    sw_event <= 1;
  else
    sw_event <= 0;
end

reg [2:0] event_sync_reg;
wire synced_event;
assign synced_event = event_sync_reg[1] & ~event_sync_reg[0];

always@(posedge clk_i) begin
  event_sync_reg[2] <= sw_event;
  event_sync_reg[1:0] <= event_sync_reg[2:1];
end
///////////////////////////////////////////////////////////////////////////////////////////////////

// Include counter, register and dc modules
counter COUNTER(
          // Clock input
          .clk_i      ( clk_i             ),

          // Inputs
          .key0_i     ( key_i[0]          ),
          .key1_i     ( key_i[1]          ),
          .sw_event_i ( sw_event          ),

          // Output
          .counter_o  ( counter_data[7:0] )
        );

register REGISTER(
           // Clock input
           .clk_i      ( clk_i              ),

           // Inputs
           .key0_i     ( key_i[0]           ),
           .key1_i     ( key_i[1]           ),
           .sw_i       ( sw_i               ),

           // Output
           .register_o ( register_data[9:0] )
         );

//dc DC0(
//     // Input
//     .key1_i         ( key_i[1]          ),
//     .counter_data_i ( counter_data[3:0] ),

//     // Output
//     .hex_o          ( hex0            )
//   );

//dc DC1(
//     // Input
//     .key1_i         ( key_i[1]          ),
//     .counter_data_i ( counter_data[7:4] ),

//     // Output
//     .hex_o          ( hex1            )
//   );

// Data output from COUNTER to HEX0 and HEX1
//assign hex0_o = hex0;
//assign hex1_o = hex1;

always@(*) begin
  case (counter_data[3:0])
    0  : hex0_o = 7'b1000000;
    1  : hex0_o = 7'b1111001;
    2  : hex0_o = 7'b0100100;
    3  : hex0_o = 7'b0110000;
    4  : hex0_o = 7'b0011001;
    5  : hex0_o = 7'b0010010;
    6  : hex0_o = 7'b0000010;
    7  : hex0_o = 7'b1111000;
    8  : hex0_o = 7'b0000000;
    9  : hex0_o = 7'b0010000;
    10 : hex0_o = 7'b0001000;
    11 : hex0_o = 7'b0000011;
    12 : hex0_o = 7'b1000110;
    13 : hex0_o = 7'b0100001;
    14 : hex0_o = 7'b0000110;
    15 : hex0_o = 7'b0001110;
  endcase
  case (counter_data[3:0])
    0  : hex1_o = 7'b1000000;
    1  : hex1_o = 7'b1111001;
    2  : hex1_o = 7'b0100100;
    3  : hex1_o = 7'b0110000;
    4  : hex1_o = 7'b0011001;
    5  : hex1_o = 7'b0010010;
    6  : hex1_o = 7'b0000010;
    7  : hex1_o = 7'b1111000;
    8  : hex1_o = 7'b0000000;
    9  : hex1_o = 7'b0010000;
    10 : hex1_o = 7'b0001000;
    11 : hex1_o = 7'b0000011;
    12 : hex1_o = 7'b1000110;
    13 : hex1_o = 7'b0100001;
    14 : hex1_o = 7'b0000110;
    15 : hex1_o = 7'b0001110;
  endcase
end

// Data output from REGISTER to LEDR
assign ledr_o = register_data;
endmodule
