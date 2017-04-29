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
		mem[0] = 32'b00000000000000000000100000000000; //coloca entrada de dados no reg 1
		mem[1] = 32'b00000000001000000000000000000000; //leg reg 1 em B
		mem[2] = 32'b00000000001000000001000000000000; //coloca entrada no reg 2
		mem[3] = 32'b00000000000000100000000000000000; //leg reg 2 em B
		//mem[4] = 32'b00000000001000100001100000000000; //lê reg 1 e reg 2, joga no reg 3
		//mem[5] = 32'b00000000000000110000000000000000; //lê reg 3
		firstclock <= 1;
	end
  end

  

  always@(address)
  begin
    out = mem[address];
  end

endmodule
