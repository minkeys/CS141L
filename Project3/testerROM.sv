// Quartus II Verilog Template
// Single port rom with single read/write address and initial contents 
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

	initial 
	begin
		rom[0] = 8'b11010000; // lui 0000
		rom[1] = 8'b11000011; // adi 0011
		rom[2] = 8'b00000001; // cpt $s1
		rom[3] = 8'b11010000; // lui 0000
		rom[4] = 8'b11000001; // adi 0001
		rom[5] = 8'b00100011; // add $t0
		rom[6] = 8'b11100000; // hlt 0000
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
