module debounce_tb;

	reg        SW;
	reg        CLOCK_50;
	wire [6:0] KEY0;
	wire [6:0] KEY1;

	debounce x( SW, CLOCK_50, KEY0, KEY1 );

	initial begin
		SW       = 0;
		CLOCK_50 = 0;
	end 
	
	initial repeat (2000) #5 SW = ~SW;
	initial repeat (4000) #2 CLOCK_50 = ~CLOCK_50;
	
endmodule 