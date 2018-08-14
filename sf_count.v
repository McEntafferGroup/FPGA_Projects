module sf_count ( clock_in, max_count, count_out );

	input        clock_in;
	input [15:0] max_count;
	
	output [15:0] count_out;
	reg [15:0] count = 0;
	
	always @(posedge clock_in)
	begin
		count <= (count + 1);
		
		if (count == max_count) count <= 0;
		
	end
	
	assign count_out = count;
		
endmodule 