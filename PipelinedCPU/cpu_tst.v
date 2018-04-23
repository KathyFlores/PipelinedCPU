`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:23:14 11/29/2017
// Design Name:   PipelinedCPU
// Module Name:   D:/ISE/forward2/Arch_02/cpu_tst.v
// Project Name:  Arch_02
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PipelinedCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cpu_tst;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] MEM_dataout;
	reg [31:0] IF_inst;

	// Outputs
	wire stall;
	wire forwardA;
	wire forwardB;
	wire [31:0] MEM_rdataB;
	wire [31:0] MEM_ALUout;
	wire [31:0] ID_inst;
	wire [31:0] EX_inst;
	wire [31:0] MEM_inst;
	wire [31:0] WB_inst;
	wire [31:0] IF_TruePC;
	wire [31:0] IF_TrueNextPC;
	wire [1023:0] Registers;
	wire [31:0] ALU_A;
	wire [31:0] ALU_B;
	wire [31:0] EX_ALUout;
	wire MEM_MemWrite;
	wire WB_RegWrite;
	wire [4:0] WB_WriteAddr;
	wire [31:0] WB_WriteData;
	wire branch;
	wire jump;
	
	// Instantiate the Unit Under Test (UUT)
	PipelinedCPU uut (
		.clk(clk), 
		.rst(rst), 
		.stall(stall),
		.branch(branch),
		.jump(jump),
		.forwardA(forwardA),
		.forwardB(forwardB),
		.MEM_dataout(MEM_dataout), 
		.MEM_rdataB(MEM_rdataB), 
		.MEM_ALUout(MEM_ALUout), 
		.IF_inst(IF_inst), 
		.ID_inst(ID_inst), 
		.EX_inst(EX_inst), 
		.MEM_inst(MEM_inst), 
		.WB_inst(WB_inst), 
		.IF_TruePC(IF_TruePC), 
		.IF_TrueNextPC(IF_TrueNextPC), 
		.Registers(Registers), 
		.ALU_A(ALU_A), 
		.ALU_B(ALU_B), 
		.EX_ALUout(EX_ALUout), 
		.MEM_MemWrite(MEM_MemWrite), 
		.WB_RegWrite(WB_RegWrite), 
		.WB_WriteAddr(WB_WriteAddr), 
		.WB_WriteData(WB_WriteData)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		MEM_dataout = 0;
		IF_inst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		//addi $1, $0, 0x1;
		IF_inst=32'b001000_00000_00001_00000_00000_000001;
		#20;
		//addi $2, $0, 0x1;
		IF_inst=32'b001000_00000_00010_00000_00000_000001;
		#20;
		//beq $1, $2, 3;
		IF_inst=32'b000100_00001_00010_00000_00000_000011;
		#20;
		IF_inst=32'h0;
		#20;
		//j 0;
		IF_inst=32'b000010_00000_00000_00000_00000_000000;
		#20;
		IF_inst=32'h0;
		#20;
		//addi $3, $0, 0x2;
		IF_inst=32'b001000_00000_00011_00000_00000_000010;
		#20;
		/*
		//add $2, $1, $1;
		IF_inst = 32'b000000_00001_00001_00010_00000_100000;
		#20;
		//add $3, $2, $1;
		IF_inst = 32'b000000_00010_00001_00011_00000_100000;
		#20;
		//add $3, $2, $1;
		IF_inst = 32'b000000_00010_00001_00011_00000_100000;
		#20;
		//lw $4,0($1);
		IF_inst=32'b100011_00001_00100_00000_00000_000000;
		#20;
		//add $5, $4, $3;
		IF_inst = 32'b000000_00100_00011_00101_00000_100000;
		#20;
		IF_inst = 32'h0;
		MEM_dataout=32'h3;
		#20;
		#60;*/
		
		
		// Add stimulus here
	
	end
    always begin
		clk = 1;#10;
		clk=0;#10;
	end
endmodule

