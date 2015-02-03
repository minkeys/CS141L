module CS141L(
input[7:0] I, IM,	//I = input, IM = immediate
input clock,		//clock source
output reg[7:0] O, C	//O = output, C = Carry Out 
);

always @(posedge clock)
begin
end
	
task shiftLeft;
	input[7:0] I, IM;	//I = input, IM = immediate
	output reg[7:0] O, C;	//O = output, C = Carry Out
	parameter R=8;
	
	begin
	O = I << IM;		//logical shift left I by IM, stored into O
	C = I >> (R-IM);	//logical shift right I by (8-IM) to get overflow bits
	end
endtask
	
task shiftRight;
	input[7:0] I, IM;		//I = input, IM = immediate
	output reg[7:0] O, C;	//O = output, C = Carry Out
	parameter R=8;
	
	begin
	O = I >> IM;		//logical shift right I by IM, stored into O
	C = I << (R-IM);	//logical shift left I by (8-IM) to get overflow bits
	end
endtask
	
endmodule
	