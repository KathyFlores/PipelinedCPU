`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:34 04/25/2017 
// Design Name: 
// Module Name:    SCPU_ctrl_more 
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
module SCPU_ctrl_more(input [5:0] OPcode,
	input[5:0] Fun,
	input MIO_ready,
	input zero,
	output reg RegDst,
	output reg ALUSrc_A,
	output reg ALUSrc_B,
	output reg [1:0] DatatoReg,
	output reg Jal,
	output reg [1:0] Branch,
	output reg RegWrite,
	output mem_w,
	output reg SorU,
	output reg [3:0]ALU_Control,
	output reg CPU_MIO
    );
	//reg [1:0] ALUop;
	reg MemRead,MemWrite;
	//reg [9:0]CPU_ctrl_signals;
`define CPU_ctrl_signals {SorU,RegDst,ALUSrc_A,ALUSrc_B,DatatoReg,Jal,RegWrite,MemRead,MemWrite,ALU_Control}
	assign mem_w=MemWrite&&(~MemRead);
	always@* begin
		case(OPcode)
		6'h0://R
			case(Fun)
			6'h20:begin `CPU_ctrl_signals=14'b110000_0100_0010;Branch=2'b00;end//add
			6'h21:begin `CPU_ctrl_signals=14'b110000_0100_1011;Branch=2'b00;end//addu
			6'h22:begin `CPU_ctrl_signals=14'b110000_0100_0110;Branch=2'b00;end//sub
			6'h23:begin `CPU_ctrl_signals=14'b110000_0100_1100;Branch=2'b00;end//subu
			6'h24:begin `CPU_ctrl_signals=14'b110000_0100_0000;Branch=2'b00;end//and
			6'h25:begin `CPU_ctrl_signals=14'b110000_0100_0001;Branch=2'b00;end//or
			6'h26:begin `CPU_ctrl_signals=14'b110000_0100_0011;Branch=2'b00;end//xor
			6'h27:begin `CPU_ctrl_signals=14'b110000_0100_0100;Branch=2'b00;end//nor
			6'h2A:begin `CPU_ctrl_signals=14'b110000_0100_0111;Branch=2'b00;end//slt
			6'h2B:begin `CPU_ctrl_signals=14'b110000_0100_1000;Branch=2'b00;end//sltu
			6'h2:begin `CPU_ctrl_signals=14'b111100_0100_0101;Branch=2'b00;end//srl
			6'h0:begin `CPU_ctrl_signals=14'b111100_0100_1001;Branch=2'b00;end//sll
			6'h3:begin `CPU_ctrl_signals=14'b111100_0100_1010;Branch=2'b00;end//sra
			6'h8:begin `CPU_ctrl_signals=14'b110000_0000_xxxx;Branch=2'b11;end//jr
			6'h9:begin `CPU_ctrl_signals=14'b110011_0100_xxxx;Branch=2'b11;end//jalr
			default:begin `CPU_ctrl_signals=14'b110000_0000_xxxx;Branch=2'b00;end
			endcase
		6'h8:begin `CPU_ctrl_signals=14'b100100_0100_0010;Branch=2'b00;end//addi
		6'h9:begin `CPU_ctrl_signals=14'b100100_0100_1011;Branch=2'b00;end//addiu
		6'hC:begin `CPU_ctrl_signals=14'b000100_0100_0000;Branch=2'b00;end//andi
		6'hD:begin `CPU_ctrl_signals=14'b000100_0100_0001;Branch=2'b00;end//ori
		6'hE:begin `CPU_ctrl_signals=14'b000100_0100_0011;Branch=2'b00;end//xori
		6'hF:begin `CPU_ctrl_signals=14'b100110_0100_xxxx;Branch=2'b00;end//lui
		6'h23:begin `CPU_ctrl_signals=14'b100101_0110_0010;Branch=2'b00;end//lw
		6'h2B:begin `CPU_ctrl_signals=14'b100100_0001_0010;Branch=2'b00;end//sw
		6'h4:begin `CPU_ctrl_signals=14'b100000_0000_0110;Branch=zero?2'b01:2'b00;end//beq
		6'h5:begin `CPU_ctrl_signals=14'b100000_0000_0110;Branch=zero?2'b00:2'b01;end//bne
		6'hA:begin `CPU_ctrl_signals=14'b100100_0100_0111;Branch=2'b00;end//slti
		6'hB:begin `CPU_ctrl_signals=14'b100100_0100_1000;Branch=2'b00;end//sltiu
		6'h2:begin `CPU_ctrl_signals=14'b100100_0000_xxxx;Branch=2'b10;end//j
		6'h3:begin `CPU_ctrl_signals=14'b100111_1100_xxxx;Branch=2'b10;end//jal
		default:begin `CPU_ctrl_signals=14'b110000_0000_xxxx;Branch=2'b00;end
		endcase
	end
endmodule

