module program_counter_logic(
input clk,
input[7:0] inputPC,
input start,
input[7:0] startAddress,
input branch,
input[7:0] target,
input taken,
output[7:0] outputPC
);

always @ (posedge clk)

begin

	if (start)
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

end


endmodule