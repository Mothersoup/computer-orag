module ALU_bitSlice( A, B, Cin, Cout, sel, out);

input A, B, Cin;
input [2:0] sel;
output out;
output Cout;
wire  andOut ;
wire  orOut;
wire slt;				// if slt
wire faOut;
wire faCout;
wire subOut;			// if sub 
wire subBorrow;			// if sub 

 

	and(andOut, A, B);
	or(orOut , A, B);


assign out = (sel == 3'b000 )? andOut : 
		 (sel == 3'b001 )? orOut :
		 (sel == 3'b010 )? faOut : 
		 (sel == 3'b011) ? subOut :
		 (sel == 3'b100) ? ( (A < B) ? 1'b1 : 1'b0) :
             1'b0;
		 
		 
assign Cout = (sel == 3'b010) ? faCout : // Carry out for addition
         (sel == 3'b011) ? subBorrow :  // Borrow out for subtraction
		 1'b0;

	FA fa( .in0(A), .in1(B), .cin( Cin ), .out(faOut), .cout(  faCout ) );
	FA subtractor( .in0(A), .in1(B), .cin(Cin), .out(subOut), .cout(subBorrow) );

endmodule 