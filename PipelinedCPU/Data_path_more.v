`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:09 09/24/2017 
// Design Name: 
// Module Name:    Data_path_more 
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
module Data_path_more(input ALUSrc_A, 
                      input ALUSrc_B, 
                      input [3:0]ALU_Control, 
                      input [1:0]Branch, 
                      input clk, 
                      input [1:0]DatatoReg, 
                      input [31:0]Data_in, 
                      input [25:0]inst_field, 
                      input Jal, 
                      input RegDst, 
                      input RegWrite, 
                      input rst,
					  input SorU,					  
                      output [31:0]ALU_out, 
                      output [31:0]Data_out, 
                      output overflow, 
                      output [31:0]PC_out, 
                      output zero);
   
   wire [31:0] ALU_A,ALU_B,branch_pc,Imm_32,next_pc,PC_4,rdata_A,WriteDATA,ALU_out_DUMMY,Data_out_DUMMY,PC_out_DUMMY;
   wire [4:0] rt,Wt_addr;
   
   assign ALU_out[31:0] = ALU_out_DUMMY[31:0];
   assign Data_out[31:0] = Data_out_DUMMY[31:0];
   assign PC_out[31:0] = PC_out_DUMMY[31:0];
   alu  U1 (.A(ALU_A[31:0]), 
           .ALU_operation(ALU_Control[3:0]), 
           .B(ALU_B[31:0]), 
           .overflow(overflow), 
           .res(ALU_out_DUMMY[31:0]), 
           .zero(zero));
   Regs  U2 (.clk(clk), 
            .L_S(RegWrite), 
            .rst(rst), 
            .R_addr_A(inst_field[25:21]), 
            .R_addr_B(inst_field[20:16]), 
            .Wt_addr(Wt_addr[4:0]), 
            .Wt_data(WriteDATA[31:0]), 
            .rdata_A(rdata_A[31:0]), 
            .rdata_B(Data_out_DUMMY[31:0]));
   MUX2T1_5  M1 (.I0(inst_field[20:16]), 
                 .I1(5'b11111), 
                 .s(Jal), 
                 .o(rt[4:0]));
   MUX2T1_32  M2 (.I0(Data_out_DUMMY[31:0]), 
                  .I1(Imm_32[31:0]), 
                  .s(ALUSrc_B), 
                  .o(ALU_B[31:0]));
   Ext_32  M3 (.s(SorU),
			   .imm_16(inst_field[15:0]), 
               .Imm_32(Imm_32[31:0]));
   REG32  M4 (.CE(1'b1), 
              .clk(clk), 
              .D(next_pc[31:0]), 
              .rst(rst), 
              .Q(PC_out_DUMMY[31:0]));
   add_32  M5 (.a(PC_out_DUMMY[31:0]), 
               .b(32'd4), 
               .c(PC_4[31:0]));
   add_32  M6 (.a(PC_4[31:0]), 
               .b({Imm_32[29:0], 2'h0}), 
               .c(branch_pc[31:0]));
   MUX4T1_32  M7 (.I0(PC_4[31:0]), 
                  .I1(branch_pc[31:0]), 
                  .I2({PC_4[31:28], inst_field[25:0], 2'h0}), 
                  .I3(rdata_A[31:0]), 
                  .s(Branch[1:0]), 
                  .o(next_pc[31:0]));

   MUX2T1_5  M8 (.I0(rt[4:0]), 
                 .I1(inst_field[15:11]), 
                 .s(RegDst), 
                 .o(Wt_addr[4:0]));
   MUX4T1_32  M9 (.I0(ALU_out_DUMMY[31:0]), 
                  .I1(Data_in[31:0]), 
                  .I2({inst_field[15:0], 16'h0}), 
                  .I3(PC_4[31:0]), 
                  .s(DatatoReg[1:0]), 
                  .o(WriteDATA[31:0]));
   MUX2T1_32  M10 (.I0(rdata_A[31:0]), 
                   .I1(Data_out_DUMMY[31:0]), 
                   .s(ALUSrc_A), 
                   .o(ALU_A[31:0]));
endmodule

