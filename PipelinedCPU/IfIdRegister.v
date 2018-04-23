`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:41 10/18/2017 
// Design Name: 
// Module Name:    IfIdRegister 
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
module IfIdRegister(input clk,
					input rst,
					input [31:0] IF_PC,
					input [31:0] IF_inst,
					input IfId_stall,
					output reg [31:0] ID_PC,
					output reg [31:0] ID_inst
    );
	
	always @(posedge clk) begin
		if(rst) begin
			ID_PC<=32'h0;
			ID_inst<=32'h0;
		end
		else if(IfId_stall == 1) begin
			ID_PC<=ID_PC;
			ID_inst <= ID_inst;
		end
		else begin
			ID_PC<=IF_PC[31:0];
			ID_inst<=IF_inst[31:0];
		end
	end
endmodule
