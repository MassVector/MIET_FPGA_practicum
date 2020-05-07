module dec_hex (
			input        [3:0]    in,
			output reg   [6:0]    OUT);
			
always @ (*) begin
case (in)
		4'h0 : OUT = 7'b1000000;
		4'h1 : OUT = 7'b1111001;
		4'h2 : OUT = 7'b0100100;
		4'h3 : OUT = 7'b0110000;
		4'h4 : OUT = 7'b0011001;
		4'h5 : OUT = 7'b0010010;
		4'h6 : OUT = 7'b0000010;
		4'h7 : OUT = 7'b1111000;
		4'h8 : OUT = 7'b0000000;
		4'h9 : OUT = 7'b0010000;
		4'ha : OUT = 7'b0001000;
		4'hb : OUT = 7'b0000011;
		4'hc : OUT = 7'b1000110;
		4'hd : OUT = 7'b0100001;
		4'he : OUT = 7'b0000110;
		4'hf : OUT = 7'b0001110; 
default : OUT = 7'b1111111;
endcase
end
endmodule		 