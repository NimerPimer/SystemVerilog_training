module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

	logic n_sel, n_d0, n_d1, or1out, or2out, n_or1out, n_or2out;
		
	NOT not0(.Z(n_d0), .A(d0));
	NOT not1(.Z(n_d1), .A(d1));
	NOT notsel(.Z(n_sel), .A(sel));
	
	OR2 or1(.Z(or1out), .A(n_d0), .B(sel));
	OR2 or2(.Z(or2out), .A(n_d1), .B(n_sel));
	
	NOT notor1(.Z(n_or1out), .A(or1out));
	NOT notor2(.Z(n_or2out), .A(or2out));
	
	OR2 finalor(.Z(z), .A(n_or1out), .B(n_or2out));
	
endmodule
