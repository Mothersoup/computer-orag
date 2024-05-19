module mux( s, i0, i1, o );

input s, i0, i1;
output o;

assign o = s ? i0: i1;

endmodule
