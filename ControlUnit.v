module ControlUnit(clk, ready, opcode, halt, reset, sreg, smux5, smux16, smux32, smuxPC, salu, smem, sdisplay, smemtoreg);
	
	input [5:0] opcode;
	input ready, clk;
	output reg halt, reset, sreg, smux5, smem, sdisplay, smemtoreg, smux32; 
	output reg [1:0] smux16;
	output reg [2:0] smuxPC;
	output reg [3:0] salu;
	
	always@(opcode or ready)
	begin
		case(opcode)
			6'b000000:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0	2'b
				smuxPC =3'b000; //2:0	3'b
				salu =4'b0000;	 //3:0	4'b
			end
			6'b000001:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b000010:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =1;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =1;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b000011:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0010;	 //3:0
			end
			6'b000100:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0001;	 //3:0
			end
			6'b000101:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =1;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =1;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0001;	 //3:0
			end
			6'b000110:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0011;	 //3:0
			end
			6'b000111:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0100;	 //3:0
			end
			6'b001000:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0101;	 //3:0
			end
			6'b001001:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0110;	 //3:0
			end
			6'b001010:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0111;	 //3:0
			end
			6'b001011:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1111;	 //3:0
			end
			6'b001100:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1000;	 //3:0
			end
			6'b001101:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1001;	 //3:0
			end
			6'b001110:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1010;	 //3:0
			end
			6'b001111:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1100;	 //3:0
			end
			6'b010000:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1011;	 //3:0
			end
			6'b010001:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b001; //2:0
				salu =4'b0001;	 //3:0
			end
			6'b010010:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b010; //2:0
				salu =4'b0001;	 //3:0
			end
			6'b010011:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b011; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b010100:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b100; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b010101:
			begin
				halt =1;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b010110: //IN
			begin
				if(ready==1)
					begin
						halt =0;
						reset =0;
						sreg =1;
						smux5 =1;
						smem =0;
						sdisplay =0;
						smemtoreg =0;
						smux32 =1;
						smux16 =2'b10;  //1:0
						smuxPC =3'b000; //2:0
						salu =4'b0000;	 //3:0
					end
				else if(clk==1)
					begin
						halt =1;
						reset =0;
						sreg =0;
						smux5 =0;
						smem =0;
						sdisplay =0;
						smemtoreg =0;
						smux32 =0;
						smux16 =2'b00;  //1:0	2'b
						smuxPC =3'b000; //2:0	3'b
						salu =4'b0000;	 //3:0	4'b
					end
			end
			6'b010111:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =1;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00;  //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b011000:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =1;
				smem =0;
				sdisplay =0;
				smemtoreg =1;
				smux32 =1;
				smux16 =2'b00;  //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b011001:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =1;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =1;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b011010:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =1;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =1;
				smux16 =2'b01; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			6'b011011:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1101;	 //3:0
			end
			6'b011100:
			begin
				halt =0;
				reset =0;
				sreg =1;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b1110;	 //3:0
			end
			6'b011101:
			begin
				halt =0;
				reset =0;
				sreg =0;
				smux5 =1;
				smem =1;
				sdisplay =0;
				smemtoreg =0;
				smux32 =1;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
			default:
			begin
				halt =0;
				reset =1;
				sreg =0;
				smux5 =0;
				smem =0;
				sdisplay =0;
				smemtoreg =0;
				smux32 =0;
				smux16 =2'b00; //1:0
				smuxPC =3'b000; //2:0
				salu =4'b0000;	 //3:0
			end
		endcase
	end

endmodule 