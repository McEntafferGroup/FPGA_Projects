module send_data ( clk, tick );

	//count up to 11 for safety
	
	input       clk;
	reg   [3:0] count = 0;
	reg         go;
	output wire tick;
	
	always @(posedge clk)
	begin
				
		if (count == 4'b1011)
		begin
			count <= 0;
			go <= 1;
		end
		else 
		begin
			count <= count + 1;
			go <= 0;
		end
		
	end
		
	assign tick = go;
	
endmodule 