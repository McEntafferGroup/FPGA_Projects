`timescale 1 ps / 1 ps
module randomizer_tb ();
	
	// clk20:    AC15: top right
	// decoded:  AB22: top left
	// rnrzl:    AB21: under decoded
	// signal_d: Y17:  under clk20
	// signal_w: Y16:  under signal_d
	
	wire bitstream_in;
	reg  clock_in;
	
	wire signal_w;
	wire signal_f1;
	wire signal_f2;
	wire signal_d;
	reg enable; 
	
	wire [15:0] data;
	wire [15:0] count;
	reg [15:0] f1;
	reg [15:0] f2;
	wire clk20;
	wire rnrzl_out_stream;
	wire decoded;
	
	assign data = (signal_d)?(count):((signal_f1)?(f1):(f2));
		
	clock20 i0(
		.inclk0(clock_in),   
		.c0(clk20)
	);
	
	enable_signals i1(
		.clock_in(clk20),
		.num_word(16'b0000000000001010),
		.word_out(signal_w),
		.signal_f1(signal_f1),
		.signal_f2(signal_f2),
		.signal_d(signal_d)
	);
	
	//counter for data module
	data_count i2(
		.clock(signal_w & signal_d),
		.updown(1'b1),
		.q(count)
	);

	shiftreg i3(
		.clock(clk20),
		.data(data),
		.enable(enable),
		.load(signal_w),
		.shiftout(bitstream_in)
	);
	
	randomizer_c i4(
		.bitstream_in(bitstream_in),
		.clock_in(clk20),
		.rnrzl_out_stream(rnrzl_out_stream)
	);
	
	unrandomizer i5(
		.clock_in(clk20),
		.data_in(rnrzl_out_stream),
		.decoded(decoded)
	);
	
	initial 
	begin
		clock_in = 1'b0;
		enable   = 1; // always true, for now
		f1 = 16'hFE6B;
		f2 = 16'h2840;
	end
	
	// all forevers must be separate initials
	//initial forever #120000  load_clk <= ~(load_clk);
	//initial forever #2880000 enable  <= ~(enable);
	// [1/(50 MHz)]/(2 per clock cycle)
	initial forever #10000 clock_in  <= ~(clock_in);
	
	//assign enable = (enable_d|enable_f1|enable_f2);
	
	
endmodule 