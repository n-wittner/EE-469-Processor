module mux16_1 (sel, in, out);

	input logic [3:0] sel;
	input logic [15:0] in;
	output logic out;
	
	logic a1, a0;
	
	mux8_1 m0 (.sel(sel[2:0]), .in(in[7:0]), .out(a0));
	mux8_1 m1 (.sel(sel[2:0]), .in(in[15:8]), .out(a1));
	
	mux2_1 m_msb (.sel(sel[3]), .in({a1, a0}), .out);

endmodule
