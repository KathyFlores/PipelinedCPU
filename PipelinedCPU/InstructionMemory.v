`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:14 10/18/2017 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(input wire clka,
	input wire [31:0] addra,
	output reg [31:0] douta
    );

	
	parameter
		ADDR_WIDTH = 10;
	
	reg [31:0] data [0:(1<<ADDR_WIDTH)-1];
	
	initial	begin
		$readmemh("InstructionMemory.hex", data);
	end
	
	reg [31:0] out;
	always @(negedge clka) begin
		out <= data[addra[ADDR_WIDTH-1:0]];
	end
	
	always @(*) begin
		if (addra[31:ADDR_WIDTH] != 0)
			douta = 32'h0;
		else
			douta = out;
	end
	
endmodule

