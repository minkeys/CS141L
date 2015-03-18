module CS141L(
input[7:0] input0, input1,			// register inputs
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
		4'b0010: add(input0, input1, result, overflow, overflowFlag, signFlag);
		4'b0011: bnot(input0, result);
		4'b0100: band(input0, input1, result);
		4'b1000: xOr(input0, input1, result);
		4'b1001: lessThan(input0, input1, notLessThanFlag);
		4'b1010: shiftLeft(input0, input1, result, overflow, overflowFlag);
		4'b1011: shiftRight(input0, input1, result, overflow, overflowFlag);
		4'b1100: add(input0, input1, result, overflow, overflowFlag, signFlag); // addImmediate
		4'b1101: loadUpperImmediate(input0, result);
		// 4'b1111: tbd(input0, input1, result, overflow, overflowFlag, notLessThanFlag);
	endcase

end //end of always @

task add;
	input[7:0] input0, input1;	
	output reg[7:0] result, overflow;
	output overflowFlag;
	input signFlag;
	begin
		overflowFlag <= 1;
		if (signFlag)
		begin
			result <= input0 + input1;
			if (input0[7] == input1[7] && result[7] != input0[7])
			begin
				overflow <= result[7];
				result[7] <= input0[7];
			end
		end // end of if
		else
		begin
			result = input0 + input1;
			if ((result < input0) && (result < input1))
			begin
				overflow <= 8'b00000001;
			end
		end // end of else
	end
endtask	

task bnot;
	input[7:0] input0;
	output reg[7:0] result;
	begin
		result <= ~input0;
	end
endtask

task band;
	input[7:0] input0, input1;
	output reg[7:0] result;
	begin
		result <= input0 & input1;
	end
endtask
			
task xOr;
	input[7:0] input0, input1;
	output reg[7:0] result;
	begin
		result <= input0 ^ input1;
	end
endtask
		
task lessThan;
	input[7:0] input0, input1;
	output notLessThanFlag;
	begin
		if (!(input0 < input1))
		begin
			notLessThanFlag <= 1;
		end
	end
endtask


task shiftLeft;
	input[7:0] input0, input1;				//input0 = input, input1 = immediate
	output reg[7:0] result, overflow;	//result = output, overflow = Carry Out
	output overflowFlag;
	parameter R=8;
	
	begin
	result <= input0 << input1;			//logical shift left input0 by input1, stored into result
	overflow <= input0 >> (R-input1);	//logical shift right input0 by (8-input1) to get overflow bits
	overflowFlag <= 1;
	end
endtask
	
task shiftRight;
	input[7:0] input0, input1;				//input0 = input, input1 = immediate
	output reg[7:0] result, overflow;	//result = output, overflow = overflow
	output overflowFlag;
	parameter R=8;
	
	begin
	result <= input0 >> input1;			//logical shift right input0 by input1, stored into overflow
	overflow <= input0 << (R-input1);	//logical shift left input0 by (8-input1) to get overflow bits
	overflowFlag <= 1;
	end
endtask

task loadUpperImmediate;
	input[7:0] input0;	
	output reg[7:0] result;
	begin
		result <= input0 << 4;
	end
endtask
	
endmodule
	