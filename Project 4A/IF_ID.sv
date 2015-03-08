module IF_ID(

input clk,
input [7:0] pc,
input [7:0] instruction,
input inPcResetFlag,
input labelPassFlagIn,

output clkOut,
output [7:0] pcOut,
output [7:0] instructionOut,
output pcResetFlagOut,
output labelPassFlagOut

);

always @ (posedge clk)
begin

clkOut = clk;
pcOut = pc;
instructionOut = instruction;
pcResetFlagOut = inPcResetFlag;
labelPassFlagOut = labelPassFlagIn;

end


endmodule