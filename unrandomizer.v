module unrandomizer (
	clock_in,
	data_in,
	decoded
);

	input  wire clock_in; // input  clock
	input  wire data_in;  // input  data
	output wire decoded;  // output data
	
	reg [14:0]  shiftreg = 0; // shiftregister to hold the binary values
	
	always @(posedge clock_in)	begin
		shiftreg = shiftreg << 1;
		shiftreg[0]<=data_in;
	end
	
	// undo the encoding
	assign decoded = data_in ^ (shiftreg[14] ^ shiftreg[13]);
	
endmodule 