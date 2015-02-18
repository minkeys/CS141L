module regfile32x8 //32 8-bit registers

/*
  (input clock,
   input write,
   input [2:0] wrAddr,
   input [15:0] wrData,
   input [2:0] rdAddrA,
   output [15:0] rdDataA,
   input [2:0] rdAddrB,
   output [15:0] rdDataB);
*/
	(	input clock,				//clock bit flag
		input regwriteFlag,		//write bit flag
		input labelFlag,			//label flag
		input overflowFlag,		//overflowFlag
		input [3:0] rs,			//first source
		input [3:0] rt,			//second source
		input [3:0] rd,			//destination
		input [7:0] dataIn, 		//to write
		input [7:0] overflowIn,	//overflow
		output [7:0] branchAddress, // send to target of pc logic
		output [7:0] regA,		//regA
		output [7:0] regB); 		//regB
		
		
		/*
   reg [7:0] s0, s1, 			//dedicated to destination registers and second source of add 
	t0, t1, t2, t3, t4, t5, 	//temp registers
	t6, t7, t8, t9, t10, t11, 	//temp registers
	o0, 								//overflow registers
	c0									//carry out condition bit
*/
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

	
	
			 
/*
   assign rdDataA = rdAddrA == 0 ? reg0 :
		    rdAddrA == 1 ? reg1 :
		    rdAddrA == 2 ? reg2 :
		    rdAddrA == 3 ? reg3 : 0;
   assign rdDataB = rdAddrB == 0 ? reg0 :
		    rdAddrB == 1 ? reg1 :
		    rdAddrB == 2 ? reg2 :
		    rdAddrB == 3 ? reg3 : 0;

   always @(posedge clk) begin
      if (write) 
	case (wrAddr) 
	  0: begin
	     reg0 <= wrData;
	  end
	  1: begin
	     reg1 <= wrData;
	  end
	  2: begin
	     reg2 <= wrData;
	  end
	  3: begin
	     reg3 <= wrData;
	  end
	endcase // case (wrAddr)
   end // always @ (posedge clk)*/
endmodule