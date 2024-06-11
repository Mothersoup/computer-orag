module id_ex(   clk, rst, RegWrite, MemtoReg, MemRead, MemWrite, RegDst, ALUOp, ALUSrc , RD1, RD2,SignExtImm , RegRs, RegRt1, RegRt2, RegRd, ALUOp_out, RD1_out, RD2_out,  SignExtImm_out, RegRs_out, RegRt1_out, RegRt2_out, RegRd_out, ALUSrc_out, RegDst_out, MemRead_out, MemWrite_out, MemtoReg_out, RegWrite_out  );
    input clk,rst;

	// signal  
    input  ALUSrc, RegDst, MemRead, MemWrite, MemtoReg, RegWrite;
	input [31:0] RD1,  RD2,  SignExtImm;
	input [4:0] RegRs, RegRt1, RegRt2, RegRd;
    input  [1:0] ALUOp;
	output reg [31:0] RD1_out, RD2_out,  SignExtImm_out;
	output reg [4:0] RegRs_out, RegRt1_out, RegRt2_out, RegRd_out;
	output reg ALUSrc_out, RegDst_out, MemRead_out, MemWrite_out, MemtoReg_out, RegWrite_out;
	output reg [1:0] ALUOp_out;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ALUOp_out <= 2'b0;
            ALUSrc_out <= 1'b0;
            RegDst_out <= 1'b0;
            MemRead_out <= 1'b0;
            MemWrite_out <= 1'b0;
            MemtoReg_out <= 1'b0;
            RegWrite_out <= 1'b0;
            RD1_out <= 32'b0;
            RD2_out <= 32'b0;
            SignExtImm_out <= 32'b0;
            RegRs_out <= 5'b0;
            RegRt1_out <= 5'b0;
            RegRt2_out <= 5'b0;
            RegRd_out <= 5'b0;
        end else begin
            ALUOp_out <= ALUOp;
            ALUSrc_out <= ALUSrc;
            RegDst_out <= RegDst;
            MemRead_out <= MemRead;
            MemWrite_out <= MemWrite;
            MemtoReg_out <= MemtoReg;
            RegWrite_out <= RegWrite;
            RD1_out <= RD1;
            RD2_out <= RD2;
            SignExtImm_out <= SignExtImm;
            RegRs_out <= RegRs;
            RegRt1_out <= RegRt1;
            RegRt2_out <= RegRt2;
            RegRd_out <= RegRd;
        end
    end
endmodule