
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

	logic n_b, n_cin, xor1out, xor2out, or1out, or2out, or3out, 
		  n_or1out, n_or2out, n_or3out;
	
	//s calculation
	XOR2 sxor1(.Z(xor1out), .A(a), .B(b));
	XOR2 sxor2(.Z(s), .A(xor1out), .B(cin));

	//cout calculation	
	NOT not_b(.Z(n_b), .A(b));
	NOT not_cin(.Z(n_cin), .A(cin));
	
	OR2 or1(.Z(or1out), .A(n_b), .B(n_cin));
	OR2 or2(.Z(or2out), .A(b), .B(cin));
	
	NOT not_or1(.Z(n_or1out), .A(or1out));
	NOT not_or2(.Z(n_or2out), .A(or2out));
	
	XOR2 xor1(.Z(xor2out), .A(a), .B(a_ns));
	OR2 or3(.Z(or3out), .A(n_or2out), .B(xor2out));
	NOT not_or3(.Z(n_or3out), .A(or3out));
	
	OR2 finalor(.Z(cout), .A(n_or1out), .B(n_or3out));
	
endmodule
