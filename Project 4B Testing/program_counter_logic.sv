module program_counter_logic(
input clk /* synthesis keep */,
input[7:0] inputPC /* synthesis keep */,
input start /* synthesis keep */,
input[7:0] startAddress /* synthesis keep */,
input branch /* synthesis keep */,
input[7:0] target /* synthesis keep */,
input taken /* synthesis keep */,
input reset /* synthesis keep */,

output reg [7:0] outputPC /* synthesis keep */
// output reg [15:0] cycleCounter
);

reg [7:0] newOutputPC = 0 /* synthesis keep */;

reg [15:0] cycleCounter = 0 /* synthesis keep */;
reg [15:0] newCycleCounter = 0 /* synthesis keep */;

always_comb

begin

newCycleCounter = cycleCounter + 1;
newOutputPC = 11;


if (start)
begin
	newCycleCounter = 0;
end

if (start || reset)
begin
	newOutputPC = startAddress;
end
	
else if (branch)
begin
	if (taken)
	begin
		newOutputPC = target;
	end
	else
	begin
		newOutputPC = inputPC + 1;
	end
end
	
else
begin
	newOutputPC = inputPC + 1;
end

end

always_ff @ (posedge clk)

begin
	cycleCounter <= newCycleCounter;
	outputPC <= newOutputPC;
end


endmodule
