module dec_hex (
			input        [3:0]    in,
			output reg   [6:0]    EX);
			
always @ (*) begin
case (in)
		4'h0 : EX = 7'b1000000;
		4'h1 : EX = 7'b1111001;
		4'h2 : EX = 7'b0100100;
		4'h3 : EX = 7'b0110000;
		4'h4 : EX = 7'b0011001;
		4'h5 : EX = 7'b0010010;
		4'h6 : EX = 7'b0000010;
		4'h7 : EX = 7'b1111000;
		4'h8 : EX = 7'b0000000;
		4'h9 : EX = 7'b0010000;
		4'ha : EX = 7'b0001000;
		4'hb : EX = 7'b0000011;
		4'hc : EX = 7'b1000110;
		4'hd : EX = 7'b0100001;
		4'he : EX = 7'b0000110;
		4'hf : EX = 7'b0001110; 

endcase
end
endmodule		 