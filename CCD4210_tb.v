`timescale 1 ps / 1 ps
module CCD4210_tb ();

	reg clk;
	wire I1;
	wire I2;
	wire I3;
	wire out_clk;

	clock_maker i0 (
		.clk_in(clk),
		.enable(1),
		.I1(I1),
		.I2(I2),
		.I3(I3),
		.signal(out_clk)
	);
	
	initial clk = 0;
	initial forever #500000 clk = ~clk; // should be 1 MHz

endmodule 