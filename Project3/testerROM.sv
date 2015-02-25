// Quartus II Verilog Template
// Single port rom with single read/write address aNd initial contents 
// specified with an initial block

module testerROM
#(parameter ADDR_WIDTH=8)
(
	input [7:0] pc,
	input clk,
	output [7:0] q
);

	// Declare the rom variable
	reg [7:0] rom[2**ADDR_WIDTH-1:0];

	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;
	
	//pste parameters here
	parameter 
		cpt = 8'b00000000,
		cpf = 8'b00010000,
		add = 8'b00100000,
		nOt = 8'b00110000,
		aNd = 8'b01000000,
		ldr = 8'b01010000,
		str = 8'b01100000,
		stl = 8'b01110000,
		xOr = 8'b10000000,
		blt = 8'b1001000,
		shl = 8'b10100000,
		shr = 8'b10110000,
		adi = 8'b11000000,
		lui = 8'b110110000,
		hlt = 8'b11100000,
		tbd = 8'b11110000;

	parameter
		l0 = 4'b0000,
		l1 = 4'b0001,
		l2 = 4'b0010,
		l3 = 4'b0011,
		l4 = 4'b0100,
		l5 = 4'b0101,
		l6 = 4'b0110,
		l7 = 4'b0111,
		l8 = 4'b1000,
		l9 = 4'b1001,
		l10 = 4'b1010,
		l11 = 4'b1011,
		l12 = 4'b1100,
		l13 = 4'b1101,
		l14 = 4'b1110,
		l15 = 4'b1111;

	parameter
		s0 = 4'b0000,
		s1 = 4'b0001,
		t0 = 4'b0010,
		t1 = 4'b0011,
		t2 = 4'b0100,
		t3 = 4'b0101,
		t4 = 4'b0110,
		t5 = 4'b0111,
		t6 = 4'b1000,
		t7 = 4'b1001,
		t8 = 4'b1010,
		t9 = 4'b1011,
		t10 = 4'b1100,
		t12 = 4'b1101,
		t13 = 4'b1110,
		o0 = 4'b1111;

		parameter
		c0 = 4'b0000;
	
	

	initial 
	begin		

	
	// post code here


rom[0] = 8'b11010000;    
rom[1] = 8'b00000001;    
rom[2] = 8'b11010001;    
rom[3] = 8'b11001111;    
rom[4] = 8'b00000010;    
rom[5] = 8'b01010110;    
rom[6] = 8'b00000011;    
rom[7] = 8'b01110000;    
rom[8] = 8'b00010010;    
rom[9] = 8'b11000001;    
rom[10] = 8'b00000010;   
rom[11] = 8'b11010000;    
rom[12] = 8'b00000100;    
rom[13] = 8'b01110001;    
rom[14] = 8'b00000010;    
rom[15] = 8'b11010101;    
rom[16] = 8'b01010110;    
rom[17] = 8'b11010000;    
rom[18] = 8'b11000100;    
rom[19] = 8'b00000001;    
rom[20] = 8'b00010100;    
rom[21] = 8'b10011001;    
rom[22] = 8'b00010101;    
rom[23] = 8'b10100100;    
rom[24] = 8'b00000110;    
rom[25] = 8'b11010000;    
rom[26] = 8'b10011100;    
rom[27] = 8'b01111001;    
rom[28] = 8'b11010000;    
rom[29] = 8'b11000011;    
rom[20] = 8'b00000001;    
rom[31] = 8'b00010100;
rom[32] = 8'b10011010;    
rom[33] = 8'b00010101;    
rom[34] = 8'b10100011;    
rom[35] = 8'b00000110;	
rom[36] = 8'b11010000;    
rom[37] = 8'b10011100;    
rom[38] = 8'b01111010;    
rom[39] = 8'b11010000;    
rom[40] = 8'b11000010;    
rom[41] = 8'b00000001;    
rom[42] = 8'b00010100;    
rom[43] = 8'b10011011;    
rom[44] = 8'b00010101;    
rom[45] = 8'b10100010;    
rom[46] = 8'b00000110;    
rom[47] = 8'b11010000;    
rom[48] = 8'b10011100;    
rom[49] = 8'b01111011;    
rom[50] = 8'b11010000;    
rom[51] = 8'b11000001;    
rom[52] = 8'b00000001;
rom[53] = 8'b00010100;
rom[54] = 8'b10011100 ;   
rom[55] = 8'b00010101  ;  
rom[56] = 8'b10100001   ; 
rom[57] = 8'b00000110    ;
rom[58] = 8'b11010000    ;
rom[59] = 8'b01111100    ;
rom[60] = 8'b00010110    ;
rom[61] = 8'b10100100    ;
rom[62] = 8'b00011111    ;
rom[63] = 8'b00000001    ;
rom[64] = 8'b00010011    ;
rom[65] = 8'b10010010    ;
rom[66] = 8'b00000001    ;
rom[67] = 8'b00011111	;
	
rom[68] = 8'b10010010    ;
rom[69] = 8'b00010111   ; 
rom[70] = 8'b11000001  ;  
rom[71] = 8'b00000111 ;   
rom[72] = 8'b11010000    ;
rom[73] = 8'b00000100    ;
rom[74] = 8'b11010100    ;
rom[75] = 8'b00000001    ;
rom[76] = 8'b00010010    ;
rom[77] = 8'b10010000    ;
rom[78] = 8'b01110010    ;
rom[79] = 8'b00010011    ;
rom[80] = 8'b11000001    ;
rom[81] = 8'b00000011    ;
rom[82] = 8'b11010000    ;
rom[83] = 8'b11000101    ;
rom[84] = 8'b00000001    ;
rom[85] = 8'b00010011    ;
rom[86] = 8'b10010001    ;
rom[87] = 8'b11010100    ;
rom[88] = 8'b00000001    ;
rom[89] = 8'b00010010    ;
rom[90] = 8'b10010000    ;
rom[91] = 8'b11010000    ;
rom[92] = 8'b11000111    ;
rom[93] = 8'b01100111    ;
rom[94] = 8'b11100000	;



	
	
	
	
	
	
	/*
		rom[0] = 8'b11010000; // lui 0000
		rom[1] = 8'b11000011; // adi 0011
		rom[2] = 8'b00000001; // cpt $s1
		rom[3] = 8'b11010000; // lui 0000
		rom[4] = 8'b11000001; // adi 0001
		rom[5] = 8'b00100011; // add $t0
		rom[6] = 8'b11100000; // hlt 0000
	*/
	
	end 

	always @ (posedge clk)
	begin
			addr_reg <= pc;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = rom[addr_reg];

endmodule
