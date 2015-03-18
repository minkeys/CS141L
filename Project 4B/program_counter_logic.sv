module program_counter_logic(
input clk,
input[7:0] inputPC,
input start,
input[7:0] startAddress,
input branch,
input[7:0] target,
input taken,
input reset,
input stall_flag,

output[7:0] outputPC,
output reg [15:0] cycleCounter, instruction_count
);


reg[1:0] stall_counter = 0;
//reg [15:0] instruction_count = 0;

always @ (posedge clk)

begin

if(stall_flag)
begin
	stall_counter = 3;
end

if (stall_counter <= 0)
begin

	

	if (start)
	begin
		instruction_count <= 0;
		cycleCounter <= 0;
	end

	if (start || reset)
	begin
		outputPC <= startAddress;
	end
	
	else if(branch)
	begin
		if (taken)
		begin
			outputPC <= target;
		end
	end
	
	else begin
		outputPC <= inputPC + 1;
	end
	
	instruction_count <= instruction_count + 1;
	
end

else
begin
	stall_counter <= stall_counter - 1;
end

	cycleCounter <= cycleCounter + 1;
	
end


endmodule
