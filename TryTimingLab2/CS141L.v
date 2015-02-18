// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"
// CREATED		"Fri Feb 06 08:46:09 2015"

module CS141L(
	clk,
	start,
	startAddress,
	currentpc,
	instruction
);


input wire	clk;
input wire	start;
input wire	[7:0] startAddress;
output wire	[7:0] currentpc;
output wire	[7:0] instruction;

wire	SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_15;
wire	[7:0] SYNTHESIZED_WIRE_16;
wire	[7:0] SYNTHESIZED_WIRE_17;
wire	[3:0] SYNTHESIZED_WIRE_18;
wire	[3:0] SYNTHESIZED_WIRE_19;
wire	[3:0] SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	[7:0] SYNTHESIZED_WIRE_25;

assign	currentpc = SYNTHESIZED_WIRE_27;




busmux_0	b2v_bm1(
	.sel(SYNTHESIZED_WIRE_26),
	.dataa(SYNTHESIZED_WIRE_1),
	.datab(SYNTHESIZED_WIRE_2),
	.result(SYNTHESIZED_WIRE_16));


busmux_1	b2v_bm2(
	.sel(SYNTHESIZED_WIRE_3),
	.dataa(SYNTHESIZED_WIRE_4),
	.datab(SYNTHESIZED_WIRE_5),
	.result(SYNTHESIZED_WIRE_10));


instructionROM	b2v_inst(
	.program_counter(SYNTHESIZED_WIRE_27),
	.branchFlag(SYNTHESIZED_WIRE_22),
	.labelFlag(SYNTHESIZED_WIRE_26),
	.immediateFlag(SYNTHESIZED_WIRE_3),
	.signFlag(SYNTHESIZED_WIRE_8),
	.haltFlag(SYNTHESIZED_WIRE_7),
	.instruction(instruction),
	.labelValue(SYNTHESIZED_WIRE_1),
	.opcode(SYNTHESIZED_WIRE_11),
	.rd(SYNTHESIZED_WIRE_18),
	.rs(SYNTHESIZED_WIRE_19),
	.rt(SYNTHESIZED_WIRE_20),
	.value(SYNTHESIZED_WIRE_4));


\21mux 	b2v_inst27(
	.S(SYNTHESIZED_WIRE_7),
	
	.A(clk),
	.Y(SYNTHESIZED_WIRE_28));


alu	b2v_inst29(
	.signFlag(SYNTHESIZED_WIRE_8),
	.input0(SYNTHESIZED_WIRE_9),
	.input1(SYNTHESIZED_WIRE_10),
	.opcode(SYNTHESIZED_WIRE_11),
	.overflowFlag(SYNTHESIZED_WIRE_15),
	.lessThanFlag(SYNTHESIZED_WIRE_23),
	.overflow(SYNTHESIZED_WIRE_17),
	.result(SYNTHESIZED_WIRE_2));


regfile32x8	b2v_inst9(
	.clock(SYNTHESIZED_WIRE_28),
	.regwriteFlag(SYNTHESIZED_WIRE_26),
	.labelFlag(SYNTHESIZED_WIRE_26),
	.overflowFlag(SYNTHESIZED_WIRE_15),
	.dataIn(SYNTHESIZED_WIRE_16),
	.overflowIn(SYNTHESIZED_WIRE_17),
	.rd(SYNTHESIZED_WIRE_18),
	.rs(SYNTHESIZED_WIRE_19),
	.rt(SYNTHESIZED_WIRE_20),
	.branchAddress(SYNTHESIZED_WIRE_25),
	.regA(SYNTHESIZED_WIRE_9),
	.regB(SYNTHESIZED_WIRE_5));


program_counter_logic	b2v_pcl(
	.clk(SYNTHESIZED_WIRE_28),
	.start(start),
	.branch(SYNTHESIZED_WIRE_22),
	.taken(SYNTHESIZED_WIRE_23),
	.inputPC(SYNTHESIZED_WIRE_27),
	.startAddress(startAddress),
	.target(SYNTHESIZED_WIRE_25),
	.outputPC(SYNTHESIZED_WIRE_27));


endmodule

module busmux_0(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [7:0] dataa;
input [7:0] datab;
output [7:0] result;

endmodule

module busmux_1(sel,dataa,datab,result);
/* synthesis black_box */

input sel;
input [7:0] dataa;
input [7:0] datab;
output [7:0] result;

endmodule
