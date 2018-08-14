module clock_maker (
	clk_in,
	enable,
	I1,
	I2,
	I3,
	signal);
	
	input clk_in;
	input enable;
	
	reg does = 0;
	reg [5:0] state = 6'h00;
	
	output I1;
	reg I1_sig = 0;
	output I2;
	reg I2_sig = 0;
	output I3;	
	reg I3_sig = 0;
	
	output signal;
	reg SIGNAL_RESET = 0;
	
	always @(posedge clk_in or enable)
	begin 
		if (enable) does = 1;
		if (does)
		begin		
			case(state)
			6'h00: begin          // just went high
					 state <= 6'h01; 
					 SIGNAL_RESET <= 0;
					 end
			6'h01: state <= 6'h02; // 1 us elapsed
			6'h02: begin
					 state <= 6'h03; 
					 I3_sig <= 1;
					 end
			6'h03: state <= 6'h04; 
			6'h04: state <= 6'h05;
			6'h05: state <= 6'h06;
			6'h06: state <= 6'h07;
			6'h07: state <= 6'h08;
			6'h08: state <= 6'h09;
			6'h09: state <= 6'h0A;
			6'h0A: state <= 6'h0B;
			6'h0B: state <= 6'h0C;
			6'h0C: begin			 // 12 us
					 state <= 6'h0D;
					 I1_sig <= 1;
					 end
			6'h0D: state <= 6'h0E;
			6'h0E: state <= 6'h0F;
			6'h0F: state <= 6'h10;
			6'h10: state <= 6'h11;
			6'h11: begin			 // 17 us
					 state <= 6'h12;
					 I3_sig <= 0;
					 end
			6'h12: state <= 6'h13;
			6'h13: state <= 6'h14;
			6'h14: state <= 6'h15;
			6'h15: state <= 6'h16;
			6'h16: begin 			 // 22 us
					 state <= 6'h17;
					 I2_sig <= 1;
					 end
			6'h17: state <= 6'h18;
			6'h18: state <= 6'h19;
			6'h19: state <= 6'h1A;
			6'h1A: state <= 6'h1B;
			6'h1B: begin 			 // 27 us
					 state <= 6'h1C;
					 I1_sig <= 0;
					 end
			6'h1C: state <= 6'h1D;
			6'h1D: state <= 6'h1E;
			6'h1E: state <= 6'h1F;
			6'h1F: state <= 6'h20;
			6'h20: begin 			 // 32 us
					 state <= 6'h21;
					 I3_sig <= 1;
					 end
			6'h21: state <= 6'h22;
			6'h22: state <= 6'h23;
			6'h23: state <= 6'h24;
			6'h24: state <= 6'h25;
			6'h25: begin          // 37 us
					 state <= 6'h26;
					 I2_sig <= 0;
					 end
			6'h26: state <= 6'h27;
			6'h27: state <= 6'h28;
			6'h28: state <= 6'h29;
			6'h29: state <= 6'h2A;
			6'h2A: state <= 6'h2B;
			6'h2B: state <= 6'h2C;
			6'h2C: state <= 6'h2D;
			6'h2D: state <= 6'h2E;
			6'h2E: state <= 6'h2F;
			6'h2F: begin 			 // 47 us
					 state <= 6'h30;
					 I3_sig <= 0;
					 end
			6'h30: state <= 6'h31;
			6'h31: state <= 6'h32;
			6'h32: state <= 6'h33;
			6'h33: state <= 6'h34;
			6'h34: begin			 // 52 us
					 state <= 6'h00;
					 does <= 0;
					 SIGNAL_RESET <= 1;
					 end
			endcase
		end
	end 
	
	assign I1 = I1_sig;
	assign I2 = I2_sig;
	assign I3 = I3_sig;
	assign signal = SIGNAL_RESET;
	
endmodule 