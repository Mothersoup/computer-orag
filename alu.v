module ALU( dataA, dataB, dataOut, Signal );
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;


wire [31:0] temp ;
wire [31:0] pb;
wire [2:0] sel;
parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

			/// sel must be 3 bit  becasue there are five situtations
wire cout[31:0];				// if sub then this is brrow out if add this is carry out  
assign  sel = (Signal == AND ) ? 3'b000:
			  (Signal == OR ) ? 3'b001:
			  (Signal == ADD ) ? 3'b010:
			  (Signal == SUB ) ? 3'b011:
			  (Signal == SLT ) ? 3'b011:
			  3'b100;
assign pb =( Signal == SUB || SLT  ) ? ~ dataB + 1 : dataB ;
wire sltOut;
			  
ALU_bitSlice ALU0(  .A(dataA[0]), .B(pb[0]), .Cin( 1'b0 ), .Cout( cout[0] ), .sel(sel), .out( temp[0] ) );
ALU_bitSlice ALU1(  .A(dataA[1]), .B(pb[1]), .Cin( cout[0] ), .Cout( cout[1] ), .sel(sel), .out( temp[1] ) );
ALU_bitSlice ALU2(  .A(dataA[2]), .B(pb[2]), .Cin( cout[1] ), .Cout( cout[2] ), .sel(sel), .out( temp[2] ) );
ALU_bitSlice ALU3(  .A(dataA[3]), .B(pb[3]), .Cin( cout[2] ), .Cout( cout[3] ), .sel(sel), .out( temp[3] ) );
ALU_bitSlice ALU4(  .A(dataA[4]), .B(pb[4]), .Cin( cout[3] ), .Cout( cout[4] ), .sel(sel), .out( temp[4] ) );
ALU_bitSlice ALU5(  .A(dataA[5]), .B(pb[5]), .Cin( cout[4] ), .Cout( cout[5] ), .sel(sel), .out( temp[5] ) );
ALU_bitSlice ALU6(  .A(dataA[6]), .B(pb[6]), .Cin( cout[5] ), .Cout( cout[6] ), .sel(sel), .out( temp[6] ) );
ALU_bitSlice ALU7(  .A(dataA[7]), .B(pb[7]), .Cin( cout[6] ), .Cout( cout[7] ), .sel(sel), .out( temp[7] ) );
ALU_bitSlice ALU8(  .A(dataA[8]), .B(pb[8]), .Cin( cout[7] ), .Cout( cout[8] ), .sel(sel), .out( temp[8] ) );
ALU_bitSlice ALU9(  .A(dataA[9]), .B(pb[9]), .Cin( cout[8] ), .Cout( cout[9] ), .sel(sel), .out( temp[9] ) );
ALU_bitSlice ALU10(  .A(dataA[10]), .B(pb[10]), .Cin( cout[9] ), .Cout( cout[10] ), .sel(sel), .out( temp[10] ) );
ALU_bitSlice ALU11(  .A(dataA[11]), .B(pb[11]), .Cin( cout[10] ), .Cout( cout[11] ), .sel(sel), .out( temp[11] ) );
ALU_bitSlice ALU12(  .A(dataA[12]), .B(pb[12]), .Cin( cout[11] ), .Cout( cout[12] ), .sel(sel), .out( temp[12] ) );
ALU_bitSlice ALU13(  .A(dataA[13]), .B(pb[13]), .Cin( cout[12] ), .Cout( cout[13] ), .sel(sel), .out( temp[13] ) );
ALU_bitSlice ALU14(  .A(dataA[14]), .B(pb[14]), .Cin( cout[13] ), .Cout( cout[14] ), .sel(sel), .out( temp[14] ) );
ALU_bitSlice ALU15(  .A(dataA[15]), .B(pb[15]), .Cin( cout[14] ), .Cout( cout[15] ), .sel(sel), .out( temp[15] ) );
ALU_bitSlice ALU16(  .A(dataA[16]), .B(pb[16]), .Cin( cout[15] ), .Cout( cout[16] ), .sel(sel), .out( temp[16] ) );
ALU_bitSlice ALU17(  .A(dataA[17]), .B(pb[17]), .Cin( cout[16] ), .Cout( cout[17] ), .sel(sel), .out( temp[17] ) );
ALU_bitSlice ALU18(  .A(dataA[18]), .B(pb[18]), .Cin( cout[17] ), .Cout( cout[18] ), .sel(sel), .out( temp[18] ) );
ALU_bitSlice ALU19(  .A(dataA[19]), .B(pb[19]), .Cin( cout[18] ), .Cout( cout[19] ), .sel(sel), .out( temp[19] ) );
ALU_bitSlice ALU20(  .A(dataA[20]), .B(pb[20]), .Cin( cout[19] ), .Cout( cout[20] ), .sel(sel), .out( temp[20] ) );
ALU_bitSlice ALU21(  .A(dataA[21]), .B(pb[21]), .Cin( cout[20] ), .Cout( cout[21] ), .sel(sel), .out( temp[21] ) );
ALU_bitSlice ALU22(  .A(dataA[22]), .B(pb[22]), .Cin( cout[21] ), .Cout( cout[22] ), .sel(sel), .out( temp[22] ) );
ALU_bitSlice ALU23(  .A(dataA[23]), .B(pb[23]), .Cin( cout[22] ), .Cout( cout[23] ), .sel(sel), .out( temp[23] ) );
ALU_bitSlice ALU24(  .A(dataA[24]), .B(pb[24]), .Cin( cout[23] ), .Cout( cout[24] ), .sel(sel), .out( temp[24] ) );
ALU_bitSlice ALU25(  .A(dataA[25]), .B(pb[25]), .Cin( cout[24] ), .Cout( cout[25] ), .sel(sel), .out( temp[25] ) );
ALU_bitSlice ALU26(  .A(dataA[26]), .B(pb[26]), .Cin( cout[25] ), .Cout( cout[26] ), .sel(sel), .out( temp[26] ) );
ALU_bitSlice ALU27(  .A(dataA[27]), .B(pb[27]), .Cin( cout[26] ), .Cout( cout[27] ), .sel(sel), .out( temp[27] ) );
ALU_bitSlice ALU28(  .A(dataA[28]), .B(pb[28]), .Cin( cout[27] ), .Cout( cout[28] ), .sel(sel), .out( temp[28] ) );
ALU_bitSlice ALU29(  .A(dataA[29]), .B(pb[29]), .Cin( cout[28] ), .Cout( cout[29] ), .sel(sel), .out( temp[29] ) );
ALU_bitSlice ALU30(  .A(dataA[30]), .B(pb[30]), .Cin( cout[29] ), .Cout( cout[30] ), .sel(sel), .out( temp[30] ) );
ALU_bitSlice ALU31(  .A(dataA[31]), .B(pb[31]), .Cin( cout[30] ), .Cout( cout[31] ), .sel(sel), .out( temp[31] ) );
assign sltOut = ( temp[31] == 1 ) ? 1 : 0;
assign dataOut = (Signal == SLT) ? sltOut : temp;

endmodule