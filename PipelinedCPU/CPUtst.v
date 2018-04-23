`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:58 10/18/2017
// Design Name:   PipelinedCPU
// Module Name:   D:/ISE/Arch_02/CPUtst.v
// Project Name:  Arch_02
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PipelinedCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPUtst;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	PipelinedCPU_top uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        rst=0;
		// Add stimulus here

	end
    always begin
	clk=1;#10;
	clk=0;#10;
	end
endmodule

