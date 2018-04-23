`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:36 10/18/2017 
// Design Name: 
// Module Name:    IdExRegister 
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
module IdExRegister(input clk,
					input rst,
					input [31:0] ID_PC,
					input [31:0] ID_inst,
					input [31:0] ID_ExtImm,
					input [31:0] ID_rdataA,
					input [31:0] ID_rdataB,
					input ID_RegWrite,
					input [1:0] ID_DataToReg,
					input ID_MemWrite,
					input [1:0]ID_PCSrc,
					input ID_ALUSrcA,
					input ID_ALUSrcB,
					input [3:0] ID_ALUcontrol,
					input [1:0] ID_RegDst,
					input IdEx_stall,
							  
					output reg [31:0] EX_PC,							  
					output reg [31:0] EX_inst,
					output reg [31:0] EX_ExtImm,
					output reg [31:0] EX_rdataA,
					output reg [31:0] EX_rdataB,
					output reg EX_RegWrite,
					output reg [1:0] EX_DataToReg,
					output reg EX_MemWrite,
					output reg [1:0] EX_PCSrc,
					output reg EX_ALUSrcA,
					output reg EX_ALUSrcB,
					output reg [3:0] EX_ALUcontrol,
					output reg [1:0] EX_RegDst);
					
	always @(posedge clk) begin
		if(rst) begin
			EX_PC<=32'h0;
			EX_inst<=32'h0;
			EX_ExtImm<=32'h0;
			EX_rdataA<=32'h0;
			EX_rdataB<=32'h0;
			EX_RegWrite<=0;
			EX_DataToReg<=2'b0;
			EX_MemWrite<=0;
			EX_PCSrc<=2'b0;
			EX_ALUSrcA<=0;
			EX_ALUSrcB<=0;
			EX_ALUcontrol<=4'b0;
			EX_RegDst<=2'b0;
		end
		else if(IdEx_stall) begin
			EX_PC<=EX_PC;
			EX_inst<=EX_inst;
			EX_ExtImm<=EX_ExtImm;
			EX_rdataA<=EX_rdataA;
			EX_rdataB<=EX_rdataB;
			EX_RegWrite<=EX_RegWrite;
			EX_DataToReg<=EX_DataToReg;
			EX_MemWrite<=EX_MemWrite;
			EX_PCSrc<=EX_PCSrc;
			EX_ALUSrcA<=EX_ALUSrcA;
			EX_ALUSrcB<=EX_ALUSrcB;
			EX_ALUcontrol<=EX_ALUcontrol;
			EX_RegDst<=EX_RegDst;
		end
		else begin
			EX_PC<=ID_PC[31:0];
			EX_inst<=ID_inst[31:0];
			EX_ExtImm<=ID_ExtImm[31:0];
			EX_rdataA<=ID_rdataA[31:0];
			EX_rdataB<=ID_rdataB[31:0];
			EX_RegWrite<=ID_RegWrite;
			EX_DataToReg<=ID_DataToReg[1:0];
			EX_MemWrite<=ID_MemWrite;
			EX_PCSrc<=ID_PCSrc[1:0];
			EX_ALUSrcA<=ID_ALUSrcA;
			EX_ALUSrcB<=ID_ALUSrcB;
			EX_ALUcontrol<=ID_ALUcontrol[3:0];
			EX_RegDst<=ID_RegDst[1:0];

		end
	end

endmodule
