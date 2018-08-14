module Half_Hertz_Clock(CLOCK_50, ON_LIGHT, OFF_LIGHT);

	input  CLOCK_50;
	output ON_LIGHT;
	output OFF_LIGHT;
	reg LIGHT = 1;
	reg [31:0] slow_down_clock = 0;

	always@(posedge CLOCK_50)
	begin 
		slow_down_clock <= slow_down_clock + 1;
		if ((slow_down_clock % 25000000) == 0) //50,000,000 thing/s => 0.5 things/s
		begin
			LIGHT <= ~(LIGHT);
		end
	end
	
	assign ON_LIGHT  =  (LIGHT);
	assign OFF_LIGHT = ~(LIGHT);
	
endmodule	
