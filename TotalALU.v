`timescale 1ns/1ns
module TotalALU( clk, reset, ALUop, Signal, dataA, dataB, Output );
input reset ;
input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
input [1:0] ALUop;
output [31:0] Output ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SRL  : 2
//   SLT  : 42
//   DIVU : 27

wire [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter MUT= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;
/*
定義各種訊號
*/
//============================
wire [5:0]  SignaltoALU ;
wire [5:0]  SignaltoSHT ;
wire [5:0]  SignaltoMUT ;
wire [5:0]  SignaltoMUX ;
wire [31:0] ALUOut, HiOut, LoOut, ShifterOut ;
wire [31:0] dataOut ;
wire [63:0] MUTAns ;
/*
定義各種接線
*/
//============================
ALUControl ALUControl( .clk(clk), .ALUOp(ALUop), .Signal(Signal), .SignaltoALU(SignaltoALU), .SignaltoSHT(SignaltoSHT), .SignaltoMUT(SignaltoMUT), .SignaltoMUX(SignaltoMUX) );
ALU ALU( .dataA(dataA), .dataB(dataB), .Signal(SignaltoALU), .dataOut(ALUOut)  );
Multiplier multiplier(  .clk(clk), .dataA(dataA), .dataB(dataB), .reset(reset), .dataOut(MUTAns), .signal(SignaltoMUT) );
Shifter Shifter( .dataA(dataA), .dataB(dataB), .dataOut(ShifterOut)  );
HiLo HiLo( .clk(clk), .mutiAns(MUTAns), .HiOut(HiOut), .LoOut(LoOut), .reset(reset) );
ALUMUX ALUMUX( .ALUOut(ALUOut), .HiOut(HiOut), .LoOut(LoOut), .Shifter(ShifterOut), .Signal(SignaltoMUX), .dataOut(dataOut) );
assign Output = dataOut ;


endmodule