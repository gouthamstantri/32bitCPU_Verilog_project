module dmem(input  clk, we,
			input  [31:0] a, wd,
			output reg [31:0] rd);
  
  reg [31:0] RAM[63:0]; //2^ 32can be given instead of 64 but for simplification we are designed for 64 locations
assign rd = RAM[a[31:2]]; // word aligned
  
always@(posedge clk)
	if (we) RAM[a[31:2]] <= wd;
endmodule
//original ram