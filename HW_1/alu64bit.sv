// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);
	logic cout0[63:0];
	logic cout1[64:0];
	assign cout1 = {cout0[63:0], cin};
	
	genvar i;
	generate
		for (i = 0 ; i < 64; i++)
		begin
		alu1bit alu1_inst(.s(s[i]), .cout(cout0[i]), .a(a[i]), .b(b[i]),
						  .cin(cout1[i]), .op(op));	
		end
	endgenerate
		
endmodule
