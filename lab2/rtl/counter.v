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
localparam OVERLOAD_VALUE = 10;
reg [7:0] reset_counter;
reg [3:0] first_digit;
reg [3:0] second_digit;
always @( posedge clk100_i or negedge key_i[1] ) 
  begin
    if ( ~key_i[1] )
      begin
        first_digit   <= 4'd0;
        second_digit  <= 4'd0;
        reset_counter <= 8'd0;
      end
    else if ( key_was_pressed )
      begin
        if ( reset_counter == 8'd255 )
          begin
            first_digit   <= 4'd0;
            second_digit  <= 4'd0;
            reset_counter <= reset_counter + 1;
          end
        else if ( reset_counter < 8'd99 )
          begin
            // x9 reached 
            if ( first_digit > 4'd8 )
              begin
                first_digit   <= 4'd0;  
                second_digit  <= second_digit + 1;
                reset_counter <= reset_counter + 1;
              end
            else
              begin
                first_digit   <= first_digit + 1;
                reset_counter <= reset_counter + 1;
              end
          end
      else
        begin
          // overload state ( EE )
          first_digit   <= OVERLOAD_VALUE;
          second_digit  <= OVERLOAD_VALUE;
          reset_counter <= reset_counter + 1;
        end
      end
  end

hex_decoder dec1 ( 
  .data_i( second_digit  ),
  .data_o( hex1_o       )
  );
  
hex_decoder dec0 ( 
  .data_i( first_digit ),
  .data_o( hex0_o       )
  );

endmodule
