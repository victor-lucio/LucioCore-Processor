module InstMem(address, clk, out);
  input[15:0] address;
  input clk;
  output reg[31:0] out;
  integer firstclock = 0;

  reg[31:0] mem[11:0];
  
  always@(posedge clk)
  begin
	if(firstclock == 0)
	begin
		// instruções

		mem[0] = 32'b00000000000000010000000000000000; // reg 1 <- entrada
		mem[1] = 32'b00000000001000000001000000000000; // reg 2 <- reg[1] + reg[0]
		mem[2] = 32'b00000000001000100001100000000000; // set equals entre reg[1] e reg[2] com destino reg[3]
		mem[3] = 32'b00000000000000110000000000000000; // lê reg[3] e mostra no display
		mem[4] = 32'b00000000000000110000000000000001; // branch not equals entre reg[0] e reg[3]
		mem[5] = 32'b00000000000001000000000000000011; // insere imediato 3 em reg[4]
		mem[6] = 32'b00000000000001000000000000000100; // insere imediato 4 em reg[4]
		mem[7] = 32'b00000000000001000000000000000000; // insere reg[4] na posição 0 da memória
		mem[8] = 32'b00000000000001010000000000000000; // lê a mem[0] e insere no reg[5]
		mem[9] = 32'b00000000000001010000000000000000; // lê reg[5] e mostra no display
		mem[10]= 32'b00000000000000000000000000000000; // jump para endereço 0;
 		
		firstclock <= 1;
	end
  end

  

  always@(address)
  begin
    out = mem[address];
  end

endmodule
