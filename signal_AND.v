module signal_AND ( 
	signal_f1,
	signal_d,
	count,
	f1,
	f2,
	out);
	
	input  signal_d;
	input  signal_f1;
	input  [15:0] count;
	input  [15:0] f1;
	input  [15:0] f2;
	output [15:0] out;
	
	// set the data dependant on the current signal
	assign out = (signal_d)?(count):((signal_f1)?(f1):(f2));
	
endmodule 