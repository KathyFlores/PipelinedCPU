// Verilog test fixture created from schematic D:\ISE\OExp07-ExtSCPU\SCPU_More.sch - Wed Apr 26 12:13:53 2017

`timescale 1ns / 1ps

module SCPU_More_SCPU_More_sch_tb();

// Inputs
   reg MIO_ready;
   reg INT;
   reg clk;
   reg reset;
   reg [31:0] Data_in;
   reg [31:0] inst_in;

// Output
   wire [31:0] Data_out;
   wire [31:0] Addr_out;
   wire [31:0] PC_out;
   wire CPU_MIO;
   wire mem_w;

// Bidirs

// Instantiate the UUT
   SCPU_More UUT (
		.Data_out(Data_out), 
		.Addr_out(Addr_out), 
		.PC_out(PC_out), 
		.MIO_ready(MIO_ready), 
		.INT(INT), 
		.clk(clk), 
		.reset(reset), 
		.Data_in(Data_in), 
		.inst_in(inst_in), 
		.CPU_MIO(CPU_MIO), 
		.mem_w(mem_w)
   );
// Initialize Inputs
   
    initial begin
	    MIO_ready = 0;
		INT = 0;
		reset = 1;
		Data_in = 0;
		inst_in = 0;
		#20;
		reset=0;
		
		inst_in=32'h3c03f000;#20;
		inst_in=32'h3c04e000;#20;
		
		
    end
	always begin
	    clk=0;#10;
		clk=1;#10;
	end
endmodule
