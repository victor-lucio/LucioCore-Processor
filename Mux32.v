module Mux32(flag, dataA, dataB, out);

	input flag;
	input[31:0] dataA, dataB;
	output reg[31:0] out;

	always@(*)
	begin
		if(flag)
			out = dataB;
		else
			out = dataA;
	end
endmodule
