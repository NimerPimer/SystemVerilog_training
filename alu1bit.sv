module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);
	
	logic orout, xorout, fas_s, n_op0, n_orout;
	
	//FAS operation
	NOT not_op(.Z(n_op0), .A(op[0]));
	fas alu_fas(.s(fas_s), .cout(cout),
				.a(a), .b(b), .cin(cin), .a_ns(n_op0));
	
	//NOR operation
	OR2 alu_or(.Z(orout), .A(a), .B(b));
	NOT not_or(.Z(n_orout), .A(orout));
	
	//XOR operation
	XOR2 alu_xor(.Z(xorout), .A(a), .B(b));
	
	//MUX4>1
	mux4 alu_mux(.z(s), .d0(n_orout), .d1(xorout), .d2(fas_s),
				 .d3(fas_s), .sel(op));
		
	
endmodule
