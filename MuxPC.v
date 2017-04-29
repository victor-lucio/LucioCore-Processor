module MuxPC(zero, control, branch, jimmediate, jreg, PCin, PCout);
  input zero;
  input[2:0] control;
  input[31:0] branch, jimmediate, jreg;
  input [15:0] PCin;
  reg [15:0] in;
  output reg[15:0] PCout;

  always@(*)
  begin
    in = PCin + 16'd1;
    case(control)
      default: //incremento
      begin
			PCout = in;
      end
      3'b001: //BEQ
      begin
			if(zero)
				PCout = in + branch[15:0];
			else
				PCout = in;
      end
      3'b010: //BNE
      begin
			if(~zero)
				PCout = in + branch[15:0];
			else
				PCout = in;
      end
      3'b011: //Jump
      begin
			PCout = jimmediate[15:0];
      end
      3'b100: //Jump to reg
      begin
			PCout = jreg[15:0];
      end
    endcase
	end

endmodule
