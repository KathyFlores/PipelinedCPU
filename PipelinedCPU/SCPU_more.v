`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:49:42 09/24/2017 
// Design Name: 
// Module Name:    SCPU_more 
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
module SCPU_More(input clk,
				 input [31:0] Data_in,
				 input [31:0] inst_in,
				 input INT,
				 input MIO_ready,
				 input reset,
				 output [31:0] Addr_out,
				 output CPU_MIO,
				 output [31:0] Data_out,
				 output mem_w,
				 output [31:0] PC_out);

   wire [2:0] ALU_Control;
   wire [1:0] Branch,DatatoReg;
   wire ALUSrc_A,ALUSrc_B,Jal,RegDst,RegWrite,zero,SorU;
   
   SCPU_ctrl_more  ctrl (.Fun(inst_in[5:0]), 
                        .MIO_ready(MIO_ready), 
                        .OPcode(inst_in[31:26]), 
                        .zero(zero), 
                        .ALUSrc_A(ALUSrc_A), 
                        .ALUSrc_B(ALUSrc_B), 
                        .ALU_Control(ALU_Control[2:0]), 
                        .Branch(Branch[1:0]), 
                        .CPU_MIO(CPU_MIO), 
                        .DatatoReg(DatatoReg[1:0]), 
                        .Jal(Jal), 
                        .mem_w(mem_w), 
                        .RegDst(RegDst), 
                        .RegWrite(RegWrite),
						.SorU(SorU));
   Data_path_more path (.ALUSrc_A(ALUSrc_A), 
                        .ALUSrc_B(ALUSrc_B), 
                        .ALU_Control(ALU_Control[2:0]), 
                        .Branch(Branch[1:0]), 
                        .clk(clk), 
                        .DatatoReg(DatatoReg[1:0]), 
                        .Data_in(Data_in[31:0]), 
                        .inst_field(inst_in[25:0]), 
                        .Jal(Jal), 
                        .RegDst(RegDst), 
                        .RegWrite(RegWrite), 
                        .rst(reset), 
                        .ALU_out(Addr_out[31:0]), 
                        .Data_out(Data_out[31:0]), 
                        .overflow(), 
                        .PC_out(PC_out[31:0]), 
                        .zero(zero),
						.SorU(SorU));
endmodule

