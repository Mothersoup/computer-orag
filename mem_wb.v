module mem_wb( clk, reset, RegWrite_in, MemtoReg_in, ReadData_in, ALUResult_in, WriteReg_in, RegWrite_out, MemtoReg_out, ReadData_out, ALUResult_out,  WriteReg_out ); 
    input clk;         // Clock signal
    input reset;       // Reset signal
    input RegWrite_in; // Control signal: Write to register
    input MemtoReg_in; // Control signal: Memory to register
    input [31:0] ReadData_in; // Data read from memory
    input [31:0] ALUResult_in; // ALU result
    input [4:0] WriteReg_in; // Destination register address

    output reg RegWrite_out;  // Control signal: Write to register
    output reg MemtoReg_out;  // Control signal: Memory to register
    output reg [31:0] ReadData_out; // Data read from memory
    output reg [31:0] ALUResult_out; // ALU result
    output reg [4:0] WriteReg_out;    // Destination register address


always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset all outputs
        RegWrite_out <= 0;
        MemtoReg_out <= 0;
        ReadData_out <= 0;
        ALUResult_out <= 0;
        WriteReg_out <= 0;
    end else begin
        // Pass values from inputs to outputs
        RegWrite_out <= RegWrite_in;
        MemtoReg_out <= MemtoReg_in;
        ReadData_out <= ReadData_in;
        ALUResult_out <= ALUResult_in;
        WriteReg_out <= WriteReg_in;
    end
end






endmodule
