`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:03 10/11/2017 
// Design Name: 
// Module Name:    PipelinedCPU 
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
module PipelinedCPU(input clk,
					input rst,
					input [31:0] MEM_dataout,
					output forwardA,
					output forwardB,
					output stall,
					output [31:0] MEM_rdataB,
					output [31:0] MEM_ALUout,
					input [31:0]IF_inst,
				 	output [31:0]ID_inst,
					output [31:0]EX_inst,
					output [31:0]MEM_inst,
					output [31:0]WB_inst,
					output [31:0]IF_TruePC,
					output [31:0]IF_TrueNextPC,
					output [1023:0]Registers,
					output [31:0]ALU_A,
					output [31:0]ALU_B,
					output [31:0]EX_ALUout,
					output MEM_MemWrite,
					//output [9:0]MEM_WriteAddr,
					//output [31:0]MEM_WriteData,
					//output [31:0]MEM_DataOut,
					output branch,
					output jump,
					output WB_RegWrite,
					output [4:0]WB_WriteAddr,
					output [31:0]WB_WriteData
    );

	
	//IF:
	wire [31:0] IF_PCout,IF_PC_4,IF_nextPC;
	
	wire [31:0] ID_PC,ID_rdataA,ID_rdataB,ID_ExtImm;
	wire [3:0] ID_ALUcontrol;
	wire [1:0] ID_RegDst,ID_PCSrc,ID_DataToReg;
	wire ID_RegWrite,ID_MemWrite,ID_ALUSrcA,ID_ALUSrcB,ID_SorU;
	
	wire [31:0] EX_JumpAddr,EX_ExtImm,EX_rdataA,EX_rdataB,EX_PC,EX_BranchAddr;
	wire [4:0] EX_WriteAddr;
	wire [3:0] EX_ALUcontrol;
	wire [1:0] EX_RegDst,EX_PCSrc,EX_DataToReg;
	wire EX_RegWrite,EX_MemWrite,EX_ALUSrcB,EX_overflow,EX_zero;
	
	wire [31:0] MEM_rdataA,MEM_BranchAddr,MEM_PC,MEM_JumpAddr;
	wire [4:0] MEM_WriteAddr;
	wire [1:0] MEM_PCSrc,MEM_DataToReg;
	wire MEM_RegWrite,MEM_zero;

	wire [31:0] WB_ALUout,WB_dataout,WB_PC;
	
	wire [1:0] WB_DataToReg;
	
	wire [1:0] exe_f_A;
	wire [1:0] exe_f_B;
	
	wire [31:0] EX_rdata_Af;
	wire [31:0] EX_rdata_Bf;
	wire [31:0] BranchAddr;
	REG32 PC(.clk(clk),
			 .rst(rst), 
			 .CE(1'b1), 
			 .PC_stall(stall),
			 .D(IF_TrueNextPC[31:0]), 
			 .Q(IF_PCout[31:0]));
	//assign IF_TruePC[31:0]=(branch==1'b1)?IF_nextPC[31:0]:IF_PCout[31:0];
	assign jump = (EX_PCSrc[1:0]==2'b01&&branch==1'b1)||(EX_PCSrc[1]==1'b1);
	assign IF_TruePC[31:0]=jump?IF_nextPC[31:0]:IF_PCout[31:0];
	assign IF_TrueNextPC[31:0]=jump?IF_TruePC[31:0]+32'h4:IF_nextPC[31:0];
	add_32 adder1(.a(IF_TruePC[31:0]), 
				 .b(32'd4), 
				 .c(IF_PC_4[31:0]));
	assign BranchAddr = (branch==1'b1)? EX_BranchAddr[31:0]:IF_PC_4[31:0];			 	
	
	MUX4T1_32 M1(.I0(IF_PC_4[31:0]), 
			     .I1(BranchAddr[31:0]),
				 .I2(EX_JumpAddr[31:0]),
				 .I3(EX_rdataA[31:0]),
				 .s(EX_PCSrc[1:0]),
				 .o(IF_nextPC[31:0]));
									 
	IfIdRegister IfIdRegister(.clk(clk),
							  .rst(rst),
							  .IF_PC(IF_PC_4[31:0]), //???
							  .IF_inst(IF_inst[31:0]),
							  .IfId_stall(stall),
							  .ID_PC(ID_PC[31:0]), 
							  .ID_inst(ID_inst[31:0]));
	
	//ID:
	
	Regs Regs(.clk(clk), 
			  .L_S(WB_RegWrite), 
              .rst(rst), 
              .R_addr_A(ID_inst[25:21]), //rs
              .R_addr_B(ID_inst[20:16]), //rt
              .Wt_addr(WB_WriteAddr[4:0]), 
              .Wt_data(WB_WriteData[31:0]), 
              .rdata_A(ID_rdataA[31:0]), 
              .rdata_B(ID_rdataB[31:0]),
			  .Registers(Registers[1023:0]));
	
	Ext_32 Ext(.s(ID_SorU),
			   .imm_16(ID_inst[15:0]), 
               .Imm_32(ID_ExtImm[31:0]));
	
	ControlUnit ControlUnit(.inst(ID_inst[31:0]),
							 //.zero(EX_zero),
							 
							 .addr_rs(EX_inst[25:21]),
							 .addr_rt(EX_inst[20:16]),
							 .reg_addr_wb(WB_WriteAddr[4:0]),
							 .reg_addr_mem(MEM_WriteAddr[4:0]),
							 .wb_DatatoReg(WB_DataToReg[1:0]),
							 .exe_DatatoReg(EX_DataToReg[1:0]),
							 .mem_DatatoReg(MEM_DataToReg[1:0]),
							 .mem_RegWrite(MEM_RegWrite),
							 .wb_RegWrite(WB_RegWrite),
						    .RegWrite(ID_RegWrite),
						    .DataToReg(ID_DataToReg[1:0]),
						    .MemWrite(ID_MemWrite),
						    .PCSrc(ID_PCSrc[1:0]),
						    .ALUSrcB(ID_ALUSrcB),
						    .ALUSrcA(ID_ALUSrcA),
						    .ALUcontrol(ID_ALUcontrol[3:0]),
						    .RegDst(ID_RegDst[1:0]),
						    .SorU(ID_SorU),
							
							 .exe_f_a(exe_f_A),
							 .exe_f_b(exe_f_B),
							 .stall(stall)
							 );
	
	IdExRegister IdExRegister(.clk(clk),
							  .rst(rst),
							  .ID_PC(ID_PC[31:0]),
							  .ID_inst(ID_inst[31:0]),
							  .ID_ExtImm(ID_ExtImm[31:0]),
							  .ID_rdataA(ID_rdataA[31:0]),
							  .ID_rdataB(ID_rdataB[31:0]),
							  .ID_RegWrite(ID_RegWrite),
						      .ID_DataToReg(ID_DataToReg[1:0]),
							  .ID_MemWrite(ID_MemWrite),
						      .ID_PCSrc(ID_PCSrc[1:0]),
							  .ID_ALUSrcA(ID_ALUSrcA),
						      .ID_ALUSrcB(ID_ALUSrcB),
							  .ID_ALUcontrol(ID_ALUcontrol[3:0]),
							  .ID_RegDst(ID_RegDst[1:0]),
							  .IdEx_stall(stall),
							  
							  .EX_PC(EX_PC[31:0]),							  
							  .EX_inst(EX_inst[31:0]),
							  .EX_ExtImm(EX_ExtImm[31:0]),
							  .EX_rdataA(EX_rdataA[31:0]),
							  .EX_rdataB(EX_rdataB[31:0]),
							  .EX_RegWrite(EX_RegWrite),
						      .EX_DataToReg(EX_DataToReg[1:0]),
							  .EX_MemWrite(EX_MemWrite),
						      .EX_PCSrc(EX_PCSrc[1:0]),
							  .EX_ALUSrcA(EX_ALUSrcA),
						      .EX_ALUSrcB(EX_ALUSrcB),
							  .EX_ALUcontrol(EX_ALUcontrol[3:0]),
							  .EX_RegDst(EX_RegDst[1:0]));
	
	//EX:
	assign EX_JumpAddr = {EX_PC[31:28],EX_inst[25:0],2'b0};
	
	add_32 adder2(.a(EX_PC[31:0]), 
				  .b({EX_ExtImm[29:0],2'h0}), 
				  .c(EX_BranchAddr[31:0]));
	assign branch = (ALU_A==ALU_B&&EX_inst[31:26]==6'h4)?1'b1://beq
					(ALU_A!=ALU_B&&EX_inst[31:26]==6'h5)?1'b1://bne
					1'b0;
	//predict not-taken 
	//If branch condition is satisfied, then clear the executed instruction
	//assign stall = (branch==1'b1)? 1'b1 : 1'b0;
	assign forwardA = (exe_f_A==2'b00)? 1'b0:1'b1;	
	assign forwardB = (exe_f_B==2'b00)? 1'b0:1'b1;		
	MUX4T1_32 Mfa(.I0(EX_rdataA[31:0]),
					 .I1(MEM_ALUout[31:0]),
					 .I2(MEM_dataout[31:0]),
					 .I3(WB_WriteData[31:0]),
					 .s(exe_f_A[1:0]),
					 .o(EX_rdata_Af[31:0]));
					 
	MUX4T1_32 Mfb(.I0(EX_rdataB[31:0]),
					 .I1(MEM_ALUout[31:0]),
					 .I2(MEM_dataout[31:0]),
					 .I3(WB_WriteData[31:0]),
					 .s(exe_f_B[1:0]),
					 .o(EX_rdata_Bf[31:0]));
					 
	MUX2T1_32 M2(.I0(EX_rdata_Bf[31:0]), 
			     .I1(EX_ExtImm[31:0]), 
				 .s(EX_ALUSrcB),
				 .o(ALU_B[31:0]));
	MUX4T1_5 M00(.I0(EX_inst[15:11]),//rd
				 .I1(EX_inst[20:16]),//rt
				 .I2(5'b11111),
				 .I3(),
				 .s(EX_RegDst[1:0]),
				 .o(EX_WriteAddr));
	//assign EX_WriteAddr=(EX_RegDst==1)?EX_inst[20:16]/*rt*/:EX_inst[15:11]/*rd*/;
	assign ALU_A=(EX_ALUSrcA==0)?EX_rdata_Af[31:0]:EX_rdata_Bf[31:0];
	
	alu alu(.A(ALU_A[31:0]), 
            .ALU_operation(EX_ALUcontrol[3:0]), 
            .B(ALU_B[31:0]), 
            .overflow(EX_overflow), 
            .res(EX_ALUout[31:0]), 
            .zero(EX_zero));
			
	ExMemRegister ExMemRegister(.clk(clk),
								.rst(rst),
								.EX_BranchAddr(EX_BranchAddr[31:0]),
								.EX_zero(EX_zero),
								.EX_ALUout(EX_ALUout[31:0]),
								.EX_rdataA(EX_rdataA[31:0]),
								.EX_rdataB(EX_rdataB[31:0]),
								.EX_inst(EX_inst[31:0]),
								.EX_WriteAddr(EX_WriteAddr[4:0]),
								.EX_RegWrite(EX_RegWrite),
								.EX_DataToReg(EX_DataToReg[1:0]),
								.EX_MemWrite(EX_MemWrite),
								.EX_PCSrc(EX_PCSrc[1:0]),
								.EX_PC(EX_PC[31:0]),
								.ExMem_stall(stall),
								.MEM_PC(MEM_PC[31:0]),
								.MEM_BranchAddr(MEM_BranchAddr[31:0]),
								.MEM_zero(MEM_zero),
								.MEM_ALUout(MEM_ALUout[31:0]),
								.MEM_rdataA(MEM_rdataA[31:0]),
								.MEM_rdataB(MEM_rdataB[31:0]),
								.MEM_inst(MEM_inst[31:0]),
								.MEM_WriteAddr(MEM_WriteAddr[4:0]),
								.MEM_RegWrite(MEM_RegWrite),
								.MEM_DataToReg(MEM_DataToReg[1:0]),
								.MEM_MemWrite(MEM_MemWrite),
								.MEM_PCSrc(MEM_PCSrc[1:0]));		
								
							
	//MEM:
	
	
	//assign MEM_JumpCond = MEM_branch && MEM_zero;
	
	
	
	MemWbRegister MemWbRegister(.clk(clk),
	                            .rst(rst),
								.MEM_dataout(MEM_dataout[31:0]),
								.MEM_ALUout(MEM_ALUout[31:0]),
								.MEM_WriteAddr(MEM_WriteAddr[4:0]),
								.MEM_RegWrite(MEM_RegWrite),
								.MEM_DataToReg(MEM_DataToReg[1:0]),
								.MEM_inst(MEM_inst[31:0]),
								.MEM_PC(MEM_PC[31:0]),
								.MEM_MemWrite(MEM_MemWrite),
								.WB_MemWrite(WB_MemWrite),
								.WB_dataout(WB_dataout[31:0]),
								.WB_ALUout(WB_ALUout[31:0]),
								.WB_WriteAddr(WB_WriteAddr[4:0]),
								.WB_RegWrite(WB_RegWrite),
								.WB_DataToReg(WB_DataToReg[1:0]),
								.WB_inst(WB_inst[31:0]),
								.WB_PC(WB_PC[31:0]));
						
	//WB:

	MUX4T1_32 M3(.I0(WB_ALUout[31:0]), 
			     .I1(WB_dataout[31:0]),
				 .I2({WB_inst[15:0], 16'h0}),
				 .I3(WB_PC[31:0]),
				 .s(WB_DataToReg[1:0]),
				 .o(WB_WriteData[31:0]));
endmodule
