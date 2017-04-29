module SE16(datain, dataout);
	
	input[15:0] datain;
	output reg[31:0] dataout;
	
	always@(*)
	begin
		if(datain[15])
			dataout = {{16{1'b1}},datain};
		else
			dataout = {{16{1'b0}},datain};
	end
	
endmodule 

