module counter(
    input        clk100_i,
    input        rstn_i,
    input  [9:0] sw_i,
    input  [1:0] key_i,
    output [9:0] ledr_o,
    output [6:0] hex1_o,
    output [6:0] hex0_o
);

reg  [2:0]  button_sync;
wire        key_pressed_true;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] )
      button_sync    <= 3'b0;
    else
      button_sync[0] <= ~key_i[0];
      button_sync[1] <= button_sync[0];
      button_sync[2] <= button_sync[1];
  end

assign key_pressed_true = ~button_sync[2] & button_sync[1];

reg [9:0] reg_mass;

assign ledr_o = reg_mass;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] ) 
      reg_mass <= 10'd0;
    else if ( key_pressed_true ) 
      reg_mass <= sw_i;
  end

reg  [7:0]  counter;

always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( !key_i[1] )
      counter <= 8'd0;
    else if ( key_pressed_true && ( sw_i > 10'd20 ) )
      counter <= counter + 1;
  end

hex hex0 ( 
  .in  ( counter[3:0] ),
  .out ( hex0_o       )
 );

hex hex1 ( 
  .in  ( counter[7:4] ),
  .out ( hex1_o       )
 );  
endmodule