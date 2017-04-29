module Mux16(flag, PC, switches, immediate, out);

	input[1:0] flag;
	input[15:0] PC;
	input[15:0] switches, immediate;
	output reg[15:0] out;

always@(*)
	begin
	case(flag)
		default: //immediate
			out = immediate;
		2'b01: //PC
			out = PC;
		2'b10: //switches
			out = switches;
		endcase
  end
endmodule
