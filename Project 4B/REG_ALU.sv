module REG_ALU(

input clk,
input [3:0] opcode,
input [7:0] value,
input [7:0] labelValue,
input labelFlag,
input writeMemFlag,
input readMemFlag,
input [7:0] regA,
input immediateFlag,
input signFlag,
input [7:0] regB,

//output clkOut,
output [3:0] opcodeOut,
output [7:0] valueOut,
output [7:0] labelValueOut,
output labelFlagOut,
output writeMemFlagOut,
output readMemFlagOut,
output [7:0] regAOut,
output immediateFlagOut,
output signFlagOut,
output [7:0] regBOut
);


always @ (posedge clk)
begin

//clkOut = clk;
opcodeOut <= opcode;
valueOut <= value;
labelValueOut <= labelValue;
labelFlagOut <= labelFlag;
writeMemFlagOut <= writeMemFlag;
readMemFlagOut <= readMemFlag;
regAOut <= regA;
immediateFlagOut <= immediateFlag;
signFlagOut <= signFlag;
regBOut <= regB;

end


endmodule