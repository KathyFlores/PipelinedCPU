`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:47 10/18/2017 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(input wire clka,
	input wire wea,
	input wire [31:0] addra,
	input wire [31:0] dina,
	output reg [31:0] douta
	);
	
	parameter
		ADDR_WIDTH = 10;
	
	reg [31:0] data [0:(1<<ADDR_WIDTH)-1];
	
	initial	begin
		$readmemh("DataMemory.hex", data);
	end
	
	always @(negedge clka) begin
		if (wea && addra[31:ADDR_WIDTH]==0)
			data[addra[ADDR_WIDTH-1:0]] <= dina;
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
