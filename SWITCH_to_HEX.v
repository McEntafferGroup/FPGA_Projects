module SWITCH_to_HEX ( CLOCK_50, SWITCH, LEDR, HEX0, HEX1, HEX2 );

	input        CLOCK_50;
	input  [7:0] SWITCH;
	output [7:0] LEDR;
	wire   [6:0] in_hex0;
	wire   [6:0] in_hex1;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	
	//the syntax is awful
	//<module_name> <BS_undefined_variable> (clock, input, output);
	//
	//when called:              input is a reg or input, output is a wire or output
	//in the module definition: input is an input wire,  output is an output reg
	BITS_to_HEX do_it_once  ( CLOCK_50, (SWITCH % 16), in_hex0 );
	BITS_to_HEX do_it_twice ( CLOCK_50, (SWITCH / 16), in_hex1 );
	
	assign LEDR = SWITCH;
	assign HEX0 = ~(in_hex0);
	assign HEX1 = ~(in_hex1);
	assign HEX2 = 7'b1111111;

endmodule 