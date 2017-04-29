module InstMem(address, clk, out);
  input[15:0] address;
  input clk;
  output reg[31:0] out;
  integer firstclock = 0;

  reg[31:0] mem[10:0];
  
  always@(posedge clk)
  begin
	if(firstclock == 0)
	begin
		// instruções
				     //opcoderegi1regi2regi3shamtfuunct
					  //10987654321098765432109876543210
		mem[0] = 32'b00000000000000010000000000000101; // reg 1 <- imediato (tipo I)
		mem[1] = 32'b00000000001000000001000000000000; // reg 2 <- reg 1 + reg 1 (tipo R)
		mem[2] = 32'b00000000001000100001100000000000; // set equals
		mem[3] = 32'b00000000000000110000000000000000; // le reg 2 em B e reg 1 em A
		mem[4] = 32'b00000000000000110000000000000001; // bne
		mem[5] = 32'b00000000000001000000000000000011; // 3 no reg 4
		mem[6] = 32'b00000000000001000000000000000100; // 4 no reg 4
		mem[7] = 32'b00000000000001000000000000000000; // mostra reg 4 em B pra jogar no display
 		
		firstclock <= 1;
	end
  end

  

  always@(address)
  begin
    out = mem[address];
  end

endmodule
