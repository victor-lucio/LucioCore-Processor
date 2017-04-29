module DataMem(clk, writeflag, address, datain, dataout, displayflag, display);
	input writeflag, clk, displayflag;
	input[31:0] address;
	input[31:0] datain;
	output [31:0] dataout, display;
	
	reg[31:0] mem[9:0];
	reg[31:0] displayreg;
	
	always@(negedge clk)
	begin
		if(writeflag)
			mem[address] = datain;
		if(displayflag)
			displayreg = datain;
	end
	
	
	assign dataout = mem[address];
	assign display = displayreg;
	
endmodule
