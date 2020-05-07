`timescale 1ns / 1ps

module counter2( 
    input clk_i,
    input en_i,
    input arstn_i,
    input key_i,
    
    output reg [6:0] hex
);


//counter logic
reg [7:0] counter;
reg       sw_event = 1'b1;

always @(posedge clk_i or posedge arstn_i) begin
  if( arstn_i ) counter <= 0;
  else if (en_i && sw_event ) counter <= counter + 1;
end

reg [3:0] show;

//switching display
always @( * ) begin
  show <= counter[3:0];
  #10
  show <= counter[7:4];
end

//скачать честно не понимаю почему первое значение 40, но потом идет 79 это цифра 1, ну дальше я не смотрел вроде работает)

always @ (*) begin
case (show)
		4'h0 : hex = 7'b1000000;
		4'h1 : hex = 7'b1111001;
		4'h2 : hex = 7'b0100100;
		4'h3 : hex = 7'b0110000;
		4'h4 : hex = 7'b0011001;
		4'h5 : hex = 7'b0010010;
		4'h6 : hex = 7'b0000010;
		4'h7 : hex = 7'b1111000;
		4'h8 : hex = 7'b0000000;
		4'h9 : hex = 7'b0010000;
		4'ha : hex = 7'b0001000;
		4'hb : hex = 7'b0000011;
		4'hc : hex = 7'b1000110;
		4'hd : hex = 7'b0100001;
		4'he : hex = 7'b0000110;
		4'hf : hex = 7'b0001110; 

endcase
end

endmodule