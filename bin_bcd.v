module bin_bcd(in, centena, dezena, unidade);

	input [7:0] in;
	output reg [3:0] centena, dezena, unidade;
	
	integer i;
	
	always@(in)
	begin
		centena = 4'd0;
		dezena = 4'd0;
		unidade = 4'd0;
		
		for(i=7; i>=0; i=i-1)
		begin
			//add 3 to columns >=5
			
			if(centena >= 5)
				centena = centena + 4'd3;
			if(dezena >= 5)
				dezena = dezena + 4'd3;
			if(unidade >= 5)
				unidade = unidade + 4'd3;
				
			// shift left one
			centena = centena << 1;
			centena[0] = dezena[3];
			dezena = dezena << 1;
			dezena[0] = unidade[3];
			unidade = unidade << 1;
			unidade[0] = in[i];
		end
	end
	
endmodule 