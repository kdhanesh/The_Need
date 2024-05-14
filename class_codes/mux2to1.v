module mux2to1(out, a, b, s);
	output out;
	input a, b, s;
	assign out = (s)? b: a;
endmodule
