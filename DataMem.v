module DataMem(clk, writeflag, address, datain, dataout, displayflag, display);
	input writeflag, clk, displayflag;
	input[31:0] address;
	input[31:0] datain;
	output reg [31:0] dataout, display;
	
	reg[31:0] mem[9:0];
	
	always@(posedge clk)
	begin
		if(writeflag)
			mem[address] = datain;
		if(displayflag)
			display = datain;
	end
	
	always@(*)
	begin
		dataout = mem[address];
	end
	
endmodule
