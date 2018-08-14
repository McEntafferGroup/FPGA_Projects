module serialize ( send, baud, count, out );
		
	input wire         baud;
	input wire         send;
	input wire   [7:0] count;
	
	reg [3:0] state = 4'b0000;
	reg [7:0] pre_out = 0;
	
	output out;	
	
	// for each baud pulse
	always @(posedge baud)
	begin
		// if we have the start signal
		if (send | state[3] | state[2])
		begin
			
			case (state)
				4'b0000: state <= 4'b1000; //start
				4'b1000: state <= 4'b1001; //bit 0 
				4'b1001: state <= 4'b1010; //bit 1
				4'b1010: state <= 4'b1011; //bit 2
				4'b1011: state <= 4'b1100; //bit 3
				4'b1100: state <= 4'b1101; //bit 4
				4'b1101: state <= 4'b1110; //bit 5
				4'b1110: state <= 4'b1111; //bit 6
				4'b1111: state <= 4'b0100; //bit 7
				4'b0100: state <= 4'b0000; //stop
			endcase
			
			if (state > 4)
			begin
				
				pre_out <= (count >> 1);
				
			end
						
		end
		
	end
	
	assign out = (state[3] & pre_out[0]);
	
endmodule 