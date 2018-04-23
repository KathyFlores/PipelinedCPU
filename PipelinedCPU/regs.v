`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:11 03/26/2017 
// Design Name: 
// Module Name:    regs 
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
module Regs(input clk,rst,L_S,
			input [4:0] R_addr_A, R_addr_B, Wt_addr,
			input [31:0] Wt_data,
			output [31:0] rdata_A, rdata_B,
			output [1023:0] Registers
    );
	reg [31:0] register [0:31];
	integer i;
	
	assign rdata_A=(R_addr_A==0)?0:register[R_addr_A];
	assign rdata_B=(R_addr_B==0)?0:register[R_addr_B];
	
	always@(negedge clk or posedge rst) begin
		if(rst==1) begin
			for(i=0;i<32;i=i+1)
				register[i]<=0;
		end
		else if((L_S==1)&&(Wt_addr!=0))
			register[Wt_addr]<=Wt_data;
	end
	assign Registers = {register[31],register[30],register[29],register[28],
						register[27],register[26],register[25],register[24],
						register[23],register[22],register[21],register[20],
						register[19],register[18],register[17],register[16],
						register[15],register[14],register[13],register[12],
						register[11],register[10],register[9],register[8],
						register[7],register[6],register[5],register[4],
						register[3],register[2],register[1],register[0]};
endmodule
