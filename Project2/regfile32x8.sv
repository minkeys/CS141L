module regfile32x8 //32 8-bit registers
  (input clk,
   input write,
   input [2:0] wrAddr,
   input [15:0] wrData,
   input [2:0] rdAddrA,
   output [15:0] rdDataA,
   input [2:0] rdAddrB,
   output [15:0] rdDataB);

   reg [7:0] s0, s1, //dedicated to destination registers and second source of add 
	t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, //temp registers
	o0, //overflow registers
	c0; //carry out condition bit
			 
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