-- WARNING: Do NOT edit the input and output ports in this file in a text
-- editor if you plan to continue editing the block that represents it in
-- the Block Editor! File corruption is VERY likely to occur.

-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- Generated by Quartus II 64-Bit Version 14.1 (Build Build 186 12/03/2014)
-- Created on Wed Feb 18 00:57:22 2015

FUNCTION instructionDecode (program_counter[7..0], instruction[7..0])
	RETURNS (opcode[3..0], value[7..0], rs[3..0], rt[3..0], rd[3..0], branchFlag, labelFlag, immediateFlag, signFlag, labelValue[7..0], haltFlag);