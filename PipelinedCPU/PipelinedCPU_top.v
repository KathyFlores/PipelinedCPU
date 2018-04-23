`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:29:17 10/18/2017 
// Design Name: 
// Module Name:    PipelinedCPU_top 
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
module PipelinedCPU_top(input clk,
						input rst,
						output stall,
						output branch,
						output jump,
						output forwardA,
						output forwardB,
						output [31:0]IF_inst,
				 		output [31:0]ID_inst,
						output [31:0]EX_inst,
						output [31:0]MEM_inst,
						output [31:0]WB_inst,
						output [31:0]IF_PC,
						output [31:0]IF_NPC,
						output [1023:0]Registers,
						output [31:0]ALU_A,
						output [31:0]ALU_B,
						output [31:0]EX_ALUout,
						output MEM_MemWrite,
						output [9:0]MEM_WriteAddr,
						output [31:0]MEM_WriteData,
						output [31:0]MEM_DataOut,
						output WB_RegWrite,
						output [4:0]WB_WriteAddr,
						output [31:0]WB_WriteData
    );
	wire MEM_MemWrite;
	wire [31:0] MEM_ALUout;
	assign MEM_WriteAddr = MEM_ALUout[11:2];
	PipelinedCPU PipelinedCPU(.clk(clk),
							  .rst(rst),
							  .MEM_dataout(MEM_DataOut[31:0]),
							  .MEM_ALUout(MEM_ALUout[31:0]),
							  .IF_TruePC(IF_PC[31:0]),
							  .IF_inst(IF_inst[31:0]),
				        	  .ID_inst(ID_inst[31:0]),
				        	  .EX_inst(EX_inst[31:0]),
				        	  .MEM_inst(MEM_inst[31:0]),
				        	  .WB_inst(WB_inst[31:0]),
				        	  //.IF_PCout(IF_PC[31:0]),
				        	  .IF_TrueNextPC(IF_NPC[31:0]),
				        	  .Registers(Registers[1023:0]),
				        	  .ALU_A(ALU_A[31:0]),
				        	  .ALU_B(ALU_B[31:0]),
							  .forwardA(forwardA),
							  .forwardB(forwardB),
							  .stall(stall),
							  .branch(branch),
							  .jump(jump),
				        	  .EX_ALUout(EX_ALUout[31:0]),
				        	  .MEM_MemWrite(MEM_MemWrite),
				        	  .WB_RegWrite(WB_RegWrite),
				        	  .WB_WriteAddr(WB_WriteAddr[4:0]),
							  .WB_WriteData(WB_WriteData[31:0]),
				        	  .MEM_rdataB(MEM_WriteData[31:0]));
	InstructionMemory IM(.a(IF_PC[11:2]),
						 .spo(IF_inst[31:0]));
	DataMemory DM(.clka(clk),
				  .wea(MEM_MemWrite),
				  .addra(MEM_WriteAddr[9:0]),
				  .dina(MEM_WriteData[31:0]),
				  .douta(MEM_DataOut[31:0]));					 
endmodule
