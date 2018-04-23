`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:12 04/26/2017
// Design Name:   SCPU_ctrl_more
// Module Name:   D:/ISE/OExp07-ExtSCPU/scpu_ctrl_sim.v
// Project Name:  OExp07-ExtSCPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SCPU_ctrl_more
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module scpu_ctrl_sim;

	// Inputs
	reg [5:0] OPcode;
	reg [5:0] Fun;
	reg MIO_ready;
	reg zero;

	// Outputs
	wire RegDst;
	wire ALUSrc_A;
	wire ALUSrc_B;
	wire [1:0] DatatoReg;
	wire Jal;
	wire [1:0] Branch;
	wire RegWrite;
	wire mem_w;
	wire [2:0] ALU_Control;
	wire CPU_MIO;

	// Instantiate the Unit Under Test (UUT)
	SCPU_ctrl_more uut (
		.OPcode(OPcode), 
		.Fun(Fun), 
		.MIO_ready(MIO_ready), 
		.zero(zero), 
		.RegDst(RegDst), 
		.ALUSrc_A(ALUSrc_A), 
		.ALUSrc_B(ALUSrc_B), 
		.DatatoReg(DatatoReg), 
		.Jal(Jal), 
		.Branch(Branch), 
		.RegWrite(RegWrite), 
		.mem_w(mem_w), 
		.ALU_Control(ALU_Control), 
		.CPU_MIO(CPU_MIO)
	);

	initial begin
		// Initialize Inputs
		OPcode = 0;
		Fun = 0;
		MIO_ready = 0;
		zero = 0;
		#20;
        
		Fun = 6'b100000;#20;//add
		Fun = 6'b100010;#20;//sub
		Fun = 6'b100100;#20;//and
		Fun = 6'b100101;#20;//or
		Fun = 6'b100110;#20;//xor
		Fun = 6'b100111;#20;//nor
		Fun = 6'b101010;#20;//slt
		Fun = 6'b000010;#20;//srl
		Fun = 6'b001000;#20;//jr
		Fun = 6'b001001;#20;//jalr
		
		Fun = 0; 
		OPcode = 6'b001000;#20;//addi
		OPcode = 6'b001100;#20;//andi
		OPcode = 6'b001101;#20;//ori
		OPcode = 6'b001110;#20;//xori
		OPcode = 6'b001111;#20;//lui
		OPcode = 6'b100011;#20;//lw
		OPcode = 6'b101011;#20;//sw
		OPcode = 6'b000100;#20;//beq
		OPcode = 6'b000101;#20;//bne
		OPcode = 6'b001010;#20;//slti
		OPcode = 6'b000010;#20;//j
		OPcode = 6'b000011;#20;//jal
	end
      
endmodule

