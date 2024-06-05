module FA(in0, in1, cin, out, cout);
	input in0, in1, cin;
	output out, cout;
	// temp 1, 2 , 3
	wire e1, e2, e3;
	
	xor gateXor(e1, in0, in1);
	and gateAnd(e2, in0, in1);
	and gateAnd1(e3, e1, cin );
	or gateOR( cout, e2, e3 );
	xor gateXor1( out, e1, cin);
endmodule
