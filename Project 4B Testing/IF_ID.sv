module IF_ID(

input clk,
input [7:0] pc,
input [7:0] instruction,
input inPcResetFlag,
input labelPassFlagIn,

//output clkOut,
output [7:0] pcOut,
output [7:0] instructionOut,
output pcResetFlagOut,
output labelPassFlagOut

);




//reg new_clkOut = 0;
/*
reg [7:0] new_pcOut = 0;
reg [7:0] new_instructionOut = 0;
reg new_pcResetFlagOut = 0;
reg new_labelPassFlagOut = 0;

always_comb
begin

//new_clkOut = clk;
new_pcOut = pc;
new_instructionOut = instruction;
new_pcResetFlagOut = inPcResetFlag;
new_labelPassFlagOut = labelPassFlagIn;

end

always @ (posedge clk)
begin

// clkOut <= new_clkOut;
pcOut <= new_pcOut;
instructionOut <= new_instructionOut;
pcResetFlagOut <= new_pcResetFlagOut;
labelPassFlagOut <= new_labelPassFlagOut;

end
*/


always @ (posedge clk)
begin

// clkOut <= new_clkOut;
pcOut <= pc;
instructionOut <= instruction;
pcResetFlagOut <= inPcResetFlag;
labelPassFlagOut <= labelPassFlagIn;

end

endmodule