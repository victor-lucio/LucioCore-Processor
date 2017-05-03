module CPU(clk, halt, reset, sreg, smux5, smux16, smux32, smuxPC, salu, smem, sdisplay, smemtoreg, display, switches, out1, out2, out3, muxMemtoreg_reg, newpc, pc_instmem, negative);

	input clk, halt, reset, sreg, smux5, smem, sdisplay, smemtoreg, smux32;
	input [1:0] smux16;
	input [2:0] smuxPC;
	input [3:0] salu;
	output wire [15:0] newpc;
	input [15:0] switches;
	output wire [15:0] pc_instmem;
	wire [31:0] mux32_alu;
	wire [31:0] inst;
	wire [4:0] mux5_reg;
	wire [15:0] mux16_se16;
	wire [31:0] se26_muxpc, se16_muxpc;
	wire [31:0] saidaalu;
	wire [31:0] A, B;
	wire [31:0] mem_muxMemtoreg;
	output wire [31:0] muxMemtoreg_reg;
	output wire [31:0] display;
	wire zero, of;
	output wire [6:0] out1, out2, out3;
	output wire negative;

	PC instPC(.inaddress(newpc), .outaddress(pc_instmem), .halt(halt), .clk(clk), .reset(reset));
	
	InstMem instInstMem(.address(pc_instmem), .clk(clk), .out(inst));
	
	Mux5 instMux5(.flag(smux5), .dataA(inst[15:11]), .dataB(inst[20:16]), .out(mux5_reg));
	
	Mux16 instMux16(.flag(smux16), .PC(pc_instmem), .switches(switches), .immediate(inst[15:0]), .out(mux16_se16));
	
	Mux32 instMux32(.flag(smux32), .dataA(B), .dataB(se16_muxpc), .out(mux32_alu));
	
	RegBank instRegBank(.writeflag(sreg), .writedata(muxMemtoreg_reg), .clk(clk), .readregA(inst[25:21]),
						.readregB(inst[20:16]), .writereg(mux5_reg), .dataA(A),
						.dataB(B));
	
	SE26 instSE26(.datain(inst[25:0]), .dataout(se26_muxpc));
	
	SE16 instSE16(.datain(mux16_se16), .dataout(se16_muxpc));
	
	ALU instALU(.operation(salu), .dataA(A), .dataB(mux32_alu), .saida(saidaalu), .zero(zero), .shamt(inst[10:6]), .of(of));
	
	DataMem instDataMem(.clk(clk), .writeflag(smem), .address(saidaalu), .datain(B), .dataout(mem_muxMemtoreg), .displayflag(sdisplay), .display(display));
	
	Mux32 Memtoreg(.flag(smemtoreg), .dataA(saidaalu), .dataB(mem_muxMemtoreg), .out(muxMemtoreg_reg));
	
	MuxPC instMuxPC(.zero(zero), .control(smuxPC), .branch(se16_muxpc), .jimmediate(se26_muxpc), .jreg(A), .PCin(pc_instmem), .PCout(newpc));
	
	OutputModule instOutputModule(.in(display), .out1(out1), .out2(out2), .out3(out3), .negative(negative));
	

endmodule 