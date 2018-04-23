`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:27 10/19/2017 
// Design Name: 
// Module Name:    writeVram 
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
module writeVram(input clk,
				 input [31:0]IF_inst,
				 input [31:0]ID_inst,
				 input [31:0]EX_inst,
				 input [31:0]MEM_inst,
				 input [31:0]WB_inst,
				 input [31:0]IF_PC,
				 input [31:0]IF_NPC,
				 input [1023:0]Registers,
				 input [31:0]ALU_A,
				 input [31:0]ALU_B,
				 input stall,
				 input branch,
				 input jump,
				 input forwardA,
				 input forwardB,
				 input [31:0]EX_ALUout,
				 input MEM_MemWrite,
				 input [11:0]MEM_WriteAddr,
				 input [31:0]MEM_WriteData,
				 input [31:0]MEM_DataOut,
				 input WB_RegWrite,
				 input [7:0]WB_WriteAddr,
				 input [31:0]WB_WriteData,
				 output reg vram_we,
				 output reg [12:0] vram_write_addr=0,
				 output reg [7:0] vram_data_in=0
    );
	
	wire [12:0] next_write_addr = (vram_write_addr<13'd4800)?vram_write_addr+1:0;

	wire [31:0] Register0 = Registers[1 * 32 - 1 : 0 * 32];
	wire [31:0] Register1 = Registers[2 * 32 - 1 : 1 * 32];
	wire [31:0] Register2 = Registers[3 * 32 - 1 : 2 * 32];
	wire [31:0] Register3 = Registers[4 * 32 - 1 : 3 * 32];
	wire [31:0] Register4 = Registers[5 * 32 - 1 : 4 * 32];
	wire [31:0] Register5 = Registers[6 * 32 - 1 : 5 * 32];
	wire [31:0] Register6 = Registers[7 * 32 - 1 : 6 * 32];
	wire [31:0] Register7 = Registers[8 * 32 - 1 : 7 * 32];
	wire [31:0] Register8 = Registers[9 * 32 - 1 : 8 * 32];
	wire [31:0] Register9 = Registers[10 * 32 - 1 : 9 * 32];
	wire [31:0] Register10 = Registers[11 * 32 - 1 : 10 * 32];
	wire [31:0] Register11 = Registers[12 * 32 - 1 : 11 * 32];
	wire [31:0] Register12 = Registers[13 * 32 - 1 : 12 * 32];
	wire [31:0] Register13 = Registers[14 * 32 - 1 : 13 * 32];
	wire [31:0] Register14 = Registers[15 * 32 - 1 : 14 * 32];
	wire [31:0] Register15 = Registers[16 * 32 - 1 : 15 * 32];
	wire [31:0] Register16 = Registers[17 * 32 - 1 : 16 * 32];
	wire [31:0] Register17 = Registers[18 * 32 - 1 : 17 * 32];
	wire [31:0] Register18 = Registers[19 * 32 - 1 : 18 * 32];
	wire [31:0] Register19 = Registers[20 * 32 - 1 : 19 * 32];
	wire [31:0] Register20 = Registers[21 * 32 - 1 : 20 * 32];
	wire [31:0] Register21 = Registers[22 * 32 - 1 : 21 * 32];
	wire [31:0] Register22 = Registers[23 * 32 - 1 : 22 * 32];
	wire [31:0] Register23 = Registers[24 * 32 - 1 : 23 * 32];
	wire [31:0] Register24 = Registers[25 * 32 - 1 : 24 * 32];
	wire [31:0] Register25 = Registers[26 * 32 - 1 : 25 * 32];
	wire [31:0] Register26 = Registers[27 * 32 - 1 : 26 * 32];
	wire [31:0] Register27 = Registers[28 * 32 - 1 : 27 * 32];
	wire [31:0] Register28 = Registers[29 * 32 - 1 : 28 * 32];
	wire [31:0] Register29 = Registers[30 * 32 - 1 : 29 * 32];
	wire [31:0] Register30 = Registers[31 * 32 - 1 : 30 * 32];
	wire [31:0] Register31 = Registers[32 * 32 - 1 : 31 * 32];

	wire we = (next_write_addr>=485 && next_write_addr<493)?1'b1
			 :(next_write_addr>=563 && next_write_addr<571)?1'b1
			 :(next_write_addr>=648 && next_write_addr<656)?1'b1
			 :(next_write_addr==726)?1'b1
			 :(next_write_addr==757)?1'b1
			 :(next_write_addr==780)?1'b1
			 :(next_write_addr>=1045 && next_write_addr<1053)?1'b1

			 :(next_write_addr>=1206 && next_write_addr<1214)?1'b1
			 :(next_write_addr>=1226 && next_write_addr<1234)?1'b1
			 :(next_write_addr>=1246 && next_write_addr<1254)?1'b1
			 :(next_write_addr>=1266 && next_write_addr<1274)?1'b1
			 :(next_write_addr>=1286 && next_write_addr<1294)?1'b1
			 :(next_write_addr>=1306 && next_write_addr<1314)?1'b1
			 :(next_write_addr>=1326 && next_write_addr<1334)?1'b1
			 :(next_write_addr>=1346 && next_write_addr<1354)?1'b1
			 :(next_write_addr>=1366 && next_write_addr<1374)?1'b1
			 :(next_write_addr>=1386 && next_write_addr<1394)?1'b1
			 :(next_write_addr>=1406 && next_write_addr<1414)?1'b1
			 :(next_write_addr>=1426 && next_write_addr<1434)?1'b1
			 :(next_write_addr>=1446 && next_write_addr<1454)?1'b1
			 :(next_write_addr>=1466 && next_write_addr<1474)?1'b1
			 :(next_write_addr>=1486 && next_write_addr<1494)?1'b1
			 :(next_write_addr>=1506 && next_write_addr<1514)?1'b1
			 :(next_write_addr>=1526 && next_write_addr<1534)?1'b1
			 :(next_write_addr>=1546 && next_write_addr<1554)?1'b1
			 :(next_write_addr>=1566 && next_write_addr<1574)?1'b1
			 :(next_write_addr>=1586 && next_write_addr<1594)?1'b1
			 :(next_write_addr>=1606 && next_write_addr<1614)?1'b1
			 :(next_write_addr>=1626 && next_write_addr<1634)?1'b1
			 :(next_write_addr>=1646 && next_write_addr<1654)?1'b1
			 :(next_write_addr>=1666 && next_write_addr<1674)?1'b1
			 :(next_write_addr>=1686 && next_write_addr<1694)?1'b1
			 :(next_write_addr>=1706 && next_write_addr<1714)?1'b1
			 :(next_write_addr>=1726 && next_write_addr<1734)?1'b1
			 :(next_write_addr>=1746 && next_write_addr<1754)?1'b1
			 :(next_write_addr>=1766 && next_write_addr<1774)?1'b1
			 :(next_write_addr>=1786 && next_write_addr<1794)?1'b1
			 :(next_write_addr>=1806 && next_write_addr<1814)?1'b1
			 :(next_write_addr>=1826 && next_write_addr<1834)?1'b1

			 :(next_write_addr>=2165 && next_write_addr<2173)?1'b1
			 :(next_write_addr>=2246 && next_write_addr<2254)?1'b1
			 :(next_write_addr==2288)?1'b1
			 :(next_write_addr>=2326 && next_write_addr<2334)?1'b1
			 :(next_write_addr==2368)?1'b1
			 :(next_write_addr>=2411 && next_write_addr<2419)?1'b1
			 :(next_write_addr>=2805 && next_write_addr<2813)?1'b1
			 :(next_write_addr==2972)?1'b1
			 :(next_write_addr>=3048 && next_write_addr<3051)?1'b1
			 :(next_write_addr>=3127 && next_write_addr<3135)?1'b1
			 :(next_write_addr>=3208 && next_write_addr<3216)?1'b1
			 :(next_write_addr>=3605 && next_write_addr<3613)?1'b1
			 :(next_write_addr==3772)?1'b1
			 :(next_write_addr>=3848 && next_write_addr<3850)?1'b1
			 :(next_write_addr>=3930 && next_write_addr<3938)?1'b1:1'b0;
	

	wire [3:0] hex = (next_write_addr>=485 && next_write_addr<493)?IF_inst[31 - 4*(next_write_addr-485)-:4]
					:(next_write_addr>=563 && next_write_addr<571)?IF_PC[31 - 4*(next_write_addr-563)-:4]
					:(next_write_addr>=648 && next_write_addr<656)?IF_NPC[31 - 4*(next_write_addr-648)-:4]
					:(next_write_addr==726)?{3'h0,stall}
					:(next_write_addr==757)?{3'h0,branch}
					:(next_write_addr==780)?{3'h0,jump}
					:(next_write_addr>=1045 && next_write_addr<1053)?ID_inst[31 - 4*(next_write_addr-1045)-:4]
					:(next_write_addr>=1206 && next_write_addr<1214)?Register0[31 - 4*(next_write_addr-1206)-:4]
			 		:(next_write_addr>=1226 && next_write_addr<1234)?Register1[31 - 4*(next_write_addr-1226)-:4]
			 		:(next_write_addr>=1246 && next_write_addr<1254)?Register2[31 - 4*(next_write_addr-1246)-:4]
					:(next_write_addr>=1266 && next_write_addr<1274)?Register3[31 - 4*(next_write_addr-1266)-:4]
			 		:(next_write_addr>=1286 && next_write_addr<1294)?Register4[31 - 4*(next_write_addr-1286)-:4]
			 		:(next_write_addr>=1306 && next_write_addr<1314)?Register5[31 - 4*(next_write_addr-1306)-:4]
			 		:(next_write_addr>=1326 && next_write_addr<1334)?Register6[31 - 4*(next_write_addr-1326)-:4]
			 		:(next_write_addr>=1346 && next_write_addr<1354)?Register7[31 - 4*(next_write_addr-1346)-:4]
			 		:(next_write_addr>=1366 && next_write_addr<1374)?Register8[31 - 4*(next_write_addr-1366)-:4]
			 		:(next_write_addr>=1386 && next_write_addr<1394)?Register9[31 - 4*(next_write_addr-1386)-:4]
			 		:(next_write_addr>=1406 && next_write_addr<1414)?Register10[31 - 4*(next_write_addr-1406)-:4]
			 		:(next_write_addr>=1426 && next_write_addr<1434)?Register11[31 - 4*(next_write_addr-1426)-:4]
			 		:(next_write_addr>=1446 && next_write_addr<1454)?Register12[31 - 4*(next_write_addr-1446)-:4]
					:(next_write_addr>=1466 && next_write_addr<1474)?Register13[31 - 4*(next_write_addr-1466)-:4]
					:(next_write_addr>=1486 && next_write_addr<1494)?Register14[31 - 4*(next_write_addr-1486)-:4]
					:(next_write_addr>=1506 && next_write_addr<1514)?Register15[31 - 4*(next_write_addr-1506)-:4]
					:(next_write_addr>=1526 && next_write_addr<1534)?Register16[31 - 4*(next_write_addr-1526)-:4]
			 		:(next_write_addr>=1546 && next_write_addr<1554)?Register17[31 - 4*(next_write_addr-1546)-:4]
			 		:(next_write_addr>=1566 && next_write_addr<1574)?Register18[31 - 4*(next_write_addr-1566)-:4]
			 		:(next_write_addr>=1586 && next_write_addr<1594)?Register19[31 - 4*(next_write_addr-1586)-:4]
			 		:(next_write_addr>=1606 && next_write_addr<1614)?Register20[31 - 4*(next_write_addr-1606)-:4]
			 		:(next_write_addr>=1626 && next_write_addr<1634)?Register21[31 - 4*(next_write_addr-1626)-:4]
			 		:(next_write_addr>=1646 && next_write_addr<1654)?Register22[31 - 4*(next_write_addr-1646)-:4]
			 		:(next_write_addr>=1666 && next_write_addr<1674)?Register23[31 - 4*(next_write_addr-1666)-:4]
			 		:(next_write_addr>=1686 && next_write_addr<1694)?Register24[31 - 4*(next_write_addr-1686)-:4]
			 		:(next_write_addr>=1706 && next_write_addr<1714)?Register25[31 - 4*(next_write_addr-1706)-:4]
			 		:(next_write_addr>=1726 && next_write_addr<1734)?Register26[31 - 4*(next_write_addr-1726)-:4]
			 		:(next_write_addr>=1746 && next_write_addr<1754)?Register27[31 - 4*(next_write_addr-1746)-:4]
			 		:(next_write_addr>=1766 && next_write_addr<1774)?Register28[31 - 4*(next_write_addr-1766)-:4]
			 		:(next_write_addr>=1786 && next_write_addr<1794)?Register29[31 - 4*(next_write_addr-1786)-:4]
			 		:(next_write_addr>=1806 && next_write_addr<1814)?Register30[31 - 4*(next_write_addr-1806)-:4]
			 		:(next_write_addr>=1826 && next_write_addr<1834)?Register31[31 - 4*(next_write_addr-1826)-:4]
					:(next_write_addr>=2165 && next_write_addr<2173)?EX_inst[31 - 4*(next_write_addr-2165)-:4]
					:(next_write_addr>=2246 && next_write_addr<2254)?ALU_A[31 - 4*(next_write_addr-2246)-:4]
					:(next_write_addr==2288)?{3'h0,forwardA}
					:(next_write_addr>=2326 && next_write_addr<2334)?ALU_B[31 - 4*(next_write_addr-2326)-:4]
					:(next_write_addr==2368)?{3'h0,forwardB}
					:(next_write_addr>=2411 && next_write_addr<2419)?EX_ALUout[31 - 4*(next_write_addr-2411)-:4]
					:(next_write_addr>=2805 && next_write_addr<2813)?MEM_inst[31 - 4*(next_write_addr-2805)-:4]
					:(next_write_addr==2972)?{3'h0,MEM_MemWrite}
					:(next_write_addr>=3048 && next_write_addr<3051)?MEM_WriteAddr[11 - 4*(next_write_addr-3048)-:4]
					:(next_write_addr>=3127 && next_write_addr<3135)?MEM_WriteData[31 - 4*(next_write_addr-3127)-:4]
					:(next_write_addr>=3208 && next_write_addr<3216)?MEM_DataOut[31 - 4*(next_write_addr-3208)-:4]
					:(next_write_addr>=3605 && next_write_addr<3613)?WB_inst[31 - 4*(next_write_addr-3605)-:4]
					:(next_write_addr==3772)?{3'h0,WB_RegWrite}
					:(next_write_addr>=3848 && next_write_addr<3850)?WB_WriteAddr[7 - 4*(next_write_addr-3848)-:4]
					:(next_write_addr>=3930 && next_write_addr<3938)?WB_WriteData[31 - 4*(next_write_addr-3930)-:4]
					:4'hF;
	wire [7:0] ascii;
	hex2ascii hex2ascii(.hex(hex[3:0]),.ascii(ascii[7:0]));

	always @(posedge clk) begin
		vram_write_addr<=next_write_addr;
		vram_data_in<=ascii[6:0];
		vram_we<=we;
	end
endmodule
