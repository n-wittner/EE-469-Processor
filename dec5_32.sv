module dec5_32 (en, in, out);

	input logic en;
	input logic [4:0] in;
	output logic [31:0] out;
	
	logic d0en, d16en, inv4;
	
	not (inv4, in[4]);
	and (d0en, en, in[4]);
	and (d16en, en, inv4);
	
	
	dec4_16 d0_15 (.en(d0en), .in(in[3:0]), .out(out[31:16]));
	dec4_16 d16_31 (.en(d16en), .in(in[3:0]), .out(out[15:0]));

endmodule

module dec5_32_testbench ();
	logic en;
	logic [4:0] in;
	logic [31:0] out;
	
	dec5_32 dut (.*);
	
	integer i;
	
	initial begin
		en = 0;
		for(i=0; i<32; i++) begin
			in = i; #10;
		end
		en = 1;
		for(i=0; i<32; i++) begin
			in = i; #10;
		end
	end


endmodule
