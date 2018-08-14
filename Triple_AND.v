module Triple_AND(KEY, LEDR);

	input [2:0] KEY;
	output LEDR;
	reg shine;

	always @(*)
	begin
		if (KEY [0] && KEY [1] && KEY [2])
		begin
			shine = 1;
		end
		else
		begin
			shine = 0;
		end
	end
	
	assign LEDR = shine;
	
endmodule 