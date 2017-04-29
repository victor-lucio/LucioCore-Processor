module SE26(datain, dataout);
	
	input[25:0] datain;
	output reg[31:0] dataout;
	
	always@(*)
	begin
		if(datain[25])
			dataout = {{6{1'b1}},datain};
		else
			dataout = {{6{1'b0}},datain};
	end
	
endmodule 
