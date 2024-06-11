module forwarding_unit ( ID_EX_rs,  ID_EX_rt, EX_MEM_rd, MEM_WB_rd, EX_MEM_RegWrite, MEM_WB_RegWrite, ForwardA, ForwardB );
    input [4:0] ID_EX_rs;       // Source register 1 in ID/EX stage
    input [4:0] ID_EX_rt;       // Source register 2 in ID/EX stage
    input [4:0] EX_MEM_rd;      // Destination register in EX/MEM stage
    input [4:0] MEM_WB_rd;      // Destination register in MEM/WB stage
    input EX_MEM_RegWrite;      // Register write signal from EX/MEM stage
    input MEM_WB_RegWrite;      // Register write signal from MEM/WB stage

    output reg [1:0] ForwardA;  // Forwarding control for first ALU operand
    output reg [1:0] ForwardB;  // Forwarding control for second ALU operand


always @( EX_MEM_RegWrite, EX_MEM_rd, ID_EX_rs, ID_EX_rt, MEM_WB_RegWrite, MEM_WB_rd ) begin
    // Default values: no forwarding
    ForwardA = 2'b00;
    ForwardB = 2'b00;

    // EX hazard
    if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rs)) begin
        ForwardA = 2'b10;
    end
    if (EX_MEM_RegWrite && (EX_MEM_rd != 0) && (EX_MEM_rd == ID_EX_rt)) begin
        ForwardB = 2'b10;
    end

    // MEM hazard
    if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rs)) begin
        ForwardA = 2'b01;
    end
    if (MEM_WB_RegWrite && (MEM_WB_rd != 0) && (MEM_WB_rd == ID_EX_rt)) begin
        ForwardB = 2'b01;
    end
end

endmodule