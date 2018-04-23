`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:22 10/18/2017 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(input [31:0]inst,
				   //input zero,
					input [4:0] addr_rs,
					input [4:0] addr_rt,
					input [4:0] reg_addr_wb,
					input [4:0] reg_addr_mem,
					input [1:0] wb_DatatoReg,
					input [1:0] exe_DatatoReg,
					input [1:0] mem_DatatoReg,
					input mem_RegWrite,
					input wb_RegWrite,
					output reg stall,
				   output reg RegWrite,
				   output reg [1:0] DataToReg,
				   output reg MemWrite,
				   output reg [1:0] PCSrc,
				   output reg ALUSrcA,
				   output reg ALUSrcB,
				   output reg [3:0] ALUcontrol,
				   output reg [1:0] RegDst,
				   output reg SorU,
					output reg [1:0] exe_f_a,
					output reg [1:0] exe_f_b
    );
`define CPU_ctrl_signals {RegWrite,DataToReg,MemWrite,ALUSrcB,ALUcontrol,RegDst,SorU,ALUSrcA}
	wire [5:0] OPcode,Fun;
	assign OPcode=inst[31:26];
	assign Fun=inst[5:0];
	
	always@* begin
		stall <= 0;
		exe_f_a <= 2'b00;
		exe_f_b <= 2'b00;
		//如果前一条指令（非lw）修改了rs或rt寄存器的值，bypass取mem阶段的运算结果
		if(mem_RegWrite && reg_addr_mem && (reg_addr_mem == addr_rs) && (mem_DatatoReg != 2'b01))
			exe_f_a <= 2'b01;
		if(mem_RegWrite && reg_addr_mem && (reg_addr_mem == addr_rt) && (mem_DatatoReg != 2'b01))
			exe_f_b <= 2'b01;
		
		//如果前一条指令（lw）修改了rs或rt寄存器的值，首先stall，后bypass取mem阶段的运算结果
		//如果前一条指令是lw指令，并且修改的是rs或rt寄存器的值，stall
		if(mem_DatatoReg == 2'b01 && reg_addr_mem && ((reg_addr_mem == addr_rs) ||(reg_addr_mem == addr_rt)))
			stall <= 1;
		//stall以后前两条指令是lw指令，并且修改的是rs或rt寄存器的值，bypass取mem阶段的结果
		if(wb_DatatoReg == 2'b01 && reg_addr_wb && (reg_addr_wb == addr_rs) && (reg_addr_mem == 5'h0))
			exe_f_a <= 2'b10;
		if(wb_DatatoReg == 2'b01 && reg_addr_wb && (reg_addr_wb == addr_rt) && (reg_addr_mem == 5'h0))
			exe_f_b <= 2'b10;
		//如果前两条指令（非lw）修改了rs或rt寄存器的值
		if(wb_RegWrite && reg_addr_wb && (reg_addr_wb == addr_rs) && wb_DatatoReg != 2'b01 && !(mem_RegWrite && reg_addr_mem == addr_rs))
			exe_f_a <= 2'b11;
		if(wb_RegWrite && reg_addr_wb && (reg_addr_wb == addr_rt) && wb_DatatoReg != 2'b01 && !(mem_RegWrite && reg_addr_mem == addr_rt))
			exe_f_b <= 2'b11;
	end
	always@* begin
		if(inst[31:0]==32'b0)begin
			`CPU_ctrl_signals = 13'b0000x_xxxx_xx1x; PCSrc=2'b00;
			end
		else begin
		case(OPcode)
		6'h0://R
			case(Fun)
			6'h20:begin `CPU_ctrl_signals=13'b10000_0010_0010;PCSrc=2'b00;end//add
			6'h21:begin `CPU_ctrl_signals=13'b10000_1011_0010;PCSrc=2'b00;end//addu
			6'h22:begin `CPU_ctrl_signals=13'b10000_0110_0010;PCSrc=2'b00;end//sub
			6'h23:begin `CPU_ctrl_signals=13'b10000_1100_0010;PCSrc=2'b00;end//subu
			6'h24:begin `CPU_ctrl_signals=13'b10000_0000_0010;PCSrc=2'b00;end//and
			6'h25:begin `CPU_ctrl_signals=13'b10000_0001_0010;PCSrc=2'b00;end//or
			6'h26:begin `CPU_ctrl_signals=13'b10000_0011_0010;PCSrc=2'b00;end//xor
			6'h27:begin `CPU_ctrl_signals=13'b10000_0100_0010;PCSrc=2'b00;end//nor
			6'h2A:begin `CPU_ctrl_signals=13'b10000_0111_0010;PCSrc=2'b00;end//slt
			6'h2B:begin `CPU_ctrl_signals=13'b10000_1000_0010;PCSrc=2'b00;end//sltu
			6'h2:begin `CPU_ctrl_signals=13'b10001_0101_0011;PCSrc=2'b00;end//srl
			6'h0:begin `CPU_ctrl_signals=13'b10001_1001_0011;PCSrc=2'b00;end//sll
			6'h3:begin `CPU_ctrl_signals=13'b10001_1010_0011;PCSrc=2'b00;end//sra
			6'h8:begin `CPU_ctrl_signals=13'b00000_xxxx_0010;PCSrc=2'b11;end//jr
			6'h9:begin `CPU_ctrl_signals=13'b11100_xxxx_1010;PCSrc=2'b11;end//jalr
			default:begin `CPU_ctrl_signals = 13'b0xx0x_xxxx_xx1x; PCSrc=2'b00;end //nop
			//default:begin `CPU_ctrl_signals=11'b110000_0000_xxxx;Branch=2'b00;end
			endcase
		
		6'h23:begin `CPU_ctrl_signals=13'b10101_0010_0110;PCSrc=2'b00;end//lw
		6'h2B:begin `CPU_ctrl_signals=13'b00011_0010_0010;PCSrc=2'b00;end//sw
		6'h4:begin `CPU_ctrl_signals=13'b00000_0110_0010;PCSrc=2'b01;end//beq
		6'h5:begin `CPU_ctrl_signals=13'b00000_0110_0010;PCSrc=2'b01;end//bne
		6'h2:begin `CPU_ctrl_signals=13'b00000_xxxx_0010;PCSrc=2'b10;end//j
		6'h3:begin `CPU_ctrl_signals=13'b11100_xxxx_1010;PCSrc=2'b10;end//jal
		6'h8:begin `CPU_ctrl_signals=13'b10001_0010_0110;PCSrc=2'b00;end//addi
		6'h9:begin `CPU_ctrl_signals=13'b10001_1011_0110;PCSrc=2'b00;end//addiu
		6'hC:begin `CPU_ctrl_signals=13'b10001_0000_0100;PCSrc=2'b00;end//andi
		6'hD:begin `CPU_ctrl_signals=13'b10001_0001_0100;PCSrc=2'b00;end//ori
		6'hE:begin `CPU_ctrl_signals=13'b10001_0011_0100;PCSrc=2'b00;end//xori
		6'hA:begin `CPU_ctrl_signals=13'b10001_0111_0110;PCSrc=2'b00;end//slti
		6'hB:begin `CPU_ctrl_signals=13'b10001_1000_0110;PCSrc=2'b00;end//sltiu
		6'hF:begin `CPU_ctrl_signals=13'b11000_xxxx_0110;PCSrc=2'b00;end//lui
		
		
		//default:begin `CPU_ctrl_signals=11'b110000_0000_xxxx;Branch=2'b00;end
		endcase
		end
	end

endmodule
