`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:47 04/10/2017 
// Design Name: 
// Module Name:    SCPU_ctrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SCPU_ctrl(input [5:0] OPcode,
	input[5:0] Fun,
	input MIO_ready,
	output reg RegDst,
	output reg ALUSrc_B,
	output reg MemtoReg,
	output reg Jump,
	output reg Branch,
	output reg RegWrite,
	output mem_w,
	output reg [2:0]ALU_Control,
	output reg CPU_MIO
    );
	reg [1:0] ALUop;
	reg MemRead,MemWrite;
	//reg [9:0]CPU_ctrl_signals;
`define CPU_ctrl_signals {RegDst,ALUSrc_B,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUop}
	assign mem_w=MemWrite&&(~MemRead);
	always@* begin
		case(OPcode)
		6'b000000:`CPU_ctrl_signals=10'b1001000010;//R
		6'b100011:`CPU_ctrl_signals=10'b0111100000;//lw
		6'b101011:`CPU_ctrl_signals=10'b1100010000;//sw
		6'b000100:`CPU_ctrl_signals=10'b1000001001;//beq
		6'b000010:`CPU_ctrl_signals=10'b1000000110;//jump
		6'b100100:`CPU_ctrl_signals=10'b0101000011;//slti
		6'b001000:`CPU_ctrl_signals=10'b0101000000;//addi
		default:`CPU_ctrl_signals=10'b1000000010;
		endcase
		
	end
	always@* begin
		case(ALUop)
			2'b00:ALU_Control=3'b010;//add
			2'b01:ALU_Control=3'b110;//sub
			2'b11:ALU_Control=3'b111;//slti
			2'b10:
				case(Fun)
				6'b100000:ALU_Control=3'b010;//add
				6'b100010:ALU_Control=3'b110;//sub
				6'b100100:ALU_Control=3'b000;//and
				6'b100101:ALU_Control=3'b001;//or
				6'b101010:ALU_Control=3'b111;//slt
				6'b100111:ALU_Control=3'b100;//nor
				6'b000010:ALU_Control=3'b101;//srl
				6'b010110:ALU_Control=3'b011;//xor
				default:ALU_Control=3'bx;
				endcase
		endcase
	end

endmodule
