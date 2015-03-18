module M_WB(

input clk,
input [7:0] labelValue,
input labelflag,
input readmem,
input [7:0] result,
input [7:0] q,


output reg [7:0] labelValueOut /* synthesis keep */,
output reg labelflagOut,
output reg readmemOut,
output reg [7:0] resultOut,
output reg [7:0] qOut



);

// output clkOut,
reg clkOut;

always @ (posedge clk)
begin

clkOut <= clk;
labelValueOut <= labelValue;
labelflagOut <= labelflag;
readmemOut <= readmem;
resultOut <= result;
qOut <= q;

end


endmodule