module dec2_4 (en, in, out);

	input logic en;
	input logic [1:0] in;
	output logic [3:0] out;
	
	logic inv1, inv0;
	not (inv1, in[1]);
	not (inv0, in[0]);
	
	and (out[0], inv1, inv0, en);
	and (out[1], inv1, in[0], en);
	and (out[2], in[1], inv0, en);
	and (out[3], in[1], in[0], en);

endmodule

module dec2_4_testbench ();
	logic en;
	logic [1:0] in;
	logic [3:0] out;
	
	dec2_4 dut (.*);
	
	integer i;
	
	initial begin
		en = 0;
		for(i=0; i<4; i++) begin
			in = i; #10;
		end
		en = 1;
		for(i=0; i<4; i++) begin
			in = i; #10;
		end
	end

endmodule
