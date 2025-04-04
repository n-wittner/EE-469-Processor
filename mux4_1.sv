module mux4_1 (sel, in, out);

	input logic [1:0] sel;
	input logic [3:0] in;
	output logic out;
	
	logic a1, a0;
	
	mux2_1 m0 (.sel(sel[0]), .in(in[1:0]), .out(a0));
	mux2_1 m1 (.sel(sel[0]), .in(in[3:2]), .out(a1));
	mux2_1 m_msb (.sel(sel[1]), .in({a1, a0}), .out);

endmodule

module mux4_1_testbench ();

	logic [1:0] sel;
	logic [3:0] in;
	logic out;
	
	mux4_1 dut (.*);
	
	integer i;
	
	initial begin
		for(i=0; i<64; i++) begin
			{sel, in} = i; #10;
		end
	end

endmodule
