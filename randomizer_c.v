module randomizer_c (
	bitstream_in,
	clock_in,
	rnrzl_out_stream
);

// Inputs
input bitstream_in; // thing to be randomized
input clock_in;     // input clock

// Outputs
output rnrzl_out_stream; // randomized output

// Type Declarations
wire bitstream_in; // wire declaration of inouts
wire clock_in;
wire rnrzl_out_stream;

// It seems I can change the order??  reg [0:14] also seems to work?
reg [14:0] shiftreg = 0;



// Do I actually need this?  Or will the shift reg be zero upon declaration??
//initial begin
//	shiftreg = 0;
//end
//


always @(posedge clock_in)	begin
	shiftreg = shiftreg << 1;
	shiftreg[0]<=rnrzl_out_stream ;
end
//

// xor the last 2 shiftregs with the beginning one
assign rnrzl_out_stream = bitstream_in ^ (shiftreg[14]^shiftreg[13]);

	
endmodule