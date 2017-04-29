module ALU(operation, dataA, dataB, saida, zero, shamt, of);

	input [3:0] operation;
	input [4:0] shamt;
	input [31:0] dataA, dataB;
	output reg [31:0] saida;
	output zero;
	output reg of;
	
	always@(*)
	begin
		of = 0;
		case(operation[3:0])
			4'b0000:
			begin
				saida = dataA + dataB; 
				if(~dataA[31] && ~dataB[31] && saida[31])
					of = 1;
				else if(dataA[31] && dataB[31] && ~saida[31])
					of = 1;
			end
			4'b0001:
			begin
				saida = dataA - dataB;	
				if(~dataA[31] && dataB[31] && saida[31])
					of = 1;
				else if(dataA[31] && ~dataB[31] && ~saida[31])
					of = 1;
			end
			4'b0010: saida = dataA + 1;
			4'b0011: saida = dataA - 1;
			4'b0100: saida = dataA & dataB;
			4'b0101: saida = dataA | dataB;
			4'b0110: saida = dataA ^ dataB;
			4'b0111: saida = ~dataA;
			4'b1000: saida = dataA << shamt;
			4'b1001: saida = dataA >> shamt;
			4'b1010: saida = dataA < dataB ? 1 : 0;
			4'b1011: saida = dataA[15:0] * dataB[15:0];
			4'b1100:
			begin
				saida = dataA / dataB;
				if(dataB == 32'd0)
					of = 1;
			end
			4'b1101:
			begin
				saida = dataA % dataB;
				if(dataB == 32'd0)
					of = 1;
			end
			default: saida = 32'b0;
		endcase
	end
	
	assign zero = (saida == 0);
	
endmodule
