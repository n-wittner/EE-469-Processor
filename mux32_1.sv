module mux32_1 (sel, in, out);

	input logic [4:0] sel;
	input logic [31:0] in;
	output logic out;
	
	logic a1, a0;
	
	mux16_1 m0 (.sel(sel[3:0]), .in(in[15:0]), .out(a0));
	mux16_1 m1 (.sel(sel[3:0]), .in(in[31:16]), .out(a1));
	
	mux2_1 m_msb (.sel(sel[4]), .in({a1, a0}), .out);

endmodule

module mux32_1_testbench ();

	logic [4:0] sel;
	logic [31:0] in;
	logic out;
	
	mux32_1 dut (.*);
	
	integer i;
	
	initial begin
		for(i=0; i<2048; i++) begin
			{sel, in[7:0]} = i; #10;
		end
	end

endmodule
