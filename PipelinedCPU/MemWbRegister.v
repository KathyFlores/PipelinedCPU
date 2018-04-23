`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:11 10/18/2017 
// Design Name: 
// Module Name:    MemWbRegister 
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
module MemWbRegister(input clk,
	                 input rst,
					 input [31:0] MEM_dataout,
					 input [31:0] MEM_ALUout,
					 input [4:0] MEM_WriteAddr,
					 input MEM_RegWrite,
					 input [1:0] MEM_DataToReg,
					 input [31:0] MEM_inst,
					 input [31:0] MEM_PC,
					 input MEM_MemWrite,
					 output reg WB_MemWrite,
					 output	reg [31:0] WB_dataout,
					 output	reg [31:0] WB_ALUout,
					 output	reg [4:0] WB_WriteAddr,
					 output reg WB_RegWrite,
					 output reg [1:0] WB_DataToReg,
					 output reg [31:0] WB_inst,
					 output reg [31:0] WB_PC
    );
	always @(posedge clk) begin
		if(rst) begin
			WB_dataout<=32'h0;
			WB_ALUout<=32'h0;
			WB_WriteAddr<=5'h0;
			WB_RegWrite<=1'b0;
			WB_DataToReg<=2'b0;
			WB_inst<=32'h0;
			WB_PC<=32'h0;
			WB_MemWrite<=1'b0;
		end
		else begin
			WB_dataout<=MEM_dataout[31:0];
			WB_ALUout<=MEM_ALUout[31:0];
			WB_WriteAddr<=MEM_WriteAddr[4:0];
			WB_RegWrite<=MEM_RegWrite;
			WB_DataToReg<=MEM_DataToReg[1:0];
			WB_inst<=MEM_inst[31:0];
			WB_PC<=MEM_PC[31:0];
			WB_MemWrite<=MEM_MemWrite;

		end
	end

endmodule
