module regfile32x8 //32 8-bit registers

	(	input clock,				//clock bit flag
		input regwriteFlag,		//write bit flag
		input labelFlag,			//label flag
		input overflowFlag,		//overflowFlag
		input [3:0] rs,			//first source
		input [3:0] rt,			//second source
		input [3:0] rd,			//destination
		input [7:0] dataIn, 		//to write
		input [7:0] overflowIn,	//overflow
		output reg [7:0] branchAddress, // send to target of pc logic
		output reg [7:0] regA,		//regA
		output reg [7:0] regB); 		//regB

	reg [7:0] regfile [0:15];
	reg [7:0] labelfile [0:15];
	
	always @(posedge clock) begin
		regA <= regfile[rs];
		regB <= regfile[rt];
		if (!labelFlag) begin
			if (regwriteFlag) begin
				regfile[rd] <= dataIn;		
			end
		end
		else begin
			
			if (regwriteFlag) begin
				labelfile[rd] <= dataIn;
			end
			
			branchAddress <= labelfile[rd];
			
		end	
		
		if(overflowFlag) begin
			regfile[15] <= overflowIn;
		end 
		
	end //end of always

endmodule