module PC(inaddress, outaddress, halt, clk, reset);
  input clk, reset;
  input[15:0] inaddress;
  input halt;
  reg [15:0] novo;
  output reg [15:0] outaddress;

	always@(*)
	begin
		novo = inaddress;
	end

  always@(posedge clk)
  begin
    if(halt)
      begin //faz nada
      end
    else if(reset)
      outaddress = 0;
    else
      outaddress = novo;
  end
endmodule
