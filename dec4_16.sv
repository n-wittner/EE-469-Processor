module dec4_16 (en, in, out);

	input logic en;
	input logic [3:0] in;
	output logic [15:0] out;
	
	logic control_en;
	logic [3:0] dec_en;
	
	dec2_4 control (.en, .in(in[3:2]), .out(dec_en));
	
	genvar i;
	generate
		for (i = 0; i < 4; i++) begin : eachDec
			dec2_4 dec (.en(dec_en[i]), .in(in[1:0]), .out(out[(4*i + 3):4*i]));
		end
	endgenerate
	

endmodule

module dec4_16_testbench ();
	logic en;
	logic [3:0] in;
	logic [15:0] out;
	
	dec4_16 dut (.*);
	
	integer i;

	initial begin
		en = 0;
		for(i=0; i<16; i++) begin
			in = i; #10;
		end
		en = 1;
		for(i=0; i<16; i++) begin
			in = i; #10;
		end
	end

endmodule
