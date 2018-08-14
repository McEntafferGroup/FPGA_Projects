module BITS_to_HEX ( CLOCK_50, BITS, HEX );

	input        CLOCK_50;
	input wire [3:0] BITS;
	output reg [6:0] HEX;
	
	always @(posedge CLOCK_50)
	begin
		case ( BITS )
			4'b0000: HEX <= ~(7'b0111111); //0
			4'b0001: HEX <= ~(7'b0000110); //1
			4'b0010: HEX <= ~(7'b1011011); //2
			4'b0011: HEX <= ~(7'b1001111); //3
			4'b0100: HEX <= ~(7'b1100110); //4
			4'b0101: HEX <= ~(7'b1101101); //5
			4'b0110: HEX <= ~(7'b1111101); //6
			4'b0111: HEX <= ~(7'b0000111); //7
			4'b1000: HEX <= ~(7'b1111111); //8
			4'b1001: HEX <= ~(7'b1101111); //9
			4'b1010: HEX <= ~(7'b1110111); //10 
			4'b1011: HEX <= ~(7'b1111100); //11
			4'b1100: HEX <= ~(7'b0111001); //12
			4'b1101: HEX <= ~(7'b1011110); //13
			4'b1110: HEX <= ~(7'b1111001); //14
			4'b1111: HEX <= ~(7'b1110001); //15
			default: HEX <= ~(7'b1111111); //nothing
		endcase 
	end
	
endmodule 