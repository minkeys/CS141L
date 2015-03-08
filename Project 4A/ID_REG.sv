module ID_REG(

input clk,
input [3:0] opcode,
input [7:0] value,
input [3:0] rs,
input [3:0] rt,
input [3:0] rd,
input labelFlag,
input immediateFlag,
input signFlag,
input [7:0] labelValue,
input writemem,
input readmem,
input regwrite,

output [3:0] opcodeOut,
output [7:0] valueOut,
output [3:0] rsOut,
output [3:0] rtOut,
output [3:0] rdOut,
output labelFlagOut,
output immediateFlagOut,
output signFlagOut,
output [7:0] labelValueOut,
output writememOut,
output readmemOut,
output regwriteOut

);

always @ (posedge clk)
begin

opcodeOut = opcode;
valueOut = value;
rsOut = rs;
rtOut = rt;
rdOut = rd;
labelFlagOut = labelFlag;
immediateFlagOut = immediateFlag;
signFlagOut = signFlag;
labelValueOut = labelValue;
writememOut = writemem;
readmemOut = readmem;
regwriteOut = regwrite;

end


endmodule