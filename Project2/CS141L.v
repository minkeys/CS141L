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
// CREATED		"Fri Feb 06 09:31:51 2015"

module CS141L(
	signfl,
	inp0,
	inp1,
	opc,
	ovfl,
	ltfl,
	ovfl7,
	ovfl6,
	ovfl5,
	ovfl4,
	ovfl3,
	ovfl2,
	ovfl1,
	ovfl0,
	res
);


input wire	signfl;
input wire	[7:0] inp0;
input wire	[7:0] inp1;
input wire	[3:0] opc;
output wire	ovfl;
output wire	ltfl;
output wire	ovfl7;
output wire	ovfl6;
output wire	ovfl5;
output wire	ovfl4;
output wire	ovfl3;
output wire	ovfl2;
output wire	ovfl1;
output wire	ovfl0;
output wire	[7:0] res;

wire	[7:0] SYNTHESIZED_WIRE_7;

assign	ovfl7 = SYNTHESIZED_WIRE_7[7];
assign	ovfl6 = SYNTHESIZED_WIRE_7[6];
assign	ovfl5 = SYNTHESIZED_WIRE_7[5];
assign	ovfl4 = SYNTHESIZED_WIRE_7[4];
assign	ovfl3 = SYNTHESIZED_WIRE_7[3];
assign	ovfl2 = SYNTHESIZED_WIRE_7[2];
assign	ovfl1 = SYNTHESIZED_WIRE_7[1];
assign	ovfl0 = SYNTHESIZED_WIRE_7[0];




alu	b2v_inst(
	.signFlag(signfl),
	.input0(inp0),
	.input1(inp1),
	.opcode(opc),
	.overflowFlag(ovfl),
	.lessThanFlag(ltfl),
	.overflow(SYNTHESIZED_WIRE_7),
	.result(res));


endmodule
