module counter(
    input            clk100_i,
    input            rstn_i,
    
    input      [9:0] sw_i,
    input      [1:0] key_i,
    
    output     [9:0] ledr_o,
    output     [6:0] hex1_o,
    output     [6:0] hex0_o
    );
    
// synchronize key press
reg [2:0] button_syncroniser;
wire key_was_pressed;

always @( posedge clk100_i ) 
  begin
    button_syncroniser[0] <= key_i[0];
    button_syncroniser[1] <= button_syncroniser[0];
    button_syncroniser[2] <= button_syncroniser[1];
  end
assign key_was_pressed = ~button_syncroniser[2]
& button_syncroniser[1];

// led register logic
reg [9:0] register;
assign ledr_o = register;
always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( ~key_i[1] )
      register <= 10'd0;
    else if ( key_was_pressed ) 
      register <= sw_i;
  end

// hex counter logic
reg [7:0] hex_counter;
always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( ~key_i[1] ) 
      hex_counter <= 8'd0;
    else if ( key_was_pressed )
      hex_counter = hex_counter + 1;
  end

hex_decoder dec1 ( 
  .data_i( hex_counter[7:4] ),
  .data_o( hex1_o       )
  );
  
hex_decoder dec0 ( 
  .data_i( hex_counter[3:0] ),
  .data_o( hex0_o       )
  );

endmodule
