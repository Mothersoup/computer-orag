/*
	Title: MIPS Single-Cycle Control Unit
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. opcode: ��J�����O�N���A�ڦ����͹���������T��
	Input Port
		1. RegDst: ����RFMUX
		2. ALUSrc: ����ALUMUX
		3. MemtoReg: ����WRMUX
		4. RegWrite: ����Ȧs���O�_�i�g�J
		5. MemRead:  ����O����O�_�iŪ�X
		6. MemWrite: ����O����O�_�i�g�J
		7. Branch: �PALU��X��zero�T����AND�B�ⱱ��PCMUX
		8. ALUOp: ��X��ALU Control
*/
module control_single( opcode, RegDst, ALUSrc, MemtoReg, RegWrite, 
					   MemRead, MemWrite, Branch, if_flush, ALUOp);
    input[5:0] opcode;
    output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, if_flush, equal;
    output[1:0] ALUOp;
    reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, if_flush;
    reg[1:0] ALUOp;

	parameter R_FORMAT = 6'd0;
	parameter LW = 6'd35;
	parameter SW = 6'd43;
	parameter BEQ = 6'd4;
	parameter J = 6'd2;
	parameter Jr = 6'd0;
	parameter NOP = 6'd63; // �ϥ�63�@?NOP��opcode

    always @( opcode ) begin
        case ( opcode )
          R_FORMAT : 
          begin
				RegDst = 1'b1, ALUSrc = 1'b0, MemtoReg = 1'b0, RegWrite = 1'b1, MemRead = 1'b0, 
				MemWrite = 1'b0; Branch = 1'b0, if_flush = 1'b0, ALUOp = 2'b10, equal =  1'b0;
          end
          LW :
          begin
				RegDst = 1'b0; ALUSrc = 1'b1, MemtoReg = 1'b1, RegWrite = 1'b1, MemRead = 1'b1, 
				MemWrite = 1'b0, Branch = 1'b0, if_flush = 1'b0, ALUOp = 2'b00, equal =  1'b0;
          end
          SW :
          begin
				RegDst = 1'bx, ALUSrc = 1'b1, MemtoReg = 1'bx, RegWrite = 1'b0, MemRead = 1'b0, 
				MemWrite = 1'b1, Branch = 1'b0, if_flush = 1'b0, ALUOp = 2'b00, equal =  1'b0;
          end
          BEQ :
          begin
				RegDst = 1'bx, ALUSrc = 1'b0, MemtoReg = 1'bx, RegWrite = 1'b0, MemRead = 1'b0,
				MemWrite = 1'b0, Branch = 1'b1, if_flush = 1'bx, ALUOp = 2'b01, equal =  1'b1;
          end
		  J :
		  begin
				RegDst = 1'bx, ALUSrc = 1'b0, MemtoReg = 1'bx, RegWrite = 1'b0, MemRead = 1'b0, 
				MemWrite = 1'b0, Branch = 1'b1, if_flush = 1'b1, ALUOp = 2'b01, equal =  1'b0;
		  end
		  Jr :
		  begin

		  end

		  NOP :
		  begin
		        RegDst = 1'b0, ALUSrc = 1'b0, MemtoReg = 1'b0,RegWrite = 1'b0, MemRead = 1'b0,
				MemWrite = 1'b0, Branch = 1'b0, if_flush = 1'b0, ALUOp = 2'b00;
		  end
			



          default
          begin
				$display("control_single unimplemented opcode %d", opcode);
				RegDst=1'bx; ALUSrc=1'bx, MemtoReg=1'bx, RegWrite=1'bx; MemRead=1'bx,
				MemWrite=1'bx, Branch=1'bx, if_flush = 1'bx; ALUOp = 2'bxx, equal =  1'bx;
          end
        endcase
    end
endmodule

