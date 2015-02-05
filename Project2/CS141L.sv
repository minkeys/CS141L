module CS141L(
input[7:0] regA, regB,				// register inputs
input[3:0] opcode,					// opcode
input signFlag,						// for signed flag
input clock,							// clock source
output overflowFlag,					// overflow flag
output notLessThanFlag,				// sets the less than flag	
output reg[7:0] result, overflow	// result = output, overflow = overflow 
);

always @(posedge clock)
begin

	overflowFlag <= 0;
	notLessThanFlag <= 0;
	
	case(opcode)
		4'b0010: add(regA, regB, result, overflow, overflowFlag, signFlag);
		4'b0011: bnot(regA, regB, result);
		4'b0100: band(regA, regB, result);
		4'b1000: xOr(regA, regB, result);
		4'b1001: lessThan(regA, regB, result, notLessThanFlag);
		4'b1010: shiftLeft(regA, regB, result, overflow, overflowFlag);
		4'b1011: shiftRight(regA, regB, result, overflow, overflowFlag);
		4'b1100: addImmediate(regA, regB, result, overflow, overflowFlag);
		4'b1101: loadUpperImmediate(regA, regB, result);
		4'b1111: tbd(regA, regB, result, overflow, overflowFlag, notLessThanFlag);
	endcase

end //end of always @
	
task lessThan;
		begin
		end
endtask
		
task add;
	input[7:0] regA, regB;
	
	output reg[7:0] result, overflow;
	output overflowFlag;
	input signFlag;
	begin
	if (signFlag)
	begin
		result = regA + regB;
		if (regA[7] == regB[7] && result[7] != regA[7])
			begin
			overflow = result[7];
			result[7] = regA[7];
			end
		end
	end
endtask
	
task xOr;
	input[7:0] regA, regB;
	output reg[7:0] result, overflow;
	begin
	
	end
endtask
	
task bnot;
	begin
	end
endtask

task band;
	begin
	end
endtask
	
task shiftLeft;
	input[7:0] regA, regB;					//regA = input, regB = immediate
	output reg[7:0] result, overflow;	//result = output, overflow = Carry Out
	output overflowFlag;
	parameter R=8;
	
	begin
	result = regA << regB;		//logical shift left regA by regB, stored into result
	overflow = regA >> (R-regB);	//logical shift right regA by (8-regB) to get overflow bits
	overflowFlag <= 1;
	end
endtask
	
task shiftRight;
	input[7:0] regA, regB;						//regA = input, regB = immediate
	output reg[7:0] result, overflow;		//result = output, overflow = overflow
	parameter R=8;
	
	begin
	result = regA >> regB;			//logical shift right regA by regB, stored into overflow
	overflow = regA << (R-regB);	//logical shift left regA by (8-regB) to get overflow bits
	end
endtask
	
endmodule
	