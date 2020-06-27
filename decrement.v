module decrement (
	input dec,
	input set_n,
	input [15:0] load,
	output [15:0] value,
	output msb
	
	
);


reg [15:0] regvalue;


always @(posedge(dec))
	begin
		// First setup the reset characteristics
		if(set_n == 1'b0)
			begin
				regvalue = load;
			end
		else if(dec == 1'b1)
			begin	
				regvalue = regvalue << 1'b1;
			end
		else
			begin
				// Hold condition.
			regvalue = regvalue;
			end
	end
assign value = regvalue;
assign msb = regvalue[15];
	
endmodule
