module counter(

  input            clk100_i,
  input      [9:0] sw_i,
  input      [1:0] key_i,
  output     [9:0] ledr_o,
  output reg [6:0] hex1_o,
  output reg [6:0] hex0_o
    
);

  reg [9:0] rg10;
  reg [7:0] counter;
  
  
  reg [2:0] btn_sync;
  wire      btn_pressed;
     
     
  always @ ( posedge clk100_i or negedge key_i[1] ) begin
  
    if ( !key_i[1] )
    begin
      rg10 <= 10'b0;
    end
    else if ( !key_i[0] )
    begin
      rg10 <= sw_i;
    end
  end  
  
  assign  ledr_o =  rg10;
  
  always @ ( posedge clk100_i ) begin
    btn_sync[0] <= ~key_i[0];
    btn_sync[1] <= btn_sync[0];
    btn_sync[2] <= btn_sync[1];
  end
  
  assign btn_pressed = ~btn_sync[2] & btn_sync[1];

  always @ ( posedge clk100_i or negedge key_i[1] ) begin
    if ( !key_i[1] ) 
      counter <= 0;
    else if ( btn_pressed ) 
      counter <= counter + 1;
  end
 
  
  always @(*) begin
    //case (counter [3:0])
    case (sw_i [3:0])
      //    HEX0
      4'b0000 : hex0_o = 7'b100_0000;
      4'b0001 : hex0_o = 7'b111_1001;
      4'b0010 : hex0_o = 7'b010_0100;
      4'b0011 : hex0_o = 7'b011_0000;
      4'b0100 : hex0_o = 7'b001_1001;
      4'b0101 : hex0_o = 7'b001_0010;
      4'b0110 : hex0_o = 7'b000_0010;
      4'b0111 : hex0_o = 7'b111_1000;
      4'b1000 : hex0_o = 7'b000_0000;
      4'b1001 : hex0_o = 7'b001_0000;
      4'b1010 : hex0_o = 7'b000_1000;
      4'b1011 : hex0_o = 7'b000_0011;
      4'b1100 : hex0_o = 7'b100_0110;
      4'b1101 : hex0_o = 7'b010_0001;
      4'b1110 : hex0_o = 7'b000_0110;
      4'b1111 : hex0_o = 7'b000_1110;
    endcase
    
    //case (counter [7:4])
    case (sw_i [7:4])
      4'b0000 : hex1_o = 7'b100_0000;
      4'b0001 : hex1_o = 7'b111_1001;
      4'b0010 : hex1_o = 7'b010_0100;
      4'b0011 : hex1_o = 7'b011_0000;
      4'b0100 : hex1_o = 7'b001_1001;
      4'b0101 : hex1_o = 7'b001_0010;
      4'b0110 : hex1_o = 7'b000_0010;
      4'b0111 : hex1_o = 7'b111_1000;
      4'b1000 : hex1_o = 7'b000_0000;
      4'b1001 : hex1_o = 7'b001_0000;
      4'b1010 : hex1_o = 7'b000_1000;
      4'b1011 : hex1_o = 7'b000_0011;
      4'b1100 : hex1_o = 7'b100_0110;
      4'b1101 : hex1_o = 7'b010_0001;
      4'b1110 : hex1_o = 7'b000_0110;
      4'b1111 : hex1_o = 7'b000_1110;  
    endcase
  end

endmodule