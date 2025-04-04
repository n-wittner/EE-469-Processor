module mux8_1 (sel, in, out);

	input logic [2:0] sel;
	input logic [7:0] in;
	output logic out;
	
	logic a1, a0;
	
	mux4_1 m0 (.sel(sel[1:0]), .in(in[3:0]), .out(a0));
	mux4_1 m1 (.sel(sel[1:0]), .in(in[7:4]), .out(a1));
	
	mux2_1 m_msb (.sel(sel[2]), .in({a1, a0}), .out);

endmodule

module mux8_1_testbench ();

	logic [2:0] sel;
	logic [7:0] in;
	logic out;
	
	mux8_1 dut (.*);
	
	integer i;
	
	initial begin
		for(i=0; i<2048; i++) begin
			{sel, in} = i; #10;
		end
	end

endmodule
