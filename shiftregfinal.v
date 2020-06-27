module shiftregfinal (dataEn,shiftEn,reset_n,data,clk,shiftData,MSB,MSB7,shiftComplete);

input dataEn;
input shiftEn;
input reset_n;
input [15:0] data;
input clk;


output reg [15:0] shiftData;
output MSB;
output MSB7;
output reg shiftComplete;

integer shiftCounter;


always@(posedge(shiftEn),posedge(dataEn),negedge(reset_n))
	begin
		if(reset_n == 1'b0)
			begin
				shiftData [15:0] <= 16'b0000000000000000;
				shiftCounter <= 0;
				shiftComplete <= 1'b0;
			end
		else if(dataEn == 1'b1)
			begin
				shiftData <= data;
				shiftCounter <= 15;
				shiftComplete <= 1'b0;
			end
		else if ((shiftEn == 1'b1) && (shiftComplete == 1'b0))
			begin
				shiftData <= shiftData << 1'b1;
				shiftCounter <= shiftCounter - 1'b1;
				if(shiftCounter == 1'b0)
				shiftComplete <= 1'b1;
			end
		else
		shiftData = shiftData;
	end

assign MSB = shiftData[15];
assign MSB7 = shiftData[7];

endmodule
