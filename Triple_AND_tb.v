module Triple_AND_tb;

	reg  [2:0] KEY;
	wire       LEDR;
	
	// call the main method
	Triple_AND x( KEY, LEDR );
	
	initial begin 
		KEY  = 0;		
	end
	
	// initialize repeating (num of times) #time steps in-between
	initial repeat (2000) #2 KEY[0] = ~KEY[0];
	initial repeat (2000) #3 KEY[1] = ~KEY[1];
	initial repeat (2000) #7 KEY[2] = ~KEY[2];

endmodule 