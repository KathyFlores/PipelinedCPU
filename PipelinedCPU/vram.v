`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:02:52 10/19/2017 
// Design Name: 
// Module Name:    vram 
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
module vram(input wire clk,
	input wire wea,
	input [31:0] WB_WriteData,
	input wire [31:0] addra,
	input wire [7:0] dina,
	//output reg [31:0] douta
	//input wire clkb,
	input wire [31:0] addrb,
	output reg [7:0] doutb
	);
	
	parameter
		ADDR_WIDTH = 13;
	
	reg [7:0] data [0:(1<<ADDR_WIDTH)-1];
	
	initial	begin
		$readmemh("debug.hex", data);
	end
	
	always @(negedge clk) begin
		if (wea && addra[31:ADDR_WIDTH]==0)
			data[addra[ADDR_WIDTH-1:0]] <= dina;
			
	end
	
	reg [7:0] out;
	always @(negedge clk) begin
		out <= data[addrb[ADDR_WIDTH-1:0]];
	end
	
	always @(*) begin
		if (addra[31:ADDR_WIDTH] != 0)
			doutb = 7'h0;
		else
			doutb = out;
	end
	
endmodule
