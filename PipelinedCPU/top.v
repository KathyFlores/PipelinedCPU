`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:56 09/24/2017 
// Design Name: 
// Module Name:    top 
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
module Arch_02(input clk200N, 
                      input clk200P, 
                      input [3:0]K_COL, 
                      input RSTN, 
                      input [15:0]SW, 
                      output [3:0]AN, 
                      output Buzzer, 
                      output [4:0]K_ROW, 
                      output [7:0]LED, 
                      output LEDCLK, 
                      output LEDDT, 
                      output LEDEN, 
                      output SEGCLK, 
                      output SEGDT, 
                      output SEGEN, 
                      output [7:0]SEGMENT,
					  output [3:0]Red,
					  output [3:0]Green,
					  output [3:0]Blue,
					  output HSYNC,
					  output VSYNC);

    wire [31:0] Addr_out,Ai,Bi,Counter_out,CPU2IO,Data_in,Data_out,
               dina,Disp_num,Div,douta,inst,PC;
    wire [15:0] LED_out,SW_OK;
    wire [9:0] addra;
    wire [7:0] blink,LE_out,point_out;
    wire [4:0] Key_out;
    wire [3:0] BTN_OK,Pulse;
    wire [1:0] counter_ch;
    wire Clk_CPU,clk_100mhz,counter_we,counter1_OUT,counter2_OUT,count0_OUT,
         CR,GPIOE0,GPIOF0,IO_clk,LEDCLR,mem_w,RDY,readn,rst,SEGCLR,wea;
        
    assign IO_clk=~Clk_CPU;
    assign Buzzer=1'b1;

    SEnter_2_32  M4 (.BTN(BTN_OK[2:0]), 
                   .clk(clk_100mhz), 
                   .Ctrl({SW_OK[7:5], SW_OK[15], SW_OK[0]}), 
                   .Din(Key_out[4:0]), 
                   .D_ready(RDY), 
                   .Ai(Ai[31:0]), 
                   .Bi(Bi[31:0]), 
                   .blink(blink[7:0]), 
                   .readn(readn));

   /*SCPU_More U0 (.clk(Clk_CPU), 
                 .Data_in(Data_in[31:0]), 
                 .inst_in(inst[31:0]), 
                 .INT(count0_OUT), 
                 .MIO_ready(), 
                 .reset(rst), 
                 .Addr_out(Addr_out[31:0]), 
                 .CPU_MIO(), 
                 .Data_out(Data_out[31:0]), 
                 .mem_w(mem_w), 
                 .PC_out(PC[31:0]));   */   
    		 
    clk_diff  U1 (.clk200N(clk200N), 
                 .clk200P(clk200P), 
                 .clk100MHz(clk_100mhz));
   /*ROM_D  U2 (.a(PC[11:2]), 
             .spo(inst[31:0]));
   RAM_B  U3 (.addra(addra[9:0]), 
             .clka(clk_100mhz), 
             .dina(dina[31:0]), 
             .wea(wea), 
             .douta(douta[31:0]));*/
    /*MIO_BUS  U4 (.addr_bus(Addr_out[31:0]), 
               .BTN(BTN_OK[3:0]), 
               .clk(clk_100mhz), 
               .counter_out(Counter_out[31:0]), 
               .counter0_out(count0_OUT), 
               .counter1_out(counter1_OUT), 
               .counter2_out(counter2_OUT), 
               .Cpu_data2bus(Data_out[31:0]), 
               .led_out(LED_out[15:0]), 
               .mem_w(mem_w), 
               .ram_data_out(douta[31:0]), 
               .rst(rst), 
               .SW(SW_OK[15:0]), 
               .counter_we(counter_we), 
               .Cpu_data4bus(Data_in[31:0]), 
               .data_ram_we(wea), 
               .GPIOe0000000_we(GPIOE0), 
               .GPIOf0000000_we(GPIOF0), 
               .Peripheral_in(CPU2IO[31:0]), 
               .ram_addr(addra[9:0]), 
               .ram_data_in(dina[31:0]));*/
    Multi_8CH32  U5 (.clk(IO_clk), 
                   .Data0(CPU2IO[31:0]), 
                   .data1({2'h0, PC[31:2]}), 
                   .data2(inst[31:0]), 
                   .data3(Counter_out[31:0]), 
                   .data4(Addr_out[31:0]), 
                   .data5(Data_out[31:0]), 
                   .data6(Data_in[31:0]), 
                   .data7(PC[31:0]), 
                   .EN(GPIOE0), 
                   .LES({64'h0}), 
                   .point_in({Div[31:0], Div[31:0]}), 
                   .rst(rst), 
                   .Test(SW_OK[7:5]), 
                   .Disp_num(Disp_num[31:0]), 
                   .LE_out(LE_out[7:0]), 
                   .point_out(point_out[7:0]));
    Display  U6 (.clk(clk_100mhz), 
               .flash(Div[25]), 
               .Hexs(Disp_num[31:0]), 
               .LES(LE_out[7:0]), 
               .point(point_out[7:0]), 
               .rst(rst), 
               .Start(Div[20]), 
               .Text(SW_OK[0]), 
               .segclk(SEGCLK), 
               .segclrn(SEGCLR), 
               .SEGEN(SEGEN), 
               .segsout(SEGDT));
    GPIO  U7 (.clk(IO_clk), 
            .EN(GPIOF0), 
            .P_Data(CPU2IO[31:0]), 
            .rst(rst), 
            .Start(Div[20]), 
            .counter_set(counter_ch[1:0]), 
            .GPIOf0(), 
            .ledclk(LEDCLK), 
            .ledclrn(LEDCLR), 
            .LEDEN(LEDEN), 
            .ledsout(LEDDT), 
            .LED_out(LED_out[15:0]));
    clk_div  U8 (.clk(clk_100mhz), 
               .rst(rst), 
               .SW2(SW_OK[2]), 
               .clkdiv(Div[31:0]), 
               .Clk_CPU(Clk_CPU));
    SAnti_jitter  U9 (.clk(clk_100mhz), 
                    .Key_y(K_COL[3:0]), 
                    .readn(readn), 
                    .RSTN(RSTN), 
                    .SW(SW[15:0]), 
                    .BTN_OK(BTN_OK[3:0]), 
                    .CR(CR), 
                    .Key_out(Key_out[4:0]), 
                    .Key_ready(RDY), 
                    .Key_x(K_ROW[4:0]), 
                    .pulse_out(Pulse[3:0]), 
                    .rst(rst), 
                    .SW_OK(SW_OK[15:0]));
   Counter  U10 (.clk(IO_clk), 
                .clk0(Div[6]), 
                .clk1(Div[9]), 
                .clk2(Div[11]), 
                .counter_ch(counter_ch[1:0]), 
                .counter_val(CPU2IO[31:0]), 
                .counter_we(counter_we), 
                .rst(rst), 
                .counter_out(Counter_out[31:0]), 
                .counter0_OUT(count0_OUT), 
                .counter1_OUT(counter1_OUT), 
                .counter2_OUT(counter2_OUT));
	wire [7:0]ascii;
	wire [12:0]vram_read_addr,vram_write_addr;
	wire [7:0]vram_data_in;
	wire [5:0]font_addr;
	wire dot,vram_we;
	VGA U11(.clk(Div[1]), .rst(rst), .d_in(vga_pixel[11:0]), .rdn(rdn),
			 /*.row(), .col(),*/ 
			 .r(Red[3:0]), .g(Green[3:0]), .b(Blue[3:0]),
			 .hs(HSYNC), .vs(VSYNC), .addr(vram_read_addr[12:0]), .font_addr(font_addr[5:0]));		
	wire  [11:0] vga_pixel = dot? 12'hfff : 12'h000;     
	vram U13(.clk(Div[1]),
	         .addra(vram_write_addr[12:0]), //
	         .wea(vram_we), 
	         .dina(vram_data_in[7:0]),//
	         //.douta(vram_outa[31:0]), //
	         //.clkb(clk_100mhz),
	         .addrb(vram_read_addr[12:0]),
	         //.web(1'b0),
	         //.dinb(32'h0),
	         .doutb(ascii[7:0]));
	font_table U14(.font_table_addr({ascii[6:0], font_addr[5:0]}), .dot(dot)); 
	wire [1023:0]Registers;
    wire [31:0] IF_inst,ID_inst,EX_inst,MEM_inst,WB_inst,IF_PC,IF_NPC,
                ALU_A,ALU_B,EX_ALUout,MEM_WriteData,MEM_DataOut,WB_WriteData;
    wire MEM_MemWrite,WB_RegWrite,stall,branch,jump,forwardA,forwardB;
    wire [9:0]MEM_WriteAddr;
    wire [4:0]WB_WriteAddr;
    PipelinedCPU_top U0(.clk(Clk_CPU),
                        .rst(rst),
						.forwardA(forwardA),
						.forwardB(forwardB),
						.stall(stall),
						.branch(branch),
						.jump(jump),
                        .IF_inst(IF_inst[31:0]),
				        .ID_inst(ID_inst[31:0]),
				        .EX_inst(EX_inst[31:0]),
				        .MEM_inst(MEM_inst[31:0]),
				        .WB_inst(WB_inst[31:0]),
				        .IF_PC(IF_PC[31:0]),
				        .IF_NPC(IF_NPC[31:0]),
				        .Registers(Registers[1023:0]),
				        .ALU_A(ALU_A[31:0]),
				        .ALU_B(ALU_B[31:0]),
				        .EX_ALUout(EX_ALUout[31:0]),
				        .MEM_MemWrite(MEM_MemWrite),
				        .MEM_WriteAddr(MEM_WriteAddr[9:0]),
				        .MEM_WriteData(MEM_WriteData[31:0]),
				        .MEM_DataOut(MEM_DataOut[31:0]),
				        .WB_RegWrite(WB_RegWrite),
				        .WB_WriteAddr(WB_WriteAddr[4:0]),
				        .WB_WriteData(WB_WriteData[31:0]));		
    writeVram U15(.clk(Div[1]),
				  .IF_inst(IF_inst[31:0]),
				  .ID_inst(ID_inst[31:0]),
				  .EX_inst(EX_inst[31:0]),
				  .MEM_inst(MEM_inst[31:0]),
				  .WB_inst(WB_inst[31:0]),
				  .IF_PC(IF_PC[31:0]),
				  .IF_NPC(IF_NPC[31:0]),
				  .Registers(Registers[1023:0]),
				  .ALU_A(ALU_A[31:0]),
				  .ALU_B(ALU_B[31:0]),
				  .forwardA(forwardA),
				  .forwardB(forwardB),
				  .stall(stall),
				  .branch(branch),
				  .jump(jump),
				  .EX_ALUout(EX_ALUout[31:0]),
				  .MEM_MemWrite(MEM_MemWrite),
				  .MEM_WriteAddr({2'h0,MEM_WriteAddr[9:0]}),
				  .MEM_WriteData(MEM_WriteData[31:0]),
				  .MEM_DataOut(MEM_DataOut[31:0]),
				  .WB_RegWrite(WB_RegWrite),
				  .WB_WriteAddr({3'h0,WB_WriteAddr[4:0]}),
				  .WB_WriteData(WB_WriteData[31:0]),
				  .vram_we(vram_we),
                  .vram_write_addr(vram_write_addr[12:0]),
	              .vram_data_in(vram_data_in[7:0]));
   Seg7_Dev  U61 (.flash(Div[25]), 
                 .Hexs(Disp_num[31:0]), 
                 .LES(LE_out[7:0]), 
                 .point(point_out[7:0]), 
                 .Scan({SW_OK[1], Div[19:18]}), 
                 .SW0(SW_OK[0]), 
                 .AN(AN[3:0]), 
                 .SEGMENT(SEGMENT[7:0]));
   PIO  U71 (.clk(IO_clk), 
            .EN(GPIOF0), 
            .PData_in(CPU2IO[31:0]), 
            .rst(rst), 
            .counter_set(), 
            .GPIOf0(), 
            .LED_out(LED[7:0]));
	  
endmodule
