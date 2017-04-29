module Mux5(flag, dataA, dataB, out);

	input flag;
	input[4:0] dataA, dataB;
	output reg[4:0] out;
	
	always@(*)
	begin
		if(flag)
				out = dataB;
		else
				out = dataA;
	end
			
endmodule 