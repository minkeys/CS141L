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
// CREATED		"Fri Feb 06 01:09:38 2015"

module CS141L(
	pin_name2,
	pin_name3,
	pin_name4,
	pin_name5,
	pin_name6,
	pin_name7,
	pin_name8,
	newpc,
	pcout
);


input wire	pin_name2;
input wire	pin_name3;
input wire	pin_name4;
input wire	pin_name5;
input wire	pin_name6;
input wire	pin_name7;
input wire	pin_name8;
input wire	[7:0] newpc;
output wire	[7:0] pcout;






program_counter	b2v_inst(
	.clock(pin_name2),
	.wenable_i(pin_name3),
	.reset_i(pin_name4),
	.newpc_i(newpc),
	.pc_o(pcout));




endmodule
