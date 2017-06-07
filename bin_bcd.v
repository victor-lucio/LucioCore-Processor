module bin_bcd(in, centena, dezena, unidade, negative);

  input [7:0] in;
  reg [7:0] in2;
  output reg [3:0] centena, dezena, unidade;
  output reg negative;
	
  integer i;
	
  always@(in)
  begin
      if(in[7])
		begin
		  in2 = ~in + 1;
		  negative = 1;
		end
	  else
		begin
		  in2 = in;
		  negative = 0;
		end
		
    
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
	  unidade[0] = in2[i];
	end
  end
endmodule