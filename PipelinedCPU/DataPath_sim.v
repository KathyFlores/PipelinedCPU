// Verilog test fixture created from schematic D:\ISE\OExp07-ExtSCPU\Data_path_more.sch - Wed Apr 26 19:48:20 2017

`timescale 1ns / 1ps

module Data_path_more_Data_path_more_sch_tb();

// Inputs
   reg [1:0] Branch;
   reg clk;
   reg rst;
   reg [2:0] ALU_Control;
   reg ALUSrc_B;
   reg RegWrite;
   reg Jal;
   reg [1:0] DatatoReg;
   reg [25:0] inst_field;
   reg [31:0] Data_in;
   reg RegDst;
   reg ALUSrc_A;

// Output
   wire [31:0] PC_out;
   wire [31:0] ALU_out;
   wire [31:0] Data_out;
   wire zero;
   wire overflow;

// Bidirs

// Instantiate the UUT
   Data_path_more UUT (
		.PC_out(PC_out), 
		.Branch(Branch), 
		.clk(clk), 
		.rst(rst), 
		.ALU_out(ALU_out), 
		.Data_out(Data_out), 
		.ALU_Control(ALU_Control), 
		.ALUSrc_B(ALUSrc_B), 
		.RegWrite(RegWrite), 
		.Jal(Jal), 
		.DatatoReg(DatatoReg), 
		.inst_field(inst_field), 
		.Data_in(Data_in), 
		.zero(zero), 
		.overflow(overflow), 
		.RegDst(RegDst), 
		.ALUSrc_A(ALUSrc_A)
   );
// Initialize Inputs
    initial begin
	`define signals {RegDst,ALUSrc_A,ALUSrc_B,DatatoReg,Jal,Branch,RegWrite,ALU_Control}
		Branch = 0;
		clk = 0;
		rst = 1;
		ALU_Control = 0;
		ALUSrc_B = 0;
		RegWrite = 0;
		Jal = 0;
		DatatoReg = 0;
		inst_field = 0;
		Data_in = 0;
		RegDst = 0;
		ALUSrc_A = 0;
		#20;
		
		rst=0;
		//add $t0,$zero,$zero;
		`signals=12'b100000001010;
		inst_field=26'b00000000000100000000100000;
		#20;
		//ori $t1, $zero, 15;
		`signals=12'b001000001001;
		inst_field=26'b00000010010000000000001111;
		#20;
		//slt $t2,$t0,$t1;
		`signals=12'b100000001111;
		inst_field=26'b01000010010101000000101010;
		#20;
		//sub $t3,$t1,$t2;
		`signals=12'b100000001110;
		inst_field=26'b01001010100101100000100010;
		#20;
		//or $t4,$t1,$t2;
		`signals=12'b100000001001;
		inst_field=26'b01001010100110000000100101;
		#20;
		//and $t5,$t1,$t3;
		`signals=12'b100000001000;
		inst_field=26'b01001010110110100000100100;
		#20;
		//xor $t6,$t1,$t2;
		`signals=12'b100000001011;
		inst_field=26'b01001010100111000000100110;
		#20;
		//nor $t1,$zero,$t3;
		`signals=12'b100000001100;
		inst_field=26'b00000010110100100000100111;
		#20;
		//srl $t3,$t3,2;
		`signals=12'b111000001101;
		inst_field=26'b00000010110101100010000010;
		#20;
		//addi $t3,$t3,1;
		`signals=12'b001000001010;
		inst_field=26'b01011010110000000000000001;
		#20;
		//jr $t3;
		`signals=12'b100000110xxx;
		inst_field=26'b01011000000000000000001000;
		#20;
		//andi $t1,$t1,15;
		`signals=12'b001000001000;
		inst_field=26'b01001010010000000000001111;
		#20;
		//xori $t6,$t1,15;
		`signals=12'b001000001011;
		inst_field=26'b01001011100000000000001111;
		#20;
		//jalr $t3,$ra;
		`signals=12'b100110111xxx;
		inst_field=26'b11111000000101100000001001;
		#20;
		//lui $t2, 8;
		`signals=12'b001100001xxx;
		inst_field=26'b00000010100000000000001000;
		#20;
		//lw $t2,0($t1);
		Data_in = 1;
		`signals=12'b001010001010;
		inst_field=26'b01001010100000000000000000;
		#20;
		//sw $t2,4($t1);
		Data_in = 0;
		`signals=12'b001000000010;
		inst_field=26'b01001010100000000000000100;
		#20;
		//beq $t1,$t2,2;
		`signals=12'b000000010110;
		inst_field=26'b01001010100000000000000010;
		#20;
		//bne $t1,$t3,1;
		`signals=12'b000000010110;
		inst_field=26'b01001010110000000000000001;
		#20;
		//slti $t1,$t3,4;
		`signals=12'b001000001111;
		inst_field=26'b01001010110000000000000100;
		#20;
		//j 0;
		`signals=12'b001000100xxx;
		inst_field=26'b00000000000000000000000000;
		#20;
		//jal 2;
		`signals=12'b001111101xxx;
		inst_field=26'b00000000000000000000000010;
		#20;
		rst=1;
	end
	always begin
		clk=0;#10;
		clk=1;#10;
	end
endmodule
