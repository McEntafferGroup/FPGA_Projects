`timescale 1 ns/ 1 ns
module Double_AND_tb ();
	
	reg  CLOCK_50;
	reg  random_1;
	reg  random_2;
	reg  random_3;
	wire anded_1;
	wire anded_2;
	wire anded_3;
	
	always @(posedge CLOCK_50)
	begin
		random_1 <= $random;
		random_2 <= $random;
		random_3 <= $random;
	end
	
	// assign statements (if any)                          
	Double_AND i1 (
	// port map - connection between master ports and signals/registers   
		.in1(CLOCK_50),
		.in2(random_1),
		.out(anded_1)
	);
	
	Double_AND i2 (
		.in1(random_2),
		.in2(random_3),
		.out(anded_2)
	);
	
	Double_AND i3 (
		.in1(anded_1),
		.in2(anded_2),
		.out(anded_3)
	);
	
	initial                                                
	begin                                                  
	// code that executes only once                        
	// insert code here --> begin                          
	CLOCK_50 = 1'b0;
	random_1 = 1'b0;
	random_2 = 1'b0;
	random_3 = 1'b0;
	
	// clock bois
	forever 
	begin
		#20;
		CLOCK_50 <= ~CLOCK_50; 
	end
				
	// --> end                     
	end                                                    
	
endmodule 