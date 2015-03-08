module ALU_M(

input clk,
input [7:0] labelValue,
input labelFlag,
input writeMemFlag,
input readMemFlag,
input [7:0] ALUResult,
input [7:0] regA,
input [7:0] regB,

output clkOut,
output [7:0] labelValueOut,
output labelFlagOut,
output writeMemFlagOut,
output readMemFlagOut,
output [7:0] ALUResultOut,
output [7:0] regAOut,
output [7:0] regBOut
);


always @ (posedge clk)
begin

clkOut = clk;
labelValueOut = labelValue;
labelFlagOut = labelFlag;
writeMemFlagOut = writeMemFlag;
readMemFlagOut = readMemFlag;
ALUResultOut = ALUResult;
regAOut = regA;
regBOut = regB;

end


endmodule