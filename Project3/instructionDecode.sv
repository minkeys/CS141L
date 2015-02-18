module instructionDecode(
input[7:0] program_counter,
input[7:0] instruction,
input inputPCResetFlag,
input labelPassFlag,

output[3:0] opcode,
output[7:0] value,
output[3:0] rs,
output[3:0] rt,
output[3:0] rd,
output branchFlag,
output labelFlag,
output immediateFlag,
output signFlag,
output[7:0] labelValue,
output haltFlag,
output outputPCResetFlag,
output labelPassFlagOut
);

//always @ (posedge program_counter)
always @ (program_counter)
begin

	labelFlag <= 0;
	branchFlag <= 0;
	immediateFlag <= 0;
	signFlag <= 0;
	haltFlag <= 0;
	outputPCResetFlag <= 0;
	labelPassFlagOut <= 0;
	
	opcode <= instruction >> 4;				
	value <= instruction && 8'b00001111;
	
	if (!labelPassFlag)
	begin
	case (opcode)
		4'b0111:
		begin
			// do nothing
		end
		4'b1110: 
		begin
			labelPassFlagOut <= 1;
			outputPCResetFlag <= 1;
			opcode <= 8;
			value <= 6;
		end
		default:
		begin
			opcode <= 6;
			value <= 3;
		end	
	endcase
	end
	
	
	case (opcode)
		4'b0000: cpt(value, rs, rd);
		4'b0001: cpf(value, rs, rd);
		4'b0010: add(value, rs, rt, rd, signFlag);
		4'b0011: bnot(value, rs, rd);
		4'b0100: band(value, rs, rt, rd);
		4'b0101: ldr(value, rs, rd);
		4'b0110: str(value, rs, rd);
		4'b0111: stl(value, program_counter, rd, labelValue, labelFlag);
		4'b1000: xOr(value, rs, rt, rd);
		4'b1001: blt(value, rs, rt, rd, branchFlag);
		4'b1010: shl(value, rs, rt, rd, immediateFlag);
		4'b1011: shr(value, rs, rt, rd, immediateFlag);
		4'b1100: adi(value, rs, rt, rd, immediateFlag); // addvalue
		4'b1101: lui(value, rs, rt, rd, immediateFlag);
		4'b1110: hlt();
		4'b1111: tbd();
		//default:
	endcase
		
end

task cpt;
input [3:0] value;
output[3:0] rs, rd;

begin
	rs <= 4'b0000;
	rd <= value;
end
endtask

task cpf;
input [3:0] value;
output[3:0] rs, rd;

begin
	rs <= value;
	rd <= 4'b0000;
end
endtask

task add;
input [3:0] value;
output[3:0] rs, rt, rd;
output signFlag;
begin
	rs <= 4'b0000;
	rt <= 4'b0001;
	signFlag <= value[3];
	rd <= value;
end
endtask

task bnot;
input [3:0] value;
output[3:0] rs, rd;

begin
	rs <= value;
	rd <= 4'b0000;
end
endtask

task band;
input [3:0] value;
output[3:0] rs, rt, rd;

begin
	rs <= 4'b0000;
	rt <= 4'b0001;
	rd <= value;
end
endtask


task ldr;
input [3:0] value;
output[3:0] rs, rd;

begin
// s0 is offset to load from
	rs <= 4'b0000;
	rd <= value;
end
endtask

task str;
input [3:0] value;
output[3:0] rs, rd;

begin
// s0 is offset to store to
	rs <= value;
	rd <= 4'b0000;
end
endtask

task stl;

input [3:0] value;
input [7:0]program_counter;
output[3:0] rd;
output [7:0] labelValue;
output labelFlag;

begin
	labelValue <= program_counter;
	rd <= value;
	labelFlag <= 1;
end

endtask


task xOr;

input [3:0] value;
output[3:0] rs, rt, rd;

begin
	rs <= 4'b0000;
	rt <= 4'b0001;
	rd <= value;
end

endtask


task blt;

input [3:0] value;
output[3:0] rs, rt, rd;
output branchFlag;

begin
	rs <= 4'b0000;
	rt <= 4'b0001;
	rd <= value;
	branchFlag <= 1;
end

endtask


task shl;

input [3:0] value;
output[3:0] rs, rt, rd;
output immediateFlag;

begin
	rs <= 4'b0000;
	rt <= value;
	rd <= 4'b0000;
	immediateFlag <= 1;
end

endtask


task shr;

input [3:0] value;
output[3:0] rs, rt, rd;
output immediateFlag;

begin
	rs <= 4'b0000;
	rt <= value;
	rd <= 4'b0000;
	immediateFlag <= 1;
end

endtask


task adi;

input [3:0] value;
output[3:0] rs, rt, rd;
output immediateFlag;

begin
	rs <= 4'b0000;
	rt <= value;
	rd <= 4'b0000;
	immediateFlag <= 1;
end

endtask


task lui;

input [3:0] value;
output[3:0] rs, rt, rd;
output immediateFlag;

begin
	rs <= 4'b0000;
	rt <= value;
	rd <= 4'b0000;
	immediateFlag <= 1;
end

endtask

task hlt;
	
	haltFlag <= 1;
	
	
endtask

task tbd;

endtask


endmodule
