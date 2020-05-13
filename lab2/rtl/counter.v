  module counter(

    input             clk100_i,
    input      [11:0] sw_i,
    input      [1:0]  key_i,
    output     [9:0]  ledr_o,
    output reg [6:0]  hex1_o,
    output reg [6:0]  hex0_o
  
  );
  
  reg [9:0] rg10;
  reg [7:0] counter_p;
  reg [7:0] counter_m;
  
  
  reg [2:0] btn_sync;
  wire      btn_pressed;
     
     
  always @ ( posedge clk100_i or negedge key_i[1] ) begin
  
    if ( !key_i[1] )
    begin
      rg10 <= 10'b0;
    end
    else if ( btn_pressed )
    begin
      rg10 <= sw_i & -sw_i;
    end
  end  
  
  assign  ledr_o = rg10;
  
  always @ ( posedge clk100_i or negedge key_i[1] ) begin
    if ( !key_i[1] )
      btn_sync[2:0] <= 3'b0;
    else begin
      btn_sync[0] <= ~key_i[0];
      btn_sync[1] <= btn_sync[0];
      btn_sync[2] <= btn_sync[1];
    end
  end
  
  assign btn_pressed = ~btn_sync[2] & btn_sync[1];

  always @ ( posedge clk100_i or negedge key_i[1] ) begin
    if ( !key_i[1] ) begin
      counter_p <= 0;
      counter_m <= 0;
    end
    else if ( btn_pressed ) begin
      counter_p <= counter_p + 1;
      counter_m <= counter_m - 1;
    end
  end
 
  
  always @ ( * ) begin
    if ( sw_i[11] == 0 ) begin
      case ( counter_p [3:0] )
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
      
      case ( counter_p [7:4] )
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
    else
    if ( sw_i[11] == 1 ) begin
      case ( counter_m [3:0] )
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
      
      case ( counter_m [7:4] )
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
  end

endmodule