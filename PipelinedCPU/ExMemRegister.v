`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:03 10/18/2017 
// Design Name: 
// Module Name:    ExMemRegister 
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
module ExMemRegister(input clk,
					 input rst,
					 input [31:0] EX_BranchAddr,
					 input EX_zero,
					 input [31:0] EX_ALUout,
					 input [31:0] EX_rdataA,
					 input [31:0] EX_rdataB,
					 input [31:0] EX_inst,
					 input [31:0] EX_PC,
					 input [4:0] EX_WriteAddr,
					 input EX_RegWrite,
					 input [1:0] EX_DataToReg,
					 input EX_MemWrite,
					 input [1:0] EX_PCSrc,
					 input ExMem_stall,
					 output reg [31:0] MEM_PC,
					 output reg [31:0] MEM_BranchAddr,
					 output reg MEM_zero,
				 	 output reg [31:0] MEM_ALUout,
					 output reg [31:0] MEM_rdataA,
					 output reg [31:0] MEM_rdataB,
					 output reg [31:0] MEM_inst, 
					 output reg [4:0] MEM_WriteAddr,
					 output reg MEM_RegWrite,
					 output reg [1:0] MEM_DataToReg,
					 output reg MEM_MemWrite,
					 output reg [1:0] MEM_PCSrc
    );
	always @(posedge clk) begin
		if(rst | ExMem_stall) begin
			MEM_PC<=32'h0;
			MEM_BranchAddr <= 32'h0;
			MEM_zero <= 1'b0;
			MEM_ALUout<=32'h0;
			MEM_rdataA<=32'h0;
			MEM_rdataB<=32'h0;
			MEM_inst<=32'h0;
			MEM_WriteAddr<=5'b0;
			MEM_RegWrite<=1'b0;
			MEM_DataToReg<=2'b0;
			MEM_MemWrite<=1'b0;
			MEM_PCSrc<=2'b0;	
		end
		else begin
			MEM_PC<=EX_PC[31:0];
			MEM_BranchAddr <= EX_BranchAddr[31:0];
			MEM_zero <= EX_zero;
			MEM_ALUout<= EX_ALUout[31:0];
			MEM_rdataA<=EX_rdataA[31:0];
			MEM_rdataB<=EX_rdataB[31:0];
			MEM_WriteAddr<=EX_WriteAddr[4:0];
			MEM_RegWrite<=EX_RegWrite;
			MEM_DataToReg<=EX_DataToReg[1:0];
			MEM_MemWrite<=EX_MemWrite;
			MEM_PCSrc<=EX_PCSrc[1:0];
			MEM_inst<=EX_inst[31:0];
		end
	end

endmodule
