module enable_signals (
	clock_in,
	num_word,
	word_out,
	signal_d,
	signal_f1,
	signal_f2
	);
	
	input clock_in;        // input clock
	input [15:0] num_word; // input number of words per frame
	
	//for the 16 bits
	reg [4:0] load_ct = 0; // load counter
	reg load_clk  = 1;     // load clock
	output word_out;       // output word signal
	
	wire [16:0] end_word;  // when to stop the counter
	assign end_word = num_word + 1;
	reg [16:0] word_ct = 0; // word counter
	
	// signals and clocks for frame syncs and data
	output signal_f1;
	reg f1_clk = 0;
	output signal_f2;
	reg f2_clk = 0;
	output signal_d;
	reg d_clk  = 0;
	
	always @(posedge clock_in)// or posedge load_clk)
	begin		
	
		load_ct <= (load_ct+1);
		
		// after 16 bits, reset it
		if (load_ct == 15)
		begin	
			load_clk <= 1;
			load_ct  <= 0;
		end
		else 
		begin 
			load_clk <= 0;
		end
		
		if (load_clk)
		begin
			word_ct <= word_ct+1;
			
			// properly set the signals at each counter position
			if (word_ct == end_word) 
			begin 
				word_ct <= 0; //reset the counter
				f1_clk  <= 0;
				f2_clk  <= 0;
				d_clk   <= 1;
			end
			else if (word_ct == 0)
			begin
				f1_clk <= 1;
				f2_clk <= 0;
				d_clk  <= 0;
			end
			else if (word_ct == 1)
			begin
				f1_clk <= 0;
				f2_clk <= 1;
				d_clk  <= 0;
			end
			else 
			begin
				f1_clk <= 0;
				f2_clk <= 0;
				d_clk  <= 1;
			end

		end
		
	end
	
	// assign the signals
	assign word_out  = load_clk;
	assign signal_f1 = f1_clk;
	assign signal_f2 = f2_clk;
	assign signal_d  = d_clk;
	
endmodule 