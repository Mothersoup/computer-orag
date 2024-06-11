module ex_mem( clk, reset, RegWrite_in, MemtoRead_in, MemRead_in, MemWrite_in, ALUResult_in, WriteData_in, WriteReg_in,  RegWrite_out, MemtoRead_out, MemRead_out, MemWrite_out, ALUResult_out, WriteData_out, WriteReg_out   );
    input clk;  // clock signal
    input reset; // reset signal
    input RegWrite_in; 
    input MemtoRead_in; 
    input MemRead_in;
    input MemWrite_in;
    input [31:0] ALUResult_in;
    input [31:0] WriteData_in; // Data to be written to memory
    input [4:0] WriteReg_in; // Destination register address


    output reg RegWrite_out; 
    output reg MemtoRead_out; 
    output reg MemRead_out;
    output reg MemWrite_out;
    output reg [31:0] ALUResult_out;
    output reg [31:0] WriteData_out; // Data to be written to memory
    output reg [4:0] WriteReg_out; // Destination register address


always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset all outputs
        RegWrite_out <= 0;
        MemtoRead_out <= 0;
        MemRead_out <= 0;
        MemWrite_out <= 0;
        ALUResult_out <= 0;
        WriteData_out <= 0;
        WriteReg_out <= 0;
    end else begin
        // Pass values from inputs to outputs
        RegWrite_out <= RegWrite_in;
        MemtoRead_out <= MemtoRead_in;
        MemRead_out <= MemRead_in;
        MemWrite_out <= MemWrite_in;
        ALUResult_out <= ALUResult_in;
        WriteData_out <= WriteData_in;
        WriteReg_out <= WriteReg_in;
    end
end

endmodule 