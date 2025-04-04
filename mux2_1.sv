module mux2_1 (sel, in, out);

	input logic sel;
	input logic [1:0] in;
	output logic out;
	
	logic a1, a0, s_inv;
	
	not (s_inv, sel);
	and (a0, s_inv, in[0][i]);
	and (a1, sel, in[1][i]);
	or (out, a1, a0);

endmodule
