module increment (
	input inc,
	input reset_n,
	input clk50,
	output [15:0] value
	
	
);


reg [5:0] Iaddress;

test i2c (

	.aclr(1'b0),
	.address(Iaddress),
	.clock(clk50),
	.rden(1'b1),
	.q(value)

);

always @(posedge(inc), negedge(reset_n))
	begin
		// First setup the reset characteristics
		if(reset_n == 1'b0)
			begin
				// Preload functionality.
				Iaddress [5:0] = 6'b000000;
			end
		else if(inc == 1'b1)
			begin
				// The count is active, so check to
				// see whether it has expired.
//				if(counterValue == ((2**counterwidth)-1'b1))
//					begin
//						counterValue = 0;
//					end
//				else
					//begin
						Iaddress = Iaddress + 1'b1;
					//end
			end
		else
			begin
				// Hold condition.
			Iaddress = Iaddress;
			end
	end

endmodule
