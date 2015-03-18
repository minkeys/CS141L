module M_WB(

input clk,
input [7:0] labelValue,
input labelflag,
input readmem,
input [7:0] result,
input [7:0] q,

output clkOut,
output [7:0] labelValueOut,
output labelflagOut,
output readmemOut,
output [7:0] resultOut,
output [7:0] qOut



);

always @ (posedge clk)
begin

clkOut = clk;
labelValueOut = labelValue;
labelflagOut = labelflag;
readmemOut = readmem;
resultOut = result;
qOut = q;

end


endmodule