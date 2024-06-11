/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: ����alu�O�n��+�٬O-�άO��L���O
		2. Funct: �p�G�O��L���O�h�γo��6�X�P�_
	Output Port
		1. ALUOperation: �̫�ѽX���������O
*/

module alu_ctl( clk, ALUOp, Funct, SignaltoALU, SignaltoSHT,  SignaltoMut, SignaltoMUX );
    input clk;
    input [1:0] ALUOp;
    input [5:0] Funct;
    reg   [5:0] ALUOperation;
    reg [6:0] counter ;
    output [5:0] SignaltoALU ;
    output [5:0] SignaltoSHT ;
    output [5:0] SignaltoMUX ;
    output [5:0] SignaltoMut ;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_andi = 6'd12;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
	parameter F_multu =  6'd25;
	parameter F_mfhi =  6'd16;
	parameter F_mflo =  6'd18;



always@( posedge clk )


	begin
	  if ( Funct == F_multu )
	  begin
		counter = 0 ;
	  end
	/*
	�p�G�T�����ܦ����k �N��counter�k0
*/
end

	always@( posedge clk )
	begin
	  ALUOperation =  Funct;
	  if ( Funct == F_multu )
	  begin
		counter = counter + 1 ;
		if ( counter == 32 )
		begin
		  ALUOperation = 6'b111111 ; // Open HiLo reg for MUL
		  counter = 0 ;
		end
      end else begin
        case (ALUOp)
            2'b00: ALUOperation = F_add;
            2'b01: ALUOperation = F_sub;
			2'b10: ALUOperation = Funct;
			default ALUOperation = 6'bxxxxxx;
        endcase
      end
	/*
	��32��clk�M��}��HiLo�Ȧs�������k����ȶi�h
	*/
	end

	assign SignaltoALU = ALUOperation ;
	assign SignaltoSHT = ALUOperation ;
	assign SignaltoMut = ALUOperation ;
	assign SignaltoMUX = ALUOperation ;

endmodule

