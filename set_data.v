module set_data(
	signal_w,
	signal_d,
	signal_f1,
	signal_f2,
	count,
	f1,
	f2);
	
	input  signal_w;
	input  signal_d;
	input  signal_f1;
	input  signal_f2;
	
	output [15:0] count;
	reg    [15:0] count_v;
	output [15:0] f1;
	reg    [15:0] f1_v;
	output [15:0] f2;
	reg    [15:0] f2_v;

	
	always @(posedge signal_w)
	begin
		
		count_v <= (signal_d  ? count    : 16'b0);
		f1_v    <= (signal_f1 ? 16'hFE6B : 16'b0);
		f2_v    <= (signal_f2 ? 16'h2840 : 16'b0);
		
	end
	
	assign count = count_v;
	assign f1 = f1_v;
	assign f2 = f2_v;
	
endmodule 