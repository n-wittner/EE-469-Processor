module mux32_1_var #(parameter WIDTH=64) (sel, in, out);

	input logic [4:0] sel;
	input logic [WIDTH-1:0][31:0] in;
	output logic [WIDTH-1:0] out;
	
	genvar i;
	generate
		for (i = 0; i < WIDTH; i++) begin : eachMUX
			mux32_1 m (.sel, .in(in[i][31:0]), .out(out[i]));
		end
	endgenerate

endmodule

module mux32_1_var_testbench ();
	// 2 bit testbench
	logic [4:0] sel;
	logic [1:0][31:0] in;
	logic [1:0] out;
	
	mux32_1_var #(.WIDTH(2)) dut (.*);
	
	integer i;
	
	initial begin
		for(i=0; i<2048; i++) begin
			{sel, in[1][7:0]} = i;
			{sel, in[0][7:0]} = i;
			#10;
		end
	end

endmodule
