module OutputModule(in, out1, out2, out3);
	
	input [32:0] in;
	wire [3:0] centena, dezena, unidade;
	output wire [6:0] out1, out2, out3;
	
	bin_bcd translate(.in(in[7:0]), .centena(centena), .dezena(dezena), .unidade(unidade));
	
	Display d1(.Entrada(centena), .Saida(out1));
	Display d2(.Entrada(dezena), .Saida(out2));
	Display d3(.Entrada(unidade), .Saida(out3));
	
endmodule 