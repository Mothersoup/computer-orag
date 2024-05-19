`timescale 1ns/1ns
module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMUT, SignaltoMUX );
input clk ;
input [5:0] Signal ;
output [5:0] SignaltoALU ;
output [5:0] SignaltoSHT ;
output [5:0] SignaltoDIV ;
output [5:0] SignaltoMUT ;

// ALU go ALU
parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;


always @( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMUT, SignaltoMUX )  begin
	// give default 
	SignaltoALU = 6'b000000;
    SignaltoSHT = 6'b000000;
    SignaltoDIV = 6'b000000;
    SignaltoMUT = 6'b000000;
	case( Signal )
		