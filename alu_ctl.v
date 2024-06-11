/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
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
	如果訊號改變成除法 就把counter歸0
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
	數32個clk然後開啟HiLo暫存器給除法器放值進去
	*/
	end

	assign SignaltoALU = ALUOperation ;
	assign SignaltoSHT = ALUOperation ;
	assign SignaltoMut = ALUOperation ;
	assign SignaltoMUX = ALUOperation ;

endmodule

